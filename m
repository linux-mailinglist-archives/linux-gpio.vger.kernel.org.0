Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898F319BCDD
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 09:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387595AbgDBHkT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 03:40:19 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37368 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387594AbgDBHkS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 03:40:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id r24so2173933ljd.4
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wxvF/+u7KELI/jIBwkyObWmgPCHKCclGo+byqnItBfc=;
        b=ACHfzrKps1Y4qZ9YwaFZz454GAI42WKp0MnKRH+8uzjnzI0AVl1GPC/yTcGOrmSQT7
         WwN6Lov4ZzMLjFKKNJHUAFzcJd0+Jonx/0LeOu4FWrjASmB9WAZzy9dKY9ldaKMWqXZC
         ZGAbfVQlR+9zU1P2eWd6rzDyyv9o1jkBqBs4xI8Ifbk6tT8lIXjGA+EL06SSRftkz9fF
         prWVWRQncTwRVneP0UDZZkl/58ymlrYkh5+MCxr6f8td2KYmIhhEzD8eBEjqUQuw3rjk
         2iHeZMh5rcmxyNZL9T8vMI1Q4JAMfFlYyYNtTJe6U0cN/uUYSOHDPCWNwWU0OjaqKSXX
         eWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wxvF/+u7KELI/jIBwkyObWmgPCHKCclGo+byqnItBfc=;
        b=JJTaIL/NqUFskbtSKcayUuu1rnVYd0KhweTWMFcxPy34K+fQCI72GGHBXtYpJEyrk+
         OmdAxGEOPpBEj+1Bt2ctP8T+G/LFmlwXEZtjaNwPBL2Wy+yS1a/GVDwbHw9FsHLa9uLr
         Iz+LS3Z9/ZecGnT83l+h5Jq36q7Pv4GyO2GgL/jHXohJKkIpBiUZmDbK7yCesJG3408m
         84ckfGYtk2NubTmaxejrDxFHu3vME7w6FHKLj3GGGgnUsCvNswnc9vzeG3nzqZnpzs3i
         iHPGWnPfsXmfbxVVivwMt8DljFHr/rrzp8C7XhObbBSmpdtc8rL1Pq5d07ttOQs/22gg
         Wa+A==
X-Gm-Message-State: AGi0PuZBW106EbbL5B31dNofHKI8LVC+b+ASPmV9C+QdeHGV2p8MZzm0
        wCf9cGRKxrJ3/QvRqa5wbJc5l6JPbll+IzqZgS1uig==
X-Google-Smtp-Source: APiQypJQrw2kGNxUc8CNT6NNf1617H7vjAW0LBY33E65eACRmhGlNj1w5ZKMZP3jhOmVn3FO45GGUDWdSL461+AF6lg=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr1117658ljd.99.1585813216416;
 Thu, 02 Apr 2020 00:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <8d3579f4b49bb675dc805035960f24852898be28.1585734060.git.baolin.wang7@gmail.com>
In-Reply-To: <8d3579f4b49bb675dc805035960f24852898be28.1585734060.git.baolin.wang7@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Apr 2020 09:40:05 +0200
Message-ID: <CACRpkdYYsPKFBKPVXHa-k5jmQ_8BPfpqmWAUNfSNzar+CedXmA@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpio: eic-sprd: Use devm_platform_ioremap_resource()"
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 1, 2020 at 11:59 AM Baolin Wang <baolin.wang7@gmail.com> wrote:

> This reverts commit 0f5cb8cc27a266c81e6523b436479802e9aafc9e.
>
> This commit will cause below warnings, since our EIC controller can support
> differnt banks on different Spreadtrum SoCs, and each bank has its own base
> address, we will get invalid resource warning if the bank number is less than
> SPRD_EIC_MAX_BANK on some Spreadtrum SoCs.
>
> So we should not use devm_platform_ioremap_resource() here to remove the
> warnings.
>
> [    1.118508] sprd-eic 40210000.gpio: invalid resource
> [    1.118535] sprd-eic 40210000.gpio: invalid resource
> [    1.119034] sprd-eic 40210080.gpio: invalid resource
> [    1.119055] sprd-eic 40210080.gpio: invalid resource
> [    1.119462] sprd-eic 402100a0.gpio: invalid resource
> [    1.119482] sprd-eic 402100a0.gpio: invalid resource
> [    1.119893] sprd-eic 402100c0.gpio: invalid resource
> [    1.119913] sprd-eic 402100c0.gpio: invalid resource
>
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>

Patch applied.

Yours,
Linus Walleij
