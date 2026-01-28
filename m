Return-Path: <linux-gpio+bounces-31237-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGdZIKoNemmS2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31237-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:22:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B5A20FE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F42330053BC
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D97F352C3C;
	Wed, 28 Jan 2026 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDNeUpoN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255042F0C45;
	Wed, 28 Jan 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606567; cv=none; b=ZMOyp+KKpVO6TONolvC54FoNT9esPq4mr3+tD0RmVVoQFDyJ+sE/F/CYtP1aS1cqyhQ6aiDw4usSCeb/+nYEGfffz/A3zDYFykx2fxVo8Bjr37edP3hefqYVXBtqFzzPX7UY2tQxOSJPd/5Fj4FODzcLi6O7wRFbjlzcrbOxfgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606567; c=relaxed/simple;
	bh=Wz79oYG7pUL4HdToVJs/MANATGOHX4p9SVmxVs/IaYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksyzhm+xJrjOuJKEuii8fKpIUcOBVnw8S3AThy33Bvy3k+LcF3ddgCglPOYpA9k0UArJHYJrBYHpeqOJKgDKhmlh3eXpEuVt4iSYrDtKk9e9joGR3M/KsYSlak2FqBgewPIwcccHayzr2EL0aMKEYmqWqhj3K54LWcpBTEWHSCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDNeUpoN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606566; x=1801142566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wz79oYG7pUL4HdToVJs/MANATGOHX4p9SVmxVs/IaYc=;
  b=NDNeUpoNWiPWxGxT1mIXdwMJQBMFXKwXzfpbyzH0825vWqn7kCDCJrBd
   saYg5qkX93QU+RiEUGJF6ScIs4RhsH+0sM4g/6MxTBXFLpPS0Hbn5opx2
   eMIlcMTylBAFrDlTJgB74tr+0eJn7Angh1NCj7QXr6SLZzI0OljtZqYAp
   0DVpWYom7aD5967i3Z7CQH70ZlojBo014+zka8JPnDguIe7HFjawoy20J
   nEMt9YG7hJeZ6k5Gg87P0Kj/1n9QfB5SntaBMOvatJHxZeZjKNJP1KuMZ
   32l20WNpea7o41+H7tznLyvWsbmAxQx5IpZiU6DSTZvTT1eIBZTlxb8tk
   Q==;
X-CSE-ConnectionGUID: Er9NAp8vTVWqOYgO6cROAA==
X-CSE-MsgGUID: 1O81W+NVS8uNjeV7h5emOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81925210"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81925210"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:22:46 -0800
X-CSE-ConnectionGUID: 0wd288A7QDa5lqjucxcgcA==
X-CSE-MsgGUID: 3Xk/fEZCS7Sj129SSmgcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207889140"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2026 05:22:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4202B98; Wed, 28 Jan 2026 14:22:43 +0100 (CET)
Date: Wed, 28 Jan 2026 14:22:43 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: cherryview: Remove duplicate error
 messages
Message-ID: <20260128132243.GQ2275908@black.igk.intel.com>
References: <20260128125343.52497-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128125343.52497-1-andriy.shevchenko@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31237-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: E84B5A20FE
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:53:43PM +0100, Andy Shevchenko wrote:
> The pin control core is covered to report any error via message.
> Since that it's not needed in the callers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

