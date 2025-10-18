Return-Path: <linux-gpio+bounces-27275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D8BEDA86
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 21:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3EF01894032
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 19:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BC326D4F8;
	Sat, 18 Oct 2025 19:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIJ03dND"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218C277023;
	Sat, 18 Oct 2025 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760815890; cv=none; b=Zeuw4cVZmyajat6RiFZq8kBo5OtiP3i8Wypbiy8eTHoAfbsPEz5pXvZGwHLbHHLr4gIH5Wl4DO16GNxNUlmn4fcx2FhE3FL8Imp6b+Fi3tLd+IvASczOYQUm2SkBZGH12CqgZAK+uNqTglYYEU0nfzR7PqYxJG39Lf3RLB29yNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760815890; c=relaxed/simple;
	bh=nItAAmXCB/ByTq//wLALhtlyWvrmb82uvjwsQXjJEWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FysSQe6XA4w+QoQPvo1BdwA0WV0jNEJpzK+iZtFmTjImcEnrr53zpvirkqValRUj6QUWjTy5Xw0dOtTk4SGjb7e1lHw2cpMdVTlt4t743D8fokcdDqPqJPbWa3cuACTZR0FhfwZao3/1taT9RO07FxwPAh7eOXxB4pPsfX17wTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIJ03dND; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760815888; x=1792351888;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nItAAmXCB/ByTq//wLALhtlyWvrmb82uvjwsQXjJEWo=;
  b=VIJ03dNDBM5KcTa8S25SLk4tIOaI91aI+YGiXLMlS4Zd06+mEGSDzLM0
   1wgR9dmtJ869Fi4i8K2bH9SrsJasTTZ7z7VXs3QLMwvjAm4PdTcgIrMPZ
   okXkzai8TGm3lZVwmpBYG34MqP/V1piImq4kRadLjzOtdoEjzPIOsGyr1
   yqyyQYjZJqmY1G297KI3fmnF9IOmQ7QgOr6Mi+VybpH8Q+qdKffnX5WCC
   wUJMjpFI/UojoAymNLZDeZCDbFc7uu+LTj/tMXLV7qBygXPRE3BNG+c+5
   8TVNFvHf0W0xTPsXgmM3GER5L2AwgvzseIasHuK4T2s6rsmFU1f+Rmfen
   A==;
X-CSE-ConnectionGUID: q5yRLHAbRM+xNf+ynIcpqw==
X-CSE-MsgGUID: 9pTGV1rzT2ycMDaIFyi/Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50570649"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="50570649"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:31:27 -0700
X-CSE-ConnectionGUID: FQ/UwlMMTT+bo5pQk5YJMg==
X-CSE-MsgGUID: iDWAqMStQeWaS5I+uZ89iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182701857"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:31:25 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vACeA-00000000xZD-2Kfu;
	Sat, 18 Oct 2025 22:31:22 +0300
Date: Sat, 18 Oct 2025 22:31:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bigunclemax@gmail.com, Dmitry Mastykin <mastichi@gmail.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
	Arturas Moskvinas <arturas.moskvinas@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andreas Kaessens <akaessens@gmail.com>,
	Zou Wei <zou_wei@huawei.com>,
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: mcp23s08: delete regmap reg_defaults to
 avoid cache sync issues
Message-ID: <aPPrCv7arEYAOoS9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo


On Mon, Oct 13, 2025 at 03:22:19PM +0200, Linus Walleij wrote:
> Hi Maksim,
> 
> thanks for your patch!
> 
> On Thu, Oct 9, 2025 at 3:29 PM <bigunclemax@gmail.com> wrote:
> >
> > From: Maksim Kiselev <bigunclemax@gmail.com>
> >
> > The probe function does not guarantee that chip registers are in their
> > default state. Thus using reg_defaults for regmap is incorrect.
> >
> > For example, the chip may have already been configured by the bootloader
> > before the Linux driver loads, or the mcp might not have a reset at all
> > and not reset a state between reboots.
> >
> > In such cases, using reg_defaults leads to the cache values diverging
> > from the actual registers values in the chip.
> >
> > Previous attempts to fix consequences of this issue were made in
> > 'commit 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at
> > probe")', but this is insufficient. The OLAT register reset is also
> > required. And there's still potential for new issues arising due to cache
> > desynchronization of other registers.
> >
> > Therefore, remove reg_defaults entirely to eliminate the root cause
> > of these problems.
> >
> > Also remove the force reset all pins to input at probe as it is no longer
> > required.
> >
> > Link: https://lore.kernel.org/all/20251006074934.27180-1-bigunclemax@gmail.com/
> > Suggested-by: Mike Looijmans <mike.looijmans@topic.nl>
> > Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> 
> I would surely like to see some Tested-by on this patch because
> this driver has *many* users.
> 
> I added some people to the To: line who recently made changes to this
> driver, maybe they can test.

To add, I would suggest to look at Cypress driver, it uses the method to
recover defaults from the actual HW state.

-- 
With Best Regards,
Andy Shevchenko



