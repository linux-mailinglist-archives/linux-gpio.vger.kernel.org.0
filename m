Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FAB26D575
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 09:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgIQH7c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 03:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgIQH71 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 03:59:27 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA2CC061788
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 00:59:26 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bd2so700092plb.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Sbzq5ZPZjyajmPUSqRQj9RYcWTNcG9NAJqBx3do85e8=;
        b=idoChJgXeuvAWIii2xSPLC92tOnxFv65ZsOj+rqbKzUAK60kwiqbHWJMwscI0rhpI7
         xKEfp9LChj3u0eXSuvXf1E4XtV9tpLvx93tTSgaL66hVtHhyuHBvIsDV+EjNlGcs0wir
         NI4Wl7gZj6Zxj8p1gWlyaMPZnyFYnX5WSRpMWv2zG3blhRFz3upbQOW8kmLCyOnDf9SF
         VkMix1LMUu7tBfDwnXsX5LYwUhN1SqL8pC9rJtLhKr9Q3QBat9zauFEFHABFGF91It5k
         o1uMOy4hcxPGT0KFlh5U1H/W7pLcDwIbFSDVReFSC+L4akFmG1EtPKtlJyQglOpZBJqw
         JMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sbzq5ZPZjyajmPUSqRQj9RYcWTNcG9NAJqBx3do85e8=;
        b=triLRrLz10SjR5kPUWDcHtLLteSHjGysMNDKBkAR/nndRXLBzFK58MLVz3VgE8DAyE
         SYyzTK2Q97nrJlOrF4Ml/eHfQ7dhw4nf7tUsGyQ8RHfgsz+5Bi91qiHSrhJepcZjEIxA
         iMSKhagA1brsbAMQhaAZ+SbKe8YKQ9R9Qjp+qfFrl5QurDy6vGt7lC5lzl3GEc4vTW8p
         nz7CWpA1+YkhJs6aiDIL4/zgMtaO9nKHCZdebXCYxxwGNSUNROZyIrI9ecERXTU55f7X
         Efq9rGT2p7LFFKU7F7dD6lldFokkGhVtu2D0IlYo50nP1sLS2ePPhVlxNjYsBKmWvdQw
         9R9w==
X-Gm-Message-State: AOAM53043p4ZgXt68CEKLF4UnRFlFFMHgK4Ltes25RZCwXJyf1AY9tBi
        k9aBSbaTkS2zcc/65634nYtgxVxsRJM=
X-Google-Smtp-Source: ABdhPJwOw8b7SqzvXcGnMMdS3YbwbWZ/ut4ukxkyiayf3VbSpyKouBy9kq71BolLv3HJ/j9dCqaAFQ==
X-Received: by 2002:a17:902:ff07:b029:d1:e5fa:aa1d with SMTP id f7-20020a170902ff07b02900d1e5faaa1dmr9721478plj.84.1600329565948;
        Thu, 17 Sep 2020 00:59:25 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id ev19sm4768151pjb.42.2020.09.17.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:59:25 -0700 (PDT)
Date:   Thu, 17 Sep 2020 15:59:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200917075920.GA1512423@sol>
References: <20200915125816.47148-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915125816.47148-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 03:58:16PM +0300, Andy Shevchenko wrote:
> The introduced line event handling ABI in the commit
> 
>   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> 
> missed the fact that 64-bit kernel may serve for 32-bit applications.
> In such case the very first check in the lineevent_read() will fail
> due to alignment differences.
> 
> To workaround this introduce lineevent_get_size() helper which returns actual
> size of the structure in user space.
> 
> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Kent Gibson <warthog618@gmail.com>

