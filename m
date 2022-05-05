Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3404D51BFAA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 14:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358992AbiEEMp7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 08:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240449AbiEEMp6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 08:45:58 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1709254FAC
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 05:42:19 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g20so5047736edw.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nToHf9Yxrt+r3K1vMdQKligyD+NhWuMXaR0L1laGIcQ=;
        b=MIGeaU48Hxcr0gAk/0JUERKudMJ+2VgGvtXQOyQR2FUEQeC8eFnEf5W06jJVA9iQfU
         +IG5oyZaIHvk1wNlDTpmYhOH8uLeDZPV4etYWxHGMqd7p28h9+iY0E03t+Z58hHrTiHZ
         Gqvid7MFQkRM2KTWd8vs1lxMo6aVE3S83f3+qzfkkL2LzrOwKU/YoJgs49dHnyOt6n2j
         piYz00xlNGfUgi78mOiyQ31sAwWJuqxkjm+KxvB42oQSXZPiFZfrtXhS68YI2hANPBQ9
         cMhT6NwUeHuY62ICFtRx9YBHEpchMriV7lpMAkoiUuZrCsFFtmbFFfH9rVp5pH5VwyeZ
         wWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nToHf9Yxrt+r3K1vMdQKligyD+NhWuMXaR0L1laGIcQ=;
        b=KNOLkuutu3iOrB70/1QwN7seQtO/ZQ6CJkhSm84Isdee/igNgiV0nsFyL1AVQU+Bds
         QGhC1jOUctqGGK00JgMfZyo1mJA+fylmGBtdIqn49CxGboOLpatssF/iJXuvNBeMgyRf
         oHJdOqMeufdHQCgl6OgkZZAqAy5nB8CHlsF+lwaLBObw8ULrHnuUQW1tPY4C1orQap9w
         Yr+h66M92xeRpOSxSf5K5/5n2w1UZjJb6TQsiElvTQd7lAq3SzQaOmiKs8XBS7I/nm3q
         geJeNSbBRlpuIxVluToN0vjDHwQRnJm5awtqVeV9dE+oRQ9CwxippglqG9lxPhNxHitY
         Bo1Q==
X-Gm-Message-State: AOAM533gKKIEM98laHKePr9fLCP1VcWm4DuHsnmJ59CDyTIjw2rr4whv
        8Wqt7dyDWko8UCpBAYWtfQLyPlIPEAgU5NHUg5B8rw==
X-Google-Smtp-Source: ABdhPJy+UBUQ27FMN0Soniwr9i5FVjEAqUBJaKMZp7kF/Zi2oKeANJCiph04E/neh8RBlyNRknfzqdKMu9O4zIR2y1s=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr29329998edb.288.1651754537667; Thu, 05
 May 2022 05:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220504144406.36744-1-jonathanh@nvidia.com>
In-Reply-To: <20220504144406.36744-1-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:42:07 +0200
Message-ID: <CAMRc=MeXUN6P8kWxB75GsXdKD7Owz9mX5HpgfQoMGeJh-z3=Rw@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: max77620: Make the irqchip immutable
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 4, 2022 at 4:44 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips. Following this change the following warning is
> now observed for the max77620 gpio driver ...
>
>  WARNING KERN gpio gpiochip0: (max77620-gpio): not an immutable chip,
>         please consider fixing it!
>
> Fix the above warning by making the max77620 gpio driver immutable.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Queued for fixes, thanks!

Bart
