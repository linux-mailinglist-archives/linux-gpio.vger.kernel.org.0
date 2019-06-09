Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B96CB3A4EB
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 12:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbfFIK6S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 06:58:18 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:43380 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbfFIK6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 06:58:18 -0400
Received: by mail-lf1-f46.google.com with SMTP id j29so4649960lfk.10
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2019 03:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o1mbpiR+5qYYAg9zrkdTnavnWkH+BH3AIpNtsKGgNZE=;
        b=NPhtjuO5dVpBnc5LK82hlYwPTdp2+uzxKSaon0bagBU8Lg0Sb1b+nnZmtB8QObZ0lp
         uccftlzq3nyHvuLFfgLRkaKNCK1eUZalp8Fdu4RJ5Ox/wOlB+3dJpZYyxLnQbMnXHRGf
         kHtvbhagbg4NqlY4VouvD3QG0nw6XghAnEVuFGsxLLNBRkMxqHv1MfXH4m2ET2TONPyD
         w0I2lbZgPaopScKrTxj+55TbqHhLLSV3eSRMjC/nkJpLNpXpiVC6m/IxQDsATsPzZzpC
         GBdlp/I16tzcuTzF2h2t8lEd8vjm4zCte6gTPVMKx2+08UbURpTgmgyPMBW5Sh7qFiEE
         moTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o1mbpiR+5qYYAg9zrkdTnavnWkH+BH3AIpNtsKGgNZE=;
        b=TJxH4tpMUqRk5zob3jHvbUWL6rJiV/TYSLmg43kmfYZo2Hkj8NlOclJUPYenRA5HF1
         w+BpZwA3T7IgJpuDOW44I6Ff7QLS/yAv5yg0W/1ohey6TfaulGNirqSydt2deWdQV0yw
         ttPYeHZkegZReGd93FxZk3iqHEbhiFa17fAVAmLEcUGvATxw5wbNgYgITNzP2rzzU8Ri
         q0A80pEmbieqBfzMJnHJYa87ZK7eb4azGarTLl2/heHrdytlTq6+3WXe0yTedYHJV+cK
         F8yIx/HiyeFDqzk0PABnOc09J/gIhO8vIXzD599WBfUWHJXsfd6N9gBKWV47f9GGq1Zo
         B//Q==
X-Gm-Message-State: APjAAAVMhswRtIg0ZgB1wW9WhivOAs9X4AHxQ2MzpmEZHau9FZ73qkOD
        NjMYKYudnAOjA4LzeTvAitRCVdhCrBn7iN2ZAiMEkTUsdhc=
X-Google-Smtp-Source: APXvYqwtLNGlnRZ9pqmsWhoOKGPmtXrJNoxXkE5wMwxrvUmCavrc8SGmP2RfcRr05jIHzumMXUgtuqJM8oKvb7DHUkQ=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr30533372lfn.165.1560077896390;
 Sun, 09 Jun 2019 03:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <ba89e0fd-c9a9-4326-1fb3-a8b9dcb24601@electromag.com.au>
In-Reply-To: <ba89e0fd-c9a9-4326-1fb3-a8b9dcb24601@electromag.com.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Jun 2019 12:58:09 +0200
Message-ID: <CACRpkdZ-2TUrNOZyiJxXfO8iJUyaJRrnQicQirR8+G3M=+an0g@mail.gmail.com>
Subject: Re: pinctrl: mcp23s08: detected irqchip that is shared with multiple
 gpiochips - real of false?
To:     Phil Reid <preid@electromag.com.au>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Lars Poeschel <poeschel@lemonage.de>,
        Jason Kridner <jkridner@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added Marco and a few other MCP23s08 people who may be more familiar
with this code. (The driver is a bit complex.)

On Thu, Jun 6, 2019 at 10:59 AM Phil Reid <preid@electromag.com.au> wrote:

> Using kernel 5.1 I'm getting the following message:
> "detected irqchip that is shared with multiple gpiochips: please fix the driver"
>
> Which I believe should be fixed by:
> 19ab5ca "pinctrl: mcp23s08: Allocate irq_chip dynamic"
>
> However mcp23s08_probe_one() ends up calling gpiochip_set_irq_hooks() twice.

It looks strange when I look at the mcp23s08_probe_one() function
because it goes like:

if (mcp->irq && mcp->irq_controller) {
    ret = mcp23s08_irqchip_setup(mcp);
    if (ret)
        goto fail;
}
(...)
if (mcp->irq)
    ret = mcp23s08_irq_setup(mcp);

That seems wrong... but overall the code in this probe_one is pretty hard to
follow and probably needs some refactoring.

This comes from f259f896f234 ("pinctrl: mcp23s08: fix irq and irqchip
setup order")
by Marco, Marco can you look into this and help us figure out why this happens?

Yours,
Linus Walleij
