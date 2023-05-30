Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33A08715A30
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 11:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjE3JbK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 05:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjE3Jal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 05:30:41 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7356710F0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 02:29:28 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b024e29657so21444205ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685438968; x=1688030968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KLhL5PeZ52ex86PaEZyL8ODUQrC27A4D0YUeeRuVcE=;
        b=U6PZqESsXlor0C8i+nJ5ZdbopKq5sP2+9fL2/85s5Er02resi4bj3Ll93B9rQ2lWPq
         xgEReZxAr/JRFLH0BekXGGAK/DpAOklKRj4wKV2oRY/JtCx66RYiAlJgXkw4hrkD/B8r
         AFF6LFz2H5faJG24VwklvqQkDt7c2lCo9KG6f3tlUtXlW7hGtsTCPXMx5kJD5Bh5zAGw
         7qAeSyFOlctJ/r8Q7q4Vc+H/mejCr3pylqZF8P9BZFUvHSWgn7IL6Ca3EvqS9lmvkoTU
         xJdFqWNuIKsSEqRtteag213+0Z6jyP0raJ1VsL27u7w99EF8tzMCC6BlvTUCJuoppnNH
         sG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438968; x=1688030968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KLhL5PeZ52ex86PaEZyL8ODUQrC27A4D0YUeeRuVcE=;
        b=euiUUvyNrzmFNeeLuFijyDQCdrr+KMyiCr8ng9Uw+41ITiwnqqr3ZriDtSR3pZDjmb
         FoJVagAvE4rvyBet1k72yGqaDfAUm+BrRU8FqyaOB7iCp+E9RtoyClB3MN84brsxt/sS
         IoWX2V1djnbD+/nMXLOvNaGEIEV6/MNa65Ip1YGrLS6kjlnmJVw7NeHTdcQ4YyUeUE3A
         2QtWrX76vk9GpPXpyOuA4E/nNttyRuYgMQjIs+qiVKYo4Nk5/QBB5F1l+BhQBfG40lDU
         NaHu0q7ZRJ3tDhp53MJ7y+vfAIxJl9jyNNRsFE+GD+sEsjSWWVLjW4135IQOWKhb1epn
         Owig==
X-Gm-Message-State: AC+VfDxz6fGLNHLhsE0MV/tyuA493G5TuQGY3Q02mKJ6VdHdCPlXDjpK
        avY1u0eSP6wQ9QLlJK3xCaWuNzhyx68=
X-Google-Smtp-Source: ACHHUZ6yCsV7t2GQ/Z5Ic34WuzRv9gYbdaqHZXgTjw1p1v0GlT5I9oyIFQHB67GlPAhkrAygoBBWyQ==
X-Received: by 2002:a17:902:8504:b0:1a5:dfd:d167 with SMTP id bj4-20020a170902850400b001a50dfdd167mr1625705plb.8.1685438967828;
        Tue, 30 May 2023 02:29:27 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902ea8500b001ae4e8e8edasm9831834plb.18.2023.05.30.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 02:29:27 -0700 (PDT)
Date:   Tue, 30 May 2023 17:29:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Matni <gabriel.matni@exfo.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: add timeout option
Message-ID: <ZHXB83x85Qchv1XJ@sol>
References: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 29, 2023 at 08:20:44PM +0000, Gabriel Matni wrote:
> From: Gabriel Matni <gabriel.matni@exfo.com>
> 
> Add a timeout option which allows gpiomon to gracefully exit upon expiry.
> This is handy for scripting as it allows developers to implement an action
> when no trigger has been detected for a given period of time.
> 

The problem I have with this approach is that gpiomon exiting releases
the line(s) being monitored, so you can lose events.
So I'm not thrilled with the idea as it makes it too easy to throw
together a lossy solution without realising it is lossy.

My preferred solution is to run gpiomon as a coproc and have the
controlling script perform the timeout. e.g.

#!/bin/env bash
coproc gpiomon "$@"
while :
do
        read -t5 -u ${COPROC[0]} event || break
        echo $event
done
kill $COPROC_PID


Bart, if adding the option works for you then I can live with it, but I'm
not keen.

If it were to go ahead I would still like some changes - see below.

> Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
> ---
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index cc08f17dd2b4..7ef35fa69b1d 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -30,6 +30,7 @@ struct config {
>  	const char *fmt;
>  	enum gpiod_line_clock event_clock;
>  	int timestamp_fmt;
> +	unsigned int timeout;
>  };

timeout should be signed.

>  
>  static void print_help(void)
> @@ -68,9 +69,12 @@ static void print_help(void)
>  	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
>  	printf("      --unquoted\tdon't quote line or consumer names\n");
>  	printf("      --utc\t\tformat event timestamps as UTC (default for 'realtime')\n");
> +	printf("  -t, --timeout <timeout>\n");
> +	printf("\t\t\tpoll timeout, format similar to debounce-period\n");

Call the option --idle-timeout, and don't provide a short form to
reduce the possibility of confusion with the gpioset -t option, which does
something very different, and to intentionally make it a little less
convenient to access.

Rather than <timeout> use <period>, so it is automatically covered by
print_period_help(), and don't reference debounce-period.

Same option should be added to gpionotify, for consistency if nothing
else.

> --- a/tools/tools-common.c
> +++ b/tools/tools-common.c
> @@ -188,6 +188,13 @@ void print_period_help(void)
>  	printf("    Supported units are 's', 'ms', and 'us'.\n");
>  }
>  
> +void print_timeout_help(void)
> +{
> +	printf("\nTimeout:\n");
> +	printf("    Timeout is taken as milliseconds unless a unit is specified. e.g. 1s.\n");
> +	printf("    Supported units are 's', 'ms'.\n");
> +}
> +

The tools-common changes are unnecessary if you change the help as suggested
above.

And in general, code doesn't belong in common if it only used in one tool.

Cheers,
Kent.
