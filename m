Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5DE328659
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 18:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235965AbhCARIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 12:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237257AbhCARIB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 12:08:01 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0122C061788;
        Mon,  1 Mar 2021 09:07:19 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id l18so12305760pji.3;
        Mon, 01 Mar 2021 09:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=meNzHvtojOauHTFuv2tlbQj0jLwkt/JOAjAHzaQmqk8=;
        b=szav/lCXU50Ov+1kbs32stTAAELOjuwRA/XKCcqZhrRIN8XE48XQ8Z7GfTI7Jb6AR1
         juYoMz6Uv0S8JGEZOapL6c6K0Jx43h2dx7K+C9aQf/hOoTHSgHVsyYSYi3f3nxS1jUEo
         oqt46EP4l2r4ih7GdZGuAFQdmX05W2Pe4pY99QrGUsWtAmrYCxbsaLHIBE65+87piyQ7
         sLEC2nsc1B7puKD+KnmcQAz62wbN5r99AbRZvGalNfczRhTmGaM2x/VPMuyOJ+Dd6psG
         zK9oSJXHjY8U+xxZyp+J001VpwwNSH4kA8LcLMuaaX1thrSuz143bJW8o7m1H7FlgYk3
         7JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=meNzHvtojOauHTFuv2tlbQj0jLwkt/JOAjAHzaQmqk8=;
        b=UetyWwX+sTg9vi7rVpqW3hlPWOHBzLoL2IcGMd0lsJgNz1QfLEOecT4fnSApqt3U7d
         2/m/dDEK7yAo3znMpPwo+elAuEWrpgDXxEHR+4hdBcnLcjkNGyza6SeDJnPu+xwLIsNH
         LcvZHUZaoUW4ZWLX877uNMq+vmpQTJZECXm1keE96Qy3iE6XznQSFIUcux05fdTtXMZP
         /GeDMUZrhAtT5xaPGl5siiNxSIggxcxm46I5daVtgkxok0OxmCiLnGoLQ9fUMbX0uXMR
         /jE7jGdTFUt0vlR5pUueBin2XxTSKvQbjhsk3vyoDbgaScBo9+ewKeS8/yVZZGuGgI/7
         b4GA==
X-Gm-Message-State: AOAM530GBgw2lHwYzEcPwgNXbBHbX+CR2nNJDC1ktDwin2l2POgfDdJD
        rqmqmpKlzpZUCGvjnpuTT/TIg/iFqTk86aorg96Xo6ckRWhKBw==
X-Google-Smtp-Source: ABdhPJyTz5m/LfpTlTfgkKE9j3dztp2H8TrqvolgESP/XfKPuZoB0I9Py2CtdVxQleB39ET2oI6Q0DoGfm3tjc3NkU0=
X-Received: by 2002:a17:902:a710:b029:e3:b18:7e5b with SMTP id
 w16-20020a170902a710b02900e30b187e5bmr16204877plq.17.1614618439007; Mon, 01
 Mar 2021 09:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20210228025249.19684-1-shawn.guo@linaro.org>
In-Reply-To: <20210228025249.19684-1-shawn.guo@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Mar 2021 19:07:03 +0200
Message-ID: <CAHp75Vdi1WuZxhBKqGS7xnVzZpBrKwNbXbp5k0Y5ibZ4aAyBrg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: support gpio_chip .set_config call
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 28, 2021 at 4:55 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> configs from ACPI table, and call into gpio_chip's .set_config hook for
> setting them up.  It enables such support on qcom platform by using
> generic config function, which in turn calls into .pin_config_set of
> pinconf for setting up hardware.  For qcom platform, it's possible to
> reuse pin group config functions for pin config hooks, because every pin
> is maintained as a single group.
>
> This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> pin is not set up by kernel driver.

by the kernel

...

>         .pin_config_group_get   = msm_config_group_get,
>         .pin_config_group_set   = msm_config_group_set,
> +       .pin_config_get         = msm_config_group_get,
> +       .pin_config_set         = msm_config_group_set,

This can't be right. They have different semantics.

-- 
With Best Regards,
Andy Shevchenko
