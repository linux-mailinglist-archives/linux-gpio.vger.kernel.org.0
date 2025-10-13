Return-Path: <linux-gpio+bounces-27031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9BBD307A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 14:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1163B4E22BB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4904DDF72;
	Mon, 13 Oct 2025 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHP6RLDw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D12252910
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359566; cv=none; b=V6OSUDx2ayC0KihML9u1Qn5i83190n8pUUorZxc8PV6k9YEkyZeWK6lWsPyNFhoDwndQAQk2d1UO4FusIOQrKz1WdfdVZ32TiEeZiYWzTlYT1YUeOraqQ0zCV2OUydTuqrLLywtaCZBaBVkH0esElkn/KXYgdY8ovqQS7PVrb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359566; c=relaxed/simple;
	bh=JpkIi/+vhaU0BNI9/P+j1qfp8E4UfRVJu5ZcRjrM5jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIIoIlso0EHaRLShrpcUJv/Ykjl4u5Ul9OfPjE/gMG7XZ4Yh+fCgLi/3t9AupNNBDLuguU89TWrFCnQFxfKCo5P/McQjARCDIiXm729U9nUQKKHFyBIEjTp2iT4UG8ejK5SpXTAPcuwTXjIO1Ry+GfA+kboHkpSl26aG8BG5rcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHP6RLDw; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-376466f1280so16519351fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760359562; x=1760964362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr0CAioySbg+winRW7SfP2+jGITybsbqsD8lEteT+kw=;
        b=aHP6RLDwb0UG2uPMFu+XHDG3kF+N7eCxd/Ka/asDGgCNbHTIKKuXZSEMQW63BQP5+J
         3Fm3A8yjdNcygmUxPD0dxoBPCRBFCkdQHaIHUNd4JKIu+KlodAf2i8fNXSdsx5WDnfUQ
         ibmWCNbjVfzi9LjChJ/HBXACzVLhWJH7YUypITyzjf0ewOmsgJ1zqTN8R9EHXOK83hvD
         QmEMqLweAgmok12WakNdVjOBQA6AzLEZsHo21wM1PmKh9XgpqQ5RjHHgH7vp5z1TaZDQ
         rWTBZfkyh3L4Spo0aXEFXaJTzAY8C1DU3xjrjlpMIs4U5bxeHGSh+dxJj+9aIbcz2kr6
         XNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359562; x=1760964362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr0CAioySbg+winRW7SfP2+jGITybsbqsD8lEteT+kw=;
        b=fxNHQAf97+OM63KjyZvNwQnWvJiVp/iBNwQifIgLi9WCJe19rLjnaJQu6gf8aSOM/5
         b6EJby9IeiguE0pqDspazVwZRts/OrlYBMzI2TePKyhz4oUOapHRE6WK8xfioMTntxQN
         VP2RAPMu/Vf9+1Rft8g9TRGtYe20TMZ/8ZAz9OU1e/okVIl4T6np10FEBKhLDuBLo3/G
         op8oIdiDsaLmVvFpU/g8oOgM5M5XVca+m4BI7hybKQNyi4X6SPrRTKk90th7jXajtOl1
         jJvEuIVpJIYf+whigewxagsl5iepMS544gwNIfjEJAncnl9UtnxUUECiEQG78sjOHZdJ
         /kJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi3+2PNykBPG5z2AbxizjhuMtxYgHLKWWQQN2/qBOovJLDxTYs+YTSAhNNR98n+PRnzqwArL2S4Toh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1FF6nT13HFjxtXhCg+6PkuQ4+Oter8oxr2fT/wNPVPusZIaf
	tMFgvO4rcKLwFkoLt021xUR4558vf4keBwO9+Rf17pl5SYsYyo8DQfVuylYHkuQkCc7KIElShYG
	WeVWj7JPxbbyUW+ox0oiyBAXcrf402+4j99KqvVk9pg==
X-Gm-Gg: ASbGnctH6hWHl0dCjXjN0C7vQEz4RldedVKESsWNoEMthOjAhgGb7Pk5aCxycI+DQEg
	znm44CFe69aKnssimsS45TJrXRIoDTNW0nlS9nr367BX+hHo8PjP7ZbPp4cftkoiVRLgw6gmj/p
	DzIIJTtoIArfmBJD3JJfurL9Co21McYp764N/SKTi/+HTazJX71xNZzwlu+YsLYMPoJx9PIgaw2
	cJgotuKD2jOvIMz3xkWoRiqSg3n+2XNqT4R7mw9
X-Google-Smtp-Source: AGHT+IECEgvwWZ6twWsaItTnYS8HV/K8Xbz+foZN6OXGOnnvuhf5OIE7J2dBzITkBTeCj2Oicn8ol15+IVgCGD9o8F8=
X-Received: by 2002:a2e:9a10:0:b0:36a:a401:628a with SMTP id
 38308e7fff4ca-37609cf85d9mr54890731fa.6.1760359562017; Mon, 13 Oct 2025
 05:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com> <19d537f9920cae5fa849b649e5bc42ba0b8e52f8.1759824376.git.mazziesaccount@gmail.com>
