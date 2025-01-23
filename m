Return-Path: <linux-gpio+bounces-15021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F95A1A04C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 10:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13673A2971
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 09:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D930C20C48A;
	Thu, 23 Jan 2025 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwktgbQU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC2720B7E3;
	Thu, 23 Jan 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737622888; cv=none; b=L2owR5o2BKkVh6t9uz+lCWlNvICk4bVJoLlQ5ZKN8c+VJc2XcTgoUFN5UngXe3pWwbqbWH8PO4KDFzPRO5iXAEfzZI9DryT4pnwsOCHXh+yipsFX3hNa1mIF7aj2JnEZW7K/tPs6wX43ipOTy0cHPJOdZ4n1wPQ0FeD7Ol+hIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737622888; c=relaxed/simple;
	bh=9/E1nvOwQ142ouB7l/QczZ2kYOEk8bbjICCME+C1KAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqzeXLj7ty8dgHeO10JMzg24OhAkuPH60APnf6kuCmcQ0wLgMTVgic/5AyN69KT4gtgw2CNXipwg8Um087qKCYOn+X/EgKRpK9SGvXnmNqI8D4Jj2JYiQcKsWlAFmvK19rOQAirqN7LoBlW9czAB2d3vdA9cRGT/VwFYJZ5Rc5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwktgbQU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so6317715e9.1;
        Thu, 23 Jan 2025 01:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737622885; x=1738227685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2jI+cPSleUjJx2uFZjXvCaJjGtWxxdbGZO23dapc7c=;
        b=IwktgbQUwIzplDbSXm8hbzCg6NGlOuFymj4+z3NF4vZqfWb2fh7EXS0sf7mkP0SkAc
         0tARXuYoVEmzeFbi+PjrH7NnofPM5T2WcjI0+J+csEqggUmP7M9VZbGAjL/YKmXH1Mxh
         PpdlxMnOCH79llseg1m/2bHfnQxpS/z2+6fMG6AH5rCEv+JfxtHRM3dF4okLddx4JlNI
         MhLRwyr2Rtn2YCqCUJ0b7uRzgyqIkxdVh2TM4NrHNrNEgQs+sBazsTAtIUBWFp5AYiUg
         7hj2ih1kQ3d6JRzsilNG+n+cYRTgogNKf6RmuxYEvQR9hKGFZ1aiXj56ttgdRPRNr6Qc
         LCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737622885; x=1738227685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2jI+cPSleUjJx2uFZjXvCaJjGtWxxdbGZO23dapc7c=;
        b=ryByVAGSAx/9xz0RajObYMt6v/U6Unef//kwAiXH/n3Cd7OnjLT43BlBbgC5MxGB7m
         ovSxxgd+/xx/UKseglbCWhSaYfbPHsqxz5fy6BTL2JvbBSBjupIFY46gKhouV5O1xCyS
         LQVHwAnCyARV0OfBYZDJpOIuWdHgbNgGjA0fFv4HWTCk9Hs4CbanOEGKpJ6xZnh3YXbt
         B/RgnLcRCFsLqH4W0zJQa4P33sZvb2qJOgKqKSQ5s/UjBQW9rfY6yZGOEW07vucwZkue
         QTbTUk8rsffsLMdlCpaxLlu1ZDFuJSdSKPYJnsNOEW4INh6y127gSBb0hiN22sR4oEfc
         AOsg==
X-Forwarded-Encrypted: i=1; AJvYcCU+YjfatAfzt8UocyiXdJXY5rFcRcxQSQOaTR9ulySfw3eo9yJefltZR+QlxiSGlZ5vQOaX6bpzxMTerSBZ@vger.kernel.org, AJvYcCW5cr0noSqllwTauf9+/821IY9XjZM4EkrLtSFj4fVwg/0GUjWy3aiA9nSNi7XyQfGdtQOmpBSCgpV/N7E=@vger.kernel.org, AJvYcCXCJILND5IxU+U6wsEuYxBn08CbwJ93/PqdMrMI+7pzq6Nc/ahxqAM0A9dH7IruFt6LIi8LBRRe2vGA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm9UhVYphv3jJ7RDkFnkFoxqd2USqeXarc6daqui8KA8DhYCCe
	G69g1NWzn+IQbPzJpJPWloM4p+6pEs6HfW+v0GEWlyFtxV5tEPTg
X-Gm-Gg: ASbGncuJIAEC+yp/CCuIRhE128WZ0OWDwEn9nkcx3emlQo5UUgzcflBHpbKUZF6g3eM
	upAC4c1+NW7ktuo4I0LFJlBgQnylGfHXGKGdxTT3SX7iwlHCLnHRhJ3+H/uvmV1L0bUDa02BBUU
	Ja5/UeWLXFUCktrD8ArHH4y0uRtNnlND3fYxb3blI2lW/PTxnEdf551DpcvJ3hfMt+GiJt18Sve
	LTU76WRuSBDcM6X2VXKJIzqmTIDIV++BolZIEFGYlPihtFehNuIuOdvvSQP72XsiqGo0Zf75GtJ
	eq1Il3let7/LgFLZEZkgvqynJZ37aQ0CzpHuJZ8UH1bDbIaft1A1w/ChP1F1hWVj3k8=
