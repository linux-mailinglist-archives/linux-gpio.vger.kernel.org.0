Return-Path: <linux-gpio+bounces-931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74660802CF3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F26E1F210B1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 08:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55042D527;
	Mon,  4 Dec 2023 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CEt0M3Lb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7280DF
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 00:17:36 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7c513dc5815so1455538241.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 00:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701677856; x=1702282656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cv3+u5Nr1+Y2iihnZ3hSatBIAhuecZToXeDGh+GJlpE=;
        b=CEt0M3LbMiLT0Oatr+I66PVQ1N92XKD1jJKM7LYOktmNqMWthQk4/jad5yvezvxTVB
         1lqOB3o919JrWJaK5IlzKVv+4Hb++5xmPxX9JXpcVxJBDdnVQ2QTPN3f/2aBBQvNa+Ar
         S51GToWvxdg0+HGyC7Ks+UH2RG8VlHvdGldPv7dSp+kIISJpxG2UIZ8yA/enr1HvL+oP
         bDxiejYUeSWVqwWtvfeAeb3bi+VJprzzxc4iMFzMQUaDbLfn9GlYeHBMLbj7O0j9tr6m
         ju4sOCScf99PnVGIfx+PLjVJJVaX6x2+EsUN9nk4AENyMsi71AiW4NttFLAcCIPKnQul
         fEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701677856; x=1702282656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cv3+u5Nr1+Y2iihnZ3hSatBIAhuecZToXeDGh+GJlpE=;
        b=WeMtFTQ58/c7MLBtEaLxN7XQnbedcv9eD4KcnBDW8kCCbKvjBG2Kh0E4VyTSIchDt8
         mGXOPzI37+3e9De8zLeWbxfOZmItR+JhK8QciNxMZwSNeygpWfQCuC/DIJRzdbf6mv+7
         FloyUjetlpmyFsCzTJARYKAMUpRCpJDe+Kq06DcR2Ck91KkE7jLiqqEwlb68nTWeREMk
         oMqkDDhbhySpmYqzao7Jgzr4aaVSXHKjFOhhTFJPSsPbA39uwJGyrZLyjajaymlOMuEt
         7OsYz+nUHgklKb7BmxezVWFDrSxTqqYDd/G7vgOxk2kxjvCg+jlOcUrz4ySAFy6cAVBf
         YRRg==
X-Gm-Message-State: AOJu0YyJDhHM/Y/WooVvdp71qC6WDwRVWG6KRkiWqQQ9u3G+FwhcuTJR
	AXPGawOKGFjguEr1YEDgEuEbxdRCBaDh/CQnarF20A==
X-Google-Smtp-Source: AGHT+IEFSa80B07cTwAmhpt40ecCmW1UM52sS0ruQH7XfF6sbBKQu+W0s56XmAPRzwmmQR5CnWl+0e+6m4sTSN9/1eA=
X-Received: by 2002:a05:6102:292b:b0:464:77f2:554 with SMTP id
 cz43-20020a056102292b00b0046477f20554mr1865442vsb.38.1701677855333; Mon, 04
 Dec 2023 00:17:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201140840.323762-1-heiko@sntech.de>
In-Reply-To: <20231201140840.323762-1-heiko@sntech.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Dec 2023 09:17:23 +0100
Message-ID: <CAMRc=McaQf+p1F3fP3pc8-icm1hjKv8VDLRAoXs5QGize1J=CQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rockchip: add a pattern for gpio hogs
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, quentin.schulz@theobroma-systems.com, 
	Heiko Stuebner <heiko.stuebner@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 3:08=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wro=
te:
>
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>
> Allow validating gpio-hogs defined inside the gpio controller node.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.ya=
ml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index affd823c881d..d76987ce8e50 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -41,6 +41,13 @@ properties:
>    "#interrupt-cells":
>      const: 2
>
> +patternProperties:
> +  "^.+-hog(-[0-9]+)?$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
>  required:
>    - compatible
>    - reg
> --
> 2.39.2
>

Applied, thanks!

Bart

