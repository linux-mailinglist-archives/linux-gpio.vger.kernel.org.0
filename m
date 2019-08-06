Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24CEE82FBF
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 12:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732494AbfHFKaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 06:30:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:44574 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728845AbfHFKaI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 06:30:08 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 03:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="192635119"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 06 Aug 2019 03:30:05 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 06 Aug 2019 13:30:04 +0300
Date:   Tue, 6 Aug 2019 13:30:04 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/8] pinctrl: broxton: Provide Interrupt Status
 register offset
Message-ID: <20190806103004.GM2548@lahna.fi.intel.com>
References: <20190723155633.65232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723155633.65232-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 23, 2019 at 06:56:26PM +0300, Andy Shevchenko wrote:
> Since some of the GPIO controllers use different Interrupt Status offset,
> it make sense to provide it explicitly in the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For this and the rest of the patches in this series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
