Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27E855AD59
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 01:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbiFYXFO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 19:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiFYXFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 19:05:13 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B25712AD9
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:05:12 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id l11so10537691ybu.13
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rBkoPZMwOC3Ev1nao8UJ9m375cpYH6X6YzqlTBexUKs=;
        b=SwJYW90+Qh9NBg6e+uufBULF/l+ayc+G1heBfuJEoSnQ9e4AxHNE06Gc/hBu30wKw3
         L1cOS0AmzHSQ5d01XGTncEPzKL/0xCi+IDhE1ebY58J/hIMdOcet1/Qc0399DxkReuXP
         vOLwI+sByVIz8qyeJaaztONADzwRqWYtGeL1PElr4FvjhrAiI5wwBFszaPUiOakGomnO
         cmtxkXwlP3yAseZ5u8oVeKUF40+e2VV0YLBtNXLVk0WFuV8vAQnTyqDr9MGLIAAOVdpY
         6X1snUJT1SFaptbQR1GRrwXC6OhC1l13xy5moeZ2l9jXkuLFFeOOuvT0Tm816oThbDaJ
         WGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rBkoPZMwOC3Ev1nao8UJ9m375cpYH6X6YzqlTBexUKs=;
        b=SheWsjT+gr9zN+s518Wq8YHphaviTNirIpXWyG+YYxzhMRGbgNZorcTkF6kR+WJJR3
         nDq+iqxrFlRaU08SJSPOssgAyn7a5mZjJg8kQORJRpRtc19hTAMTiCCo4XDC5TEOCUVz
         yrG5EmQ/B1qiubtPhemwfqU0wH8UCbruZnkjXnAlybtfM1mpLmAiozh8D1wqfGRKAIWZ
         mk0QG71hcKiVzc3P9zTL0/UvPvFrgjegv95PNu5sIC9ARKvJlh87a3gJ3LoFOYEcnGvJ
         cPnJmMMgIUA6aNNBpuXConcw5A8ewzm75xQKsvuQPfW4T4kaNavIJuIJ9SJOOrNU8IEK
         tOxA==
X-Gm-Message-State: AJIora9L59VUGFJpSLbCf2AVoTx4aXDqO/aUp0ZiDEqaSviLovWoCPxJ
        uNLkazP9ilnou068Cgc9Z9JsqW1+8HqvKj91O+uzNg==
X-Google-Smtp-Source: AGRyM1s3jo+mRKCtN9NF3/C8WDP1nNuazgrB5WPNDDDfFT5I50RibyTLVO/52rWa2fe/U6MRgWztcj4SPaipsh1H8EE=
X-Received: by 2002:a25:e7d4:0:b0:66c:899b:49c6 with SMTP id
 e203-20020a25e7d4000000b0066c899b49c6mr5778479ybh.291.1656198311664; Sat, 25
 Jun 2022 16:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220614202831.236341-1-stefan.wahren@i2se.com> <20220614202831.236341-3-stefan.wahren@i2se.com>
In-Reply-To: <20220614202831.236341-3-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:05:00 +0200
Message-ID: <CACRpkdZXh7804K3yrmPCX=BvFLR_FqQU7=Xi91RiKgWK9-jyPA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] pinctrl: bcm2835: Make the irqchip immutable
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Marc Zyngier <maz@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 14, 2022 at 10:29 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips. The bcm2835 pinctrl is also affected by this
> warning.
>
> Fix this by making the irqchip in the bcm2835 pinctrl driver immutable.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied.

Yours,
Linus Walleij