X-Google-Smtp-Source: AGHT+IGLTx2zeo7rHCwiDPBh+Id51Zm2fUPoSovZvuVb9eLl2wPj9NfWOsfkRkmLo7R0T4c8E873yw==
X-Received: by 2002:a05:600c:6a83:b0:436:713b:cb31 with SMTP id 5b1f17b1804b1-4389daa4ac0mr214622005e9.3.1737622884898;
        Thu, 23 Jan 2025 01:01:24 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31b6ca1sm55715415e9.25.2025.01.23.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 01:01:21 -0800 (PST)
Date: Thu, 23 Jan 2025 10:01:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Prathamesh Shete <pshete@nvidia.com>, jonathanh@nvidia.com, 
	peng.fan@nxp.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl-tegra: Add config property GPIO mode
Message-ID: <f42w5rk5fcquqpi64eowlkhndcqg7sar65i2q3et6z5fjbtxwu@dycjfloq4cti>
References: <20241217153249.5712-1-pshete@nvidia.com>
 <CACRpkdaYwhy+-q=gQjT6WR9Ye8tgK6G9Pr3xzP7srxEH2R74sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="54e5mdz3ktzwaey4"
Content-Disposition: inline
In-Reply-To: <CACRpkdaYwhy+-q=gQjT6WR9Ye8tgK6G9Pr3xzP7srxEH2R74sg@mail.gmail.com>


--54e5mdz3ktzwaey4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pinctrl-tegra: Add config property GPIO mode
MIME-Version: 1.0

On Fri, Dec 20, 2024 at 02:51:43PM +0100, Linus Walleij wrote:
> Hi Prathamesh,
>=20
> thanks for your patch!
>=20
> a question here:
>=20
> On Tue, Dec 17, 2024 at 4:33=E2=80=AFPM Prathamesh Shete <pshete@nvidia.c=
om> wrote:
>=20
> > The SFIO/GPIO select bit is a crucial part of Tegra's pin multiplexing
> > system:
> > - When set to 1, the pin operates in SFIO mode, controlled by the
> >   pin's assigned special function.
> > - When set to 0, the pin operates as a general-purpose GPIO.
> >
> > This SFIO/GPIO select bit that is set for a given pin is not displayed,
> > adding the support to retrieve this information from the
> > pinmux set for each pin.
> >
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>=20
> If the description is correct, why is this bit not unconditionally
> set in
> tegra_pinctrl_gpio_request_enable()
> and unconditionally cleared in
> tegra_pinctrl_gpio_disable_free()
> ?

Sorry for the late reply. This bit is already being set during
=2Egpio_request_enable() and .gpio_disable_free(). My understanding is
that this patch is primarily for making this available in debugfs. I
suppose we could make that clearer by not making this part of the
standard pinconfig options, but rather put it into a "read-only" set
configs?

Thierry

--54e5mdz3ktzwaey4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeSBV8ACgkQ3SOs138+
s6EeBA/+Mnwo4yJv81TrMhPG3d6keME570/svWtqyJqLt/78vazlzs3gkWCGSl+U
kNEw7bFWD/ioQjL5BGghZWLKILs1sVvCxACXETSi7+/suxR+7f4dKGhEmqWNasRt
+mfBkV02wnrPJOWcijhG89CNV70dpP3iIzlTlsVqgdM+f+2a7NwgSInVLugCGkwl
TWZ8eAl9nxoGPvVFtsUBrjYsqAETGQVLr1snZHCYYm6cwTU4jO1fioViPz2NMNIA
pdBWx6wX4ax4bP+jFN7KZtCA3p4FkUfrtC7R6ldmqVQ/eOyojndnaWG3f7XikRl3
geWXk0eOYQXwcP3K2D0gkdFCNuDZngD5sOi53vvtPEc4zmFYLuRWMn4oWKPfWsTU
4aw7WumiKR/I3Tr7xcty0wmKvVFfsZ8ZYEB7Jht1LKFca2zTQ/AK7IYR+Hy42ACY
LBw0GebFFzVRURxd0wgUoqaip7+D2vOp/j9vvvG7hpcFa3kAq9DebHndLoNN+ReI
YKutrsv+QU5oUcAuYw/LsoM6RcCjFm4AYIaWZU4Ym0hRjobt2syjOzVm+Pgp+VmF
eNz6gbWDqVABtrrIYBISWfHNJheCkx0SfYjFSOKqfnMLyuYr2MYDjeCEnOej8sNI
mv9p4RkvyYSGEzl1+JBSBHi9xRrkl6fSMshmf+tmcb7M17VCwhA=
=KHsn
-----END PGP SIGNATURE-----

--54e5mdz3ktzwaey4--

