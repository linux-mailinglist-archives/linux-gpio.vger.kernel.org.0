Return-Path: <linux-gpio+bounces-34003-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGx7Bq4IwWmtPwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34003-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:32:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD82EF1F8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 992083039898
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D73386C09;
	Mon, 23 Mar 2026 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzEPDdhT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A74638645F;
	Mon, 23 Mar 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258279; cv=none; b=H167RyIXtnC7D6W2rsBSPIEMiIo3kK/9xrOcgbqdQd95YvEX25Ogf6wINg837VoMD8XUdo7sFpMRPzH/e+Hl2jvrYGRIcIVHVBXQiXdWO1CV8QBghr9JXshJuPbPyIOaagk+4tejKNe8WHL0PdiQQePd05PZbNEidK4rzXnhkac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258279; c=relaxed/simple;
	bh=/xaKgDzdUXAip4kiZ3mBDtc5Io2Fo7/8TxIhCfHpVcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay5apGXmXzq4syIOrutA/fN5gfS3Ilt2x7hIEnRsIBILIBfsqiGa7V5LzLwQkurmPNTs9+q5pXa/sneX6bRLqfOV5DwrZLrAoRCc9i3YNhEf2wGu9aS3syqVyQLi0hrG7Ozdmeha2U8OSPPfdNx0d63vdBwvm+zIpyDnGcMEvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzEPDdhT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774258278; x=1805794278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/xaKgDzdUXAip4kiZ3mBDtc5Io2Fo7/8TxIhCfHpVcE=;
  b=EzEPDdhTTASbb39eEzF8OJrmqUy/LnHxHD7pfioFCpyfYwhtYp/7kMOc
   WKCWuquLilg77GWY/2q7dCa1b5yAfhSX34QLt9+ehxIJ8McRekfdF23vS
   aC6VAO7phHvIPRoZNmyc4egjn/FqqtQ+N5nyem7LA2fkiNhGsRwWj9bXd
   vDdXZurvqXxrOfmKlDaFNPfjmpUU6PWi5mQmjOetxzxcgv4iz5ZXiLPSM
   5z2jaCrp4veIYwWJqVjI7QQvrqKIBondcLVWid+LRUSh8IOa5fbh1O2ev
   dDqJ7rLABs89i4B7JtH+WjO9Q+sSc+2LcTSL5EzX2OP8i6kMTHq9di6UZ
   Q==;
X-CSE-ConnectionGUID: mdO5bbRUSgaQXL6f5amDsg==
X-CSE-MsgGUID: 2Eg1H9C/SnOH1eAOZ6ZqrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100703342"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="100703342"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:31:17 -0700
X-CSE-ConnectionGUID: CJiAscDmSviIbs8GWRklRg==
X-CSE-MsgGUID: 1ViZh9WrShO4BC1TPb3Y+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247003880"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:31:14 -0700
Date: Mon, 23 Mar 2026 11:31:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v5 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <acEIYI-O8WrsowSS@ashevche-desk.local>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
 <f7a41ed017fba4a0986ffe72e06933cc1bba2406.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7a41ed017fba4a0986ffe72e06933cc1bba2406.1774087290.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,linaro.org,arm.com,amd.com];
	TAGGED_FROM(0.00)[bounces-34003-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 8CDD82EF1F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 01:13:22PM +0300, Dan Carpenter wrote:

> This is a counterpart of pinctrl_gpio_set_config(), which will be used
> to implement the ->get() interface in a GPIO driver for SCMI.

...

> +	ret = pin_config_get_for_pin(pctldev, pin, config);

Seems you need also add a stub for this for !CONFIG_GENERIC_PINCONF.

-- 
With Best Regards,
Andy Shevchenko



