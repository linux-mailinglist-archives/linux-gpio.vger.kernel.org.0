Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF577B4CFE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 10:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbjJBIAU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 04:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjJBIAT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 04:00:19 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF5FBC
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 01:00:17 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59e77e4f707so194754037b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696233616; x=1696838416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udyxD4x7r2SWeLX+7M3j8t9aW3/rijFvVpFn86la6k8=;
        b=M1NZ+q4A34mTI9MDRzUIL8KZkZgoARz4DJmTZO4XdH26xMgsrUATVmf3sNH+hYzvZw
         coEnGWEAd/CgWCmxN+RNrXv+ieG4ApZnvrsvhKMk2Uc9E58nzUE1h7CDHz0Vm6g2cBcX
         79WFITE7+iE+Xvg4nBgmo44gUiSzdJ2Dl2h9P/ngzNBBiDGn2FLE/TkDHuhwXpgx4dnd
         2NrFvvU3ZXt28IhN65o7cVZ4y6NoFJI4RZanFyuWqpDIxuUDEYlb9Mn0n9IBy1piLPPN
         hm8dMUdL+FQ9J4/Rluqb64ZHti8eRCP53nM229/rseJ92x75J0bg7YQ+kC0t1cH5mHpJ
         isRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696233616; x=1696838416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udyxD4x7r2SWeLX+7M3j8t9aW3/rijFvVpFn86la6k8=;
        b=UBhG+jZk6pCDotIk3RQrMjrjBhYb0jfeUtx2KFrpx50yIWNAa0pElZ1rHGLskEwRtO
         lq8NpOnuELZPKoHi4XxoZw8csxL54i44I2iH7oEmUkGWwpE7zxzgqaCsecBr8a7DUu2J
         NEDwJq7VKhEdGHlJWsQ1YyBeB6Ct9GKwBpce8LSOKuEveZVQDcFlCuYa+cZWo8ePXydS
         1cgQFZ1ObG9wvCAeNe5nSgNRZhT+lHRvIzK4lnyXKsDyTKxiDFdN49LqahVfH/kD1Zej
         wG0Hprm1fIRj85l6U5Czc57fh049tazAyJTLgfcqY0RZmaXH9WO/Ym5OxRw7/NrF2v4n
         zmaQ==
X-Gm-Message-State: AOJu0Ywq3Le20sIp+yvxXY4QwK5G1cVApkecPMgLsBfDPjreIkGTu+iS
        Rj/y8E+bFXSqFJwIHeSqePMv0w6y5BJtV0xIRtDyeQ==
X-Google-Smtp-Source: AGHT+IF3wlU7ad/oGXZui3ASHjBwUlNbogFpckkC70kx7nGijdR5lIAniFUKJKv72IE9hCAU/VFTehBjqNFj/EOUTFg=
X-Received: by 2002:a81:49cd:0:b0:589:e7ab:d4e5 with SMTP id
 w196-20020a8149cd000000b00589e7abd4e5mr10969040ywa.0.1696233616287; Mon, 02
 Oct 2023 01:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr> <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
 <ZRE3JNVNqFN0knHl@smile.fi.intel.com> <CACRpkdZdSTCeobuFdXNbJcHTKJp1V=t1sfp2tp25Mb0FBh74pA@mail.gmail.com>
 <ZRkrYChL0hKZwQGp@smile.fi.intel.com> <ZRk6MQllYmgxV0fu@smile.fi.intel.com>
In-Reply-To: <ZRk6MQllYmgxV0fu@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Oct 2023 10:00:04 +0200
Message-ID: <CACRpkdaNTAKQHUBCeKpf5Qr1BTwCRQtnjKfYa78p5d_=g-jRyw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 1, 2023 at 11:22=E2=80=AFAM Andy Shevchenko <andy@kernel.org> w=
rote:

 One more thing, though. I think those warnings are incomplete or actually
> reversed, and we outta use WARN_ON(IS_ERR(desc)), no?
>
> This way it will fix my concerns and your concerns will be satisfied, rig=
ht?
> So, if gpiod_get() returns an error pointer and then we are trying to
> free it with GPIOLIB=3Dn, _then_ we will got a warning and it's obvious t=
hat
> driver has to be prepared for that, otherwise if we have it NULL and
> call for gpiod_get_optional(), even with GPIOLIB=3Dn, it's fine to free, =
we
> don't care.

Since we return return ERR_PTR(-ENOSYS) when compiled out
this sounds right to me!

Yours,
Linus Walleij
