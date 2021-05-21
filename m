Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9866338C465
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhEUKLR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbhEUKLQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 06:11:16 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAEBC061763;
        Fri, 21 May 2021 03:09:54 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id k15so13832736pgb.10;
        Fri, 21 May 2021 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jNwcIRABGdgdsxKm1R5ZPD3oSMNkH2CN9R0AsY8oxF8=;
        b=WWpkvx4x55xlhEBYmTeubhnOdtlBx0ZrNaHPgxxLHChAthXJ4a0/N2euUN3v6oLWD8
         UsD9hXGluY9RrM2lWVpcBRmV+G2F2PfRNfyeHzECmeaKQRykCXCRfSfoPcw19zRG0cTj
         p1mAccCW5WL9IQjhOMMKZ0ed0d4+wpMBUD6vNmqPvmjgUX8V7Vk2TY1zxCJ0I/4A3AgU
         W1ylmgpZLBOsyliaswrfwggXzDDR85dimbpE01jfQ4Is8avq3A5fl4J1cb+/al8u2sej
         e7TvkF9OCt7r098wM2KH3Bn8CCwNr9YUv62BRPUHWTejxRpio0ZZELAX3x42d6MJuiSD
         HJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jNwcIRABGdgdsxKm1R5ZPD3oSMNkH2CN9R0AsY8oxF8=;
        b=RtQz+laSU9st1YbVXoq4nmjnUS8d6qsxRwOj40A4JtE5Jh8ExcxmUSdktn6baNEOqf
         kkO1H+rmJscqrnPtc/10owAigMy9ltUS6G3n8njOVoIzhqkS1TkidfziyZHQ6Rr7lQaC
         FrElMxOYGA6IYayCpgjfcTkiq68bGT1jQ1vtHjBuFY0WYZTx9BWwHozXxhT8LzVFNjgT
         ZclRIReF/AMVmR+aOayYmHg3TYpxyhiZXBYQK/f+qZ9EBt0opbZ8XscZ5zAij4gPl6kh
         G8X9pKIepb+Cd9vAKcZ5jiGJ32iQgt/r/k9+ZlvnP5ouez/5Mgz5aMfOpO6pInvC8HCK
         sM/g==
X-Gm-Message-State: AOAM5325yq6Cg8N6XSwjsoYY3cDMMLn6t1qSsz8jOOUPPU8MK80JvEhc
        TKn8VRtc3uacpMeLTUG+UwiM6I0eV/O0jzmnNjg=
X-Google-Smtp-Source: ABdhPJxsuBwQmnDhw1vSzlTlg3razoJBjL9X1d4xmPbheOOO3uWTTuSluT0AtAK0QodkXLmhm8IEk7qOps76y6SPKXQ=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr9158129pgc.203.1621591793580;
 Fri, 21 May 2021 03:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com> <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 May 2021 13:09:37 +0300
Message-ID: <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 12:53 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> The set_config and init_valid_mask GPIO operations are usually very IC
> specific. Allow IC drivers to provide these custom operations at
> gpio-regmap registration.

Thanks for this. In general (from design p.o.v.) looks good to me, one
question below, though.

>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>
> ---
> Changelog v2: (based on suggestions by Michael Walle)
>   - drop gpio_regmap_set_drvdata()

But why do we have gpio_regmap_get_drvdata() and why is it different
now to the new member handling?

>   - drop checks and WARN() for pretty much impossible cases

-- 
With Best Regards,
Andy Shevchenko
