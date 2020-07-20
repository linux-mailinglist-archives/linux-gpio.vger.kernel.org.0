Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417C6225E49
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 14:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgGTMT0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 08:19:26 -0400
Received: from mga11.intel.com ([192.55.52.93]:33298 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728590AbgGTMT0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jul 2020 08:19:26 -0400
IronPort-SDR: CuOZiaL6kxA7mjtMKii8OW77v2hb3rMHoHdTSyokwYk0eF8/8M5M5w5kPGxS1Z3NhFrHoFdBOV
 a1qHFNvQB+kQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="147849022"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="147849022"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 05:19:25 -0700
IronPort-SDR: zgsJ13n28luTSR4ioZyCdgHfqSl5akBFO5AoqSvf3+QB8AJcFHIHuPHtIjETDKfhZFEYo4JVlp
 XsKLEo3DormQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; 
   d="scan'208";a="392016971"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 20 Jul 2020 05:19:23 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 20 Jul 2020 15:19:23 +0300
Date:   Mon, 20 Jul 2020 15:19:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Emmitsburg pin controller
 support
Message-ID: <20200720121923.GI5180@lahna.fi.intel.com>
References: <20200716124244.50797-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716124244.50797-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 03:42:44PM +0300, Andy Shevchenko wrote:
> This driver adds pinctrl/GPIO support for Intel Emmitsburg PCH. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
