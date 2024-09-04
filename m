Return-Path: <linux-gpio+bounces-9781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEAB96BAF6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 13:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0767E28A0B1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B816C1D0158;
	Wed,  4 Sep 2024 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="XTyJ+V0C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28631CCB43;
	Wed,  4 Sep 2024 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725450023; cv=pass; b=Q1jw22hAjKDoy/v9v1umQlBaWVKVwhJC3G7vr+af8NrhfToSe7hW3uGqSFurPRc2HJhhoRatPL+C8rBy4HQotaE1vDC/9AbrIkb06d8aBMTD9etHM17z7nM35er15uRzvqF6P06Ntjd7itczCeHRob1FJ2QL70t2ES7jlzifkPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725450023; c=relaxed/simple;
	bh=BpHPHX6ejPXq2XdLB44gB4hJ9COv+PiekL4+PJ+ZAIA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ITK9xR8zWo+ZAuC9xFjNlS4PRruuaRq9XPymi6xYD1iq7YRwjjWB9YkFx/Spll3nTHYyWG6lyHA53HyZE9EkLOlFrRiwpHIEQrRjOM23Pz0oarbHNgtisuXgXVJAokjDjKspkfjJJ8F1XWChtBbqb2kRwRT/hedwzAa2S6CILpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=XTyJ+V0C; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725450015; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A1f/dBJCupobP4DQSx5aTMBb/su8BkLTkxobwrGA0JS4HND31eDYA1jYYNvb9m6mkmPvSipEg0K/UBNkGmGkAqvtqFxero5qKXysI5y6d8/b3G8xRZ72TqL+mxdfoQvU4IRLGICad876HL3aqTpp6F32AyuRcinXApaprWTFvbE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725450015; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BpHPHX6ejPXq2XdLB44gB4hJ9COv+PiekL4+PJ+ZAIA=; 
	b=SBaRgULmqsS+z30p5exppBYkX4A2Q+OIyOoeyb5qEUy9km36Z6c/PO2EJHas/rRdI3UGoebVOn/mCZ8xbdIUU1x12W8fde1UlVAWRoskaEdOk41HsQFeYBku7Fp6dv25HO8RIK06etD35CL55XaSwmKqT1JFP72T3QZYw2T578Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725450015;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=BpHPHX6ejPXq2XdLB44gB4hJ9COv+PiekL4+PJ+ZAIA=;
	b=XTyJ+V0CZtLBG20kZkJSPrZmJ0nMMFxlfyoHG1HXhVZxiUCbAVwxlDycl6MyJ0la
	YWlO0JOvcdF2OIXy5+EQqiIzNNuUByWlh42w80whApBYBDk3LVJOjJY0esEXMkcwu4m
	TKGNCV/6T7nZYdAbtbIp3wFDUO5LQPFxy2cXt6Qg=
Received: by mx.zohomail.com with SMTPS id 1725450012768998.5630004944796;
	Wed, 4 Sep 2024 04:40:12 -0700 (PDT)
Message-ID: <0af89f007779b975692f9c104f0465bc4566b5c9.camel@collabora.com>
Subject: Re: [PATCH 2/2] gpio: mpc8xxx: switch to using
 DEFINE_RUNTIME_DEV_PM_OPS()
From: Martyn Welch <martyn.welch@collabora.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Andy Shevchenko
	 <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Sep 2024 12:40:09 +0100
In-Reply-To: <CACMJSeu+OsDc7ZiQxxN5gbKaq4DSYsMPC7S_A=9eesiWrQPaGw@mail.gmail.com>
References: <20240903154533.101258-1-brgl@bgdev.pl>
	 <20240903154533.101258-2-brgl@bgdev.pl>
	 <Ztc4A0rZE3G1oHo7@smile.fi.intel.com> <Ztc4f3AOpppiL4Dt@smile.fi.intel.com>
	 <CACMJSeu+OsDc7ZiQxxN5gbKaq4DSYsMPC7S_A=9eesiWrQPaGw@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Tue, 2024-09-03 at 20:36 +0200, Bartosz Golaszewski wrote:
> On Tue, 3 Sept 2024 at 18:25, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >=20
> > On Tue, Sep 03, 2024 at 07:23:31PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 03, 2024 at 05:45:33PM +0200, Bartosz Golaszewski
> > > wrote:
> >=20
> > ...
> >=20
> > > > =C2=A0#include <linux/mod_devicetable.h>
> > > > =C2=A0#include <linux/of.h>
> > > > =C2=A0#include <linux/platform_device.h>
> > > > +#include <linux/pm_runtime.h>
> > >=20
> > > You need pm.h as macros defined there.
> >=20
> > ...or both...
> >=20
>=20
> pm_runtime.h implies pm.h.
>=20
> > > > =C2=A0#include <linux/property.h>
> > > > =C2=A0#include <linux/slab.h>
> > > > =C2=A0#include <linux/spinlock.h>
> >=20
> > ...
> >=20
> > > > +static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops,
> > > > mpc8xxx_suspend,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mpc8xxx_resume, NULL);
> >=20
> > This one comes from pm_runtime.h, but pm*_ptr() ones from pm.h.
> >=20
> > And it seems you wanted pm_ptr().
> >=20
>=20
> Yeah, I'm not sure really. The suspend and resume callbacks for
> platform devices are not documented but it looks like they're only
> used for system sleep. Martyn: which one do we actually need?
>=20

Looking at commit 9d8619190031 (PM: runtime: Add
DEFINE_RUNTIME_DEV_PM_OPS() macro), the use of
DEFINE_RUNTIME_DEV_PM_OPS() sets up PM operations for all situations,
not just sleeping, so I think we need pm_ptr() here.

I'd explicitly added the functionality for suspension due to sleep,
though if a GPIO line is being used as some form of external interrupt,
there may well be cases where it would be beneficial to be able to
receive it in other low power states?

Martyn =20

> Bart
>=20
> > --
> > With Best Regards,
> > Andy Shevchenko
> >=20
> >=20


