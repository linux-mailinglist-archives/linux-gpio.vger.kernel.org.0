Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAB152D3BD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 May 2022 15:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbiESNRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 May 2022 09:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbiESNRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 May 2022 09:17:09 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC33C3D28
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 06:17:07 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id d137so8926783ybc.13
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3sUY19GyIG12NZLSdAkjxx301GK+rduuDLAdw32x6M4=;
        b=K7PUUlvSIZwD7tSfFGGgz2BGsQsPghltwxCtZVaDs3tOPU0gwjnHP+E+50K4ou7MXs
         WwtxalC/RYiop7fAAFCcpppSo8VUnenJUxeA4UXuWo5vmNalmFzfufVFaL9WercZMYmI
         bbylwdFU9hk9cejG8jkwFMspPUSTHHpJuFEoRMcXP+MzQ+80mxW9NI+8VNjb5/3SaqI/
         2zdr7ceYpeM0ABpR5hfvDDyqfhPx7RO7FXilF7HwCaroxTV7tbQxrMXLUk83iKVDyvGm
         E/U01edrPY8sHxm1XYwhPGf4IFK/F+C3RINdNVLWdLaZ40Rd/XTUWKx/PgaaqS+cLr6C
         ukkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3sUY19GyIG12NZLSdAkjxx301GK+rduuDLAdw32x6M4=;
        b=SHRwifCpz+q/+ehvz9lEq8jikSzYBEpzJOqJ3o5KI0VYHfQAhtYhB9A/f7fsvc3b7Y
         axsFtHATBRoo4C5bICScbEY8pWGFTfMniEQlIMlcFh8nim+LRSuo91bulCTJUXx4+UYJ
         C2ZXa6QX5DvYJA1nJy0UBzgSTaPBiXAS4j9eioiM3SnMuVGEjLEqV8BxpSqPXVHUueNh
         JF45sJfF7KkUlaTxySr74EFtR/xqhVUxuB1kwUZ95n+DTKrvy/NngaHPGRF8Kmwzpk6J
         oB/8CV+8kb5U2th3iPT3CAy8HhkqDuywAYEiHp1cjJ6h0zuK+hwzh1pF4UCNOw0EvMjT
         3pfw==
X-Gm-Message-State: AOAM532BJxezZBCZfqZlN8zCFJQnkWbzJymR8XK8+SX6qtRxGCO6IEd2
        qqd+CAnpAl8ULn7xfrnlnwKPcl1eZGUIcAcIrmYBXQ==
X-Google-Smtp-Source: ABdhPJzisHzH95Hrh5acSvOJw3P+Lcc8zZsq8YBW6sPvP9iJzJjmv806G156YRLRSxDx/2NX8NJLkXVg1hJoFcLXnbo=
X-Received: by 2002:a25:2c82:0:b0:64d:62a1:850b with SMTP id
 s124-20020a252c82000000b0064d62a1850bmr4519321ybs.291.1652966226763; Thu, 19
 May 2022 06:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <5eb66be34356afd5eb0ea9027329e0939d03d3a0.1652884852.git.geert+renesas@glider.be>
In-Reply-To: <5eb66be34356afd5eb0ea9027329e0939d03d3a0.1652884852.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:16:55 +0200
Message-ID: <CACRpkdbW7iSPGkWjV3hWOPv=rJ9VL1Ct2if34nVVhhOB+WQLog@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 18, 2022 at 4:41 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the starfive driver:
>
>     gpio gpiochip0: (11910000.pinctrl): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the starfive driver immutable.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against linux-next.
> Boot-tested on BeagleV Starlight Beta.

Patch applied!

Yours,
Linus Walleij
