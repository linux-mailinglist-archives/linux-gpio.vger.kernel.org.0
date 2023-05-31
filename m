Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA21A717FDE
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 14:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235546AbjEaMY2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 08:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbjEaMY0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 08:24:26 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CDFE48
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 05:23:54 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-62614f2eee1so23819256d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685535833; x=1688127833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pp1H+oxHIOdAIjuFYupuwQiUG8CJB6HFSY3Kz5NC130=;
        b=l/XBt0sJlzjIqSSGXE2vFSSWiLgja7RQQWJdaaTMSuMww706dFtflUTirvN80Ri2w+
         sMOyXRU3xmOQsNEWBigXt2cy5EUMEauSfvDmqiJn5wdtGlkgA1gjqZShBDuYPSjOYGZV
         pJjqH35I6yk1/Xy7wqgkOp6vzuUjQk/xVaVYD/xUoFYjAz/s4oqt2CRpAT6eyeGZbh6k
         LO7l8/mhJWONhx9VxxSJeTtsMjb7CzJgQuWUqYKro1A0xXpjsl9JG1CeBgdz2F3uv7KF
         w9K6ZpIDbqBeQfzrG7k3U7xepXXwZ28MFz5Oo2n41yRmjbZQZbGeNUQGgp5rvU4JkIm4
         3mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685535833; x=1688127833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pp1H+oxHIOdAIjuFYupuwQiUG8CJB6HFSY3Kz5NC130=;
        b=l4Be2y8mB18NweB4bcE0ZPWRlfLqQ1YeyIGo7FR4FNzY6YLR2rMB3wMfwl2Xcs6sRI
         NMQc5GzMqT9/1qFeVEqhcSDY7EI5pR/BMIMCKb4up/04JZdMMCxmclLnjzP5yr4xy7iT
         2vUfUsWEic3Sx1Vt0g7qYCcgBTEyF4wjjgs6E6elVEjUJBP3JEJFdZeHz3jHo500Asl6
         3ZX5RoX37KgjSXHdU+kxarfBRjyWsDHxdC5jYfbtdvGndditWfpBqVyGEJW0II22SLfv
         6ng8tI1ySCdPLoFrWGj61S3s2LZyhRVC3UYP0OV2Q4h7AkQqt1zXdOIQhO7BmTys3bhk
         wfqQ==
X-Gm-Message-State: AC+VfDyOPF8Bf8aU/x4JDyg2zGrq0qgXkBjRhATMFZaprcioicMTCRmw
        j25S6DA0FraC9JLJiuZffaK+MfHE7y6zGb1Im38=
X-Google-Smtp-Source: ACHHUZ6uR26GvJBD1qNIggzwUnTiwCQ6ZTZ/BSUV2AM2dYG83UyN3lZkDvikec+fhZsX2Sxzv+XOoF/ckV9iWCiNGbc=
X-Received: by 2002:a05:6214:226a:b0:623:8510:8f8e with SMTP id
 gs10-20020a056214226a00b0062385108f8emr5892438qvb.33.1685535833315; Wed, 31
 May 2023 05:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de> <CAHp75VegyUL6J-s4W4fHhKu4cNeBA=4J4CmDHmtAfCUr9qGHQg@mail.gmail.com>
 <20230531065829.7qrkv2ivs57aymcz@pengutronix.de> <CAHp75VeNTuQWLqieSyh0djyrBApoZRwKOAnMRd80fVGzfJAnbw@mail.gmail.com>
 <20230531100655.dedu3udhd4dv7r7j@pengutronix.de> <CAHp75Vf0_M-0r9KDf_vg6TcfnaKfyF8P-iwpqnv-WiitUmnCzA@mail.gmail.com>
In-Reply-To: <CAHp75Vf0_M-0r9KDf_vg6TcfnaKfyF8P-iwpqnv-WiitUmnCzA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 15:23:17 +0300
Message-ID: <CAHp75Ve1aA0ofkNSaqjKmY=JBr_UBBkWisDxcc8wqs8iGNsgJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: use "active" and "inactive" instead of
 "high" and "low" for output hogs
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 31, 2023 at 3:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 31, 2023 at 1:06=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Wed, May 31, 2023 at 12:51:15PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 31, 2023 at 9:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
>
> ...
>
> > > https://elixir.bootlin.com/linux/v6.4-rc4/source/drivers/gpio/gpiolib=
-acpi.c#L1262
> >
> > Ah, that was the necessary hint. Adding the aliases there would be a
> > third patch in this series, right?
>
> No. Just split out that one to gpiolib main code, since it's already
> using fwnode API, update OF code to use it, and modify it and then we
> are done.

Ideally there shouldn't be HOG handling in the OF nor in the ACPI
code, just in the main library.

--=20
With Best Regards,
Andy Shevchenko
