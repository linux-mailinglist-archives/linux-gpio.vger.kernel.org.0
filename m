Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448012EEDB8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 08:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbhAHHKP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 02:10:15 -0500
Received: from mga09.intel.com ([134.134.136.24]:52781 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbhAHHKP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 02:10:15 -0500
IronPort-SDR: IZOvrAmz5JtLOXm/xRlH4ahGP67WVk/6NJjzIsIFKW0bdIfqjXwC1+fGSMuGy636ESAVEjuWKi
 FbDgIO/w46eA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="177702876"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="177702876"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:08:29 -0800
IronPort-SDR: plRw9OnDI8wKFNKnDpeKK0Vm87eLcPubGdbfLYUnfozojm3BgLNDlqURLIqd7Qq7c2AjNq3r5F
 pzERRrotzs8A==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="422860560"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:08:27 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Jan 2021 09:08:24 +0200
Date:   Fri, 8 Jan 2021 09:08:24 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/4] pinctrl: intel: Drop unnecessary check for
 predefined features
Message-ID: <20210108070824.GZ968855@lahna.fi.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107190200.41221-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 07, 2021 at 09:01:58PM +0200, Andy Shevchenko wrote:
> None of the drivers is overriding features. Remove unnecessary check.
> While here, rename rev to value to make easier further development.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
