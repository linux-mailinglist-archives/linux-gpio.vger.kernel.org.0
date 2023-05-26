Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDA9712726
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 15:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237174AbjEZNBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 09:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjEZNBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 09:01:14 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E490116
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 06:01:13 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7841f18f9f7so222402241.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685106072; x=1687698072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s01y3S+iaFhb6QhGbpp78rHEfgIg+a6LGYlDvW3YBZs=;
        b=CqYvIK8S4YikC+xy01uu/g+VxtXZBIiIgwDWqByuToj/Yrz78SRY927926g7/Hqhsa
         1YVpPAIVPggHxtEGdoliT69PMCtLRoMvkdkKT1loMfNdJKPi98it8HUnTVJxb09j28dG
         VV38WHFiQiP2FTIZkE8ro4PFlqoIyVXBBUv/3yGVb8MbmeX7D5xVbT5QggCI3yXpTibG
         Qx+KkmZSgjVl4tA2tYx1Aug5ASDnctV5OHGqPTsgG1L0ZvO1XPXxYv+NGyjmt9AcZyJj
         FD8N3wfNKBOUMuJ2Rpl9Q+Z1ly/f0fIUqDlCtzBBtowiuGSlkRwTSyHPIflQJo3ZSy3I
         u2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106072; x=1687698072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s01y3S+iaFhb6QhGbpp78rHEfgIg+a6LGYlDvW3YBZs=;
        b=VVQdBuWAXK6FVlqNxvP+HPzHhxgIh/3DygAwPlXDU/yGHTle2jezKc5qqen1Ba1acH
         N6OKXz1ramwiPcGkq43MRJuz/S6MguofbhGQK089G1CmOlLyCVDSRiRdJzwdF217L+2j
         OVvJdSyIMsEFrFfrs1M78C8mQTwHOq3LxmK+yb7YEg9QVwI+brL216W1IFzJXlJO7uDe
         I1/ONKATxAn1wwk6xPQLGQQQ1j1PV+5pZh1VSk/4jW7vvsXQeIApSa6L2E/bnadcbUWZ
         7LGIYuO7Tp81dzrba0GFg55M7/Fes1ayDw6j3Oh9aHaB12m8bU8gH88q3Ulc42fBmfj9
         hPvw==
X-Gm-Message-State: AC+VfDzymsyQUS5Lyr4dtcsZAOcM0SbZ9W5QUG4p9badO6rRy0aeT24j
        Hm0sxRgHrsy/CDlixAkLa/D9phgNpT+Hu4370AiKJw==
X-Google-Smtp-Source: ACHHUZ5tzp1xagd4K496ehZWQ6H2POEZT0XrNGbk1ykooZDAUUf3+WluxxWKErS1iacSl4UeoSMwg3VEgp66FiMYwwU=
X-Received: by 2002:a67:ec51:0:b0:434:82d1:c84 with SMTP id
 z17-20020a67ec51000000b0043482d10c84mr420032vso.15.1685106072307; Fri, 26 May
 2023 06:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230519050702.3681791-1-chris.packham@alliedtelesis.co.nz> <CAHp75Vcd8Q+-XMyfg3Y_hv_AL00PGgqg0jo7Yd7TTC4GrxPOuQ@mail.gmail.com>
In-Reply-To: <CAHp75Vcd8Q+-XMyfg3Y_hv_AL00PGgqg0jo7Yd7TTC4GrxPOuQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 26 May 2023 15:01:01 +0200
Message-ID: <CAMRc=MdHMiqhcpd2rFwjfKvwMWtTeTxG4fK+7zbzgSq9MHmGew@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Avoid side effects in gpio_is_visible()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, johan@kernel.org, maz@kernel.org,
        warthog618@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 19, 2023 at 12:09=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 19, 2023 at 8:07=E2=80=AFAM Chris Packham
> <chris.packham@alliedtelesis.co.nz> wrote:
> >
> > On a system with pca9555 GPIOs that have been exported via sysfs the
> > following warning could be triggered on kexec().
> >
> >   WARNING: CPU: 0 PID: 265 at drivers/gpio/gpiolib.c:3411 gpiochip_disa=
ble_irq
> >   Call trace:
> >    gpiochip_disable_irq
> >    machine_crash_shutdown
> >    __crash_kexec
> >    panic
> >    sysrq_reset_seq_param_set
> >    __handle_sysrq
> >    write_sysrq_trigger
> >
> > The warning is triggered because there is an irq_desc for the GPIO but
> > it does not have the FLAG_USED_AS_IRQ set. This is because when the GPI=
O
> > is exported via gpiod_export(), gpio_is_visible() is used to determine
> > if the "edge" attribute should be provided but in doing so it ends up
> > calling gpiochip_to_irq() which creates the irq_desc.
> >
> > Remove the call to gpiod_to_irq() from gpio_is_visible(). The actual
> > intended creation of the irq_desc comes via edge_store() when requested
> > by the user.
>
> To me it still sounds like a hack and the real solution should be done
> differently/elsewhere.
>
> Also I'm worrying that not having this file visible or not may affect
> existing user space custom scripts we will never hear about.
>
> P.S. TBH, I don't care much about sysfs, so if this patch finds its
> way upstream, I won't be unhappy.
>

Same. Which is why - if there'll be no more objections, I will apply it.

Bart
