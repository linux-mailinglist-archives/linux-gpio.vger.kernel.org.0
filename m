Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FA51EA035
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 10:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgFAIk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 04:40:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:13215 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgFAIk0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Jun 2020 04:40:26 -0400
IronPort-SDR: 0eEX3d3AHHebF668Kpg8CF5RmvlXtW9GU5FXeEKGMSbHSdI0UQkRRCclujWF1liyzaNlYnn83D
 ASaJB4g5UTUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 01:40:26 -0700
IronPort-SDR: mmTs9BvjL4tqgEkeESG+Vw05NH93fgiJ1Yos/Y8r3J+Epo3bCLEGbqHKmVAU7+nkcaRCek8lNC
 rh651HDxiHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; 
   d="scan'208";a="377345095"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Jun 2020 01:40:24 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 01 Jun 2020 11:40:23 +0300
Date:   Mon, 1 Jun 2020 11:40:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/2] gpio: pca953x: Override IRQ for one of the
 expanders on Galileo Gen 2
Message-ID: <20200601084023.GR247495@lahna.fi.intel.com>
References: <20200529133054.20136-1-andriy.shevchenko@linux.intel.com>
 <20200529133054.20136-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200529133054.20136-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 29, 2020 at 04:30:54PM +0300, Andy Shevchenko wrote:
> ACPI table on Intel Galileo Gen 2 has wrong pin number for IRQ resource
> of one of the I²C GPIO expanders. Since we know what that number is and
> luckily have GPIO bases fixed for SoC's controllers, we may use a simple
> DMI quirk to match the platform and retrieve GpioInt() pin on it for
> the expander in question.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I don't think this is needed since I did not suggest you to write this
patch. I only gave a couple of review comments.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
