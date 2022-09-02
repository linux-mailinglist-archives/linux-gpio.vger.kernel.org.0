Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8656F5AABAB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 11:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbiIBJmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 05:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235758AbiIBJmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 05:42:20 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EF6C0B7D
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 02:42:19 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id fy31so2729922ejc.6
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7RVxKy/7NAGOaBeicY+wPpYYEBXyRyq/rxV9WkxurLc=;
        b=t5MAHakXGCxi9EzKBEp8YrERVHmy6pFRk58+CBrN5EjND9wsClk17Q0nsbbYkvAhS2
         ZTMfzJ5dRLrvlYkoGBwqOlTvaOFKdPP84LgYesx7KfqWMhctqEXExFWdl21Az0XQS8tg
         uxK7evYVqfY+74N5Hqq5BciG6CPBfdKeazeAD2G+/5+gvt6xOjZw0sZeO0kXehvh1h7+
         gm9BEI7E/sQ+7LDikGIjcMX2Hl752X9at4k3GlTDzO+rOkHAFwxjhH5nUl01yoeh5I06
         K1U5VSA2gtsiIPiCgzGpzyJW3EBbnfsR2iQFb01OD6sUpNTNIJArMEBiaa9flKclDr5C
         RlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7RVxKy/7NAGOaBeicY+wPpYYEBXyRyq/rxV9WkxurLc=;
        b=LiKmy1xhVsov1B/qfwoMDStSF607qC36v48eWEOOcv5Fk903EiKjteL+MJ5pRa6smz
         AHC9ywmciV7oQ8t14UPPKEhVmJszjtowSDBAhs5ATSSfkr3vDGgUfEMU41PB0q5nOklL
         qtj8e6sJ27Q1MgLiy0ClSCBpcu4wrApef2+Htio0Dosm5Ros8QkikuAzL1ZwTgZfkcXx
         cH1fIyjvTFpuWvfyVTbTcrxseuU8zWLFZZKr/hj0cg85S55qRrA60DGWHwBfEvDlbM0t
         /TWllbOZqx+gbE9f6R3ID44ASCtWFRz6Ffoplf9w5vQMtGZB98CNiSHKGxG2CcroR17U
         /6Jg==
X-Gm-Message-State: ACgBeo1k+s7vJ/G1M82P7ELm9urt0PjS+rEo1z4YvrontfwZjStccJa0
        L7aZq1sKtDLMcCVaG0Q+hEG9HFOAbuNN3vsnEtuzwA==
X-Google-Smtp-Source: AA6agR5FNn2SdvXJheXgW++QRRzppsx1/2cO8qkL7nCfiz48tHzXXaKQNTosX51dACVMFHkUCLXidwkeIGtP5BM4lG4=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr27254666ejc.526.1662111737397; Fri, 02
 Sep 2022 02:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Sep 2022 11:42:05 +0200
Message-ID: <CACRpkdZDWn=Pw=QnO5=TP=KfT4Q8Eot3yCp7NVLmDTwWg39Zvw@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
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

On Thu, Sep 1, 2022 at 3:54 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:

> From: Hector Martin <marcan@marcan.st>
>
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
>
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
>
> To our knowledge, only Apple Silicon Macs implement this SMC feature.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Overall this looks very good provided the SMC API is fine
with the platform/MFD maintainers, I like the usage of .init_valid_mask
which is used just as intended. Andy's detailed review points
should be addressed reasonably after that it's:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
