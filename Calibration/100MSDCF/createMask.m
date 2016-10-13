function [obj] = createMask(RGB, band)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder App. The colorspace and
%  minimum/maximum values for each channel of the colorspace were set in the
%  App and result in a binary mask BW and a composite image maskedRGBImage,
%  which shows the original RGB image values under the mask BW.
warning off
% Auto-generated by colorThresholder app on 08-Oct-2016
%------------------------------------------------------
% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

switch band
    case 'red' 
        RGB = im2double(RGB);
        cform = makecform('srgb2lab', 'AdaptedWhitePoint', whitepoint('D65'));
        I = applycform(RGB,cform);
        % Define thresholds for channel 1 based on histogram settings
        channel1Min = 10.876;
        channel1Max = 64.798;
        % Define thresholds for channel 2 based on histogram settings
        channel2Min = 6.705;
        channel2Max = 45.596;
        % Define thresholds for channel 3 based on histogram settings
        channel3Min = -6.081;
        channel3Max = 27.703;
        BW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
             (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
             (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
        % Initialize output masked image based on input image.
        BW2 =  imdilate(BW,strel('square',20));
        BW2 = bwareaopen(BW2, 2000); % Parametro
        BW = BW & BW2;
        BW = bwareaopen(BW, 500); % Parametro
        BW = imdilate(BW,strel('square',10));
        BW = bwareaopen(BW, 2000); % Parametro
        BW = imerode(BW,strel('square',10));
        CC = bwconncomp(BW);
        for i=1:size(CC.PixelIdxList,2)
            BW_TMP = false(size(BW));
            BW_TMP(CC.PixelIdxList{i}) = 1;
            s = regionprops(BW_TMP,'BoundingBox');
            img = imcrop(BW_TMP,s.BoundingBox);
            white = sum(sum(img));
            black = size(img,1)*size(img,2);
            %figure, imshow(img);
            if(white<0.2*black)
               BW(CC.PixelIdxList{i}) = 0; 
            end
        end
        maskedRGBImage = RGB;
        % Set background pixels where BW is false to zero.
        maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
        R = maskedRGBImage(:,:,1);
        G = maskedRGBImage(:,:,2);
        B = maskedRGBImage(:,:,3);
        hold off
        R(BW) = 255;
        G(BW) = 0;
        B(BW) = 0;
        maskedRGBImage(:,:,1)=R;
        maskedRGBImage(:,:,2)=G;
        maskedRGBImage(:,:,3)=B;
        RGB = im2uint8(RGB);
    case 'green'
        I = rgb2hsv(RGB);
        % Define thresholds for channel 1 based on histogram settings
        channel1Min = 0.220;
        channel1Max = 0.463;
        % Define thresholds for channel 2 based on histogram settings
        channel2Min = 0.261;
        channel2Max = 1.000;
        % Define thresholds for channel 3 based on histogram settings
        channel3Min = 0.1;
        channel3Max = 1.000;
        % Create mask based on chosen histogram thresholds
        BW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
             (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
             (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
        % Initialize output masked image based on input image.
        BW2 =  imdilate(BW,strel('square',20));
        BW2 = bwareaopen(BW2, 2000); % Parametro
        BW = BW & BW2;
        BW = bwareaopen(BW, 500); % Parametro
        BW = imdilate(BW,strel('square',10));
        BW = bwareaopen(BW, 2000); % Parametro
        BW = imerode(BW,strel('square',10));
        CC = bwconncomp(BW);
        for i=1:size(CC.PixelIdxList,2)
            BW_TMP = false(size(BW));
            BW_TMP(CC.PixelIdxList{i}) = 1;
            s = regionprops(BW_TMP,'BoundingBox');
            img = imcrop(BW_TMP,s.BoundingBox);
            white = sum(sum(img));
            black = size(img,1)*size(img,2);
            %figure, imshow(img);
            if(white<0.2*black)
               BW(CC.PixelIdxList{i}) = 0; 
            end
        end
        maskedRGBImage = RGB;
        % Set background pixels where BW is false to zero.
        maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
        R = maskedRGBImage(:,:,1);
        G = maskedRGBImage(:,:,2);
        B = maskedRGBImage(:,:,3);
        R(BW) = 0;
        G(BW) = 255;
        B(BW) = 0;
        maskedRGBImage(:,:,1)=R;
        maskedRGBImage(:,:,2)=G;
        maskedRGBImage(:,:,3)=B;
    case 'blue'
        RGB = im2double(RGB);
        cform = makecform('srgb2lab', 'AdaptedWhitePoint', whitepoint('D65'));
        I = applycform(RGB,cform);
        % Define thresholds for channel 1 based on histogram settings
        channel1Min = 11.733;
        channel1Max = 58.346;
        % Define thresholds for channel 2 based on histogram settings
        channel2Min = -9.896;
        channel2Max = 5.252;
        % Define thresholds for channel 3 based on histogram settings
        channel3Min = -31.904;
        channel3Max = -10.479;
        % Create mask based on chosen histogram thresholds
        BW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
            (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
            (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
        % Initialize output masked image based on input image.
        BW2 =  imdilate(BW,strel('square',20));
        BW2 = bwareaopen(BW2, 2000); % Parametro
        BW = BW & BW2;
        BW = bwareaopen(BW, 500); % Parametro
        BW = imdilate(BW,strel('square',10));
        BW = bwareaopen(BW, 2000); % Parametro
        BW = imerode(BW,strel('square',10));
        BW = imopen(BW,strel('square',10));
        CC = bwconncomp(BW);
        for i=1:size(CC.PixelIdxList,2)
            BW_TMP = false(size(BW));
            BW_TMP(CC.PixelIdxList{i}) = 1;
            s = regionprops(BW_TMP,'BoundingBox');
            img = imcrop(BW_TMP,s.BoundingBox);
            white = sum(sum(img));
            black = size(img,1)*size(img,2);
            %figure, imshow(img);
            if(white<0.2*black)
               BW(CC.PixelIdxList{i}) = 0; 
            end
        end
        maskedRGBImage = RGB;
        % Set background pixels where BW is false to zero.
        maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
        R = maskedRGBImage(:,:,1);
        G = maskedRGBImage(:,:,2);
        B = maskedRGBImage(:,:,3);
        R(BW) = 0;
        G(BW) = 0;
        B(BW) = 255;
        maskedRGBImage(:,:,1)=R;
        maskedRGBImage(:,:,2)=G;
        maskedRGBImage(:,:,3)=B;
        RGB = im2uint8(RGB);
    case 'yellow'        
        I = rgb2hsv(RGB);
        % Define thresholds for channel 1 based on histogram settings
        channel1Min = 0.129;
        channel1Max = 0.183;

        % Define thresholds for channel 2 based on histogram settings
        channel2Min = 0.350;
        channel2Max = 0.844;

        % Define thresholds for channel 3 based on histogram settings
        channel3Min = 0.498;
        channel3Max = 1.000;
        % Create mask based on chosen histogram thresholds
        BW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
            (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
            (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
        % Initialize output masked image based on input image.
        BW2 =  imdilate(BW,strel('square',20));
        BW2 = bwareaopen(BW2, 2000); % Parametro
        BW = BW & BW2;
        BW = bwareaopen(BW, 500); % Parametro
        BW = imdilate(BW,strel('square',10));
        BW = bwareaopen(BW, 2000); % Parametro
        BW = imerode(BW,strel('square',10));
        CC = bwconncomp(BW);
        for i=1:size(CC.PixelIdxList,2)
            BW_TMP = false(size(BW));
            BW_TMP(CC.PixelIdxList{i}) = 1;
            s = regionprops(BW_TMP,'BoundingBox');
            img = imcrop(BW_TMP,s.BoundingBox);
            white = sum(sum(img));
            black = size(img,1)*size(img,2);
            %figure, imshow(img);
            if(white<0.2*black)
               BW(CC.PixelIdxList{i}) = 0; 
            end
        end
        maskedRGBImage = RGB;
        % Set background pixels where BW is false to zero.
        maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
        R = maskedRGBImage(:,:,1);
        G = maskedRGBImage(:,:,2);
        B = maskedRGBImage(:,:,3);
        R(BW) = 255;
        G(BW) = 255;
        B(BW) = 0;
        maskedRGBImage(:,:,1)=R;
        maskedRGBImage(:,:,2)=G;
        maskedRGBImage(:,:,3)=B;
    otherwise
        warning('Unexpected band type. No elements created.')
end
obj = objBlobs(band);
obj.color_mask = BW;

split = sum(BW);
split = find(split~=0);
x = []; x(1,1) = split(1); k = 1;
for i=2:size(split,2)
    if(abs(split(i-1)-split(i))>1)
        x(k,2) = split(i-1);
        x(k+1,1) = split(i);
        k = k+1;
    end
end
x(k,2) = split(end); y = [];
for i = 1:size(x,1)
    bw_cut = BW(:,x(i,1):x(i,2),:);
    bw_cut = sum(bw_cut');
    idx = find(bw_cut~=0);
    y = [y; min(idx),max(idx)];
end
obj.bbox_x = x;
obj.bbox_y = y;

inv_BW = false(size(maskedRGBImage,1),size(maskedRGBImage,2));
blackwhite_BW = false(size(maskedRGBImage,1),size(maskedRGBImage,2));
for i = 1:size(x,1)
    mask = false(size(maskedRGBImage,1),size(maskedRGBImage,2));
    mask(y(i,1):y(i,2),x(i,1):x(i,2))=true;
    color_square =  BW&mask;
    CC = bwconncomp(color_square);
    if(size(CC.PixelIdxList,2) == 2)
        mask = false(size(maskedRGBImage,1),size(maskedRGBImage,2));
        en = abs(y(i,2)-y(i,1))/3;
        y(i,1) = round(y(i,1)-en);
        y(i,2) = round(y(i,2)+en);
        mask(y(i,1):y(i,2),x(i,1):x(i,2))=true;
        color_square =  BW&mask;
        side = mean(x(i,1),x(i,2))<size(maskedRGBImage,2)*0.5;
        color_square(y(i,1):y(i,1)+3,x(i,1)+10*(~side):x(i,2)-10*side) = 255;
        color_square(y(i,2)-3:y(i,2),x(i,1)+10*side:x(i,2)-10*(~side)) = 255;
    end
    idx = find(color_square == 1);
    [idx,idy]=ind2sub(size(color_square),idx);
    j = boundary(idx,idy,0.1); % Parametro
    color_square = poly2mask(idy(j),idx(j), size(color_square,1), size(color_square,2));   
    mask = ~BW&mask&color_square;
    mask = imerode(mask,strel('line',7,0));
    image = rgb2gray(RGB);
    square = image.*uint8(mask);
    square =  square(y(i,1):y(i,2),x(i,1):x(i,2));
    square_bw = im2bw(square,0.5); % Parametro
    square_bw = bwareaopen(square_bw, 500); % Parametro
%     white = sum(sum(square_bw));
%     black = size(square_bw,1)*size(square_bw,2)-white;
%     if(white>0.3*black) % Controllare
%         blackwhite_BW = blackwhite_BW + mask;
%         isWhite = true;
%     else
%         blackwhite_BW(mask) = 0;
%     end
    blackwhite_BW(y(i,1):y(i,2),x(i,1):x(i,2)) = blackwhite_BW(y(i,1):y(i,2),x(i,1):x(i,2)) + square_bw;
    inv_BW = inv_BW + mask;
end

inv_BW2 = imerode(blackwhite_BW,strel('square',5));
inv_BW2 = imerode(inv_BW2,strel('line',5,45));
inv_BW2 = imerode(inv_BW2,strel('line',5,90+45));
blackwhite_BW = bwareaopen(blackwhite_BW, 100);
inv_BW2 = blackwhite_BW;%bwareaopen(inv_BW2, 200); % Parametro
CC = bwconncomp(inv_BW2);
for i = 1:size(CC.PixelIdxList,2)
    BW_TMP = false(size(blackwhite_BW));
    BW_TMP(CC.PixelIdxList{i}) = 1;
    s = regionprops(BW_TMP,'BoundingBox');
    img = imcrop(BW_TMP,s.BoundingBox); 
    %% TROVARE UN MODO PER CONTARE I CONTORNI
    white = sum(sum(img));
    black = size(img,1)*size(img,2);
    %figure, subplot(211); imshow(img);
    if(white<0.55*black && black>500  && black<10000)
        img_fill = img |rot90(img,2);
        img_fill = imfill(img_fill,'holes');
        %subplot(212); imshow(img_fill);        
        blackwhite_BW(s.BoundingBox(2):s.BoundingBox(2)+s.BoundingBox(4),s.BoundingBox(1):s.BoundingBox(1)+s.BoundingBox(3)) = img_fill; 
    end
end
obj.black_white = blackwhite_BW;

inv_BW2 = imerode(inv_BW,strel('square',5));
inv_BW2 = imerode(inv_BW2,strel('line',5,45));
inv_BW2 = imerode(inv_BW2,strel('line',5,90+45));
inv_BW = bwareaopen(inv_BW, 100);
inv_BW2 = inv_BW;%bwareaopen(inv_BW2, 200); % Parametro
CC = bwconncomp(inv_BW2);
for i = 1:size(CC.PixelIdxList,2)
    BW_TMP = false(size(blackwhite_BW));
    BW_TMP(CC.PixelIdxList{i}) = 1;
    s = regionprops(BW_TMP,'BoundingBox');
    img = imcrop(BW_TMP,s.BoundingBox);
    toFlip = isTriangle(img);
    white = sum(sum(img));
    black = size(img,1)*size(img,2);    
    figure, subplot(211); imshow(img);
    if(white<0.6*black && black>500 && black<10000 && toFlip)
        img_fill = img |rot90(img,2);
        img_fill = imfill(img_fill,'holes');
        subplot(212); imshow(img_fill);        
        inv_BW(s.BoundingBox(2):s.BoundingBox(2)+s.BoundingBox(4),s.BoundingBox(1):s.BoundingBox(1)+s.BoundingBox(3)) = img_fill; 
    end
end
obj.inv_color_mask = inv_BW;

close all;
BW_edge = edge(BW);
inv_BW_edge = edge(inv_BW);
BW(BW_edge) = 0;
inv_BW(BW_edge) = 0;
BW(inv_BW_edge) = 0;
inv_BW(inv_BW_edge) = 0;

DT = bwdist(~BW,'chessboard');
inv_DT = bwdist(~inv_BW,'chessboard');
%imshow(inv_DT,[],'InitialMagnification','fit')
bwD1 = DT>4;
bwD2 = inv_DT>4;
bwD = DT | inv_DT;
bwD = bwareaopen(bwD, 50); % Parametro

for i = 1:size(x,1)
    chess = bwD(y(i,1):y(i,2),x(i,1):x(i,2));
    condition = true;
    while condition
        CC = bwconncomp(chess);
        bb = regionprops(CC,'BoundingBox'); bboxCorr = zeros(1,size(bb,1));
        for iter=1:size(bb,1)
            BW_TMP = false(size(chess));
            BW_TMP(CC.PixelIdxList{iter}) = 1;
            s = regionprops(BW_TMP,'BoundingBox');
            img = imcrop(BW_TMP,s.BoundingBox);
            toCompare = bwconvhull(img);
            bboxCorr(iter) = corr2(toCompare,img)
        end
        if(find(bboxCorr<0.72))
            idx = find(bboxCorr<0.72);
            tmp_chess = zeros(size(chess));
            for k=1:size(idx)
                tmp_chess(CC.PixelIdxList{idx(k)}) = 1;
                chess(CC.PixelIdxList{idx(k)}) = 0;
                %tmp_chess = imerode(tmp_chess,strel('square',2));
                tmp_chess = bwdist(~tmp_chess,'chessboard');
                tmp_chess = tmp_chess>1;
                imshowpair(tmp_chess,chess,'falsecolor');
                chess = chess | tmp_chess;
                chess = bwareaopen(chess, 50);
            end      
        else
            condition = false;
        end        
    end
%     idx = find(chess == 1);
%     [idx,idy]=ind2sub(size(chess),idx);
%     j = boundary(idx,idy,0.1); % Parametro
%     chess_square = poly2mask(idy(j),idx(j), size(chess,1), size(chess,2));  
%     mask = chess_square&~chess;
%     DT = bwdist(~mask,'euclidean');
%     imshow(DT,[],'InitialMagnification','fit');
%     DTT = zeros(size(DT));
%     for ll=1:size(DTT,2)
%        DTT(:,ll) = DTT(:,ll) | imregionalmax(DT(:,ll)); 
%     end
%     for ll=1:size(DTT,1)
%        DTT(ll,:) = DTT(ll,:) | imregionalmax(DT(ll,:)); 
%     end
%       
    CC = bwconncomp(chess);
    s = regionprops(CC,'centroid');
    obj = putCenters(obj, x(i,1), y(i,1), s, i, size(chess,1)); 
end

imshow(BW); hold on;
for i = 1:size(x,1)
    X = obj.chess(i).center_x;
    Y = obj.chess(i).center_y;
    ind = find(obj.chess(i).center_x==0);
    [id_row,id_col]=ind2sub(size(X),ind);
    X(id_row,:) = 0;
    Y(id_row,:) = 0;
    axis = 1:5; axis(id_row) = [];
    for k=1:size(X,2)
        value = X(:,k); value(X(:,k)==0) = [];
        X(:,k) = pchip(axis,value,1:5);
        value = Y(:,k); value(Y(:,k)==0) = [];
        Y(:,k) = pchip(axis,value,1:5); 
    end
    for k=1:size(id_row,1)
        row_Xchess = obj.chess(i).center_x(id_row(k),:);
        row_Ychess = obj.chess(i).center_y(id_row(k),:);
        row_Xchess(row_Xchess ==0) = [];
        row_Ychess(row_Ychess ==0) = [];
        row_X = X(id_row(k),:);
        index = 1:size(row_Xchess,2);
        for j=1:size(row_Xchess,2)
            curr_val_x = row_Xchess(j);
            curr_val_y = row_Ychess(j);
            row = abs(row_X-curr_val_x);
            idx = find(row== min(row));
            X(id_row(k),idx) = curr_val_x;
            Y(id_row(k),idx) = curr_val_y;
            index(index == idx) = [];
        end
        X(id_row(k),index) = 0;
        Y(id_row(k),index) = 0;
    end  
    obj.chess(i).center_x = X;
    obj.chess(i).center_y = Y;
    ind = find(obj.chess(i).center_x==0);
    while(size(ind,1)>0)
        %       mod(4,2)   % Even  number
        %       ans = 0
        %       mod(5,2)   % even number 
        %       ans =1
        [id_row,id_col]=ind2sub(size(obj.chess(i).center_x),ind(1)); %Prendo sempre il primo
        X = obj.chess(i).center_x(:,id_col);
        Y = obj.chess(i).center_y(id_row,:);
        xv = 1:size(X,1);
        yv = 1:size(Y,2);    
        X_pchip = X; X_pchip(X==0)=[];
        Y_pchip = Y; Y_pchip(Y==0)=[];
        xv_pchip = xv; xv_pchip(X==0)=[];
        yv_pchip = yv; yv_pchip(Y==0)=[];
        val_x =  pchip(xv_pchip,X_pchip',xv);
        o = obj.chess(i).center_x;
        obj.chess(i).center_x(id_row,id_col) = val_x(id_row);
        o =  obj.chess(i).center_y;
        val_y = pchip(yv_pchip,Y_pchip,yv);
        obj.chess(i).center_y(id_row,id_col) = val_y(id_col); 
        ind = find(obj.chess(i).center_x==0);
        disp(['fix',num2str(i)]);
    end
    for k=1:size(obj.chess(i).center_x,1)
        for j=1:size(obj.chess(i).center_x,2)
            scatter(obj.chess(i).center_x(k,j),obj.chess(i).center_y(k,j));
        end
    end 
end


% 
% 
% CC = bwconncomp(bwD);
% s = regionprops(CC,'centroid');
% figure,imshow(BW); hold on;
% for i = 1:size(s,1)
%     scatter(s(i).Centroid(1),s(i).Centroid(2)) % Riferimento Y verso il basso
% end
% 
% 
% 
centers = zeros(5,5,2,size(x,1));
% for i = 1:size(x,1)
%     color = BW(y(i,1):y(i,2),x(i,1):x(i,2));
%     color = imclose(color,strel('disk', 3));
%     d = size(color,1); j=1; 
%     for k=floor(d/10):2*floor(d/10):d
%         centers(j,:,2,i) = k;
%         vline = color(k,:);
%         idx = find(vline~=0);
%         if(size(idx,2) ~= 0)
%             xx = []; xx(1,1) = idx(1); kk = 1;
%             for jj=2:size(idx,2)
%                 if(abs(idx(jj-1)-idx(jj))>1)
%                     xx(kk,2) = idx(jj-1);
%                     xx(kk+1,1) = idx(jj);
%                     kk = kk+1;
%                 end
%             end
%             xx(kk,2) = idx(end);
%             for jj=1:size(xx,1)
%                 centers(j,jj,1,i) = 0.5*(xx(jj,2)-xx(jj,1))+xx(jj,1);
%             end
%         end
%         j = j+1;
%     end
% end
% 
% for i = 1:size(x,1)
%     color = BW(y(i,1):y(i,2),x(i,1):x(i,2));
%     figure,imshow(color); hold on;
%     for k=1:5
%         for j=1:5
%             scatter(centers(k,j,1,i),centers(k,j,2,i)) % Riferimento Y verso il basso
%         end
%     end
% end
% 
% 
% for i = 1:size(x,1)
%     j = size(centers,2);
%     for k=1:size(centers,2)
%         x_axis = [centers(1,k,1,i), centers(3,k,1,i), centers(5,k,1,i)];
%         y_axis = [centers(1,k,2,i), centers(3,k,2,i), centers(5,k,2,i)];
%         if(centers(1,k,1,i) == 0 || centers(3,k,1,i) == 0 || centers(5,k,1,i) ==0)
%             centers(1,k,1,i) = 0;
%             centers(3,k,1,i) = 0;
%             centers(5,k,1,i) = 0;
%         end
%         if(sum(x_axis)>0 && k<=j)
%               centers(2,j,1,i) = (x_axis(1)*centers(2,k,2,i) - x_axis(3)*centers(2,k,2,i) - x_axis(1)*y_axis(3) + x_axis(3)*y_axis(1))/(y_axis(1) - y_axis(3));
%               centers(4,j,1,i) = (x_axis(1)*centers(4,k,2,i) - x_axis(3)*centers(4,k,2,i) - x_axis(1)*y_axis(3) + x_axis(3)*y_axis(1))/(y_axis(1) - y_axis(3));
%         end
%         x_axis = [centers(2,k,1,i), centers(4,k,1,i)];
%         y_axis = [centers(2,k,2,i), centers(4,k,2,i)];
%         if(centers(2,k,1,i) == 0 || centers(4,k,1,i) == 0)
%             centers(2,k,1,i) = 0;
%             centers(4,k,1,i) = 0;
%         end
%         if(sum(x_axis)>0  && k<=j)
%             centers(1,j,1,i) = (x_axis(1)*centers(1,k,2,i) - x_axis(2)*centers(1,k,2,i) - x_axis(1)*y_axis(2) + x_axis(2)*y_axis(1))/(y_axis(1) - y_axis(2));
%             centers(3,j,1,i) = (x_axis(1)*centers(3,k,2,i) - x_axis(2)*centers(3,k,2,i) - x_axis(1)*y_axis(2) + x_axis(2)*y_axis(1))/(y_axis(1) - y_axis(2));
%             centers(5,j,1,i) = (x_axis(1)*centers(5,k,2,i) - x_axis(2)*centers(5,k,2,i) - x_axis(1)*y_axis(2) + x_axis(2)*y_axis(1))/(y_axis(1) - y_axis(2));
%         end
%         j = j-1;
%     end
%      for k=1:size(centers,1)
%          centers(k,:,1,i) = sort(centers(k,:,1,i));
%      end
% end
% 
% % for i = 1:size(centers,4) % Immagini
% %     color = BW(y(i,1):y(i,2),x(i,1):x(i,2));
% %     color = imclose(color,strel('disk', 3));
% %     for j = 1:size(centers,1) %Riga
% %         for k = 1:size(centers,2) %Colonna
% %             %[centers(j,k,1,i), centers(j,k,2,i)] = updatePos(centers(j,k,1,i), centers(j,k,2,i));
% %             if(centers(k,j,1,i) == 0)
% %                 first = k+1;
% %             end
% %             if(j==1 && k ==first)
% %                 neighbour = ['right', 'down'];
% %             elseif(j==5 && k == 5)
% %                 neighbour = ['left', 'up'];
% %             elseif(j==1 && k == 5)
% %                 neighbour = ['down', 'left'];
% %             elseif(j==5 && k == first)
% %                 neighbour = ['right', 'up'];   
% %             elseif(j==5 && k>first && k<5)
% %                 neighbour = ['right', 'left', 'up'];  
% %             elseif(j>1 && j<5 && k == first)
% %                 neighbour = ['right', 'down', 'up'];   
% %             elseif(j==1 && k>first && k<5)
% %                 neighbour = ['right', 'down', 'left'];
% %             elseif(j>1 && j<5 && k == 5 )
% %                 neighbour = ['down', 'left', 'up'];
% %             end
% %             
% %             if(color(centers(j,k,2,i),centers(j,k,1,i))) % Se il pixel � colorato fai una cosa altrimenti un altra
% %                 
% %             else
% %                  
% %             end
% %         end
% %     end
% % end
% 
% for i = 1:size(x,1)
%     color = BW(y(i,1):y(i,2),x(i,1):x(i,2));
%     figure,imshow(color); hold on;
%     for k=1:5
%         for j=1:5
%             scatter(centers(k,j,1,i),centers(k,j,2,i)) % Riferimento Y verso il basso
%         end
%     end
% end
% 
% 
% % Riorganizzare i punti a partire dalla configurazione approssimativa
% 
% % trovare nei centri l'oggetto reale, spostarsi a sinistra e a destra
% % muovendosi sempre sul pi� vicino rispetto a quello vero
% % aggiornare con la posizione assoluta
% 
% for i = 1:size(x,1)
%     for k=1:5
%         for j=1:5
%             if(centers(k,j,1,i) ~= 0)
%                 centers(k,j,1,i) = x(i,1) + centers(k,j,1,i);
%                 centers(k,j,2,i) = y(i,1) + centers(k,j,2,i);
%             else
%                 centers(k,j,2,i) = 0;
%             end        
%         end
%     end
% end
% 
% figure,imshow(BW); hold on;
% for i = 1:size(x,1)
%     for k=1:5
%         for j=1:5
%             scatter(centers(k,j,1,i),centers(k,j,2,i)) % Riferimento Y verso il basso
%         end
%     end
% end

obj.masked_rgb = im2uint8(maskedRGBImage);
disp('ciao');
close all;





