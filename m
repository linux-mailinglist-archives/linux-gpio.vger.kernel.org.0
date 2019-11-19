Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76525102772
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 15:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfKSO42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 09:56:28 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45134 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbfKSO42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 09:56:28 -0500
Received: by mail-lj1-f196.google.com with SMTP id n21so23622766ljg.12
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 06:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=In1zGBDOC9xdynfqKqKcIIm3nf1+kiAaNiGZnanvLvY=;
        b=QThEqdE2rR48X8oh0OxwIbdEI4egtNMX2nLjCHAmFesH7XsOljlFWzkSlgEJCooM1o
         9oofv6OFX2+StOidzMwZkInUb1q7S3iYe1jGQBVRMnZfOgswcDhgDIWyKOAf1FCD6Rba
         XexJQjvzoZgk++lHzrQt26VgsTLJOx+TUHxlLHOeTK0MJEgCIpwHfRwVqJPlUzHxt9Zb
         /zQmjaHME4cmgDYw5AkgqfCHdJuboeYIpGoueKqYWs0vXtUAB+SkCD6YY4Fo0JRrpLh6
         H7lOZvbGvmSmFckDGq++HhacqpYwrhABTGhOFbyLnnmHLSRxvnwysAiHcwDZn8jbvU6f
         luHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=In1zGBDOC9xdynfqKqKcIIm3nf1+kiAaNiGZnanvLvY=;
        b=AeZDsm8mjsVSBJvqJk6GcnEaJVbo2t6XtYWUkOFHzy0+8eJLIiWnSwh7AgZvhrQJuE
         /ic62rWDtNTJd03ZYVnGyX7VQQbUH6Sn5QKK1bz4TcLxL9bWuoC80Ro3zC7JYDvOagGi
         TuE2yRj58KHluKEZRBYlsHswmmrkDZvIXQrMCDKRJefddUsP7eDIv1BsiBXoBUzy39/M
         vmLQhUk06gbaG1smwyFPEGytjlxoTe3DBHUYf9igpMLaVO83uQR8S1A8UtiACcOyKVhH
         X/k85p9uyqURYH0U576zU8zwRx05LVZvhviPVMgBCpXIjTlrKG1lQpbW0WHsxBtyICiU
         aYFg==
X-Gm-Message-State: APjAAAWD+/0Gt/DEch3/BkrStFTzU0G+KGovUhfmDPEp9jxzdwAz3NwA
        QFqPazmGfVSwZJDB9FXU75eagFSViJIRRaM8IafqBg==
X-Google-Smtp-Source: APXvYqwcjOU4MhPKyzAkwDWLM/doKxPzlCHlBi90UnHt7hoHtMGu2PLAM9oNBxpASzc6YLHCH2EH7pH6HA2mWJ6HL6A=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr4283993lji.251.1574175385648;
 Tue, 19 Nov 2019 06:56:25 -0800 (PST)
MIME-Version: 1.0
References: <1573819429-6937-1-git-send-email-qianggui.song@amlogic.com> <1573819429-6937-3-git-send-email-qianggui.song@amlogic.com>
In-Reply-To: <1573819429-6937-3-git-send-email-qianggui.song@amlogic.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Nov 2019 15:56:14 +0100
Message-ID: <CACRpkdbQ08ivkyVnuy_+=YqHXcXQDUY8aOpp6evdGLofe3FM0g@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] pinctrl: meson: add pinctrl driver support for
 Meson-A1 SoC
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15, 2019 at 1:03 PM Qianggui Song <qianggui.song@amlogic.com> wrote:

> Meson A1 SoC share the same register layout of pinmux with previous
> Meson-G12A, however there is difference for gpio and pin config register
> in A1. The main difference is that registers before A1 are grouped by
> function while those of A1 are by bank. The new register layout is as
> below:
>
> /* first bank */              /* addr */
> - P_PADCTRL_GPIOP_I         base + 0x00 << 2
> - P_PADCTRL_GPIOP_O         base + 0x01 << 2
> - P_PADCTRL_GPIOP_OEN       base + 0x02 << 2
> - P_PADCTRL_GPIOP_PULL_EN   base + 0x03 << 2
> - P_PADCTRL_GPIOP_PULL_UP   base + 0x04 << 2
> - P_PADCTRL_GPIOP_DS        base + 0x05 << 2
>
> /* second bank */
> - P_PADCTRL_GPIOB_I         base + 0x10 << 2
> - P_PADCTRL_GPIOB_O         base + 0x11 << 2
> - P_PADCTRL_GPIOB_OEN       base + 0x12 << 2
> - P_PADCTRL_GPIOB_PULL_EN   base + 0x13 << 2
> - P_PADCTRL_GPIOB_PULL_UP   base + 0x14 << 2
> - P_PADCTRL_GPIOB_DS        base + 0x15 << 2
>
> Each bank contains at least 6 registers to be configured, if one bank
> has more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included.
> Between two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that
> is to say, for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24
> ,0x25 according to above register layout. For previous chips, registers
> are grouped according to their functions while registers of A1 are
> according to bank.Also note that there is no AO bank any more in A1.
>
> Current Meson pinctrl driver can cover such change by using base address
> of GPIO as that of drive-strength. While simply giving reg_ds = reg_pullen
> make wrong value to reg_ds for Socs that do not support drive-strength
> like AXG.To make things simple, add an extra dt parser function for
> a1 and remain the old dt parser function for only reg parsing.
>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>

Patch applied with Neil's Review tag.

Yours,
Linus Walleij
