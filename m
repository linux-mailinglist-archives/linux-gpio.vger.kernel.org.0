Return-Path: <linux-gpio+bounces-31032-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cn3N2aWdGlG7gAAu9opvQ
	(envelope-from <linux-gpio+bounces-31032-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 10:52:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB6B7D238
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 10:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E876300A74A
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 09:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311DD26ED33;
	Sat, 24 Jan 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmsPWDa2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF683EBF21;
	Sat, 24 Jan 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769248353; cv=none; b=rvL5MPtlE5LluMbVW/itmOtQGoCXGI2w5/YPwwirJ2ubDFb06qUBpU3ECEuohwtwnAbBO6uF5o9uO7Vzg5DiIvu+TEBtKReOKXlHAnRvEA/v6XIVltjait343+rDJip8f0br4r/VWbthlHOsynsaSOMnM2Rtp1Wbo+WOVD4dooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769248353; c=relaxed/simple;
	bh=tIzQvRD4LTpdAcI5W2mGTOP/N7GSKzLO0Tmu13vz+NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9XUwcJmVQSgoymo4M3ki4jh74VCIe097r0UI3krykwonI+hAZpkXCp3NeXo/m/cbEbbTAAgvDWybj+rgz/JG4yj3oowySREem1NhqC6iAhoKS3xZ3EQx0RTCuS1UHirpYOjI3tWsKt1IlucBQWJvFX8rVmy2YtTEk62RtiIk+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmsPWDa2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769248351; x=1800784351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tIzQvRD4LTpdAcI5W2mGTOP/N7GSKzLO0Tmu13vz+NY=;
  b=ZmsPWDa2IEQ4K0nL3uDnoLZEDKdO33CF8D8q/2li74LHQ5NkR1CqFvws
   iHXXBixZdrGvRhkmnyg4uk1jF1cNXDDT5yPqoe4CIzPdWgjTfGV240Mw3
   Sp4HpUmCtB+M9q4Q2kwVhlrBTC7e5vOM1E0ba4wPngXupyVN/R3lEV1sc
   h7Tod4/8RuL+kS2VzQczC5LQpnB9dmgOLiRbDDwIRy5GDyov0NARHUuA2
   QfH4hmDHV5xU2ePrARVeI9P91ePlK51wCX4XJRWNsbPtcWHTFEkLXnNSL
   RIFx7frSfk0inBKVCR4wnlpBoPe/64IM4syHHFJVg4upMo6guiUVzV+N3
   Q==;
X-CSE-ConnectionGUID: jTmVy0MSR1axxeU3iUUJ2w==
X-CSE-MsgGUID: 9hQd/TWdRYi1JHf3sJo2UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81925219"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="81925219"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 01:52:30 -0800
X-CSE-ConnectionGUID: hDG8Ni/4Rm2STK4tSApGgg==
X-CSE-MsgGUID: KM5v0rA+TRKWu9mRFsNAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="230196206"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 01:52:28 -0800
Date: Sat, 24 Jan 2026 11:52:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: mika.westerberg@linux.intel.com, linusw@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Guido Trentalancia <guido@trentalancia.com>
Subject: Re: [PATCH v2] pinctrl: intel: Add code name documentation
Message-ID: <aXSWWuTXt-34U5-Q@smile.fi.intel.com>
References: <20260124081708.1141884-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124081708.1141884-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31032-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DB6B7D238
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 01:44:54PM +0530, Raag Jadav wrote:
> Intel pinctrl drivers support large set of platforms and the IPs are
> often reused by their different variants, but it's currently not possible
> to figure out the exact driver that supports specific variant. Add user
> friendly documentation for them.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



