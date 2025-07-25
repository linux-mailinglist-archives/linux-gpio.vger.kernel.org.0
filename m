Return-Path: <linux-gpio+bounces-23819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F93B11E4B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 14:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D558542AEB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 12:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B18238179;
	Fri, 25 Jul 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k/oCEBY1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3871C6BE
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445722; cv=none; b=iz2qbhvNQV3B0FJR7FkMsN1jANLPx7FKpbAwKWTJeXumYRqqyffY0KvRaf7qUPpYQwxinNh+FzbrqPQQ0m76xuI7kGN1pAiWX+DlDgQp7dR2UV6bZkCy0wGIKohpR1MNJ1qH74YA6940X/r7ixOrhvvHlofN0G6DhxQYy8gmmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445722; c=relaxed/simple;
	bh=AyRroNoAAfZMLYMuOWzL5KFUvjXMr31GJOyZqB2g5AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSrG6UA6FVomcf4hdweM87dvkbK8m9jez6991Mq+0CmQSFWVd7xFLIB3lGVvK7oBn+bej6UQGVBSYjwgW8tWahJJM12XY+73b88bNugGospL+bIFMafIJ6D7npnfId84xj2GFH40USvVewgpRljl06UJ7jxSnTSn1Jel4cL/KM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k/oCEBY1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235e1d710d8so26601045ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753445720; x=1754050520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=k/oCEBY17Zi2ySI3oowXSkM6ICdZIxI/tFfo7BW/SYBjHUEe0KKxHkClF+liw/8aU7
         yGKALNpNeWNYPiyI4SYMBmXIjsNe09bQQOKgx8dArtkZvX0+bhQWN70Z3hZHzGjhROnK
         fCGOqAG3NMXC9wiUFxzDaIMvOsB5FZ35gf/m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445720; x=1754050520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=B/LULx0QQ0zE1gCzikaSyvrfN64pVxBxnYc1MBk7JJLZjXGH7aqZz0RPkVvpk88Ali
         DQbz1+JoXXw2DFR8BVqeUbqxdVhd2LMgcCm27TD7Naa56fTN6a87bFcbGeyFjaqlrgn6
         F4+0DGvuXuSNwliSThXctaVCdzGgZ/0LqMoMhS9+dUaAJUCO1ivbGuSDc/vZ1znm3gQM
         250gSnmurlvxquOcEuAobQK2teidm0/cT4vLU24M8sPKDCZyDFmKKsym6CXaqyTI55t6
         tzdcEU50d4mGLT5mstoNBrAzLwZL/+4Z/wQZtWx+7tDBcg1qlZqQYUBWVmWrSddmHS1W
         3h5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOxxOnjHeJtFz7uoSUHn2yEQwlz2Sdz7mZ27eobWqTX1FKhnB6k9oycm0mfexqMlvLE18ypfsTbvBl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ufZoQFlPX/u4RWA2dodV22kQmOIkpeZDJVGHO6N36yrxYWRl
	QAYAMXMU+jZuwIAibOS27Dj15kNQfvRaiOnS5o+giNTka0CCTX5g8MkvajivETFyX4t7GSjDw1J
	Ag9IGcw==
X-Gm-Gg: ASbGncvZQuWM5q4VdrNi/0onAsDZBsCKz8ySGIPtwH34YccQOrtBPJQ+UDgFgSeS25+
	eRUcTjB1tF4tq7PtU+PQq6SXxiQSWA9ONTkFals+MdgvmUkT6aASdMGEQQpxULrPm0Tn4JzPKjw
	mYym9LirjWT7y9YA38f3MN+NNzS68lJZ+JEOZj4Kp7UKXXb3+QYeHhZrx94HPxvowyr3Z+0sbJb
	eUOOqg+PMwPdNSUseh7DFqqIMW+zW3Lk/wCAN2iJjVLTLzZLSKWaAFKgOneWZE6hUKaMXF17y2c
	SFb6mCsrwNtwusITFb2aHiUeISDQQGf5HE99JhOMDG/D4DEJqVxnUtYLovgkOVkKgX7PLPrbID7
	fn41WH9/jDgk7tVXk5vG+9Ws0B+GRI+a8PbrusteJkUcjWdWh21XL+Ow45qutbw==
X-Google-Smtp-Source: AGHT+IFfEw8vvrV5nfNDaA3IFYKW+GQDAnukH3/Jt6U4C/aF2iUmMkTJJo3bqXhm1lrBQ2XEov4/uw==
X-Received: by 2002:a17:902:d487:b0:236:6f43:7051 with SMTP id d9443c01a7336-23fb309f421mr24958135ad.23.1753445719837;
        Fri, 25 Jul 2025 05:15:19 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com. [209.85.214.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48e0a09sm36186675ad.151.2025.07.25.05.15.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:15:19 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235e1d710d8so26600815ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 05:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoueFxeYCrUDxclA7fjFTw8zvdASgLQqnL10xTLkPHTT7FXJoUkS8V/Otln/NNwyzwCiSk/0ADS5EB@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4fa3fa71860mr256656137.9.1753440125688; Fri, 25 Jul 2025
 03:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:41:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
X-Gm-Features: Ac12FXwspafB6XO0s33DaaDCIfXTapXC0TbPbPDsXvwxpmO6Wfy_iIb8kWhO-Rk
Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
>
> Remove those to suppress an avoid_unnecessary_addr_size warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts =
b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>         flash@0 {
>                 compatible =3D "spi-nand";
>                 reg =3D <0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <1>;
>                 spi-max-frequency =3D <52000000>;
>                 spi-rx-bus-width =3D <4>;
>                 spi-tx-bus-width =3D <4>;
> --
> 2.50.1
>
>

