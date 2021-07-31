Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8863DC2AE
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 04:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235755AbhGaC1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 22:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhGaC1q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 22:27:46 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B8FC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 19:27:39 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u2so4932920plg.10
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 19:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zg9JvHNQmWX4ZNH6Z6oon/uOP+htx2StmZ+1x6KrnIA=;
        b=IXzTy7EYCgVU3QnuovUthM0Y55RensmNNE0pq0Pk+BolZ8kxqXflCZae4z3pR50Hld
         OGprHxDod+/4qWQA1//dOoFXb/eo9p/n5axI+qYtdMbDGNKn8QdieUdUdhWe7Qc1EAxZ
         ymAHrAEM8OLQO/EDOgfAxfutSoGUz2KPJaDhIR88mXjB9MWd0atHNle3IG46MTBf4mu6
         rNnaWPQj5Fata3VCqm/ERJyJef2jG9cw2ZqlfiNhw8cQq1MjO+omeoHJNdrwSJrK3HT1
         i6fRYJYlXDpzlwRCxBHr+MJQHuqnn2MkJenYRZUWqzL+Sy0HD14vmWS5ft+T0n8b24rZ
         LNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zg9JvHNQmWX4ZNH6Z6oon/uOP+htx2StmZ+1x6KrnIA=;
        b=FHaygfyrklE9xBziPlL1Yo3lM5KXBM9RxlmZ9dilp4FeYf6C0iwK141x7WCnDK0pek
         yTKe1sVbJ+OCY2FjLm8dZ0PZmDO2iVoA7x5RcDapwFgqWRRISiLJMPlxlaifAsYOWixX
         bZubKdSLuh4vEa3hVTXrW10fnY8LT1KrLpe7Z+uaZNBh/N9vldEWj2np+zBN0BkrJpZt
         X7kpoN8UrvZQ6CGRpa/WKAEbzWAcTo/jwgfiRYX9XWEgP2WRxyLFFoZNPVIYmiDlj/FY
         BxdiLyVev5nbus1Ko7YFtxa6AbFBHfUNxZgKFKDfHpDot9JlKSvrr2Aj4e8yVvKo97HA
         o69w==
X-Gm-Message-State: AOAM5329Y0LNYJY9OvYh4Isg/xIf16QWwn+KrnJ8Vy5M2FGT/TY7/eyM
        KIx85SmYcZd9xvnu7f2+zTs=
X-Google-Smtp-Source: ABdhPJxDkz2/SsRqi/rnlmlLRfj0/YIZdeYNaTT2CXH5zmLHUsCnLg01kQlSuaQqPH9z3lx4BTqr8g==
X-Received: by 2002:a17:902:c405:b029:12c:3732:9121 with SMTP id k5-20020a170902c405b029012c37329121mr5089167plk.76.1627698459247;
        Fri, 30 Jul 2021 19:27:39 -0700 (PDT)
Received: from sol (106-69-176-40.dyn.iinet.net.au. [106.69.176.40])
        by smtp.gmail.com with ESMTPSA id j187sm3967797pfb.132.2021.07.30.19.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 19:27:38 -0700 (PDT)
Date:   Sat, 31 Jul 2021 10:27:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH 2/3] line-info: provide
 gpiod_line_info_get_event_clock()
Message-ID: <20210731022732.GA4434@sol>
References: <20210730144356.23079-1-brgl@bgdev.pl>
 <20210730144356.23079-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730144356.23079-3-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 04:43:55PM +0200, Bartosz Golaszewski wrote:
> Provide a new getter for the line-info object that becomes the
> counterpart for the setter used to configure the event clock type with
> line_config. It allows to check which even clock the line uses for
> edge detection.
> 

"to check which even" -> "checking which event"

That is my only comment for the whole patch set - eveything else looks
good.

Cheers,
Kent.
