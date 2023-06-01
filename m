Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D7A719FF7
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 16:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbjFAO2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 10:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbjFAO2a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 10:28:30 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5E3132
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 07:28:29 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b04949e4e9so3833335ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685629708; x=1688221708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQg0Uf9Mso6vfja3LgUrYNlHX4EEImQ3CWo1VGSJdck=;
        b=DE2XWTZKoPEry7RftP0XpEdNRjIXyqyPvKOCP0ep95oMuSKBu1X++i+FTSXWxgx3Zk
         jlY4SecbcQchITV2qVWRHIHhh+MvL4rFxwk58segpDlkrRDaApnTj0xUS5EeA3Y0ebPY
         +bUVS9at7Wp/vwtMskPnHFJw2G9GRjT1xDaSollcU2/gxYQpOdRexx8/Uo/6VNAeliIc
         TN9zjy2FVO6o+yyd/4S3cZfuzMKNJgL8QXFvWk9r5EfCDepPnjWdr++OlQlrnXoPeQyC
         uWmJmniHbmW6UhsnlqcF/vdEhT0HWNY5f1s/nlAsBu/XLjCKsEoJ9rYNhyDl5NoFblTP
         +NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685629708; x=1688221708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQg0Uf9Mso6vfja3LgUrYNlHX4EEImQ3CWo1VGSJdck=;
        b=KB/ntkfIp2CN8YuQKZ/BrIvEHpkUAUy88yhruamfyPKJLzRSZb6lhLMd8xIp3vJ7fE
         cCOYXPV0XFAn8yyHYCv1fwxD6FzL5qhEOs5eJ4KRI8U9+U4nuiXDwRqN8rv5A5C4Uz88
         qMkEOrlGc4/jz2MnLQln31qtbPM5ke2p64YUdT5H5KpGLKZMO68k+MB3OkvNwfyCjakG
         7HWvwHrCoe/8JjS7XXCNQ9TETwqPsyZ55MFko4CH3k2Ot/BHQ6P+u5efHDXDjrF75H8U
         xBfqAGMfjOu8Rl7IDUPkVsj5IQsQwUFNBJWEnAHrCLfcSRD6EoXCqXZXLpJLwA3KNRmL
         f6LQ==
X-Gm-Message-State: AC+VfDwmXbdoR2KwrNuBGY9dxbp4vtZg7aeu0FUDCinu0H//jeyhacV/
        ud/UWiyfwFB5nDetiLDX+iI=
X-Google-Smtp-Source: ACHHUZ7ljJcP1xA+zAa3MedIDZK99OEjRPhFQ98S315P3Y0TekiuX0hS/MRsfJ8cBFAy5KRTk0/tGA==
X-Received: by 2002:a17:903:5c6:b0:1ab:29bc:bd87 with SMTP id kf6-20020a17090305c600b001ab29bcbd87mr4984701plb.35.1685629708546;
        Thu, 01 Jun 2023 07:28:28 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902988100b001b04949e0acsm3546708plp.232.2023.06.01.07.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:28:28 -0700 (PDT)
Date:   Thu, 1 Jun 2023 22:28:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Message-ID: <ZHirBqDkd99qWGX8@sol>
References: <20230601140950.779453-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601140950.779453-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 01, 2023 at 04:09:50PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Since version 3.11 egrep emits the following warning to stderr on startup:
> 
>   egrep: warning: egrep is obsolescent; using grep -E
> 
> This makes the tests fail (though that seems to depend on BATS version)
> so replace egrep with grep -E as suggested.
> 

That works for me, so I don't have any objections.

Though FWIW, my global sim cleanup script looks like:

find /sys/kernel/config/gpio-sim -type d -name hog -print0 2>/dev/null | xargs -0 -r rmdir
find /sys/kernel/config/gpio-sim -type d -name "line*" -print0  2>/dev/null | xargs -0 -r rmdir
find /sys/kernel/config/gpio-sim -type d -name "bank*" -print0 2>/dev/null | xargs -0 -r rmdir
rmdir /sys/kernel/config/gpio-sim/*

So no grep at all, just find and xargs.
That is for all sims, but could easily be reduced to a particular sim,
given the sim name.

Setting live to 0 seems to be optional - deleting everything works fine
for me.

Cheers,
Kent.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tools/gpio-tools-test      | 2 +-
>  tools/gpio-tools-test.bats | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
> index 5b6c72e..ed39ed5 100755
> --- a/tools/gpio-tools-test
> +++ b/tools/gpio-tools-test
> @@ -37,7 +37,7 @@ check_prog() {
>  check_prog bats
>  check_prog modprobe
>  check_prog timeout
> -check_prog egrep
> +check_prog grep
>  
>  # Check if we're running a kernel at the required version or later
>  check_kernel $MIN_KERNEL_VERSION
> diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> index adbce94..c83ca7d 100755
> --- a/tools/gpio-tools-test.bats
> +++ b/tools/gpio-tools-test.bats
> @@ -154,7 +154,7 @@ gpiosim_cleanup() {
>  		ls $BANKPATH/line* > /dev/null 2>&1
>  		if [ "$?" = "0" ]
>  		then
> -			for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")
> +			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
>  			do
>  				test -e $LINE/hog && rmdir $LINE/hog
>  				rmdir $LINE
> -- 
> 2.39.2
> 
