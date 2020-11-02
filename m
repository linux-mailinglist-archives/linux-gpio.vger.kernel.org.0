Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3763E2A2FD2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 17:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgKBQac (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 11:30:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:15736 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgKBQac (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 11:30:32 -0500
IronPort-SDR: BNZwqABSRgdL+tSZAguAEwcG8oLrkmWAIFY2m7EGN8iNYvKxGhK+9keTzV2SN7aRpsiXw1Geb8
 blQGTJkfjDDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="230542341"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="230542341"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 08:30:31 -0800
IronPort-SDR: KxTjdbhRqQcDMp4w7f6D8Sb7XuqWL2QCWjbz8dlcuWkx2T4JUx1ivd6xpEPYbX6zzoG0VR2uIE
 cCpH8WTV8KuQ==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="470436421"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 08:30:29 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 02 Nov 2020 18:30:27 +0200
Date:   Mon, 2 Nov 2020 18:30:27 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Elkhart Lake pin controller
 support
Message-ID: <20201102163027.GV2495@lahna.fi.intel.com>
References: <20201102122107.57687-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102122107.57687-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 02, 2020 at 02:21:07PM +0200, Andy Shevchenko wrote:
> This driver adds pinctrl/GPIO support for Intel Elkhart Lake SoC. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
