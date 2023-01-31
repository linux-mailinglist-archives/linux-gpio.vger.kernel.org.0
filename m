Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B521682D80
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 14:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbjAaNON (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 08:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjAaNOJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 08:14:09 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59F12721
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 05:13:56 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id e15so17974657ybn.10
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 05:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lebX9VzQP7VMYHLa2vyK4hrBtzDqJ9eFCBgK4dZHGqY=;
        b=qXtrFvc8NPvibTzkOdKNUNcSgLQUKhwmE6ALIFFlhhema+9UDs2/xEAIp+1VFL2AAa
         9YdIL9SgKkLhDEhuwRUiuvwE+TJRxMZaSHitbLSVMLJWtVAtYkK0GK6tJyPqTuRp+uQL
         z9Swhwf9izFHI+zJzgyEejUwavw8wqvwJqCFL7fTGGGc8rUk6bd8vUrsAR80S6dFW0CU
         hZiVxhUNlbWJv7m3ZE4fyFtpkBPjAJ3YI9uNsWLMWDjXerT9A5FLOXeafa1i88ACzgEk
         ucAdfE/0nfU4LAz+zOTnAF/Jz8srUae8pvFzBqYWFGMrKyNnJMDbovdndrXlESHtXAa3
         /m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lebX9VzQP7VMYHLa2vyK4hrBtzDqJ9eFCBgK4dZHGqY=;
        b=t8y8EXFl0xu0vSFH5+0aOYFzn0f4ZprJqrE6X1cjeDMJcKfzKofp5cObyi+dsDwuL6
         srXWmBqxUB0oXmue8X0musMoFC1d5B06W2mrS04YujJJ9FaQRm/ZfpFJl6+adZvScAX8
         Rt9gXSDRB3O7jNTol+D/BhH4TpPGsnoe1mk/R7GcABDXLvxMYVUSCRDYVNuQB9Vxcj+A
         UC3qhqwLR1MAR0d2FwhmrPIz+q7ufWjiLoLnbjM5DPut/RAs5RkTwj2A0BsFion4ZIFX
         nmtYqhF8vyehmVLQPZXR7Jx/mAlb8crMNBU3TWCZca7ubFoLGl+2Z04fulVURgt/0pZA
         R6zQ==
X-Gm-Message-State: AO0yUKXuJSFHYLGm69VNfOn/L+P+FLZOqY/rLuzOCuMp1FmIaGTGIFCP
        BvaKJL8/Q+YOc+7OFeV+E0uloQTYkh9NQJPc1cLq2w==
X-Google-Smtp-Source: AK7set/ssVUH1Rz89sAOJnKBoqT7NZMWXa8/qUnWnQSWqihB5+j26vSuiStV4rczYgZIb+D5YQtZAm1c0IjM0yuMuo4=
X-Received: by 2002:a25:2fce:0:b0:83e:bd63:6dd7 with SMTP id
 v197-20020a252fce000000b0083ebd636dd7mr45490ybv.24.1675170835979; Tue, 31 Jan
 2023 05:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
In-Reply-To: <20221220005529.34744-1-hal.feng@starfivetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 Jan 2023 14:13:44 +0100
Message-ID: <CACRpkdbU=Y_LVBfSctQULzFuo4tB9KxgFbv=JGHPuuok6jC8FQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Basic pinctrl support for StarFive JH7110 RISC-V SoC
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 20, 2022 at 1:55 AM Hal Feng <hal.feng@starfivetech.com> wrote:

> This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> You can simply get or review the patches at the link [1].
>
> [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
>
> Changes since v2:
> - Rebased on tag v6.1.

Overall this looks OK, the DT bindings does not have any review from
the DT people but I think they had enough time to do that and were
properly CC:ed so not your fault.

However when I try to apply this to the pinctrl tree it fails,
for example it seems to depend on an entry in MAINTAINERS
which isn't upstream.

Can you please rebase the patches that are supposed to be
applied to the pinctrl tree (for example normally not patch 1, the DTS
patch) on my "devel" branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

If you resend this quickly I can apply it pronto.

Yours,
Linus Walleij
