Return-Path: <linux-gpio+bounces-21283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A012AD43E1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 22:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFE35188A968
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 20:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F03266B46;
	Tue, 10 Jun 2025 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BznMTu9Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B8265CB6;
	Tue, 10 Jun 2025 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587609; cv=none; b=VtBasvHbW5GbkQQ32g1crGVp5PG7lqV2gGczHzJS+vH+r97Lln5h0LpWk6FYAv1SYMLs7EvTtI1XcmdfA1PHeeEjRzsYUpydG5Ugzd8JZ8Al22klaspEO2ps1ZWJhCaJsUX01kdknyo7+t7cO4RKY9vRZ8Dvm4SJ66dwYaj9BGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587609; c=relaxed/simple;
	bh=UIO0KTAU0Aod0Bv7zW46cT8jTmnHKGZWNh1fkYm6YU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MShV3am5tySUpFiH+rfLMEpL/mgIXF82RAXP6mmeykd6jmGn6MqSbIO2AQQmDDhe+V5HWAa+LE72OvTfZcVyYMQRXCe043R7gBMCwqeQn/157ome/yvE00288qIuONj1R6y270i5aoXGnpShwpbq6v5+wh1LKc/KUmdnMxMlfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BznMTu9Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749587609; x=1781123609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UIO0KTAU0Aod0Bv7zW46cT8jTmnHKGZWNh1fkYm6YU4=;
  b=BznMTu9ZOYEGqdWqL7Nd6E9VEsG7dccDlDs1/uLGWKsyXmwDEnXCv29Y
   QmMAtFv+ts9/4v35nKQHmwT8MYG5P4DtA9SGDbylLUxiOCpV7SlvxEueF
   3U2JW05k9vWR6D5I7aRnBtz+OVEJUfAKw+yGMJ9nAIxBkW0BJFHguy3P6
   GCMOdsYBFZPsFVwHGnNzt+iaZpwwFnPUJzx04YgIQ6JKH8dc8U7q0qWwb
   5JGkedtgB2aIJolIUo3TWuB5u5REfHK5Tapfcaijf1HancgXbkdNRAIYa
   YPt2FxthgDQUFu/K9RQs93+NnfqWH5jxpMHRtlGmJhTtoWZ6owTQw/EXJ
   g==;
X-CSE-ConnectionGUID: coNbUhtxSX+C72MzTvKftw==
X-CSE-MsgGUID: FQcxXhTVQESxVX7+zhNzPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="74254690"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="74254690"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:33:28 -0700
X-CSE-ConnectionGUID: ve+d5cJWSBy3aBzxkQ2WoQ==
X-CSE-MsgGUID: SPv7tj0TQWi9/FZ5OnYUig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="146928227"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:33:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uP5es-00000005Rgf-48ez;
	Tue, 10 Jun 2025 23:33:22 +0300
Date: Tue, 10 Jun 2025 23:33:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Miao, Jun" <jun.miao@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter
 callbacks
Message-ID: <aEiWkmT9HPlR8u72@smile.fi.intel.com>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
 <PH7PR11MB845555F9AA0823B53EFD48BF9A6AA@PH7PR11MB8455.namprd11.prod.outlook.com>
 <CAMRc=MepPni55s9mpCkZ_XrWtT3hOhSTN_QTzpNr_Qzk-YKP7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MepPni55s9mpCkZ_XrWtT3hOhSTN_QTzpNr_Qzk-YKP7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 05:32:53PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 10, 2025 at 5:30 PM Miao, Jun <jun.miao@intel.com> wrote:

> > Excuse me,
> > I have a problem
> > echo 631 > /sys/class/gpio/export
> > echo rising > /sys/class/gpio/gpio631/edge
> > [18090.472396] emmitsburg-pinctrl INTC1071:00: pin 119 cannot be used as IRQ

Check the pin configuration in /sys/kernel/debug/pinctrl/INTC1071:00/pins. But
I believe this is the wrong driver used for not yet released HW.

I suggest you not to communicate in public for this type of issues. We have
internal mailing list for that and other channels to discuss.

> > [18090.472408] genirq: Setting trigger mode 1 for irq 245 failed (intel_gpio_irq_type+0x0/0x130)
> >
> > How to set the gpio631 as IRQ mode ?
> 
> Is this a regression caused by this series?

I am pretty sure it's irrelevant. IRQ is input mode, the value setters
shouldn't be involved in that at all.

-- 
With Best Regards,
Andy Shevchenko



