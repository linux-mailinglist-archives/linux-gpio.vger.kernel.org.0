Return-Path: <linux-gpio+bounces-13335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F049DB68B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 12:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B8982816D8
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 11:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C92B198E6F;
	Thu, 28 Nov 2024 11:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wVfK9c3O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E2D194091
	for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2024 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732793734; cv=none; b=bHA8eRlsPO2o8hN4+u6noHwuvanB7woikBVpYHxPV/c1+IvxJ9ZYybhMxu1GH9WCNFf+DDSeELNpKs2hyDn41UuCLtvZpLWVhxJxmEDjoPPYLyJtFA558NLtZPcVrh+ZiwV0jRDcs0uf8nkYc7W/v4XRvb0i6IfxdAZeWlYTfM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732793734; c=relaxed/simple;
	bh=2Pj1fUblSP8PaDl+D0795TxgYS0kzCMPuBdo/FeKJng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXGHoN/kSEhA5cJysS42xedSYSadIt9mM4jTcSGDmYJzTGJY/6wuJZcL7s99jSbdr8uXe8+IsErnIoyd2JNp8iPJD0ArG/H9xMeINe9X3BlMYm+E/hqqEGDERUBKXmJgt++FNEGV3vR3YK8WYQHux0QBzIBNCuWLkzmOUHChjFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wVfK9c3O; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so6314595e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2024 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732793730; x=1733398530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCOIQgnUZkO/jqB9Ex+fr3L9VJum5V2GDNk+XPGMgrg=;
        b=wVfK9c3OwCC/Lec5h51tYXpq+yOjSQyXqpS/qm9TbOJEOR1AchhRAJUfI12/Mi+Lyt
         7HdToVIUGfSqpSQvjJf0HI/EKi6pD/w8JYLfxGTBnmnToBwDv7UmBnPF8BqRRyybkE4n
         QOvAsBMU9aTTRr6esWVVe+K7JKW0SgjOgHpyPuDP9OuydWFJw+tmmHEo9FWvKczpEcVy
         zYhFVr+Ym9l4412a364kUbHVjuqHwpJHIUSKDLl0NUXWRBxAqRTfPbUtDz5ODfGY3Hlw
         5yzXJGUkEcrWILuqdrsMBNp8e/CBLwC02cYHiJrlKA0Vcs53SyXRyZVDNBXHyvBr/seE
         74vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732793730; x=1733398530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCOIQgnUZkO/jqB9Ex+fr3L9VJum5V2GDNk+XPGMgrg=;
        b=lXGgndyQtalgOrd4ipXAnMgCpqbVoaNXM7UebmTDsBAshb3yYe5C7rxAUAzvxLQc2X
         U8ROgtN1fKz2QJ8XN/TEPEBcQ9e1tjM+CugrTKMw2374bSii+WTrADuSICCkWk+M6AFs
         PoaBhf7b7GM6mcEVO7YJ8BHOjsEpiLmxPI2ZyW9xBmepc/C1OxeU+SGakAQD4tXhG4FV
         VnCkBaqZewoUs3xAT60O2m3Xm9k2pKtTnsQfv7rScNFNc4HkxdX8tGh0m/oJNKUw2JEv
         cw63RZ6Rx4pc/K7Yj9HN2URkhMDFXzo8HZQf2J73ZzHy/HEkiZJq/WR2s1i5+4Q+D3ka
         PDXg==
X-Forwarded-Encrypted: i=1; AJvYcCXRWq0n4V8xCVgiGeHp9SxlGr9C5DkfV3iq3hoMZgFeM31xMwapC2y7rbt5gC7CE0HkmcGuka5dYRX1@vger.kernel.org
X-Gm-Message-State: AOJu0YzTMBrNhRfMmxFaPcgQ9xL/AD/S0/qI/s8canRrPgUyqgl6B70Z
	EEaVmjgYhUIqy5b3nW/rvkj/Cma2RKB0y3PYgX2xJoFtRNPyBsQqJ/pUGHT7biE=
X-Gm-Gg: ASbGnct8J9qEKGeWnRTLb0/iuhcceO2lrR3aBfhHYwfTsEPX7qm6OpjEpTnoYK25vDa
	ztx6KmQ8AN6nWkIdgfToV+yRYfxI1KcXsblAElJVymHef9v+jni2IYHScr/7rqCLGrmZZZ/0n37
	LPwcUsOoyRkQLwpVpJoVbX5b9zJDXlLDhKDZYjFCE+XpYyOfRkLLi7zCVb62J9xrhmTY3aDtZub
	ukz9entWwjR1DfdkdLMuCyclsFgi5+ygYDeEinDy8MY+SaH6Dsb/9U=
X-Google-Smtp-Source: AGHT+IG/QGzHxGJz0klm9sFCiR3LVKh0jcQoJ6xPyeZV35wmMo8bYcQe6yA7O0WiSbRm+oZHxykDMw==
X-Received: by 2002:a05:600c:1c81:b0:434:9936:c828 with SMTP id 5b1f17b1804b1-434a9dc3db3mr63654675e9.12.1732793730439;
        Thu, 28 Nov 2024 03:35:30 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm50520155e9.43.2024.11.28.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 03:35:29 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thierry Reding <thierry.reding@gmail.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, justin.chen@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: brcm,bcm7038: Document the
 'open-drain' property
