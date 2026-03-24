Return-Path: <linux-gpio+bounces-34082-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPX4GMh7wmnqdAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34082-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 12:55:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B767A307B74
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 12:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83405304BCE5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 11:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DACF3BBA00;
	Tue, 24 Mar 2026 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLBDlEu/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7945236AB4A;
	Tue, 24 Mar 2026 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353210; cv=none; b=c51bC/IwoY8HCXu/Gg5+mKrZ6uiWMH+BVkuC7btD+w7OIJ2jeYKiPe9rtirCMRi2UUdNorw5fcMcqE3UAMKAhLiHDfQuWGkv9nEZBQotPR5svXsx/aomHJDd2ZV2SjYjeJ/u4HfliwLLEyoDAt7s5Qk/cpbgxbcAAUD7d+FRhfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353210; c=relaxed/simple;
	bh=0PBNBmGbmulLwLv3acbA52j+2yPqgm6BRU/oaeG/EgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLr7wjN4xPY3PXvbV46cTlL2YcbhhmIdK5rTAlsU2jEJzfF5H1PFFMTJ7BLbk+mjK9D2BThAfTDpzobH1tCxU52x2tailTxIRT3gSDN9o4vHB2HxbNwKlYJ6QnETCLi6GPHz/SOb+oRM28eJpeG4X0ATTsLJEZTNAi4PIVG6ty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLBDlEu/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774353209; x=1805889209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0PBNBmGbmulLwLv3acbA52j+2yPqgm6BRU/oaeG/EgY=;
  b=jLBDlEu/KLfo6QREWRZ1kq74WkBVRirPIRUC88qPOsWCwiC8767rB7QW
   SMNqFSuix6/c2l+r/nB8mJTLgD6xYwRNF0DBnfR5sP7QdtRQBizj5YLZw
   hcnk3U0U+tbGuaVkUkl7JkESnIPJrCmwZLOcIUAEOc0qtGY6EbE/KrCE3
   aRp7d7190DpdPVXONrFHLIycZZ2608g0LTn6NM7QMMyL4NGor77zUzmKY
   TmIn+g8e7XiNMBMcHYZLo7rUVrzJydavYkwCTqwF+lRCr9PzbLhFdsxqR
   4xaGtg2w3cZruiPLKBIGKevnIKP+MjkSQDzdOO94hJMvwU+0a1AYgB4/z
   g==;
X-CSE-ConnectionGUID: ezSJl/icQWyFsvWAheTVpw==
X-CSE-MsgGUID: Eclw6ilhSZmEmA7x9kx96Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75482308"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75482308"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:53:28 -0700
X-CSE-ConnectionGUID: spGosCHIQk6ByUO8OGujdA==
X-CSE-MsgGUID: oP5rvWUGS5C1l6VeyuXpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="217756091"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:53:22 -0700
Date: Tue, 24 Mar 2026 13:53:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Tom Rini <trini@konsulko.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Greg Malysa <malysagreg@gmail.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	u-boot@lists.denx.de, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <acJ7MK7vq4mj01Qg@ashevche-desk.local>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
 <acC2fSdjDmj5Wp1a@nxa18884-linux.ap.freescale.net>
 <acDzsKoMdfcXecca@ashevche-desk.local>
 <acJ4NiwCRchgq7-t@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJ4NiwCRchgq7-t@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.nxp.com,konsulko.com,gmail.com,nxp.com,analog.com,timesys.com,googlemail.com,microchip.com,linaro.org,altera.com,lists.denx.de,kernel.org,oss.qualcomm.com,vger.kernel.org,arm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34082-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B767A307B74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 02:40:38PM +0300, Dan Carpenter wrote:
> On Mon, Mar 23, 2026 at 10:02:56AM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 23, 2026 at 11:41:49AM +0800, Peng Fan wrote:

[....]

> > > >+	ret = snprintf(NULL, 0, "gpio_scmi%d_", bank_cnt);
> > > >+	uc_priv->bank_name = devm_kzalloc(dev, ret + 1, GFP_KERNEL);
> > > >+	if (!uc_priv->bank_name)
> > > >+		return -ENOMEM;
> > > >+	snprintf(uc_priv->bank_name, ret + 1, "gpio_scmi%d_", bank_cnt);
> > > 
> > > build fail in CI [1]:
> > 
> > Moreover, this is reinvention of devm_kasprintf() to begin with.
> 
> devm_kasprintf() isn't an option in u-boot.

Ah, that's what I missed :-)

-- 
With Best Regards,
Andy Shevchenko



