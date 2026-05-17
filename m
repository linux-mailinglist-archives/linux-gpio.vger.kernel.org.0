Return-Path: <linux-gpio+bounces-36981-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGZpMVR4CWo7bQQAu9opvQ
	(envelope-from <linux-gpio+bounces-36981-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 10:12:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBBF55FE9F
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 10:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DAF13005AA0
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 08:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA9030C155;
	Sun, 17 May 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqwPZzU5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF6C26FA7A;
	Sun, 17 May 2026 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005519; cv=none; b=pXOFRnkBgXzU6DaGVfi4Vead66AB07K/2Q1eP+GeuPFzvzllxLNLr5lPO0iJil8M6aaFP86VcFno9PXgnikisyN5R3voX4J5eqTx64EoEHo4aZtEyj75gcWv/2mVSQTM1rfk/kNQGe4UiL4woaXL5XQjd7JgCBr+zQPSg6iWPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005519; c=relaxed/simple;
	bh=R8QSWBUhn8ehatazqRlzsq+Lwyp9VIk9GLj2mLVG5UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Twx8fh1JW1ml85I1tSufGvDULIz6kIOT8e1hHQwJjf7YuWnbXFCOqroMZ1QY6RFmOX14xaQaWQYnPBgkGjoXe3FDPRFEoOBn8Ffa3X2Z0jVKOnY3Re48Lch3JqgySkPZ/CKGq1FyTOeZnBEv5165jl3tMJpsk+EjAx5w3lbJyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqwPZzU5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779005518; x=1810541518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R8QSWBUhn8ehatazqRlzsq+Lwyp9VIk9GLj2mLVG5UY=;
  b=EqwPZzU5U3752ZtRzKVajETbBG+rL0Ja3AaXFFBl6dAdJZFpGfJzipAY
   v7MCQEqXVzpo0AmRb5fCo2mevA3LdVeDjDj90Jt/tKCkywiqFWVWysU7Y
   leGKpHaJpuR1u4GULR8WTjSS0gyZ1u29bZhETxaO1DWUYFYewYfEpp7JT
   QQvF8M+J2ngEdyTqQiGxyBdQUtQL4SOOEparAz1wx5kVZLeYmnmfQr0mR
   szM8UgdSrtefTmJXg1pbUXJ49hjKRB9loP0vB5spfGHLI2JTIiBgxdpMG
   1Uw7yrkuhTvqNh99lbFiLuImcnaBVMlYCBiq5QmPU12zDpu8wUxhVD+ko
   w==;
X-CSE-ConnectionGUID: fv9arcRqTKSe9JCbO/qpkQ==
X-CSE-MsgGUID: b+wmwB/rTW6KAa4LqXxo5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="91351142"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="91351142"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 01:11:57 -0700
X-CSE-ConnectionGUID: Hb/dy0HBQ06MAf186pp1MA==
X-CSE-MsgGUID: I98qXi/8QlaThW1H3+YVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244091510"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 01:11:51 -0700
Date: Sun, 17 May 2026 11:11:49 +0300
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
Subject: Re: [PATCH v2 1/3] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
Message-ID: <agl4RXIp0f8yZfzL@ashevche-desk.local>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-2-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515110322.2883310-2-thomas_lin@lecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 5FBBF55FE9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36981-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 07:03:18PM +0800, Thomas Lin wrote:
> Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare GPIO controller with V1 register offsets.

It's way too long line, please wrap around 72 characters.
With that done, you may add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



