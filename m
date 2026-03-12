Return-Path: <linux-gpio+bounces-33238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PNRIeaHsml4NQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 10:31:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090426F9A6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 10:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90416312F017
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A84E3B4E98;
	Thu, 12 Mar 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9g10wqZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B63B3883;
	Thu, 12 Mar 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307746; cv=none; b=bcxn0TKq7rnH7r4MSfMh13U8ploF5ySCb2PqKl0HxVrJSoT6jXOaknimNstMcLhiR9wPdU2qauv7UIm5cUNFZwYpCkR6VTGuJzbRf3u4z4t69NJWpF+/cTfm8UNgBF6DJADEWP57Iz1xzjzitEfw0N9hM0tOaSQW9mguAOvW9DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307746; c=relaxed/simple;
	bh=lEOtM4zhrzldYTBWFHJI+Dhum9TqJxp4kJWyKgJHjgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4XkqIBVc0HuLQ2LKFWeSIKN9E6JTRKgfgUw/RY52NS9tmLNITPUC/mxwhr9SsVJ+W5PTWQyl2v++0tkAsM5lDbvexUFSzKsrPc0wZNyZkDx92MQL3OXynhwNrWM7h+vDm09sbld4NqGlY/3Xo9Z+IPQ7ZUFTQNtbdQPcrZn1Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9g10wqZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773307746; x=1804843746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lEOtM4zhrzldYTBWFHJI+Dhum9TqJxp4kJWyKgJHjgI=;
  b=X9g10wqZqAmEM5vSWCPr/Ruzf4QTcZsEbYueqsf1/AgN9LfUMS74UduT
   CG7lKo0scf1n04LSeqZw4xi5FAQ2P/TFA+G0fuxVnks9AUlesiioEF5A2
   8BbEXyg/XRQpbU+KACVpOA7OOcvGmzYbzOg5Abhx8iRTU93NU7rnchDnX
   IBNQYikfBwIqceM+jCw4Fn01JQOwWE0sxyWYisQ/C+LG9x55qSMd44ZOU
   Bk2XMY//pqEcEQAqPozNXOdzW6/s3fULeichpTYXcQcCs5ZaU+p7ZiYIo
   9HU+enNRuTYue4l/PU0URuuBs30kE4QUa9DODKRlytrlYf8+c2p3kn5NI
   Q==;
X-CSE-ConnectionGUID: n+YsjcfVSfWPpvi5GAl82A==
X-CSE-MsgGUID: SB4bSls8QCGf7JD+GE8sIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74285414"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74285414"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:29:05 -0700
X-CSE-ConnectionGUID: Bmp7J73lQ2KkDt15aqIghA==
X-CSE-MsgGUID: VGjzDg/3SbWUY6CwzC6H8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="225466070"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:28:57 -0700
Date: Thu, 12 Mar 2026 11:28:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: wens@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO
 support
Message-ID: <abKHV7RSJWI0U-sK@ashevche-desk.local>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
 <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
 <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
 <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
 <2d4e69cb-a43c-4d13-9f7b-20b95cee43a7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d4e69cb-a43c-4d13-9f7b-20b95cee43a7@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-33238-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bgdev.pl,linux-foundation.org,linaro.org,google.com,linuxfoundation.org,arm.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3090426F9A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 08:41:03AM +0000, Jon Hunter wrote:
> On 12/03/2026 07:49, Chen-Yu Tsai wrote:

...

> > > > To me it sounds like a bad design of the driver for this SoC/platform.
> > > 
> > > I am not sure why you think that. Assuming a 1:1 mapping of the kernel's
> > > GPIO index to the GPIO controller + h/w port + 1 GPIO number seems fragile.

You may use valid mask (which is also available via GPIO device properties) or
as said below. In any case this thread just convinces me even more that driver
has a design flaw.

> > If the hardware has uneven number of actual pins for each bank, either
> > you end up using the deprecated static GPIO number allocation and
> > have holes in the GPIO range (sunxi currently does this), or you use
> > dynamic allocation, which gives you no holes in the GPIO range, but
> > not directly calculable mapping between DT and GPIO numbers.
> > 
> > The driver handles the mapping by providing an .xlate callback. A
> > consumer shouldn't assume anything. The shared GPIO library probably
> > shouldn't be try parsing the property itself and use the result to
> > grab the GPIO descriptor, but just rely on the gpiochip's .xlate
> > callback in some way.
> 
> Right. I was thinking that isn't this why we have the xlate callbacks in the
> first place to handle such things and not make these assumptions?
> 
> I am curious if other platforms could have the same issue? I did not see
> this immediately with v6.19 because it is only one specific platform  we
> have that showed this. So very much a corner case that will only be seen if
> a platform uses shared GPIOs and the shared GPIO happens to be high enough
> to overflow the descriptor array. Even if we don't crash, at least for
> Tegra, we could be using the wrong descriptor too for shared GPIOs.

None of Intel platforms has this issue, for the rest I have no clue.

-- 
With Best Regards,
Andy Shevchenko



