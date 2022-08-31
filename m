Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95CEC5A7CA9
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 13:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiHaL57 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 07:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiHaL56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 07:57:58 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6BBD25ED
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 04:57:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id h5so16291362ejb.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 04:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NOgcZXUTYF+CKTpWFn+A9sP/evQoRjIfePhgBFwX91w=;
        b=P/lmgXyjfnF9cfsP7itAQaj19CLSaJGb6guFQ1cfK6CxFlWbyvhw++VLNHOhDUeKmw
         xJaXySbkDo3rj+OPPSEbCMzqtbDIlQEkYN6JGQJu/k7s9ubidS25IcLVCBGVK8UMx55o
         c8COb3V3GAvHWb6ATXRLizY3KaokdIwuvdOj2SKv+JVdKurRthef19aHhgKqHKVsJbYW
         qqJIbAeLJnXWoYsf1MeXLxVi/9majHbX8AcBY/B4iXytkeGync+UxWqpLdjA1Q3LwnuI
         TCVvc03WL66ygsbKcSxCK8CheAHVcuJMi0lfAX2TSz2KsShzHKBzNdNDk7UPV7E2lsDD
         qIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NOgcZXUTYF+CKTpWFn+A9sP/evQoRjIfePhgBFwX91w=;
        b=5gaJ6PhSOI5xyNgKwOfQnBKM4y1ucNtmKq4rNHJgm4VToM6jCrsbNYAJtus8bfhYvH
         vP2cMKk/5HNo4KpvgN/4sKe26x0qDzYs8KWQAwwRqRsGneizEP9sg0bMBi9GvR6hoFL7
         gr8hEh7/D43QmECMKa4IImzTrSV8qmh5ioERm05hEsCR3qqKHs+33/ev4m0BjaPFkHyy
         YuUDGZFpAUiVs2wKMuOCg6ux7D0HuLpqv6Vjwu8W2+hMefRW1adhzD40LVLp7+UCIiqu
         pqm9H+tXx8csAqtTc3Tr840dttTvs+TcNW7TJyccHmcqza/ZCXhgnZjfBzb8sti8y9/4
         UBkg==
X-Gm-Message-State: ACgBeo3qn6Bxu+eVpsCW99K3OyYNS9tD/FP4t7N38qemKv6HSt9zj4R0
        3ThsxpD+VK8UzOO6KvWLQ/DLiTzrtxBtW9M5A4TdvA==
X-Google-Smtp-Source: AA6agR4wGSBaQ7g6+SrXjpiE1PZcQpv09VtnTP8WgkmRZ8v9uCar/cKJm7vBGDSxGSLOwpxXqQ4A5BmcX0IWLR8ZoSs=
X-Received: by 2002:a17:907:2722:b0:731:2aeb:7942 with SMTP id
 d2-20020a170907272200b007312aeb7942mr20187601ejl.734.1661947076458; Wed, 31
 Aug 2022 04:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220829133923.1114555-1-martyn.welch@collabora.com> <20220829133923.1114555-5-martyn.welch@collabora.com>
In-Reply-To: <20220829133923.1114555-5-martyn.welch@collabora.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 13:57:45 +0200
Message-ID: <CAMRc=McbNwLRq_OBo_=xwFJJ-_8C5VfjQt75dvSVC9SqUYTpFg@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: pca953x: Add support for PCAL6534 and compatible
To:     Martyn Welch <martyn.welch@collabora.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 29, 2022 at 3:39 PM Martyn Welch <martyn.welch@collabora.com> wrote:
>
> Add support for the NXP PCAL6534 and Diodes Inc. PI4IOE5V6534Q. These
> devices, which have identical register layouts and features, are broadly a
> 34-bit version of the PCAL6524.
>
> However, whilst the registers are broadly what you'd expect for a 34-bit
> version of the PCAL6524, the spacing of the registers has been
> compacted. This has the unfortunate effect of breaking the bit shift
> based mechanism that is employed to work out register locations used by
> the other chips supported by this driver, resulting in special handling
> needing to be introduced in pca953x_recalc_addr() and
> pca953x_check_register().
>
> Datasheet: https://www.nxp.com/docs/en/data-sheet/PCAL6534.pdf
> Datasheet: https://www.diodes.com/assets/Datasheets/PI4IOE5V6534Q.pdf
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---

Is this series complete? I don't have patch 1/5 in my inbox and
neither does patchwork.

Bart
