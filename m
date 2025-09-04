Return-Path: <linux-gpio+bounces-25590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0DB43CA5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273E43A791E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 13:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8AB2FFDCF;
	Thu,  4 Sep 2025 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaPreMtL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A72F5333;
	Thu,  4 Sep 2025 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991368; cv=none; b=ZHLI5wm5vkHH/Xf5oKzl/lvqwU/vJj9j2BxipyXolZ4M0iFPuheIRkQ3iw6hpdP6PzZANQUCWNic1vBnrmowIdjoLdceMbJipBTwFOlLghb3sXlfqB/WXJRh/+l0XzkI3l++gvPeaIZb4kafJgXrntXGVK2Z49/SBp3ek2FCmQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991368; c=relaxed/simple;
	bh=CEkGmN+eH+9br4VN/3hyHqhPwZ4rUpjB9RWfPNGjp+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0ESVm3s96bCfTEDaCliIa3mLTjE3ugWujhoLha8yRFw59RPjcoPuzxVOp2qUiJzH7RCwILZwwQ94jm6hY5lgegtVmzj8JiR2NwzKQEqwCJj7LuDKxGl/l2xF2Q3LJTe219/GlPArHv0eWqmN9JDPgA+LodBys88UkLMMP9+dMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaPreMtL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so727410f8f.2;
        Thu, 04 Sep 2025 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756991364; x=1757596164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6hnoEkRgYt1VB/BhJ9Gz7UNyqHPo14C0inEKe2HRcF0=;
        b=MaPreMtLXj7qMFOHg2FaRTLvJfaCNRXK11j6SueS6o/8aRDit6G5HZ77pFguFTPsLp
         N0WsHmvnYu8nUXJQub7UfhihE3GfeLggOMMz0UXE3y0YOIaI5adISvpQhJvfI2sUwKol
         QiouEjj6XPRVagZLwxkfHclUoArWoI/kUC272eQInrGkebLsdCyY9Nkx2b4eW7GuamPX
         MHw0FDJmFbTTLBHltpbHmUqmQBGcdV0+rIw514fUSIr15ZCB8966BxjV84RQ6V2tnqOo
         K8UfwPF/zF6MjBrRHfmSATmHoy4Oz/66WrE17XhW7r1AssY3Tz7DzjRfW830sytNLmpa
         Piyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991364; x=1757596164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hnoEkRgYt1VB/BhJ9Gz7UNyqHPo14C0inEKe2HRcF0=;
        b=H8trZ27S5UifutmlbBSKgCLja9eh/D5wDSW+PHlwkPlvnqnQ0qZdGXh9ScJwA7eDSQ
         PbHpkc8yypgeSsI+L9Eep7FEucDFOdj8O9JvejvFuGEmjwnCc3i/1px68yC4YLtByaV8
         0u5Xf2eeLyWrEMAs4ox0m4NQ2BXoXGgb40KXzzvjwEBx8F/IJkQebh/JiT84TS+PeVzK
         8zi4QAfvPsvHTinznULD+78KbhK6UmT7erfBeSIxtCPQXAHLUqPynLBuO0tPpMbCIToD
         zg0OLVAeWWl8ZqsaPdjqijVcw1aSuMQgdZflHkjiC7iL+QaBAczc+7aztdipbCfRFfaK
         9g6A==
X-Forwarded-Encrypted: i=1; AJvYcCVC2yrv0wocWK5PxB647wSH1Wr0Bchd6j69GbQTPFzA7n8el2Wg3SBc1LSB/XTKvQKltkwi3UUS0WoKig==@vger.kernel.org, AJvYcCVu+t6g3IPul8E9rljhja3g13KkXqjyTyM7TdyEG3+RLkhFMsodU6X7vY/W27zTKYcMYG+732GbNPW1oxuh@vger.kernel.org, AJvYcCXAQgjgVCROxfi8fFFsyd8DyXlhI44Qm/fxp9hkD8aGvgmlaprfrBlKmdfq/kwjnSyjOQ5G8+qBtHFG0B0=@vger.kernel.org, AJvYcCXNLOufWSfbmlNa0nkd4or6YlZ2PXSxQjjymPA+KfnfYlvZ1lqDtmFqfVRHRLX2yWBP7SLQFMprJdEU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh9r2MUv3PCjg0RXcbzUVszJZUnPyLfub/8zpPeudhy/FDyfHu
	uKFjLY2uyHqk7RIn8cxxnzAqr8QZPAcjKx4YAh6KjOWvME/qLf6Pn6/y
X-Gm-Gg: ASbGncssAKaA9rdTEWhuGPfxp7OY/nmtoyL/rlnowWvBTbrpQYoXYS3TWoFPSOQfVPZ
	pU8dDMjrqlFu00U73WrbyzJrKY87nlIbFJ0SBQ++GtDejKe0GnuUswmQHHmWxEWryQdxseGqQ31
	H897DK4KjuWmSmVMdcHt1E7llSqrR8dput9gESxWnoBz16EEyhqvXLVktWn6IC1uMmpHwNLJpEz
	1212fLCFEn61t25qHUzJN8Q1uPoGZCgi16xPzF+LANZ20T4pR+rSh+teTySziB/UPVBgBPi7Ysp
	T/edszeysw4HoYtz20GeO+imOCilYzJuIAeWg4FPKDgEWGIQAygdx4Ezk5Ik1/IQR1Ca66lnMaD
	KiE5R1X1ya4G2wcxeYx3K3t7MxHp6rhxbfWsBqR9Kv+TZheY5nXtz9+upiFxrpjXT6hcnJOJW6+
	t34ro3RZeIxhkHlcIdb9c=
