Return-Path: <linux-gpio+bounces-26523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B976DB9556E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 11:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81F37171499
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 09:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA65321264;
	Tue, 23 Sep 2025 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="haF24h/w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E348130F943
	for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758621346; cv=none; b=TyI3lw7yydMYYYg8RNhVQ9EZOxf/b1303PtkWtnB4yRsP1XQVh5vd7SqIUlOiIA085IAv6rMUStOAMpzZ5/NE4Zlg7n578Up1urKh78PGFS8NSoQobSvHn27ansPMipQ0PZk88+6vNBClQyoEPbi1vA06bo2SbY3hCtfqvaMbl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758621346; c=relaxed/simple;
	bh=e5NOGt0T1QOZxsKIPNmxZjkQ42IMvdnLCXJEh6LT0RM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=untaQqx9lj1UI4Ei4DMp8KS9oIkdwKI+sTH6lkLHHrNuJEYbmcOShzu3rlbMwSdCZgKHcUDQ5tcNrDJBp7d85ms6RSe/useiafXUCRYZYmljEsCR7XG17p6wBe0TIwx4ISjE8rKKrnLNR0WDuxPuk7m80/HQ4CR29I1w1IUGSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=haF24h/w; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso8624982a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 02:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758621342; x=1759226142; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ4iR0ikwChD7GAZnfT4r7240QnDqgcDQ/DHGsIuO5k=;
        b=haF24h/wrJPNnq2IKcLfxamIIVmyfAVz3ySeeAziwS96OL1SeDhCIiqlWF4E2eueiU
         LZ5vfILTwTTJ1dO5nZ695CDsD9TcarihFxjCNVZoN/0Hg1p/KZp3RtTg3mBoGFqvLps8
         ynI+pIUhDGeN7hRVvGDpJ2rrD49kkb2sLEdnV6ZXa1ot+QLkkK6uwsOnmmMlMKeQBRhf
         D67J3hRYOEtpm0x06YWsPhuTCdDDJtcdxZcF5QRV9Y0f00uEAlaY9Dq5VhAe/q/qfic2
         XarCYdkmAmP+trDiAHj5wC6oqYBOxwi8e4Z8SZhW98xkhA3fE4UnWWZGbcW4yD8tG+DQ
         ZOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758621342; x=1759226142;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJ4iR0ikwChD7GAZnfT4r7240QnDqgcDQ/DHGsIuO5k=;
        b=cSUAg1aqRpm+E/NXjPsD2MlNmFxpDXhvxg8vlhjgff5jsknl6bcm4RHsQfdOme/t+5
         FwCK/nT7pe3RGIPWjalavNXuAYWboEo2d5K/KYpk6JUwGevSU6rNA1DREy7Td4ep55rn
         rNzmIJAJHlA+iSqEIOuxSDnKgbTTQE2vkkCjiYK76su8ZUK9rRFfYHnWnnw0ix3IEaWf
         Ehh3UJSftKS+c/xNZpaTib3Tcsei0gPFx9jRBQS9lr2WZrYP5uJ8M1hoVT4YRPGv8jcT
         heCCii1pwTwfcMmS8wbTCXeKTN6PHq9TL/vDg1VDHIHVobBYscXGRPh8yLgf1PjWlew9
         gyww==
X-Forwarded-Encrypted: i=1; AJvYcCU0Ymg0eoFZ4KZCA7sagDVEAcvQX1215voQJjo81qK9fnW6wTQE8ENlzM6g9VmdlTRcvDiCRLpbMxDb@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCRrsEcvnnrgrx9EBkmKfdNS+vYCMPWnBPN3dD12CwW9ASnDA
	ILICwG4uAyCZxgzbOOJhtxXjR5ErXo7FImqkAKYWpNht9EapCwibROBT2t/wFvSbOuM=
X-Gm-Gg: ASbGncsuXKD4Rv+rjjUdcgaQlrVYmGxoYiN4GgcH7/8YNbi27vuEpY71CENuScOK655
	zqTHhSaqHUWghLjE/th+5/VzSOC2snA0ezCuNyRkJMu1QzFFKbSiHobq/Bi3yjY8/haAbHKFsTK
	1XQJUwXkGFEoUYFFwA/len/s629jkrKtt/bxcWSsWb6zc99xtikoGnlI/IAZT/o6x6k7fpOZ/ES
	9Vjf5UHGpwLiIopkVDcXpA1ydxwyz4w6WSdXAZeY7KdO/1y4WqkPChe4oGwOkwVhcPNP4VfQFgc
	00hvrUu8dag+W0jSi3IeukGYreQDBMdlYXrh9gfC28FpFbGpRdSM1r7ZnilJVLrgG/8MLz33j2e
	s+DIbaaTWOyWfwig+VL8n4UoeCZqedbes9ETBuXeDg+n3poI2C0HO9qno/DcyV/qrSMjb
