Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABF444E98E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 16:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhKLPKO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 10:10:14 -0500
Received: from mga03.intel.com ([134.134.136.65]:32298 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229509AbhKLPKO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Nov 2021 10:10:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="233088111"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="233088111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 07:07:23 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="453174293"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 07:07:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mlY92-0068RE-6L;
        Fri, 12 Nov 2021 17:07:12 +0200
Date:   Fri, 12 Nov 2021 17:07:11 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YY6DHw6q/1B3NpMC@smile.fi.intel.com>
References: <20211111202506.19459-1-brgl@bgdev.pl>
 <20211111202506.19459-2-brgl@bgdev.pl>
 <CAHp75Vdbgk-SVe_eFHUdnNUF65ZSRPHVZXExus13Q6j2CHFy=g@mail.gmail.com>
 <CAMRc=MdtuDVnBMWHuTYUC7e65s8GsYrPnRv0zcmWGJwEQfmuSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdtuDVnBMWHuTYUC7e65s8GsYrPnRv0zcmWGJwEQfmuSw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 12, 2021 at 03:48:34PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 11, 2021 at 9:47 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> Will do. Just a note: some drivers that parse the ngpios property will
> need to continue doing it themselves as they have additional
> requirements from the value (limited max value, needs to be multiple
> of 8, etc.) on the read value. For those that are obvious, we can
> start converting them after this patch lands.

Sure! No objections from my side.

-- 
With Best Regards,
Andy Shevchenko