X-Google-Smtp-Source: AGHT+IFWMN7swaLNK+wnZQ+3fREEzQC21iZytwCjaGlZNL1G853b7yiEMxqpjuXMqzSm3k04KQ7Neg==
X-Received: by 2002:a05:6000:1ac8:b0:3d1:9202:9e with SMTP id ffacd0b85a97d-3d1de4bb305mr16267989f8f.36.1756991364377;
        Thu, 04 Sep 2025 06:09:24 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3deb99d10a0sm6155456f8f.37.2025.09.04.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:09:23 -0700 (PDT)
Date: Thu, 4 Sep 2025 15:09:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
Message-ID: <czukh3b6lb7x3uwn2khcgzrkccyveokdpksxban7arhod6ygh3@uukoulmn5gil>
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
 <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com>
 <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com>
 <CACRpkdb46OwzNQuSp0+QQVjy2LojMyhdE7XrNwdsyqGi5okASw@mail.gmail.com>
 <CALHNRZ_+Oh2AGZTvJ66EjBEKEf7PdQsMM_BTNNnjENJpbOKiog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3cbsqasrarpcn4l"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_+Oh2AGZTvJ66EjBEKEf7PdQsMM_BTNNnjENJpbOKiog@mail.gmail.com>


--y3cbsqasrarpcn4l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
MIME-Version: 1.0

On Wed, Sep 03, 2025 at 12:58:06PM -0500, Aaron Kling wrote:
> On Wed, Sep 3, 2025 at 1:55=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> >
> > On Wed, Sep 3, 2025 at 6:54=E2=80=AFAM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> > > On Tue, Aug 19, 2025 at 6:30=E2=80=AFAM Linus Walleij <linus.walleij@=
linaro.org> wrote:
> > > >
> > > > On Tue, Aug 12, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > > This series adds support for Tegra186 pin control, based on a dow=
nstream
> > > > > driver, updated to match the existing Tegra194 driver.
> > > > >
> > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > (...)
> > > > > Aaron Kling (3):
> > > > >       dt-bindings: pinctrl: Document Tegra186 pin controllers
> > > > >       pinctrl: tegra: Add Tegra186 pinmux driver
> > > >
> > > > These two applied to the pin control git tree.
> > >
> > > On patch 3, Mikko noted that I accidentally amended the formatting
> > > changes intended for patch 2 into patch 3. Linus, since you've already
> > > picked this up to your tree, is it too late to fix this properly in a
> > > new revision? It doesn't appear to have made it to the main tree yet.
> > > Or do I need to send in a fixup?
> >
> > It's one of the first drivers I merged with plenty of other stuff on top
> > so I can't amend it, just send a fixup based on my "devel" branch
> > (or linux-next, it should work too).
>=20
> I am highly confused now. When I went to make the fixup series, the
> fixup didn't apply. Looking at next-20250903 [0], pinctrl-tegra186.c
> looks like I wanted it to, the base commit has all the format fixes.
> Which doesn't match the commit on this series. Which leads me to a
> couple questions:
>=20
> 1) Does anyone know what happened? I'm not particularly a fan of not
> knowing why something happened, even if it's beneficial at the time.

Maybe auto-formatting or something else that Linus did?

> 2) What should I do with the dt commit now? Ask the Tegra subsystem
> maintainer to do a manual fixup when pulling? Even without a manual
> fixup, the bad part of the commit would fall out when getting applied
> on top of next.

I can drop the extra hunks when applying, no need to do anything.

Thierry

--y3cbsqasrarpcn4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi5j30ACgkQ3SOs138+
s6Gx3BAAsVp4U/76YecvVcNkWzqZG1qR/e//wbvhrVA4MPWnA0vtDgUClKCKNax4
cZwaV+CrRL1bYCjmwlS0hJipu13+iAQyKd6wdessvKUs6SIyN7SM/E4bg6n6Bnq5
IhcbJpyYEk40j+PKriLSN3PF08lKiqiPKjLfU8OSBo62KzeUEJhwXlJF55FzARbt
xxjSbjzs5Act7IVFijefweHsoL29OaNDmr+e1qVpRLjqoV5U2CNJ+fNjrB3s7qwq
CBODSlw2swfF2d9Z8D7WkxHFSvNLihThfgSxO2aaQpDrePznr2emsVr3esjiNma8
4hckBxmrJgntGjRxrPq0P+/ycxXE5i55F6pCtnw0jlBgy1zZ9nTHlOBDem6KBMUa
YVamLfRPNM12hXA+iZRaib6R8i6N5vUplcc8B11zU39dVpkHMPPixJHerdTZaZD6
chiZArTYQ9HCutLwzcGuXEinZZeG15qpHIA/CW98MXV9rd/gBm62JT0g8aUjXBHm
Ogu1AeTL3wEDgN+ffMdLd5Xs/dKR2d6/1G7i4fiyklmiTU6Hi+TQEDYKpE0xyJsG
UpIq2N+mWsxH2rbcHyc3ixMc09tJGiStLqVS4pPPzRexUW5BB7PPh+O8nwCUoFgA
+ZTVZgEjKcMcoefLWvDnEuDMLHM4NWtZSKT4u6dequPkfEgauY8=
=743D
-----END PGP SIGNATURE-----

--y3cbsqasrarpcn4l--

