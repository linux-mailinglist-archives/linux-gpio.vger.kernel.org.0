Return-Path: <linux-gpio+bounces-30841-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JDVCLWucGmKZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30841-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:47:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D29305576E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 193EA661C9B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 10:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E337B47DD5F;
	Wed, 21 Jan 2026 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEXMcezP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE74500978;
	Wed, 21 Jan 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991014; cv=none; b=q9FDnr6nL9XgrqXw30kkIOrT+zs+IHS6GzMIet8+jgIirDVY1Pa9bCoSjwCfv4IEIbKlMdqLZnfd+r4m63uN2B4n/ASswa1zoBmYHRama9RLjeqrlXJmgDPll6P3TCla058wWQ6dAOzmod6xWGNQL+//dTy+1sMOdioqdJEwLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991014; c=relaxed/simple;
	bh=ekDTccZ4XTF8np5t2ube3xIR0jfbzSJiWbsY/k+ToHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fpnkdpk9qJDnt1+OtwM3CwcuXtcJNTbj7wR9m0wMTcJpeJGIb5nM17NnVV4yijltT0MCMvhhn8/Sq7cm4nXjcZy6uW2YY6VL+4w5+qM8zrvgpWSFX8R9aBAL3uZZJI0i7Wr+OeLJet5u9GqXSjdUnVGaZCYGT7OIH+REiEuKTwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEXMcezP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768991012; x=1800527012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ekDTccZ4XTF8np5t2ube3xIR0jfbzSJiWbsY/k+ToHY=;
  b=YEXMcezPzrWibpq/L/WCfRFbll7iyqMaP+71L7VQD95IP6J0768IYh5E
   v2eABcfKUqhrl3MIiEkVyTabNo7SZoRoN4PwIuc4k/DQyx8LI7GZPUWZ3
   lHge1D3l8e+2YNUgr140NJ/DGZUPOuwd4vaVvGFqqOmocwl9gASgcVaH6
   tdplzIkBkwKVcQNmWvuCSqoJCrrpaXgzIhdDgZUzmb9RIlUKA+Z2DsNLU
   /2401GLF/B6GzQleRcaLNUYkifA3NeuXNcV8oRmaOOEu0s12FKPguT6GG
   fPX779L20eC+IoLtp3LQwdLw5w4HEBl5cpOvPM8+2JpY48bArnZVvDy1g
   g==;
X-CSE-ConnectionGUID: +WPeGwEvR6qKyewkmk8wPg==
X-CSE-MsgGUID: PKbYdFhaSv+qPgzyC9xsxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81659649"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="81659649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 02:23:31 -0800
X-CSE-ConnectionGUID: rgl4xNtUQLqUWuD6vG3TOw==
X-CSE-MsgGUID: pcvavRLZT9yqHognu0MnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206226548"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.69])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 02:23:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 69B9C121D78;
	Wed, 21 Jan 2026 12:23:31 +0200 (EET)
Date: Wed, 21 Jan 2026 12:23:31 +0200
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
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev, mitrutzceclan@gmail.com,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH RESEND v8 20/21] media: i2c: remove MAX96717 driver
Message-ID: <aXCpI-6sAmz7cDX9@kekkonen.localdomain>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-20-7b8d457e2e04@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-gmsl2-3_serdes-v8-20-7b8d457e2e04@analog.com>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-30841-lists,linux-gpio=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D29305576E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cosmin, Dumitru,

On Mon, Dec 08, 2025 at 04:13:12PM +0200, Dumitru Ceclan via B4 Relay wrote:
> From: Cosmin Tanislav <demonsingur@gmail.com>
> 
> The previous MAX96717 driver has been removed and its functionality has
> been moved to a MAX96717 driver which makes use of the Maxim GMSL2/3
> serializer framework.

Please use imperative form when describing what the patch does.

> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  MAINTAINERS                |  1 -
>  drivers/media/i2c/Kconfig  | 16 ----------------
>  drivers/media/i2c/Makefile |  1 -

This patch doesn't actually remove the driver, same for the next one.

It'd be good to have comments (acks hopefully!) from the authors (and
users) of the existing drivers on how does the new driver work for them.

There's also no need to resend patchsets to get more attention, please just
ping instead.

-- 
Kind regards,

Sakari Ailus

