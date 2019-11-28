Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF96310C894
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 13:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfK1MUo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 07:20:44 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36763 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfK1MUn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 07:20:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id k15so28308130lja.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 04:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qmf6jeZshq1jDY76loZcrxtrhAg7lwPCb71uVMENsw0=;
        b=FRYu0UXFOIpf1bWRYoJ1c9xHbXgvePCRjx4PZ5IZ5RV3Yz07xamodlI746hL9a9kcu
         oM/33Jk8YUVjiLAWEcliFiYtvfVwP69h8KPk0v0GARBdSoyaSNFtsfMYbyX7Dqk9AABs
         W2Ftf/w30gEOA5INs/fO0ChaN4+or7M8h5eE61FnIshjUh38nh7BbyelaZmeOAL0hi75
         emwPQn9+FGy139ZtDVsjT91HSxrtPW2QsuEAD/AhE5pO+wCEJ/YlJy2U+74OENsvW3gQ
         wNux0h4Q+8bJN52v8Cdk7gR/N9vmkXJYOwJ1h3c1h26ULVZ+s7IBMeExpJ8BhUSIvipq
         qocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qmf6jeZshq1jDY76loZcrxtrhAg7lwPCb71uVMENsw0=;
        b=eOw/RnuT5tyE2KgJrm5g7Ex5sdyJjy9CJl41f++9om3hJp8MkBJ60vt0OJmNvZB+Ga
         2m2Z1FMxhWzjq6Ia3oM1Uo8gU3g9VLYvXgbOARfp8O3z3nIItHf2tk8VroDE4TI1VJKn
         RV3TCJiQGsFFN+vkWSvXmMFyjwb5/9Xr2nvTAVz82tRZJPsiZmcDsGPUQKzXqVodI+cs
         7ltvwy/HxXUgBouhTjEaEpLiRE5SbYAeJ1O89HeMd7HcnsqmtgKAvcDVFnM6Zzh4QfQY
         l7J5nP7ubHnnxnQsRdHx/SP+7eePDUD9yCKWw4/2ZOFtK9MgC5ioSYHxaImnU+ezxj4A
         wboA==
X-Gm-Message-State: APjAAAVderC0PIfX1nwgRhyFe6OFahEWw1Jsb7Q3nA7Ne/Y0Olm1Bzj4
        Ui/A9uT42c2sA334Of9njQ1nyBIMicyVzyoUgX/wQA==
X-Google-Smtp-Source: APXvYqy5FIUKPl7C4nNCrIegY7/L/e3N0NOcZm89h/t+XCUHcKulKwvWZPZSi8sYlGYMiq1wU75t2SUzdLcDQIXtsPc=
X-Received: by 2002:a05:651c:102a:: with SMTP id w10mr5221499ljm.77.1574943641831;
 Thu, 28 Nov 2019 04:20:41 -0800 (PST)
MIME-Version: 1.0
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com> <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 13:20:29 +0100
Message-ID: <CACRpkdY7fGvTPcwwC0XU+XN2w_QUCj0MmOYhp183P3Lj7Qw8WA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
To:     Yash Shah <yash.shah@sifive.com>
Cc:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 25, 2019 at 6:58 AM Yash Shah <yash.shah@sifive.com> wrote:

> Adds the GPIO driver for SiFive RISC-V SoCs.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose Marc will merge all patches into the irqchip tree
as they are logically dependent? If you want the GPIO bindings
and this driver directly merged (no deps) then I can do that
as well.

Yours,
Linus Walleij
