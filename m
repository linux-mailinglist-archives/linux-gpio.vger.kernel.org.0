Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DC0649B6B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 10:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbiLLJsp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 04:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiLLJso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 04:48:44 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E144965AD
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 01:48:43 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id g10so11489933plo.11
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/2+StBNCA6vo8R99ATuDpiHUYUI6I3zWT2VwDPYtBc=;
        b=FHem91Y4w1G5XttDViCn0IAGHhpKD4jE1zX8tUF74tOoS8hNuDB/IlwT2n3gVPTNkF
         wrL9xsFnLEaSz3RxfpNMLFnnXu76e7luTbrX3i8Zn5j7p41HtNJF7V+CTfVTs6XfvZXZ
         zh3urgeDBG1BtsPfASgGikRvu3/jba46qPyxmp1T7CabB+rJi4FkZi1meHpH1K/FJMSX
         saV71dtv20InNo1iaJm8/yOyhiWRTcnS5kDGaYDJo0D7zjg8O1An6ZQu/X8dYMb0lic1
         /WcILQB0k7JA1PHO6uv6pIszCkLMLBQ1QLIV2lp4hvZf8NqRQOTRASay6TZPBDAKHIJ+
         iW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/2+StBNCA6vo8R99ATuDpiHUYUI6I3zWT2VwDPYtBc=;
        b=zIhIjh9DW5mCfhQV1if/2K+1Uzt7kJEFPJ42ZHKxdTyUH2+eEKQ6cQN8TMcmIMmqm5
         78X1gGHWjHIBrPc1l1ABL170KyxPTu4kvkwTV+PtMBTBJ1q7fkFyuUy7OrKDrlfSEhA4
         JyjWpoTLujFE8kqawBHqXmsTxvvLHzA3ndlSj6dWLWAyep5FKgfWj5yzOLniBISTzHxv
         wyDG4rp9u7QfRFa49xrrKcLAkjYWWBZVi86jnSS8QIdEYi4Pf63UWxwStP4dRbmtpJbS
         hAMhbZALvydIGCm+KiVO05DKPyv9ylc1PdjFMflqKc7EPBDKm8v76LNxsL6VSQn/WHJk
         OZ/g==
X-Gm-Message-State: ANoB5plvf+cQgGSH7TnazUZ2NfE2efjO1MOo1r+V1NvedMK3VUfocbaP
        KSuBsdb+fMlB/3QtQYO2EwI=
X-Google-Smtp-Source: AA0mqf50bzrQFfDMmSPg9GTNWrZ8s8RPeoVcY9Rd8JWawDhtmFfQF2GzgB2uk2eqmJBQNBIN6tq98g==
X-Received: by 2002:a17:90a:51c3:b0:219:f911:9879 with SMTP id u61-20020a17090a51c300b00219f9119879mr15680198pjh.33.1670838523380;
        Mon, 12 Dec 2022 01:48:43 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id x8-20020a17090a294800b00219463262desm5003248pjf.39.2022.12.12.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 01:48:42 -0800 (PST)
Date:   Mon, 12 Dec 2022 17:48:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: remove leftover echo
Message-ID: <Y5b49f+zuaDR2dES@sol>
References: <20221212093510.146129-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212093510.146129-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 12, 2022 at 10:35:10AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This looks like some unneeded leftover from the development that was
> missed because bats intercepts all echo output.
> 

Indeed - you only see it when a test fails, and I obviously missed
removing it after getting the offending test to pass.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tools/gpio-tools-test.bats | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> index bf7f3d6..adbce94 100755
> --- a/tools/gpio-tools-test.bats
> +++ b/tools/gpio-tools-test.bats
> @@ -392,7 +392,6 @@ request_release_line() {
>  
>  	run_tool gpioinfo
>  
> -    echo "$output"
>  	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
>  	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
>  	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
> -- 
> 2.37.2
> 
