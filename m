Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD262D3217
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 19:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730875AbgLHSZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 13:25:30 -0500
Received: from mga01.intel.com ([192.55.52.88]:2077 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730424AbgLHSZa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 13:25:30 -0500
IronPort-SDR: rMxK8n2Xrbz90ra+NP1BcEkfNTbeNi1sIrV2JhuGqJfWQoWpBxnZQUeouAqRg2cy78gDTi8Ed3
 gAY8LGG+8HHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="192235843"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="192235843"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 10:24:49 -0800
IronPort-SDR: LNZWxvlxfBiZEghXMozgiEdsi37bEN1tcvnIXJgyemMv3vkzo/5aD5Uo2i5dqnEgfNwuZiblPy
 n6bUfm2XIVYg==
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="317916904"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 10:24:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kmhgM-00Cswy-Re; Tue, 08 Dec 2020 20:25:50 +0200
Date:   Tue, 8 Dec 2020 20:25:50 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
Message-ID: <20201208182550.GN4077@smile.fi.intel.com>
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
 <CAHp75VeHz3CAZMQgQsU+WdDyjS+woMTyeOWYDzARePq1aaa=Og@mail.gmail.com>
 <CACRpkdb4AYx1dOYkZvHzRD7fbGfVbKoGqdnmh1m=rdhGnAaPag@mail.gmail.com>
 <20201208094853.GF4077@smile.fi.intel.com>
 <20201208095013.GG4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208095013.GG4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 11:50:13AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 08, 2020 at 11:48:53AM +0200, Andy Shevchenko wrote:

...

> I can send a v2 for your convenience.

v2 has been sent.

-- 
With Best Regards,
Andy Shevchenko


