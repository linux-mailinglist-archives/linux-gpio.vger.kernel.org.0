Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5653313D8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhCHQwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:52:04 -0500
Received: from mga05.intel.com ([192.55.52.43]:35271 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230144AbhCHQvm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 11:51:42 -0500
IronPort-SDR: SjGcSfG9qxCxu4EpC8j/wQxl3hbIyCc40IRaisZt1pP444YpKjgI0KOld6gZkebrVHSbQziolF
 bN8uJddyjOdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273092389"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="273092389"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:51:42 -0800
IronPort-SDR: e6c1N2dqOoPH110DPXBYx5QfHr2DYwfK8jJfZBOnWJ31LPSNIcprKwpj+OAU3jcygEFrExL3Z6
 Km648+A4/yoQ==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="508988283"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:51:39 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 08 Mar 2021 18:51:37 +0200
Date:   Mon, 8 Mar 2021 18:51:37 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Show the GPIO base calculation
 explicitly
Message-ID: <20210308165137.GJ2542@lahna.fi.intel.com>
References: <20210308164910.87286-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308164910.87286-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 08, 2021 at 06:49:10PM +0200, Andy Shevchenko wrote:
> During the split of intel_pinctrl_add_padgroups(), the _by_size() variant
> missed the GPIO base calculations and hence made unable to retrieve proper
> GPIO number.
> 
> Assign the gpio_base explicitly in _by_size() variant.
> 
> While at it, differentiate NOMAP case with the rest in _by_gpps() variant.
> 
> Fixes: 036e126c72eb ("pinctrl: intel: Split intel_pinctrl_add_padgroups() for better maintenance")
> Reported-and-tested-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I think this needs stable tag too.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
