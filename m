Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3C87BB203
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjJFHMD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 03:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjJFHMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 03:12:02 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808F4ED
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 00:12:00 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-493542a25dfso664319e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696576319; x=1697181119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHzPDIF0nHvJ4MjZXtd+1YcUGWWggbQugVNz0aoRvm4=;
        b=uoti3CP1UVIV4y6Az3AEUllKS7h0StIL6Gn5M0VSwN5J2LjQDgx/3fM6a5KHKfRPin
         WPJNTf9VKGtmJj57NXv/hF+GqyJpGR5OY8LmTZ8SLDIUCPBLaqBe6iW2aHR5vk2Z94hu
         tKw7liJchp9+hKSiGjzbKY1V7XhBAzjEUALg1ZWBP236ZkoRuQEhdtyFNljlW2JVKpcJ
         l55foz2jy+6FfXFxVUbS7GMm8y7EDbLEM0b3qKhCAUP28otIEsYwBQd5rlBVXZtF/zLe
         aopFz0015uSyrxJUwX1vvY+bqLTqk9EEfe98wwLMnp4AG9p4IL3WLHiT3bLdcukYkSbF
         dnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696576319; x=1697181119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHzPDIF0nHvJ4MjZXtd+1YcUGWWggbQugVNz0aoRvm4=;
        b=THPIFTaVw7HnVgoVxOieh9va3jh10BnSaNmCTz/xiwl08n/e7ovKxnTeRrsKbChDUZ
         2N/OTziZpVqOmnmgowZHebKHLfpVtKbq6/tYvzxcTS+/upyTpBuO6bGEetWVbz3VP39s
         mCNj1XldODxFreXB40cwAlbsWCRJjb9U40uuCiFwJfClW5qFRADh877A3D2/WnlK60XR
         pmMB8YbWcIR4Vwz9cmzz7bqv7wYQnyYlqbwoFM0G8p71zmQiSE86QJVNfRbJW3A/NrUi
         ySHQwAbDqnHKbcuNww31q22fiwDmjF0Q2e608POVKGkt00/JWEUGFRy7V6jLzOvOYQds
         lXTA==
X-Gm-Message-State: AOJu0Yxdgeb/YQy8U4Z/8QPeqcp4BdxxCHoL5ozgGoNzXu++a4bJqSts
        dAZ4ZFSktSbsjPdevaNlVxrnuQLRHI5X/1bDzWMRDg==
X-Google-Smtp-Source: AGHT+IHiUqGjKQHUfgrIcgITqHkmD2z1HCMXkK+vuDHKcerGKLDJ+4ufx0fc/UxlguWUqe3soL3/3nEQ/msf2e3kc/I=
X-Received: by 2002:a1f:a9d0:0:b0:49d:92e0:9cd1 with SMTP id
 s199-20020a1fa9d0000000b0049d92e09cd1mr7100923vke.11.1696576319479; Fri, 06
 Oct 2023 00:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231004-pxa-gpio-v5-0-d99ae6fceea8@skole.hr> <20231004-pxa-gpio-v5-6-d99ae6fceea8@skole.hr>
In-Reply-To: <20231004-pxa-gpio-v5-6-d99ae6fceea8@skole.hr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Oct 2023 09:11:48 +0200
Message-ID: <CAMRc=MeGvqnsn63o1sH66AwTFCPd5kqj+7V=B08afrwUZdZCvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 6/6] input: ads7846: Move wait_for_sync() logic to driver
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 4, 2023 at 4:56=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> If this code is left in the board file, the sync GPIO would have to be
> separated into another lookup table during conversion to the GPIO
> descriptor API (which is also done in this patch).
>
> The only user of this code (Sharp Spitz) is also converted in this
> patch.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
