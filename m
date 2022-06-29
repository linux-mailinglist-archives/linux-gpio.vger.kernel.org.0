Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4EC0560B85
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 23:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiF2VTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 17:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiF2VTI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 17:19:08 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D0E12755;
        Wed, 29 Jun 2022 14:19:07 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id g4so18695117ybg.9;
        Wed, 29 Jun 2022 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PI1BfENveSVTGb07IC+U5f07erEFPwil8OBhfHt4wik=;
        b=Edqp8wUHbxpjG3PAlgEm+pQ6DNMgzi/j+Vg3IyxfCY7Ds+tCWY3eA4MqNrgPIWx8DV
         S3D/T+elTaryMRKKxX0mZA2rRjGouFgjTr1AHW+uX3ppejxEUAX4QElWi/dd4lAtV5KU
         VPm9e7tWUvmDknnFrJIBmzypJY9H6f03NxJEBesSpDwd1oTrKrWbhe4DyuCZ/VV0/jDr
         qGKQFUAzcw9i7yo/xsHk4iHszTY8IcdwWIlD6gPNA77SsccQzzEt21fsCDNORHKS4S0c
         7czTj/mSeG6oC/kRlz3NONvYcIyUji7ZhJNgGNmYe4PQ5ox3esbe05rpDhAqtoK0JGUZ
         effQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PI1BfENveSVTGb07IC+U5f07erEFPwil8OBhfHt4wik=;
        b=0HPPqpoh2HmiBCwoHTDGySv9Lo0BeqGLeZORfonWcEJb+nyGrFPjiuIG5QgGpaOGKC
         H3xlQsSEi4vxi3ahlIYH/JjSE7Pp5w5GrDwGTsH5YnoLHAiydgHbtmFz7PsESF08pWzh
         GOlfSmEBM/B4d42QvsBqQpZ6T+rgqhJ8czlVwWbbfSHdrfytKq3E+8DmBlHVyweiuzWg
         wnRNsFHMJdRL7OCAkC7wBKx+uyRQsBQJ/SCFAaES9soTupNlcSbjoCouo64w+lpvUJjP
         E2awgEYCPx+Koz3Cs3Vywh9ESnrw0t9hjk/lDZkqZU+2LaXxIqc21HLRpztvfXzHDE5g
         rOFQ==
X-Gm-Message-State: AJIora/5kkR0YDQDsINgkSGmBdwbbinN7RBDFWKMyxhHkCQm8UQ5i7qa
        aftsdys42wih/KBj6AopNDZ0hNQIRyhac+vSxig=
X-Google-Smtp-Source: AGRyM1sz0/nyyftxhutKdALBjBjJbiR5nkU8LRG9nH8VxNUYN1mVv4fZ+9pLZLlurFH6RT25ziMEm4M7xJvZo/bOnSY=
X-Received: by 2002:a05:6902:1142:b0:66d:999a:81a7 with SMTP id
 p2-20020a056902114200b0066d999a81a7mr1285020ybu.460.1656537547067; Wed, 29
 Jun 2022 14:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220629170420.2712077-1-l.stach@pengutronix.de> <20220629170420.2712077-2-l.stach@pengutronix.de>
In-Reply-To: <20220629170420.2712077-2-l.stach@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jun 2022 23:18:29 +0200
Message-ID: <CAHp75VfbNz-gpGuDu3F_HixD3+izYpOPwNe2-EW0Mr5=46uUPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: pca9570: add pca9571 support
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 7:18 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> The PCA9571 very similar to the PCA9570, it only differs in the
> number of GPIOs.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpio/gpio-pca9570.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
> index cb2b2f735c15..ab2a652964ec 100644
> --- a/drivers/gpio/gpio-pca9570.c
> +++ b/drivers/gpio/gpio-pca9570.c
> @@ -121,12 +121,14 @@ static int pca9570_probe(struct i2c_client *client)
>
>  static const struct i2c_device_id pca9570_id_table[] = {
>         { "pca9570", 4 },
> +       { "pca9571", 8 },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
>
>  static const struct of_device_id pca9570_of_match_table[] = {
>         { .compatible = "nxp,pca9570", .data = (void *)4 },
> +       { .compatible = "nxp,pca9571", .data = (void *)8 },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
> --
> 2.30.2
>


-- 
With Best Regards,
Andy Shevchenko