In-Reply-To: <19d537f9920cae5fa849b649e5bc42ba0b8e52f8.1759824376.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:45:50 +0200
X-Gm-Features: AS18NWBXkMvQX4UMEqrcFAQn-COI9GhJKLnUY40gmxEPa8GpJstGMsxg8s5ctP8
Message-ID: <CACRpkdbHBQQnnTUrUzOrYxzQKCzDyy8aNK7w8OEFz-ic8ic1FQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/13] dt-bindings: power: supply: BD72720 managed battery
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matti,

thanks for your patch!

On Tue, Oct 7, 2025 at 10:33=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The BD72720 PMIC has a battery charger + coulomb counter block. These
> can be used to manage charging of a lithium-ion battery and to do fuel
> gauging.
>
> ROHM has developed a so called "zero-correction" -algotihm to improve

algorithm?

> the fuel-gauging accuracy close to the point where battery is depleted.
> This relies on battery specific "VDR" tables, which are measured from
> the battery, and which describe the voltage drop rate. More thorough
> explanation about the "zero correction" and "VDR" parameters is here:
> https://lore.kernel.org/all/676253b9-ff69-7891-1f26-a8b5bb5a421b@fi.rohme=
urope.com/
>
> Document the VDR zero-correction specific battery properties used by the
> BD72720 and some other ROHM chargers.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

> The parameters are describing the battery voltage drop rates - so they
> are properties of the battery, not the charger. Thus they do not belong
> in the charger node.

Right!

> The right place for them is the battery node, which is described by the
> generic "battery.yaml". I was not comfortable with adding these
> properties to the generic battery.yaml because they are:
>   - Meaningful only for those charger drivers which have the VDR
>     algorithm implemented. (And even though the algorithm is not charger
>     specific, AFAICS, it is currently only used by some ROHM PMIC
>     drivers).
>   - Technique of measuring the VDR tables for a battery is not widely
>     known. AFAICS, only folks at ROHM are measuring those for some
>     customer products. We do have those tables available for some of the
>     products though (Kobo?).

It would be sad if we later on have to convert it to a standard property
because it turns out to be wider used than we know.

But I buy your reasoning!

> +properties:
> +  rohm,voltage-vdr-thresh-microvolt:
> +    description: Threshold for starting the VDR correction
> +
> +  rohm,volt-drop-soc:
> +    description: Table of capacity values matching the values in VDR tab=
les.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Which unit is this? Seems to be capacity in % *10?

> +  rohm,volt-drop-high-temp-microvolt:
> +    description: VDR table for high temperature
> +
> +  rohm,volt-drop-normal-temp-microvolt:
> +    description: VDR table for normal temperature
> +
> +  rohm,volt-drop-low-temp-microvolt:
> +    description: VDR table for low temperature
> +
> +  rohm,volt-drop-very-low-temp-microvolt:
> +    description: VDR table for very low temperature

Doesn't the four last properties require to be defined as uint32-array?

> +        rohm,volt-drop-soc =3D <1000 1000 950 900 850 800 750 700 650 60=
0 550 500
> +          450 400 350 300 250 200 150 100 50 00 (-50)>;

This one makes a lot of sense.

> +        rohm,volt-drop-high-temp-microvolt =3D  <100 100 102 104 106 109=
 114 124
> +          117 107 107 109 112 116 117 108 109 109 108 109 122 126 130>;
> +
> +        rohm,volt-drop-normal-temp-microvolt =3D <100 100 102 105 98 100=
 105 102
> +          101 99 98 100 103 105 109 117 111 109 110 114 128 141 154>;
> +
> +        rohm,volt-drop-low-temp-microvolt =3D <100 100 98 107 112 114 11=
8 118 112
> +          108 108 110 111 113 117 123 131 144 157 181 220 283 399>;
> +
> +        rohm,volt-drop-very-low-temp-microvolt =3D <86 86 105 109 114 11=
0 115 115
> +          110 108 110 112 114 118 124 134 136 160 177 201 241 322 403>;

I would have expected something like this, to avoid the a bit fuzzy definit=
ions
of high, normal, low and very low temperature either:

Provide an array of temperatures in millicentigrades (I just guessed
these temperatures, you will know the real ones!):

rohm,vold-drop-temperatures-millicelsius =3D <500, 250, 100, (-50)>;
rohm,volt-drop-microvolt-0 =3D <...>;
rohm,volt-drop-microvolt-1 =3D <...>;
rohm,volt-drop-microvolt-2 =3D <...>;
rohm,volt-drop-microvolt-3 =3D <...>;

Where each array correspond to the temperature, or if you wanna
go all-out custom:

rohm,volt-drop-50-celsius-microvolt =3D <...>;
(...)

So we get the actual temperature in there one way or the other.

> +        rohm,voltage-vdr-thresh-microvolt =3D <4150000>;

This property seems to be missing from the bindings?

Yours,
Linus Walleij

