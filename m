Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 993BC75BF26
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 08:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjGUGzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 02:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjGUGzH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 02:55:07 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F06B270A
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 23:55:06 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso1085652b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689922506; x=1690527306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0QLQoiU7s93pdrC4791KWs0RYyFWAUOBFtgcVURl5kc=;
        b=dZPwyA6p6aoggAZDcKj6wDu+hZgwdpw4zc8QI+gnq+jw8/ys3x1+/mHNOs1sssZEBf
         WNA/ZmBZ0dKKUG9S22M63yb6fOsfddF9yT5i9yG7uPnCiKMNF1SqmrTfiOQK/WQUoSGe
         7mupOzvalPPOAACnrAhVTYNpinTtXi4+aSQXpTE71fcOJxzOpuzRcoq5iU7WiBAb0l3l
         q7aOW52ibspvYPif5Thy2JrubfkzyxtGxhrkrrrZZygArHJu/ttzefVTPx2g42D2pDbM
         FfqcJQRS2t6h+4QFKlkhiVBrJwsSQjnZsoWFclNFk5VWeSgNgKIg4P3qM0FMU9L7QT+m
         mJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689922506; x=1690527306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QLQoiU7s93pdrC4791KWs0RYyFWAUOBFtgcVURl5kc=;
        b=AuQ8gtDTnWPLZ2kGYEoSaKsc14Rqqqum0KTsOy2nmJqZ4Bup6yDPaFg1kQEeBCPIEE
         8TS/iLXTqqQp5YjD5atOP0mV2G3cGOWbgFGtKLDCNmrAJLNNn/P5jDGL32NM+G7IDwDO
         P0Vvxpe8A+Rckeqbdd2ywTnpn/fyequC0z9JGH2ds8DXa+d9tTcCaFQL9gZYKy/PRzFb
         I/3Himaz97QrueUz2l/MXJK+kNsdjgKBCDIDuPqNT1K+cKmQq9ZHYUBD1KCU8ZAHsbqG
         kxu3H2HOOUm7sunSrFXRzyeDwYGPVl9PX/BHQWTHnTzQW1uikvTzJMHwvXPmuDoW8AfM
         qc6Q==
X-Gm-Message-State: ABy/qLZ1uT/7UV1VAFp8lZHdl8YhE1fxL+/Xdv0MI+QQ6c15HexK/2VT
        l6vwtxiCWaTNfmmfPpAQ6a5djw==
X-Google-Smtp-Source: APBJJlHEfKPa0E3EPk52BmQKndWYA5x5eE8xNMHbbIHb0NfrW/wYgHMQiRlFoHg2CoOzp98rxgyi3g==
X-Received: by 2002:a05:6a00:a8a:b0:65e:ec60:b019 with SMTP id b10-20020a056a000a8a00b0065eec60b019mr1103051pfl.25.1689922505678;
        Thu, 20 Jul 2023 23:55:05 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id y12-20020aa7804c000000b0063b898b3502sm2244097pfm.153.2023.07.20.23.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:55:05 -0700 (PDT)
Date:   Fri, 21 Jul 2023 12:25:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 5/5] bindings: rust: provide
 LineRequest::chip_name()
Message-ID: <20230721065503.jsktxdvugto5atxm@vireshk-i7>
References: <20230720144747.73276-1-brgl@bgdev.pl>
 <20230720144747.73276-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720144747.73276-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20-07-23, 16:47, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Provide a wrapper around gpiod_line_request_get_chip_name() for Rust
> bindings and add a test-case.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/src/line_request.rs   | 16 ++++++++++++++++
>  bindings/rust/libgpiod/tests/line_request.rs | 14 ++++++++++++++
>  2 files changed, 30 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
