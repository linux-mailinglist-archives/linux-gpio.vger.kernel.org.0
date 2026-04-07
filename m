Return-Path: <linux-gpio+bounces-34816-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOpDL4QP1Wl20AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34816-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 16:07:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2D13AFB55
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 16:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09A76307B36F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 14:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DF03B8958;
	Tue,  7 Apr 2026 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFjXiaUj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1985A3B636E;
	Tue,  7 Apr 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570400; cv=none; b=ooty5LvFLa9SUkOmsZX1+/yvlhIZZQjTAOtWsZ3UADMALcB8hYqhEHlT8KEZZ49aHq2WrMKMK8F/QkGa0MJF5rAYMOZ2LOm+B8rZj2LBSVZqpZcEWGJ280p/Uh9GIKG1hPP1MKvytYTlB/z5+azO85y6CpQlE70wpAnsNUkCXTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570400; c=relaxed/simple;
	bh=H3Fo4J2NVU0PFRfCQAwlJEgYC6mqn4kJRkIsmg1rNmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PK9GZqk2X+OEoNWMjSf4y3pi0zwpaJExTQLQdJUAWJhrPee8AT/7S5hwXzGAP6codUQ47mL3htxRUs0pQD5GKWTDCuy9CB72wbTjI0TG0SPXkxS6HN3pzubBmBJgtWIdfICUDrrtCHwy9iwvWgHDf+eAQkPYJn3Ae7bLAibX7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFjXiaUj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775570399; x=1807106399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=H3Fo4J2NVU0PFRfCQAwlJEgYC6mqn4kJRkIsmg1rNmQ=;
  b=KFjXiaUjrQBaUb7SBE2M+hlt2hCUGWcOpEkNOq7zK/MO970unci8Waty
   vUFnE5XiA0uf09PTop5vKWr377HfdfJnnyVMdqrG6/q9wU8bzUaim33j7
   Pg0AUyjXr9C5JnF2DSuRtXnUb7SR1ORYKCAnVJfDs1vhRB/zdaUV7X9UA
   3DY2aT0c/5rSJcXGlabM1o4udVDRPOUdollXX2qHpGBEg7+ij6DnmlQwM
   fV6Uo6PvuzrA5NzbvhWcg53PvRYx0SwTv55PdNtKVsHGx8u/W5yhWQPJa
   E2MhGkQJm/hV46OczP85cIj8qgXWtr//R3VtGR4/5pH88h6aPYv8Vtsrj
   g==;
X-CSE-ConnectionGUID: wozY9WhbSWaxH2KWOTaGUQ==
X-CSE-MsgGUID: n967fMBuTAeldXDhtCfT+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76416502"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76416502"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:59:59 -0700
X-CSE-ConnectionGUID: IGZNhBObRoOtINcVfkMZIw==
X-CSE-MsgGUID: EdV9wd8jR22m7NUwFtblFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="251309532"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:59:54 -0700
Date: Tue, 7 Apr 2026 16:59:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
Message-ID: <adUN2LIjNn9Y_xeT@ashevche-desk.local>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local>
 <ac7UqTsPC8yUooAR@google.com>
 <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>
 <ac_9EV3C0I1WXQz2@google.com>
 <CAMRc=MeRSKWoEn36hht4JuwrwOMpoA5g_Xju2XT9Urq3mQS2wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeRSKWoEn36hht4JuwrwOMpoA5g_Xju2XT9Urq3mQS2wg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34816-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.973];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D2D13AFB55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 12:57:29PM +0200, Bartosz Golaszewski wrote:
> On Fri, Apr 3, 2026 at 8:07 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Fri, Apr 03, 2026 at 09:29:38AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Apr 2, 2026 at 10:43 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > > On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> > > > > On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:

...

> > > Because -EPROBE_DEFER only makes sense in probe() context, while
> > > fwnode_get_reference_args() may be called in many other situations.
> >
> > Exactly same argument applies to your follow-up change: gpiod_get()
> > returning -EPROBE_DEFER only makes sense in probe context but it may be
> > called in many other situations. Are you planning to change all places
> > where gpiolib returns -EPROBE_DEFER to something else just in case it
> > might be called outside of probe context?
> 
> I'd argue that gpiod_get() should really be limited to being called at
> probe() time but I see your point.

There is weird hardware that might need to switch GPIO from IRQ (input) to
output at runtime (at least some touchscreens functioning like that IIRC).
But I dunno if it requires gpiod_put()/gpiod_get() dances.

> > -EPROBE_DEFER should have been called -ENOTREADY from the beginning and
> > then we would not have this argument. Or, even better, we should have
> > used -EAGAIN. But it is just a name, semantics does not really change.
> > We want to signal that something is not ready and the operation needs be
> > repeated. Currently we contorting ourselves by using yet another error
> > code that everyone will either convert to -EPORBE_DEFER or will handle
> > like -EAGAIN.
> >
> > > I think ENOTCONN as "not connected" makes sense, though the string
> >
> > Why is it better? Most of users of -ENOTCONN are in networking code so
> > it is somewhat unexpected to have other APIs return it.
> >
> > > representation says: "Transport endpoint is not connected" which
> > > doesn't spell out quite the same thing.
> >
> > Yes, because it is really for networking/sockets handling.

> Andy et al: what is your take on this?

I already commented on this while ago, and I think EPROBE_DEFER should be
limited as much as possible (and eventually killed for good). This is known
hack to the Linux device model instead of doing it via some graphs that are
constructed during initialisation. There were talks and approaches how to
solve this using graph theory IIRC (i.o.w. mathematically proven).

To the current case, I think the fwnode/swnode APIs should be clean of
deferred probe hack, so I like Bart's patch.

-- 
With Best Regards,
Andy Shevchenko



