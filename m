Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78A73E5BCD
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 15:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241544AbhHJNf1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 09:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241534AbhHJNfZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 09:35:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19011C061799
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 06:34:52 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h2so16925044lji.6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=weC7sDSz7PzZbDSqoiKFHyafe+0MyeXAiBAfK1qKcS4=;
        b=ZkMvWvxM4pvYUqy5fI/4E/yYTR8XZ9e8pydJ6+ayXV+l/hEgGcg9Ypw9CVe+FUTQ2v
         /houmtJqyVgq02TKQ6a746nHq4/i+0VpeDz9l/1d2CpGOlFO38Q1vpU6i7sO+p2s3tMI
         DUlynGX/7LZqhwkoGdQ1I52fAp7G+fpqh10/pb1NMYjXvJSVuesWsHOSGtrvkuPxriNc
         jvVf677JQLZxYssZpEuMQaobwk4MEkUKrGAGiABlPkeOE1bm7qE+ceiIrkU9NvaF3v3R
         LaSTJbXjQcT785+AN9Ak3xvACeT3zp4mEp3Lyn0uUHq+VwXoC16GbDvi0V6XITOL18RG
         FEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=weC7sDSz7PzZbDSqoiKFHyafe+0MyeXAiBAfK1qKcS4=;
        b=XdeLvnlV/E5RxwfvDZJffJP26qhAjGSRl1FbEjmH7dgceguwBrrIsKLoA2m7my9c0+
         3XjKiVcOgqWkoOixl4qqjnxgZuZWkSc/OdfdVniYSxtibLkB1vWK9g8IvoGnr4AXLgzX
         Y5teRTeok/1VlPQJ5iSJqvpRbjGNsPfNxsyquyIglc2GF9SUqZe29pcaF8tmaUEx5C0q
         VxDskUaTpENrk+15VMXMUkNj1apoNaR+Mgd+ibb0QBIv3f3ITb0RcQukMbomvLfV0mBt
         VB0939gc7/9OuisWIaepwiYXat2nJTq6q8DbUo5Z7LdJCJgfu9/fsUOIpqRZV2ggXYh5
         NvYA==
X-Gm-Message-State: AOAM531NsCwTu2gR9bV1GEuHDI5lF0Wvbccjh/e6SqIZ9de2meI+BTVC
        gM2elOz3qlCuDjYCPpEQn0QASC9Vyf32MDGbpxTUfQ==
X-Google-Smtp-Source: ABdhPJxTxTJieZbnaNjRPZUIvrVUDFyycbbX1QvFSIH1cQRHK81GI3c7N6EJyS6zlrZ5d2BhxV7i2qX73NcqQoP17mQ=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr19671128lji.326.1628602490522;
 Tue, 10 Aug 2021 06:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au> <20210723075858.376378-2-andrew@aj.id.au>
In-Reply-To: <20210723075858.376378-2-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 15:34:39 +0200
Message-ID: <CACRpkdZ4A3Lw2U+_jXfbuXJFhpesi3SzNN1Codqxi4sLNu5zPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] pinctrl: Add pinctrl_gpio_as_pin()
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Allow gpiochips to map the GPIO numberspace onto a pin numberspace when
> the register layout for GPIO control is implemented in terms of the
> pin numberspace.
>
> This requirement sounds kind of strange, but the patch is driven by
> trying to resolve a bug in the leds-pca955x driver where this mapping is
> not correctly performed.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

(...)

Hm  this looks a bit strange...

> +int pinctrl_gpio_as_pin(struct pinctrl_dev *pctldev, unsigned int gpio)

This is not a good name for this function. Try to come up with
a name that says exactly what the function does.

E.g. "apple pear as apple slice" isn't very helpful, the use case for
this is really hard to understand.

> +EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);

This looks completely wrong.

Yours,
Linus Walleij
