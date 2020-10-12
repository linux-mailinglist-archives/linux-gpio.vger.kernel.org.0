Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E8E28B1EC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 12:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbgJLKCk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 06:02:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:52656 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgJLKCk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 06:02:40 -0400
IronPort-SDR: 5+aQiwNb3m56mCcKuo0Ha/21pXCErbmD3+5tsgRfex6mo7NoYRnjD4vWxiKOAg57ZUANs4drrR
 eIGXaWNMvjUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="183173319"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="183173319"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 03:02:40 -0700
IronPort-SDR: HDufLreEXLhbeEmWPG3kXP1984sbb9mMbdQUcDX8Xge+X40UbygOmxeNzquC8UN8Bv/ByHz9c7
 Itz6Cvf0GRcQ==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="317871288"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 03:02:38 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kRug9-004uSi-F5; Mon, 12 Oct 2020 13:03:41 +0300
Date:   Mon, 12 Oct 2020 13:03:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Switch to use
 compat_need_64bit_alignment_fixup() helper
Message-ID: <20201012100341.GE4077@smile.fi.intel.com>
References: <20201008134105.51387-1-andriy.shevchenko@linux.intel.com>
 <20201012042010.GA13984@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012042010.GA13984@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 12:20:10PM +0800, Kent Gibson wrote:
> On Thu, Oct 08, 2020 at 04:41:05PM +0300, Andy Shevchenko wrote:
> > The new compat_need_64bit_alignment_fixup() helper allows to avoid
> > ugly ifdeffery in IOCTL compatible code. Use it in GPIO cdev code.
> > 
> > Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")
> > Depends-on: cc7886d25bca ("compat: lift compat_s64 and compat_u64 to <asm-generic/compat.h>")
> 
> Where can I find these?

Soon in Linux upstream, but currently in Al Viro's tree: https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/log/?h=work.quota-compat

-- 
With Best Regards,
Andy Shevchenko


