Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0BCB549C80
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 21:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346101AbiFMTAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 15:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348071AbiFMS7J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 14:59:09 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7FB7B9D6
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2022 09:14:33 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id d14so7825533eda.12
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2022 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fctl78rRxdL2xJ3At4ajlp0Whp6TD2asiOHA6caU3gQ=;
        b=IOOTzECZOl0Ehzq1Oib3oMmgd3ybi0dsb1VwiYjGV809Yu+1xl/K/Ad8j+V/8IVkoy
         8ZY61zy58AoMM2SXDV2tPneYRDm8GW6mbKXTRV67gb5DzJX45f633RUFpSAqvQ3i0M3y
         TUCNWzK6JAWG3g8A5pBpcYsWbEPjHpdN0uke4ovYWrBbh8jiQT9aCGuKNN5HZ3iyfjOL
         lxG2yxLJgnj1qHfpCA2kvsz/5+DUv8lr8L8srrkJNCi7dwfiboM0dV4M3MDZk3aVh6o6
         LlSevPA4eBW9g0BZCi8ijPAgxPRUIsq3jmu8wKgYZDtReVYq4YK1pOgMpvy098H6UQsF
         hXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fctl78rRxdL2xJ3At4ajlp0Whp6TD2asiOHA6caU3gQ=;
        b=eN5kk0T3bXTvhnoh7G+R4i6e0Wm623v0olqaqUVMeqMZDuCyFgyJgobU1rodxmiPF/
         T8ZUXBxhbhTemBmKv7IWCj2xwir3Fp5r0uRg4ZG93eMXcIYGRPcaAoCKLfgbU81jPyrN
         AaKt7pzip86GaZ+COWrk0cgSW95BcwAWxoWDleYVOnrNtBcpwh4s3icZ9K5X6BiRu88Q
         ANBjnddW3lvovlZqq5Kw8Ouk3+TtS/nRYeqUagX4oVS7YTciNZw8SvzU6k1djPBMAGYi
         IZ1UHdxNIkDQSyry/TfhGpy5Zn2W9VtOy11ZJYkNY3Ht7wtpcvR0bwVAe4+CiR/CGC2D
         GDCg==
X-Gm-Message-State: AJIora+WLIUU4KfgWeusvoOhnkeXeukB37RuVq1F7nb29AfjgZ+ulb2K
        sFKTzhBQFlhNKr312PWbXzPI/oDdeqkDpq92rwzvphQQIk4=
X-Google-Smtp-Source: ABdhPJyvTGgNLlVoapwzZN1CXxOrVB2Na71/tGpyAVeVD2xQWJk1QeLNEG/ma9pWBeYsQ1Dw5OdgSm/y+l8VmlT3Who=
X-Received: by 2002:aa7:d8d8:0:b0:42d:dbb0:f05b with SMTP id
 k24-20020aa7d8d8000000b0042ddbb0f05bmr563599eds.82.1655136872432; Mon, 13 Jun
 2022 09:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220612112308.320447-1-sander@svanheule.net>
In-Reply-To: <20220612112308.320447-1-sander@svanheule.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Jun 2022 18:14:21 +0200
Message-ID: <CAMRc=Mf7hMQxPTXfhm8qqzfiOVrm7=rdZXYJJ0LY_-QP2Nz78Q@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: realtek-otto: Make the irqchip immutable
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 12, 2022 at 1:23 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> Since commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") a warning is issued for the realtek-otto driver:
>
>     gpio gpiochip0: (18003500.gpio): not an immutable chip, please consider fixing it!
>
> Make the driver's irqchip immutable to fix this.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---

Applied, thanks!

Bart
