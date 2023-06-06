Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A427235DB
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 05:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjFFDnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 23:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjFFDnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 23:43:06 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83D812A
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 20:43:05 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d24136685so4064360b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jun 2023 20:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686022985; x=1688614985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QADTxHquHQMEXIX89yHgS7wSSCKy/V+wCYWQDKZ9iDA=;
        b=e7RmnByhDSw1zSeZJ0OSg0n7ZnGHJgT9TKyPsGfhf0T2iK8K3BKHNGf+hfGAAMMa2j
         XodSn7P0kAMizIHtASQ24e3yHyTF1ukRURk3vVtgNBYTTqApV98TmTienedhIx0eJX8X
         CPq/a/k3huMb/ziL35PhiDTbkvRXgUr2Yj5zCRX53j0ycMIAb8hBk1DQeyPhXqafoPKj
         SvgR2SJnQ1EVvtbvD+mEcPyMw4mBqxiVsJIqTExCWiQWp01q3Sk9rSBR3xW8GhAFE94e
         420W1WDOAXrFB2Beakl3u2vMv+CP/0/8HVp1yEeL+KqfKiuiLvltMPPUCf50zg84SFAD
         wuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686022985; x=1688614985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QADTxHquHQMEXIX89yHgS7wSSCKy/V+wCYWQDKZ9iDA=;
        b=fli4jDWhBctpaf+ySpOclJxk7R8ChEmMRLGrj8Std31OaUCnFN9XWvdGXkmgPGndfR
         0zAg/mX59iGjxSWEoFVrkhZ1DTwD/dXRWIZrhDk+e2od8206GcXuqvQEHgwsIay+66lO
         HSTiJBYQS4eh5G/7kdfeTHPTnJ0Lub6LpYnNv0m9J5yQm1GewOHWVyQ4wZnJR1yL3D5j
         Kzl5TRvovGc8UL288ea/Hn7XOTPG8xMoiirzxP47CjmyP2xeL1qpwPKY6Hc8VZQnjsWS
         QhEJZw7SUGFO+vEOOknjtK9UIJplEMB/38eC8ktdijYyVDCyXHTYV9xvoM6mpFverdKB
         s2hg==
X-Gm-Message-State: AC+VfDwEg5hHCqOa1XlDoge42UEos/F50w3+iJjiZWe7xO8VFbFN+38f
        46245KdiTnWTHNQHX78VmH96Hwc0DWU=
X-Google-Smtp-Source: ACHHUZ6OBXgM1b5SBL9cL16Pru3qfY7v5AQBX5BkrugsOMyQPa8nTYWeERY+gXqwARTRni7hmNI1hQ==
X-Received: by 2002:a05:6a00:16d1:b0:64f:ad7c:70fb with SMTP id l17-20020a056a0016d100b0064fad7c70fbmr1124783pfc.17.1686022985227;
        Mon, 05 Jun 2023 20:43:05 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id n15-20020aa7904f000000b0064ff1f1df65sm5887933pfo.61.2023.06.05.20.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 20:43:04 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:43:00 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     joe.slater@windriver.com
Cc:     linux-gpio@vger.kernel.org, randy.macleod@windriver.com
Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZH6rRD5B2hNyXcuV@sol>
References: <20230605204335.4060789-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605204335.4060789-1-joe.slater@windriver.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 05, 2023 at 01:43:35PM -0700, joe.slater@windriver.com wrote:
> From: Joe Slater <joe.slater@windriver.com>
> 
> The test "gpioset: toggle (continuous)" uses fixed delays to test
> toggling values.  This is not reliable, so we switch to looking
> for transitions from one value to another.
> 
> We wait for a transition up to 1.5 seconds.
> 

For future reference, the subject line should've been
"[libgpiod][PATCH v3]".
The version goes within the [PATCH], and 1/1 is optional unless you have
a cover letter.

> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---

Here you would normally list the changes between revisions.
So I'm not sure what has actually changed since v1.
The loop limit went from 10 to 15?

>  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> index c83ca7d..05d7138 100755
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
> +	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> +
> +	for i in {1..15}; do
> +		[ "$(<$PORT)" = "$EXPECTED" ] && return
> +		sleep 0.1
> +	done
> +	return 1
> +}
> +
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

You said you would get rid of this comment.


The patch works for me, so I'm otherwise fine with it.

Cheers,
Kent.
