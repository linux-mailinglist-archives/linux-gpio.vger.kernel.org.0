Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECF21A9435
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 09:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393679AbgDOH07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 03:26:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:35641 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390602AbgDOH0z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 03:26:55 -0400
IronPort-SDR: zbzXEOJakA6xvcuh6TeoiMKasnp/0fo2+kZEllzbZo5ZQyICBgCI95qWhzEi8z6sBTVpwXlhEm
 cu7FxPmmilaA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 00:26:53 -0700
IronPort-SDR: FfGY3Dtqh/htO/vY7lCHJupmsx7ihwxvFuGznTZ2nkE29aKv1FIBmZPgY5FtEMqLa3/f8VRvDv
 J+yfXvwE2jwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="363600159"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 15 Apr 2020 00:26:51 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 15 Apr 2020 10:26:51 +0300
Date:   Wed, 15 Apr 2020 10:26:51 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Use
 platform_get_irq_optional() explicitly
Message-ID: <20200415072651.GQ2586@lahna.fi.intel.com>
References: <20200414161338.3025-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414161338.3025-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 07:13:37PM +0300, Andy Shevchenko wrote:
> There is no need to repeat functionality of platform_get_irq_optional()
> in the driver. Replace it with explicit call to the helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
