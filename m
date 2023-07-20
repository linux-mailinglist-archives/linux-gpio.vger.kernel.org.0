Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73CEC75A4C0
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 05:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjGTD1o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 23:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjGTD1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 23:27:43 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5C41B9
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 20:27:42 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-66f3fc56ef4so1033541b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 20:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689823662; x=1692415662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3ssZfkfh1KClKE8UXWHhu8yuABbR8XjCQYGzzQycv4=;
        b=aNyLPhXNMCErjqqV00YMgKJ7oYn32fGZmdtr5vZRL3dRKZrhqv0IwIaWuB8hRm0Pn3
         7P19nG3gpuQ971hfdk41msLrRD7AihaHf4E34M66kbcDeFHqHkF6lOCCCTlzi/BwjDiG
         +4ZCKqaNidxR6J4hLGY/nn20JbidT2fOWdOp71Ivnp1B5EoP2wdqNP9jp4eQvYm+1Bbb
         KAXMNR6qhg62cK1VIlWUgS5qi4uzo2szXg4WkinVuMDnwekBvAuhdFi9Bn5TknCxM+d9
         rTjhIBcRTadQ6XV1YNYBOEpE0ut1dDb4A0egmY1Ixemy9lD5v2S8c8ygA9t9ScZ7Arra
         oPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689823662; x=1692415662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ssZfkfh1KClKE8UXWHhu8yuABbR8XjCQYGzzQycv4=;
        b=fTRgGTllNeFiXrptkhFTvNlG6eilYTBiLzEBg5KK6/+EVkBAMFYo8vb+bk6Kw9QqD+
         bUUI6NzVtbO3/8M+XRUgOmaC5KdLSTugpUOuZ3MAoRX9GPe++f0YdY3FmcWPHFYnLYjk
         F3Bjm6sZgAUo5amfXqFy17orIlqeHeNS6LtqM6haIMEufXFaQ8Uo/fzKIsud4jwEPgro
         3Q6TdoK/P4I41jP6oG/RXleLpmTpXiS3/6gcV/C7Qs2XFh1pl3SmucHOKeWe3ZboS0Bl
         QgIgUd/FEb9uhOzB9lB5pTM0c+OYqOtW5Yb1rlHZbbNxYOmuiU69z+bsHhryht2sULCe
         YWRQ==
X-Gm-Message-State: ABy/qLY/Tb++OhhcOA6gF5UhULX+XjojhMgb4xlWJ5mhj6y+mjVMZvRy
        AIki914bOstrI9sZ/fdy8OE=
X-Google-Smtp-Source: APBJJlGvbQ7zq+8Lud/lKMtoGm2S0rTE7Y2jCAKAs44EEVzeam/g5nXlw04eu6A530ggBgPHYAHj/w==
X-Received: by 2002:a05:6a21:6da9:b0:133:38cb:2b93 with SMTP id wl41-20020a056a216da900b0013338cb2b93mr6199652pzb.9.1689823662055;
        Wed, 19 Jul 2023 20:27:42 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id j6-20020a633c06000000b005579f12a238sm4315789pga.86.2023.07.19.20.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 20:27:41 -0700 (PDT)
Date:   Thu, 20 Jul 2023 11:27:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLipqIJE1Mo4oK00@sol>
References: <20230719192057.172560-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719192057.172560-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> While working on the DBus API, it occurred to me that while we can obtain
> the list of requested offsets from a line request, this information lacks
> context if we cannot get any information about the parent chip on which
> the request was made.
> 
> We cannot reference the chip in any way as its lifetime is disconnected
> from the request but we can at least provide the path to the character
> device used to open it as a way of providing some context for the offsets.
> 

No problem with this conceptually, the only question I have is which
one of these should be stored:
 - requested path e.g. 'a_symlink_to_my_favorite_chip'
 - canonicalised path e.g. '/dev/gpiochip0'
 - chip name e.g. 'gpiochip0'
 - chip number e.g. 0

In this patch we get the requested path, right?

Cheers,
Kent.

> This series adds a new getter for struct gpiod_line_request and wrappers
> for it for all bindings. This will be used in the upcoming DBus GPIO
> manager code.
> 
> Bartosz Golaszewski (5):
>   core: provide gpiod_line_request_get_chip_path()
>   tests: add a test-case for gpiod_line_request_get_chip_path()
>   bindings: cxx: provide line_request::chip_path()
>   bindings: python: provide the chip_path property in line_request
>   bindings: rust: provide LineRequest::chip_path()
> 
>  bindings/cxx/gpiodcxx/line-request.hpp       |  7 +++++++
>  bindings/cxx/line-request.cpp                | 10 +++++++++-
>  bindings/cxx/tests/tests-line-request.cpp    |  6 ++++--
>  bindings/python/gpiod/chip.py                |  1 +
>  bindings/python/gpiod/line_request.py        | 12 +++++++++--
>  bindings/python/tests/tests_line_request.py  | 13 +++++++-----
>  bindings/rust/libgpiod/src/line_request.rs   | 12 +++++++++++
>  bindings/rust/libgpiod/tests/line_request.rs | 13 ++++++++++++
>  include/gpiod.h                              |  9 +++++++++
>  lib/chip.c                                   |  2 +-
>  lib/internal.h                               |  3 ++-
>  lib/line-request.c                           | 20 ++++++++++++++++++-
>  tests/tests-line-request.c                   | 21 ++++++++++++++++++++
>  13 files changed, 116 insertions(+), 13 deletions(-)
> 
> -- 
> 2.39.2
> 
