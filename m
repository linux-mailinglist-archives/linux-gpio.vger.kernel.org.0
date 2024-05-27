Return-Path: <linux-gpio+bounces-6673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 413408D02D0
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 16:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC7A41F21096
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C30715ECE7;
	Mon, 27 May 2024 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btIVkH8V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2479F1640B;
	Mon, 27 May 2024 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819100; cv=none; b=RMPKH1+r8XvfeZ8c3ZNE1/leElgf6g6e/HMrgmASf9q1H3Az8+lHKbkIlQ7iTqQwVNKONGluiPuHZ2LdLjQIylRby5IuDrgJVqsGkO0Y8nP0fqmiJpAJatK8SQh7wC241UaKMTIWnk74qqqFmozyc1o83hxQOwkKKqUZrPRhcjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819100; c=relaxed/simple;
	bh=o5hbqwBIk7hbVfK+3GoDhFtKqh6k+H303kYL9/uP8BU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bxRUPK9iJVCtXIUwrGuOpyQ8vj9QgU8SKS51PQAc2GoAubCUBlfKs4N5WeFmjfOaiNM1fnjEM4y4J0ofn6QAqxhm94PRZbFagRoq6cAqt8PUzUI0II2aIda5rkVqDImSoGO5MGDMqRxrexVLCSDZTaR940W6aKlEJB5eg6mI7GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btIVkH8V; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716819100; x=1748355100;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=o5hbqwBIk7hbVfK+3GoDhFtKqh6k+H303kYL9/uP8BU=;
  b=btIVkH8VG3nLkoluYtHKtpqtNocofhWbTYqn3SSi5k0AsqkdNY2Y6Mdx
   mavajyB6uW31yeGxAk70SJdJOQbNzqWoIGLQhr40pxLerX4TAO5dI+BGO
   gELXg3nRlcc21gDfrCOfTLPK05eHDIaCtI5bEDB/0hprbcih2aptPZTKP
   ftvXweCQgTLHiNIEPStlqU1Ms5xEYPxEcJ4V0CPjKbLieUfswm4JOV2pY
   w1HvMUsGjWMMbuZzlBywKieM19hGlPlg/RfKXSkoh4ScMmW31QhqqXafK
   ItNqdplFIwaoaYK9Q11stCDjv5bYPmhJj1FXPMHQA8TlYQMxDTmghbLyR
   w==;
X-CSE-ConnectionGUID: Zd8Ki25gTKOdKGmKgylV0g==
X-CSE-MsgGUID: sVVEbBwxQ8SPHSAbEMIciQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13085578"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="13085578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:11:39 -0700
X-CSE-ConnectionGUID: Zhuq5rPFQmKHqU+Ja7y81A==
X-CSE-MsgGUID: CZN/hKapTWO683lguzJlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="65990651"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:11:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 May 2024 17:11:32 +0300 (EEST)
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, 
    Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-gpio@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to
 errnos
In-Reply-To: <09f2f3ac-94a7-43d3-8c43-0d264a1d9c65@moroto.mountain>
Message-ID: <7d475c6c-8bbf-86f4-b2d8-8bc11cb9043e@linux.intel.com>
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com> <09f2f3ac-94a7-43d3-8c43-0d264a1d9c65@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1881005345-1716819092=:1006"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1881005345-1716819092=:1006
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 27 May 2024, Dan Carpenter wrote:

> On Mon, May 27, 2024 at 04:23:44PM +0300, Ilpo J=E4rvinen wrote:
> > diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> > index 6f3ded619c8b..3377667a28de 100644
> > --- a/drivers/gpio/gpio-amd8111.c
> > +++ b/drivers/gpio/gpio-amd8111.c
> > @@ -195,8 +195,10 @@ static int __init amd_gpio_init(void)
> > =20
> >  found:
> >  =09err =3D pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> > -=09if (err)
> > +=09if (err) {
> > +=09=09err =3D pcibios_err_to_errno(err);
>=20
> The patch is correct, but is the CC to stable necessary?  Is this a real
> concern?
>=20
> Most callers don't check.  Linus Torvalds, once said something to the
> effect that if your PCI bus starts failing, there isn't anything the
> operating system can do, so checking is pointless.  The only fix is to
> buy new hardware.  There was a hotpluggable PCI back in the day but I
> don't think it exists any more.

I don't mind if the CC stable isn't there.


--=20
 i.

--8323328-1881005345-1716819092=:1006--

