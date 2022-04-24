Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2CE50D23D
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Apr 2022 16:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbiDXO2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Apr 2022 10:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbiDXO2U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Apr 2022 10:28:20 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699A82DC2
        for <linux-gpio@vger.kernel.org>; Sun, 24 Apr 2022 07:25:19 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id r189so22804110ybr.6
        for <linux-gpio@vger.kernel.org>; Sun, 24 Apr 2022 07:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L9NLtbmHfsRDaArBldTalYPtlLAhaGbJy0XtjJ42Pc8=;
        b=gotl9zyrPMEpBBB75zHAVtoNcGvrwlv8gZBaUOGgGTTlDKLs9vWnUNX+QVELUI/gFn
         FXNyCW8IQshWwaBZiewM0wu1pkPOXpMlHr8ZJep6Q7dxv9r0IH/TryiMOt/Gp0oZHX72
         HNekPe2jA9hCmFWhnttnDCVGEsVmS3PWQ6Ziz2557b2KnMeZB96WZWBWjN/loEVJCytF
         0u0GkYtyo8ftZNiRulrDGM4Fd1c38QKfHBrr7w5Ow0O2WMhNIJHM4r0Zlj+2upZtzSct
         k4z7OFLdFuFgfuYDZgcbkeOPUi6xiqIuicq/dpDawKpBtECGOhIx6DIFpVwNO118usvh
         Gg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9NLtbmHfsRDaArBldTalYPtlLAhaGbJy0XtjJ42Pc8=;
        b=AorOtuguPv9Il0DlKpUNuJT5c8GUHJSOHu7ZdbMSwFKdHr64as6lw5Yp5uxRwabm6y
         ANcEo6IKb3a2xIvKwuzHMCfv3r7o0wkntJZ+uQDgDecrccXj8HWCsv0e3GBaeG8I9XIq
         81yMqJGBdwxryjQjnb2PDVKlgPMlZlQk1IgpNgJQ/GGMH/fxp/0W3QoRg1QR0gYD4ecI
         CZY2Os+XSKQhHnOzI3j6I9OCtdTyj1n+5jhCmccfNtDRGEcpB6Liu62vfRX1x06xMniG
         SECf5bUQ/D4u2xY2HMDjx1Me/wuT+MFYhYMXQ7ZGpQd1ivzJvAo+eTqjOfvOmMn6n8aM
         aO3Q==
X-Gm-Message-State: AOAM530NyFOKgiQZAK5IJGKLxRj0xYvsZv4QdaxWK+QBZ5rddG2gHb9F
        7/zj+aX0HozJHwUTGAGpvgJ8MfpaFs6zrnlHP+O995OvanDW4Q==
X-Google-Smtp-Source: ABdhPJz+iM6j4+k7LHj3uRaybDvpyb35LYUQaJtvmlJ8ZZX6TYIcNdRneNYOUbygjhRCK5EMnFO3pQa9yY0C2Cmqzmk=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr12374379ybr.295.1650810318717; Sun, 24
 Apr 2022 07:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220422085240.2776527-1-lv.ruyi@zte.com.cn> <20220424031430.3170759-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220424031430.3170759-1-lv.ruyi@zte.com.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Apr 2022 16:25:07 +0200
Message-ID: <CACRpkda4Q7M0KNnSx3OP45mdEg2YQiw2bk1JGiHgy8PSuK9adw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: fix error check return value of irq_of_parse_and_map()
To:     cgel.zte@gmail.com
Cc:     Damien.Horsley@imgtec.com, abrestic@chromium.org,
        ezequiel.garcia@imgtec.com, govindraj.raja@imgtec.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        lv.ruyi@zte.com.cn, Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 24, 2022 at 5:14 AM <cgel.zte@gmail.com> wrote:

> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
>
> Fixes: cefc03e5995e ("pinctrl: Add Pistachio SoC pin control driver")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
> v2: don't print irq, and return -EINVAL rather than 0

Patch applied for fixes (changed the subject a bit).

Thanks!
Linus Walleij
