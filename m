Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0728F6415A0
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 11:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiLCKRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 05:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiLCKRC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 05:17:02 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C30A86590
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 02:17:01 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3a7081e3b95so72281397b3.1
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 02:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFhvss5aMmQ+kv0KSTC8kHK4WCB0iwiEKwFY3zES3lw=;
        b=V+vi7iKVKjgiAHLkEo0H1N3fJ5hGECkiIG/Yw62WwVU+lxhpxriYXvZNuJmxyvi2d0
         HfT88d77NeBzFJVq8K5F8Q3zl30q4ueYuRPVcjF9Gc86wQQz5ZdnwotIeL3CKXWOX/Mq
         07RwGWNBKZjRYmcjt7yn4GIscGYEDKdw/Y0mAPQ3KrepmK+9ObNOfItNiBYDC5mQuDtT
         K+DRheOibopStci2oy/BIVF18GQvugereM2nRnU+vytd2N/8MDtSklxp+GiD9scNv0gF
         Z+YKhE0XsfvHAsYCe33PkoOQGq7pmQ3JeBAMsPWH8MOjHUER0Bhr/4XwrxBOV12W+a2m
         FisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFhvss5aMmQ+kv0KSTC8kHK4WCB0iwiEKwFY3zES3lw=;
        b=tKX0Ps5pk/8706sZ1l/cs5k6X/Njyv5hwngjdsd4T+y5wjUOhq3pyTcEqO3k+sXJO6
         kG0I2L9eonkJq27yeh3krDrVZ99Ef1IlBdCGtwKMZvaCfdvwM+vC6cZXWN/OMH/x7O83
         jHWj/0CKmV+S8d19Cw0aE14GVWoiQ4X1r45PBmE0DGACTnP9jELAtuy1jInKzuCvDWeO
         7xYwvw8HJsWYW03Q349zhd8nOy9FC8bcRbgEbpQ7IIWbInEPFgGmxcCBCmrqj1yt/GYW
         RIHKozS/CZCivlBUW3CDOhJa28lZWdodsRwxw79F2MDjwmecy7NXe7QU9Rswz8wyUAH6
         LnpA==
X-Gm-Message-State: ANoB5pn9UxbfseU2rcdDzuthfVVzw2asQrQ6g6fBDkPJfDWhLu/6lVrI
        FfpAXYbFNRjCE9F+1nxrr/uehLiJnEJqJ8vo4f9PEA==
X-Google-Smtp-Source: AA0mqf6rcqJslJdF7Pfmvq3+Ee/rlhXlOKrZZ1PIfvQTZM+mk0hPS4YqfWfF6fdMJslzxm+SyJ5wEWn0zftNuP+QeKI=
X-Received: by 2002:a81:7909:0:b0:36f:d2d9:cdc4 with SMTP id
 u9-20020a817909000000b0036fd2d9cdc4mr54919659ywc.380.1670062620358; Sat, 03
 Dec 2022 02:17:00 -0800 (PST)
MIME-Version: 1.0
References: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
In-Reply-To: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 11:16:49 +0100
Message-ID: <CACRpkdY6+a-cWDeDAi9tNrdgG2Qv3-tqjCxJ1p9F2JP0nEVaDQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpfs: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 5:23 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the gpio-mpfs driver:
>
>     gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the gpio-mpfs driver immutable.
>
> While at it, drop of the unneeded masking of the hwirq number, as it is
> always smaller than the number of GPIOs/interrupts handled by the
> controller.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
