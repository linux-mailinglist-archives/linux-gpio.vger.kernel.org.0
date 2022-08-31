Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4050C5A7C48
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 13:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiHaLiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 07:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiHaLiH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 07:38:07 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C842EA7A8C
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 04:38:05 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id og21so27777863ejc.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Lbjprb6QBw1bE1by4nKPaucICCF+waLIAaUMjqBRpNM=;
        b=6hTSJaINgsn8D8LHRHo/nPh87GIyx1X8b6HSIk12vKepNDvR3kzAY3kH652BvGkTfW
         Up09wf+o2MoVj3TaGuXw5C1x04cpJnIninQR6UaaszP99rQHUejOZ0I9l5k1OR0K+kLE
         vi0hGcPod6xfRlGZJAFcSy+SM0jkH9eOqHaxmW1n4OnUUuSfEPX6blyhmjg5XT8BaIMX
         MyNjzd+JpCB3iveLbuGHnj3rSEzAZHY1ZUgO4FfTEjUPzfmilk7XWqWcIoxJW1EpmwHg
         WjjFpg4ZrHUrSFLBcv92tywatkzCDUKYhc8e2BBxHjfQm/XUft3bfhTYT9HUBDPDvOH+
         SI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Lbjprb6QBw1bE1by4nKPaucICCF+waLIAaUMjqBRpNM=;
        b=WbyM74qY2MYx+ctT4H7+s/nFOVqnu1TFCOyvQq5pmR9wg12KpWR30UwKHUGEKdSUWc
         /Ac2SOt+XJFpq+MXtUgn1L6XRbUTwW+KNtQGoG0cIPLNhl/I2JSf/BH0WjbVF9h53kEZ
         8wXrtF3FeZmDNFkEj2tVS/z34OwHXnoFOnPR4i0x1keEb0vdLMppQ2P5+A4gH6PaiVAi
         DLLvwe9LK8ygg/yowuMdKNxrnQSRnb5M2eZKCtB0aZV0E+0KOsv9MZPGW+H+vTg2qaYR
         6LMwiqgvfTzgl0vRKyOPE0R/vQ0EiULRr1z+xxQHgwjnmoqC4CHTG8icHwjnI3ET7czN
         OJuw==
X-Gm-Message-State: ACgBeo0ZPv7Wc6BOF8uYD1BQPZvTHxSzEFIy2rd3Iv0JX6ErqBD/n+A7
        SGei82/r7/6wSOd9TftLIxivqKkq4YqaoR9WACL4qlEfry4=
X-Google-Smtp-Source: AA6agR5ydCut/2MekP2E8GcgQmOM375XHTushOT4Hp4KRuiiNlOVaNywMS4QEwoRMJI7UX01TrsgcVbfp40H/QaLH4M=
X-Received: by 2002:a17:906:9bf3:b0:741:6900:61a5 with SMTP id
 de51-20020a1709069bf300b00741690061a5mr11289762ejc.286.1661945884101; Wed, 31
 Aug 2022 04:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220831084750.490310-1-linus.walleij@linaro.org>
In-Reply-To: <20220831084750.490310-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 13:37:53 +0200
Message-ID: <CAMRc=MfuFJOvJp=ny2gN=kLcM2LQPPotQZ3r9Wfc2UpBr5LEWw@mail.gmail.com>
Subject: Re: [PATCH] gpio: ucb1400: Use proper header
To:     Linus Walleij <linus.walleij@linaro.org>
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

On Wed, Aug 31, 2022 at 10:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The UCB1400 implements a GPIO driver so it needs to include the
> <linux/gpio/driver.h> header, not the legacy <linux/gpio.h> header.
> Compile tested on pxa_defconfig.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
