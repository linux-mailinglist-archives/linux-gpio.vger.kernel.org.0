Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B34E55E5420
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 22:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbiIUUEq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 16:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiIUUEm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 16:04:42 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B55F12ADE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 13:04:39 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z97so10341719ede.8
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 13:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5SzmEU5uFGHIMVBxtfSrpE8XTcmMoLba7c07JMSX94M=;
        b=jqHxXUWSw8KYNEp6iKPNjSYmp7GdqAtepWcsIdNZ1kBO3CXElJCRA2nr7gPcn1y0xX
         Kq5OkI0I5tFbrM8ELjAjFko9r0omPMcpOCg19L01KjnS5o22PbdLRc75HlngNu+uR2jI
         HmE6rAqUmscei6kcs3DgDtiJTRQmecfgjEVEA6u+v+XohSNqjo8EjAz2zwTPTHT5QPOR
         JJIi+dXUvSARpAAcOSPQ0yHSf5S98FOQuSY5n5BYYBRxVBY0k2MtyttnZhgwLrJB9Pad
         Xkjs3qXwiLq9quF46t1Xc4aqeCoX91S9rT9xEQlal3W6VQmKtq2HDOh2hX/1wXqMSHJC
         YWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5SzmEU5uFGHIMVBxtfSrpE8XTcmMoLba7c07JMSX94M=;
        b=YfsbsWmYr2TqIDYjEIfroCMH+6sA7pcWnGgPJrtiqtlk0sU9HI81ZPTFZlknXCYDhJ
         U/54sXTavtdc7N5AFgkQGHQR0OgCFn22QIzdqLxOWHRZpkJYOfCgeA5rvz2+OOZIMLem
         IUx+uBX3ymuB5Ipu6ofp4/oubFlKIVgDfm3HNoAGHsEWAqUwbNyPD71zEJ0GiCV1/fW6
         pjEjMzZ6PZpyLiXVH57mThMapmX1LISCCaFDGQSHG8kCWKSbILhnw3mCQ4mqL/SK6AiE
         WpLO6tNaexsh44jZrp4lJL6n2KyJGUfl9nJrAjRzanTfh/BiqbhvjGuKqyHz4AM2uruI
         g7Jg==
X-Gm-Message-State: ACrzQf0o4FMNwIvHExx+YA8Vzcukstu3sINPfkUea/vbTAythLQ4uVwP
        tRu/tls+TE3o8I8mB0cGz+l0tb3eAhZpY3j7IQy+eQ==
X-Google-Smtp-Source: AMsMyM5QWdx5gJvHaXBfcXrvmiktKPbeLPsxRIsKC2pchJljihFyJvMZPyJNJytbuaJBjyfB/y3QWvDqvADHEejMp1g=
X-Received: by 2002:aa7:dd02:0:b0:44e:f7af:b996 with SMTP id
 i2-20020aa7dd02000000b0044ef7afb996mr26767551edv.422.1663790678153; Wed, 21
 Sep 2022 13:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220921155436.235371-1-sashal@kernel.org> <20220921155436.235371-2-sashal@kernel.org>
 <fec2e2e2e74d680d5f9de6d68fb5fe18@kernel.org>
In-Reply-To: <fec2e2e2e74d680d5f9de6d68fb5fe18@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 21 Sep 2022 22:04:27 +0200
Message-ID: <CAMRc=MexqLhu3ZWt1AbzBestswqmHNpct1LQiif0JGECTjHz4Q@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 2/5] gpio: ixp4xx: Make irqchip immutable
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        linusw@kernel.org, kaloz@openwrt.org, khalasa@piap.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 21, 2022 at 6:57 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-09-21 16:54, Sasha Levin wrote:
> > From: Linus Walleij <linus.walleij@linaro.org>
> >
> > [ Upstream commit 94e9bc73d85aa6ecfe249e985ff57abe0ab35f34 ]
> >
> > This turns the IXP4xx GPIO irqchip into an immutable
> > irqchip, a bit different from the standard template due
> > to being hierarchical.
> >
> > Tested on the IXP4xx which uses drivers/ata/pata_ixp4xx_cf.c
> > for a rootfs on compact flash with IRQs from this GPIO
> > block to the CF ATA controller.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> Why? The required dependencies are only in 5,19, and are
> definitely NOT a stable candidate...
>
> This isn't a fix by any stretch of the imagination.
>

Hi Marc,

While I didn't mark it for stable (and it shouldn't go into any branch
earlier than 5.19.x), I did send the patches making the irqchips
immutable to Linus Torvalds as fixes as they technically do *fix* the
warning emitted by gpiolib and make the implementation correct.

I think these patches should still be part of the v5.19.x stable branch.

Bart
