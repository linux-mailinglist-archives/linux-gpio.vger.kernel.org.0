Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D541B607394
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 11:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiJUJK7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 05:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiJUJKa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 05:10:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CE570E7B
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:09:45 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b12so3375815edd.6
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ00gNgP3Q+XocLnBJTsK8Spn3uV5zORNCmA+eX6cvI=;
        b=xh7xJ6ouTgDy99BEZDSRktFrkUHhO0I1Ca5KPxrRVmf4y7qzVE2PTiZeTPawPtit5s
         pZIlZGG82BSHvLVy4vP/4OGgQIZS4v7HPW2Kt0h0i48sA2lyisTzxL7Tgnx58dhRe/8W
         HWBusjVM+/8KUmBEwbj1eQD4ChuJQanwocCYzIDJKMG4/vYHPTVQ86jKwqqpA8mUAQLX
         zH3KOGe8Gew0fcs/Hxs15r7alRpJ2tq3p2l3UWpcqHDxyrYal3aG4Ct9Y+dVwgKGu1nA
         1f8UAFu4+3E/dg6M/Sh9z3KYHU82aWE4DvdOn+3ZqN+FVVKWdKUv6iZcjpK21LzzkZKU
         CKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZ00gNgP3Q+XocLnBJTsK8Spn3uV5zORNCmA+eX6cvI=;
        b=zM/+oiVzbUhamEmNUmSiwZmnxSZ9+lB2culsQHgm035R+bUMrwE9b2S94hy8s77deb
         fMBiUcjv/aEJbmCxuT7sZHR7fHlUideoIli/bgFSUV8IfUluompNFpVX09v69Ko0cfoa
         IkdejScJjgfgATSOjLDHH1HdC0zPZ5mlZb0vHVBvv6hXoBe/VvFo/ImcETj8GeO0Ze8A
         bMy2aHxsNU+wCv2sQxGW7x2FuYrJ3eHJeeIV0T7Y+xHuIBKgfkaWsDO0584oX3fWvAGf
         C7KQHUzpirkEpS06YvvihvDv9onOxmSJKvWrGc70KZIbDJgTPVpaSxllpQO20otaCayR
         g4lg==
X-Gm-Message-State: ACrzQf06a/np4lsEi65Y4vduydcMd8Fydsud4WNWqEfWp/R4YiO3N6Tz
        LJREtZa1oG2MNfzAkqvjEc3S+vXPQYCOv7JUXoS5HQ==
X-Google-Smtp-Source: AMsMyM7UgqMHIuvm+nIloXnPhWNOkilm8KxtSRpgvFu6EP1Y5QVz9gaC7UiQWvfPLtfDV18jT9ZdwsCme1r0W4I3IxE=
X-Received: by 2002:a05:6402:1d55:b0:45f:c87f:c753 with SMTP id
 dz21-20020a0564021d5500b0045fc87fc753mr8129956edb.32.1666343379498; Fri, 21
 Oct 2022 02:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221019022450.16851-1-larry.lai@yunjingtech.com> <20221019022450.16851-6-larry.lai@yunjingtech.com>
In-Reply-To: <20221019022450.16851-6-larry.lai@yunjingtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 11:09:27 +0200
Message-ID: <CACRpkdYfPT6-gt2RCxzPfy+GdkLYo8KP02CLLC+uY512AqPwNw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: Add support pin control for UP board CPLD/FPGA
To:     chengwei <foxfly.lai.tw@gmail.com>
Cc:     lee@kernel.org, broonie@kernel.org, rafael@kernel.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        brgl@bgdev.pl, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, lenb@kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        GaryWang@aaeon.com.tw, musa.lin@yunjingtech.com,
        jack.chang@yunjingtech.com, chengwei <larry.lai@yunjingtech.com>,
        Javier Arteaga <javier@emutex.com>,
        Nicola Lunghi <nicola.lunghi@emutex.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chengwei,

thanks for your patch!

On Wed, Oct 19, 2022 at 4:26 AM chengwei <foxfly.lai.tw@gmail.com> wrote:

> The UP Squared board <http://www.upboard.com> implements certain
> features (pin control) through an on-board FPGA.
>
> Signed-off-by: Javier Arteaga <javier@emutex.com>
> [merge various fixes]
> Signed-off-by: Nicola Lunghi <nicola.lunghi@emutex.com>
> Signed-off-by: chengwei <larry.lai@yunjingtech.com>

I am a bit confused by this driver. Andy pointed out some obvious nits that
need to be fixed but the overall architecture here is also a bit puzzling.

This seems to want to be compatible to Raspberry Pi (RPi), then which one?

The driver seems to translate GPIO calls to "native GPIO" in some cases,
which GPIO controller is that?

Also I don't see why, normally a pin control
driver is an agnostic back-end for a GPIO controller, so the GPIO driver
should be the same (whatever "native") means, and this driver should
not even implement a gpio chip, just let the GPIO driver do its job
and call back into the pin control back-end whenever it needs it.

Also we already have a driver that collects existing GPIOs to a new
GPIO chip, the GPIO aggregator:
drivers/gpio/gpio-aggregator.c

Maybe if you can explain a bit about how this hardware works and why
you have to do indirect calls to another GPIO controller, things will
be easier to understand?

Yours,
Linus Walleij
