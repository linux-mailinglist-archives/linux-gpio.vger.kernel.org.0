Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D5B2423DF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Aug 2020 03:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHLBzG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Aug 2020 21:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgHLBzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2020 21:55:06 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FA6C06174A;
        Tue, 11 Aug 2020 18:55:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m34so206914pgl.11;
        Tue, 11 Aug 2020 18:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T2J49wpQMUHfRririMo+Rf4x9CizTCvRgC8ISOkSSfk=;
        b=hyksJcD8gywt9zSZynx1ythhKvrfose5TqpyfpbtLU9jVYqSxYtHuLahi3Yq+LkQgd
         /mAAFU50BpwYbDELFoko/1ZeC15ZOKH+AqpQS5ahQKoN3PpLNqcC9XLXa92ImiABubEk
         rYMuwfZrDhdfu0bt5xjbNsrP6MBQrcpJo4tQaaGoDKTyeFDT5QN8gald0ebXI4Zpyym4
         1BMyDhRifuJL3bl+7v8C0AXAPWZh4sE2144PwWunbJk0oELHPZTY9W655nm7FIJKa3m/
         7BJd0ctZ4ETFdI5le+749HEFcbhn5NuoNhjw8leEGyPqrCTxKdQMQ+IDM0+xCV/bUXx5
         TmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T2J49wpQMUHfRririMo+Rf4x9CizTCvRgC8ISOkSSfk=;
        b=QmDbuk8IMqMGWVCfu7zVhdGMTVTXVMkkRIBzgoKpXWn0ar+usT4qkF9qIfKeRn9Pxi
         XWcTOJ//ag5XZQA8UmZpqsqp6vpatcS9qNZm4mg/gqla99cG1X2NqxZoC8agrcfWswFf
         fSEy2bn5GSlC+fCLfPTuZbidDatNuQu9byUcMC2AWafDf6JM5xbp0YRvyTxwPmCKs5sq
         5OGw0Zl/XOf2CqhW5hcBF+Qs9y4hKPF7e1ceRjiJ4737rZDfV7iZT4MrUCqMiqlubocR
         2XCeofxJnH7AD45IfWV+dPmyFZOHLRsNn5z1JQvL9xFx0AxEx8xn+sFHUKhNq+zHS8ZT
         VzTg==
X-Gm-Message-State: AOAM532Lk6cANh6nz7AG98/uBeTOM54U1qiXFrBGzggCMc4S6yxnOYvy
        2IjlJ49z+vWRlM7lIcPWjEc=
X-Google-Smtp-Source: ABdhPJyCf4K/oGLH9l53KJJqPsYdALPiirscn2O3GPD4emqc4cfV1zPc6yyHhdsv3RWqwympyQ36ag==
X-Received: by 2002:a62:f843:: with SMTP id c3mr8756574pfm.247.1597197305425;
        Tue, 11 Aug 2020 18:55:05 -0700 (PDT)
Received: from sol (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id j5sm376129pfg.80.2020.08.11.18.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 18:55:04 -0700 (PDT)
Date:   Wed, 12 Aug 2020 09:54:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 02/18] gpio: uapi: define uAPI v2
Message-ID: <20200812015458.GA8760@sol>
References: <20200809132529.264312-1-warthog618@gmail.com>
 <20200809132529.264312-3-warthog618@gmail.com>
 <CAMpxmJWe6Cjhwt3izuPLK-Xzvm=LqOy_nnZ7xg123+M_JgriLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWe6Cjhwt3izuPLK-Xzvm=LqOy_nnZ7xg123+M_JgriLw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 11, 2020 at 09:11:41PM +0200, Bartosz Golaszewski wrote:
> On Sun, Aug 9, 2020 at 3:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
[snip]
> >
> > +/*
> > + * Maximum number of requested lines.
> > + *
> > + * Must be no greater than 64 as bitmaps are limited to 64-bits, and a
> > + * multiple of 2 to ensure 32/64-bit alignment of structs.
> > + */
> > +#define GPIO_V2_LINES_MAX 64
> > +
> 
> If we refer to bitmaps for which helpers are defined in
> include/linux/bitmap.h then they're not limited to 64-bits. I'd just
> say here that we want to fit into 64-bit integers for simplicity.
> 

Strictly speaking, userspace doesn't know about include/linux/bitmap.h,
but I'm happy to remove any ambiguity.

Does this work for you?:

 * Must be no greater than 64, as bitmaps are restricted here to 64-bits
 * for simplicity, and a multiple of 2 to ensure 32/64-bit alignment of
 * structs.

Cheers,
Kent.
