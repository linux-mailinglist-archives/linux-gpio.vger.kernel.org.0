Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82B8F50AA5D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 22:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392580AbiDUU4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Apr 2022 16:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392577AbiDUU4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2022 16:56:06 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041124EA0A
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 13:53:16 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id b26so5253998ybj.13
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hl0H8r3ajkx6AoTJ0h/8Wbz3DASQYMFtnKxsp34ktyo=;
        b=lK9+4jZIPZ4+NkR82tNKiJrtDpuWaIp81H8ZGwqKgNjNCjeo9TcUh8reO1cS4Fc1Gj
         U6Y75CRMiywZeFBD/Oqd2QUXID1fktacITwJAe/1rPxSCLQpdrCqmNgbF+fipiJjPtUY
         5R7/3jDqpl9/MR3BVEpteMq8pqEYHdX/jUdSUukKSI/RlTIH2aNtZNW1ItKHMVCpAGEc
         0IItadOZ0PXwep+x3Zg5SMa5kIL792n0Hx9jGn9MWJpPm2ZuVHf7wcNWY7Dpw8l+5G2V
         JiGNTAULGBKYwZAyl4w8XY1mu1taub6lG7nmXE15BdMlqyDPOTL2xrVavMqcLJ1TXqmF
         lzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hl0H8r3ajkx6AoTJ0h/8Wbz3DASQYMFtnKxsp34ktyo=;
        b=TYpi/i3UjrOeQ5Sitt5Oh2N4vha5PWFhQxYshG5QPPMZayAJeWyRvd0Plqb9CWUzR5
         XmbRpnLp95EZDBLayIC0X5889/a1zoAAB4wdfHAoMttvcWVyr+6sajN+ftmXvnoKWJzy
         832Ie1IoHCuFYkrYY7gfPW9C0tw5vUwFIHFFoC/RcugleJeAzcQZE7XRdp9y7ItgKKKN
         XwWE+x81or6szAnFqEFHClF31dcbRU5Ja4l3XuIwAxfohanQ0U1jLrU7Lj+k6ZhrG6+C
         3izfB6ItHAHIIf3sdkYXPGASJ/Xft6jER5aruvzAS5ww3nnotDeAVgc40CHvXbwY21jj
         y8MA==
X-Gm-Message-State: AOAM532v2p33J+vduCyawdVlhBHYDLGi26nL9uvHLk2oAGKNUgsbwiW2
        9aipPWpWEyay+oDhm/n6gpPdklUWw94hPxW3xdVipJoiqVU=
X-Google-Smtp-Source: ABdhPJwuvy9tzcDhL3Lnh2WphqIyV65ZbZ2R5EQeMB9S2m2QVQ31xlKa3/XiJSEG9bVC/Sexkm92LNoD6rYq2V93a60=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr1662875ybb.514.1650574394711; Thu, 21
 Apr 2022 13:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220419071503.1596423-1-patrick.rudolph@9elements.com> <20220419071503.1596423-3-patrick.rudolph@9elements.com>
In-Reply-To: <20220419071503.1596423-3-patrick.rudolph@9elements.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 22:53:02 +0200
Message-ID: <CACRpkdY8Xm0L-NY3nzySnDiP105BvonE-LJkSH=vmeMNFAPuFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Cypress cy8c95x0 support
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Naresh Solanki <naresh.solanki@9elements.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Patrick, Naresh,

thanks for your patch! This is a VERY good looking driver so I don't
think we will need a lot of iterations before it is finished. (Famous
last words, but it looks very good.)

On Tue, Apr 19, 2022 at 9:17 AM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> +static const struct i2c_device_id cy8c95x0_id[] = {
> +       { "cy8c9520", 20, },
> +       { "cy8c9540", 40, },
> +       { "cy8c9560", 60, },
> +       { }

So here is the ngpios for each expander.

> +       chip->tpin = chip->driver_data & CY8C95X0_GPIO_MASK;
> +       ngpios = -1;
> +       if (client->dev.of_node)
> +               of_property_read_u32(client->dev.of_node, "ngpios", &ngpios);
> +
> +       if (ngpios < 0 || ngpios > (chip->driver_data & CY8C95X0_GPIO_MASK))
> +               ngpios = chip->driver_data & CY8C95X0_GPIO_MASK;

So why should this be configurable from the device tree at all?

I understand if not all gpios are used, but we usually just expose all
GPIOs on an expander.

Yours,
Linus Walleij
