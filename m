Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C45645675
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 10:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiLGJ2z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 04:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiLGJ2u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 04:28:50 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309F423E90
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 01:28:49 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 65so4372242pfx.9
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 01:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73d9hxBqpXtZIMKxhAUC5bVOYMDJpb8o0fzKtQRsL2M=;
        b=e6RhNjTOus1/if3ozHaW7uW02K9hayfwjRX+Lbbk9LTPUBdwJg45KSWvGX9oxTZGsD
         +ZUCL42tmGAE4mQw5iLfoxjL1/DMzyqYHPzl+d/yBzwpJijjgnfUZfp2llw8GWdy3Kck
         XBm4AobjX8UWJcsfSzOOY62zKCwuDu/PQwtHIyNXHFaBua30bRFIbTXzI6AyGdxOt4gt
         89chYLCQRALVsLsjnFjS3Xw50VJ9s5cS8tA0T5FOMqrityDPGS+HZWKjCdXsbqcfrhbH
         GAbzceDur655qPKgmMEzixIlzOiH34rA2cToD89RDXqIY+Y0moJwutiVS5JR2IOJlznF
         nDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73d9hxBqpXtZIMKxhAUC5bVOYMDJpb8o0fzKtQRsL2M=;
        b=3pMOGOh5xcSinCweiK4l1bPq1jQ/zHz9cFoKVvD22N0NgoiNMqZ2clpvmeslrM+JRG
         MUs5CUsuSNBpKSz6LjS1+SLzEHzW6YPuO/9yrN0KraFqAYjvmzKxaVGbT0ah30MXcMbM
         ODhSLTZBfR4ns9XSnwj6THMvgueVD98ETF/jYbINUDR9XJoF9HJZBa5iXfkUcH4GlqtQ
         j+T5jxIiSnSEBCCzVePAMKZL9Tll6jHOMH/LQJMZqz/bN5IsJuzrOkIynJKkVqt2aRuv
         Iy6+flAVb2lDCukGxso0BOJqSxprB1Vv7c3J/iknabyIahioKfu6Ent6BZwMPugXSApa
         /QAg==
X-Gm-Message-State: ANoB5pks0RybM2wl0l8/xmiWB+z8bISrIrSCny8M4w51XomjKM2ByIGJ
        DWJ7FkobfrH14uMOCIjM2MDEk/0jEwE=
X-Google-Smtp-Source: AA0mqf7Fw51CuXBLvm0b2sxMemba3SUqwNR1DZ0JBibLvdfwHJCbffuagv3NbqV/pyB6td3ZUayQjA==
X-Received: by 2002:a63:1659:0:b0:477:98cc:3cfe with SMTP id 25-20020a631659000000b0047798cc3cfemr62159331pgw.508.1670405329478;
        Wed, 07 Dec 2022 01:28:49 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090a12c100b00218fb211778sm629536pjg.41.2022.12.07.01.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 01:28:48 -0800 (PST)
Date:   Wed, 7 Dec 2022 17:28:44 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Esben Haabendal <esben@geanix.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [PATCH] gpioset: fix memory leak in interactive mode
Message-ID: <Y5BczAGN78xiKgDp@sol>
References: <f36e4eeee8c5bb96cddcad31a3762c10406a99e9.1670316057.git.esben@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f36e4eeee8c5bb96cddcad31a3762c10406a99e9.1670316057.git.esben@geanix.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 06, 2022 at 09:46:37AM +0100, Esben Haabendal wrote:
> Even when readline() returns an empty buffer, we still need to free() it to
> avoid leaking memory.
> 

Good point.

> Signed-off-by: Esben Haabendal <esben@geanix.com>

As per the README, you should prefix your subject with [libgpiod] to
better get the attention of the libgpiod team.

> ---
>  tools/gpioset.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/gpioset.c b/tools/gpioset.c
> index c49d229870d2..f087003af1c9 100644
> --- a/tools/gpioset.c
> +++ b/tools/gpioset.c
> @@ -768,8 +768,12 @@ static void interact(struct gpiod_line_request **requests,
>  		fflush(stdout);
>  
>  		line = readline(PROMPT);
> -		if (!line || line[0] == '\0')
> +		if (!line)
>  			continue;
> +		if (line[0] == '\0') {
> +			free(line);
> +			continue;
> +		}
>  

Given free() is null-aware, I would just add the free before the
continue, rather than splitting out the cases, so

                line = readline(PROMPT);
-               if (!line || line[0] == '\0')
+               if (!line || line[0] == '\0') {
+                       free(line);
                        continue;
+               }


Cheers,
Kent.

>  		for (i = strlen(line) - 1; (i > 0) && isspace(line[i]); i--)
>  			line[i] = '\0';
> -- 
> 2.38.1
> 
