Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CB7E9BC5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 13:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfJ3MsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 08:48:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:13549 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbfJ3MsG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 08:48:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 05:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="211317074"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 30 Oct 2019 05:48:03 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 30 Oct 2019 14:48:03 +0200
Date:   Wed, 30 Oct 2019 14:48:02 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] gpiolib: Switch order of valid mask and hw init
Message-ID: <20191030124802.GD2593@lahna.fi.intel.com>
References: <20191030122914.967-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030122914.967-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 01:29:14PM +0100, Linus Walleij wrote:
> The GPIO irqchip needs to initialize the valid mask
> before initializing the IRQ hardware, because sometimes
> the latter require the former to be executed first.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
