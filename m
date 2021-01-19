Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8C92FC1F2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 22:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390364AbhASVKL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 16:10:11 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51965 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389908AbhASVKE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 16:10:04 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6F8E7E0008;
        Tue, 19 Jan 2021 21:09:20 +0000 (UTC)
Date:   Tue, 19 Jan 2021 22:09:20 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 02/17] rtc: bd70528: Do not require parent data
Message-ID: <20210119210920.GR3666@piout.net>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <e113a308ee6e9d22ca7fae066119def1793068d9.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e113a308ee6e9d22ca7fae066119def1793068d9.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/01/2021 09:14:45+0200, Matti Vaittinen wrote:
> The ROHM BD71828 and BD71815 RTC drivers only need the regmap
> pointer from parent. Regmap can be obtained via dev_get_regmap()
> so do not require parent to populate driver data for that.
> 
> BD70528 on the other hand requires parent data to access the
> watchdog so leave the parent data for BD70528 here for now.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> Please note that this same change has been sent individually:
> https://lore.kernel.org/lkml/20210105152350.GA3714833@localhost.localdomain/
> It is present in this series only because some patches depend on it.
> 

Then I think it is best to have it as part of this series.

> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

I've alway wanted to comment on that, should he have to say "I don't
think" to vanish ? Because saying "I don't think so," means that he
thinks this is not so.

> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~

And I guess this should be simply "non cogito" ;)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
