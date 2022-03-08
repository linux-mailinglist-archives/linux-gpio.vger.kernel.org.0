Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76EF74D1C62
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 16:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348055AbiCHP4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 10:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348042AbiCHP4E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 10:56:04 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9944D276
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 07:55:04 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v1-20020a17090a088100b001bf25f97c6eso2399504pjc.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 07:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CBJXMnJYmcf/5pYbF4pSo4VbxLWu2UG+oPhPtBuCe1I=;
        b=E+5lMbRCNY+vG2EBSfdgODFOXHF+Nq/v8xgLJy87RbuO1W9P6Mhx34lHdXIouxyeh3
         h0qpQiwXOKhYvVFDPv+vm9Qh+oAI9ULfGmgITOuY6CucbI/+rRE6IxzwMPkqiIbcrwG7
         M+WiyMplz8f2OVHWO5iM6SK+QQUxvK6Ei9BTLRQCEH9HMBzkqUPREK2apeOXmkc8wlaj
         nUfkHWoxY8BmWZsWPsP9JmwaLD7wjyQcDryFfZzQ99LV3n5eenJE0X2lDyTuvq4O8Kbp
         jKJVDcHoAxCID18luUK5tY+ZbaL41xhctByXPJsieZpxsb89hvVeXHu6dXOrGNxjqcKN
         eHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CBJXMnJYmcf/5pYbF4pSo4VbxLWu2UG+oPhPtBuCe1I=;
        b=Kn+WcR2LCI16Jr63ZVmTxdhS3KhfaVKw80z5QFCEgSptKZQIK9PgRAOj+wqStJEyay
         cCdwQ3E5c30mRTs/AcK5LyACyzsMi+p1T/WkezbdsiUHmXg58UAe09jRXIQOWd7jtl5s
         Rfqd5g/ZNm9NjBtQyCkk7dGwRRKkNZwMCg1KUlPuuJGsb2FAiQIu9vpOxhD6xgPkFP5F
         J+xPawr8o22Ub6u+ThQp7G5nguf9PyzrULjfxXNlk3xsdIeObxLAnYpnA5o0W5NxqPHJ
         9a8PRAvcZ/8XckCOFQn1UIILkN7DkZP0QIUBjrajpNzUcu2YR6bfY02H1uar12H/aX9m
         n+ww==
X-Gm-Message-State: AOAM533dGQmh4gZZxmkRyW/2q9l1SeVC9qzZrX3VaD1sCmdswsui6OVr
        F28V/AH2PtEY7s4qOW6xXmA=
X-Google-Smtp-Source: ABdhPJxKQJGaMEyOFs4xFCqaDa0X0Uzpt6005o7aZTjnTn+sZXrsHDcJD/n3NLTcB8MSVAoMOuC9xw==
X-Received: by 2002:a17:903:18a:b0:151:af32:6139 with SMTP id z10-20020a170903018a00b00151af326139mr18272209plg.86.1646754903903;
        Tue, 08 Mar 2022 07:55:03 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id d23-20020a17090a02d700b001bf6ef9daafsm3372774pjd.38.2022.03.08.07.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:55:03 -0800 (PST)
Date:   Tue, 8 Mar 2022 23:54:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] treewide: use size_t where applicable
Message-ID: <20220308155458.GA72687@sol>
References: <20220308152233.493098-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308152233.493098-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 08, 2022 at 04:22:33PM +0100, Bartosz Golaszewski wrote:
> size_t is the unsigned integer type generally used whenever variables
> define sizes, ranges and numbers of elements. Use it throughout the
> C library wherever it makes sense.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  include/gpiod.h      | 30 +++++++++++++++---------------
>  lib/chip.c           |  4 ++--
>  lib/edge-event.c     | 12 ++++++------
>  lib/internal.h       |  2 +-
>  lib/line-config.c    |  4 ++--
>  lib/line-request.c   | 10 +++++-----
>  lib/request-config.c | 12 ++++++------
>  tools/gpiodetect.c   |  2 +-
>  tools/gpioget.c      |  3 ++-
>  tools/gpioinfo.c     |  2 +-
>  tools/gpiomon.c      |  4 ++--
>  tools/gpioset.c      |  3 ++-
>  12 files changed, 45 insertions(+), 43 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 0512a8f..e6a4645 100644

[snip]

> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index 112257c..28030fa 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -44,12 +44,13 @@ int main(int argc, char **argv)
>  	int direction = GPIOD_LINE_DIRECTION_INPUT;
>  	int optc, opti, bias = 0, ret, *values;
>  	struct gpiod_request_config *req_cfg;
> -	unsigned int *offsets, i, num_lines;
>  	struct gpiod_line_request *request;
>  	struct gpiod_line_config *line_cfg;
> +	unsigned int *offsets, i;
>  	struct gpiod_chip *chip;
>  	bool active_low = false;
>  	char *device, *end;
> +	size_t num_lines;
>  

Also makes sense for indicies into arrays, such as the i here and
elsewhere?
I'm guessing there is a lot of elsewhere.

Cheers,
Kent.

