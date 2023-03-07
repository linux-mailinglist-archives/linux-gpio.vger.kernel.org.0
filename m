Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC5CE6AE0E5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 14:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjCGNmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 08:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjCGNl5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:41:57 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405018C960
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:41:28 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id k23so11361629ybk.13
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HxhnY9ee6S+JKaeqgBDgMPD72VYaOjVliRXgd6QNQIg=;
        b=VTkXO6ebhtYLpuBvA8pUoWMYs4C8phlf1DPmOYh74IJJyq/Po0AqZnKQi0ntazJC2h
         iBeHHljzD2QGpETKUsRrjxxdFpLb7vAwRwdPHXyk1hd1DTNuF6t/w33F/6uKs42d3v7a
         AErL7FjVUVCPuDuWuBsvZJ0rNQ2CsBci/kt4fkW21sotWE8yECAeLIuMd+WzcjudpXut
         pfd05Hk+8rFW/dB0pqppm+ci414SFjDKcuIE108dIPECHFCT2xhxdccBMpO4w0v16DZD
         WsS3ra4tYFs9h/uzaI1K/Oe8UTWdZNnNgxggPirf74szSE0RW2oDudbCPQCAhZ2C1aln
         pWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxhnY9ee6S+JKaeqgBDgMPD72VYaOjVliRXgd6QNQIg=;
        b=6f5G4jOHIxeDcafH1/tshG5tCRkWxuuwVdzyagePi0oImjFgtwVW36mtw7sj25n+rV
         Cb8tTePZN8TqoFlggoWuKKdi1qS3L4Mf39dn4/Rc7LHptikh9JYvBU+ooIdnECD2eoNw
         gNFLQjKrIoIAodN6UNWfsJBhtkM7FbxVPHy6Dst+Nm5rXjA9SfiN9A/nfVN9rS/C9zJ3
         d5EK/ceMtfnmCq1AUuiuqkSOuRs/dgCeSDYIjiHKkmyPTpqHco7h86VLWjE2Z3dKfZtk
         MAeRNHKaGZQeWKpg2MJT8UKy1KanHqrNS1m14G365S05f+y/Ls3e+h/f/RfAHdR+6sj+
         B+vw==
X-Gm-Message-State: AO0yUKU0uexobTXlTZEB9Uj4fT8DRLv5Ooi2zIGe4auUxfqUG0twktc6
        lVF8LL6zCUQFY/AUsQboMSPQOYgq80CkIdEWp4IAULlpOYpEY7FP
X-Google-Smtp-Source: AK7set8ou4L2bAlX4IYu1rZyZ5XNdsNqitcUOWXI3Qzn29JRmg2qCgTzY+gdBWjIfLE2q8apEc1HT0folW40J64j4nE=
X-Received: by 2002:a05:6902:4f4:b0:a06:5ef5:3a82 with SMTP id
 w20-20020a05690204f400b00a065ef53a82mr6806214ybs.5.1678196487306; Tue, 07 Mar
 2023 05:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com> <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:41:16 +0100
Message-ID: <CACRpkdb-gyn29ns3tGXXnrGgySNP7R90h0M7fan=zeNMU7-QKg@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 6, 2023 at 10:00 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Add a simple sysfs interface to the generic pinctrl framework
> for configuring pins for output disable operation.
>
> /sys/class/pinctrl/
>   `-- output-disable/
>       |-- configure    (w/o) ask the kernel to configure a pin group
>                              for output disable operation.
>
>   echo "<group-name function-name 0 1>" > configure
>
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
>
>   function 0: usb0, groups = [ usb0 ]
>   function 1: usb1, groups = [ usb1 ]
>   function 2: gpt4-pins, groups = [ gpt4-pins ]
>   function 3: scif0, groups = [ scif0 ]
>   function 4: scif2, groups = [ scif2 ]
>   function 5: spi1, groups = [ spi1 ]
>
> To configure gpt4-pins for output disable activation by user:
>
>   echo "gpt4-pins gpt4-pins 0 1" > configure
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


You have to run things like this by Greg K-H (adde on To)

> +static struct class pinctrl_class = {
> +       .name = "pinctrl",
> +       .owner = THIS_MODULE,
> +       .dev_groups = pinctrl_groups,
> +};

Why are you adding a new device class?

IIRC Greg don't like them, we should probably just deal with the
devices directly on the bus where they are, which also implies
some topology search etc which is a feature.

Yours,
Linus Walleij
