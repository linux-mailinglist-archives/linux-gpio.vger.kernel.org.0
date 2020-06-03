Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3A51ECBE3
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 10:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgFCIur (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 04:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgFCIun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 04:50:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B76C05BD43
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 01:50:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id o9so1691324ljj.6
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 01:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eDEdHw6LDRuGgcUmAT25W9TXRRB0f6WQXb9BxD6EOp8=;
        b=BbLO+P/mutWqkVKp4Vanmt5nZK0RWWKwRKb34gVK7SNNxKS1Yk16cVaX114PM21y9J
         cVTkuQOVI2+qR4v1b+DeJ9XsbLHdlHJwrX1aXvtWMw7+H0XLpE/QgwndakgnTn3xdFou
         axfr9gG1UCJiYfG3a6pWEL307+48LsO1cmck1iBPe9QK0as5SoGDxoPIzrfmmtdf0xe/
         k8CnIB0e43i51JVgZCwVeUjycE6yBbmna9PaSZGKOBIf8YaRTFkpYbtt4OaePNwafI3A
         0xw/aQBimcoztV0YumEGxAWsufVjOgLVtYNuAJQD00Y3bM+qrkh5I5rOt5RDESCX5ww/
         2Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eDEdHw6LDRuGgcUmAT25W9TXRRB0f6WQXb9BxD6EOp8=;
        b=NcK24KNwEry/8UmXgb6vb7GHVroTTKm47D1SpMLGNyL8imo51a3xAagLvRSR1gRpKV
         rhN0Kf/387BzREK4bGj7TtF7Sn7Fb2ONpEPN0xVucwtXhl6dbGqJuK4z6J0xDBYbepeT
         8cCZHFAYJJyMZugNwE/85vNB6+HmsHu6ZJNqAJ+FS5elEMRE58NhONdFAFGS+5dYd5X3
         jQ0NtNT82a48vCEoljI8/KGopFnf+9S0L7FgfUsr6SoE1uhTl+G55i7DcHTsODFSxXDb
         BSXFlTzR9T/8M9Z8IIbpZxgFTxevDknBIh7YOIUWvET8vQxK4cnJ+6Y/7ysgueWD3SV1
         6q3Q==
X-Gm-Message-State: AOAM533CTcjuN9qytQz+uCgh7BOFv5BTlZerKXrefwa3oYHhwiPinIIe
        RGh7mZfhdxXRa+/aNlkmuK+3+EnFFAnIpDvDkpXVS3hB
X-Google-Smtp-Source: ABdhPJy8VQ4fp8xmv45stx/+eVoknbhxSQ5Cl/g9F/qzdkvop9q9bTKqMVh106e59bacchCZaCIpkqoFxhlOmcdQeL8=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr1541181ljz.144.1591174240794;
 Wed, 03 Jun 2020 01:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200528145845.31436-1-michael@walle.cc>
In-Reply-To: <20200528145845.31436-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 10:50:30 +0200
Message-ID: <CACRpkdbAeF6bVDvcMAXguFpHeEnq7DnmWswRnXjByNkH7t3Bhg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] gpio: generic regmap implementation
To:     Michael Walle <michael@walle.cc>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 28, 2020 at 4:59 PM Michael Walle <michael@walle.cc> wrote:

> This series is a split off of the sl28cpld series:
> https://lore.kernel.org/linux-gpio/20200423174543.17161-1-michael@walle.cc/
>
> I wasn't sure if I should also include the gpiochip_irqchip_add_domain()
> patch here. So feel free to skip it. OTOH if you use interrupts with
> gpio-regmap it is quite handy.
>
> For an actual user see the patch 11/16 ("gpio: add support for the sl28cpld
> GPIO controller") of the series above.

Patches applied as some of the last stuff before sending my pull
requests :)

Let's work with this as a base, and thanks a *LOT* for your work
so far!

Yours,
Linus Walleij
