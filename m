Return-Path: <linux-gpio+bounces-27436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B365BFBA02
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DC065004C9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 11:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5FA336EFA;
	Wed, 22 Oct 2025 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="pqCbupnN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651C32F751;
	Wed, 22 Oct 2025 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761132229; cv=none; b=m7L7FwEsmcw77qmXhqG1nIxovfwy1ajtui/nIEwICIQkrT+xdM3McOsYnpav9ozAPzgojf/rJGgq9wQ7dp/mwuqFVl92gJKHYYJz0U/rt0WG3of1oxDDpZ7JW9D0TSH7V1i4nLBUN7W5fXzICHj1X2j2L39D6AMQO1ahJI9XNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761132229; c=relaxed/simple;
	bh=Sto90th+ZCJpEnfp/VcT4pT9JuOxd6d1o8AqSToBMrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loPT4Qxor/o7F9GLujvoz/2drxL1Oys2W/gLgImbKIT7Z463OWTdk14mKRwRlyN2nDsKX92ijMRoovHUZSxPTR7WAIW9QrIldE+aZEoqBgbkB8SHE0aZZKtdB7SVxaCL8IFwQgusMsE5RHEX1QgO7gvZokNvjWHDnYsZM/jrxhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=pqCbupnN; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 15D481C0088; Wed, 22 Oct 2025 13:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761132225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lJy21XbWgHp7MjGSXfr0/SiKeaKudWY5JLr70CDGgKg=;
	b=pqCbupnNygoqjhYdJh+SCZh/oNfOBS94VpWGG/hzyei2HcK3MabOx5SFCwkpVC61xwOs7u
	kBUNEPVa2OaVIxl0U8f+ElyReralUEauxeyeryR+9Oj0aktXucB7Nk4gKyZZy19G+bIB/Z
	IPRgNPTEJp/FXhjKBa218zWpoFhtef4=
Date: Wed, 22 Oct 2025 13:23:44 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: barnabas.czeman@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Adam Skladowski <a_skl39@protonmail.com>,
	Sireesh Kodali <sireeshkodali@protonmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
Message-ID: <aPi+wIY/bUuZl9hv@duo.ucw.cz>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
 <20250831-msm8937-v7-6-232a9fb19ab7@mainlining.org>
 <aNGLPdmOyh/pfroq@duo.ucw.cz>
 <97ee369f6ffbe42c72c57ebd72887b23@mainlining.org>
 <aNJKniJ46YuUsbQ+@duo.ucw.cz>
 <DD038IVOWESM.24X3EZZXH3UE@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="afFovrNgGG7Vhs2p"
Content-Disposition: inline
In-Reply-To: <DD038IVOWESM.24X3EZZXH3UE@fairphone.com>


--afFovrNgGG7Vhs2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Tue Sep 23, 2025 at 9:22 AM CEST, Pavel Machek wrote:
> > Hi!
> >> > Hi!
> >> >=20
> >> > > +	led-controller@45 {
> >> > > +		compatible =3D "awinic,aw2013";
> >> > > +		reg =3D <0x45>;
> >> > > +		#address-cells =3D <1>;
> >> > > +		#size-cells =3D <0>;
> >> > > +
> >> > > +		vcc-supply =3D <&pm8937_l10>;
> >> > > +		vio-supply =3D <&pm8937_l5>;
> >> > > +
> >> > > +		led@0 {
> >> > > +			reg =3D <0>;
> >> > > +			function =3D LED_FUNCTION_STATUS;
> >> > > +			led-max-microamp =3D <5000>;
> >> > > +			color =3D <LED_COLOR_ID_RED>;
> >> > > +		};
> >> > > +
> >> > > +		led@1 {
> >> > > +			reg =3D <1>;
> >> > > +			function =3D LED_FUNCTION_STATUS;
> >> > > +			led-max-microamp =3D <5000>;
> >> > > +			color =3D <LED_COLOR_ID_GREEN>;
> >> > > +		};
> >> > > +
> >> > > +		led@2 {
> >> > > +			reg =3D <2>;
> >> > > +			function =3D LED_FUNCTION_STATUS;
> >> > > +			led-max-microamp =3D <5000>;
> >> > > +			color =3D <LED_COLOR_ID_BLUE>;
> >> > > +		};
> >> > > +	};
> >> > > +};
> >> >=20
> >> > That's single, 3-color LED, right? Please see LED multicolor support.
> >> As far as i know aw2013 driver does not have multicolor support.
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> >
> > I believe that needs to be fixed before more bugs are added on top to
> > work around that problem...
> >
> > ...and before that bug is cemented in the ABI.
>=20
> Honestly I don't think it's reasonable to expect people contributing dts
> to then first start patching existing LED drivers and adding support for
> x y or z to it, and block dts addition on that.

Well, the dts is wrong, it describes three leds when you only have
one.

> At least in postmarketOS the user space components we have (e.g.
> feedbackd) detect the LED things (and most others) automatically since
> various devices have various different setups. So once/if aw2013 gets
> multicolor support, the dts can be updated without problems.

> Sure, maybe today changing something on the N900 which would change
> sysfs paths is not the best idea because people will probably have 10+
> years of random shell scripts lying around, but nowadays we usually have
> better ways of abstraction that can handle that.

I'm pretty sure someone, somewhere will have shell scripts.

BR,
							Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--afFovrNgGG7Vhs2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPi+wAAKCRAw5/Bqldv6
8k0GAJkB+A1MYLsaFrYi7NQtR20dd9gtSwCfTNIAA7o2+c88KcU2rXh0E4whh1s=
=m2+z
-----END PGP SIGNATURE-----

--afFovrNgGG7Vhs2p--

