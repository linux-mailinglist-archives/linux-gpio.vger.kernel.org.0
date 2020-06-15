Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4758C1F9D81
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 18:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbgFOQdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 12:33:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:49347 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729792AbgFOQdF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 12:33:05 -0400
IronPort-SDR: S4a7Z8Z/IGDo6qk2vI3MLJwwo8Tp5qk70BTvtV+5W/PceWEnNnImVlj3hrZv/5cttQ1MIJoIxH
 vupWWTiBD8HA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 09:33:05 -0700
IronPort-SDR: v9DBSSF0nHvoZsOtIRZQcrgG/whEyJlL+sQqsoZMVriEotjp2iOen251GNKqQRfR93s1gbioRd
 DOkvdD7YPfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="382592461"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 15 Jun 2020 09:33:03 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 15 Jun 2020 19:33:02 +0300
Date:   Mon, 15 Jun 2020 19:33:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/3] pinctrl: intel: Reuse for_each_requested_gpio*()
 macros
Message-ID: <20200615163302.GV247495@lahna.fi.intel.com>
References: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 06:13:50PM +0300, Andy Shevchenko wrote:
> This is part of previously sent clean up / fixes series against Intel pin
> control drivers. This piece replaces home grown alternatives to generic (*)
> for_each_requested_gpio*() helpers.
> 
> (*) Mika suggested to document for_each_requested_gpio*() helper, and I decided
> that it may be useful to GPIO and pin control subsystems in general, so, thus it
> has dependency to [1] submitted recently.
> 
> [1]: https://lore.kernel.org/linux-gpio/20200615150545.87964-1-andriy.shevchenko@linux.intel.com/T/#t
> 
> Andy Shevchenko (3):
>   pinctrl: intel: Make use of for_each_requested_gpio_in_range()
>   pinctrl: lynxpoint: Make use of for_each_requested_gpio()
>   pinctrl: lynxpoint: Introduce helpers to enable or disable input

Looks good,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
