Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2865515D537
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 11:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgBNKHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 05:07:04 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44721 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729007AbgBNKHE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:07:04 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so6344819lfa.11
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PF0NRy8tZyvvpgLnBQvTlSYjFAcSskLV9npM91USJ0s=;
        b=wqgfTzWWtdUB2tcvSjtus2pApE3NEoErHGmdjE8uqp7oNfwlkrgb4DdWCFnu72+KUX
         soLifCCg7wB2r6O9j4Hwv64jtw23T/yr8J1zEv5BBFu+LoI8UdhQejWTF6Y++vwfcRJQ
         kdLrBitmeLNwxXRSbLe4UWVQm3i1EbrG/QXzfaEryULXz35DXbF8DTEiE/I5UYOnaqGK
         APHGGSEXLkWjQiDdtnywj+g/mVT0J3K8IFJqC4hdk3/2s5X2dMRC11oStFntUlJ+Yxq5
         JDjHnsxvI1Z2qOAZyn68oFE6RdjCqZDXEA84i4QCQxOj23JytEAaX1cP5mNK2r0+EEC1
         rrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PF0NRy8tZyvvpgLnBQvTlSYjFAcSskLV9npM91USJ0s=;
        b=TlcT6yI337ynxM78D1Qn/P1KTNwilQHrm1d6S+Ua1spFxoFQF8eVB7TIr2F/zr8gbR
         vgSe+vbj5ng+vwZ0/SUaN/QPaLQmuQTHZbHKGYpLtkxJeHhPpOu7FtVx9bSvwDjLcdBl
         PAj1pWmCTSmGpBRZO1L6znshlrhIlbpwIFSKT/LQk7pL70nGVNG8REqG+w/yxaaN9ZKp
         QwzmRI9kd14DJG+qkJ0rulkp6tvneWcNRsokO1fbutxEx60qNiVcmM4PKZ1oGA9DLUoQ
         uVRcHHFCIv75b8cWaINUqRG0lSW8taZeJuf/S/LBI8QFxec7k7kgWrxb8rhQDJY5Jl0T
         mH4w==
X-Gm-Message-State: APjAAAVBJed6739bOXQya6VBXF1/dVMShew8UdAXFMZuMdxf0QbCKObp
        tIVPP5EdMn1d4M+QIqijhlBPUho0+Z9+w/31WcGAlA==
X-Google-Smtp-Source: APXvYqwE618D6QwS2Ce8nucFnlwDx6s7EvaNXbOiSXAXTaOfY+ikeQ/Ec+btsxjmHTDjr3We9CqYZ1Swq0N8vcABlGI=
X-Received: by 2002:ac2:5499:: with SMTP id t25mr1304752lfk.194.1581674822115;
 Fri, 14 Feb 2020 02:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20200213025930.27943-1-jaedon.shin@gmail.com> <20200213025930.27943-3-jaedon.shin@gmail.com>
In-Reply-To: <20200213025930.27943-3-jaedon.shin@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:06:51 +0100
Message-ID: <CACRpkdZ9A_SJzxQ__f0oani+A97N3yLT3=oJ8z3vNJ5Ucyo8vA@mail.gmail.com>
Subject: Re: [PATCH 2/3] PCI: brcmstb: Add regulator support
To:     Jaedon Shin <jaedon.shin@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-pci <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jaedon,

thanks for your patch!

On Thu, Feb 13, 2020 at 3:59 AM Jaedon Shin <jaedon.shin@gmail.com> wrote:

> +#ifdef CONFIG_REGULATOR
> +       int                     num_regs;
> +       struct regulator        **regs;
> +#endif

Is this #ifdef:in necessary? Since the regulator framework provides
stubs if compiled out, I think you can just include all code
unconditionally and it will work fine anyway.

> +static void brcm_pcie_regulator_enable(struct brcm_pcie *pcie)
> +static void brcm_pcie_regulator_disable(struct brcm_pcie *pcie)
> +static void brcm_pcie_regulator_init(struct brcm_pcie *pcie)

I would replace the word "regulator" with "power" here to indicate
what it is about (easier to read).

> +       struct device_node *np = pcie->dev->of_node;
> +       struct device *dev = pcie->dev;
> +       const char *name;
> +       struct regulator *reg;
> +       int i;
> +
> +       pcie->num_regs = of_property_count_strings(np, "supply-names");
> +       if (pcie->num_regs <= 0) {
> +               pcie->num_regs = 0;
> +               return;
> +       }
> +
> +       pcie->regs = devm_kcalloc(dev, pcie->num_regs, sizeof(pcie->regs[0]),
> +                                 GFP_KERNEL);
> +       if (!pcie->regs) {
> +               pcie->num_regs = 0;
> +               return;
> +       }
> +
> +       for (i = 0; i < pcie->num_regs; i++) {
> +               if (of_property_read_string_index(np, "supply-names", i, &name))
> +                       continue;
> +
> +               reg = devm_regulator_get_optional(dev, name);
> +               if (IS_ERR(reg))
> +                       continue;
> +
> +               pcie->regs[i] = reg;
> +       }
> +}

So what this does is just grab any regulators, no matter what they are
named, and enable them? The swiss army knife used is the raw
of_* parsing functions.

I don't think that is very good practice.

First define very cleanly what regulators exist in the device tree bindings.
If the set of regulators differ between variants, then key that with the
compatible value.

Then explicitly grab the resources by name, using the
regulator_bulk_get() API, which will transparently grab the
regulators for you from the device tree.

Then use regulator_bulk_[enable|disable]
 to enable/disable the regulators.

git grep in the kernel tree for good examples!

Also involve the regulator maintainer in the review. (I added
him on the To: line.)

Yours,
Linus Walleij
