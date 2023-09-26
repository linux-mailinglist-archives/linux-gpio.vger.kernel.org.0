Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 931B37AE66E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 09:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjIZHKC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 03:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjIZHKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 03:10:01 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7955EEB;
        Tue, 26 Sep 2023 00:09:55 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E236480A3;
        Tue, 26 Sep 2023 07:09:54 +0000 (UTC)
Date:   Tue, 26 Sep 2023 10:09:53 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] OMAP/gpio: drop MPUIO static base
Message-ID: <20230926070953.GV5285@atomide.com>
References: <20230912-omap-mpuio-base-v1-1-290d9bd24b23@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912-omap-mpuio-base-v1-1-290d9bd24b23@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [230912 08:45]:
> The OMAP GPIO driver hardcodes the MPIO chip base, but there
> is no point: we have already moved all consumers over to using
> descriptor look-ups.
> 
> Drop the MPUIO GPIO base and use dynamic assignment.
> 
> Root out the unused instances of the OMAP_MPUIO() macro and
> delete the unused OMAP_GPIO_IS_MPUIO() macro.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Maybe Bartosz can merge this into the GPIO tree with Tony's
> et al blessing?

Best to wait for Tested-by from Aaro on this one.

As far as I'm concerned, good to see this:

Reviewed-by: Tony Lindgren <tony@atomide.com>
