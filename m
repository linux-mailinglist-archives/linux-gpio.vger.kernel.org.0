Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2915A51C310
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 16:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380847AbiEEO67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 10:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380880AbiEEO6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 10:58:53 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D09C97
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 07:55:13 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2f7c57ee6feso51407497b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 07:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aGHiFO3Q2GyTnfB7Hhe97atxz9YJ8sx20qf9bbbh8jo=;
        b=VFh+snB9uGYQmmKtSbOCoSL8JSFtaNxu2zjGmnaWE9f+P24swIN4CwpvPFCiTmB628
         54hkjrMLWS3tFUDpDwJ4ucT4uHnT6B1BkgT38p24AQDA6NKt+F6EUMVzD3R3K2BOavDL
         xjwfg7WGPF16Q9jWNhiEpU1P0xJOUOzBhsWNtjzQjzbKxchDwjGZBr+jtIZFm3tLAY8J
         4eQE98LGsT3IC/DEU4oFJk3os0o/RRc7mNal1DrKji7OvhOoKROfHtENqL7cepYScYsm
         nHRW/F7NiYhTVXGlZWWWRgBnPO+yMZizGlIFUm2nrgsP2gGW/j/Tckcsc08ulup4jrDo
         V9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aGHiFO3Q2GyTnfB7Hhe97atxz9YJ8sx20qf9bbbh8jo=;
        b=Lxh/d88z58jT31duAf4r1Jf6IG5bZyryl4K4oD0vsb80BekU7+UxmekYZiumcdr2Qe
         45iGKQS9MFdyCBWp4fP8L6daZMQk6EXWEaO4/j2LteXExkj+kwVnZFZZ8P03b69XzF1U
         5Kt6phUF6yBOOM3pbgivMy8ry0aQIqFRa2H/Imo17x+w/7FNu2fpkfpeG4VGR2fMpCcZ
         MSAsm+RB39Y5dIg2ZYrj0UK8DwhRfqDlQU9G7Rw1i9mcYOkwhsL4btoQNhHIceGdpd6C
         yg/4SZsF0JlpO/q6eIFUub1PJrzgbx1Sp4fAswWB/w6Dp9dmIkaoc/pwKfOX1cFuwpBE
         ewrA==
X-Gm-Message-State: AOAM53253WNPy0GrpX91B9jd5CDnX4BpGHiuIREDQEty10kW8L4vly5v
        4+V3nO5XRA9gWrLrr1XVnWE4P7UB49Od5wCoLl6/Ow==
X-Google-Smtp-Source: ABdhPJwZc6opbBFF0AOuDeLOhjI04yiu7l0ndLHKUYTUT+szpJdEcuwMXuAdroZkyOb5a8tN6a5PD9Kx4r+L4KF5Ti4=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr25016995ywh.126.1651762512406; Thu, 05
 May 2022 07:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220428111622.1395831-1-michael@walle.cc>
In-Reply-To: <20220428111622.1395831-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 16:55:01 +0200
Message-ID: <CACRpkdZjsdkq2KP-k0pwB5KZo25AeTgW_-iAZ4K84A=s1_+gnQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: microchip-sgpio: make irq_chip immutable
To:     Michael Walle <michael@walle.cc>
Cc:     Marc Zyngier <maz@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Apr 28, 2022 at 1:16 PM Michael Walle <michael@walle.cc> wrote:

> Since recently, the kernel is nagging about mutable irq_chips:
>
> [    4.967050] gpio gpiochip1: (e2004190.gpio-input): not an immutable chip, please consider fixing it!
>
> Drop the unneeded copy, flag it as IRQCHIP_IMMUTABLE, add the new
> helper functions and call the appropriate gpiolib functions.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Patch applied after pulling in Marc's immutable branch.

(Hm a bit confusing since it is a immutable branch with code
for immutable GPIO chips ... I assume it is both.)

Yours,
Linus Walleij
