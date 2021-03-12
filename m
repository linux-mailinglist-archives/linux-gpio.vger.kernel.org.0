Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41152338BA8
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 12:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhCLLkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 06:40:55 -0500
Received: from mga11.intel.com ([192.55.52.93]:39430 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233815AbhCLLkc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Mar 2021 06:40:32 -0500
IronPort-SDR: Yo1NP345y2OQxQoowHH6b4DwmjdogczuOn3ePZLvP+vZoIlxTbVy/Xw+MZoXn8rDe+Q4x9dZym
 Z/SXe2/J/g4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="185465721"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="185465721"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 03:40:31 -0800
IronPort-SDR: KmDbjmZ3TpUjoKFXZpa+TXSHMly9BGSPxV+CtAzBBYHA6vhFN1fn0dAHtRBQTm/s9hs0gGBTbg
 ZCiqxZjtvzCQ==
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="372652249"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 03:40:28 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lKg9Y-00Bq4M-So; Fri, 12 Mar 2021 13:40:24 +0200
Date:   Fri, 12 Mar 2021 13:40:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 07/11] lib: bitmap: provide devm_bitmap_alloc() and
 devm_bitmap_zalloc()
Message-ID: <YEtTKJliHBep7bL4@smile.fi.intel.com>
References: <20210312095700.16277-1-brgl@bgdev.pl>
 <20210312095700.16277-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312095700.16277-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 10:56:56AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Provide managed variants of bitmap_alloc() and bitmap_zalloc().

Perhaps I missed your answer to Greg's comment...
So, what do you think about adding _GPL to the export?

-- 
With Best Regards,
Andy Shevchenko


