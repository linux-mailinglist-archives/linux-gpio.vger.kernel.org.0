Return-Path: <linux-gpio+bounces-29971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E5CE55A9
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 19:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4C133004D21
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A283F230BD5;
	Sun, 28 Dec 2025 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeRxgA9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEECA59;
	Sun, 28 Dec 2025 18:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946372; cv=none; b=KbZ9hiMF6QmyeqIaEPiZ7oECaYDE+eaiQPWswrSybDlIsu5PKrWeWE181Y4q2nFxuwlXMZrFyEhNMh3+IRwKioZsBV2i1nNEVmpXAe6wUvR7BTPAb4hvL6q73CDBRWk9BDrlayzYxEo5ryJKIIlQY8dUuNAe3wM6N24oP8SpUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946372; c=relaxed/simple;
	bh=cci3FY5ia69FtMOxBM9uL2a2YEewtMJ1HQuhAo3WpjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II1NORgygqymjnuTAfMh7Ws7D+ZP8zfzCDKq8QL85FFO/3j41RqDJrln97NzDDWo4YEzgMzwkZwtApCMZ456FrS+EgNvVyLuLomcFuv5jOje/D3ivJd6YTx1smZl0FF1+u0/86RLSGUfA3f4HdPbhfnyh7V9P/U6lvnpSKywaVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeRxgA9x; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766946370; x=1798482370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cci3FY5ia69FtMOxBM9uL2a2YEewtMJ1HQuhAo3WpjY=;
  b=KeRxgA9xwzKRISJYP3H9e3DG/IsbGnlgAmb1jBqTqNHSOaevxoyHvPqg
   yn3ERtAK2CO3GNnnF8njWGInNn7pbVC38xlN8QDCUtSZ2SEvcGJUA2hcO
   ROeB2741ObHLzS9K8ALBC6tP3YB8LQiYtwUPtl3gb0gMhn2xFP/wKaTZD
   SyJTOeneyOtDY+JjcER+Tj1xEvKgbdP/+qmOn1DJNNE8paNC30T9r9dNA
   KJvJ3XtrqGX8i+pu4hm3EYPlnRevHoC2IeKjOuK9MsWeLyGg8/iE+rF+Y
   Okl2K8PX+oXIDHw39drSdmFTbgpIZNVVY7pIZPrLoI/yiuc17mfcxWgam
   Q==;
X-CSE-ConnectionGUID: fGE6MaYRR+CnBuLxFvC99w==
X-CSE-MsgGUID: qXp1n9dWS3WzJIz9Bfy+oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="86161592"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="86161592"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:26:08 -0800
X-CSE-ConnectionGUID: dAFYB/nJQ6+tO6Yq70CP2Q==
X-CSE-MsgGUID: u0VYWnBHQ6KOcGMnQSMxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="200717489"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:26:06 -0800
Date: Sun, 28 Dec 2025 20:26:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	lakabd <lakabd.work@gmail.com>, Yong Li <yong.b.li@intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: pca953x: handle short interrupt pulses on PCAL
 devices
Message-ID: <aVF2O5lVpPtJtoER@smile.fi.intel.com>
References: <20251217153050.142057-1-ernestvanhoecke@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217153050.142057-1-ernestvanhoecke@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Dec 17, 2025 at 04:30:25PM +0100, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> GPIO drivers with latch input support may miss short pulses on input
> pins even when input latching is enabled. The generic interrupt logic in
> the pca953x driver reports interrupts by comparing the current input
> value against the previously sampled one and only signals an event when
> a level change is observed between two reads.
> 
> For short pulses, the first edge is captured when the input register is
> read, but if the signal returns to its previous level before the read,
> the second edge is not observed. As a result, successive pulses can
> produce identical input values at read time and no level change is
> detected, causing interrupts to be missed. Below timing diagram shows
> this situation where the top signal is the input pin level and the
> bottom signal indicates the latched value.
> 
> ─────┐     ┌──*───────────────┐     ┌──*─────────────────┐     ┌──*───
>      │     │  .               │     │  .                 │     │  .
>      │     │  │               │     │  │                 │     │  │
>      └──*──┘  │               └──*──┘  │                 └──*──┘  │
> Input   │     │                  │     │                    │     │
>         ▼     │                  ▼     │                    ▼     │
>        IRQ    │                 IRQ    │                   IRQ    │
>               .                        .                          .
> ─────┐        .┌──────────────┐        .┌────────────────┐        .┌──
>      │         │              │         │                │         │
>      │         │              │         │                │         │
>      └────────*┘              └────────*┘                └────────*┘
> Latched       │                        │                          │
>               ▼                        ▼                          ▼
>             READ 0                   READ 0                     READ 0
>                                    NO CHANGE                  NO CHANGE
> 
> PCAL variants provide an interrupt status register that records which
> pins triggered an interrupt, but the status and input registers cannot
> be read atomically. The interrupt status is only cleared when the input
> port is read, and the input value must also be read to determine the
> triggering edge. If another interrupt occurs on a different line after
> the status register has been read but before the input register is
> sampled, that event will not be reflected in the earlier status
> snapshot, so relying solely on the interrupt status register is also
> insufficient.
> 
> Support for input latching and interrupt status handling was previously
> added by [1], but the interrupt status-based logic was reverted by [2]
> due to these issues. This patch addresses the original problem by
> combining both sources of information. Events indicated by the interrupt
> status register are merged with events detected through the existing
> level-change logic. As a result:
> 
> * short pulses, whose second edges are invisible, are detected via the
>   interrupt status register, and
> * interrupts that occur between the status and input reads are still
>   caught by the generic level-change logic.
> 
> This significantly improves robustness on devices that signal interrupts
> as short pulses, while avoiding the issues that led to the earlier
> reversion. In practice, even if only the first edge of a pulse is
> observable, the interrupt is reliably detected.
> 
> This fixes missed interrupts from an Ilitek touch controller with its
> interrupt line connected to a PCAL6416A, where active-low pulses are
> approximately 200 us long.
> 
> [1] commit 44896beae605 ("gpio: pca953x: add PCAL9535 interrupt support for Galileo Gen2")
> [2] commit d6179f6c6204 ("gpio: pca953x: Improve interrupt support")

And missed my tag
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



