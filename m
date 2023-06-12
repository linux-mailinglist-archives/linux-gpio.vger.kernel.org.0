Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAB672C955
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 17:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239186AbjFLPG6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 11:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239179AbjFLPG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 11:06:57 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25378F
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 08:06:55 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-65242634690so3340030b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582415; x=1689174415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FL8dxR5TDr8y6Mkkv3QoyYcz+phUqrWBz1FXzYM2Zd8=;
        b=Gr2CexkYne8guS4gpuLX4lDY9/UTabC2AyN0UIkI/p56bE4j5RaegVq+RSd+qzvMjO
         5vtJ+jBB5opmp7nHTE2vsaFOzPqYpYolPgduqegGhlIqpdlQO9siuVSIrMg2NUGZGYz2
         7cbxQh1oJF/yxjvQWBkKqwqOKzoWmkhHuciJYcnUvaCuHmfnF6Lnac16TqILemVDwXKd
         jeRVLgCIiaFMHqMMKn09QXd1OQGwOkKtjyEF5SRcszZAJnsfRPUaf4tlGgUILtOLABwi
         /dFN83U3hPipkmhVcamqqjgA0KYEhHsghwsr9ayQXANFuwjuiggNxoQiNea8giH2noKN
         OtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582415; x=1689174415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL8dxR5TDr8y6Mkkv3QoyYcz+phUqrWBz1FXzYM2Zd8=;
        b=U5w9eKn+vXHowSoxZ+KGMCcVfTq9KltPM5zyb3D6bxDAUs5KmXqPFIW0DzUcWudZRD
         g9Nta8nCMAnIfLWc/pYCuXcyoU/2jEtUi0bQhpM9LomJLSmoiQwvXc75P/z2Aj9DmmYA
         D9z3cS4iF8dagyEq7serAas6gEXQAyaVlTpApw29zj5eghOBhEmpwyCilR7DuR3Oj25c
         fN2oJoWIksQxki0eE+deMVbo5L6hwWUJQPPdUyYX9Yk/wli++uUDYIdGxwNLvn9bbtsH
         1sGy/2hXnYiwwOeC+SR+M9wodq1jNZzFzz5Otc8RT90GPvxOvg9mzUJ/hi2wn/P6QEi1
         3Pyg==
X-Gm-Message-State: AC+VfDwzZ2Bk9sunPzarRZk2qwX4MsorGtyN+syS4uOZKH2N1CYrmC8/
        pm0ppF15mnch9LPvlJcYIK/pRhnc78I=
X-Google-Smtp-Source: ACHHUZ4XKy5w/HuEsW+ruCvYvkNsdbO6hUrTTLhisKi1XYeHf/1L+HGBkOtDE6RkOEeWYXd85Wc4hA==
X-Received: by 2002:a05:6a00:14d0:b0:64c:c5f9:1533 with SMTP id w16-20020a056a0014d000b0064cc5f91533mr11679467pfu.33.1686582414714;
        Mon, 12 Jun 2023 08:06:54 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id b17-20020aa78111000000b006542e358721sm7007938pfi.186.2023.06.12.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 08:06:54 -0700 (PDT)
Date:   Mon, 12 Jun 2023 23:06:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/2] bindings: cxx: fix potential glitch in
 gpiosetcxx
Message-ID: <ZIc0iZayMhyRRGiM@sol>
References: <20230612145653.138615-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612145653.138615-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 04:56:51PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Kent,
> 
> This is an alternative approach to the problem you raised with your gpioset
> patches. It adds a new helper method that allows to set all output values at
> request-time using the line_config's set_output_values() method.
> 
> Please take a look and let me know what you think.
> 

That works for me - it is waaaay less painful than the per-line approach.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for the series.

Though come to think of it, it could use tests as well.
But you can always add some subsequently.

Btw, this is also an example of the outcome I expected to see from
expanding the examples - identify common pain points and extend the API
to address them.

Cheers,
Kent.
