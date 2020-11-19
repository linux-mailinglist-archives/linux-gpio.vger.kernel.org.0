Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976AE2B8E91
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 10:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgKSJTM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 04:19:12 -0500
Received: from muru.com ([72.249.23.125]:48692 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgKSJTL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 04:19:11 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 94B9580C1;
        Thu, 19 Nov 2020 09:19:17 +0000 (UTC)
Date:   Thu, 19 Nov 2020 11:19:07 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>
Subject: Re: [PATCH] gpio: omap: handle deferred probe with dev_err_probe()
 for gpiochip_add_data()
Message-ID: <20201119091907.GH26857@atomide.com>
References: <20201118143149.26067-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118143149.26067-1-grygorii.strashko@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [201118 14:33]:
> The gpiochip_add_data() may return -EPROBE_DEFER which is not handled
> properly by TI GPIO driver and causes unnecessary boot log messages.
> 
> Hence, add proper deferred probe handling with new dev_err_probe() API.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Acked-by: Tony Lindgren <tony@atomide.com>
