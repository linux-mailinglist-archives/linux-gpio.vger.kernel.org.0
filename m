Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335E2698ED4
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 09:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjBPIh4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 03:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjBPIhz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 03:37:55 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9806D55B3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 00:37:50 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id a12so825056vkl.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 00:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1676536669;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l3OoYD62rT/ZLARA50zVqJaeysgx/Dw3ixwRgNP2kLg=;
        b=d4VK7mcm/mNhoOnQnZX39ie7kwdP4jn9fYpTSCF2Le4pVye+C2MBfF6uQhzEfZfccZ
         VJJAVQT2Do7kjfgMDx/IqYdYHbkKiBP2TM8/qMMP/nNLoqnQ0Iv+OcQTlxGj1Nhzihe1
         RfItqnZ3UVwQgsS7BQYhog0lJFPm9NG2Al6rhpfxotM+Oo40VzVOqKpJLwv5MaVpXGD0
         LM4UK6gKt/tU5X5viSlQCZ6TXGmtpOHVGj4Drza+9yApA+lkVIhS/Po5N/27LCmoSXaO
         0zjDR9SveS6VCTlNr3EblnzVvu00mwSEHD3EcH4/U+7plpj64fLazc8Qc+JnyBGNW4+F
         dotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676536669;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3OoYD62rT/ZLARA50zVqJaeysgx/Dw3ixwRgNP2kLg=;
        b=IThQIGOXAP0+zLMJD8XOVX/5jEwIRB4ymBAfYuiOvgFvO+N5Her/vDAxTfYQfpKAsD
         AEJ6TNpcC0mVQkKBpEH9AvW7DyNngwiP1x2z3jl5sTjAK7SDG58jL7Id+42Ha3JK8WAq
         D/f79Y6EzNWduaMwnnd5EsOKYUDGX/mVT+2o+iNnXbyn791Wy1DWZNlhu7FgxfGkZYxy
         CZBhu2rEoo0SWQCerVCswaQhMGmHIXH5z998m8vniMeIeVJD/4JljF8wD3FeI2yLkfY0
         0BUV3tC07TaKGe+fmIsLDnTWhrEH2CBOlnDBVQ3a4cGJqBR0bKqRSh+SBUREdyuNcSoU
         ds/w==
X-Gm-Message-State: AO0yUKWpO+0s6gchhHage74Ia/3K6CV9UmGQG36rheK7Of4C1fKApkGr
        TsjrpSeNHTG6qRGgFW0WLJjX3Agz4Ui9c7zDQdJdFP2HE3YPIVB3
X-Google-Smtp-Source: AK7set8+APLHhlJzVieoTGPP4NWMU+n6Rg2N3gF24eshkxVAudLmIHYGZ/KwePZoscQ5WP/Y6VWlul+NgDMgWIfFPok=
X-Received: by 2002:a1f:f28d:0:b0:401:8b9a:d80e with SMTP id
 q135-20020a1ff28d000000b004018b9ad80emr757792vkh.21.1676536669357; Thu, 16
 Feb 2023 00:37:49 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Feb 2023 09:37:38 +0100
Message-ID: <CAMRc=McLq0reqwyx3=k=ittdjL7fPzCwPMBt+O0oCCrQ6WVq=A@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.0-rc2 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Giving the RC exposure to meta-openembedded autobuilders was a great
idea and several build and runtime bugs were detected. This version
should now build fine with clang and musl.

If nothing serious comes up, I imagine v2.0 will be released next week.

The tarball and git tree are in their usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
