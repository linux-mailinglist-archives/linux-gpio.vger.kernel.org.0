Return-Path: <linux-gpio+bounces-31493-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC6DF4cGhmkRJQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31493-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 16:19:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E21FFA4D
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 16:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B9B1304B828
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 15:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5393A0E8F;
	Fri,  6 Feb 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIVIwEu6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52273491C9;
	Fri,  6 Feb 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390990; cv=none; b=ra6iCQce79Bn8BT7xBCK5m1vWUfn2weCCkOltd2LKFeZ6pUBYbwN6zqBXkZ861XgwRXoQM8ad4YI8+/cAin2hNP+BTRJlPWCC5xQTfR1x0ix+THxhhpfdOJ+mQXJ9v0VFeUW6W0rbBPB3m5o3bdIlAevBkE+VvsV+fDj3ygHRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390990; c=relaxed/simple;
	bh=3vvmiiiE1VfjLapf/G5wUv8wgenri0Z6D3Oa265Bz5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICMX4R8MiB0qBI2V8jPK1wHMJs0x39jF/67PEaGE99/vL0qR/8AdFVKqlq+RckMM0jHiQP/ck2oDzOv/FXWK4FB2DKMNQErzmTz+sMNfUL6f81zXY4XmwIKaYwqRfaOJ/aomWYHvKoEtRh4qwAy2BE9OBKZja2ODSPwxPYKr9ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIVIwEu6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770390989; x=1801926989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3vvmiiiE1VfjLapf/G5wUv8wgenri0Z6D3Oa265Bz5c=;
  b=MIVIwEu6dgdKbjY7cyOWCh87ewrV93XKodBnOzXeySbH7vgneHJkF20z
   0me3LTTCRJSVEc9L51XQ+Pf7BgDcCZijTGfECAcNpFrRt7V+0WHNcnsqP
   wmVM1SdT5bDr7bnmyaT63oZWCj6LkqEtUxYiH/T42iatFINu/Q7wdvp61
   eEX9CFs/prUFiuyLwrCcDYafxLB8PaN9jaOIJ18p6j/6W73XHDNJfF18d
   hBZgE8Al0+wzNHzCTD/zO4scmwONbjP4l9H4QUBm9qC55DUj2ZQn5ckWq
   L8QZcb1M+WLzfn1SYojk1KCgoDVAxa7GOoIu4QLFQQP1Uz//DP1NNN7DU
   Q==;
X-CSE-ConnectionGUID: 6m7IJLvdSKeaJI4wRCvILw==
X-CSE-MsgGUID: WTRdncTiSBWUYqANxFOD9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89177121"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="89177121"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 07:16:29 -0800
X-CSE-ConnectionGUID: Fdjqg5M9T4iFrp5X5sEhzQ==
X-CSE-MsgGUID: zS31gO8bTcmrq2Y9ZTrNFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215415655"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 07:16:28 -0800
Date: Fri, 6 Feb 2026 17:16:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Align Copyright note with
 corporate guidelines
Message-ID: <aYYFyaNd8K4G9FTF@smile.fi.intel.com>
References: <20260204080122.2300224-1-andriy.shevchenko@linux.intel.com>
 <20260204123727.GP2275908@black.igk.intel.com>
 <aYNHtw7QumfvgeX8@smile.fi.intel.com>
 <CAD++jLnioN3Hb83Qf20PeQX=kpCKH4MQ1eLTeKuizm3tTHzUGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnioN3Hb83Qf20PeQX=kpCKH4MQ1eLTeKuizm3tTHzUGw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31493-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: D1E21FFA4D
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 12:06:07PM +0100, Linus Walleij wrote:
> On Wed, Feb 4, 2026 at 2:21 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Feb 04, 2026 at 01:37:27PM +0100, Mika Westerberg wrote:

...

> > Lunus, can you apply this directly into your tree, please?
> 
> Yeah I just applied it!

Thank you!

-- 
With Best Regards,
Andy Shevchenko



