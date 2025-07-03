Return-Path: <linux-gpio+bounces-22689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31806AF6B16
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 09:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F42189D789
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 07:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6CB29550F;
	Thu,  3 Jul 2025 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwfpphQV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE26AA7;
	Thu,  3 Jul 2025 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526506; cv=none; b=u5RUFL6i487jel4GQH1ZfWgSL1IEONRKehB9ZrjmaMgKV/oAbhVx77r8wP7RKUax17Lm18R0bPpzNyQKraeUzTQ7vu4PDRgOWQdpBgllL5v1JpoXt+roQFl41UcbDZM2DB+2Okdthfg2oEfte3Mj+NSN5kMq7zSCyClhUIiodDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526506; c=relaxed/simple;
	bh=yYjCpeuYQtQNuaFa8dZMG9K73OIB5Fzop4v74jtN3mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/n2PdgvQF3v+Zb1wxHTDBwfK+roPggi8S3pAa0kk4AkhKelJF0ZTb7xK7pFXbk/uMqWS5M0AORDD+tsAu/Slao4/Dm8J/Vp+RzqD8HBb9J1Pyi3uCM5lWqw0QG0zTT6IppdlA0swC/MLzGoArLM3lgqIUU+e16ZxBfxfT7kLYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwfpphQV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d54214adso54533425e9.3;
        Thu, 03 Jul 2025 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751526502; x=1752131302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Knet8d8KkTP4ZKAEfHfgU7X+neJwgTW1V59mQo4vcKM=;
        b=IwfpphQV4++ecMDF5lvNsCugup+C10YG3dNgyTdPhZam1asonw5ifYZPmaRLwa2h+p
         IPU7H26GowrDDO0YCUyaw/to+XdUdyM/JYAwqzj6kHX6njxL4mYwxz7JYR3jOQ8x1VPj
         SDsd8oFJSq7iW53t8ok5UssoUarLZXsljbxxbbYBQRXtvJKG83IJlChxuE41/Sw5HG9V
         2QPpJLgluCwIrw8m3CX4QwuWdJr88OcFCRJPDy/o951xDEpKiv81wq5po4/hve8qoNu4
         9JN/wLq1W2+hKKMk0gyQN31CK7Q+vz+MVjhjEEMi4AWWDJdv0zEv11y4c2MYPzZi0tG2
         zXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751526502; x=1752131302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Knet8d8KkTP4ZKAEfHfgU7X+neJwgTW1V59mQo4vcKM=;
        b=XTqNt63bYrvMsFgsGzKkplzzKBhJWtLst9eIdr2839BduOWHgsraBzhrF3mgGIdafX
         yYVJzpTLcYyujOEe73jgE2P0Ntb+Nv7WFPK9jly81t7Udzq4vIfzdhV49Wc1W4xiMjP0
         na/cRqhVq36thCUx7tr8guWCjFIcotB8Kjd5TgVawFQgsQoV5rUVJ35OqI9PF9KX+6C8
         gS9BfbLLesM+LEtS6a8crRaVtmYka4mHQ0hVTJfIfRcwTl3XVWFdRGw532Xm7RaSBtPh
         cLqqiz7j+7S0BHQ5edVDV4lwNBK2c0AsGphavMvYwhfc4ajizO1LaqZ3pD3/JIFh30iX
         A7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUezH/qbZq4S5RLjLJQOdF+0FemJD/LG/lM8iRMNYdaotkVSC9RvQyzPyXr6wXkBKRHU+iQDdXFHQzu@vger.kernel.org, AJvYcCUtwAWx4YrjFBq0N+mE7XzWVWIehNDZc/eIvS23fH3X4gGh6GDICZLgd6PWU5XIGoAf7ZCCVTHXP8hrcg==@vger.kernel.org, AJvYcCUweakHDdF/mcQ5sEjIxOV1IFVXCyx4rQioiSAUpGsSFpDPXfvP9GjFZTuOOkOfG40Ur7g1vS/Toi+z6fEY@vger.kernel.org, AJvYcCUxpim4fHL2OJR6/h7H8/AC3Thbk7jC8XZFb0o1umSc/4ZD083lFymc1vQbTaLw0pTz/a04A+xlc40rnk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzGlklX+uspa3rmHwiL/TTnbFe1x1WfnuwR0pm8e1Rt0H+b4B
	VOoM165YuEAns7jmMTLE+iqH5Z/rJG6OTwZ+m5cNyDNmmXAdACr5zxZK/TyLXQ==
X-Gm-Gg: ASbGncsU694b7FTVl9/VTQf3JM2Zy8rZKfDvBHfpQxdYEjjPGsa59YS7LLCdV90q8f8
	KmW1d+xdhban2Txn9Y1HdLxs8lF1MABR2qkPeYgcq2ZG8+PIWEyofL9NrZJaNH4FMotcQHefQVS
	Ofg0b4fN0qpDM9vpe0YYfYzkqdHK2rVNlnb+QetDWvIVlmLHv//UKu4uE5BEkz26OFbdofNwuSf
	Q2oMADmLDJ0QrhUCIzQXdhm2fa5F09lK55me+yB06V4IhuZRrvHBFAgG5gWJs1BJorCOBPJam2o
	BJITqWbu+idLpS1vkRIu2+ftGHAro1p2wuJ0dA99wv6oPzSFf4xpx8ofOVhpz9Kw1zqUJ45coyv
	ooD0Gi/u7ig8sbkfEZWIXP+MdCokWS2xEp9QZyYiISPzXzyGS
