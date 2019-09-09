Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B54AD6A3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 12:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390466AbfIIKWd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 06:22:33 -0400
Received: from mga18.intel.com ([134.134.136.126]:13693 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730276AbfIIKWd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Sep 2019 06:22:33 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 03:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; 
   d="scan'208";a="200034521"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 09 Sep 2019 03:22:29 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 09 Sep 2019 13:22:28 +0300
Date:   Mon, 9 Sep 2019 13:22:28 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Chiu <chiu@endlessm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] pinctrl: intel: mark intel_pin_to_gpio
 __maybe_unused
Message-ID: <20190909102228.GD2608@lahna.fi.intel.com>
References: <20190906185231.1081695-1-arnd@arndb.de>
 <20190909092211.GN2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909092211.GN2680@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 09, 2019 at 12:22:11PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 06, 2019 at 08:51:59PM +0200, Arnd Bergmann wrote:
> > The intel_pin_to_gpio() function is only called by the
> > PM support functions and causes a warning when those are disabled:
> > 
> > drivers/pinctrl/intel/pinctrl-intel.c:841:12: error: unused function 'intel_pin_to_gpio' [-Werror,-Wunused-function]
> > 
> > Mark it __maybe_unused to suppress the warning.
> > 
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thanks!
