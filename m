Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2B441C4ED
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 14:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343887AbhI2Mrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 08:47:48 -0400
Received: from mga18.intel.com ([134.134.136.126]:54449 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343839AbhI2Mrs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Sep 2021 08:47:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="212014767"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="212014767"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 05:46:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="617491565"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 05:46:04 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 29 Sep 2021 15:46:01 +0300
Date:   Wed, 29 Sep 2021 15:46:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Cai Huoqing <caihuoqing@baidu.com>,
        Andy Shevchenko <andy@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] pinctrl: intel: Kconfig: Add configuration menu to
 Intel pin control
Message-ID: <YVRgCTua9ZCDRJPJ@lahna>
References: <20210918054630.18544-1-caihuoqing@baidu.com>
 <CACRpkdY+AmyhSDMM2hgcnv16+reLJornsQMemd+=8b-jSd8AKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY+AmyhSDMM2hgcnv16+reLJornsQMemd+=8b-jSd8AKg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 23, 2021 at 11:56:58PM +0200, Linus Walleij wrote:
> On Sat, Sep 18, 2021 at 7:46 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
> 
> > Adding a configuration menu to hold many Intel pin control drivers
> > helps to make the display more concise.
> >
> > Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > ---
> > v1->v2: Revert to "select PINCTRL_INTE" for PINCTRL_TIGERLAKE config.
> > v2->v3: Update commit message.
> 
> Looks good to me, I expect Andy to queue this and send it to me.

I applied it now as Andy is still on vacation. We will send this to you
along with (possible) other stuff before next merge window opens.
