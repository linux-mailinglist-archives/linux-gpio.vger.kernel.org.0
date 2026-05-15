Return-Path: <linux-gpio+bounces-36907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBZqHunyBmqtpQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:18:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E7C54D2D2
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E938B3182429
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C6C43E9F9;
	Fri, 15 May 2026 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbfN4hxC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10D43E4B5;
	Fri, 15 May 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837946; cv=none; b=nQJ5VcFq230KdCU5V77dWwooAx0LIwLZuVZkC2NzuogpThCd7pQcQX2xPHFjnBrCt/k8/gCiPbrh0GcG9CAmm1JIZmh86R5/Ngl/H/OFndkcxnSmGQRaMqJX5Ey3OlxzBhHZ0ygy0FIs5c1Z1jQQJxkNusTlWN1b81WXvLp5FPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837946; c=relaxed/simple;
	bh=dnum33wmUd6ppTliQB7OlmxdDU3p0uwt0qvpAuIvGws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixFkiHw7xTQeMftjctBp7hjKioSLjLQ0HvUQ07jopNpl4Jz8ubOsiiXM4aNWDylLaAwOVQ5aSweSxYjBUeFhZKqdS6pR4HGIPGmOHgoiAbP9cXngveIzXW/apSofS2hyDpsidJlCiYX/73LgUk5OssF49bvIDw7xwjR9IBm+mqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbfN4hxC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778837945; x=1810373945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnum33wmUd6ppTliQB7OlmxdDU3p0uwt0qvpAuIvGws=;
  b=PbfN4hxCrPWFb/ckzugsVPDduofpdUvFUTgvEMUUS2vIKiGfHt/AvpPd
   +cGDB9SrVjjyI5LiTzHxOMaFB2TsajkiYB8ZC3QJXACHCmNzvhfsoWeWD
   Xuo1qJx2KhtBdQVWkHI6TgG7sudqL2/tTHdXWV6Nu3rXCJg+FMbhy4q1g
   1rAvYs+Zk7fT8/D9CwIXUEJImpXcUWw+VsTFAzwtahMdBzLiGklB//B5J
   RaZ1Nlx38mxIGGg7xs9pjq2AvEwlvQYrKWZuwsHD58PVmtB3LllykGL2q
   c0zxbgCR8pxONTfxVJ7uQHQcnGa/CJPRjtKwAkFcnQVkGX2fH295K09aY
   Q==;
X-CSE-ConnectionGUID: s5ZS0nWJQCyoTPL0cj4SgQ==
X-CSE-MsgGUID: sjtrXM0ZT1CtSYn1/J9u1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67321594"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="67321594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:39:04 -0700
X-CSE-ConnectionGUID: zPRAQyr8QAmwvMckgHLoDg==
X-CSE-MsgGUID: Eb++I66bRJO7MXRpyOMp3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="242641004"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:38:58 -0700
Date: Fri, 15 May 2026 12:38:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: thomas <thomas_lin@lecomputing.com>
Cc: rafael@kernel.org, lenb@kernel.org, hoan@os.amperecomputing.com,
	linusw@kernel.org, brgl@kernel.org, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, broonie@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com, jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com, lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com, braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com, will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com, ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com
Subject: Re: [PATCH 3/3] i2c: designware: Add LECARC ACPI ID
Message-ID: <agbprjw1ra-YvsKC@ashevche-desk.local>
References: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
 <20260514024014.3376511-4-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514024014.3376511-4-thomas_lin@lecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 96E7C54D2D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36907-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:40:12AM +0800, thomas wrote:
> Add ACPI ID "LECA0003" for LECARC SoCs that integrate the DesignWare
> I2C controller.
> 
> Also add corresponding ACPI description in acpi_apd.c.

> Signed-off-by: thomas <thomas_lin@lecomputing.com>

Fix the name field in SoB, has to be your real name and not an alias.

Code wise, after rebasing on a new version of SPI patch (see comments there),
will be perfect.

-- 
With Best Regards,
Andy Shevchenko



