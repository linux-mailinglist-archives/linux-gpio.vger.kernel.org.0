Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F8A5B739C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 17:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235457AbiIMPIQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 11:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235237AbiIMPHU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 11:07:20 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3470175CCA
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:30:43 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id r18so27946157eja.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ATYzjqxiofFOKgRzwnghpFpMpgn+VgzyJYMlMc1KSfo=;
        b=ENNd6QcV0dre8m2Oev1kiS3O5RXiRs7gffDXLpruahIcZ4s4j/8fLqKpGShC0gCYdl
         DT0M3xGHQNITQDzOQvL6oUVYUpuTpLcy8sQmSBg1vvu9/HiBJU5dMb0UeI/bLpu3pXSX
         1YJmSMzP8exAGoxWeC55Su3Cd/g9m95UorHpYqs4rWO2gyTHWgnHm9k/bFEcF2GDTnSM
         TxQ4fG8FUUaubBkaqLxADmaQtmbxdusNWvpPG9oYc6NmZXB19ZNA0CbPbWo6f7WtCBVC
         hwYYIFbmdXNyi9LSCnhLOqSpDqSvMdUQ/0rwTbgLgEuYfuFk7xE1SE7zz3L9JOS6ODYH
         +AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ATYzjqxiofFOKgRzwnghpFpMpgn+VgzyJYMlMc1KSfo=;
        b=lGJ8EvxvQ9MHtcTXoWP5xAOLcq/YRN1NrUGXMAHmgLQibOjVfygWN8qwfl8SREnV4R
         icECiRzzRb+yCLtWSMqT1ovJKVcQNzhmOZ4eSxRFfMDWEbXI1HYBM2f9/jIMcnfGMeeY
         w9lRNQe6zs8SczhIaG+wj0HOdS4bW4W2phl0I2augnZWambhjPcz5Cvz8uy5SYqm+rIG
         8fe1F4GkWFrdYafYbdSC3anIys/rl1sJIFhWfwolBp2Q3H4xCCTPKrSsoDJBQxmbaxsL
         x4fu8LbBEe6Diu8FOQXLW1Fu5N2UoLXW+HWVOu2g0yIID9YumGxeIahDKHZsrdkT/FDo
         /w9A==
X-Gm-Message-State: ACgBeo3/GyZxNT4sQoWXWlFCR4syliBW8ANuBpNsmSYdOenhV6cZNOZv
        5WPXA/Tb0z+PB0diAwcTJHRpSeVF4RB62stRKgFVsQ==
X-Google-Smtp-Source: AA6agR7lpAZ9vhLfhXw7ROpkE+pw1Y3OAih1fHaTdwkD4TU8Pbz4VQU2lbpdHfZTZyQ54vxkJpGCEIQ5ZeB0yRL5A/k=
X-Received: by 2002:a17:907:3e07:b0:774:53ba:6b27 with SMTP id
 hp7-20020a1709073e0700b0077453ba6b27mr17595069ejc.286.1663079369450; Tue, 13
 Sep 2022 07:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220911190751.1788625-1-linus.walleij@linaro.org>
In-Reply-To: <20220911190751.1788625-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Sep 2022 16:29:18 +0200
Message-ID: <CAMRc=MeZgxPzq=gynM=xLT68LM3VSQXpsJ6ES+BRsHhzNBgNuQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: ixp4xx: Make irqchip immutable
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 11, 2022 at 9:09 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This turns the IXP4xx GPIO irqchip into an immutable
> irqchip, a bit different from the standard template due
> to being hierarchical.
>
> Tested on the IXP4xx which uses drivers/ata/pata_ixp4xx_cf.c
> for a rootfs on compact flash with IRQs from this GPIO
> block to the CF ATA controller.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
