Return-Path: <linux-gpio+bounces-33993-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AfVDb7zwGkwPAQAu9opvQ
	(envelope-from <linux-gpio+bounces-33993-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:03:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D20AA2EE06B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B4C23003D3C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 08:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E9135E95C;
	Mon, 23 Mar 2026 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8eZFjZM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABAA2C187;
	Mon, 23 Mar 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252986; cv=none; b=MKFvKCzX+Qq2heX0Kr4OzrXKSiGrl0AhT7xy6s2lVoBUn4fn1GRyqNMEyi6u6sZzeYLhFR8Iu42NYQ9Zcda1FVFlepujy3PvkAbMB1UbAtW4bqCcsGTqd8pmcAubDvdXoLCUmLi+zWy9xLicDrPKZIRDCm8NElXoz3qGFWkDAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252986; c=relaxed/simple;
	bh=23wvUupD7z2heMh29Yvr/0kT7GzmUPE/AucCHNKTs8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfJy4Qa1woqtDsqzHvli583CzezyUsTeMdZPRQ3BCr/Lj1ofjh4XuYDKx6WQlyqKc+4uCMfx9KwpbsmBoJnvFVgs/PnEwW8wnNWu4ETP9IHM6nq56ikXRR4kK2/1WdsDsDErcTFjbwHeCTmiaSCblZN2szU2Vk04LO/+ym90oGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8eZFjZM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774252983; x=1805788983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=23wvUupD7z2heMh29Yvr/0kT7GzmUPE/AucCHNKTs8s=;
  b=T8eZFjZMozNlNh9MlJzZxFHIZkWQCbYQrWm923x+QcfDH+KVeFpEJrFw
   N9oAKjcDtYN4jGYA/xKU41p41eu5DWIZhyoE4aMF/kSeX0zORqp6s4TME
   O3LfE4B0x6/vDvMDbU4NsB70KOyX4M6241O/1F42YPUj3IkXNb19h2Wvv
   1ghAYZNsDkHeGBWmokS6MFBtc0/63jog1PsNgkmYJ4ncGLmak86PzX/xj
   uDS51o9XUdJ3mTvErhpmGYQboUuJtsYu/M/5avVaKq6ERYX3z/cOZzT1x
   USwStylokFdp5ImD1KZn6Z/kMEuMBHpk8MPZFiy/zMnZFi3WVSJLQTSaf
   w==;
X-CSE-ConnectionGUID: IckGdHz8Qo6/YIiBIKpdyg==
X-CSE-MsgGUID: oMMtHaAtRYOtmqjaiFmq1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97866291"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="97866291"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:03:03 -0700
X-CSE-ConnectionGUID: VnDVyWwnS0ipzDBp/IPZvg==
X-CSE-MsgGUID: RsnSiDuUSKWZiIBlERxpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="223021677"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:02:59 -0700
Date: Mon, 23 Mar 2026 10:02:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Tom Rini <trini@konsulko.com>,
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
Message-ID: <acDzsKoMdfcXecca@ashevche-desk.local>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
 <acC2fSdjDmj5Wp1a@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acC2fSdjDmj5Wp1a@nxa18884-linux.ap.freescale.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,konsulko.com,gmail.com,nxp.com,analog.com,timesys.com,googlemail.com,microchip.com,altera.com,lists.denx.de,kernel.org,oss.qualcomm.com,vger.kernel.org,arm.com,amd.com];
	TAGGED_FROM(0.00)[bounces-33993-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: D20AA2EE06B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:41:49AM +0800, Peng Fan wrote:

[....]

> >+	ret = snprintf(NULL, 0, "gpio_scmi%d_", bank_cnt);
> >+	uc_priv->bank_name = devm_kzalloc(dev, ret + 1, GFP_KERNEL);
> >+	if (!uc_priv->bank_name)
> >+		return -ENOMEM;
> >+	snprintf(uc_priv->bank_name, ret + 1, "gpio_scmi%d_", bank_cnt);
> 
> build fail in CI [1]:

Moreover, this is reinvention of devm_kasprintf() to begin with.

-- 
With Best Regards,
Andy Shevchenko



