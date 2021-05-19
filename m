Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E46388CD9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 13:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238606AbhESLdN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 07:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhESLdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 07:33:13 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E86CC06175F;
        Wed, 19 May 2021 04:31:54 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id x18so5385393pfi.9;
        Wed, 19 May 2021 04:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S3az4aOopeu8PToPYTiB4gPF4tOtIx0O5/U+DExxUeI=;
        b=MlQdVLTfmyS+jmnvPXSCPFU8qxgppbaMswdRbCCGctJrcHyZRJLO9NSf2BCFZIoGgi
         p1UfCSuGe1FlownvAkyKCtoOuKCCLEB+Hn6S9eSjVmjYbmfkIvlGRLqinGPeieUN98kr
         glkO/74KCT00da1aiYsqt/hlz0Vyo6mPEVy747QfRjeg2n/QrsPNLLC4UphxJnrZ6fC+
         0WWxdVKRYtKhR7x/LpFZlkXGzQ8xjb8GgMk0vloPZ3f/bu76clVyUXoazfqus7f5bKj0
         fjI7mEt8w+Ro6H1ApkFr2dp9eHFpJ4C4O1QsdOlIyoGdmKv7yKEqR1UJkpqnvT9X9Xk7
         2Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S3az4aOopeu8PToPYTiB4gPF4tOtIx0O5/U+DExxUeI=;
        b=GuDw92QhlZUvSQcWEbrOv+d7WaAgodJnU8oFu6s6uv7bJbpeVmKg6Mv7SI2LiBXHH3
         9rPk3AvaoaZZm+hJ5YRgdSfiYPh5bhwltj5ZQaQ0Gh7IKVFD29yauaagw7rICSrcEl02
         78UE0lwBaLno2nofrLyPuUuRUpCUUe3HtAer47DJYKpmnWC9gkARxLLAb52hy8Ym7EsA
         cl6HzTfLZNE2PmhbHCrJyDWMLaOaVnvQ2t5kZH990Z0b9eD7Bc2CNf2nowDY6n5S83d4
         y3eAlM1hoJoC2sqwn0Vh25GZ5DK1P7sE9mdMoA/f6JtAmSM+LHkEw15thhyPlKUsmuU6
         TJfg==
X-Gm-Message-State: AOAM530soxc38VZ8+LzfjHrqSyODEA3yRZmq2t5vLCg+/HIun95H1DmN
        wXpLcNQiP8x/1Rtw4BXqTTlnh5kPSp78txY4RmO4V4tCfx0=
X-Google-Smtp-Source: ABdhPJy9StB6CLmDduXztdxo3V1PZk9GmaxBlE5HP/AnxW3AU7T3ysCXLYhWRwW9+4Zx+8hH7HpQvITx5FQR/cXIOCY=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr10333646pgg.74.1621423913678;
 Wed, 19 May 2021 04:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200002.6316-1-dariobin@libero.it>
In-Reply-To: <20210517200002.6316-1-dariobin@libero.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 May 2021 14:31:37 +0300
Message-ID: <CAHp75Vc0kmwuT21=bvpfUj+qAO1XmKEXUpxEEhx3TRZrQbR4Gw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] am335x: set pinmux registers from pins debug file
To:     Dario Binacchi <dariobin@libero.it>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 3:58 AM Dario Binacchi <dariobin@libero.it> wrote:
>
>
> The patch was born from the need to change the slew rate of the LCD pins
> of a custom AM335x board during EMC tests. The AM335x, as described in a
> note in section 9.1 of its reference manual [1], is unable to write
> pinmux registers from user space. The series now makes it possible to
> write these registers from the pins debug file.

Even for debugfs it would be nice to have a piece of documentation.
Because pin control is a quite sensitive area and if something goes
wrong, it may damage the hardware.

> [1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf


-- 
With Best Regards,
Andy Shevchenko
