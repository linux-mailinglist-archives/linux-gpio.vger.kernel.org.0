Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058444D9ACA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 13:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348123AbiCOMBV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348132AbiCOMBV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:01:21 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931F652B31
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:00:07 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id e22so1148549edc.13
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZNi6P5J7xjhVvzZZPgMzNCO8H/PUFuk2K/uVX5JC1zo=;
        b=dYebaaJqDZssHe5bUBXwhvzqTgCaaP6Y5RHUryl2SrBlwSJfyRGJ3Kaqvh0p3cPmBO
         cPodZz2XYsmfpQ2BOw1PzZdn/jxs5yDqbBJxeIunO+XIbf89GNSVFq0qQrmFF08FFRx0
         SJQmzQ+wVJP+aZLQObOQ52Z9mzMbsTXEqZZXTzpmtP1r82pPnpK3+4VEKdPwut8u2MtO
         ABTgeKxTXIhQojAllivozBpwA6kGuQ2ZqmMCo/nH4JYdc9qhyo00kxfUnt/a+ptfhwc5
         yhkhsiUcTXKc8kboMgiICQU0nARZcU70bvwQ4x9xPYxPcCSra0YKP1JMV4FtoSIzOKHE
         pkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZNi6P5J7xjhVvzZZPgMzNCO8H/PUFuk2K/uVX5JC1zo=;
        b=oOGPrEkZNu1+aO+PDGYYmpVNzz4Pbi4hhVOlj2S56VmbOP/CGj7pFomobIpXa1DnoM
         SI++GHf1QXOu7F34+T0fVmw4+JhSRbQZXhqC9bLO6p4PYw6KOYKEVy3LqhqDGBCBslfi
         cM1O9WPnCS/9qN9rHCBvN3Kl9CnDR9pw1UHwqpw8JvK3aLWN4GNKrkvPana0yycolkws
         g2/jRzUEiO78l+Kpm3mxZrouupTbOv65Qd0Rvf4W72KSPeO5FupU8r7Et8riY3jf2l7+
         uikeP8ZnBBX9gOPbfsHjvvJLnHdFF8ogX8cYqdjKbaPWBK3tdKsv7gpBPev+SHoh9XUJ
         uZNw==
X-Gm-Message-State: AOAM530qmkeJaraMXQtfx3oACL+7xjdEfPdDLT9jBHIl9dJ72SwXsL+I
        fSWVc+R/uasThembkY4QJF2LAo5q7SDB9O2htGOe60PrhLEvZg==
X-Google-Smtp-Source: ABdhPJyqC7aCwWeaa7dwgnOICXtuvKuG/TGzH0KfXL2hqE+Ia5lBolq7biSJ0WTX4DAlln7zV/oUSDxo2cd7IXWSH48=
X-Received: by 2002:aa7:d706:0:b0:415:a00b:4ee with SMTP id
 t6-20020aa7d706000000b00415a00b04eemr24825000edq.373.1647345606181; Tue, 15
 Mar 2022 05:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220315053220.102934-1-warthog618@gmail.com> <20220315053220.102934-3-warthog618@gmail.com>
In-Reply-To: <20220315053220.102934-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 12:59:55 +0100
Message-ID: <CAMRc=Mf9pAWiKeR2GH6PQX=bUOvWXoyWUP2aY+5grzqoAn6M8A@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 2/3] core: split chip_info out of chip
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 6:32 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The core library should be minimalist, only performing the operations
> required, but gpiod_chip_open() always fetches the chip info,
> even though the majority of the time the chip will only be used to
> request a line, so the chip info is not required.
>
> Split the chip_info from the chip, in the same style as line_info, and
> update methods and tools appropriately.
>
> In the rare occasions that the user requires the chip info they can
> request it themselves using gpiod_chip_get_info(), as demonstrated
> in the tool changes.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Ha! Interesting take. Makes sense. I queued this but tweaked a couple
things (some bad copy-paste and stray newlines).

Bart
