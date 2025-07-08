Return-Path: <linux-gpio+bounces-22911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C8AFC548
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 10:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80F253ADAD3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 08:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494F929E0F4;
	Tue,  8 Jul 2025 08:18:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF6F184540;
	Tue,  8 Jul 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962736; cv=none; b=sYHRw2Y04B0RII2MmAY/czO96RaFA0Id4vGtyZ0XtfR24E3zU16wZN9dETqRC3ppvfYsWRfxvEAm6ZWiKy+8cWg3RGaRaL94Mo136ldG2n9R3GLEX2KRp0XHD9AtEBlzyDT1dKJ5ZbKqsut0HPubWZOeUKm8Ly+oO2a7qzPzfZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962736; c=relaxed/simple;
	bh=403iFXS8Ya0K6jMaeM+1AN9CNalmRymO+IoXF72ZOak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4j8K2mqCZiQPaUpM0zWV9Mt+cMAHxoelPRuTlv4I29fFMz56mI1DeY6SXZU+B0r26xk1TfNjcB0Rt91IYPpw9TI5V4RFKBnHB5mrFQvynGlHnf1jWGnXM9W3gLgGCWruWB0mRhr8ORWeXfPKYY+ncnxLc2qjwKi6SgJlpbf3G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b5165cf5so4835117e87.0;
        Tue, 08 Jul 2025 01:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751962729; x=1752567529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8a42AL8Gvhq3V8KbpdB8ciKkimXt8q0Er3Jq8Vtdrk=;
        b=dC8gK9iImArxK0ewR+/hAC9uKwi4beNVtZYFiyb4MxfXDq4ndBTOEYokpDdtUopajP
         w8w8GNoMsOnKX+5HJtgwdFK/pEwV3g/NGiK62WoE7zdfo0YJ9S3rmQyMkrfyhzP2vTao
         59XEg3R1ewfGkVb/OYikv7GWRkL4d/HhgcObTIp1lhn9BbTeEpd6lf6FOoOJWJoA4dbS
         tCsCPJWlRTfkIJl55ICvMuK3AC2eNtd33aT4iCMMSzcnqniF2tmJG0/dmM+akMRF2i9p
         E3i+Ub/+aaORIKV9xX4Xlt69S3vtNkkCyDBoXG3Tyypq7cGf/VQNE/rZjRgtWc9op/Ae
         2fkg==
X-Forwarded-Encrypted: i=1; AJvYcCW8h5nLuh6qkJxizoemTjNlHy7XqADoFfeiML8/NR7cHfKBmwbH+wTl2xltb6++ju90+eK0MS0t1ZZKnnu2@vger.kernel.org, AJvYcCXU2cmhDHVuxthoda5NK6z2qB4cn/f7x/ciZ/k2nyWn/jZ84FzkZ4AWaQ8Jd2y8hTLXYeiwNw2jhliTRA==@vger.kernel.org, AJvYcCXrbbf3QOJZtycSYEW2ZZDnOivzFARNJyT4ftUfQqk+WpZ8ReRuSpU7OOGCNsWuDZmYGBC0oowqNlZO@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRnAhFh3IxBm8ndZhNYkltEX2UU12anSUDNftcn8o0m5CdXQC
	TJWVT4AhKmV9yy76Gb/er5fjVLVib64hTVx+Vzo6JvgNxN86EpXXnrE4u8WWxs2O
X-Gm-Gg: ASbGncsm77VlFPbC236e0vE4QlOghs87C7yY9FHFyEJHHactEwv8cb6mNuJxzPuMTXw
	OXgeSEpiLokyQGUgTYlrd9yI6U8bcfSq/hkOzPPUv7VfvGhsjLvfb2T8ZxBS6NuwMsGpWLtpwqK
	4dHYTohotMo0YLXfGrt6ri2P0HOtXC4XnsXNEgQYQxZr9UxBg4cwsDnVVHRZqEc3hcn7J874YFz
	4Lh9W/UxaA9wvPItiaIX099Lruvvh9gha37yluzBKLqMc9aAr+ZzgsKVV1zIyx35sjWU+z4q9Ws
	/XxQ8ERTlc9bXRDNUpkcgL9GmXsx/ea5KH1QV91P0AGEkooqUN59A7xSwEcRntiFik+NIiO2GKM
	VfrL1Yqoe+nJL89COXE0=
