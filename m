Return-Path: <linux-gpio+bounces-32382-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBsPICZipWmx+wUAu9opvQ
	(envelope-from <linux-gpio+bounces-32382-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:10:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFEC1D61C4
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EEC43097DE1
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC929396D03;
	Mon,  2 Mar 2026 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLxf1Xhd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D1D39448E;
	Mon,  2 Mar 2026 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445789; cv=none; b=mD+jdLSs+EGLlxTaSxysNUBKA7fdsWN57zN3S3XfsuN7g5yKUHBXR9UC8WyMiNpzGPbdAa8kLCnxXN+8rw42IVIMNx3rI2KaSB93PU6gDqHjBaniy8IPONt8zsYa8Qm5YnGk0wJOlv8Us1Lzgs9VQRLza8N+64R2nN/6aeiQeO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445789; c=relaxed/simple;
	bh=k3+V1Vza0ZOHM/5wYM24NvzgrqPCTUOwW1bOkoTbH6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cODL7QbbjiMDeNvw3tEwjILKIYmYOVbZ3s/mvTr+PxbQaGkV5ljlJKVy5/qyUaYOQDmfyDgMvMMGMFwzB9F3FwKf8HHq37fokPxZckkW+B15sHvGT+T2+yHL87+SWmO4guSufrBAmZ3aDLCijG8tz2aYp7f1wpSZVSbBl4odF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLxf1Xhd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445788; x=1803981788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k3+V1Vza0ZOHM/5wYM24NvzgrqPCTUOwW1bOkoTbH6c=;
  b=MLxf1XhdBgslnyw1Io2UUVkaAnqCBLbC18gL7CKl0xZFkWk+CSlj2t/0
   YcwTKRC3CtVQ1mg+EJw8LE8jxls0Mq659nUF5lDHVgw7ggAlHttwakzzV
   jYgfT/vCKi8h3gJi5CXe247uo7QKZ1IUI1jlxVroFkGTol3qjBnOCf59D
   b3BwOQF4aoBvO2OtDzCQrLbRZI7uWzCvf0zuwsQLmhcd9E3Z5CXA9gIUt
   dgdB2E2YsNSKCa8XeuC5UQ5wNyaHldSeAHp1pj9s01sYaPzj6InGN+Ni3
   RWFur2SI7J51DICC6OG+eLfOhMiMDaErgmpzGP0Y/liHmDrM9nY0Mlf6w
   Q==;
X-CSE-ConnectionGUID: FxEQfgVPSEiAQYqluXMVAA==
X-CSE-MsgGUID: 1R4U+KKgRQGVrMZD8JIhxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84086738"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84086738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:03:07 -0800
X-CSE-ConnectionGUID: Sk0A7M/MRIGFBfWXpUqDsA==
X-CSE-MsgGUID: UHVMisYtRv6zhNG5z9VV5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="248107302"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:03:04 -0800
Date: Mon, 2 Mar 2026 12:03:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Zhu Ling <1536943441@qq.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andy@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	chenbaozi@phytium.com.cn
Subject: Re: [PATCH v1 3/3] MAINTAINERS: add entry for Phytium platform GPIO
 driver
Message-ID: <aaVgVrRMw-JZGRWO@ashevche-desk.local>
References: <20260302095147.2483-1-1536943441@qq.com>
 <tencent_C5AC554BD66AA42D2165B044CA4EF1CC8D0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C5AC554BD66AA42D2165B044CA4EF1CC8D0A@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32382-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBFEC1D61C4
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:51:47PM +0800, Zhu Ling wrote:
> Add maintainer contacts and file patterns for the Phytium platform
> GPIO binding and driver files.

Doesn't look like this placed correctly. There is a script to sort the
MAINTAINERS database, please use it to find a better location for a new record.
scripts/parse-maintainers.pl

-- 
With Best Regards,
Andy Shevchenko



