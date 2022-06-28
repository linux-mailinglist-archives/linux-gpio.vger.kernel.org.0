Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D75155E717
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346960AbiF1Nwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 09:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346943AbiF1Nwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 09:52:50 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4186DFF2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:52:49 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-317741c86fdso117821787b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9upcBG0MMkWjokT486LIbH25iwXepLGTqHnlYogNOEY=;
        b=NcSg2PNgj9jzoGvu0M+Ne6MJkj3SU7Cyyf74+X1VWhPOM/JZ3QtfuYLUlbRYnpUKfD
         j9zSF7BulNjjY5isG6haWnfY7PSEa1HpcHMPmkq7ICp/nQYMN9yns9a4wrNOxGsWIV5N
         fj/TFcRcnckkPIvIFrw4rr6LAWgozasMh2vTJRfQM9v493ghlTY8LrkUiUsRYUsaGCFV
         EcnzeXjBJ1Yjh3LhbHmqq+gaA+NoUMv3pzTU2VH6Rv5En0kSMFODZmIIbplwYUbXSBiV
         dZTTrTa6XY7oLPZGTWGVZxmPV124tcc7Q7BqM9YPsERic4J9U8CzTPOJZboaKIM6WxaT
         c/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9upcBG0MMkWjokT486LIbH25iwXepLGTqHnlYogNOEY=;
        b=ljts0w8tyt9yuSIaVnhpe0VK1rMBZ1XtzcBmTVqp9GZd0YdMRYMTtIhPFodOHTv53Q
         90LoVxCQLb/qByT+YMc1W1E4JdJqlVbnnBZyejXeTOvwO0d7jlWf4P72Tb8OzejswZE+
         nG+CbaLvMYOqSA860PVHLGd0RyniKBxrp0KtEIaXX/1rinRrixIrPHj9ayUu5UqFMXyV
         fZ0TRzNvlMwExxjPmraGPdHRISGWOFqgoxszXCq9aIBXg/HzR2uDRAbIoKcVvD57vpvE
         zmf2LlG80aCBbHZSKoIbTy9xhp1QhXUsGoQibkPuTAj/gHETje9PxjZmeag4qLb9WGgj
         AJFg==
X-Gm-Message-State: AJIora/hphdWubUAmpDMQOP6hFgAX04SedV9v4zTE3ORlH+uwmzcopkR
        6+13wMAsiIi/q5Ky7szl0goUoG//KQyr5+EeLFLyklsBdPAwsw==
X-Google-Smtp-Source: AGRyM1svsZstAnVyKZcSo4aSnNDXoorFrsgBhav2DdlBbI8yV5im1Z5GT7JHDXDdnUYGFMbclrnWlsJ6mdvr9wNdUuk=
X-Received: by 2002:a81:d05:0:b0:317:76a1:9507 with SMTP id
 5-20020a810d05000000b0031776a19507mr21678625ywn.151.1656424368411; Tue, 28
 Jun 2022 06:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220613054310.21186-1-a-govindraju@ti.com>
In-Reply-To: <20220613054310.21186-1-a-govindraju@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 15:52:37 +0200
Message-ID: <CACRpkdZB1T1cKQcNDiriCdeQuHGMH-9BvV=a9mP21YENThA-bQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: davinci: Add support for system suspend/resume PM
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Keerthy <j-keerthy@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 13, 2022 at 7:43 AM Aswath Govindraju <a-govindraju@ti.com> wrote:

> From: Devarsh Thakkar <devarsht@ti.com>
>
> Add support for system suspend/resume PM hooks, save the
> register context of all the required gpio registers on suspend
> and restore context on the resume.
>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>

Hijacking thread!

Aswath, if you are testing DaVinci boards can you look at these two
patches:
https://lore.kernel.org/linux-gpio/20220507124536.171930-1-linus.walleij@linaro.org/
https://lore.kernel.org/linux-gpio/20220507124536.171930-2-linus.walleij@linaro.org/

I resend them every new kernel release but they never get merged :D

If you can test them, maybe I can queue them directly for the SoC
tree.

Yours,
Linus Walleij