Message-ID: <7hdopmy4owoletyq274c2hzxtm7xuxaejakwlas477ax2tfzcu@yrbcxxup5krz>
References: <20241012025603.1644451-1-florian.fainelli@broadcom.com>
 <20241012025603.1644451-2-florian.fainelli@broadcom.com>
 <20241015163200.GA1220909-robh@kernel.org>
 <252b6f39-3b06-43b7-b227-1c29c1c12bd5@gmail.com>
 <7aok7zs7whxfg3bhv7koxfxq6qhgv34b7kg3mh526z2cf7e23l@ffbsxqdqjis3>
 <c623075c-fd80-4312-90ba-4f8a3c3f56f9@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdxu4r3m4vrnf4px"
Content-Disposition: inline
In-Reply-To: <c623075c-fd80-4312-90ba-4f8a3c3f56f9@broadcom.com>


--pdxu4r3m4vrnf4px
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: brcm,bcm7038: Document the
 'open-drain' property
MIME-Version: 1.0

Hello Florian,

[adding Linus and linux-gpio to Cc:]

On Tue, Oct 29, 2024 at 09:03:57AM -0700, Florian Fainelli wrote:
> On 10/29/24 03:44, Uwe Kleine-K=F6nig wrote:
> > On Tue, Oct 15, 2024 at 10:07:10AM -0700, Florian Fainelli wrote:
> > > On 10/15/24 09:32, Rob Herring wrote:
> > > > Another thing to consider is for any PWM controller with more than
> > > > 1 output, you might want this to be per output and therefore should=
 be
> > > > a flag in the cells.
> > >=20
> > > Yes, that is a good point, this controller has two channels, so it se=
ems
> > > like increasing the #pwm-cells might be the way to go.
> >=20
> > So the idea is something like:
> >=20
> > diff --git a/include/dt-bindings/pwm/pwm.h b/include/dt-bindings/pwm/pw=
m.h
> > index ab9a077e3c7d..d18b006a7399 100644
> > --- a/include/dt-bindings/pwm/pwm.h
> > +++ b/include/dt-bindings/pwm/pwm.h
> > @@ -11,5 +11,6 @@
> >   #define _DT_BINDINGS_PWM_PWM_H
> >   #define PWM_POLARITY_INVERTED			(1 << 0)
> > +#define PWM_OUTPUT_OPEN_DRAIN			(1 << 1)
> >   #endif
> >=20
> > and then add support for that to the core and drivers? There is some
> > intersection with pinctrl (depending on hardware). I wonder if
> > abstracting this somehow using the typical pinctrl properties would be a
> > saner option??
>=20
> But what if the pin is not managed by a pinctrl provider?

Then create one? If that's the PWM itself that is the pinctrl device it
would look as follows:

	pwm@f0408000 {
		compatible =3D "brcm,bcm7038-pwm";
		pinctrl-0 =3D <&pwm_pins>;
		reg =3D <0xf0408000 0x28>;
		#pwm-cells =3D <2>;
		#pinctrl-cells =3D <0>;
		clocks =3D <&upg_fixed>;
	=09
		pinctrl {
			pwm_pins: pwm-pins {
				pins =3D "A", "B";
				drive-open-drain;
			};
		};
	};

Maybe this is difficult if there is a pinctrl that configures the output
as "PWM" and then there is that additional register in the PWM IP to
make this pin open drain? One could just use

	pinctrl-0 =3D <&pwm_pins>, <&system_pinctrl_pwm>;

then. Not entirely sure this is overengineered, but the dt
representation would be nice (IMHO). Thoughts?

> I have started
> going the route of implementing the PWM_OUTPUT_OPEN_DRAIN bit as an
> additional specifier in the #pwm-cells, but I am not sure to what extent
> this should be allowed to be changed at runtime.

I would not expect that the open-drainness needs to change at runtime.

Best regards
Uwe

--pdxu4r3m4vrnf4px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdIVXwACgkQj4D7WH0S
/k6l6wgAgyzQfpcTmTaXfhmcQgO0kIruIbqxl2BdNvTxhqNU/I5oBRJJuMYj1SUe
9pnH4y0xPYoJvxdl4eWLPeciRP7AUPs/Q1zNpNiPUl74qBx3AvtNZC/7qnpZyxCQ
oRfEvy2HXuKjl55nzB6Luj/iKD6hMjoK2jB0w/zz61YAELUzm2j3i3HItQbFZ06W
2DIrXEybGNkNmru7ii2Wy3Yg0EsOxZucprF1DwUHAoCNMW8hOX3uWm2y6gEugeoe
vPE9Wfh2WspzKNDeNHqi/P02u+YBqzEmEd5gJCqHvgCFxr0DTJnpItxTJ0FP6kot
LkRkktFKEOszoHombSsUnCUz8Gj99Q==
=hSKz
-----END PGP SIGNATURE-----

--pdxu4r3m4vrnf4px--

