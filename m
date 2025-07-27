Return-Path: <linux-gpio+bounces-23855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B28B13180
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 21:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C81B17A93A5
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 19:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC32921CFE0;
	Sun, 27 Jul 2025 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXrY469Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE82E36EC;
	Sun, 27 Jul 2025 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753643845; cv=none; b=sfX0bTujJCqzT5qqR7GIG/JSW2DNh3b/QsbpDtNDEQU2JwajKpUzzQ4y97abcElM0jO6U16Bc4E2cTiIekxtzNg2B8zlOvCRvj/z2rTWIL5xYH4hpxBd6p602Cc9216eTLmq5ELS9qUegZieka7tYBA+ZQyYI6NID4vvOLW7LIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753643845; c=relaxed/simple;
	bh=DA8SKo3gjxFsO4naG53gpmTJP6cZpBTggbw3PhnVU4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppyO/bZ3H6VROm8Iu2Tb019hpAkT4VIZeuo3+x6vioLENJjRaB27jXD/BvOldTDDIPXzR8h5bjRlFH/VzYd6EON428S6sMfrUqyP9EbJ7C4U4r9NP0vrupZhpabRt2w8V8oMecrceJHwLLppllTOJXHF9GlGMOkhzFc2Ic/v21M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXrY469Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753643844; x=1785179844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DA8SKo3gjxFsO4naG53gpmTJP6cZpBTggbw3PhnVU4w=;
  b=mXrY469QJXQN1a3tkjD9HvBYme0W4muTu7x5Hl5kO5+DXZseyjIZOGjF
   0lTw/1Rv6S9wgzZbvIYkOyCbVUsm3aBSF+SJ1c/yq181eVYjtyzSDxYqm
   Fci5uUcMpXUyNCF4W5+Gfb+0si2hn6Mnq7EprKOkZuv68TpvL9QYotV8G
   M+n3TOjUp7ntpuWKLZzPbF33j/i61wCfSEgnfkiMO9XGQnX7uO/u1h7jG
   uxjAmh1LpURXbUwqJPaZfGFLPQJAXKhzlyIJqA5gLXAimxz7ZLA8Bw4aU
   emQwHdvnMQ9znCooOn7GqF2lFr8LVOMZuGRhxxWYXUCxEjumkZK4zIsJU
   Q==;
X-CSE-ConnectionGUID: owJkwvbRS4+CfXKJHmfpiA==
X-CSE-MsgGUID: MeAYmFH2Stap6x1IX5tU5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66601290"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66601290"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:17:23 -0700
X-CSE-ConnectionGUID: XAqqRAWFSFaddf8FjFc9yQ==
X-CSE-MsgGUID: fpTgazu9Qj+8pamhVTDu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162109573"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.124])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:17:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 83F1911FAF5;
	Sun, 27 Jul 2025 22:17:17 +0300 (EEST)
Date: Sun, 27 Jul 2025 19:17:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 01/24] media: mc: Add INTERNAL pad flag
Message-ID: <aIZ7PVTXVDGZN-60@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <20250718152500.2656391-2-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152500.2656391-2-demonsingur@gmail.com>

Hi Cosmin,

On Fri, Jul 18, 2025 at 06:24:37PM +0300, Cosmin Tanislav wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Internal source pads will be used as routing endpoints in V4L2
> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> Internal source pads are pads that have both SINK and INTERNAL flags set.
> 
> Also prevent creating links to pads that have been flagged as internal and
> initialising SOURCE pads with INTERNAL flag set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Could you use this version
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=265fd80075b5f3d25525cf026f33f8fa8572b3d3>
of the patch instead?

I can't yet say whether my metadata series should land before this set
though. I'll try to send an update on that in a few weeks' time.

-- 
Kind regards,

Sakari Ailus

