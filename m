Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36731816B4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfHEKQi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:16:38 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34571 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbfHEKQi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:16:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id b29so50245421lfq.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SrbJD1vEfE60HVKjYoBmFtGgNGgrOIdfFoPt4X6Q+2M=;
        b=CEpf7s4k5oxGDjJNaYqs3rNyMc08fXeAZr7+86sI4zxQ09hLwEgCj/ZTWv270igZUA
         MBnuxP52z+gVvbpCqKNyoY/rVW2zFwZ1dBho3naVESdTps3/PYebbyvptTrbEy0FoD7u
         F4b61y3FBnom8OagnIdGxalPnqdxXn5wtX6dhu+iFbx9p5RuFlAOt1/5Dn1HlQ5JbGZX
         wzDRVmOCjoF2gyOlZKWNfNvoPKyFRyB6X0Y9s5eEwSfcCLRLwT7DijoYst5XrAvrcFIR
         yXzqQ28Y9KXDIGGjcy93VHBgEtefP/zmwNeshyNooHMfGTh4M2r2ormcG94/UfhxaQsF
         pHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrbJD1vEfE60HVKjYoBmFtGgNGgrOIdfFoPt4X6Q+2M=;
        b=FfqzgAkSZA42Ra1xzJsh7f34B6/1dAba/PidBZrDSaIEw6JVybQjdDmBzjytx78ldI
         ciDMKseHkLqoDtUrBKG/1jtHCmmqpto9hr2N/6bmjCm6nsWNiY4EaAwyzaTV977qKygN
         5/Hw/xVYwGv/hFqN285CWIe7tHQMaueDk4wyMIRa9DwYBFhfBKU3iAEABaw8CYPmyvyq
         CeMylReG9Ecby/XdLy6OfiPecsgURsbesQKIp4wiFkD3R3CTszTYc8cVL8Uths0zzMWn
         ov+8BVOU9dYvACGGGQjvbwPhDMCeedXG8G7INJY+0zdjVKseAmMRAC0yoknCKYRxqII1
         BPtw==
X-Gm-Message-State: APjAAAXEiyWtnLy0dKKP2xYr8XganX2uoxYwJRTU+F8kDG3onXnqNczg
        VMM73c1UC9yP9c1dWaSbNcXc3+cSZHWkAtoYV2xw/g==
X-Google-Smtp-Source: APXvYqyOosV8sv/TZHhVjwj5Q16nJaAbVg2+Q5BdPmAvWKsycRacpctNaCXuf4VkQIw648gtA3ql91UGmSXtMQwMmXU=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr68773554lfh.92.1565000196094;
 Mon, 05 Aug 2019 03:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190725142419.29892-1-yuehaibing@huawei.com>
In-Reply-To: <20190725142419.29892-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:16:24 +0200
Message-ID: <CACRpkdZ+fBDKB3i8D=YKK-iVUeBN23b=2YdhnOY-dwR1tyQnYQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: oxnas: remove set but not used variable 'arg'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 4:24 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/pinctrl/pinctrl-oxnas.c: In function oxnas_ox810se_pinconf_set:
> drivers/pinctrl/pinctrl-oxnas.c:905:6: warning: variable arg set but not used [-Wunused-but-set-variable]
> drivers/pinctrl/pinctrl-oxnas.c: In function oxnas_ox820_pinconf_set:
> drivers/pinctrl/pinctrl-oxnas.c:944:6: warning: variable arg set but not used [-Wunused-but-set-variable]
>
> It is never used since commit 4b0c0c25fa79 ("pinctrl:
> oxnas: Add support for OX820"), so can be removed.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
