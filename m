Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94DF56AC220
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 15:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjCFOD1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 09:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCFODU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 09:03:20 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A9024133
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 06:03:16 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id t4so8150369ybg.11
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 06:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678111395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aeI0dDbLr4/ACidaziQGMHF31Y6IixUFDfRpx8Mx/wA=;
        b=g4AWy5mBa4Piye7zzeONZ/KCD3ABIJhRYxmedSxh+SOWG8tPrZKnzPn/lLYpDfIhaD
         +sUAU0U/rlcshjFSEpp26n6nW8vup91Mkjt4WNJPHYwJr4x8EVmLHeqR11H9ga1aWwnq
         m3YG4+uWwrXHJS0uHABvNicPw4rl265oywFUTja+klA7xl4R162QAbB2DYqm3tuTROrw
         wf5hKoAm1DU4OHhKwn6HDJlUebPM0w96+m34X0T2y3RVzi2+tOu8oATqra9GTriimdQn
         sXFMjkmAaPZNdLjxiXegWPRmWKPv1Lk531iwBpsI/jYh8DlSN2KNSVmHCzfFla/VYj+N
         rQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeI0dDbLr4/ACidaziQGMHF31Y6IixUFDfRpx8Mx/wA=;
        b=s9ir5XXpN5MVFJybNcJ9alybr7nhhOApKAwPH4wkxlLMRVYOsF5zGqlx8OHer2Gk2w
         zC8YX2StAfR9KRzjldBfEa1z2Owu9qmSQIXxMD7crSEOtsC81ccbb9ZR8tEoGPHY6vey
         RL2evHQa5cTn9klE9YBRBHK+PFt2vcbguj3/0pIfVbp7ZvYKUWjDIDhrYMe+bhRGKadB
         w9Hw5mfUASTFWu4KMnSVGQh9bpvu7XXYSEOuAu/hPdHNkwOsogo/WEKr1U/sEPGcDfSW
         kAs9+bEC9VH6XGVlY9belwxWsIfE93EAPHPXZjZ7RkD9NYESkfwV0ZoaE6VaXlMa6s5r
         dLtQ==
X-Gm-Message-State: AO0yUKWqCJNdLPmWf0iS+WXyo4LuJLeQ0gL9jSYFhXPio9FDiiJU6/g3
        HN103hVihEIOuAXH5ubbojDTcth/7mXBBIyMN+X7TQ==
X-Google-Smtp-Source: AK7set/HdjPVX0qQf6R2XKUSVQlV3OuX7y4xtLBkiSFmdlwUeEep/Nd0dxjJM+J54cyXaepI50nVK56Wpi2U6362WPI=
X-Received: by 2002:a05:6902:4f4:b0:a06:5ef5:3a82 with SMTP id
 w20-20020a05690204f400b00a065ef53a82mr4989421ybs.5.1678111389438; Mon, 06 Mar
 2023 06:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20230225140118.2037220-1-xiang.ye@intel.com> <20230225140118.2037220-3-xiang.ye@intel.com>
In-Reply-To: <20230225140118.2037220-3-xiang.ye@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:02:58 +0100
Message-ID: <CACRpkdaHUEG2NJxrU+R-VVcpcMzf-BzfOKDBcKQQqh2_zQrFJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: Add support for Intel LJCA USB GPIO driver
To:     Ye Xiang <xiang.ye@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
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

On Sat, Feb 25, 2023 at 3:01 PM Ye Xiang <xiang.ye@intel.com> wrote:

> This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> GPIO module with specific protocol through interfaces exported by LJCA USB
> driver.
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>

Looks good to me, also looks like a really helpful adapter.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would appreciate if Andy could ACK it too, as Intel engineer.

Yours,
Linus Walleij
