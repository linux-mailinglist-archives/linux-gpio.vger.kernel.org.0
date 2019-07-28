Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7E31781FD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfG1WPU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:15:20 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45026 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfG1WPU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:15:20 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so23676195lfm.11
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YeibLRzY8poiwEyzPSZBHEh8ieLf7W0FOimn7LyvS14=;
        b=tpmTa8683dgi7/XjWm7o2w/tC+V2LjayfZXdrqaXJ4BFjZs6daraSuAifJ8Tsm17Gy
         +ZGgUoB2vsKzH23RjhmDvrdSC5lQQn9kWfIxSMX0KS40wrzafnLaPunATs9mIzIYcLI2
         QoXZEHdsdt69bXktn1jtGFa4EgA15HDxKYQQWYQOrnVeQc848EX6ZOxV3OwCedVDPOvU
         g1jV8Ji6wW51HSN3Jfh75QW/w7yqhpFAgAXS7/Fu+xbSlcXqB23S5+Ep7G0OaHXfeBLm
         4AiIyzYRa6PBmFJVx5i8vdIa3yyY9rtOB+g4JCTMmggG+NICxJghRDBPsuu/mG8+R6pY
         oabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YeibLRzY8poiwEyzPSZBHEh8ieLf7W0FOimn7LyvS14=;
        b=S6NVFU+c2nM+Ph7uquk8+BGj0Pz7xtcgswYJNtCiGlS7XL24bmVyvBC3IlKfvByKb6
         2QBnZMg3Q36YL5VgSQIw0xtnHPamPd+datOF9pt+TJxS4uBbQrsaaP7nbCS/weLAIbiA
         EXyFzO0UxqfiKhc2pRp4QNGtm1qS5K4Ip/tiD5RYb6fVqQAmsptWVVcrcJtu/AzCcr2V
         cfU4xzl8Bs7vCLKTC8CVLehvyk50250g153G+LeWmQzNDEQ346eQpkqTH6VpOaiVQqc1
         bybiRIa08EBQVKawT0NjfM5y5pR7OKwPFPL4hwb1201447Mlvjtnx0XDaC8Wof+mZt6W
         bHIA==
X-Gm-Message-State: APjAAAUoJrdC1r5o+YxYUZracMMgr5Ti0i2nmWAu2kIxm8AiCkNEZV2L
        FcG74owrST8BXEQtyiN9REZxKsoxA8hIbpCEc+Mq4A==
X-Google-Smtp-Source: APXvYqxvwlokgETwwAsSxJ6i575LCxLhpybLK9ji2xNFWoiKPzouZqppDkBJe0WfK8dg71/fKTKEb1SMZ52k97mLLuE=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr49659298lfu.141.1564352118287;
 Sun, 28 Jul 2019 15:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com> <20190713075259.243565-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20190713075259.243565-3-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:15:07 +0200
Message-ID: <CACRpkdYLLYbcvi89LGeTSu-qXxM=sxrwYFniJwDW1-9BtODWrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: add support for fetching descriptors from
 static properties
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 13, 2019 at 9:53 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Now that static device properties understand notion of child nodes, let's
> teach gpiolib to tie such children and machine GPIO descriptor tables.
> We will continue using a single table for entire device, but instead of
> using connection ID as a lookup key in the GPIO descriptor table directly,
> we will perform additional translation: fwnode_get_named_gpiod() when
> dealing with property_set-backed fwnodes will try parsing string property
> with name matching connection ID and use result of the lookup as the key in
> the table:
>
> static const struct property_entry dev_child1_props[] __initconst = {
>         ...
>         PROPERTY_ENTRY_STRING("gpios",          "child-1-gpios"),
>         { }
> };
>
> static struct gpiod_lookup_table dev_gpiod_table = {
>         .dev_id = "some-device",
>         .table = {
>                 ...
>                 GPIO_LOOKUP_IDX("B", 1, "child-1-gpios", 1, GPIO_ACTIVE_LOW),
>                 ...
>         },
> };
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I'm pretty grateful for this since I think at one point I provoked this whole
series. :)

> +static struct gpio_desc *__fwnode_get_named_gpiod(struct fwnode_handle *fwnode,

I am allergic to __underscore_with_unclear_semantics() so I will
change this when applying to something with meaning (I even
like "inner_" better.)

Otherwise it's good to go when I get an ACK on the first patch.

Yours,
Linus Walleij
