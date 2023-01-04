Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9E965CEC2
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jan 2023 09:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbjADIwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Jan 2023 03:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234642AbjADIvm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2023 03:51:42 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5E61A212
        for <linux-gpio@vger.kernel.org>; Wed,  4 Jan 2023 00:50:03 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id d14so5941469uak.12
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jan 2023 00:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3m8ypz1fFbj8mPUAsbdHRgs0+/C7FMCVRtO0ZGB+cgQ=;
        b=woUgC7uEewAlc/w1ReOd1/GGUmTkxzjZtRqYhfvs+L8cGq9aOhFh5PA7bfE43XrMBv
         5g1IzuwihIZ+6YaRX7EK4lgnBEyOuJau/F+NwLFUsQppqYvO8SJlBBOvBbI6GOClPIBb
         4xRBzPTtESloEuSOasT+BcITwyUfIvcX5SrH3vYs4leK33BRyz8eHQlqLiCw9ksBek5K
         W/RzQDu+9hkdXxBmXXUP71RSKwhHhs2RBvOBCmrWxM9YT5QADAZuPGAJ3NVufkc5/fl+
         HT8omymLmMBd9zXnn6j/uxVEewt8hvU9ZLHe1zwEAvzqQqVuSC1pgEU8LOt3DbbaJDVF
         oJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m8ypz1fFbj8mPUAsbdHRgs0+/C7FMCVRtO0ZGB+cgQ=;
        b=nagSXjqAV7rUNLt4c0+CNuoaAdazJVsJ3V4gbO0qbn4tU2Zyy+OhfXLS5xd2QtiTfx
         s8Tm0E2sW4f4l84gofma2PmCSyYn4wXEFeWF01XKLaSxOnHN8vrums1IIErHxXTBYLm/
         giBnebHG/1Bk1NxhyDl6FjqOXTytu7iZVcop91DfgQriU8V1BmxQFrOoFqcDrmiLES6p
         IqUL8FSWnMQ2T8vdt3AksWqwjxdROBbBB3suBGqED4cuDlxe0pJGS3+u1lqzRI/j2XI5
         YspfkcIdEc9fvEzGSNZUJjQoBMGAejBRXr+pO2qHEQiGWt+ptxLyVAzhAKZIRw2X7O/5
         K4DA==
X-Gm-Message-State: AFqh2kooV+BHdoFZ7VwJsSpIW15oClNy4toaNZAgvGi8qMzZfvf7pUGc
        GAm6CBtdwYYRtgxcAeg2yBfo+lgqpA/SHTFy5BNWMQ==
X-Google-Smtp-Source: AMrXdXvYMjy/psxcNCIdxU++pZnMtkdyluLcPesKj857WShO2HCqnJPxwQp9TmaDAXiPKU+vfFA2kYYnp05HHhgTlkw=
X-Received: by 2002:ab0:2bc5:0:b0:536:2116:fbeb with SMTP id
 s5-20020ab02bc5000000b005362116fbebmr1859982uar.56.1672822202769; Wed, 04 Jan
 2023 00:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20230102210850.25320-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230102210850.25320-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Jan 2023 09:49:51 +0100
Message-ID: <CAMRc=MevnkijyeAUEv0_aRm+Zf+PToTUeiXwVYGcs_ZhP4DWUg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused and obsoleted gpio_export_link()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arch@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 2, 2023 at 10:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> gpio_export_link() is legacy and unused API, remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
