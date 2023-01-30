Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF84681499
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 16:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238080AbjA3PRF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 10:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238102AbjA3PQ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 10:16:59 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C929F
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 07:16:33 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id k4so12823838vsc.4
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ3wXMWTB1DAe1UmD3fHzuEDZsYbAYZgXhOVudfMKG4=;
        b=fAGuoEY+XmBxToZGfLnGVkLja9lCguKMf17XbuM0N8q1ZA+5DWS+eJ89Oq4mH7rgzt
         qnM8sN0Ys/BH7fzYjK8KabIaJ8j91wcMGXDDdJ3awXcbwyOPOQr562mrdRR7Ch4UKd3e
         JZr2/b+at0nUc3DRqvj8MlqrgcBrXi0hPrUsDgJvsARNAHRBBaykbmvrADdNeggxHqhp
         jbVdXjeIfyhqrLOIWPtcvOBmdE3MvsNsBn15db9l0S6dPVfTh49aiSlaidCprZHaF5fs
         G07tf3dxgn9cTlbUBx64/xeOpBxK5BFS18sI+CL9OGZOllMdkncZFpeeM2az5nKtBjeu
         zZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ3wXMWTB1DAe1UmD3fHzuEDZsYbAYZgXhOVudfMKG4=;
        b=Z1USDpnjfKQRjyNOeDDBDN6ZD3djFmCtjdURNQv4bhUsIiii4MggAC9cIcBqz2ksCi
         O83+T24Y0ngqpUO1K6/luh2uZzRjWpEXMuxpA6ov4+CYTU2QqiNi19h2EgGEKKiLLqdG
         2ogCYHtsEBjHRZ9zkjAFDBVwQnYmwN9DuKk//FhfTtGmTYIB4gAuC6e0+vx38HTtI+zS
         b/ogCuxZJJHzQk7OxkCPdw8mWPr5Q+mJDoH3rqQQTRDvFspp1o1g00kCjsPuKvdr4IY7
         mmfFLxNpAS+xQDFfR9xRyNhjPXOlz/qAi9ETZrSJlLkVElVFXpeq9f96gXc4S5wkW5Ks
         fQEA==
X-Gm-Message-State: AO0yUKX5l/XNMZX+CYFyHobabyWnxV69c0RDk/FsAyFCsQO4UyLtQO2E
        JJVL+kXaUJPGJ/NKZm50i86bVJRd+oWBvgULtVnwhA==
X-Google-Smtp-Source: AK7set8A/7FkizIIhP3ATYrzEOTjexAgMmFexUZEvxV3qjsqH5KvogsKWawkqFf0rckPcb5j+YPfxVAor9Hl8vuVR4c=
X-Received: by 2002:a05:6102:10c1:b0:3f2:58c2:5358 with SMTP id
 t1-20020a05610210c100b003f258c25358mr1159843vsr.62.1675091792022; Mon, 30 Jan
 2023 07:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20230117100845.16708-1-nikita.shubin@maquefel.me>
 <20230125083026.5399-1-nikita.shubin@maquefel.me> <20230125083026.5399-4-nikita.shubin@maquefel.me>
In-Reply-To: <20230125083026.5399-4-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 30 Jan 2023 16:16:20 +0100
Message-ID: <CAMRc=MciMOfCo_fS_Um0xaQT2H=QSRgEUA5iTwxmpXqo2k2NJg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: ep93xx: split device in multiple
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Lukasz Majewski <lukma@denx.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 9:30 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> This prepares ep93xx SOC gpio to convert into device tree driver:
> - dropped banks and legacy defines
> - split AB IRQ and make it shared
>
> We are relying on IRQ number information A, B ports have single shared
> IRQ, while F port have dedicated IRQ for each line.
>
> Also we had to split single ep93xx platform_device into multiple, one
> for each port, without this we can't do a full working transition from
> legacy platform code into device tree capable. All GPIO_LOOKUP were
> change to match new chip namings.
>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v0->v1:
> Arnd Bergmann:
> - dropped match table completely only this patch
> ---

This no longer applied to my gpio/for-next branch, can you rebase and resend it?

Bart
