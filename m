Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E8C21DF58
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 20:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgGMSHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 14:07:38 -0400
Received: from muru.com ([72.249.23.125]:36710 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729689AbgGMSHi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Jul 2020 14:07:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CAB0A8106;
        Mon, 13 Jul 2020 18:07:35 +0000 (UTC)
Date:   Mon, 13 Jul 2020 11:07:35 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: handle pin config bias flags
Message-ID: <20200713180735.GO5849@atomide.com>
References: <20200709223401.780051-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709223401.780051-1-drew@beagleboard.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200709 22:35]:
> Modify omap_gpio_set_config() to handle pin config bias flags by calling
> gpiochip_generic_config().
> 
> The pin group for the gpio line must have the corresponding pinconf
> properties:
> 
> PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
> 
> This is necessary for pcs_pinconf_set() to find the requested bias
> parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.

Looks good to me:

Acked-by: Tony Lindgren <tony@atomide.com>
