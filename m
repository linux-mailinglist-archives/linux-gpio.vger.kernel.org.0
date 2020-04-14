Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10D71A77E1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 11:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437981AbgDNJxS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 05:53:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:56462 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728305AbgDNJxN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 05:53:13 -0400
IronPort-SDR: VvNoi/7Vldr2fuXlGjKgC6mhw7+NgYMKLO/wuJuD8FZ+VnxMXiqgxN4DAFSqN1C7U7NRIZtHqy
 SobThPnSKh5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 02:53:13 -0700
IronPort-SDR: Evrg4kyhBI82hAMDWKj8cjRTtQ/jpSq9S7YWmaNCuV/lnY/zRbJIjzum0NJNWSrsxG+KkO519S
 xMUyYcrKvsGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="363331921"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 14 Apr 2020 02:53:11 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 14 Apr 2020 12:53:10 +0300
Date:   Tue, 14 Apr 2020 12:53:10 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/6] pinctrl: intel: Add Intel Jasper Lake pin
 controller support
Message-ID: <20200414095310.GK2567@lahna.fi.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
 <20200413111825.89866-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413111825.89866-6-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 13, 2020 at 02:18:25PM +0300, Andy Shevchenko wrote:
> This driver adds pinctrl/GPIO support for Intel Jasper Lake SoC. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
