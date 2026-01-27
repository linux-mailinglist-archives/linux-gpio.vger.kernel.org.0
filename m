Return-Path: <linux-gpio+bounces-31117-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLicD6aCeGmqqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31117-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:17:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4259195B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC156305185E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C043332919;
	Tue, 27 Jan 2026 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWtzN8S/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31E3321DE;
	Tue, 27 Jan 2026 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505197; cv=none; b=WZA+ZxfKEkK6CbSnDsaKnyTJ3Mk8m28Q+iJxOG/IwAQRNBQ/LR42t78lPxpP5gI7G7MVqiHet9GerM4kz08EO6yAFMVDOQkh+ikag3uN8K1COfehBXQkKMZuMEHZwmDLY/uB18Ygw9dcF8xwo5+wUHll5qFQwK5naG6Mz8WLOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505197; c=relaxed/simple;
	bh=DKi74dpApRWMH1+AoQSBPDFhKz0X1axdGEW/zq+7JAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdRKsr8vn43WQc0cAH+FOhL60ySPUUZzovPLfaG8uvN/3joZcEOlX7tdlWw0wnFboas99+UibYn/kFEn0CfOh3sMzuvycB8er+hZ0eA5Qvp7K1hyWeSswQsMgiEIcsVSSA1Tf/G4jX/v4YMCXiKhWzT7wM0LkS++c20VefH4788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWtzN8S/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769505195; x=1801041195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DKi74dpApRWMH1+AoQSBPDFhKz0X1axdGEW/zq+7JAk=;
  b=MWtzN8S/TWrDGQMUFYbrscbMeUXljuQjgRSD1NarDktwdVgw1kN1SFzx
   PSbVs30t15BcwE5toMr5fjbJNvIIgczOShu35vRtTUnaTvv2WKL58DAqc
   oMJbcZjIetxCcfeQelth9XcoamiMLT7zJbDdf+jenUi7nlo/9kogxcbxX
   cD5MEmV+CY+7V3Nxrha7TK3sAGdKWI9eLtx+UC6zUhH5R9Wlo0zHGaGV9
   u5hd7v1gHra227D2GmQmyryti8GdwAmmBdE1InetmyeXAkgDrak8vUZcP
   FmPZta5eb6iWldYhdqSvtpMmaGXgLAnk5uZMHIV5tdjUp/Wf6sdd+H4BA
   Q==;
X-CSE-ConnectionGUID: 36HRoK7WTsGqyi2wWtS0Uw==
X-CSE-MsgGUID: 8xKKbKOFQQKv1FB8PkthWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74318849"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="74318849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:13:15 -0800
X-CSE-ConnectionGUID: RkKGUZDHQDKcz2fQ4re1JQ==
X-CSE-MsgGUID: QZxOqxIqQCqyGHW7RDLG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212390111"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:13:13 -0800
Date: Tue, 27 Jan 2026 11:13:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Join tng_pinctrl_probe() in its
 wrapper
Message-ID: <aXiBpynRh9709fCw@smile.fi.intel.com>
References: <20260127083845.3681331-1-andriy.shevchenko@linux.intel.com>
 <20260127084309.GB2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127084309.GB2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31117-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 6D4259195B
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:43:09AM +0100, Mika Westerberg wrote:
> On Tue, Jan 27, 2026 at 09:38:45AM +0100, Andy Shevchenko wrote:
> > There is no clear sign why we have tng_pinctrl_probe() in the first
> > place when it has already been using managed calls. Join the function
> > to its devm_tng_pinctrl_probe() wrapper.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



