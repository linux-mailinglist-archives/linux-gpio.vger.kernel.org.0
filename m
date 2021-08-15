Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B5C3EC63B
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Aug 2021 02:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbhHOAPu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Aug 2021 20:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234094AbhHOAPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Aug 2021 20:15:48 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377DFC0617AD
        for <linux-gpio@vger.kernel.org>; Sat, 14 Aug 2021 17:15:19 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso21584584pjy.5
        for <linux-gpio@vger.kernel.org>; Sat, 14 Aug 2021 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GsfztjF57m3pL2gpDk9eS3kN08NB38RijkWdKD4fIL8=;
        b=Ijb2VXbwoUHuzDWiyRBuMXsOhkd6pjhfxXiPKMEPoskiFUHqoqUEWjFGYMRYt+uvqc
         fKBDDdLuej4O5AmXcr4D7zVjnSSyoo8do5wJPy9Qr/nGKQtr98yf9cXzrsGAnpaI65Qd
         RqRBb7ia2bDNBiOeZbMNgfWgY5qN6zLyvjXlOaZumF0Ht39z1uVwReWbCpse6QCAljmp
         b6IYUxMsQxEvIon1U9DLy1ZWpDPbnxHS0Aiwa0oVawFVFnbLMsdFb6c4u34/w3Lh8k2s
         M3x5IDpcBlK6IXooSX0lYlRt8k0XfFz5u4X1x4wkYRDY9gQKDR0nBaJF1BvNQXsig2D0
         svSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GsfztjF57m3pL2gpDk9eS3kN08NB38RijkWdKD4fIL8=;
        b=ANpLJhQeSGb4wIWEoAKKmVMy1UyYYQm+IOtZhRocQtGtfnnw5EXYApLkvshA6za2rQ
         lhgsbzp3F0Y+niFxQA3Iw9OEHHXbt3eAIpkxOB1NOQcJgQXh/5uT6/XfVegG89DOwkx6
         b3mAd+DIvZB8BSlJvmu9j7+EtygVrtqOKUb6gqBWF0cXla6WjbB/iYSa5Wa3lxcV8BNH
         YRfceZ2DNDspd+RwQZZOlGWnmiqulx5PRCHIkv0lloxMH43yPYUDUhZUhQ2ax8Iro4Pf
         q3fFVehR01flMDDdHNZPY8Kusw5VztpV0obGQCQ3T09JrLFyFvDQD/jhs7BfoJSi4bUS
         QZSA==
X-Gm-Message-State: AOAM531+J93vzh5RjSNh10DKLGJI6PZfi6Wc0Yht4D6QMnabjUKUE1VJ
        xNd2Am9ucwLMuBFS2p01Ucg=
X-Google-Smtp-Source: ABdhPJzVKPE1HY2gHKHQP7gaYykw/QEvhRg7xruqsMpXUgpyzVMb5otRaDHud2fJn1Y6N8GG5wdwyg==
X-Received: by 2002:aa7:8ec1:0:b029:3cd:cd3c:b85c with SMTP id b1-20020aa78ec10000b02903cdcd3cb85cmr8810530pfr.15.1628986518606;
        Sat, 14 Aug 2021 17:15:18 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:ee1a:c78f:4b31:7139])
        by smtp.gmail.com with ESMTPSA id f1sm6897982pfk.115.2021.08.14.17.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 17:15:17 -0700 (PDT)
Date:   Sat, 14 Aug 2021 17:15:14 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [bug report] tty: st-asc: switch to using devm_gpiod_get()
Message-ID: <YRhckpqbyqQh1Jtc@google.com>
References: <20210813124155.GA7367@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813124155.GA7367@kili>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dan,

On Fri, Aug 13, 2021 at 03:41:55PM +0300, Dan Carpenter wrote:
> Hello Dmitry Torokhov,
> 
> The patch 8c44f9b566a3: "tty: st-asc: switch to using
> devm_gpiod_get()" from Jan 4, 2020, leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpio/gpiolib.c:3066 gpiod_set_consumer_name()
> 	warn: sleeping in atomic context
> 
> drivers/gpio/gpiolib.c
>     3062 int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
>     3063 {
>     3064 	VALIDATE_DESC(desc);
>     3065 	if (name) {
> --> 3066 		name = kstrdup_const(name, GFP_KERNEL);
> 
> asc_set_termios() <- disables preempt
> -> gpiod_set_consumer_name()
> 
>     3067 		if (!name)
>     3068 			return -ENOMEM;
>     3069 	}
>     3070 
>     3071 	kfree_const(desc->label);
>     3072 	desc_set_label(desc, name);
>     3073 
>     3074 	return 0;
>     3075 }

Thank you for the bug report, but that is not the offending commit, as
it simply swapped one devm_* call for another, and devres_alloc() that
is being used in almost all devm calls, including the ones in this
particular case, uses GFP_KERNEL allocation.

The problem originally comes from:

commit d7356256488c544b8fdc2c3a775ce069546d7933
Author: Lee Jones <lee.jones@linaro.org>
Date:   Fri Feb 3 10:23:13 2017 +0000

    serial: st-asc: (De)Register GPIOD and swap Pinctrl profiles

    When hardware flow-control is disabled, manual toggling of the UART's
    reset line (RTS) using userland applications (e.g. stty) is not
    possible, since the ASC IP does not provide this functionality in the
    same was as some other IPs do.  Thus, we have to do this manually.

    This patch ensures that when HW flow-control is disabled the RTS/CTS
    lines are free to be registered via the GPIO API.  It also ensures
    any registered GPIO lines are unregistered when HW flow-control is
    requested, allowing the IP to control them automatically.

    Acked-by: Peter Griffin <peter.griffin@linaro.org>
    Signed-off-by: Lee Jones <lee.jones@linaro.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

that added the problematic devm use under spinlock; I'll leave it to Lee
and Greg to sort this out.

Thanks.

-- 
Dmitry
