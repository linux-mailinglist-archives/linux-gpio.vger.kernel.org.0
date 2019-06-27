Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E265815E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 13:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfF0LYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 07:24:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34362 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfF0LYC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 07:24:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id y198so1326388lfa.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F4KskJ1NAl/aeAMSSANWZVmj0vaROvOll7pDHlQvKrE=;
        b=nENRI+O/Sos7OKNBFX4fcuIjQJRwvWzpnQUI823OhuXy+g5L/2I06M0BvsD+EPBkBU
         jnMzz/8KF3lE8zGW4CZDHMmVSPuFkrs5D4b92ModrlnG7TNh9x/cgwb45aONOdqKlEec
         qS39kC+nzP1BDmIUzDeRmazx/dGoP61W2XHfSAtWn3ha5bU5t+BZA1+MNUIR4nBz4tOl
         NAX57XZMuQsMyPqhE+DroIbq+/20QvpPbo+0VMKO0XfCbCXNeQGCCgQ1pIrfPwdKeTta
         XzBI5e2tKYh0r3WdeMUnXmSkKv+DdJ5WiGWdmeTlnDcanzuEXZ+F1JSocegrhnetAmjw
         IkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F4KskJ1NAl/aeAMSSANWZVmj0vaROvOll7pDHlQvKrE=;
        b=gCoPQijSR9bggu8M+sDYeOHatDEFWTIAA+4pzzuNhk8T2gHvKq0G3PHmmeEXu/brIK
         cgkwE4gLq/iO62lhHplOV8ZcG8AajGjRJQeMKPfxmlsLHPg84zETDjmSnu6SH9ORb9Pj
         u3jPxOngGJLumebVLaYlUR8rp4dRzKjzJqJytCDI0bxLO+h/MNu0hlG86ot26pAhjb7Z
         tYI/jM7pLRM6PUekW/hQx+m7TuLHijQTqxwwhKIbJgCKr5a9+/8k7gFZ3u+BiREAdf1C
         SoE/Pb+Yt2EDA/uaw9eTqJQ0Bojzs8GEl73CjcCs90AKZqooM5iRjavHFlbbgHqXuAvI
         fnPQ==
X-Gm-Message-State: APjAAAX2vDWvbGI3qs2YuwlSNohsn70Srads0jemRmf796s77fDN5h8a
        ONzCe0a7PZrg9C4BYqcM3p9g5K5o3dm3FwuH4GwwuQ==
X-Google-Smtp-Source: APXvYqyeGnTnUh82XE5crL0FuoMFaSxBuAjA0pp9mZU9u9i/T+re4EBzmrybXpa77YjcTHZpDZQGFRLaagUdWo7XHdQ=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr1788889lfu.141.1561634640859;
 Thu, 27 Jun 2019 04:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190626035445.236406-1-drinkcat@chromium.org>
In-Reply-To: <20190626035445.236406-1-drinkcat@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 12:23:49 +0100
Message-ID: <CACRpkdaK1A2eS5_5Fg40hTV3bwRNvRmqfWidVMpNkxFkzVEVmw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Update cur_mask in mask/mask ops
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 4:54 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> During suspend/resume, mtk_eint_mask may be called while
> wake_mask is active. For example, this happens if a wake-source
> with an active interrupt handler wakes the system:
> irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> that it can be handled later on in the resume flow.
>
> However, this may happen before mtk_eint_do_resume is called:
> in this case, wake_mask is loaded, and cur_mask is restored
> from an older copy, re-enabling the interrupt, and causing
> an interrupt storm (especially for level interrupts).
>
> Step by step, for a line that has both wake and interrupt enabled:
>  1. cur_mask[irq] = 1; wake_mask[irq] = 1; EINT_EN[irq] = 1 (interrupt
>     enabled at hardware level)
>  2. System suspends, resumes due to that line (at this stage EINT_EN
>     == wake_mask)
>  3. irq_pm_check_wakeup is called, and disables the interrupt =>
>     EINT_EN[irq] = 0, but we still have cur_mask[irq] = 1
>  4. mtk_eint_do_resume is called, and restores EINT_EN = cur_mask, so
>     it reenables EINT_EN[irq] = 1 => interrupt storm as the driver
>     is not yet ready to handle the interrupt.
>
> This patch fixes the issue in step 3, by recording all mask/unmask
> changes in cur_mask. This also avoids the need to read the current
> mask in eint_do_suspend, and we can remove mtk_eint_chip_read_mask
> function.
>
> The interrupt will be re-enabled properly later on, sometimes after
> mtk_eint_do_resume, when the driver is ready to handle it.
>
> Fixes: 58a5e1b64b ("pinctrl: mediatek: Implement wake handler and suspend resume")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Acked-by: Sean Wang <sean.wang@kernel.org>

Patch applied after extending the has for Fixes: to 12 digits.

Yours,
Linus Walleij
