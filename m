Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AB048AD44
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 13:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239207AbiAKMEX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 07:04:23 -0500
Received: from mga17.intel.com ([192.55.52.151]:45176 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238920AbiAKMEU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 07:04:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224166430"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="224166430"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:04:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="490357321"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:04:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1n7Frk-009DH7-Hh;
        Tue, 11 Jan 2022 14:03:04 +0200
Date:   Tue, 11 Jan 2022 14:03:04 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: tps68470: Allow building as module
Message-ID: <Yd1x+A3YJsSk/lwz@smile.fi.intel.com>
References: <20220111105632.219581-1-hdegoede@redhat.com>
 <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
 <dd4387d7-76e7-2831-18ce-c57bfdb3f9a4@redhat.com>
 <Yd1x3EbXzjTdfms2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd1x3EbXzjTdfms2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 02:02:37PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 11, 2022 at 12:46:16PM +0100, Hans de Goede wrote:
> > On 1/11/22 12:31, Andy Shevchenko wrote:
> > > On Tue, Jan 11, 2022 at 11:56:32AM +0100, Hans de Goede wrote:
> 
> ...
> 
> > > It used to be 2 patches in the series, are you going to send another one
> > > separately?
> > 
> > Ah right, I forgot this was a series. The other one had no review comments,
> > so v1 is still valid, you can find it here:
> > 
> > https://lore.kernel.org/linux-gpio/20211225120026.95268-2-hdegoede@redhat.com/
> 
> Okay (but in the future it's better to send a new complete version, it's easier
> for `b4` tool to handle).

No need to resend, I will handle this now.

-- 
With Best Regards,
Andy Shevchenko


