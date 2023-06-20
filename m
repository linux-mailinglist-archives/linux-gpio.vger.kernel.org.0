Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28966736D9E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 15:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbjFTNnw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 09:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbjFTNns (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 09:43:48 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038E310FB
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 06:43:47 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b505665e2fso38742555ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687268626; x=1689860626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7prxXyjIPNYhU/GLNJgRr0yapIoWLh2ZQBm4bA3rie8=;
        b=L4Fgk+ck8ZgJiQdeF3rmj0fRZmiv1G4EPxwDOhCSeP5btNLnPXejLp62CJi7v9ZWST
         JXbEIi8FkFjxIhJnqyU2mf29plNx/qmrQmqWoZd7HXcT2kjTXYruYexIxqgsAweV3fUY
         t8gO94bGyTXh0SQQAHeeXtEUV2i2g0pcaKF2wq2+sP3k4Yk2N6bQR1rXx9hVGiXlXzo7
         Ii9ASVr/Eyv6cbffncCpHKDismxBUlEJrJ9eKhmHf8V7h7s2GxAjNeN+M+uDVGHcxeyn
         4K0VeaoARkcFUPd9b/fVJX2sdAZHv4bvpiSICLqYNK4D0zl+W/A040+JC7JcNqzGc2Hb
         /7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687268626; x=1689860626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7prxXyjIPNYhU/GLNJgRr0yapIoWLh2ZQBm4bA3rie8=;
        b=FUkgzMFBOna3TOZfdED/4zTqKabc8g33WrJM2aq0q2vQriAbce/gsaU4eEd+nwZAJ8
         hQLD1M5IQ0vWJ7yQr/HnOURY07Z6I2XxB7F+ZSALr3xagqYtefFCbLZBCll0l72Tx4F1
         UKIDwbl46XEs7rszKIY6CRyEtP6eA2+lAuVKiBozeHbNYPJTg5ef04uMyrxh4zqkv3Gx
         ovBstrhOOQCCyvS3+p5ZGBbZ8SEfWKzRV8Y8MlqC3bIoZ3m9zhFrWOyPIDxRsMRFyVWd
         62DJlIPfFMjQU6bGmANLYFlJWsIATVyhjs4/qT5AGQzvMEm0aLlB5w9myJ46eqRZhDEx
         PJ7A==
X-Gm-Message-State: AC+VfDzwkr5kknNP0Ywre0w4AI0wSbLKjSa2w3tf8NhmHqVwBsXTikcv
        wd7LxJNkEMU+Jdbrsc/lyK2NHw1qgTc=
X-Google-Smtp-Source: ACHHUZ7uKheYmHeUphtQi4hLO9vCdQBuu/sRsyEcmwPZq9aacbDOT1k739z+GiaC6QuS8YisuMRmlw==
X-Received: by 2002:a17:903:41ce:b0:1b6:6a14:3734 with SMTP id u14-20020a17090341ce00b001b66a143734mr6870206ple.29.1687268626310;
        Tue, 20 Jun 2023 06:43:46 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902e84100b001a6a6169d45sm1653488plg.168.2023.06.20.06.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:43:45 -0700 (PDT)
Date:   Tue, 20 Jun 2023 21:43:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: port tests to shunit2
Message-ID: <ZJGtDJtcWwdSOyGJ@sol>
References: <20230620124130.303427-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620124130.303427-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 20, 2023 at 02:41:30PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> - update docs
> - remove all bats-specific workarounds

Not sure you got them all - more below.

>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
>  # SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
> +# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>  

Just extend your previous?
Or is the email address change significant?

>  # mappings from local name to system chip name, path, dev name
> -# -g required for the associative arrays, cos BATS...
> +# -g required for the associative arrays.
>  declare -g -A GPIOSIM_CHIP_NAME
>  declare -g -A GPIOSIM_CHIP_PATH
>  declare -g -A GPIOSIM_DEV_NAME

As per the comment, the -g was there to satisfy bats, so can be removed
nowi - both the comment and the -g option.

>  gpiosim_chip() {
> @@ -110,7 +101,7 @@ gpiosim_chip_number() {
>  }
>  
>  gpiosim_chip_symlink() {
> -	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
> +	GPIOSIM_CHIP_LINK="/tmp/${GPIOSIM_APP_NAME}-$$-lnk"
>  	ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
>  }

The $2 dicates where the symlink was placed.
Now it is ignored and placed in /tmp regardless, which is wrong.
Refer to where it is called.

> @@ -2072,9 +2063,13 @@ request_release_line() {
>  	dut_run_redirect gpiomon --num-events=4 --chip $sim0 4
>  
>  	gpiosim_set_pull sim0 4 pull-up
> +	sleep 0.01
>  	gpiosim_set_pull sim0 4 pull-down
> +	sleep 0.01
>  	gpiosim_set_pull sim0 4 pull-up
> +	sleep 0.01
>  	gpiosim_set_pull sim0 4 pull-down
> +	sleep 0.01
>  

Why are delays now required between sim pulls?
Might toggle the pull before it gets propagated to the cdev?
Add a function that describes that rather than a raw sleep?
gpiosim_wait_pull?

Split that out from the shunit2 change if if is a general problem?

> -@test "gpiomon: with idle-timeout" {
> +test_gpiomon_with_idle_timeout() {
>  	gpiosim_chip sim0 num_lines=8
>  
>  	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
> @@ -2114,10 +2109,9 @@ request_release_line() {
>  	dut_wait
>  	status_is 0
>  	dut_read_redirect
> -	num_lines_is 0


You have something against testing that there is no incidental output?
That being the point of that check.
Without it the dut_read_redirect is redundant too.

Or does the new form of num_lines_is not handle the 0 case?

> @@ -2671,11 +2664,9 @@ request_release_line() {
>  	dut_wait
>  	status_is 0
>  	dut_read_redirect
> -
> -	num_lines_is 0

And again.

> +# Check all required non-coreutils tools
> +check_prog shunit2

As noted previously, assertContains requires 2.1.8, so would be good to
either check for that if possible, or at least document it.
As it stands the tests will not run correctly on Debian Bullseye, which
is still on 2.1.6 - though IIRC they do report success regardless -
which is either nice or unfortunate, depending how you look at it.

Cheers,
Kent.
