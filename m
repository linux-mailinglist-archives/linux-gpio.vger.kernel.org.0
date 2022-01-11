Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED42E48AD42
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 13:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239017AbiAKMDy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 07:03:54 -0500
Received: from mga06.intel.com ([134.134.136.31]:23946 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238920AbiAKMDy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 07:03:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="304207526"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="304207526"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:03:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="592672286"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:03:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1n7FrJ-009DGj-6Y;
        Tue, 11 Jan 2022 14:02:37 +0200
Date:   Tue, 11 Jan 2022 14:02:36 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: tps68470: Allow building as module
Message-ID: <Yd1x3EbXzjTdfms2@smile.fi.intel.com>
References: <20220111105632.219581-1-hdegoede@redhat.com>
 <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
 <dd4387d7-76e7-2831-18ce-c57bfdb3f9a4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd4387d7-76e7-2831-18ce-c57bfdb3f9a4@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 12:46:16PM +0100, Hans de Goede wrote:
> On 1/11/22 12:31, Andy Shevchenko wrote:
> > On Tue, Jan 11, 2022 at 11:56:32AM +0100, Hans de Goede wrote:

...

> > It used to be 2 patches in the series, are you going to send another one
> > separately?
> 
> Ah right, I forgot this was a series. The other one had no review comments,
> so v1 is still valid, you can find it here:
> 
> https://lore.kernel.org/linux-gpio/20211225120026.95268-2-hdegoede@redhat.com/

Okay (but in the future it's better to send a new complete version, it's easier
for `b4` tool to handle).

-- 
With Best Regards,
Andy Shevchenko


