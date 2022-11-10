Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2B96245E5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 16:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbiKJPbm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 10:31:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiKJPbY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 10:31:24 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C096743853
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 07:29:24 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id 128so2492656vse.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hNTcc4uUyrsAoinmTB9zBCvvHRIc7Wk7WZeBLPZzrbQ=;
        b=Hhv03m03FnrTEZtz1TMhaTpPL00vBQeMpx+rHK9v/0Sjyd2zUPpP/Zyzg5Ai+ztCcc
         hfGDEdPH0XTwnYE39JDJ/wiNOiELaHB1cUrPPKYaiurtAG89ekvLr/P/Ir5d4LVLqDlk
         tRH66draLRJSxApF8Z2vPvtoH4qAkKdTj+ZFO5y1/I2E/UvTvzxUf0qZDlEQnhlW+Loi
         0Uyg8AQ51AlAvi6AlLlEpIWjE2/YJR4RtarVoy7FxxgvGJEBwfvmwkX8qdi6U+P5Fnw4
         VmVzxQzBo2ZTzRFC5WN2+uJi3AhNy6xFicuIh9ehyHqCT/v42i0U47le6Ox8/qcg9DiN
         ExfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNTcc4uUyrsAoinmTB9zBCvvHRIc7Wk7WZeBLPZzrbQ=;
        b=W4iEqUhBxIEJBssac3MD3weATdaQ4LHr6iLsSen3+sd0ZkauzO2qBWEromMIp2Zcwq
         +YbUi4+5KlIrb1Tc/VhDmv/C1f3Uvp24AaCSjSL3ykIHNmAtNuTmeKjlNiu8icm17EMV
         Sz775Z1uxClvzvLBs6YiKt43YKMcjGmVRznuUyygaUpj0RPmNSz1xCIR9LojnDNIzCAi
         b/7H7KAoLgG/9EgQ+cOeDFzmjqjhmwbx60RXpNG3lO954hAovbHtmJq4kXXABrZKZ8Eq
         4VO0ZndTvsCAVQ/YdYMAVWEghX5BXqyq9V4/tA2gkC/n5t6BHo3sJL7rJIF4xjyaFMj4
         3Z8g==
X-Gm-Message-State: ACrzQf3N4jWHI3KRgJGtKX8NXOVN67DWcduf0fFGQgzLGas+ICR1maXz
        FmtBe2BedlmemsXzPaJHaLFSVxy/gZe57LnzXfCkLQ==
X-Google-Smtp-Source: AMsMyM7hga4DZVrVdmNCedH4QHI0A1R/v4wKZuAtiP0aJ1cBE0kYZy6+soKo+MjNaCy7VAvRv1W5lNb+0121sUm5q04=
X-Received: by 2002:a67:ab0a:0:b0:3a9:9953:6471 with SMTP id
 u10-20020a67ab0a000000b003a999536471mr33712395vse.47.1668094163904; Thu, 10
 Nov 2022 07:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20221108133853.61884-1-andriy.shevchenko@linux.intel.com>
 <Y2z7IJv2IQy+Mlsh@orome> <Y20CZtHkaLmQj+IP@smile.fi.intel.com>
In-Reply-To: <Y20CZtHkaLmQj+IP@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Nov 2022 16:29:12 +0100
Message-ID: <CAMRc=MeL=K3BEW+-G-Z49Sw1Z5CCSnbQxbS9qDyizWa7nQjDiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: of: Prepare of_gpiochip_add() /
 of_gpiochip_remove() for fwnode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 2:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 10, 2022 at 02:22:40PM +0100, Thierry Reding wrote:
> > On Tue, Nov 08, 2022 at 03:38:52PM +0200, Andy Shevchenko wrote:
>
> ...
>
> > > +   np = to_of_node(chip->fwnode);
> >
> > This breaks a number of GPIO controllers on Tegra where chip->fwnode
> > ends up never getting set. I also see this break drivers like the MFD-
> > based gpio-max77620, so I don't think this is anything specific to the
> > Tegra drivers.
> >
> > Looking at how fwnode handling works, it seems like we're checking the
> > wrong value here, since chip->fwnode is only for explicit overrides of
> > the fwnode value.
> >
> > The below patch fixes the regression for me:
>
> Thank you! Can you submit it as a formal fix? (Also see below)
> Of if Bart prefers I can respin fixed verison. Bart?
>

Let's have a fix on top of your changes. Thierry: can you send the
patch to the list?

Bart
