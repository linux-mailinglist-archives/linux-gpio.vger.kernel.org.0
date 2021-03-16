Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6589A33DF83
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 21:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhCPUuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 16:50:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:33915 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231701AbhCPUtt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 16:49:49 -0400
IronPort-SDR: gBJfmhqMTrgvSLi06RF1jrBVNXkvgFDOhWkLNNMXmCs3ReEHpg25x5wJMI5LDG5TsmHqpzn4HV
 m38HekheZVCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="188691410"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="188691410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 13:49:49 -0700
IronPort-SDR: adlCCluqB83BftXXGNsxKzpX8Ftg/JI82srDRY8QKCx2ziuCmWfK6on18+DTngIyBM85j0J7mJ
 +2KI/4mkiSAw==
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="511503288"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 13:49:47 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lMGdM-00D4YH-UU; Tue, 16 Mar 2021 22:49:44 +0200
Date:   Tue, 16 Mar 2021 22:49:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/2] gpio: sch: Hook into ACPI SCI handler to catch
 GPIO edge events
Message-ID: <YFEZ6GYuXGaX/LP2@smile.fi.intel.com>
References: <20210316162613.87710-1-andriy.shevchenko@linux.intel.com>
 <20210316162613.87710-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316162613.87710-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 16, 2021 at 06:26:13PM +0200, Andy Shevchenko wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Neither the ACPI description on the Quark platform provides the required
> information is to do establish generic handling nor hardware capable of
> doing it. According to the datasheet the hardware can generate SCI events.
> Therefore, we need to hook from the driver directly into SCI handler of
> the ACPI subsystem in order to catch and report GPIO-related events.
> 
> Validated on the Quark-based IOT2000 platform.

This patch must be dropped completely. SCI handler is not correct way to do
this. The proper way (and we have already few examples in the kernel) is to
register GPE event.

It took me a while to gather all bits of this puzzle.

At least now I get an event, but kernel oopses, I'll continue debugging
tomorrow.

-- 
With Best Regards,
Andy Shevchenko


