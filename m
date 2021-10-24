Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4179438C2C
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 23:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhJXVwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 17:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbhJXVwS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 17:52:18 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC675C061745
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:49:56 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bp15so7378824lfb.4
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zqFQsFklz0z9fcfedYbprvhik13AFhIEkeGZ0J9HMVs=;
        b=vtdzNJXe7QO5brg0f8xsAF2K449Mc5q9vcJq0Qcq8K5HWgXm4fq6s2MKROR+wgugHh
         /7nPILVTts16rDHuo9n7Ix+IjkFiSOXKB1sHPByCN6zeoVpIAH8X8bakNSHYS8jS3DFJ
         qFYsBbZgfQ4Hl2cgMyBdeTsfNXF+Lgemm1NCR0+oLdvmTrr1+Y0DW5+nxCQZNxcHBjKd
         dNokp3lRaRxMNp0zsDdWXdyLEbdU6V82Sb2apqaRcu13h3cWCdlhEA0HjsU9/WSdGZ0p
         TIQ+zHPhHbesIkOXlzu7OuydUKuJ+6PM5Xx/tWhULpvKDZCWGlWYSCwJDMdzBlwny86K
         mMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zqFQsFklz0z9fcfedYbprvhik13AFhIEkeGZ0J9HMVs=;
        b=Z9ERRatgiy2JOlxp8pblQCL8dFv8T1q+GmcKpM98ZB0nXWBL7BGc9rpCTI77je2yr1
         YyT7Ir1+Ca+1/lNtqaChPNswSLlgURaUCkCaIIdd7g+JIX8SDQYZrEi/D8DR9f71tvbA
         FlaP0iGDHBOgsyEL0ZNnGoh2Mz//I3a5Ai5eIbp28e33Tn9thu4xNgIvBCwziopyfM8X
         n1VEMd/PSXjGGopyMaDRsJg2MmVp2N54JEHNi0EzI1yjJ/cwDXJFAl+J78DSG+YFkRso
         QKgtvKhoVWCudxUW/yHUZhv9xYJBN1brpBvCPaK6fyoqVFe8kDFnQugSfOrIobXFD7e8
         3zRQ==
X-Gm-Message-State: AOAM5322oVVzfdJwzN20GJ9/sS3N/mWoN+zTcpOOcrHA1KigGjIRFnn2
        /Kcx7xLx7RFX4E7ty1B1hxNlAmodoEtiDxgRF0Jnjw==
X-Google-Smtp-Source: ABdhPJygz737sWYq7dytPNvnnlwtCG1vOKQaYk14JY11BQkN5FIGmxvZXnjTvu/d8bwlzjISeavbtKh2rIcQEhfyUR0=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr13208074lfd.584.1635112195140;
 Sun, 24 Oct 2021 14:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211018220504.8301-1-shreeya.patel@collabora.com>
In-Reply-To: <20211018220504.8301-1-shreeya.patel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:49:44 +0200
Message-ID: <CACRpkdZCMH5OBwfiPwMT1CifDV28H4aTxy_N_4dHs0Qg0ENOAw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
To:     Shreeya Patel <shreeya.patel@collabora.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, krisman@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 12:05 AM Shreeya Patel
<shreeya.patel@collabora.com> wrote:

> We are racing the registering of .to_irq when probing the
> i2c driver. This results in random failure of touchscreen
> devices.
>
> Following errors could be seen in dmesg logs when gc->to_irq is NULL
>
> [2.101857] i2c_hid i2c-FTS3528:00: HID over i2c has not been provided an Int IRQ
> [2.101953] i2c_hid: probe of i2c-FTS3528:00 failed with error -22
>
> To avoid this situation, defer probing until to_irq is registered.
>
> This issue has been reported many times in past and people have been
> using workarounds like changing the pinctrl_amd to built-in instead
> of loading it as a module or by adding a softdep for pinctrl_amd into
> the config file.
>
> References :-
> https://bugzilla.kernel.org/show_bug.cgi?id=209413
> https://github.com/Syniurge/i2c-amd-mp2/issues/3
>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>
> ---
> Changes in v2
>   - Add a condition to check for irq chip to avoid bogus error.

This v2 looks acceptable to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
