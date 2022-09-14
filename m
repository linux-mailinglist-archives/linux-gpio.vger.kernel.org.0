Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DCC5B88C5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 15:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiINNC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 09:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiINNC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 09:02:28 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFB16050D
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 06:02:27 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id e17so22143494edc.5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nggFlyUvQYs7kmnA4dMoS3/ODlgPJKnMU4CNmsB3Hcs=;
        b=JkM1QUk1pnFBFpGEVOEVLdMsMLqrNrczqCtXvhxVu3UiT0//DUuQX8DAX2/tfRcWtg
         GVFxZ1RPpO0KEwUKYh3s0+H0OmeIzdWz38944Zz8OghYlsegxPCL0repD8O7SbJS0G1K
         z0vE4vuYzA9ZkIP9Ofbs0KpSKHPv/trM2c0bOcsTbNXwL7ELBU3iLkl20LiT2Pn/h8Xv
         vn0DgjA/YuFPCWeCzoLIJ/RYS9tuDjwhzbGuHww1DfjuBhzvogSLUb/WiupD0zYBi5VE
         944RgWQK5IAvyfstOd+tNREIOe3FzHZvpPPQY8T3YCqrNwMTqqjiFAbcKfespDrFaPXM
         iB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nggFlyUvQYs7kmnA4dMoS3/ODlgPJKnMU4CNmsB3Hcs=;
        b=7eNNlCJFJ6E/3k+Xlr1izVtF/u6HkjLInaftqej0z+jNChkuZBIbLbT1JmIIngdAge
         7ioAEaMeF+ZOLTXoxhoWHy8aRh88iMhxPTMd/C6QB8RDqgFJZytpn9h6VxinUyybVZ9q
         E21FofsMAPjmfnoMi2VHMeWyZHqbWXMttZweVHeLk5oUMD9B5rJMEYm1Kc2v2yC0i5eD
         T1kew71ZmB10GnSdcR6NqNz2h8CvwfOg9N+OfeITjOaFWNW6KfMQObfMlJIFVnWgRDwL
         eDcTtaIl/RO655Q176axmShKhYTVhk28hqZbrF2+1JqYliirsI4i9cP3w/zjOLGbQhAy
         s/Jg==
X-Gm-Message-State: ACgBeo0bmn4kw8TL2gsFCyiwQjrLZLdnh6DUQPiOTKEjSewk44+aHkiV
        iYi9wo4oemVq5lAg/Qhyf6xa9dINUv2Ahii6Z5BrfQ==
X-Google-Smtp-Source: AA6agR7iZTPSanpIBz20rZA3HaV9DSMJnNr4+QN/AbJ3QvTXv0wgBteqQE3GdTA9EC1iVDm9MiX/9o5pxixrbQW8340=
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id
 w16-20020a056402269000b004523a858b28mr8420541edd.158.1663160545711; Wed, 14
 Sep 2022 06:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220909145942.844102-1-horatiu.vultur@microchip.com>
In-Reply-To: <20220909145942.844102-1-horatiu.vultur@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 15:02:14 +0200
Message-ID: <CACRpkdYWP4ASoO4wWSEgdCPbNLsx8fuHn_-oqnD+ff1TU84ieQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: ocelot: Fix interrupt controller
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, UNGLinuxDriver@microchip.com
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

On Fri, Sep 9, 2022 at 4:55 PM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> When an external device generated a level based interrupt then the
> interrupt controller could miss the interrupt. The reason is that the
> interrupt controller can detect only link changes.
>
> In the following example, if there is a PHY that generates an interrupt
> then the following would happen. The GPIO detected that the interrupt
> line changed, and then the 'ocelot_irq_handler' was called. Here it
> detects which GPIO line saw the change and for that will call the
> following:
> 1. irq_mask
> 2. phy interrupt routine
> 3. irq_eoi
> 4. irq_unmask
>
> And this works fine for simple cases, but if the PHY generates many
> interrupts, for example when doing PTP timestamping, then the following
> could happen. Again the function 'ocelot_irq_handler' will be called
> and then from here the following could happen:
> 1. irq_mask
> 2. phy interrupt routine
> 3. irq_eoi
> 4. irq_unmask
>
> Right before step 3(irq_eoi), the PHY will generate another interrupt.
> Now the interrupt controller will acknowledge the change in the
> interrupt line. So we miss the interrupt.
>
> A solution will be to use 'handle_level_irq' instead of
> 'handle_fasteoi_irq', because for this will change routine order of
> handling the interrupt.
> 1. irq_mask
> 2. irq_ack
> 3. phy interrupt routine
> 4. irq_unmask
>
> And now if the PHY will generate a new interrupt before irq_unmask, the
> interrupt controller will detect this because it already acknowledge the
> change in interrupt line at step 2(irq_ack).
>
> But this is not the full solution because there is another issue. In
> case there are 2 PHYs that share the interrupt line. For example phy1
> generates an interrupt, then the following can happen:
> 1.irq_mask
> 2.irq_ack
> 3.phy0 interrupt routine
> 4.phy1 interrupt routine
> 5.irq_unmask
>
> In case phy0 will generate an interrupt while clearing the interrupt
> source in phy1, then the interrupt line will be kept down by phy0. So
> the interrupt controller will not see any changes in the interrupt line.
> The solution here is to update 'irq_unmask' such that it can detect if
> the interrupt line is still active or not. And if it is active then call
> again the procedure to clear the interrupts. But we don't want to do it
> every time, only if we know that the interrupt controller has not seen
> already that the interrupt line has changed.
>
> While at this, add support also for IRQ_TYPE_LEVEL_LOW.
>
> Fixes: be36abb71d878f ("pinctrl: ocelot: add support for interrupt controller")
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

This v3 patch applied for fixes so we get some rotation in linux-next
and get the Ocelot kernel in working order.
Should it even be tagged for stable?

Andy had some further things to think about, consider these
for possible further patching.

Yours,
Linus Walleij
