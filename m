Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828ED7B7A98
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 10:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbjJDItk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 04:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbjJDItk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 04:49:40 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9F7A7
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 01:49:37 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-49dc95be8c3so67871e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696409376; x=1697014176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+YzNfqTip4SK0su8p8tGtqQX78FmAMwOHUKfII9CPQ=;
        b=j8E1xbCC2TqSQ77FFnCZw67BzRUnDR/bApmGCqaoi25r3wUR8wyaIUvz5e2/CTHi6A
         ol/SZxzCJBPtoZiMolyn/F7YSQ8aQbdEhriMrcd5g/O0s+vw9RbeiFlN68Qa/jD7zLW2
         WorID5g79y97l2scWkvkR65l/31wCA+OUpHBOGqfj3PYwA0EU1744lg4C5D+HykbBtTs
         XAtCfLB8kzuXX0JILuWNipRUQZ+XuOflPk7BeLT4FO97/w7pOskkV2fTjcbvyyKdOPXI
         ggqq2zkWAXOQv+Ebw73wbEkUSjhmDYPVD6n+JrDpDMK5bMOJ7AGLwQTx9HAXhbK5zC2I
         bssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696409376; x=1697014176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+YzNfqTip4SK0su8p8tGtqQX78FmAMwOHUKfII9CPQ=;
        b=ijWj5/Ny6wsLPJKGQMb+5w6ry5FPUIMem4Xq7KGuEUQN4TcBjMIt07GCTqTtoOFDyW
         B2tk32TM5GFJravy5q1ByyKsxC8nqWIT/KWm5iedKsTvAUi8tFOtjqakkNW69y43w+Dp
         L5tbCLJfCicoZXZ03lGfk17W2iM3mb0S26aqY7VQsl0ret8/EEQ8M5xaE2QzpE0Pl8z9
         C93HvE04bnGkrB+9PIadSpnqHfEImUP8azyvRcusvbKVowc1pf9qUsznjH2F/OPiIMtr
         RTq7uNQOfrFYwGKjcmjOgfpXAPPZRnZoPv+QXDXW7rDtCd23+dPqadOS+rHAv+L5NWrK
         WxKA==
X-Gm-Message-State: AOJu0Yw230e59CgI/vInjIQ26lAH51ongUo3vAk+wAVomLagE3Na0naQ
        clpGL/0x3qkhsZXVyDV5mI2+p1vndiGmDw1N+OrS0A==
X-Google-Smtp-Source: AGHT+IGVSiuefKeZd7FIOAhYAf7Wpjqc00O/2UC1iG6D/ByEXO64AiPAIYZUseotQx4KRq096ulaIxS4u6diKf2a61w=
X-Received: by 2002:a1f:4887:0:b0:493:3491:ce89 with SMTP id
 v129-20020a1f4887000000b004933491ce89mr1155527vka.14.1696409376342; Wed, 04
 Oct 2023 01:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <20231003145114.21637-31-brgl@bgdev.pl>
 <CAHp75VdvUUw77MuuhY3Ts9L0ezOdakyppQcnikpYCu672Ghb9Q@mail.gmail.com>
In-Reply-To: <CAHp75VdvUUw77MuuhY3Ts9L0ezOdakyppQcnikpYCu672Ghb9Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 10:49:25 +0200
Message-ID: <CAMRc=MdtdS6+8TL1edRzu_=ZT3mgfRud1YEx9ZAQcYprUj+yew@mail.gmail.com>
Subject: Re: [PATCH 30/36] pinctrl: remove old GPIO helpers
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Oct 3, 2023 at 5:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 3, 2023 at 5:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Old variants of pinctrl GPIO helpers are no longer used. Let's remove
> > them as well as convert all static functions in pinctrl/core.c that
> > still deal with global GPIO numbers to using the gpio_chip + offset
> > pairs.
>
> This patch does three thighs as I see it.
>

I'd argue it just fold the code that lived in old functions into the new on=
es...

> First of all, it silently converts to RAII. Please, do this separately.

... and while at it, it already switches to SBRM because why copy outdated =
code.

> Second, it shuffles a lot of code between old and new implementations.
> What I prefer to see is what the subject tells: only "-" (minus)
> lines.
> Third, it will become easier if you name the "new" functions better to
> begin with, it will help a lot here.
>

I'll wait for Linus to tell me if he prefers one big squashed commit
or a fine-grained history (I prefer the latter) before spending time
splitting this commit.

Bart

> --
> With Best Regards,
> Andy Shevchenko
