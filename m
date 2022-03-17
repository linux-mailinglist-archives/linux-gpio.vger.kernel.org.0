Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B594DBC1F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 02:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237910AbiCQBQc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Mar 2022 21:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiCQBQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 21:16:31 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0891D31A
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 18:15:15 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2e5827a76f4so42694917b3.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 18:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ttqf+Ak4UDk+aqmKJmqi9OHx4SLk4UXQ3k92bdd42JA=;
        b=ppoDP5SylJ2cXoiBNY3vfQkqbWK2IJELRGrxE+wl9xSRfIKwTGE4/neozdE0Cm2ANa
         RN8O3I6bGLILs57lzb9L1OXkrHDQYrocYBwk3ZKKdgA9zG0PN2vACgN0KYl7woCM2IIJ
         bjsq7CzxPyXRLw8tlRa4dN5SdqCVhNZmvLbiX1x42b8GG3SDUtk6Z2h8IOSx1xj4I4Lh
         rxSlsB1B8IoLsxsYQ39hEbfPURSPbJTb6vqkbU8stx3gFeSOJEhcyFd7DWXlF+IezjDr
         USNYXI7P8ZE1iELugJWXtsST3OFrjKC7pw5XoNrDf7REoy70wU1FZ0nfFQWe1U6SLh1u
         VWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ttqf+Ak4UDk+aqmKJmqi9OHx4SLk4UXQ3k92bdd42JA=;
        b=4HpGhwoILrrWoGX5LYzsnGS+vP3LhE8MBGr6PVsSVH0i+z3Qs7FyqgDm4KxWfhDWfa
         fV8eZKIIG+EI+g91HMz+vRHI82EULFeLsNAsL+m4uPPDbD2gjUdbpVvBurYxBldg/Kr6
         uiarlLs/mn2mE2n27YE0Mtt7QtC+0G7nVQDnHQlIYFD83w15K9Ng7aA8P/KYpbIoxroZ
         Tc3e3QfmeFTVzVR2Is9ClkGU1U3q10pT7Uozs9aQEf+u8qtjQ2v0KPg/9peRS8KrJy9y
         4I8MoZd/s94TKbMnmmWHpVn0NYVBD8wW2AsWj/ETWRBRO/CHDr3zXOnKJ9rKshbyf4w9
         DCag==
X-Gm-Message-State: AOAM532811hvoqdAnlxdtLsu3CNuV8cRDpS0C4RMDb0TdstVXecXAF60
        mDE/4YvtorVnwtAwqqP3lZhczrFpX6lEeRLZDG+v0g==
X-Google-Smtp-Source: ABdhPJyPaLapNfQSao0oiCb/+L4p2OuDLZBlYZ+H3ar1vc5etQtfVnFaclVwMPNGe315MYBEIfDh3Rj1VGhU4/0YrDA=
X-Received: by 2002:a81:9c47:0:b0:2db:9e18:6e75 with SMTP id
 n7-20020a819c47000000b002db9e186e75mr3225846ywa.437.1647479714460; Wed, 16
 Mar 2022 18:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Mar 2022 02:15:03 +0100
Message-ID: <CACRpkdYuxsYw99CZZK_GXp3V-mPiuL50CxgsE-=oRMApZf_bxA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing gpio-ranges
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 9, 2022 at 8:44 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> This patch series tries to provide backward compatibility for DTB which
> lacks the gpio-ranges property.
>
> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by Christian
> Lamparter already contains a fallback in case the gpio-ranges property
> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
> defined for the SoC GPIOs.
>
> Based Christian's on explanation i conclude that the fallback must happen
> during the gpiochip_add() call and not afterwards. So the approach is to
> call an optional hook, which can be implemented in the platform driver.
>
> This series has been tested on Raspberry Pi 3 B Plus.
>
> Stefan Wahren (2):
>   gpiolib: of: Introduce hook for missing gpio-ranges
>   pinctrl: bcm2835: implement hook for missing gpio-ranges

Looks good to me, is this something I should apply to the pinctrl
tree or should I wait for a non-RFC version?

Yours,
Linus Walleij
