Return-Path: <linux-gpio+bounces-30549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D6D1E859
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 12:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6514A306F8F6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FDA394490;
	Wed, 14 Jan 2026 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGogZsh7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033D3557EA;
	Wed, 14 Jan 2026 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390990; cv=none; b=o2x9t0lW2CUUDneTemIuEcWuWhT7C0dAUWOxy+2uyS8j5wQ85m9RX8QfUoN2NF3awtCob+ozVxtFClyo9wjGKX8bZErsIYj0hCON+5PvAMG5jDj6geQuCPUOhjQPQwepCJ6Mwfpml3I6e3RZpSjPTuLPAH9PuXb2RyVh8zkHh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390990; c=relaxed/simple;
	bh=3wngIiXm5rHzYraftfqFSLxBz0YuLHdgoVnjL2Qy7Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkfgnBHjfbNsz8bK3G2Tz41czGvA2KXLwnevTW1+8Oz3KgIGRfVAVEvMlTAn0aJ4kOfbWg6AurEaJBa5cYTaqWFnRIiEL5cV31ZISOHePR8IwJqlXupU27yuipCHnryNrIbZmDZZUeWX0a1yZBM/FVRLW1pUDgXUcrYtPQnU4dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGogZsh7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768390989; x=1799926989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3wngIiXm5rHzYraftfqFSLxBz0YuLHdgoVnjL2Qy7Vc=;
  b=PGogZsh71LCltvxdjhbY11MGBtXYhN36Os7MmDMY4wSCrSjU/pWJlz4z
   izBRM3INQyFERalxV7wVdH3TnoAP5EXaAeCkXI6WF+iEUC6ArqolpOHhp
   VhQpa6el6CVTK2z6TEd+elaS+07jyXSfntpFAsvliRHKh6j92+KMDjTjm
   MSHQGNxMqzkxtZ8/QgSgjXAAeZN8BFLQ5JTHItlMj7yB2USQV1zybqChv
   2107ZPxSQ+A7nL+OZ8qHOOW6kgYxcmO5TO5YckR1phhN/ZYieOlKofVll
   C4tpKKppD5xlYjHFO6mzgIJRlXaK8nQpir/o3ZtOHKDiZCDnIdDaEzm2g
   g==;
X-CSE-ConnectionGUID: CyfCXp0LRUK+WWGiKyLonw==
X-CSE-MsgGUID: 2dxpMiKERny0VSy14h5PaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69665295"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69665295"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:43:09 -0800
X-CSE-ConnectionGUID: zhwQm6goRCCR9vuh7LfGRg==
X-CSE-MsgGUID: qz48PXjCSKmjBSxsF8aX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209118124"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 03:43:07 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CDE6B98; Wed, 14 Jan 2026 12:43:05 +0100 (CET)
Date: Wed, 14 Jan 2026 12:43:05 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: platform: Add Nova Lake to the
 list of supported
Message-ID: <20260114114305.GA2275908@black.igk.intel.com>
References: <20260114100555.277960-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114100555.277960-1-andriy.shevchenko@linux.intel.com>

On Wed, Jan 14, 2026 at 11:05:55AM +0100, Andy Shevchenko wrote:
> Intel Nova Lake is supported by the generic platform driver,
> so add it to the list of supported in Kconfig.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

