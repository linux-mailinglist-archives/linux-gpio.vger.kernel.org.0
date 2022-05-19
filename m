Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBFC52D3CF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 May 2022 15:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbiESNV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 May 2022 09:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237524AbiESNVY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 May 2022 09:21:24 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F2C13D15
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 06:21:22 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id i11so8997237ybq.9
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/8rkuhaZCQOmIIWlvL2cVDQe2QMeTYPgrGWngEZIrx4=;
        b=qAA8lOXG8uIzKLnoeK5xsx2x0vRWX6tIuU9hSyCXncTSHBvHstrpTc1JZ2HDD3F2i3
         ZiJShiWWKUvTsCocOYW3LlqNcwSZxAw1B17JguGYGXm9o4c/Ek35ZgLsaqrPYMeRxM3h
         dtkxIKXN0cMeYzdq/p9LKfP1XzkcvsZkNkh5eLdQdw15AK5kP9rFQL/BOHi36WsAHR1I
         Iny/GWuPfSty3YalC4ZbKxm6kNV/C24UCgpxKW011EinRM7XCCpE0vvdoumFNoGNp39K
         MMqaKtM4GWk9RaCv87OsZr0ywEpbFiQ2OEArEnn88yAjH2sJtRabYx/32nWpvP/haUdB
         3vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/8rkuhaZCQOmIIWlvL2cVDQe2QMeTYPgrGWngEZIrx4=;
        b=KvYL8CZNLXG2HWvLKEsDVk3JVCgAeKIWbTorebPfL/KemEUPrAKhaJUOgfxnOoa6ij
         xGVLc5gcTdZXnu32K8SOuEA1mB1WydAke1x8euABS/WpoSpi3UMDpoEW/8xXuhA86Jq1
         BGr+7HGB1iB3s0S8PFhQm+8/EQKcWX4FaqHHiZCCStmA5oDAyduOniCrQ8JYxKkvMQwA
         3vVIviLk7CLJ0JQzcSJvkPkwDmLLbeGrQRIgLcSmEHQjT7sxcJkjnFUAC4tlUunNgdI9
         qNiyGQPrTWJPupZ9roGmXDvkhHMyjwjyau49Tlxsx4yLYttBh1cDGvk2o2mY1np5L+YQ
         17Yw==
X-Gm-Message-State: AOAM532qsCmT2UInIo2NVdY7WGF8/Dsr2wNz1BmGRMK2Gpxu3VHx+UcT
        NPNCNOOEvUR7Jw4RIkGAxgE87FLl7TlKdEhAu1mDYw==
X-Google-Smtp-Source: ABdhPJzT0GGkpIhtRDpezEb7oVDQoA8RCO+/1yU04m2HB9xz8AvRn7VrjVu0qhzkauTfGr4IKwQcrnIptuIlhYb5Yek=
X-Received: by 2002:a05:6902:526:b0:64d:b6ab:f91d with SMTP id
 y6-20020a056902052600b0064db6abf91dmr4494072ybs.295.1652966482209; Thu, 19
 May 2022 06:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220511183210.5248-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220511183210.5248-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CACRpkdYQAsam_v0XHm-A_trbyifj1pBQq5N+zc9KVw1vXVTYUw@mail.gmail.com> <CA+V-a8v_bCtoipKXyYoHsSku0-AbABi6Wj0RsHrj7_Sk4MUJyg@mail.gmail.com>
In-Reply-To: <CA+V-a8v_bCtoipKXyYoHsSku0-AbABi6Wj0RsHrj7_Sk4MUJyg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:21:10 +0200
Message-ID: <CACRpkda9xiPMa6BBXUNsoJ7SQ9N6t=K422bh0Dh4HUBnotVYxg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Wed, May 18, 2022 at 8:36 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> > As Geert says, I think you can just use .valid_mask for this,
> > what do you say?
> >
> I don't think Geert is suggesting that. The .valid_mask option is one
> time setting but what I need is something dynamic i.e. out of 392 GPIO
> pins any 32 can be used as an interrupt pin.

So why can't this just be determined from the compatible?
This does not sound like a configuration option at all but something
related to the IP block per se, and then you know that if it has
a certain compatible then it has this property.

Yours,
Linus Walleij
