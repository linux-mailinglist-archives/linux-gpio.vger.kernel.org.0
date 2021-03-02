Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E435932AD02
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448211AbhCBVS7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:59 -0500
Received: from mga05.intel.com ([192.55.52.43]:12610 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377871AbhCBP3q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Mar 2021 10:29:46 -0500
IronPort-SDR: GaMMCbJIcWj6grhHv7++B2szP68Xj1W+elBmV1RA3sN/vRspsulYVXJKsH0I7exJTDclyMYuJP
 UzOhNqXaugHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="271856089"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="271856089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 07:26:54 -0800
IronPort-SDR: 7+FrP5F0msfY+Cqs6oAEDQwTZB/D5PRbHDGzUcWD1IUwF36FpNeHVeMMi7F7BBzcHJNL1mK3Xy
 bpOqnuoAbAKQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="506367626"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 07:26:52 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lH6vB-009Ptd-Ll; Tue, 02 Mar 2021 17:26:49 +0200
Date:   Tue, 2 Mar 2021 17:26:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v1 1/1] gpio: Support interrupts in gpio-mlxbf2.c
Message-ID: <YD5ZOaBqmMJ/eJ/i@smile.fi.intel.com>
References: <1614120685-7452-1-git-send-email-Asmaa@mellanox.com>
 <1614120685-7452-2-git-send-email-Asmaa@mellanox.com>
 <CACRpkdZK-iqkSD_+5y9YOSzPk9yAY2VYHSKP+tBr7kZM68g2RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZK-iqkSD_+5y9YOSzPk9yAY2VYHSKP+tBr7kZM68g2RQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 02, 2021 at 03:02:00PM +0100, Linus Walleij wrote:
> Hi Asmaa,
> 
> thanks for your patch!
> 
> Please send GPIO related patches to linux-gpio@vger.kernel.org!

I'm not sure I saw the original mail, in any case, please Cc GPIO ACPI layer
maintainers for the future version of this, because some pieces of the code
(AFAICS from this message) looks suboptimal or dup or...

> On Tue, Feb 23, 2021 at 11:51 PM Asmaa Mnebhi <Asmaa@mellanox.com> wrote:

That said, will wait for v2 of this.

-- 
With Best Regards,
Andy Shevchenko


