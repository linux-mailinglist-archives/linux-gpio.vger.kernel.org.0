Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 593D710C87E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 13:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfK1MS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 07:18:27 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46997 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfK1MS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 07:18:27 -0500
Received: by mail-lf1-f68.google.com with SMTP id a17so19876000lfi.13
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 04:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+9HaPIwDGWIORg/ZtcvZAIKmu4aZIOqFrtCVzv15Uo8=;
        b=P9He/jdZelhAF63c66JOtESkD9SWLHGoK4fcKXecnAKf5ycE/xInVMP5Id/tMj3hH6
         Eot7YcHkj6OIenHQPCoyPdDUMMGen9pcS+VlrkT4DTKC4AybqCnhpzdjooSoRj7PVtHV
         ECHxDrBKPIoRWVvwdJu+FH9TbmcBCA7YyDG2L2Rcfld6g7X6DH1nXRnyvIXtipPtyGu0
         OIJUACG6vpMSL4VRwwpCnhSEGh97UwtAOzcrV90ler+nsjpdHlOmdo40cQk2SkGDsGG4
         D5C017GmYOZtYttdL71Ygqefe9MCirKwDf1Htcj8o/01X5bZAL7OZv4XkVAUxYzWfgqa
         Z9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+9HaPIwDGWIORg/ZtcvZAIKmu4aZIOqFrtCVzv15Uo8=;
        b=ee9E6nAisrwNsBewszUtf94CIE2wXiDOwKX+J8rfnSW0IjNIZjd5fx3RguNaRXgdzL
         TzCGXcZEhM/2pP6w8B9W/1C9mdXqYDCTfZN8+DZgS/1oLgfkptnQ/p3kweKBt7ZA5HxF
         gx4Kq5grXpytftunMHgrKZcabJxetjH2jv+Vl3OTwrVclK52kuX640P+XZvgMu9J+Nc6
         xzAzqMYKpZ1yiKesYMfbynGWZF6TCkpY2yJCjoELat9iNsS36uxofIm02WXbu43FKSYA
         SZkmDldvO4nsfmkk4fAgXdXHObxDZ3MY2MaX0ZhjxP7NLoP8yWWMyT72AMSaFZkSsSMO
         OuRw==
X-Gm-Message-State: APjAAAVn/+Ce1mv+dhCLIfLCguwStb28/ccJQ6V2JJlJxYeuF/wic6yM
        2xIcOtgHYlfKih3ldxysF4gwbY+5l4Eh2MfEdG9J9g==
X-Google-Smtp-Source: APXvYqwfcdHhm4gyrSY0PXoqGz1WH61ou574arqZCBcFKymILHOQyJwQZjM0A1Ke/HyiK4TldEM2Asch76SNuXwaHnE=
X-Received: by 2002:a19:645b:: with SMTP id b27mr21863272lfj.117.1574943505250;
 Thu, 28 Nov 2019 04:18:25 -0800 (PST)
MIME-Version: 1.0
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com> <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 13:18:13 +0100
Message-ID: <CACRpkdZt53578c3tWFodq6-HwNzc+gp6mc-n-8-GKkGyy61JKQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
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

> DT json-schema for GPIO controller added.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
