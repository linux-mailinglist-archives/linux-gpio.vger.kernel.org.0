Return-Path: <linux-gpio+bounces-33003-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBYUEIshsGmCgAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33003-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:50:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C320C250DBE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D29B03178AC2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CF23BD25E;
	Tue, 10 Mar 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DycqRz8L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14813BC698;
	Tue, 10 Mar 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148100; cv=none; b=goy28rnOTZXtBpBm2rnhTnYio4QIfJ1tJlZgbtSoRJ+zoEw81EPiNf9nqfO5UxlkYBOeN6FhFhKuCq0GVCDbzRxdyYeY2ad+ptSaQwC70gFqLPyaiT55lzqoMoW6xwJ0F6zOfwqmKwJSo8msW0x2LYS0ERDoLYHKoHeoH0ZCHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148100; c=relaxed/simple;
	bh=PNtPF+6+9BLZdw7Fv51u3Gdscr7W/mh2J0X5wUWuSV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbQ3QYvmuQ70whAVU9dbD92wOFuYmHVsR6B0OQsVxd/HDQup8BQI4HiuNUVkBmbC4n3XzRK3DvZIQ9gKk4YynOVm1/smkvQh/5EQ0WnFRCkV7ke5QpO4ZwP2g7RW+7jyghbNf6IHG3qYHxNgMmDdQ5JRz38j5Ay4tn1ptDntVCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DycqRz8L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773148099; x=1804684099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PNtPF+6+9BLZdw7Fv51u3Gdscr7W/mh2J0X5wUWuSV8=;
  b=DycqRz8L0Jxp/TMgJCBE8/GtiYnosXRRsRQ5ijPqhwb+BM7p+SQcdQnb
   23biqQjAcc4EO/pk5KT2UUZi5Iws9er87Bvcu1P3ef7Mndo1HNa8+qSgm
   CH3j55bwi7e8hUAm3pmJ/sPPcD05VfsE4P/08hTSsck6l+Vr5FmXMrRAR
   e2bDGXj7yRm/ig27nzg4BoVd0ulveCBCboI75QE8/Qff2ySDRtq4Xaafs
   MWozr3bHBLJCemkKyRqT3BM+cTLVeIJKHGZs5hy6BDmhXexsO0d74q5cG
   SfSw2a245TbdiLaS6ZcWhmfPVYbzCIflZdeWp8JoLADkJPIIjLT5TO+zi
   w==;
X-CSE-ConnectionGUID: /EzJ6+91Qqepr6jrjudhHA==
X-CSE-MsgGUID: +TEIV0crSbOf5JlhK2xsYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78072000"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="78072000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:08:18 -0700
X-CSE-ConnectionGUID: U8h2QeN8RhWWdTYnuKiEng==
X-CSE-MsgGUID: wbLoUW1OQZGAP/W00ccuEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216889957"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:08:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7676A121D13;
	Tue, 10 Mar 2026 15:08:45 +0200 (EET)
Date: Tue, 10 Mar 2026 15:08:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linusw@kernel.org,
	brgl@kernel.org, mchehab@kernel.org, dan.scally@ideasonboard.com,
	ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org,
	sre@kernel.org, hao.yao@intel.com, jason.z.chen@intel.com,
	jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
	ribalda@chromium.org
Subject: Re: [PATCH 1/5] media: i2c: ov5675: Wait for endpoint
Message-ID: <abAX3WVzKgTIynW7@kekkonen.localdomain>
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-2-antti.laakso@linux.intel.com>
 <14af1139-cb61-4519-a769-23796ecca3e2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14af1139-cb61-4519-a769-23796ecca3e2@kernel.org>
X-Rspamd-Queue-Id: C320C250DBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33003-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Hans,

On Tue, Mar 10, 2026 at 02:03:30PM +0100, Hans de Goede wrote:
> Hi,
> 
> Thank you for your patches for this, cool to see someone working
> on supporting this!
> 
> On 10-Mar-26 13:44, Antti Laakso wrote:
> > Defer probe if endpoint is not yet available. And do it before acquiring
> > clock, gpio and regulators.
> > 
> > Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov5675.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> > index ea26df328189..81916fa8c117 100644
> > --- a/drivers/media/i2c/ov5675.c
> > +++ b/drivers/media/i2c/ov5675.c
> > @@ -1181,6 +1181,13 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
> >  	if (!fwnode)
> >  		return -ENXIO;
> >  
> > +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
> > +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> > +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +	fwnode_handle_put(ep);
> > +	if (ret)
> > +		return ret;
> 
> This should be:
> 
> 		return dev_err_probe(dev, ret, "failed to parse endpoint\n");

I'd keep it as-is; see
<URL:https://lore.kernel.org/linux-media/20260310080038.1182695-1-sakari.ailus@linux.intel.com/T/#u>.
V4l2-fwnode also prints errors (albeit on debug level) on failures.

-- 
Kind regards,

Sakari Ailus

