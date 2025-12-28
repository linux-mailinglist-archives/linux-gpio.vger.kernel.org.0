Return-Path: <linux-gpio+bounces-29970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9C6CE55A3
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 19:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A3E2300AC97
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23422230BD5;
	Sun, 28 Dec 2025 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RivUscPw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC7DDF76;
	Sun, 28 Dec 2025 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946319; cv=none; b=D4HHOClN46JNdkFAl3f93g1LLYI9Kp4tw2+PLYKFIkfnJPVOjrwq23uI1XQiAwwgKePrzMgJ1vMJEFWMkNDFilA2NFRYffaQ+pCqNOmWTjRxgfYaVZHnKTYpyBWErFykEtVaPBJSPt09iT4yOfZdA1IvVEM3RL8XebhArVrXJCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946319; c=relaxed/simple;
	bh=zsyfulJkmLHcNKeZfPJVQVzY3t4JWQz72/ZtR4mnMBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u05j185VfC2yE6B1LrGbfXjuYmIGrHmrnNQAue+MP74t/yy/XZNeSR3fJ0ifhfMuBoY3p3+IIru8Frmdo9wscTbKR2aXpRus+mTPklAPhYukrI458x5fJj1jophPnXs9DHOVKdTqPx9Az52dnjQrTuh16iKpYvkj3TY4LRYbmm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RivUscPw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766946318; x=1798482318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zsyfulJkmLHcNKeZfPJVQVzY3t4JWQz72/ZtR4mnMBg=;
  b=RivUscPw4hqQJQ4jGIeGxyzBy3z6CPNs7hfVLrKtIDIANctF/9b4vOfa
   vGDNGCQHWjkMDEtUlDiCJHMBJBQIV7xWElbwPWMkSj20BiM6dEpIsL23D
   CbqP7SAFprPBpSO6eE+d2m72cVYKw705KQT5hKY/e3YmBP1mHMTKD/+zq
   e7BXtioDNUDELnNqtVffqh6J90Vq3BgNyNu21D1SdDpKBryqR6s7gRxWI
   Pz4pyuLJHpMxLxWNy/LVFYAapy/d0/KdvR2VxN0WMIkbzDHoF8JqEouvW
   y3ZgY4nJx3op1+rXqp8jQv6sH/xM+ES9ETSi1tDqULaOtDndzL/2eocqQ
   g==;
X-CSE-ConnectionGUID: 0GFVviLQTvSueUHzJFvnRg==
X-CSE-MsgGUID: 3WeliolZS5mVJ7FwQZzdhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="91237886"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="91237886"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:25:17 -0800
X-CSE-ConnectionGUID: dIBHnoZuRDa3KUBMvZBqdA==
X-CSE-MsgGUID: S+abYjMvQGWncZACRH9IDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="204887549"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:25:14 -0800
Date: Sun, 28 Dec 2025 20:25:12 +0200
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
Message-ID: <aVF2CIorE5ylV1b4@smile.fi.intel.com>
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

Wow, this is a very good wrap-up of the interrupt behaviour on those chips.
While I am fully with you on the fix (this patch), can you also add a
chapter/section about this to the documentation file (now we have it for these
chips!) Documentation/driver-api/gpio/pca953x.rst?

(As a separate patch.)

-- 
With Best Regards,
Andy Shevchenko



