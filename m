Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A6233ED73
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 10:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhCQJwo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 05:52:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:46872 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229658AbhCQJwa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 05:52:30 -0400
IronPort-SDR: l+CO9aFPPdqQQXMDOxN+j3Fw7xEbdcv+6+D10KnTIJzBx8cOF5J/tT4qYTZsOFlyZ9nN99Sc0i
 FYaGTR0anORQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="274477153"
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; 
   d="scan'208";a="274477153"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 02:52:30 -0700
IronPort-SDR: QTKiVcReQ5/yHaiWsHNSJYGAkv4I7n1sJ+qSQyX9M/Kjh2f/yneA+JE9/Gy/2LkFFq2t87DJLt
 verHRtbFbyyA==
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; 
   d="scan'208";a="439381740"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 02:52:28 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lMSqo-00DDvi-1P; Wed, 17 Mar 2021 11:52:26 +0200
Date:   Wed, 17 Mar 2021 11:52:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/2] gpio: sch: Hook into ACPI SCI handler to catch
 GPIO edge events
Message-ID: <YFHRWm6YIh9NU1I/@smile.fi.intel.com>
References: <20210316162613.87710-1-andriy.shevchenko@linux.intel.com>
 <20210316162613.87710-3-andriy.shevchenko@linux.intel.com>
 <YFEZ6GYuXGaX/LP2@smile.fi.intel.com>
 <a3a6c80a-724c-e2fb-9597-b14a302c5ff4@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a6c80a-724c-e2fb-9597-b14a302c5ff4@siemens.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 07:57:44AM +0100, Jan Kiszka wrote:
> On 16.03.21 21:49, Andy Shevchenko wrote:
> > On Tue, Mar 16, 2021 at 06:26:13PM +0200, Andy Shevchenko wrote:
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> Neither the ACPI description on the Quark platform provides the required
> >> information is to do establish generic handling nor hardware capable of
> >> doing it. According to the datasheet the hardware can generate SCI events.
> >> Therefore, we need to hook from the driver directly into SCI handler of
> >> the ACPI subsystem in order to catch and report GPIO-related events.
> >>
> >> Validated on the Quark-based IOT2000 platform.
> > 
> > This patch must be dropped completely. SCI handler is not correct way to do
> > this. The proper way (and we have already few examples in the kernel) is to
> > register GPE event.
> 
> As explained above, this is not supported by the preexisting firmware,
> and there won't be any updates to it anymore.
> 
> This platform is history, the SoC was discontinued by Intel long ago,
> and our devices reaching their support end as well. The race to upstream
> was lost in this case - backlog too long, we being too slow.

So you have no device to test and there is actually no device which has this
capability in the wild.

Am I reading this correct?

In any case, we have platforms in the wild that actually support GPEs and this
makes sense for them.

> > It took me a while to gather all bits of this puzzle.
> > 
> > At least now I get an event, but kernel oopses, I'll continue debugging
> > tomorrow.

-- 
With Best Regards,
Andy Shevchenko


