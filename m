Return-Path: <linux-gpio+bounces-33076-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO/eCMYgsWmOqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33076-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:59:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B925E4E6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB7383006118
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FF83B6C07;
	Wed, 11 Mar 2026 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZ0A6cuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41BF3B634F;
	Wed, 11 Mar 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215776; cv=none; b=NynxQL17gowBm6F0rgbp/m4V9CWI7gHFip5a16SH9/ELXdYmE51GLTq5/zBoN/lchLLb/BIPgO/BAfIDBVenPDBooDmyZA6EHnrldmLjtCeEc4oQhe4V0Ntv1odq2BAFTBxvm8BiUymDe05eYnaNXsJ9t1FDQXag0li/MPQBTOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215776; c=relaxed/simple;
	bh=wrxYXlZRJSn+G0+lG+GZEGg2tKImiugM59D6Po8dyx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXpakk+HxOsXllDVWdrvHp9/jnEjp06hUcilj84GAJ4SNGIsFiiFOc6s1Ca+IA7SR1GwBN2HRz0I2unOEHGTnxCUeSbgoNgiqUZFoCA39BupUXw7fNsBYX5fOGom2woSQn9DabQAq36QiJPZq00KdD6al076PxTjxKr6ZxrAl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZ0A6cuZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773215774; x=1804751774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wrxYXlZRJSn+G0+lG+GZEGg2tKImiugM59D6Po8dyx0=;
  b=lZ0A6cuZ64gBr3ZlNAGwmjfOhAuUjeAzlIkrydLhPKC7wQmu82oqO5YE
   pH3oO8rVYY669tRmbmdRCVfnk1Ca2PqEncvbkdf+vdR9qEAMK2veywnuY
   GnCwmGqXBFGTAkVHrkF2KnqwHQxXVlmkZ2p2DETb7ERo6J3X12v9Jy2LF
   bHqYve+FmmlibPuzhwKNl+7f2FPGYISL1IOu1RRvuTwz+fwY2aFK7o5ST
   wu6tF0s7r9p+vNa4gURWoQO3xcrIcYfvehL+yI0jWR+TQL8Va/aQ9401h
   H0YYlIlBX4BHgzNVKCRWdpvkFV53cl6ckzdme3D3NSRdAxWdq+KRElu0R
   g==;
X-CSE-ConnectionGUID: gECuVtgrQeuzufCC4/LSFA==
X-CSE-MsgGUID: RHobIQOjSJGI/xhWyTQ3VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96891300"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96891300"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:56:13 -0700
X-CSE-ConnectionGUID: DjhtToR5T4ug/Vyxm2ukJQ==
X-CSE-MsgGUID: RBZ5t7GWRBWC7fiMKtZdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224851804"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:56:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0A05C120E92;
	Wed, 11 Mar 2026 09:58:03 +0200 (EET)
Date: Wed, 11 Mar 2026 09:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <abEgijQAqW27i5fU@kekkonen.localdomain>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
X-Rspamd-Queue-Id: D88B925E4E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,analog.com,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amazon.com];
	TAGGED_FROM(0.00)[bounces-33076-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Dumitru,

On Wed, Mar 11, 2026 at 09:17:12AM +0200, Dumitru Ceclan via B4 Relay wrote:
> The following deserializers are supported:
> * MAX96712 (already exists in staging)
> * MAX96714 (already exists)
> * MAX96714F (already exists)
> * MAX96714R (GMSL2)
> * MAX96716 (GMSL2)
> * MAX96724 (already exists as part of existing MAX96712 driver)
> * MAX96724F (GMSL2)
> * MAX96724R (GMSL2)
> * MAX9296A (GMSL2)
> * MAX96792A (GMSL3)
> 
> The following serializers are supported:
> * MAX96717 (already exists)
> * MAX9295A (GMSL2)
> * MAX96793 (GMSL3)

It'd be nice to have more reviews as well as comments from the users of the
existing drivers especially on how this works for them.

Are there differences in functionality or UAPI compared to the drivers
already in upstream?

...

> The following v4l2-compliance test still fails:
>                 fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
>                 fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL

Could you post the full report here, please?

-- 
Kind regards,

Sakari Ailus

