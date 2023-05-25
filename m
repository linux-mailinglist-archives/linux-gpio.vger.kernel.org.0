Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A505B710387
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 05:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbjEYDxQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 23:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjEYDxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 23:53:15 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4042FE2
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 20:53:14 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-53487355877so789529a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 20:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684986794; x=1687578794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9w7FqViodjIpmRKOQyGYpakKKtGuttalF7qu1jmxVg=;
        b=FpK7dnHJr14oGlWIcCDyBneWs4LLltqU7iSGr8fHywysIsRr9dxBaFWddpTISkiKTh
         58oO4c6VXnN/5CvGzLZ7rvXVliUHxzdzPE8xE4wf9Iw/VDA3a0TzdYKCvMXTcjim0z8J
         1RzQabbT2c4IVV7N17sTTZL3UL8xzIca7ATBWr2ysuHPoHhpt1tOsFfVQesfWE24Jhr7
         jFsxcmyLI5XZViXmwM5iLETTa4Q0WJgHAcKt4KY4hGcUBcCS5VjdtMsdEKs7dc2M7xXN
         WzYFVDtWdACz1jJI1sB/5mpbZZFd1fDAGPxv0Q1r9KtNNFvD30UBVwWpPpZFrxNRAObZ
         Q/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684986794; x=1687578794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9w7FqViodjIpmRKOQyGYpakKKtGuttalF7qu1jmxVg=;
        b=juZGhb5Y38cZ96pUOw/lIf/ShPafoK9p4XC8c6OCkeUnFUU7N/vkmXZFmZQFGie+2S
         tXrQwi4JNc+wKY2BsxKevUk7TrvkH/a+zmih7YiTP3crPCKaAScc4q59d4n0ieoRgQTE
         fRo1q62lwoCcYX7KCtxKSd7VZPVtltl703+n+AYSz3vtiFsoSfihq3CJMPoDOkxhxb+d
         h/+QGYtdsUdwFKTMEvS8LjlmQ2m937iRcROOve9HlvAMDaauZhchr0ESJV5I/r/1m7oI
         2pS2iWLmXsjooi2CHIwVQDeGujWg0vDVscJP8Ya0QpU4LXcYWZSF7yJdb5tKebbd6oBW
         q+gA==
X-Gm-Message-State: AC+VfDyGQ2hcJbd76tLrwJRlxagXxUVUaLvi4gpB8StoIxEnrTrK3Ao6
        4kkVE3G8on7bnJ10qi4FtFQoQsjJCbs=
X-Google-Smtp-Source: ACHHUZ41NLb62JFbWQE69XyGlUO/XX62ZBIizjQaLi4YObEb9D+E9hxoyxxUFV/DBjV8sT3DDjV3uA==
X-Received: by 2002:a17:903:230d:b0:1ac:8dae:d842 with SMTP id d13-20020a170903230d00b001ac8daed842mr226482plh.46.1684986793543;
        Wed, 24 May 2023 20:53:13 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709027fcd00b001aaf536b1e3sm246444plb.123.2023.05.24.20.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 20:53:13 -0700 (PDT)
Date:   Thu, 25 May 2023 11:53:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     joe.slater@windriver.com
Cc:     linux-gpio@vger.kernel.org, randy.macleod@windriver.com
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZG7bpE8xRuIeq7J+@sol>
References: <20230524210945.4054480-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524210945.4054480-1-joe.slater@windriver.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 24, 2023 at 02:09:45PM -0700, joe.slater@windriver.com wrote:
> From: Joe Slater <joe.slater@windriver.com>
> 
> The test "gpioset: toggle (continuous)" uses fixed delays to test
> toggling values.  This is not reliable, so we switch to looking
> for transitions from one value to another.
> 

That test is prone to spurious failures if either the test or gpioset
get delayed for any reason, so good idea.

> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> index adbce94..977d718 100755
> --- a/tools/gpio-tools-test.bats
> +++ b/tools/gpio-tools-test.bats
> @@ -141,6 +141,20 @@ gpiosim_check_value() {
>  	[ "$VAL" = "$EXPECTED" ]
>  }
>  
> +gpiosim_wait_value() {
> +	local OFFSET=$2
> +	local EXPECTED=$3
> +	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
> +	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
> +
> +	for i in {1..10} ; do
> +		VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
> +		[ "$VAL" = "$EXPECTED" ] && return
> +		sleep 0.1
> +	done
> +	return 1
> +}
> +

Not a huge fan of the loop limit and sleep period being hard coded,
as those control the time to wait, but as it is only used in the one
place I can live with it.

>  gpiosim_cleanup() {
>  	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
>  	do
> @@ -1567,15 +1581,15 @@ request_release_line() {
>  	gpiosim_check_value sim0 4 0
>  	gpiosim_check_value sim0 7 0
>  
> -	sleep 1
> -
> -	gpiosim_check_value sim0 1 0
> +	# sleeping fixed amounts can be unreliable, so we
> +	# sync to the toggles
> +	#
> +	gpiosim_wait_value sim0 1 0
>  	gpiosim_check_value sim0 4 1
>  	gpiosim_check_value sim0 7 1
>  

The comment is confusing once the sleep is removed, so just drop it.
If you want to describe what gpiosim_wait_value() does and when it should
be used then add that before the function itself.

The test toggles the line at 1s intervals to try to improve the
chances of the test and gpioset staying in sync.
Could that be reduced now, without impacting reliability?
(this test suite being glacial is a personal bugbear)

Cheers,
Kent.
