Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B1A581853
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 19:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiGZRY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 13:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiGZRY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 13:24:57 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119682AE18
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 10:24:56 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w5so6099721edd.13
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9wLkkP0H1T7pUjef2aDJ4iwmzftBmZ95YUzOPYSojs=;
        b=qul+P4yYOZ1dYKXOFWDouatLpBjQLQ+Z5JUMnbOunl8XFZV8cHT6mLNsPz3Ulcb06W
         HyIWGbQxcucWah68oGpESfjunuSgG8K/zYCeKGWZUKCO6xwoy1HRLmxttTiqctoUzdMI
         eUxfn7EhoD5SaRhMUI4ZoZz1g8fDkC0g51/xoaQBYCNh7y/KgalwrcKRyncfOeAEBdCK
         tTK3p+OGmh1xmsFL+NAnU2sIWOAiAHnsN0GCfhjhL8J5I3cOU8PHu6iLpKURW7l6gcqQ
         Dq3ObhQdxQF8XjevW2Lk6Zcmdz7UYn9LoikF1x+l7J7kLtCxLx00XOWlHyMAr341SZN6
         zygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9wLkkP0H1T7pUjef2aDJ4iwmzftBmZ95YUzOPYSojs=;
        b=jT4YSxmRBGptgGo+QZub1HALFKzuIKIUXi+2sB1iutdUJFDHm4f6cvqJ3RY6bEtouT
         RJOEtGyGpvCqVsGAkfLokJue3SUknvA46yN7rJX+yYrhyUsp6q1nkdkXeS0o6+9yrmZi
         v3QwL3Jz8Fh+xJ4etIPOWuo+k76qGNZrOVtxjXBouiqgB5A1SkOXfj4WrBfRyA8hHThf
         isZnsb8ONnzvXamfqF+kgfB5zHfVBaPG3P6H1iKlP9TmJKJK1JUdPYEZvuLH1Hrw9FkG
         1F3D4ndArZBeiNBnjknpEcByeJJXAR/m581TkghBY4I52drApY83lJDggDIuWNV+vE5I
         4N4Q==
X-Gm-Message-State: AJIora9lf32VD0lXw7lrYHzomaZwuAsdmc7WEd53pG85ffdruGHFPK65
        3nk7hyLI7gFaEhqPFYv3bLQRUj6KYzQgSNneIPRP4Q==
X-Google-Smtp-Source: AGRyM1sxReR0edERq8yp0r7aUItbbNKTexB1qfsMbogFCLhcUsPqSTgn7ZBJdRARgSWqZtWVMg/tVfqTmuJCKKeCG2A=
X-Received: by 2002:a05:6402:1d4c:b0:43b:c85f:5c95 with SMTP id
 dz12-20020a0564021d4c00b0043bc85f5c95mr19562652edb.213.1658856294578; Tue, 26
 Jul 2022 10:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220721090021.17005-1-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <20220721090021.17005-1-shubhrajyoti.datta@xilinx.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 26 Jul 2022 19:24:44 +0200
Message-ID: <CAMRc=MfJx+KsD2nv88E-wZtNSWFYNRTY6XL449c0SO7pXKRQ+Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: xilinx: add missing blank line after declarations
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git-dev@xilinx.com, shubhrajyoti.datta@amd.com,
        Michal Simek <michal.simek@xilinx.com>,
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

On Thu, Jul 21, 2022 at 11:00 AM Shubhrajyoti Datta
<shubhrajyoti.datta@xilinx.com> wrote:
>
> Add a missing blank line. No functional changes.
>
> WARNING: Missing a blank line after declarations
> 128: FILE: drivers/gpio/gpio-xilinx.c:120:
> +       void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
> +       xgpio_set_value32(a, bit, xgpio_readreg(addr));
>
> WARNING: Missing a blank line after declarations
> 136: FILE: drivers/gpio/gpio-xilinx.c:126:
> +       void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
> +       xgpio_writereg(addr, xgpio_get_value32(a, bit));
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied, thanks!

Bart
