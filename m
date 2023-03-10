Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33C26B4BD8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 17:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjCJQB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 11:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjCJQBK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 11:01:10 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48E55551C
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:56:31 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id f31so5086664vsv.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678463790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEdtgDId0i4CJR5fkJJQTljgdCyC4fxKU6W0yzEGOmc=;
        b=FFEvrtmOdlrI4fHkGoOdATlY1RhfJ0ojjpOWezHzrRPSLkhWRJvIIdeAgx8nxY0Wl1
         h0AhaM5Da0+XG4x9vM843+zAyGO4asimHlf1apC1wlB6TrcZn4M/O5KCN/nCnMQqk1+H
         aFjV7WVvS1fbfLdJKXt8WAHCsTMXEXlXlz4kQI1MNHGcPGCOn8oH+ru5YCpjPPTUu/an
         vucx3ELB2JiKXJVsGRAdcCW2rOUVZJpOXi88BIeC0wj2NRkJjESy+kcBPdKL/UZhGmT8
         0R6tURASzhAPo8e/DVfG3ZbN/qywZgY/J3xWUZ+YqhNxnXAWs6iEHJYcNvM/dPHqR2bY
         NHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678463790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEdtgDId0i4CJR5fkJJQTljgdCyC4fxKU6W0yzEGOmc=;
        b=x3l60vtf3yhO7ygvgj4gi3NDbFo43t3Ph5J8tTYzu75TOm0T3ZMqCRUiBnr6Vgum8x
         Tzth2vWoN4+o7K2N6kxdLYQW5ro3vXulTylB5HdA7YVJn7r29BEqebMUyRaDlCLJgVE+
         W3+4eBN6YnEQcaA/DJIGC9+wMBASwAFg7XbjAraf3mYZ4Uw9HlaonGm9Dxq/JoGXlbXt
         H3aocV4TEh6v5Q+MKCWPtLtQVLMzEYMHC99qWqEUYYyY+vcVD9TxXW9rbjFnz9+P+WdD
         6gs2VW+wRNronOriYkVggIsVChgLJg5Y+3ZXK+1IlR9tXA4wEf9XQ1nHFW5NUY/yzzq8
         N6hQ==
X-Gm-Message-State: AO0yUKU8eVq1kgk10VTT2Vf3mRpJOFEON4xDiAieBdENvJ8NY9LSu64Y
        KPGy5SBFGR5SFuWT/X1B1Yi3VKzGbGbrlfm/1DjS2g==
X-Google-Smtp-Source: AK7set8sPHaYtaOYwAcjJ7JVPjfvpohfy2auT9ojd8TVLbBnoVQeDXfPOdHTjvZyiYsvydwUE6kvYq2rBrSF8yirvyI=
X-Received: by 2002:a67:ce05:0:b0:420:10e:14e8 with SMTP id
 s5-20020a67ce05000000b00420010e14e8mr1711983vsl.1.1678463790658; Fri, 10 Mar
 2023 07:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20230309184636.84124-1-andriy.shevchenko@linux.intel.com> <20230309184636.84124-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230309184636.84124-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Mar 2023 16:56:19 +0100
Message-ID: <CAMRc=Md4--uB-+aFad+kFo+NgAmV3HKSo8EBiW0Ae-_CGyFWAA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: sim: Print boolean as unsigned integer
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 7:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Print boolean as unsigned integer instead of using %c and manually
> converting to a character.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index a1c8702f362c..5ac1de5db751 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -684,7 +684,7 @@ gpio_sim_device_config_live_show(struct config_item *=
item, char *page)
>         live =3D gpio_sim_device_is_live_unlocked(dev);
>         mutex_unlock(&dev->lock);
>
> -       return sprintf(page, "%c\n", live ? '1' : '0');
> +       return sprintf(page, "%u\n", live);
>  }
>
>  static char **gpio_sim_make_line_names(struct gpio_sim_bank *bank,
> --
> 2.39.1
>

Sorry but NACK. At first glance the current version is more readable.
With the one you're proposing, I need to look at the type of "live" to
understand what it will print.

Bart
