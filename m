Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07852A2FE0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 17:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgKBQdk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 11:33:40 -0500
Received: from mga14.intel.com ([192.55.52.115]:31290 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbgKBQdk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 11:33:40 -0500
IronPort-SDR: tbjPAvKK0u1dFiJMgPSC76tkeRUYdKpDYc6hmQHvXZf8t2OmibGCSAyLHpXCmadoqzaENgMZL0
 hsiKECCzsE0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="168128333"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="168128333"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 08:33:36 -0800
IronPort-SDR: i6D0wsOwlr2+YcASbEGNEDJ02d0SC8IQJT+zTdlGbN8ydhDD/AqSm1WJ/2qlJRppuh+J99izrV
 rsflBxZlyQ6w==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="352860304"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 08:33:33 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 02 Nov 2020 18:31:20 +0200
Date:   Mon, 2 Nov 2020 18:31:20 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: lynxpoint: Unify initcall location in the
 code
Message-ID: <20201102163120.GW2495@lahna.fi.intel.com>
References: <20201102123911.58337-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102123911.58337-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 02, 2020 at 02:39:11PM +0200, Andy Shevchenko wrote:
> Like in the other Intel pin control drivers, attach initcalls
> to the corresponding functions. No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
