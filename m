Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD17519930C
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 12:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730354AbgCaKE1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 06:04:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:43354 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730153AbgCaKE0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Mar 2020 06:04:26 -0400
IronPort-SDR: 0yXsBH4sIb7cSwDC9USBhLlZkpUtTxguu2IL0nyoLJMnDv90PhFSVSzDv4r4NKH5tPC6O0cGSy
 RLSblCAhHwQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 03:04:26 -0700
IronPort-SDR: HBeQdi/SaokiTDHnmMWYOTZBXAEA5uoht7ekcr6xyDALfz/nmQW90h/Klhe8/zFPZ/Y5Y0ahtZ
 hFB6djdmXWmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="422241863"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2020 03:04:24 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jJDkw-00ES8r-IC; Tue, 31 Mar 2020 13:04:26 +0300
Date:   Tue, 31 Mar 2020 13:04:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, Marcel Gudert <m.gudert@eckelmann.de>
Subject: Re: [PATCH v2 0/2] gpio: pca953x: fix handling of automatic address
 incrementing
Message-ID: <20200331100426.GD1922688@smile.fi.intel.com>
References: <20200330195018.27494-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200330195018.27494-1-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 30, 2020 at 09:50:16PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this is v2, the only code change compared to v1 is that I added a
> closing parenthesis to create actually compiling code :-|
> 
> Other than that I added some tags (Tested-by and Reviewed-by, some of
> them I got off-list). I wasn't sure if I should apply Andy's tags also
> to patch 1 (and so didn't).

Thank you for an update.
I elaborated in patch 1 the above.

> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>   gpio: pca953x: fix handling of automatic address incrementing
>   gpio: pca953x: drop unused parameters of pca953x_recalc_addr()
> 
>  drivers/gpio/gpio-pca953x.c | 75 +++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 36 deletions(-)
> 
> -- 
> 2.26.0.rc2
> 

-- 
With Best Regards,
Andy Shevchenko


