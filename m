Return-Path: <linux-gpio+bounces-4386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893B87CB48
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Mar 2024 11:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDB66B2257F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Mar 2024 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB3E18654;
	Fri, 15 Mar 2024 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sVk2tWd8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2715E1862A
	for <linux-gpio@vger.kernel.org>; Fri, 15 Mar 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498059; cv=none; b=J0N4s4ZeYo+vFUXXFds5qEjd2KL3jE9zZJLhLoNPHncEAdjw3Y0zFvBC1Fed06eQ7+se+dQ3Ge87CChUxMq0MqIapBez7QloitDPZXAkp1QBLs74oe9vdnDLqbJqwcQo5rFbxFVaG0lYWmuyyP1pV2iDwis/kusGmoOI0w6/JeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498059; c=relaxed/simple;
	bh=JSCNMW8qWshcPVnF89xrbpx4/BHY0kCqY+YQoPryMmE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=XcCtFxmk3lgOF60T3HzKEeEwaAu4lsZm1Mgpv7hbrO44gCVjW0PbC12xLLnegfjAGuz51LggeVAYEnKgBvTgZx1KC/8br4Yr0HSo5lMyfuAKMsXpk4Y73Az66NHvfNqA393xoLJvhbVlFVXyg7k9ViAC5P7k3/2QLpP+lBKdthM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sVk2tWd8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513d3e57518so1658325e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Mar 2024 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710498054; x=1711102854; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=6gMhyQcCq8fucjInJ87jHa5Zs8QHwH2ZIASN5Qcn1XU=;
        b=sVk2tWd8CFKPdshbb9eXUUET6ZxocEIboqiLXoiqK3hg721u/2gNRYRSMVLaAGcwJX
         Oo6qm5UrSecL0sM5Xm9FwSsum2PVin70I8X2N/GMT4dGYvdHTaA69jv5n6dD99DacA7W
         EFL8UNGrHt2wcgjlR4vp/M6Goki5GzwwxGoeEXf3sFZdhF/Bv3gVaIfco4vOYFEb6kxc
         VKXpBa1w2q4oYRFCOpmcRXzJIcSXs6Ptz/+usei3On4qFEQwz5glSw9RDuguoqoei4GD
         o4CoCeTiM2q9tfz+CKEBK9WMpNQPMasWCBBAF0+085Z/m0GiOpUam0MPZ7VLHf+qPd9b
         Xuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498054; x=1711102854;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gMhyQcCq8fucjInJ87jHa5Zs8QHwH2ZIASN5Qcn1XU=;
        b=dKXvBfTy3fnVPjHnLLDNlxzKiX3zvMbiDOA0XYdonXRreZMzK59797w/bdpz7QEWxQ
         9CQl87mlYoBwIroGwPEnbh62URn0JwTi8ZggQVQXFyeIfCFa7VgbvdBdinPIqrsoPuv3
         xliMDs/SbkHpOCF/6+sWnENbCriMsWqlwYkpQ95kv/dM5SZowyWv5a6N5TIe6VVaTv5E
         BcJ8Z1VHG21BLmSUoRgM9rpGVCJoptQ8ek8qt5pIlIYnnhxfc2Ffd6uQAjghE5t0YsZ+
         dGQ+StpUaeHj75uF26D/PT7hd1xC2rgIJaCXvzYJk2zOT7pzgicA99wTfd2erSVrKQRw
         Cjng==
X-Forwarded-Encrypted: i=1; AJvYcCUbhMHfBGsw5h+qvV1pLimS2NTbu50ZljgEXqi/06EI57rgdpR9vSy2b3XUsVbdanxjLzZTrjp5JZ7Ti28lJ/N/xltjAqTWGL7WqQ==
X-Gm-Message-State: AOJu0YyniketeyfAV1+aHKBdk9/99fNSSI0blR2NPekDcPoFa5RT/AjS
	/eHAISQzpPSCCI/6zdFOzsvzLSuvUKYGmTWiTIKFuv/7aiLCJNZYVYwkrqNbd5g=
X-Google-Smtp-Source: AGHT+IE93RWjsQIaXcrXP7QebJrBXb65k9rloMkqM4nhLZfNJA/HvogTh3saXyVEmcMBtfGaiLq/Mg==
X-Received: by 2002:ac2:4348:0:b0:513:42e:ddf0 with SMTP id o8-20020ac24348000000b00513042eddf0mr2648632lfl.36.1710498054118;
        Fri, 15 Mar 2024 03:20:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c3b8700b00413ea3db648sm8058358wms.26.2024.03.15.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:20:53 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 21/25] ASoC: dt-bindings: meson: axg-tdm-iface: claim
 support of A1 SoC family
Date: Fri, 15 Mar 2024 11:13:48 +0100
In-reply-to: <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
Message-ID: <1jmsqzhk3e.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Add "amlogic,a1-tdm-iface" compatible string alias to
> "amlogic,axg-tdm-iface".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> index 45955d8a26d1..7c1af85b52b4 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,axg-tdm-iface
> +    oneOf:
> +      - const: amlogic,axg-tdm-iface
> +      - items:
> +          - const: amlogic,a1-tdm-iface
> +          - const: amlogic,axg-tdm-iface

Same as the card driver. I could have named it "amlogic,tdm-iface"

This is purely a SW component, which help agregate clocks and
tdm-formatters. It is analog to a "gpio-leds" or a "pwm-clock"
driver. We would add a compatible for every SoC for these, would we ?

I don't think it makes a lot of sense to add this. It is not going to
hurt but this is just adding useless compatible to the doc that will
never be used

>  
>    "#sound-dai-cells":
>      const: 0


-- 
Jerome

