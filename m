Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D177CC03A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 12:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbjJQKKH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 06:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbjJQKKH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 06:10:07 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467A4E8
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:10:04 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7b625d782b9so1968948241.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697537403; x=1698142203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izD7fhXrwRmWxCwaLyOk6gVHRPBANDfAUgIB4uCbMTc=;
        b=plzPKXR37TiRI1VF0jZ9XhuxHdxQaoSQ72ylKvz4YcuFj/4ATQK2v4jOBRmiuHdSfS
         2hYVZOuzhNLHVsg4y65+1mU9ok3OfvsWvNo4rJN2BB5mLDAw2Hu9ajtLMaIL4Dof9L6b
         gtde9gxEcrVUGZR7nUlH7VJcFvd7pnCA8ub6vFM4jDRq9zvzSzS+2D23V3LdL3N1flFL
         1AztS5q6Wqpoi6HuohTN4sAeMkZ/nDfBVsl5XK8RLvw87AoQ32iBYBNaJAGJBzFmpO29
         MDsrsPzQivqUezdwQZNHTNDsblNBnxeW+sA1Rpl6w53Xfb/49oGOTZp4+pFV9+Q/bChN
         vbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537403; x=1698142203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izD7fhXrwRmWxCwaLyOk6gVHRPBANDfAUgIB4uCbMTc=;
        b=MMyR3exit/7LW4QW+tbU/HuV30cs4Hj0lEEQsfhdezt+OBW+WZZnWlrmlfS6rD2g4n
         8enL0MWcnw4ol197LO75a37L5CmD9T0B17I0BV1Ab8iePk4pz53UJEtXn96NxBtAIyX1
         0Ffu7POmwgeASHbBwI3ur8aQJsdQ+E/3whvl/fcytZOlT1gWEuSu0snmshPDU+5IWrCC
         hdpeITXiuIIUWUl9ncEuDC8lvi/Di9sHEq6+vc4sNQqbHabFgbb5+t58W3an+RsXb3B5
         jZMSiBoeOqxLK2HX8McKP2GAFvZHEJGJa6uFSF7GLjG0Cee+3adJlJEUSe+9JxOFjzHq
         /chw==
X-Gm-Message-State: AOJu0YzDpiQ8is7bmXZS3Iy77s8gHhl8dRcPBBHz4EwnRSN78PoDzvXD
        7JztKqSSUXmsgqyxdrxVu0fz15YO9itZWBqui5MqHw==
X-Google-Smtp-Source: AGHT+IFR7YU9uDRM1TL/Op7qA6mVLe2PG79e6cE+jhrThaTXlkuAjVDhR2Y/3nvppHl51IPH/8b9FOY3ifc+6KrbHek=
X-Received: by 2002:a67:ae07:0:b0:452:7617:a757 with SMTP id
 x7-20020a67ae07000000b004527617a757mr2018201vse.26.1697537403395; Tue, 17 Oct
 2023 03:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231017033039.1245959-1-haibo.chen@nxp.com>
In-Reply-To: <20231017033039.1245959-1-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 12:09:52 +0200
Message-ID: <CAMRc=MdYeOnawvT8H2dcRNnik+kfjCLovJn8rm9y4T7fpAqFLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: vf610: mask the gpio irq in system suspend and
 support wakeup
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2023 at 5:25=E2=80=AFAM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Add flag IRQCHIP_MASK_ON_SUSPEND to make sure gpio irq is masked on
> suspend, if lack this flag, current irq arctitecture will not mask
> the irq, and these unmasked gpio irq will wrongly wakeup the system
> even they are not config as wakeup source.
>
> Also add flag IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND to make sure the gpio
> irq which is configed as wakeup source can work as expect.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-vf610.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index a89ae84a1fa0..77d5b8dd2bd5 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -260,7 +260,8 @@ static const struct irq_chip vf610_irqchip =3D {
>         .irq_unmask =3D vf610_gpio_irq_unmask,
>         .irq_set_type =3D vf610_gpio_irq_set_type,
>         .irq_set_wake =3D vf610_gpio_irq_set_wake,
> -       .flags =3D IRQCHIP_IMMUTABLE,
> +       .flags =3D IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND
> +                       | IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
>         GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
> --
> 2.34.1
>

Both patches look like fixes, can you add the Fixes: tags?

Bart