X-Google-Smtp-Source: AGHT+IFrLNW/KIKZ5DyhBIbYT6nPlrNb+rcXVcHkFVFnd/2G5k9pePw1ZCLmWlYDRnQYIaVmWuDvtg==
X-Received: by 2002:a05:6000:24c7:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3b1ff9f58f0mr4105638f8f.27.1751526502223;
        Thu, 03 Jul 2025 00:08:22 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e9d1csm18062931f8f.13.2025.07.03.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:08:20 -0700 (PDT)
Date: Thu, 3 Jul 2025 09:08:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
Message-ID: <xc72g7j7png443pjxu2wpsuqofgrpxvn43emkt3rv5qrjzf7vt@qzvsiy3eakub>
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com>
 <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
 <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
 <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="am4ud672vipjc4px"
Content-Disposition: inline
In-Reply-To: <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com>


--am4ud672vipjc4px
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 02:23:42PM -0500, Aaron Kling wrote:
> On Wed, Jun 11, 2025 at 10:23=E2=80=AFAM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> >
> > On Wed, Jun 11, 2025 at 08:58:49AM +0200, Linus Walleij wrote:
> > > On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Thierry Reding
> > > <thierry.reding@gmail.com> wrote:
> > >
> > > > One thing that's not clear from this patch set is whether we actual=
ly
> > > > need the Tegra186 pinmux driver, or you're only adding it because it
> > > > happens to be present in a 5.10 downstream driver. Do you actually =
have
> > > > a requirement for setting pins dynamically at runtime? Do you need =
to be
> > > > able to set a static configuration at boot that can't be set using =
some
> > > > earlier bootloader/firmware mechanism?
> > >
> > > Actually, speaking as the maintainer of pin control I hear the follow=
ing
> > > a lot:
> > >
> > > - We don't need pin control, the BIOS/firmware deals with it
> > > - We don't need runtime pin control, the BIOS/firmware deals
> > >   with it
> > > - We don't need runtime pin control, static set-up should be
> > >   enough
> > >
> > > These are all enthusiastic estimates, but in practice, for any
> > > successful SoC we always need pin control. Either the BIOS
> > > firmware authors got things wrong or made errors (bugs) and
> > > there is no path to upgrade the firmware safely, or runtime
> > > usecases appear that no-one ever thought about.
> > >
> > > Aarons case looks like that latter.
> >
> > This was a long time ago now, but I have a vague recollection about
> > hardware engineers telling software engineers that muxing pins
> > dynamically at runtime wasn't safe for all pins and hence we had to
> > do static configuration during early boot.
> >
> > But then along came devkits with expansion headers and then people
> > started using scripts to mux pins to the right functions and such.
> >
> > > I think it'd be wise to send the message to any SoC system
> > > architects (or Linux base port overseer or whatever title
> > > this person may have) that a pin control driver is usually
> > > needed.
> > >
> > > The SCMI people heard the message and have added pin
> > > control into the specification for that firmware interface.
> >
> > I'd agree with you that there's plenty of evidence that we need these
> > drivers, so maybe I need to go back and look at what exactly the risks
> > are that come with this and maybe there's something we need to do to
> > avoid that (I'm thinking along the lines of certain pins being generally
> > safe to mux at runtime, but not all).
> >
> > Thierry
>=20
> So what's the path forward on this? Will this series be used, or is
> Nvidia going to bring back the pinmux scripts and regenerate
> everything in a new series?

Let's bring back the pinmux scripts. I don't have much time to look into
this right now. If you have some spare cycles to take a stab, that'd be
great.

For most of these newer chips it should be far less work to get this
going because we really only need the SoC bits, for which all of the
information is available. For earlier chips where all of the default
configuration had to be done by Linux there was a lot more generation
needed, but newer chips do all of the default settings in early
firmware, so we don't need a whole lot of pinmuxing in DT, only where
it deviates from the defaults.

Thierry

--am4ud672vipjc4px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmLF8ACgkQ3SOs138+
s6GpYw/+M4gpp/wAF2RY4WC7v/y9T6Qqt4pnVptN3CzcT/XmZkydR1ATJpKVADF3
vje3ycw2R7Mx8Rz/F0X51oceYbynSE3pgx9LRV6JsKuIsPPANiaykzp3q32mlKYk
4HKZpsKSsFcuMWk3N3Q9QtS+tIn84EZHcvOxXEZlcMYOmiusWkuQHwdV0Eg001u1
KVAlZJzZj6lqtfnw2fgkpVMz/+haQGgWhAeTN5H34thxZZmdzU8dTvrs3+Nk88p8
6Vqx+VNPFd6Wba6LR0JV8ixkcqUE9Bv7IB5ZDLMTsvhAInKbzo/tQnot1xTfaQvQ
4/7kkWi/P6Ru44GBG2+LFMe4VHO+bXGAjVElRqmqjS3eBeHG+0haD1ZdSTXVj27f
wys0bZ/fiLHGDDwIyLiQ+VY3xxp+t+TkOYz2moq0P4WaOVjBFb0700lpCyh/yFW7
TdEOSzoFJzwKfpdvDKBswoD/g2j21QW5awlqLKjBEhUs30vz8VqVTlWrRlmYWVf6
DdqmgtYs+wYwg5Wt+60OWq3sff/H9RR1U9rcQUJ7D3ib1N9UbMEpbCyQl6Ymv5gx
hvxn67J8H2dbjqu0PXtlUbXiRhewv7kXYLOhS3Bcpepphg3ImYM/qI+9PkvvGUT5
htyZXVesWFeDPqH2tV0P/zDVHVXlTPk4qB6ISn5q4rG5V23aUGs=
=0Qww
-----END PGP SIGNATURE-----

--am4ud672vipjc4px--

