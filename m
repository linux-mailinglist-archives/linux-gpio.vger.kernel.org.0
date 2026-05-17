Return-Path: <linux-gpio+bounces-36983-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IimJb2OCWoyfgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36983-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 11:47:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 115DE560526
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 11:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 322F6300D17A
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 09:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DD134F49F;
	Sun, 17 May 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvJnyn9E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DDB67E;
	Sun, 17 May 2026 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011254; cv=none; b=nVt42V6YvmRsL3icPpMF1IRKpz6wjgzJHme0rhgN/CT2Qyj/eM4tQgygF7hCVfGWcS2URCtstv239TNMj8hHBwltMAbeltqv6AuLKx/mbaQy8MmlujjPjGutkSwW2tVjAUk0cqaDvBL2ATmRT8YWmvZVr8k+VDt2V+pMal51FdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011254; c=relaxed/simple;
	bh=hl5+V8vgEvf9Yei3Q+EM59NO27/6+GEQsVHkWdPxuus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eowt8wmOpSqPdHBW5WyIvcJ0jwDfxTiX4yiq2obH+Zq2qhSIPXGiRusTw7NQnysr5sxC4qQo+R6tAh643HzDncfMTn9PhJyFfcb+zrsM31kzDMrBic9iYuKXoMUA+kw3KVj1O6NJSGPPM/RsgqRPATspdLUesdpO2sZ2vTivrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvJnyn9E; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779011252; x=1810547252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hl5+V8vgEvf9Yei3Q+EM59NO27/6+GEQsVHkWdPxuus=;
  b=QvJnyn9E+Km4Bemz2S1+79qzpTBNj5LaFGkjBzPnXujLJ/U5guYQzKZ8
   N1by1AF/WjI3twOLkglwL4Vbun3i+FbkO9BBSeSTjXufrkdIOxWiW2Few
   vXk8AW2PH5U/mrNFmMZj6fpmUCnStjHc93zFD4HO5+TAOhruXDDkbhM9D
   cF//Yt6GMFTTs9RvWXRoO73SOQdKqnbfbI83RHODxw6FqL4fhggpTmzLr
   9jklMgciwMDMqG9FgKV0fW4+UXeo1xSwkKd+Ub8sbb8Jzz6I/ChJzSaN2
   668AJDXkTn95Z+AjawQu6k9S7YGuMf18P79YzamaCBbwibMwBJU3cheEo
   g==;
X-CSE-ConnectionGUID: LzozbTGMS2yeMJvNJdUgkw==
X-CSE-MsgGUID: GmJfXE47TGSN1vBK3dc6GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="80016705"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="80016705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 02:47:32 -0700
X-CSE-ConnectionGUID: 9bDVkfAqQL2qr8O7jup7dA==
X-CSE-MsgGUID: EmscpRtkQqu4S8bFa9gLTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244114867"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 02:47:26 -0700
Date: Sun, 17 May 2026 12:47:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Lin <thomas_lin@lecomputing.com>
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
Subject: Re: [PATCH v2 3/3] i2c: designware: Add ACPI ID LECA0003 for LECARC
 SoCs
Message-ID: <agmOqxvRirRRfmzS@ashevche-desk.local>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-4-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515110322.2883310-4-thomas_lin@lecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 115DE560526
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36983-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 07:03:20PM +0800, Thomas Lin wrote:
> Add ACPI ID "LECA0003" for LECARC SoCs that integrate the DesignWare I2C controller.

It's a long line, please wrap around 72 characters.
With that done, you may add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Also add corresponding ACPI description in acpi_apd.c.

-- 
With Best Regards,
Andy Shevchenko



