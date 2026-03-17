Return-Path: <linux-gpio+bounces-33659-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ez+GCd2uWm8EgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33659-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:41:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A862AD332
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D66963063AE0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B022C3EC2F6;
	Tue, 17 Mar 2026 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIybufMZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AA3ECBE2;
	Tue, 17 Mar 2026 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762035; cv=none; b=Jm2SIMEII2emtjBVsAZFtT0bAvEUfS0K5e3yWkvBynoTf3UMdJ9mue5elspXyHt8trZwxxx/hr8ErZQk8wBGCBSpo+JBDJX4bCHCoKB1zrHtg3hW/2zvhDkMnV+Xesby5c5Wl7ganb6nuMnPOviUoq0LH0t1FNDVc2WEcKLWaos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762035; c=relaxed/simple;
	bh=BVfGgsU0dq7oLRa6iuFSj41rR3BBEHd0nSeCzegLF/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqypVMP1tBncM3GnQQzI5HGKkyPalKQJ93AsMOCJjDHxwDq5eitu20Y8ZJaQP0Qj7/9vC9onas3+HzMHPGhMTYKGruvM3u3sKSqGSu0wdDGMldhkH7VCTVZck1Dwl7iUvVzrZTUSE91Yw+wBiW7mKT/uTVyN7Fpy2Kuqr6bzetM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIybufMZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773762031; x=1805298031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BVfGgsU0dq7oLRa6iuFSj41rR3BBEHd0nSeCzegLF/A=;
  b=QIybufMZhIkvHRMN3+7/SYKaeq+hqjtQglZr7llTmUzEEd/fNb/z9I9a
   j14nfEoZQfwnAn45IGGaCARR38MN4iggnOAKL7Ep5EZTqfxaLjXTkUcAG
   QoFaC5WyEzQ3V/1PU/FQCptb4QenSlnk0h/RcUAkcx0SSUp2Ntw9bXyeQ
   LYyqGa5yTOI6CpUkoBDfvpZls2CkNzXiXlReJ+jWARduWNVyek/esiSZ5
   WTZn1oqTpvXXQo7hDEObuKY7wB5rRHCWeXPXzPOHq5F0tn2Pb6MsKzCE+
   3ardMMWA/ljDpxvJ4PhLt6QHr9/x4ZPJUooNNgkJ/6a1bU9EmfZi3QI2O
   Q==;
X-CSE-ConnectionGUID: oq9dhSuVQqeiuatakbEmjQ==
X-CSE-MsgGUID: nnoqO5bNR9yk8MZ/TBJEsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86153026"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="86153026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:40:30 -0700
X-CSE-ConnectionGUID: CZUY3ldaQwuDvx0rCf8Erw==
X-CSE-MsgGUID: Hp6r3VnxQEGg5t9tvTyB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222528333"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:40:28 -0700
Date: Tue, 17 Mar 2026 17:40:24 +0200
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
Subject: Re: [PATCH v4 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <abl16AXUQwQKr1L_@ashevche-desk.local>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <22af6c960a7d20eb09e57e91821abe7ffbc52b9c.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22af6c960a7d20eb09e57e91821abe7ffbc52b9c.1773757772.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,linaro.org,arm.com,amd.com];
	TAGGED_FROM(0.00)[bounces-33659-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 02A862AD332
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 05:40:20PM +0300, Dan Carpenter wrote:

> This is a counterpart of pinctrl_gpio_set_config(), which will be used
> to implement the ->get() interface in a GPIO driver for SCMI.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



