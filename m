Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8ECE6D559C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 02:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjDDAlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 20:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjDDAlw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 20:41:52 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECE540C3
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 17:41:49 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id d22so18649087pgw.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680568909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgysNXDjezVypUVtNw2DgU1W7B1ZdPyJPeaiMTwHLeM=;
        b=gMueDK1zUO5PhqVU0ajKeagSSx73Jl3s+Uw1AMh8pWaBxloOBOkezkim8oSimTdr6+
         dKWx66S0vlvimu3V46Ou6XNI9C8c1iGXj34h66PDJbf4z8iny+8Sdj47XOXdLL/fDxBZ
         IcFpqKCWal9mJjkAVyWIDE5L9ERBMJADaxEC+ZCaYQqx6gPfmgViBa0AcPmrywo0tdqe
         HipZBHJMEJivqklwiHxRg+zURx/Ni+yGpxSdZMVQrG/f6JHTPRt0I5zAj01a9VzEiJ9M
         oZXFYnpjf8g0BHonMoS8BuUt6G924DIigkJuYXicrOlwEpSe4HjmB8npP6OulWVG59xO
         SF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680568909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgysNXDjezVypUVtNw2DgU1W7B1ZdPyJPeaiMTwHLeM=;
        b=Q/+TfdbboxWrQX/MdnqBR83gJAcaiH/Pj4/7ThadV4FOWjT2Fd68rvKoO3aDlEcXuB
         DsMQFG4cCx6DgN42NfZeO0iLDCccBu0NdlYvJTep09i4Dyh9i1SN8rbVR5I/e5xftXyb
         w68T8PnXSdX+b471O45CyCLZCdGwucXayGstAuX+zcium1Oks9eE7vyyQnambJqope9g
         46hBUkXi92CtKbfQmf/hvDZ0qEuAg+D2sBtR6CXBpXfVWdoxPijd3G8BW5QnD5NLClb6
         4UCSqF/pikhx6RLC7P3r1WmKGdivtpZvkwOiz1jgG5LJK3ZostJYwsOTfyElN1e9pu6P
         sXhg==
X-Gm-Message-State: AAQBX9frjNt0240T5P7hYxPSf94WkGd1gXyeMdNNs6PuG7s6HjZtGRjj
        CiKJloCwqfzK0i4zW/Hu8x8=
X-Google-Smtp-Source: AKy350Z25RHC9L1dDbfWl+JIz9BDsz9hkoDgqOL4LU0QszXBgSjVrBTt5JQls1QMTrW+jBRoNWzDPQ==
X-Received: by 2002:a05:6a00:1345:b0:62d:c459:bc52 with SMTP id k5-20020a056a00134500b0062dc459bc52mr19270668pfu.11.1680568909037;
        Mon, 03 Apr 2023 17:41:49 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id k9-20020aa78209000000b0062505afff9fsm7066286pfi.126.2023.04.03.17.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 17:41:48 -0700 (PDT)
Date:   Tue, 4 Apr 2023 08:41:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: replace alphasort() with versionsort()
Message-ID: <ZCtyR9zbXmR+fOGb@sol>
References: <20230403142815.183891-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403142815.183891-1-brgl@bgdev.pl>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 03, 2023 at 04:28:15PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With a high enough number of chips, gpiodetect currently sorts them
> like this:
> 
> gpiochip0
> gpiochip1
> gpiochip10
> gpiochip11
> gpiochip12
> gpiochip13
> gpiochip14
> gpiochip15
> gpiochip16
> gpiochip17
> gpiochip18
> gpiochip19
> gpiochip2
> gpiochip20
> gpiochip21
> gpiochip22
> gpiochip23
> gpiochip24
> gpiochip25
> gpiochip26
> gpiochip3
> gpiochip4
> gpiochip5
> gpiochip6
> gpiochip7
> gpiochip8
> gpiochip9
> 
> Switching to using versionsort() instead of alphasort() makes it look
> better and the order is more logical:
> 
> gpiochip0
> gpiochip1
> gpiochip2
> gpiochip3
> gpiochip4
> gpiochip5
> gpiochip6
> gpiochip7
> gpiochip8
> gpiochip9
> gpiochip10
> gpiochip11
> gpiochip12
> gpiochip13
> gpiochip14
> gpiochip15
> gpiochip16
> gpiochip17
> gpiochip18
> gpiochip19
> gpiochip20
> gpiochip21
> gpiochip22
> gpiochip23
> gpiochip24
> gpiochip25
> gpiochip26
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The checkin comment is a bit excessive - perhaps just list an example
where it gets it wrong, like gpiochip10 < gpiochip2?

But otherwise it makes sense.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> ---
>  configure.ac         | 2 +-
>  tools/tools-common.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 7d72c24..c1005a9 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -119,7 +119,7 @@ AS_IF([test "x$with_tools" = xtrue],
>  	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
>  	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
>  	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
> -	AC_CHECK_FUNC([alphasort], [], [FUNC_NOT_FOUND_LIB([alphasort])])
> +	AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_LIB([versionsort])])
>  	AS_IF([test "x$with_gpioset_interactive" = xtrue],
>  		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
>  	])
> diff --git a/tools/tools-common.c b/tools/tools-common.c
> index e5f6fc1..64592d3 100644
> --- a/tools/tools-common.c
> +++ b/tools/tools-common.c
> @@ -469,7 +469,7 @@ int all_chip_paths(char ***paths_ptr)
>  	struct dirent **entries;
>  	char **paths;
>  
> -	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
> +	num_chips = scandir("/dev/", &entries, chip_dir_filter, versionsort);
>  	if (num_chips < 0)
>  		die_perror("unable to scan /dev");
>  
> -- 
> 2.37.2
> 
