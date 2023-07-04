Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7E67471C1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jul 2023 14:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjGDMvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jul 2023 08:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjGDMvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2023 08:51:04 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A395E70
        for <linux-gpio@vger.kernel.org>; Tue,  4 Jul 2023 05:51:03 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-666e916b880so2576703b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jul 2023 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688475062; x=1691067062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3o8AeipVc0tW9U466qBIXYM7Mllx8KJqaG6LWtEsy0=;
        b=ixOz86AWL0U3ElPCwt6esysVFJajMq/s27Cl9HBFI+NCKJ6FeaiBfY1YpF8mkMEKbW
         VBP1whkpfj2FsnVCY3Jq3xu05zzLEtUd5XWGkAQRyrdaRM80Ic3C89sSrxIrD+5QCqbS
         E+zhUFQokCyM76L1uUPqti3yD2lcK4gFSFWom4uafRYKa8IQcRaIHdXo0jpxsK4osXuL
         pYzFsg1jLfnwXQ9d9fUu/PfG4Kw1NoqzemVCaCDyrFvw3nB41BePy1OtxdWflMB+u1Im
         bEUTTz+dxQvVbOH3QS4dc/Jrg1FN2xR3Woi36nJ8RbqCej8p0j+Y00XlmSWYh4VHGrQS
         weWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688475062; x=1691067062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3o8AeipVc0tW9U466qBIXYM7Mllx8KJqaG6LWtEsy0=;
        b=hmgbotfjN9MUSDEOJ4NddueVYWjen2PYvzbJ52EVQSTQpToDPl7tDMp3q1vgaGn4aM
         R6QHAKZGheP5UChiZ1kcWtGNlRK2ZOvYseD8xctWZVwb/ECdwEsjmUdeVrtci8OMfVSI
         8FK1rRH6IoZ5apDIGKLoLGG7hKH4WQc/gq/5T7YctplmTT/D3tBqdhovvkNocW2kLitA
         wOAtyWteTKXBImWP7eBXLg7gbsabt98A0gm4FqwMExUDoogTK0Ev44TIMSmvJpFZk7zq
         6jnTztxQgEb0wL54ujrNOFIbObEzPRa0M4XoQVhp2MPtv0KPloND4jH5Bh5RXxYYIBOg
         sm9w==
X-Gm-Message-State: ABy/qLb24gej60KmiIpCpoo2q0h7HQYu2BRcMcEaoLUVQG2yr2mVwBH6
        andH7YModTz1Zjh4rrCIoz3oQzE8pqI=
X-Google-Smtp-Source: APBJJlHiaL4cQlUxGHrpg/0T1H1dKi6E8sSP2TqnDNO10Bczok7Pt9frK2bF2mNNn9iU9aqhiFerYw==
X-Received: by 2002:a05:6a00:2d87:b0:682:4de1:adcc with SMTP id fb7-20020a056a002d8700b006824de1adccmr13023495pfb.12.1688475062481;
        Tue, 04 Jul 2023 05:51:02 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id j7-20020aa78d07000000b0064fa2fdfa9esm15303382pfe.81.2023.07.04.05.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 05:51:01 -0700 (PDT)
Date:   Tue, 4 Jul 2023 20:50:56 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: clarify the non-option arguments in
 help text
Message-ID: <ZKQVsPrhMEXwavIf@sol>
References: <20230704121222.314617-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704121222.314617-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 04, 2023 at 02:12:22PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We already use [] for optional and <> for required arguments in help text
> but let's make it clear that we can pass multiple chips/lines and in most
> tools only the first one is required.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tools/gpiodetect.c | 2 +-
>  tools/gpioget.c    | 2 +-
>  tools/gpioinfo.c   | 2 +-
>  tools/gpiomon.c    | 2 +-
>  tools/gpionotify.c | 2 +-
>  tools/gpioset.c    | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
> index 0a3461b..569cdfe 100644
> --- a/tools/gpiodetect.c
> +++ b/tools/gpiodetect.c
> @@ -12,7 +12,7 @@
>  
>  static void print_help(void)
>  {
> -	printf("Usage: %s [OPTIONS] [chip]...\n", get_prog_name());
> +	printf("Usage: %s [OPTIONS] [chip1] [chip2] ...\n", get_prog_name());

I prefer the first form myself.  It can be argued that the second form is
more confusing.  In both cases you need to parse the ellipsis, but the
second is close to:
    "Usage: %s [OPTIONS] <chip1> <chip2> ...\n"

which means something very different.

What does git do?

"git log [<options>] [<revision-range>] [[--] <path>...]"

"git branch (-d | -D) [-r] <branchname>..."

So it uses the first form for required parameters, and a variant of the
first form (i.e. "[<pattern>...]" where we use "[pattern]...") for
optional parameters.

Cheers,
Kent.
