Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5AB560F23
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 04:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiF3CZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 22:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiF3CZa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 22:25:30 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B97F22510
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 19:25:29 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id bo5so16806235pfb.4
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 19:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=224pgSkuqYkk0vyy6mJ+hlz73N5Kt0s4M+G9r+1aeco=;
        b=XW5F3j+xBczYyrWCgC0apE5UGtRATngrDUgNLK/FjL9tqZAK6NCsCViye00gthnSf5
         xeiEh9rNqklrcspRPfQQKuIMjUPXshYasDR8ZDBvsilQmMtJWwKSoGRNTA655Bb+DpvD
         4DNg8vzmvFX2bZ851syTGWieZTBu+64wYRYCHpE11hwLZwtNyrvd4QAZeisxRxHi6hKj
         NUIPxGrIQrsjj8yziTGwXH/xNkqxpm0XQ8p/fqB+ia0ye2gy726HMmDIo69mlPaxKE6F
         JSe2/sH/Wpxkzavt4OABrhgMFAFDwAN0Smga3Qs4f5FfI2/fVPhNFEkIF0Zrkmd2fMDx
         XhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=224pgSkuqYkk0vyy6mJ+hlz73N5Kt0s4M+G9r+1aeco=;
        b=jYNYekbTsGeRgvC8SZsJkaWD5ubPjYY1tkxGe/84qyUgED4ZOSnqVLAe5wCYhHeJM5
         5V72z51IbKxK7xafz0kvG4loJjcxR9jXuU8J2SRVFHfgz56oJ0L9UlfDtP5jvB4a3XIm
         H62VV3Wn1OIbY+ccCf2t8Evw+sRVV4VP6EGp79tCfGfilAv+B8EaLmeh9KaSOBOJ9/yc
         mjuxnWl92Om7P37at00Vum9raGXBxfcOP8A7teDXZV71F6S8fph4S1tJFRI+8uHHu1ZS
         ZuxPn5dz9vgAZI6W9YQ0boonDq1NqNrS0V1IPNXGfk2+udvgg2xEFi1TIM7UqhuUg8qw
         z6FQ==
X-Gm-Message-State: AJIora/OpREhrSBbYqXw6VfGESiYdlJGYmk9IaUESzcUwr+S4CRgvPsI
        UbbWKQnda/BnxaStyUkHGqw=
X-Google-Smtp-Source: AGRyM1u4KAOL/UyCR0lLk4xclhZUxb4mmf9SbqbacXExX4bb9I4lNBMPWy595uQqRGUkX09kZzrNrA==
X-Received: by 2002:a63:4558:0:b0:411:442a:b740 with SMTP id u24-20020a634558000000b00411442ab740mr5430235pgk.540.1656555928929;
        Wed, 29 Jun 2022 19:25:28 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id k22-20020a170902761600b00167942e0ee9sm12124932pll.61.2022.06.29.19.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 19:25:28 -0700 (PDT)
Date:   Thu, 30 Jun 2022 10:25:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
Message-ID: <20220630022522.GA17221@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628084226.472035-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> This is the implementation of the new python API for libgpiod v2.
> 

[snip]

> +	}
> +
> +	res = PyObject_Call(method, args, line_cfg_kwargs);
> +	Py_DECREF(args);
> +	Py_DECREF(method);
> +	if (!Py_IsNone(res)) {
> +		Py_DECREF(res);
> +		return NULL;
> +	}
> +

Building against python 3.9 (the min required by configure.ac) gives:

module.c:276:7: warning: implicit declaration of function ‘Py_IsNone’; did you mean ‘Py_None’? [-Wimplicit-function-declaration]
  276 |  if (!Py_IsNone(res)) {
      |       ^~~~~~~~~
      |       Py_None


Py_IsNone didn't get added to the Stable ABI until 3.10.

Cheers,
Kent.
