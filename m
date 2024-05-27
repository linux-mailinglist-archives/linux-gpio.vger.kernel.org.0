Return-Path: <linux-gpio+bounces-6682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D65838D05A5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 17:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795A92870BA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418D7161935;
	Mon, 27 May 2024 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1E/BMBm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C948161331;
	Mon, 27 May 2024 14:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821831; cv=none; b=AvcrPTYp0bTk96pqUoRp8us78JCdP0PwYo6WZYCZ7FbsGFMfGeoxtnmZsxZGy65KrrikDEmTFK8PzJTFDHxra9dKonqycYo5f1n4PR668kCXxRs2tjR6/7Hh40DNIcXzEntrvhv8n8hNhl61m3dycAY+rAaPO07jSmaI+7zyQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821831; c=relaxed/simple;
	bh=anwxSewuYppnpNpMRH71PAQfXd/+GYXNJoF3P+nqe34=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TVfBFcW+unspPzadjFhNIhhP9sC1ZRMXRGSRH20N5asQB7J6Jh74CqHs9F30l4516hK1Nl1IEl3d8mpmw5VqwL0kfl829Yh4EMU0fI1awiTF57K/aaozjAI3WAEHwX3jhw8Xdymi/942dTNploHutpwnKeeXay9R65AQiXlkKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1E/BMBm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716821830; x=1748357830;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=anwxSewuYppnpNpMRH71PAQfXd/+GYXNJoF3P+nqe34=;
  b=Z1E/BMBmxrBTKdRBoV5tpn3pusSVRNufrrzHWQKPNRXEVuoW2e0gTFHA
   Fee8haKSKuqcEILJNVapHsVB6sgQ8Tyv7HVhrTE8oJ/pAcAUdDGbTmAw0
   IvyMmGeSdrazB9HJTF6Rgad+IXmsqHrzfo2dSAZza7NSGqyK1oOzqWUWD
   baSkMbASxV48viiCQzfg3AXEFUW7BR1RCs9GALfpN/IFnMwEiKmTXv/i3
   Hl5vaW9Uoo5lINCqdcVx+tPFfbmIFpNfMauXRGp08662NYCtvy+F0VqQe
   k97dDmJA1hFSXlFc9mYq+Tx8Mze3rra2zzJS2FZHNPdye8UsBKfE27GOv
   g==;
X-CSE-ConnectionGUID: 82zxdn2xTxeP/c20Epnsvg==
X-CSE-MsgGUID: i5XIEIwgRSCaMzU2xsCY9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11715418"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="11715418"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:57:09 -0700
X-CSE-ConnectionGUID: vIoPr/bnQ+mlO+fYA48sLw==
X-CSE-MsgGUID: tyWK4F2TR2GXjCyiin5UKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="39192759"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.140])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:57:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 May 2024 17:57:02 +0300 (EEST)
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, 
    Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-gpio@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to
 errnos
In-Reply-To: <50e1c6a7-f583-4b5b-997b-2e505b3df0ec@moroto.mountain>
Message-ID: <8ca1b7a8-5abb-e7b7-2e08-ec8c8edccdcb@linux.intel.com>
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com> <09f2f3ac-94a7-43d3-8c43-0d264a1d9c65@moroto.mountain> <7d475c6c-8bbf-86f4-b2d8-8bc11cb9043e@linux.intel.com> <50e1c6a7-f583-4b5b-997b-2e505b3df0ec@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2079346626-1716821822=:1006"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2079346626-1716821822=:1006
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 27 May 2024, Dan Carpenter wrote:
> On Mon, May 27, 2024 at 05:11:32PM +0300, Ilpo J=E4rvinen wrote:
> > On Mon, 27 May 2024, Dan Carpenter wrote:
> >=20
> > > On Mon, May 27, 2024 at 04:23:44PM +0300, Ilpo J=E4rvinen wrote:
> > > > diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd811=
1.c
> > > > index 6f3ded619c8b..3377667a28de 100644
> > > > --- a/drivers/gpio/gpio-amd8111.c
> > > > +++ b/drivers/gpio/gpio-amd8111.c
> > > > @@ -195,8 +195,10 @@ static int __init amd_gpio_init(void)
> > > > =20
> > > >  found:
> > > >  =09err =3D pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> > > > -=09if (err)
> > > > +=09if (err) {
> > > > +=09=09err =3D pcibios_err_to_errno(err);
> > >=20
> > > The patch is correct, but is the CC to stable necessary?  Is this a r=
eal
> > > concern?
> > >=20
> > > Most callers don't check.  Linus Torvalds, once said something to the
> > > effect that if your PCI bus starts failing, there isn't anything the
> > > operating system can do, so checking is pointless.  The only fix is t=
o
> > > buy new hardware.  There was a hotpluggable PCI back in the day but I
> > > don't think it exists any more.
> >=20
> > I don't mind if the CC stable isn't there.
>=20
> I don't mind either way.  I was hoping you were going to say it was for
> some new hotswap hardware Intel was working on.

That's not exactly the correct answer but I'm auditing all these because=20
I have a sinister plan to convert the PCI accessors away from returning=20
PCIBIOS_* codes and push the conversion down into real PCIBIOS interface=20
under arch/x86/pci where they'd be immediately converted into errnos.

As the by-product of the audit, I see all these cases where the return
type is incorrect so I've created a fix for each where the return type=20
confusion propagates.

> Smatch deletes all the failure paths from the pci_read_ functions
> because otherwise you end up with a lot of warnings that no one cares
> about.  Uninitialized variables mostly?

Please note that there's a difference between ignoring errors entirely and=
=20
returning wrong value (type) on errors.

At this point, I've already ignored many many cases where the value type=20
confusion does not propagate because of my main goal which is anyway to=20
eventually get rid of having to deal with PCIBIOS_* codes in any generic=20
code.

If a PCIBIOS_* return code somehow leaks into userspace where errno would=
=20
be expected, it could confuse userspace (e.g., one case unrelated to=20
module init functions I found is sysfs show function returning positive in=
=20
case of error which has obviously different meaning from the caller's=20
point of view).

In case of module init, do_module_init() checks for ret > 0 and prints=20
warning + stacktrace, however, it does not attempt to correct the return=20
code so I think the positive code still leaks into userspace.

--=20
 i.

--8323328-2079346626-1716821822=:1006--

