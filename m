Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33FA36834DD
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 19:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjAaSLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 13:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjAaSLC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 13:11:02 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37C05956A
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 10:10:38 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x40so25433380lfu.12
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sgl57XiY71VeDZmuPKpv5s2hgkF2PM12zyC72R8iwDw=;
        b=pXHl5O3JBlW2NIvTD1T9j3Dpgw9fclujIjHlFMnk8XHpqpBOWMQEnMl06FmAvZyjw8
         QwCkZw0Fdvkkf2X6tJW8c53P1lMQnrei61fDeklDTp8jLiyCpGdyjckipCogCeXtM3+c
         sYuVGmE0i5NFg+xmrvvD4339pqWd5edLwv1JETarCkxfA3cAKsb9bd7cyCVPNPkPDPt5
         xo/lYKRuNxXFLuzqEAmcMG97cFGNjqKf0MjGN/7NlfD4BcywnlTJOas96eCsGNkdKHfC
         NzrZoNqwVos2byzLbL6dgV2sN6g4+wjoW8PSUTSocOcKJXCDuPiLlsoXuWCZVDduuTm2
         Ylyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgl57XiY71VeDZmuPKpv5s2hgkF2PM12zyC72R8iwDw=;
        b=bDzXY6DevypVF4IiNKzBHmSJnK3SyucNVBIt/VQJGfmVYv05fJwfE/fTtDhwoC8B8X
         wVSjL4vWhZSNemLX3Tx2xE8Fy3JK6CI7odb4rEj+Je+dFPlucyzxYmFgkcK9knKXUV2V
         eECfX5Wq32It+hVaJh52N2puFoO3u/Vklr398RM/lg2KyXS9HPFNlDpFaZ4ABil04dQX
         Xm0asm00KZmW54lXoeZIXQp4QXi37JWeKphSEqetwclw6PjSHKiU+OKYK/cNn48i92Ht
         QnPFy00Jpil2+TJN6qncGIhL5X2+IX2pQ43BTBdsFJld1H+Ha99AcQxYBB9lVWKxtboo
         Q0zg==
X-Gm-Message-State: AO0yUKWuYif2B3tAOkv4EjHCZltlQRL8SC3AZQzdGu0IaCYfD6nJx+WG
        0wA7vmDzQtnJy44jRANDmEW0pCb/zveTRI9SjqRAIjCcn5Y63T4v
X-Google-Smtp-Source: AK7set/tb3bKzAUJq6qr2c8dLg5VxSkSbmz92eF7qcgRTj1l5Ppmj64JISflXOMdtx+WD+Y4LX8vIuaAczMDB5BWTVA=
X-Received: by 2002:ac2:5bce:0:b0:4d8:696d:6ab0 with SMTP id
 u14-20020ac25bce000000b004d8696d6ab0mr1884432lfn.152.1675188635387; Tue, 31
 Jan 2023 10:10:35 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 31 Jan 2023 19:10:22 +0100
Message-ID: <CAMRc=Me+BZRfxvE4O1Hd72-3_gaGsZ3Uu3fewQDizAEyxGsEBA@mail.gmail.com>
Subject: [RFC] libgpiod v2.0 API review
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's been long in the making but I'm mostly happy with how libgpiod v2
turned out. I'd like to tag libgpiod v2.0-rc1 soon and then release it
within a month. Before we carve the API and ABI in stone, I'd like to
invite all interested parties to review the current version of the
interface (for the C lib and all high-level language bindings).

Let me know if there's anything that still needs adding or tweaking.
Testing and bug-reports are appreciated as well.

Of course many thanks go out to Kent Gibson, Viresh Kumar and Andy
Shevchenko for the hard work contributing to and testing the library.

Bart
