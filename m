Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DFB4E8B07
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 01:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbiC0XJS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Mar 2022 19:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiC0XJS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2022 19:09:18 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C675DFCC
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 16:07:39 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id x20so23036201ybi.5
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 16:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ve5+XZdwip+wfJ4zW83es5FP+je84qvCmA8uoY+nFLs=;
        b=U7PQrj7BlEBIpfqmMR8TfU+MOKxh3kIGvThZ45dmPpytK+1bkRmD/iuObLyklhxlT2
         FG5vAILis0+hh0PeEyFI27qkcE33C1ysq5W6UlMUEv8bwsgBADY406aM4jCRhHuzQwvZ
         rfLG4jC3Xl4ugO3PSn18wKQ2FuvSOTyeZb7h0TiKqf7DYA48Ow08vF0xmTzlnVh4ix/w
         0+4pm+GDQOg34sGRkCe1C30T9wJzePDXxF00iRWQ/4DLf18QAH57XcB21/uqJyiY/aw/
         m1vOccxyiGQEGFJEcKITiqBDHq1H/G9cYgC21pks78eGltS3VcrCHDI78JDh7Mk3UZ2J
         8W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ve5+XZdwip+wfJ4zW83es5FP+je84qvCmA8uoY+nFLs=;
        b=YIJrbTZthubh1GTnkKVZ3AWOHtjW0CkOi7bQ+d0OMru3UtxTZEJ6e5qW1siBpgHMFQ
         MV2kY6/d6e22dgokpDB0SABXdwwzb/iYKM2phAqP4koPdkwkrq/Qyoe6Qu3ldlRhXm2P
         VUVq/CcX1wzsJM692+eV68pAZ8CSJG7KBNa6Q8fhnwTIlXZ/YzVtgXPI0s9Wf2+udZgb
         +sCmZ+7ExakANlpHRongWdfASlQJ7iRGuetu5uzlWnE27SNH08Jb70mP/2HEzxlds16k
         7jqFSK9Jb8qHYeFwI6hMMc+ct78IXj8O3MXNk00WxOYtXBtGIBKO0cWOTxglsz1OjvJ7
         Lxgw==
X-Gm-Message-State: AOAM530f8V+CipL09EZBMWKnVs+xoHpxvVbShlYbdCP+rq9J8RV/UfPv
        LIrwkQMZKtdk5hfl30jLBBwRw3yhmxOS0yUlDAPcUw==
X-Google-Smtp-Source: ABdhPJyYdGF7SbqGEL+ETG0K/sHAhVQ0ncmoxpfN+n6jIOZ/nEU4xm6uwZxHYNtHVmCEdtNxAygQYxsyW2X45AkixBU=
X-Received: by 2002:a25:d088:0:b0:633:b902:2d29 with SMTP id
 h130-20020a25d088000000b00633b9022d29mr19969569ybg.626.1648422458225; Sun, 27
 Mar 2022 16:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <1647927649-9907-1-git-send-email-haibo.chen@nxp.com>
 <CAHp75VdZ9RVuMrgWXOWqCrmvHBtkz+S=dxXhR44Ri3p6Pj5LMA@mail.gmail.com> <AM0PR04MB4001E8E8DA1DF5355EB96A2B90179@AM0PR04MB4001.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4001E8E8DA1DF5355EB96A2B90179@AM0PR04MB4001.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Mar 2022 01:07:27 +0200
Message-ID: <CACRpkda5szS32JkMFaTjw+zm+Oye+8QCv1A0B2UL6keuYPKS4w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Allow setting gpio device id via device tree alias
To:     Bough Chen <haibo.chen@nxp.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 11:16 AM Bough Chen <haibo.chen@nxp.com> wrote:

> For users, usually, they will open /dev/gpiochipx to handle gpio related option.

That makes sense, it is intuitive in a way.

> By the way, how can user get the labels and device names of GPIO chips?

The way to get metadata for any /dev/* device such as topology on
buses is through sysfs.

It is also possible to get labels for all gpiochips by iterating over them.

The most user-friendly thing to do is however to make use of libgpiod
and associated example tools such as gpiodetect:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/

Yours,
Linus Walleij
