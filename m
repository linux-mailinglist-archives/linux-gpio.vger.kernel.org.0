Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB7D1F561F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 15:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgFJNrp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 09:47:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:51532 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgFJNrp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 09:47:45 -0400
IronPort-SDR: amUbzYlGEX70+aOjgRc/4p68lOb+l4wuI7sbdq5Oj8za61XUb5DAsiTO8VQ7De7JElXbH8dCiX
 QJLHbrZzNVvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 06:47:44 -0700
IronPort-SDR: rNN5FT276eiwY/JkfvgFQDmi+UgXhVv2dvoLjUJEEq6wTAGiMSDfFoK4esPyVZZWmUDGI5qy9D
 0oYc2hZfZ0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="418749638"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2020 06:47:42 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jj14y-00C9SK-F5; Wed, 10 Jun 2020 16:47:44 +0300
Date:   Wed, 10 Jun 2020 16:47:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 5/6] gpio: dwapb: Get rid of legacy platform data
Message-ID: <20200610134744.GI2428291@smile.fi.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200608134300.76091-6-andriy.shevchenko@linux.intel.com>
 <CACRpkdY5wAAVmsbi3UgJR4j_oofX5sDp=x0Pmag+w=L0XfRNoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY5wAAVmsbi3UgJR4j_oofX5sDp=x0Pmag+w=L0XfRNoQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 01:39:50PM +0200, Linus Walleij wrote:
> On Mon, Jun 8, 2020 at 3:43 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Platform data is a legacy interface to supply device properties
> > to the driver. In this case we don't have anymore in-kernel users
> > for it. Just remove it for good.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I really like where this series takes us so I hope we can still apply all of
> this in some form!

Thanks! I hope you see the benefit despite some (GPIO base) limitations.

-- 
With Best Regards,
Andy Shevchenko


