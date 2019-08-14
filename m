Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B848CEF7
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 11:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbfHNJEP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 05:04:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36287 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfHNJEO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 05:04:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id u15so9132291ljl.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lq2l16RSFjq6wz/ruQesNuUbLI8gmiZmId5G0J+mFQo=;
        b=zQF4AgTB+9jEl7UsscxvQbb3C/iWEfR4hAhEodH95ojTdcbsoROw3XnU60PvQtxDcc
         KLO3c4fng1VTaMMoqMhN+6kfbYEAeC0rmOaIGjwz7EmbTXkN8mv6xUuUXiBKFQY48PTX
         h6SaaxEGRKrAfH25y8SCObSPisDoXFK/JcHqbwgIPzvmvmxSzB5rGjFw/JuTF1WrV8CO
         N4L6K56gDoxrBlvdai1ZTrldNmS0Wo7/JsNqAu+9xhExyoOzfT7lbF/xWCsTz376brts
         AUE7D3rTs96kryUmLSju9r6Wr3jB9RWG7fKXCrvg++wk1U4//1R2pQt8zeD+IjK3ojuz
         QCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lq2l16RSFjq6wz/ruQesNuUbLI8gmiZmId5G0J+mFQo=;
        b=ZI3B7fq/wlwzyNU4izVjrhX7BqQvCcLtp0lYayS9caAYk74bf2RC/gwsrn667dub8g
         VT54osJ9JloeqZQ1d+PPllT84w/1whTFf4IqbA06sUoZJCA0RLo3DY9W9n0p/SGHkvmR
         WxQAvhOhE4gjHGWGcnkKyW/NvqOBExZH4j1nM713BOlBDgw4O0SrdERVd9bKkjC7HA5D
         4+duWsGeLtlRbH2yI5kWagY7Cd/bkBCnyAPPtP6LvAgHvsMuahuJn1fLIuqqKi1fmwL2
         2DzdOCLy0aUD4G/flJzC6SAXeROI0p2AFSUZmr3q7gXvZDHBhoISWZ/w0zzDX1Rvpdl7
         Br7A==
X-Gm-Message-State: APjAAAVt+Kk/SKlyC3FOqSSpQrxIqz+TEa39vZti39hzjsP5UzFVxiUw
        SG5gv4iqjCQ9A8f23ArAS6lXay19ajb8PuC4z9ol/A==
X-Google-Smtp-Source: APXvYqzPYWkAeDfuLYjvtXLWvxIxO98UH5s/tMQr2Hk9GOmp+mYngZQOcDzHvZK/OEE9UNRS960d4fKBb6LVSE0+JWE=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr23992742ljc.28.1565773452821;
 Wed, 14 Aug 2019 02:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <5D514D6F.4090904@hisilicon.com>
In-Reply-To: <5D514D6F.4090904@hisilicon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 11:04:01 +0200
Message-ID: <CACRpkdbi21mV5quTmur6egb6FJMFrD-Lg1EUKtk+HejyWjzmUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Fix the issue failed to register the ACPI interruption
To:     Wei Xu <xuwei5@hisilicon.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Linuxarm <linuxarm@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>, jinying@hisilicon.com,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Wei,

thanks for your patch!

This doesn't apply for my "devel" branch, can you rebase
on this:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel

We have moved some ACPI headers around recently.

On Mon, Aug 12, 2019 at 1:28 PM Wei Xu <xuwei5@hisilicon.com> wrote:

> Invoke acpi_gpiochip_request_interrupts after the acpi data has been
> attached to the pl061 acpi node to register interruption.

Makes sense.

> Fixes: 04ce935c6b2a ("gpio: pl061: Pass irqchip when adding gpiochip")

I doubt this is a regression since I haven't seen anyone use this
gpiochip with ACPI before.

Please rename the patch "gpio: pl061: Add ACPI support" unless
you can convince me it worked without changes before.

Please include some ACPI people on review of this. From
MAINTAINERS:
ACPI
M:      "Rafael J. Wysocki" <rjw@rjwysocki.net>
M:      Len Brown <lenb@kernel.org>
L:      linux-acpi@vger.kernel.org

I would also include Andy Shevchenko and Mika Westerberg for
the GPIO aspects.

Thanks!
Linus Walleij
