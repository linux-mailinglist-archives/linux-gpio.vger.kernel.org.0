Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82BB4C58E6
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Feb 2022 02:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiB0BVE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Feb 2022 20:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiB0BVE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Feb 2022 20:21:04 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6242924EA36
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 17:20:27 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2db569555d6so15754997b3.12
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 17:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=khBiOr8slJchZEaJlLVeLW0g6vac+i0W/8rPUGI50KI=;
        b=jr8Bd8UekPaxn34A53MoB8zITCmTMQiWmxvdHZB8HA93muwdIl91Y/1PhALdhIN+3F
         DmGIIAQfXIlBTdytlt48Byslm+rDWBc5gAED8iGGedfxKbV4aEHkd141bhrFi59IFF5a
         tGuAOXzPeRAMgBzHWoVjOEH+Jq6V9pdr95giW9bs8u5ihkSW7wjF0NxXGMPV4aJnwakM
         OEnRLesjvVxnu4yB8PpM+pb6jYd6EHEmD+zuJ8ZMEgfcaUSpAZN8JBNyF4VJfBkVRf2O
         rRBrnXoamDqcSUiyIutTiulmO4FVQ87bzhJAI3Jk3gwzRl7carC8n+o+UYb9kCRylhuf
         0Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=khBiOr8slJchZEaJlLVeLW0g6vac+i0W/8rPUGI50KI=;
        b=njES+vJCFDBy8i+emL60VeWNEbctRZ52Dp0HVj72lK5JEWjd6hoTN1U88i/7k4R4Tq
         klAhrlANDQoZn33hvzedpx2rh+r9r6NYRoKQy5kzEEHYKBRRdggtf0asnWxUTlgHvpNI
         w0pdeW/hF476RHT7ddu/IkXMFtMYT4sXjNZm79mXKy0kc21H3xj1u3F/SGQaGltQythO
         r464t6YOO91a651CcQRXbkcxqcVbXjpLkFe6UIFf2gtRt89IKJfUu4J1d8vM2OAQvN1E
         5CWO3gGndvU6B89MZcgGXT/aE64L8DHml9noKP3OfzVJM+/1WCHYFoK/sVsqrQXcOWbY
         BPjg==
X-Gm-Message-State: AOAM531sgjbyL6/OwDJzj8aNGQ8XQVW2qQylCY5qAbYO7VL5NJk+dKW0
        yNbWOCDTFLMnR/iIAf5iNvaT5FdAKS2XvS3M4rb1eufJpYJ3jg==
X-Google-Smtp-Source: ABdhPJxKAi0RkwlkdkDuL2Y1yN1SIcFzFH1y6tOJPM7QZS6A81Kb1jQy2a4Pk+M/Awc1Dc2lwVDDdhQ3KmffpX0aa6M=
X-Received: by 2002:a81:f92:0:b0:2d0:5383:7ca with SMTP id 140-20020a810f92000000b002d0538307camr14268843ywp.268.1645924826305;
 Sat, 26 Feb 2022 17:20:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645796337.git.geert+renesas@glider.be>
In-Reply-To: <cover.1645796337.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Feb 2022 02:20:15 +0100
Message-ID: <CACRpkdb20-39HygrvDe2b35DM+rGRQUpG2ELW=01XfZq=XpurQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.18 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Fri, Feb 25, 2022 at 2:41 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 2e08ab0427fe3e33a92a37cfe3b6db340ab7397f:
>
>   pinctrl: renesas: rzg2l: Improve rzg2l_gpio_register() (2022-02-08 09:54:44 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.18-tag2

Thanks Geert,

pulled in!

Yours,
Linus Walleij
