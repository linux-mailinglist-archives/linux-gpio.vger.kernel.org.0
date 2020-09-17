Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED8F26D757
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 11:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIQJEA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 05:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIQJD7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 05:03:59 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4354BC06174A;
        Thu, 17 Sep 2020 02:03:58 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id i22so2217256eja.5;
        Thu, 17 Sep 2020 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Igtq6uu7KJrv2n58bm+ZDKMIbznG6BAqe68oGhP+b4s=;
        b=VG+m/5sKOeinoDaoVnzeOTtq2OzKYhz7+iqitoMVWzDDvniTyCCg9eT+LY4JQOm+wd
         rRWef4XXXh0B3TX8W70ky3UZW6hfLoT0trHa017tZ1PEV+2E1gZcRLD4kgfDJr33P7dB
         jW+gMoK+LsmbPfuubcUGBZpjwhgRk4aeFr96yTxI5WMn3mRicoc7PEKLUrFqQ+A+dcX5
         zFnDai1pktXDNjeBl8DFO5ATy+XqlzCssQmc58hlhm/abfmPC8Ecpf9wVp7B0PI14Gtw
         HSN9VS9zq2XT+1e/o4Pjbl4tn6tS1QyojP+RuZO/NNRDNk7DM/QZFoAnjWe84uhlXEza
         EerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Igtq6uu7KJrv2n58bm+ZDKMIbznG6BAqe68oGhP+b4s=;
        b=Y4fOLL+8C/EBpSMS99F4COw804cfWKHJ90aLZb9AG+2WF0xOiZROLSpzdP2C34Zc8Q
         FXUv+Tm+sBhf/WANETda0s6ofVxJggET4++ArNhi914PzywfsQnZRqsowKNXgeDX/In6
         gP7aOOC+WNt/96dSy4KQlxMYp+FuGdPKgLzutz0o0//VdhtCNnxelOnAoR4IoaP2lZvW
         8edeQSxS+/5uRiv/Maq8SdSIauQcNAhO/7Ip/WmwLBf9LWmQj84UCE6z3UmwtjVJ/CJE
         bz53Kzeze+HmebPylc4ePN8cpKWvJsHWJRnSa+12T65qXkXSLETp39x1POeU4icyQGUF
         i1Rw==
X-Gm-Message-State: AOAM533OKFOf8VUjgHg2ibijrnsgYK+zqocL+JuuK/7mqywfo15vjI70
        4tsRsJFj7ntH/j8DIl5GUEjg0vSv+mshelivHdQXSwpvcIA=
X-Google-Smtp-Source: ABdhPJyVjQKWOe8cx7o4BVt+1Y/GaF1ao/JasLf4SDBbKCTzUkyNP7gp+H9B3pD0+rNaqcAiYLxqpsd2cDFf3n/Tq2c=
X-Received: by 2002:a17:906:82c1:: with SMTP id a1mr18573837ejy.270.1600333437454;
 Thu, 17 Sep 2020 02:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200914104352.2165818-1-drew@beagleboard.org>
In-Reply-To: <20200914104352.2165818-1-drew@beagleboard.org>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Thu, 17 Sep 2020 02:03:46 -0700
Message-ID: <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 3:44 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> +
> +When #pinctrl-cells = 2, then setting a pin for a device could be done with:
> +
> +       pinctrl-single,pins = <0xdc 0x30 0x07>;
> +
> +Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
> +See the device example and static board pins example below for more information.

Pin configuration and mux mode don't mean anything in pinctrl-single.
On another machine, mux mode might not be programmed this way or even
exist.  Or the location of bits would probably be different, and this
would seem to imply the 0x07 would get shifted to the correct location
for where the pin mux setting was on that machine's pinctrl registers.

It seems like it would be better to explain the values are ORed together.

What is the purpose of this change anyway?  It seems like in the end
it just does what it did before.  The data is now split into two cells
in the device tree, but why?
