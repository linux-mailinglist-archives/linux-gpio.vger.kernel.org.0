Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69402179C0F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 23:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388389AbgCDW5E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 17:57:04 -0500
Received: from muru.com ([72.249.23.125]:58944 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387931AbgCDW5D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Mar 2020 17:57:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5112780F5;
        Wed,  4 Mar 2020 22:57:48 +0000 (UTC)
Date:   Wed, 4 Mar 2020 14:56:59 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Gerlach <d-gerlach@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 1/3] ARM: OMAP2+: Handle errors for cpu_pm
Message-ID: <20200304225659.GA37466@atomide.com>
References: <20200304225433.37336-1-tony@atomide.com>
 <20200304225433.37336-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304225433.37336-2-tony@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200304 22:55]:
> We need to check for errors when calling cpu_pm_enter() and
> cpu_cluster_pm_enter(). And we need to bail out on errors as
> otherwise we can enter a deeper idle state when not desired.
> 
> I'm not aware of the lack of error handling causing issues yet,
> but we need this at least for blocking deeper idle states when
> a GPIO instance has pending interrupts.

Also, If these changes look OK, it's probably best to apply all
three into some immutable gpio branch against v5.6-rc1 that
I can merge in too if needed.

Regards,

Tony
