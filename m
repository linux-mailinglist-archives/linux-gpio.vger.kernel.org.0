Return-Path: <linux-gpio+bounces-31840-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LIlMH6zlmmRjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31840-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 07:53:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63915C852
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 07:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73ECD3013B7F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 06:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB22B324B10;
	Thu, 19 Feb 2026 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGKkeM6U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C815275AEB;
	Thu, 19 Feb 2026 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771484024; cv=none; b=IZFKUqJ4hhLrcw8FukgYqjmKFfgKyTbATGNlThAMnz2VbNBfBL/6AGSEPKdppmuR+SsAMfo7zdK/8BFcTDDtJ/aVz0fkbSc/qGTBhIWzvWF9SwjvRlRhZlC/goTHZmuZTpQgZiiPCkvG3PTyI9jZ2GIYPdmog8DgAevZpMjFHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771484024; c=relaxed/simple;
	bh=mUGtpDtI+pYLvLN8/jlVVukzx+jkyFh+aZPyBC0yMZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deQFLN1n1JdQ9XhC4MVFG/hUJR/gtVt+pNpAvFt75AWRCqF01xGTTa8GbTau/dAhOR2MjViN2N2SSI7rOxZ3tf/CJP1SjbJshX9ouFz/DuRA7ETzgi/I9W7bdzQFEm+jQ7VZNCNIKTN0EB5tMOPbHcew+Aim26OXqUqakykR4IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGKkeM6U; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771484022; x=1803020022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mUGtpDtI+pYLvLN8/jlVVukzx+jkyFh+aZPyBC0yMZA=;
  b=XGKkeM6UMw+gLWVWF3Q1jfPAiTD1yUnOtwOxykfBjHn9c7ROVcNZtrIN
   JgLCfrcmyCiSNeXO8TsaKMcM/Mfz6+3lcmceeXlJp+vYyFvmiFlg8EXaS
   EHrH3A6nY7SXAPKy0Pa67vVCURuAnlr3HwII0pUPENoC+cfnAWYAz622i
   KwsJpKgKuKkHPZMOUZihoAbMTI1wXTAYTJM9VQNqYpFd9PCAKHq8Dggg5
   vxjbz7ZxBSdoOfx6+5qE1UhWrjacsSLDB+rBq4BHXQ63/ipGi2KQKY2t/
   i3Rzo9vFVVis1juqVTumm0+f/L3Mm8n047HibrDk6v9QSsRpEO4I/+i26
   Q==;
X-CSE-ConnectionGUID: S2BFEkJAT4+zwqtrg8EjLw==
X-CSE-MsgGUID: JYPu20ACT9akGKpwC2j0dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71767545"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="71767545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 22:53:41 -0800
X-CSE-ConnectionGUID: fBOxgcIqQrGwlkAnkpsWMg==
X-CSE-MsgGUID: eHrtIraeQwmaEuDaaHFNSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="237418777"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 22:53:38 -0800
Date: Thu, 19 Feb 2026 08:53:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the
 swnode-name-against-chip-label matching
Message-ID: <aZazcDYdoZBzuH6f@smile.fi.intel.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
 <aZUIFiOYt6GOlDQx@google.com>
 <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
 <aZXyPjIjIDKCBLvs@google.com>
 <CAMRc=MdQmR-_Yqdh4TiHSzjmGVJY+0guDpFEM6F1QD_SJ2+T0Q@mail.gmail.com>
 <aZYPv1_kWQd9OdHD@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZYPv1_kWQd9OdHD@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31840-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 3C63915C852
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 11:22:07AM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 18, 2026 at 07:08:22PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 18, 2026 at 6:15 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Wed, Feb 18, 2026 at 09:42:28AM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Feb 18, 2026 at 1:31 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> > > > > > Using the remote firmware node for software node lookup is the right
> > > > > > thing to do. The GPIO controller we want to resolve should have the
> > > > > > software node we scooped out of the reference attached to it. However,
> > > > > > there are existing users who abuse the software node API by creating
> > > > > > dummy swnodes whose name is set to the expected label string of the GPIO
> > > > > > controller whose pins they want to control and use them in their local
> > > > > > swnode references as GPIO properties.
> > > > > >
> > > > > > This used to work when we compared the software node's name to the
> > > > > > chip's label. When we switched to using a real fwnode lookup, these
> > > > > > users broke down because the firmware nodes in question were never
> > > > > > attached to the controllers they were looking for.
> > > > > >
> > > > > > Restore the label matching as a fallback to fix the broken users but add
> > > > > > a big FIXME urging for a better solution.
> > > > > >
> > > > > > Cc: stable@vger.kernel.org # v6.18, v6.19
> > > > > > Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
> > > > > > Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> > > > > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - check if gdev_node and gdev_node->name are not NULL before trying to
> > > > > >   match the label (Hans & Dan)
> > > > > > - use the right link
> > > > > > - collect tags
> > > > > >
> > > > > >  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
> > > > > >  1 file changed, 19 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> > > > > > index 21478b45c127d..0d7f3f09a0b4b 100644
> > > > > > --- a/drivers/gpio/gpiolib-swnode.c
> > > > > > +++ b/drivers/gpio/gpiolib-swnode.c
> > > > > > @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
> > > > > >
> > > > > >  fwnode_lookup:
> > > > > >       gdev = gpio_device_find_by_fwnode(fwnode);
> > > > >
> > > > > By the way, should we extend gpio_device_find_by_fwnode() to use both
> > > > > primary and secondary nodes?
> > > > >
> > > >
> > > > That's already done on a higher lever for all fwnodes in gpiod_fwnode_lookup().
> > >
> > > How exactly? I am not talking about checking secondary node for the
> > > fwnode that is used in the reference, I am talking about secondary
> > > fwnode that might be assigned to the gpio chip and you need to check
> > > both primary and secondary if they match with the fwnode that you call
> > > gpio_device_find_by_fwnode() with.
> > >
> > 
> > Right, I didn't quite get it. I was surprised to find out
> > device_match_fwnode() - which we use in gpiolib - does not do it
> > already. I'm wondering if this is something we should change in device
> > core or only locally.
> 
> Yes, I think so (change in driver core). There is only a handful of
> calls to device_match_fwnode() that they can be audited to make sure the
> conversion is safe.

I believe there was already similar discussion and IIRC conclusion was to
distinguish current device_match_fwnode() with something new that will check
also secondary one. This way we can in a usual way convert drivers one-by-one
if even required.

-- 
With Best Regards,
Andy Shevchenko



