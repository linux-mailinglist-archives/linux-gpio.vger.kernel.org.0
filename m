Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDCA0CC592
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 00:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbfJDWDv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 18:03:51 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46576 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbfJDWDv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 18:03:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so7922034ljl.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 15:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7VFtrYB8LeEaQkJ1DeJb6d8IbIcJQwakcs9Nbpjdm8=;
        b=B/IeFnkkWS3RpKsuLqD1d1bPI4D7V/8A7MG4m7yUC2cY+9s4Q75dqxAlyR8PcF79z/
         UOJkyDyxtiS0NZpzhMffx6CmSGqYLlNm95JLYvaJrnl3f7q7zgi1K2jKCpJ4lHuZapvG
         FbRAvMqIY8ZnzyPbAFLiM4zCQ31RpsgNx1BnXNjeVewFxVt7PIG8MEhV3et2lSf3CFpe
         JcFsTc0AQVR1XcX2PqPUuPNmV1BsFDqAWozTFETRpyVmxzBB0Ca3gUajWcYyScSthkkZ
         miMnbbhj4c2ECvLJCbVJkfJCbUYJn1boYB2dtLSPhubRtu0uHVcvcWMZXJO5i7lOnday
         Y6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7VFtrYB8LeEaQkJ1DeJb6d8IbIcJQwakcs9Nbpjdm8=;
        b=QrdMEU+PFsPJIaWrbY5qgEwGhTs6I6+Hqb2T4uZzMPAi7axmn4pOuYMWtQMVdrjmt9
         PXkB8A6HoxPTBKJ7yuw3lvFM5S43fp+FPDC80OZgVAmQc87OhxpJeN2qUuYCWJ46aFBz
         7Q5LP36QaWMEnjI/curgH6YHKFuqfOlpRn+XFaNbXas0bh6ePxhseaiQ9oPEg+Ax6T9Q
         aybByk6Cr+0pa5kes3aWhuOVcUSjrVRSDfHdsbvDt09+taMN1VNEI0brnl3k/Soc0tqc
         JCJj4TYvJy6OOKMiuo/fH1DqW53MB8T1or7RE49s3EmMVrlj5ukq4HhRUugTomIcjPOr
         7YIQ==
X-Gm-Message-State: APjAAAWSMc5DF6kobZ5MqwwhYZPApCXHBxFLkFFoeYhR8N/ExTRKUS2c
        Lemc1VpfVg3G3g25lZMwr3iS2dE7BChYCPQ4ibkXp9wD4TM=
X-Google-Smtp-Source: APXvYqyayLEeP5GtY+NODuGBcU+zsbAld/JABRRGHZCAz4et/eo3y8m/dSZIPA8S70tZ6ZYfJ0ig358jv/pC+9AXJKE=
X-Received: by 2002:a2e:9094:: with SMTP id l20mr11194298ljg.35.1570226629592;
 Fri, 04 Oct 2019 15:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122825.3948322-1-thierry.reding@gmail.com> <20191002122825.3948322-3-thierry.reding@gmail.com>
In-Reply-To: <20191002122825.3948322-3-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 00:03:37 +0200
Message-ID: <CACRpkdYhSu9feBKqFA4wGdWP81fgjNYPHCdC7zaZ+eqO+caw5Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: max77620: Fix interrupt handling
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Timo Alho <talho@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 2, 2019 at 2:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Timo Alho <talho@nvidia.com>
>
> The interrupt-related register fields on the MAX77620 GPIO controller
> share registers with GPIO related fields. If the IRQ chip is implemented
> with regmap-irq, this causes the IRQ controller code to overwrite fields
> previously configured by the GPIO controller code.
>
> Two examples where this causes problems are the NVIDIA Jetson TX1 and
> Jetson TX2 boards, where some of the GPIOs are used to enable vital
> power regulators. The MAX77620 GPIO controller also provides the USB OTG
> ID pin. If configured as an interrupt, this causes some of the
> regulators to be powered off.
>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

I am looking for ways to pass also nested irqchips along when registering
the gpio_chip but I guess I need to clean up all the chained chips
first (getting there...)

Yours,
Linus Walleij
