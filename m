Return-Path: <linux-gpio+bounces-23812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17CB11DD6
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 13:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8260AE1E2B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 11:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE31220F37;
	Fri, 25 Jul 2025 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PtpWTiA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED51F0E26
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443969; cv=none; b=LY0XqXThSPNrbsmvnp/OQ1NRNneOqxMUCiGC7J1AYOgH12PzBINBbzjdn/bADQ7/smZfX+v/cBz9B9vAWjzRQB9lp7y3mHpAnFIhb3xFDsvuYm7FXZb5b4jo9/On0Q5NuySgGPuyZLuolI9bJ7dTQfeFIpLmJf65+JOJ1BKBWMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443969; c=relaxed/simple;
	bh=7Lq+L8ybIKzJFE7aCP8K4OUgb0w5TEGi1D/8HV86VOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuJqSnzHuazOINWGIUYwfQIurhTlN3r670yAguo1Js0rLjhum9EFuXWOL5fL7OKX1/KKmVWLCXARS/Ct2GTupbi4nHt0ETBPgJ7jNaZOlA3wGrGuz5FkgV1o6vlmmUsaTC260HOI/S3Ol6dxsqh01fGyOV3usMGgHFFLlFC7An0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PtpWTiA4; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e62a1cbf81so286584285a.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443967; x=1754048767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=PtpWTiA4TGtgk8s3horaCSu8xh0g9EAe9kTHQx8n2GpCVIqSEyAVi76MH+6YDqG60I
         94DUVvX6czA5h8cUZnTP2rHt1DQxL+dkYGUDUXS0TaIpvuKm9coicO9x2jCJQ+wv1RsM
         qlRfqzEZFyZSUCXjWtNTCmPe9HZ7YPKrwGw5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443967; x=1754048767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=Lelv+9za6jvIV5niAnb3kNftyp6s6N8Ov/e7ABPLHaGtSrxYQ6l1BEobIiN7O14pPA
         JzitXruWzwiU2Ww03Lj4B5VjL4CtmMNgMPF60es4P4UYPlJ/nZZ5lLPvwgx6kYo4BDJ8
         /x6NWDuYI3p8ykttXk4HU2RKTm2fkN3IHdtUtQjN1Ks0U3YlVmGTfJTOOOGFX0pW2ObG
         XIJdSB5v9OmLq37i/nmifoLmK5nN2hDLqyGm1HbovabucYs0t1FPWNPzVq+NJU1Aicp/
         jHPZlY7G8XUIqJtIGt+yGi0D0EGBAPEJWMZ2ZTELwJibYAQXc/nUl7vJS27y3yiS3OQC
         o5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRid/1m1R0JIdaF0QTL+yWwOwWzgb8cIqIjKylSKHCR06WEBnXkQpNkb9yI2hR4pfKbHCSvqbEIhe+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1e7EzOPvAvkelmpDS74nMg/jwzSsZ6H5SkN95y298lO5Ruyn0
	Eeg1rrXPqCtml+dJWvzpc+nr7D0Va7U9F3Sof0gbxkAHn66OLgwjuWo8+8xpjmY0EVg7rAshmpz
	DLZ8OOg==
X-Gm-Gg: ASbGncv+pVKQa2/kNxQgMXZMdz4m2eF2PWFReY2HAgrBb/tkvbTPdfKs2pr9sXYPeJ+
	rlXCl09AK/Cinhj1Q9KgBFQYZZ8CbAramNoA1OAcyXfJ/Lo5XHR3RoPZwldD/lijLXY37Gzyfcw
	ny0bzwfXclJ2Ian3oiDChyXwxtMWROaQ08pDOGQi1rfxgX+Ux0LeqxnMz7HHQ2w1bIqhjWe1ll6
	8irAnBEzGB5UBoK6C4f2YqWTY0MjXUcGaVk8dj67iiPIiRxp2WSyCdtcF1D5wkatYdCYelmEsqw
	hnQVOYZ51TlnaAWZRPEF19yhLFeVl7gdVImGy0tLQThgvM0ab9o/dY2szmPi6gjpM4w2dUc4I0s
	RzBNGqYfuSK+FoRtqhR0fsdFiDETnTirAXcPJOZ7hJOFYFGeM9jaG18/J6jy2KQ==
X-Google-Smtp-Source: AGHT+IHRgN9mMiOmnrMgWcfJp2Hgys2GksvfzG2ZbCe2anBNKTbrkqo+pKHxhqZV/IxDSfbpaOQsVw==
X-Received: by 2002:a05:620a:d87:b0:7d3:9260:6dc7 with SMTP id af79cd13be357-7e63bf53805mr169737685a.6.1753443966746;
        Fri, 25 Jul 2025 04:46:06 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632e1a687sm244295685a.50.2025.07.25.04.46.06
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:46:06 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e62a1cbf81so286583085a.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXl8oU8mQjViQYjbjiDc1+Mjhbdr/OQpdv9i+0TtGdbV9smLLUCF14YdlW1Lwi4PuA3bsdtIZ0Ajo2M@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr316348137.17.1753440787376; Fri, 25 Jul 2025
 03:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:52:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
X-Gm-Features: Ac12FXzhNEGCOc6TL2wVpoG5kEXhC599YdNWu941VvXlO0dL7_W9Jc4if8EyMHA
Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg
 to iommu node
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The "M4U" IOMMU requires a handle to the infracfg to switch to
> the 4gb/pae addressing mode: add it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6795.dtsi
> index e5e269a660b1..38f65aad2802 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>                         clocks =3D <&infracfg CLK_INFRA_M4U>;
>                         clock-names =3D "bclk";
>                         interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
> +                       mediatek,infracfg =3D <&infracfg>;
>                         mediatek,larbs =3D <&larb0 &larb1 &larb2 &larb3>;
>                         power-domains =3D <&spm MT6795_POWER_DOMAIN_MM>;
>                         #iommu-cells =3D <1>;
> --
> 2.50.1
>
>

