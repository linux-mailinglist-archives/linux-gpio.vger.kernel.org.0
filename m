Return-Path: <linux-gpio+bounces-32793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fdOBNL10rmm+EwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 08:20:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4A1234B81
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 08:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7144F3002518
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 07:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF3836404E;
	Mon,  9 Mar 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiFmNSR2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A0F18DF9D;
	Mon,  9 Mar 2026 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773040823; cv=none; b=cBYmJ8TFXDYV6xK5UAsbPubb7fMyy8yt1hpuzOuTw5SVK1adXUiRExv1Ap3wZ0rz3x74T5XzfCiAaVkIAXHMf1+HKOXl6KyfVPn43KpmxwW78XLOAUMzOEqSDIkAhkUni1ZzN0C2pSymGQIEZUlAC1hqdArtwKBSORKMUvsGtNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773040823; c=relaxed/simple;
	bh=Vj0jq5cYyjfWlkHmUfUSF75TTMqZrSCWk+45cWxCNb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq6vttQ9tWEYGAZWp6dvBK8Arwu/1iu/xLvvunyvCrn4b5kDhEq4ZVNHf/1FOdwyn3Azw1o2U/EyszBCkw8RhLE3v54cGZHjZ5CTFwB+bCCEMCapPeeIGJuejLR1T4y70D/yDG8jIQnPDCAVKdxCUHPZFZPSsu8GsifGiQsECRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiFmNSR2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773040821; x=1804576821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Vj0jq5cYyjfWlkHmUfUSF75TTMqZrSCWk+45cWxCNb0=;
  b=YiFmNSR2X7jGCd17OxtWTQIQSKyDiqrvP0b1lVhpXFoojTl6sBPsuf6E
   xqkbdZCzAnBpNUagzJ6XXAPdW8VaV3Dov4zut8rR78v46ASFnmlvWl32o
   2W1RfweXyULXL9y3x+BZuRI6ROJtb8/XeX7r/+dcONDUShoJ8JEyxe5oN
   hZiI0YsrfOhIQcUXjmkvNcULpSEJNiqEgHyF002CgtvwlZkzupDgIaWz9
   8ktSQUAfiev1xtKPe73DcNx0c7hd3vTmmg/aehUepVPdO62fOgMm1gok9
   Kt4K7762iTxauSVrinEdO06LVRkRMDY1IEjrkCQ9Qb4s4PCRX567OAZch
   w==;
X-CSE-ConnectionGUID: g7vauGkETHSFuLSTKfFNBA==
X-CSE-MsgGUID: ty5pPoFdRESljof0olqRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="76659646"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="76659646"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 00:19:12 -0700
X-CSE-ConnectionGUID: VOFcNaWCScyrO9JgtgP1PQ==
X-CSE-MsgGUID: qjIC3nC2QLSrP52gsJvdlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224365233"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 00:19:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DC54D11FA60;
	Mon, 09 Mar 2026 09:19:40 +0200 (EET)
Date: Mon, 9 Mar 2026 09:19:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	linux-hardening@vger.kernel.org, gustavoars@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: ljca: reduce struct allocation
Message-ID: <aa50jIM0Xexg1hiQ@kekkonen.localdomain>
References: <20260308021201.47820-1-rosenp@gmail.com>
 <aa1pZdYEU8QkI_8x@kekkonen.localdomain>
 <CAKxU2N9WCtyoEhdZk=GY=3kuYkv3NKrRZ6kNE8-feGYp5AXTbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9WCtyoEhdZk=GY=3kuYkv3NKrRZ6kNE8-feGYp5AXTbQ@mail.gmail.com>
X-Rspamd-Queue-Id: CB4A1234B81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32793-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Hi Rosen,

On Sun, Mar 08, 2026 at 11:54:07AM -0700, Rosen Penev wrote:
> On Sun, Mar 8, 2026 at 5:19 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Rosen,
> >
> > Thanks or the patch.
> >
> > On Sat, Mar 07, 2026 at 06:12:01PM -0800, Rosen Penev wrote:
> > > Convert connect_mode to a flexible array member to avoid calling
> > > kcalloc and to combine the allocations.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/gpio/gpio-ljca.c | 16 +++++++---------
> > >  1 file changed, 7 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> > > index f32d1d237795..a531aaa0425f 100644
> > > --- a/drivers/gpio/gpio-ljca.c
> > > +++ b/drivers/gpio/gpio-ljca.c
> > > @@ -63,7 +63,6 @@ struct ljca_gpio_dev {
> > >       DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > >       DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > >       DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
> > > -     u8 *connect_mode;
> > >       /* protect irq bus */
> > >       struct mutex irq_lock;
> > >       struct work_struct work;
> > > @@ -72,6 +71,8 @@ struct ljca_gpio_dev {
> > >
> > >       u8 obuf[LJCA_GPIO_BUF_SIZE];
> > >       u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > > +
> > > +     u8 connect_mode[];
> > >  };
> > >
> > >  static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
> > > @@ -400,22 +401,19 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
> > >                          const struct auxiliary_device_id *aux_dev_id)
> > >  {
> > >       struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
> > > +     struct ljca_gpio_info *gpio_info;
> > >       struct ljca_gpio_dev *ljca_gpio;
> > >       struct gpio_irq_chip *girq;
> > >       int ret;
> > >
> > > -     ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
> > > +     gpio_info = dev_get_platdata(&auxdev->dev);
> >
> > You can do this assignment in variable declaration.
> I avoided doing so to keep reverse christmas tree order. I can still
> do so if desired.

How does that affect it? There doesn't seem to be a dependency here -- and
even if there was, the dependency obviously has priority.

> >
> > > +     ljca_gpio = devm_kzalloc(&auxdev->dev, struct_size(ljca_gpio, connect_mode, gpio_info->num),
> >
> > This line is a bit long, I'd wrap it.
> Will fix.
> >
> > > +                              GFP_KERNEL);
> > >       if (!ljca_gpio)
> > >               return -ENOMEM;
> > >
> > >       ljca_gpio->ljca = ljca;
> > > -     ljca_gpio->gpio_info = dev_get_platdata(&auxdev->dev);
> > > -     ljca_gpio->connect_mode = devm_kcalloc(&auxdev->dev,
> > > -                                            ljca_gpio->gpio_info->num,
> > > -                                            sizeof(*ljca_gpio->connect_mode),
> > > -                                            GFP_KERNEL);
> > > -     if (!ljca_gpio->connect_mode)
> > > -             return -ENOMEM;
> > > +     ljca_gpio->gpio_info = gpio_info;
> > >
> > >       ret = devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
> > >       if (ret)
> >

-- 
Kind regards,

Sakari Ailus

