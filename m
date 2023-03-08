Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D304F6B04FD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 11:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjCHKvG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 05:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjCHKvC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 05:51:02 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546F3193E9
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 02:51:01 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id f20so10918574uam.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 02:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678272660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef983/AOehfuTrHSl44XX8UHyvuKulox9O+KoFv9jPk=;
        b=Pze2C7lWpylDMzWq13sr1zuXSp3kgnKKJi30EgbeD0ZztiM3gdQwN0nbNJycnbOizo
         z7jRUgMo4PL4aReugZH8uTNZofdnScyvQFaYBX4TS0k2agdcGOmbVGFRCp6qgHltQ8HT
         ck5D0+pGkba/gQlEoGK63lb8dwEs04t8sLs8+LOxDudx3Hst9kypdEt+YhPMppFbstlt
         zG0yfCbxZgLSFaEdn2s6/9jGhCSOWGiBzNd33y5N/TLtSQ8aDkm0z1lONrITDXfjVJ4y
         AFQLSNzEkH9yPhYB7PofiLrz8vo9wSW1GmeMx6fo0REYpsgIloxi7SPjR8RwQG3Y5KDj
         7g5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef983/AOehfuTrHSl44XX8UHyvuKulox9O+KoFv9jPk=;
        b=mF4HgpH/dZ5wEicB3kb7jBA6CbaJ1NFC4rfk9cLHuz2MGERCe7bw5YuHWtqeaNK9PK
         BVY2YoYrJABlJcU+GkQsMzN6JIDilMryV7Gahupzu7+gXxylOsXSEYWz93myHLF+uAnL
         /CXqUD0Ni0s7iHQWS8CvZn8CpyGgRxUOhmskrffPJq1yyhrdiEVAewCwKioR6VrywzTx
         LrBTmkIzmGRoFER//HnWyeMyXQHbykpPmHQsdkE2aefJmyQxyI88V9AEpA+EFQxHaRI8
         /81S83CJPNOqsX0bWjf8qEV9uHHK4EHkuIlczXMs7+gL1AD5ueH18SLVQFZ+Sdo2GEF9
         dcqA==
X-Gm-Message-State: AO0yUKUYhNCSeu1gMqXOnQVMoGbuGP0zw1GjDYmFL8bar7P7vUDKLZIZ
        VBSivfjt16yXfzBr7LPAVSsmvpRFH7ozo0gJa6fdBw==
X-Google-Smtp-Source: AK7set/hautO/JuZVqVcpIjSQd/R1iuEi4e77QWPdm9ouCbUx2LGGQvzoei0RpLdyQQLnXwObBCEN0KebrcWJ4BSZ5Y=
X-Received: by 2002:a9f:37ab:0:b0:67a:2833:5ceb with SMTP id
 q40-20020a9f37ab000000b0067a28335cebmr13370413uaq.0.1678272660417; Wed, 08
 Mar 2023 02:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230307182557.42215-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230307182557.42215-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Mar 2023 11:50:49 +0100
Message-ID: <CAMRc=MetDO+mr6F8oKSkW3G8vv3nV+K-8QHM+Eov0s_3eCG2HA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: cleanups WRT GPIO device handling
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

On Tue, Mar 7, 2023 at 7:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> A few cleanups to GPIO device handling in the library code.
>
> Andy Shevchenko (3):
>   gpiolib: Access device's fwnode via dev_fwnode()
>   gpiolib: Get rid of gpio_bus_match() forward declaration
>   gpiolib: Move gpiodevice_*() to gpiodev namespace
>
>  drivers/gpio/gpiolib.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> --
> 2.39.1
>

I applied the first two patches, for the third I have a comment.

Bart
