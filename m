Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28882CEABA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 10:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgLDJUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 04:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbgLDJUK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 04:20:10 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7B9C061A51
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 01:19:24 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id s9so5762035ljo.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 01:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5d7QS+8aXm3Jo/dhQvPSPLMGlB6XfaOcQnDt/pos0Ws=;
        b=HFnTZWH6X1wkzC7QlBblqLyaQF9njYKqtCrrpWajz5RT570G7/SrSQv45Vn5VfcjQc
         B05CHty9taLOt4gHSyb5cFg48XKrJZOBNmNXFjasRAY9GJlvmEvpa17YSb1oDmvtnTox
         uOZ6bBMcYor/6pkM2ayA2O/csHCBT8kgTv9b0HwDHaatRGAMkchmiSUvNs/vcBwzzI8+
         F5vv3dwezRMPuiMFMKWY04gxUVehhymf+el4eB+e6fEvYppXeOi2nf9N1c2H0j7Jcyuf
         UgjlXVx2zFnAUiA2FrtYe+1O2RadiEX2bv+660peezhk+zcTwByWlUixsbI1MBT451a2
         gRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5d7QS+8aXm3Jo/dhQvPSPLMGlB6XfaOcQnDt/pos0Ws=;
        b=rJW1ssuscHZrV6JkB5A0yD2rl3YZQbH+6QpXrH8O3JZqVYAdIqeeeDI49ZTK8zwrbX
         zse6V9SJPHWFTvQfQCqQUJqcSe4ZXQQYGH49y8xeW/7By8MvapI2bbUXz5E3mOmJ3DDp
         XRbGfSxQNu+jhS85NbJpYcRFwyvJH5BCy5biLd9Zs/G38/JkVugzV9c5Dgeqbxi0cCbh
         whbYLE/Vuj8bjB3BzVFURwwvVzOU2urEdcrV8iApdi/YnLbTJlKQa5XqlsE7d144SdIc
         UcnJVDhrXgHCzGxLwQqdh5Urr85qxuQpbrJFz5RTmPbZc0Q2ZDbEyVFC/XTyg49CGobj
         iXvQ==
X-Gm-Message-State: AOAM530MeErIXk4qLb6jFsD70cPiv1bnqy+w1R8xAQ3jDzKI1PNMh/fT
        I03a2i7A/Ug3CxxR6KfiNEsgj1ijAkZiGZAF7QuouA==
X-Google-Smtp-Source: ABdhPJyCHSQRv+nMAlK9tcmnaAQ4ep11WKxlvgFh3ha/z/I3+vuqYJ4dvzKMhQ06y79w9YwuAwbMAjz9xP74UEEWpoM=
X-Received: by 2002:a05:651c:39d:: with SMTP id e29mr2803768ljp.144.1607073562865;
 Fri, 04 Dec 2020 01:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20201126063337.489927-1-andrew@aj.id.au>
In-Reply-To: <20201126063337.489927-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 10:19:12 +0100
Message-ID: <CACRpkdbMoLXiSipDkmRXeWA_tcyDC8R1kuxHzzvfYaeqLU5deg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPIO requests on pass-through banks
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Sasha Levin <sashal@kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 26, 2020 at 7:34 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Commit 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> fixes access to GPIO banks T and U on the AST2600. Both banks contain
> input-only pins and the GPIO pin function is named GPITx and GPIUx
> respectively. Unfortunately the fix had a negative impact on GPIO banks
> D and E for the AST2400 and AST2500 where the GPIO pass-through
> functions take similar "GPI"-style names. The net effect on the older
> SoCs was that when the GPIO subsystem requested a pin in banks D or E be
> muxed for GPIO, they were instead muxed for pass-through mode.
> Mistakenly muxing pass-through mode e.g. breaks booting the host on
> IBM's Witherspoon (AC922) platform where GPIOE0 is used for FSI.
>
> Further exploit the names in the provided expression structure to
> differentiate pass-through from pin-specific GPIO modes.
>
> This follow-up fix gives the expected behaviour for the following tests:
>
> Witherspoon BMC (AST2500):
>
> 1. Power-on the Witherspoon host
> 2. Request GPIOD1 be muxed via /sys/class/gpio/export
> 3. Request GPIOE1 be muxed via /sys/class/gpio/export
> 4. Request the balls for GPIOs E2 and E3 be muxed as GPIO pass-through
>    ("GPIE2" mode) via a pinctrl hog in the devicetree
>
> Rainier BMC (AST2600):
>
> 5. Request GPIT0 be muxed via /sys/class/gpio/export
> 6. Request GPIU0 be muxed via /sys/class/gpio/export
>
> Together the tests demonstrate that all three pieces of functionality
> (general GPIOs via 1, 2 and 3, input-only GPIOs via 5 and 6, pass-through
> mode via 4) operate as desired across old and new SoCs.
>
> Fixes: 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes.

Yours,
Linus Walleij
