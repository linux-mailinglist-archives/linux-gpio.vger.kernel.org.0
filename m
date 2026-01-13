Return-Path: <linux-gpio+bounces-30486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365BD18996
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FF8C301D5BE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9A638E120;
	Tue, 13 Jan 2026 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0Lyvzm+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603FB38BF99;
	Tue, 13 Jan 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305362; cv=none; b=Rs2+l2gGhai1vhScrg0Wlcw9Es79exlLFIIABNW9Hc2fKAm9sK5aop54lbES3i3Sru5hhCbj0FYdeMFHqcZPPJgwgkBZLgQt018P/OCTXwMayVZdpMXr6/Sdiu9tF7s7ufke9QuWSYBVb6XRdCeK7270nTClX4eeyALdcqAYOLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305362; c=relaxed/simple;
	bh=ZOB9DPK5xpIxS62g0gyG4XDZOzYJXXd0SZyUS3W2ZmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ml9ZRirSHGs2jm94ATUtUXB2ZoeAlCRRNqh3cudAXFXk0Pf2a5oRkUFr7PXikC0pngXWnW/o1cHoDfhoxmojxf6LcwiCh0WdlOqIOHNKZQEj/sPT7uy2PtpETv9E22Lw39zcokWGp9TFeUf8L4n4YRoVdNichNhSvspb8uvvgD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0Lyvzm+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768305361; x=1799841361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZOB9DPK5xpIxS62g0gyG4XDZOzYJXXd0SZyUS3W2ZmM=;
  b=R0Lyvzm+8QXJCd1tGh2d5G9CJUNc/mROZ5AtfMl8OvMsvLEhyME5aVCl
   G9N9hjSmDKMRB8gKFNJz7PnYD6tMTAt0n3hrlivAq7QtlYoOgrGJ+TZDX
   j+SAnpqy8BWndxJNmaf6tB5mH/nDtJewBS3+MGxweoKF4Et56NlBc4wJd
   Og6JIZN9RgiF20TvO1laxSsDpKaOMZthP587WdrsgTzCvn9nAdfSBjPck
   DKaAmHrq9MXfvuPhNQAdR1Q4eN/w3TeEvf5yLpIXzNMwhcU5rAn43PRAm
   QoMCqbdWP3Y8DpWyiYDeQ9wSIPsGvFmxEmgR5cgzPJUf0Ewj60RCWRp/0
   w==;
X-CSE-ConnectionGUID: 3bFXeh6XROWRI+3Hizsf/g==
X-CSE-MsgGUID: VgzAJjmQSPyaO/6OpJ3+Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79884217"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79884217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:56:01 -0800
X-CSE-ConnectionGUID: mczsFnIFSwiJonRyqqfKqQ==
X-CSE-MsgGUID: QBcT3S3ZQv+/pzpLSOvA+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204455377"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2026 03:55:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7688098; Tue, 13 Jan 2026 12:55:58 +0100 (CET)
Date: Tue, 13 Jan 2026 12:55:58 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: lynxpoint: Convert to use
 intel_gpio_add_pin_ranges()
Message-ID: <20260113115558.GY2275908@black.igk.intel.com>
References: <20260113100726.136695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113100726.136695-1-andriy.shevchenko@linux.intel.com>

On Tue, Jan 13, 2026 at 11:07:26AM +0100, Andy Shevchenko wrote:
> Driver is ready to use intel_gpio_add_pin_ranges() directly instead of
> custom approach. Convert it now.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

