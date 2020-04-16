Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EA71ABF73
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633485AbgDPLf5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:35:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:49921 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2633761AbgDPLfm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 07:35:42 -0400
IronPort-SDR: JlLiotrAurs9eS89D/lL3AA4s91UrsTVbW6lQSOcgq4Nfy9UMqWRx1TfT9C2Bd2WWlaWK6yOxq
 Ww2oA0Phhz/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 04:35:42 -0700
IronPort-SDR: NqK85L1dulKu/5rbERxgaLNMOI3Omv8yoJBKLFyT1x2ewZRht2u3F0FMPEnjSSVuWMxowS81QK
 7w8kFJWUaXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="242623296"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 16 Apr 2020 04:35:40 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jP2o3-00115L-UD; Thu, 16 Apr 2020 14:35:43 +0300
Date:   Thu, 16 Apr 2020 14:35:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] gpio: merrifield: Switch over to MSI interrupts
Message-ID: <20200416113543.GB185537@smile.fi.intel.com>
References: <20200408154155.68310-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZKEpz=acfw0zQ71pWmLU8dALS4tap412U2x6GyY82opw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZKEpz=acfw0zQ71pWmLU8dALS4tap412U2x6GyY82opw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 12:50:43PM +0200, Linus Walleij wrote:
> On Wed, Apr 8, 2020 at 5:41 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Some devices may support MSI interrupts. Let's at least try to use them
> > in platforms that provide MSI capability.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied.

Can we return to established scheme when we send a PR to you? Or you think
better not to do like that anymore?

-- 
With Best Regards,
Andy Shevchenko


