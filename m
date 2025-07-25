Return-Path: <linux-gpio+bounces-23810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48922B11CA4
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 12:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 036D94E8082
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 10:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF742E11B0;
	Fri, 25 Jul 2025 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TGile5JJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12E2DE71E
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439962; cv=none; b=jVn/S0gsctI0DPXDhUhDXMY49l58RpHJl35N5GPCpVEn8M8Xy7Bao26Z0l3MS9/tQFPpz+y3Y/MR+QJ3VSpLoukmyRnaQnWLMdhShVHDBry1D38hV5l5X6ljnVEbNRsK7BZ4qis/+rjE3KzM0GoY5X3s2YPKBwQ9oy7BLjQFeGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439962; c=relaxed/simple;
	bh=DZf8o481vjpJ7QSUoolpwJajFBT1Vwo8xHyfUgSq//c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRYaJHIJIUz1CDf9si35uJs+eP06rTGD+fcASuhyi0hpGIx7PGupJpaCvmPBvFjnv6AIs1HNsjWqbVH+D+m6HyBb0cxDuNt2DA5AiYIklv/Xj7UvKN+bsgXPk1qIknXBnIN+347BcfibZMfC9RNbdpRbAIz6Hn6JwPw/8xUsJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TGile5JJ; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53167fb5690so662007e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 03:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753439959; x=1754044759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=TGile5JJ7cX1FsGdos/GgVrD9YkSRBbLDQ4Xb8JDu6j+CVVWr1xUrRtqWJP//8oj9V
         Qy1e9FW9Hk8sm22hFIF2tCv8U8LFFqys0nm4F1kUYfOiIclF8YhGw0fL0wg+Y1ayzjxQ
         yzhJt4LRhCe0XaYFrvoAgb2qn4+HesnO12PiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753439959; x=1754044759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=Kbcww18dBSQQMP/R3GNsgD8Lirw3/mMeRzk/RbZSoFs6MJJ2Onl1++j0wEXsrgKtwH
         gpfnQq3ojFZ2vQqFjzXSUTcENuda3ve+BqJKjOUyx6g2r7kENOk/6cAqhpGW59v/oh3/
         wuwtPw9hYhoGzaHYBBHbzfi1nmHLUOS7ULAMeTcZzKJG042Rt/wcum9oPBHpIB8TXCg3
         r2xZrVW4FbgVlgWp6aXtmBUsJVjGFg0zuN2qwQXEYr8IvdtawUeZpSPuzgzrK+C1z3BH
         csI780qLuOgOV/pzDVBWE43fEJ1GeuKouqyQFcDGnW6lcNg8LfvXIaQ4VX0JuQBKduTB
         JHeA==
X-Forwarded-Encrypted: i=1; AJvYcCXU3WLpBDRDpDtXgicLVVIGLgzM2cRbUntYcJWNaUcJWa2/tTIO/VRVy7t6rPuFS7qeySpcQlv/blCz@vger.kernel.org
X-Gm-Message-State: AOJu0YwzqRTOsBi+3pFphi67lUDB/gl6I9Z/WbmAPeOC6C2MazhrBbov
	iTNQB1v3ifFQXK0if/PLSyr4HDGP6Zz80/PqBHHtgRSOftys1GKNEJF/vWCpdVTZv2SSdZ68Znm
	B26IP+A==
X-Gm-Gg: ASbGnct2y7RNk40MYdxfaQ7osLWQljfuFlf4tJi3zT7E40G8NTYALMXa0aGmapNeKsN
	yoR3/NffHo4ZdsWq9j5NRpHB90TDsvLZ2ooa+9zUqDBUF9yChGIsnksECh3e/SMTXK0HJq2o7u8
	bocOtB5Em2pbt+/6M6XlEJTn3QrUulHiz/g1Mdyl0KuRw6D8TtvtDrKzWrw9qnnkyrH83kOvzYN
	cIXbVMvxry7waowdfVA2r8ipH8w9jhly4/YuMWW7t/dG7aSaknmsIcUjQ3xAP6dFSv+yQHc4fea
	xuLjJZJ6eXUdLwoWRxPf/DwyTi/RngPmLWlR7iiYUGyasDjMnz2nhmMyBMCaN7r4HYtl5YZWm8W
	sZx67XTagxbqU9CHJb7Z1sMty1bH9DroCCqJF209kXoiikbWcQkrAWkH8up/jmA==
X-Google-Smtp-Source: AGHT+IHn5yA9lHHWxEwFzqB09QhpDpj8IYjD1iqMV9qub/v//zMX0pqiwcpC7mKUc2PKzgx/JX/iag==
X-Received: by 2002:a05:6122:3c91:b0:535:b383:c91e with SMTP id 71dfb90a1353d-538db4f6638mr332385e0c.6.1753439958968;
        Fri, 25 Jul 2025 03:39:18 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-537bf85be4fsm919802e0c.21.2025.07.25.03.39.18
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:39:18 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-537a0d384b2so667307e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 03:39:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNy0T0HAaF+xzxZ77E0Xxyi6JXTUJzDmw3P8AkjL6BmTbeD/1lrh3UtowLnFBQpVJ3di4yVVezQfZ4@vger.kernel.org
X-Received: by 2002:a05:6102:4a8f:b0:4e9:a2bd:b456 with SMTP id
 ada2fe7eead31-4fa3feb1976mr334393137.12.1753439957846; Fri, 25 Jul 2025
 03:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:38:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
X-Gm-Features: Ac12FXzORC58mPF_B982fHDjnhtiL_-5O2nAq5PI4bkUJDNwvq8vw0VlaVEnRW8
Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
Subject: Re: [PATCH 38/38] arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This devicetree contained only the SoC compatible but lacked the
> machine specific one: add a "mediatek,mt8516-pumpkin" compatible
> to the list to fix dtbs_check warnings.
>
> Fixes: 9983822c8cf9 ("arm64: dts: mediatek: add pumpkin board dts")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts b/arch/arm64=
/boot/dts/mediatek/mt8516-pumpkin.dts
> index cce642c53812..3d3db33a64dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> @@ -11,7 +11,7 @@
>
>  / {
>         model =3D "Pumpkin MT8516";
> -       compatible =3D "mediatek,mt8516";
> +       compatible =3D "mediatek,mt8516-pumpkin", "mediatek,mt8516";
>
>         memory@40000000 {
>                 device_type =3D "memory";
> --
> 2.50.1
>
>