X-Google-Smtp-Source: AGHT+IHYt5Lg0JN4NJi8MRSpSPD+Tufui4In5TeML5aCRkfha0qkhhnz35uqKdrzafk9Use7UEbtig==
X-Received: by 2002:a05:6512:401f:b0:553:2c92:fdcb with SMTP id 2adb3069b0e04-557f82f5730mr666668e87.3.1751962728458;
        Tue, 08 Jul 2025 01:18:48 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm1595519e87.178.2025.07.08.01.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 01:18:48 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso40267141fa.1;
        Tue, 08 Jul 2025 01:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBogyYUKiJVLrPeW/EhgzIxgJM3l2eG2lXRRUedhFeB/4AmG4j4X2iV/VA8edjttw/WE8QDKhMJTI+wfcM@vger.kernel.org, AJvYcCWZUvZn7L4INbgiPuC91mj17RKfdG61dRC+p0OXRGMTPUo9PKSEHcW0gkpuk5KWB5f40eQTlIBI8xlhzQ==@vger.kernel.org, AJvYcCXTmgKPEEdia8eHFV1Hkj7gRA8Aj3sW7SJfUVj4dk962MskVRXnVGTqd9/E1FOF9Mf7rczeuiXEJmvu@vger.kernel.org
X-Received: by 2002:a05:651c:1a0a:b0:32c:b83d:64ab with SMTP id
 38308e7fff4ca-32f39b07025mr4745291fa.24.1751962727665; Tue, 08 Jul 2025
 01:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
In-Reply-To: <20250708003348.58fe509f@minigeek.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 16:18:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
X-Gm-Features: Ac12FXxSawVr5l8DSW2OyggsnlD_AQQGgECd75bIDcC2Q3K6HqehhpaNB0rYrHE
Message-ID: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Mon,  7 Jul 2025 18:51:55 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> Hi Paul,
>
> > The Liontron H-A133L board features an Ethernet controller with a
> > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> >
> > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > order to let the MDIO core properly reset it before trying to read
> > its identification registers. There's no other device on the MDIO bus.
>
> putting the PHY reset GPIO into the MDIO node is a clever solution, I
> was struggling with putting it either in the MAC or PHY node, though
> conceptually it would still belong in the latter, I think. But this
> might be a more generic problem: for most other devices we activate
> reset and clock gates *before* trying to access them, though this might
> be historically different for Ethernet PHYs.

The phylib core has code to deal with reset GPIOs listed under the PHY node=
.
It might be worth checking why that doesn't work.

OOTH, there's no code to deal with regulator supplies for PHYs.

ChenYu

> > The datasheet of the PHY mentions that the reset signal must be held
> > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > be on the safe side without wasting too much time during boot.
> >
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>
> Despite the above, this looks fine, and works for me:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > ---
> >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > index fe77178d3e33..90a50910f07b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > @@ -65,6 +65,25 @@ &ehci1 {
> >       status =3D "okay";
> >  };
> >
> > +&emac0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&rmii0_pins>;
> > +     phy-handle =3D <&rmii_phy>;
> > +     phy-mode =3D "rmii";
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio0 {
> > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > +     reset-delay-us =3D <2000>;
> > +     reset-post-delay-us =3D <2000>;
> > +
> > +     rmii_phy: ethernet-phy@1 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <1>;
> > +     };
> > +};
> > +
> >  &mmc0 {
> >       vmmc-supply =3D <&reg_dcdc1>;
> >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>
>

