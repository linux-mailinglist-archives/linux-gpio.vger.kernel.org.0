Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BCF63BDF5
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 11:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiK2K31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 05:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiK2K30 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 05:29:26 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C12C42F47;
        Tue, 29 Nov 2022 02:29:22 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id h10so9340638qvq.7;
        Tue, 29 Nov 2022 02:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uS4QcDdYFpqF1RnvGS2V/HW1iiWtvSW9Nyw4Gjt7zJE=;
        b=ZDfYsEhgWBtXOvQIj3BnXxv0LHuSvw8ECjuCXVAkyWIxkJQO1fnQCcofoF+HAlpEN7
         +zljE7u62EpVZZrCSSTGxWfcxhTXkKCjz2dbC/AuGmZypuf0MI8YBWlVQRZM2olMwb6r
         4T7lHKadyTxG60eIulm6WP61cdKFKGtDJnKT7hejfnT5t6Y+UgIQDns7wRlp35Uik4Ih
         zaMCVJxo4JAVqk73XjcErEGHwEJ1qj+/raC4OyshoHMh9y0UlEz7t/8+QvLamjbX02MM
         8FWwR8R8ysLbaKdIXQTwQdpQYagVonoajCi0pFNnetesdE97e8/zvZCNsyzxNIuxGK4v
         a3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uS4QcDdYFpqF1RnvGS2V/HW1iiWtvSW9Nyw4Gjt7zJE=;
        b=DpUuHuaffuhyq1DXQrVp1vQ88XNq9sB2ZC7D9zoUkPWAZvHg/da+1X9DUIkzyYaxIn
         i6nUgQhIaZffXOxz1uc699jyVjhkSKWOXoH0C8kQ8/GWgcof2f0pN0392gVCHUq5VrWV
         ors5KobMmm3Xl1OJBN5VLyJh7vS1WdplYm2UG1VjLfWwBkQA79tTi1E0iPb/zu+1Y5V0
         3+bz71kYzRbrBzvsIby5FYtVQzEVi9KQ6jPBHX4pEQlvXExgBqgOTLjLj5M6Furq1PsW
         7EbZNPg/aPo53Y0H+3D5Vri9EFh+nHEU5ertCZEyUc20RELua/MZSsYL19L6PLEcZH3/
         drdA==
X-Gm-Message-State: ANoB5plQDLrLAP7ryo5K3wXPsgqWDbrI38FI+/2e568A49svnh1iTNPo
        xT2ny6UFRsO1ylHJDIkaA/5CD0/K9AIrD/iEPYA=
X-Google-Smtp-Source: AA0mqf5DVVZ2ZybqkMfPGBmK4WwacxcdJH8fVH7Z+I0hinmXGeC4tTu9UqB/OiCG2ULkUdcSL3mQAmlB/QtZJbqkRRg=
X-Received: by 2002:ad4:5366:0:b0:4c6:73ac:5a5 with SMTP id
 e6-20020ad45366000000b004c673ac05a5mr51876667qvv.48.1669717761280; Tue, 29
 Nov 2022 02:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20221128214408.165726-1-hdegoede@redhat.com> <20221128214408.165726-4-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Nov 2022 12:28:45 +0200
Message-ID: <CAHp75VcJJtYsxbAYt2FjqSEJGhjpok7Dsh3vp46VyOm3=5_2FQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: tps68470: Add support for the indicator LED outputs
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The tps68470 has support for 2 indicator LED outputs called
> ileda and iledb, at support for these as GPIO pins 10 + 11.

add ?

...

> +static void tps68470_gpio_get_reg_and_mask(bool get, unsigned int offset,
> +                                          unsigned int *reg, int *mask)

Hmm... Usual way is to put the get/set flag at the end of the list of
parameters.
Also why not naming it as 'dir' to avoid confusion with the _get in
the function name?

> +{
> +       if (offset < TPS68470_N_REGULAR_GPIO) {
> +               if (get)
> +                       *reg = TPS68470_REG_GPDI;
> +               else
> +                       *reg = TPS68470_REG_GPDO;
> +               *mask = BIT(offset);
> +       } else if (offset < (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT)) {
> +               *reg = TPS68470_REG_SGPO;
> +               *mask = BIT(offset - TPS68470_N_REGULAR_GPIO);
> +       } else {
> +               *reg = TPS68470_REG_ILEDCTL;
> +               if (offset == (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT))
> +                       *mask = TPS68470_ILEDCTL_ENA;
> +               else
> +                       *mask = TPS68470_ILEDCTL_ENB;
> +       }
> +}

-- 
With Best Regards,
Andy Shevchenko