X-Google-Smtp-Source: AGHT+IF4qTxhg5Hb9sQ/tJAzBa4Ees7FfG50FOAI9GBuf35fyxLYwKPlFRuv+uHkCbA78L9NSJbk0w==
X-Received: by 2002:a05:6402:4389:b0:634:4e0:8360 with SMTP id 4fb4d7f45d1cf-6346779a012mr1708846a12.2.1758621342052;
        Tue, 23 Sep 2025 02:55:42 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5cfa6f2sm10771105a12.6.2025.09.23.02.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 02:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 11:55:41 +0200
Message-Id: <DD038IVOWESM.24X3EZZXH3UE@fairphone.com>
To: "Pavel Machek" <pavel@ucw.cz>, <barnabas.czeman@mainlining.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephan Gerhold" <stephan@gerhold.net>,
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Lee Jones" <lee@kernel.org>, "Joerg Roedel"
 <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, "Robin Murphy"
 <robin.murphy@arm.com>, "Konrad Dybcio" <konradybcio@kernel.org>, "Sean
 Paul" <sean@poorly.run>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Adam Skladowski" <a_skl39@protonmail.com>, "Sireesh
 Kodali" <sireeshkodali@protonmail.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Abhinav Kumar" <abhinav.kumar@linux.dev>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <iommu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <phone-devel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <linux@mainlining.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
 <20250831-msm8937-v7-6-232a9fb19ab7@mainlining.org>
 <aNGLPdmOyh/pfroq@duo.ucw.cz>
 <97ee369f6ffbe42c72c57ebd72887b23@mainlining.org>
 <aNJKniJ46YuUsbQ+@duo.ucw.cz>
In-Reply-To: <aNJKniJ46YuUsbQ+@duo.ucw.cz>

Hi Pavel and Barnabas,

On Tue Sep 23, 2025 at 9:22 AM CEST, Pavel Machek wrote:
> Hi!
>> > Hi!
>> >=20
>> > > +	led-controller@45 {
>> > > +		compatible =3D "awinic,aw2013";
>> > > +		reg =3D <0x45>;
>> > > +		#address-cells =3D <1>;
>> > > +		#size-cells =3D <0>;
>> > > +
>> > > +		vcc-supply =3D <&pm8937_l10>;
>> > > +		vio-supply =3D <&pm8937_l5>;
>> > > +
>> > > +		led@0 {
>> > > +			reg =3D <0>;
>> > > +			function =3D LED_FUNCTION_STATUS;
>> > > +			led-max-microamp =3D <5000>;
>> > > +			color =3D <LED_COLOR_ID_RED>;
>> > > +		};
>> > > +
>> > > +		led@1 {
>> > > +			reg =3D <1>;
>> > > +			function =3D LED_FUNCTION_STATUS;
>> > > +			led-max-microamp =3D <5000>;
>> > > +			color =3D <LED_COLOR_ID_GREEN>;
>> > > +		};
>> > > +
>> > > +		led@2 {
>> > > +			reg =3D <2>;
>> > > +			function =3D LED_FUNCTION_STATUS;
>> > > +			led-max-microamp =3D <5000>;
>> > > +			color =3D <LED_COLOR_ID_BLUE>;
>> > > +		};
>> > > +	};
>> > > +};
>> >=20
>> > That's single, 3-color LED, right? Please see LED multicolor support.
>> As far as i know aw2013 driver does not have multicolor support.
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree=
/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
>
> I believe that needs to be fixed before more bugs are added on top to
> work around that problem...
>
> ...and before that bug is cemented in the ABI.

Honestly I don't think it's reasonable to expect people contributing dts
to then first start patching existing LED drivers and adding support for
x y or z to it, and block dts addition on that.

At least in postmarketOS the user space components we have (e.g.
feedbackd) detect the LED things (and most others) automatically since
various devices have various different setups. So once/if aw2013 gets
multicolor support, the dts can be updated without problems.

Sure, maybe today changing something on the N900 which would change
sysfs paths is not the best idea because people will probably have 10+
years of random shell scripts lying around, but nowadays we usually have
better ways of abstraction that can handle that.

Regards
Luca

>
> Best regards,
> 								Pavel


