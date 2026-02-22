Return-Path: <linux-gpio+bounces-31997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCXNFR5Vm2kVyQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 20:12:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D73170251
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 20:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB8FC300F9FC
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 19:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6DB352C2A;
	Sun, 22 Feb 2026 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+k0EH+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CE34F498;
	Sun, 22 Feb 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787545; cv=none; b=gmleYexmTjUNpnz4JQR8kqFqNb/9BOmxN5pypJwUfEzYjFmRkelCx4cGCS9wzH/iqzQ5mcTfWLs/XNLQ7rnI4gT0efoYr2WYNwsR+z2fm495eNV1cvpaW4YAUk4sDd0lsq5zewK2MNniVjKBRCMW8m4Vp8YyKpd7uciEjuP04qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787545; c=relaxed/simple;
	bh=oBO4M9vSigHp2cMcVMsbdryITkk7+TuQZxjvoHiAfT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GakHgR+F2xTk7I/6f1dJJhgxZVcANPYeBwudP7XRfuN9IRKyezSQTU/wAjYEUVz6qzbO7UEw6Tm90Chgf96riPD7X91GZyDm75HzVxzRKqGBQJzd4v/PmDCtAoSxeG9xNs3gTRKYqhkTrEip1tuzIOHThC3+bry1eSRq4vVvwcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+k0EH+6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771787543; x=1803323543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBO4M9vSigHp2cMcVMsbdryITkk7+TuQZxjvoHiAfT4=;
  b=n+k0EH+6qARiivhri4KPHHdCitIvtFa7JuIhhv4S07owHD1MlWveIMfQ
   yHXMaulcp01vGU2+lceUYXFig8lmzh77MFGIkFfov2Z41AiFfmYSuhyAx
   /kzqN65h/bHaON5XJNuUZF5b8elu/dhi2VXrAxnKAv0ZpcJGPrmjjY+v4
   sH98/5RRrpNumlim4KZRN5hVhnOyU67jA/j7hTZzhY0+ai2/TEh8tLC8i
   sIbJ/cJEL3KXuWe6ABNm9CauJ+qSDgECjZNVYS+OLXflWNJ+w1escKTOd
   H6zJ5ktBo8SJaoA0MrAEvB5+Tfep0LFhhhTNl3TfZjA4lxc+/auM5kpZe
   A==;
X-CSE-ConnectionGUID: bqZb7ucjQHmxEebivHxkLg==
X-CSE-MsgGUID: kp8CT1L9SV6+9NtWrFVwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="60366408"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="60366408"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 11:12:23 -0800
X-CSE-ConnectionGUID: ma16+aahQFiGBDi4OeZOaA==
X-CSE-MsgGUID: bnlfcrF0RkeuAz3ai5s8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="214593616"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.171])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 11:12:20 -0800
Date: Sun, 22 Feb 2026 21:12:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <aZtVEdFoGUMx4olM@smile.fi.intel.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
 <aZbC51ezuaT5Nwq7@smile.fi.intel.com>
 <aZj3deh1Em1rz3au@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZj3deh1Em1rz3au@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31997-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3D73170251
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 04:09:47PM -0800, Dmitry Torokhov wrote:
> On Thu, Feb 19, 2026 at 09:59:35AM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 18, 2026 at 06:29:28PM -0800, Dmitry Torokhov wrote:

...

> > > +	if (error) {
> > >  		dev_err(&spi->dev, "Error in spi setup\n");
> > > -		return ret;
> > > +		return error;
> > >  	}
> > 
> > And since there is already dev_err_probe() in use, I would expect this
> > also be converted.
> 
> But that would be unrelated change ;)

I never told that this should be done here.

...

> > Would be also nice to use
> > 
> > 	struct device *dev = &spi->dev;
> > 
> > to make less LoCs and/or make them shorter.
> 
> I actually dislike introducing such temporaries in majority of the
> cases. It makes it hard to follow what device we are dealing with and
> does not make the code significantly shorter.

May be, but my experience is telling me different story.
So we have a disagreement here, I leave it to Jonathan
to mediate.

-- 
With Best Regards,
Andy Shevchenko



