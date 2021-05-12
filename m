Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C88F37B9D7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 11:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhELKAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 06:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbhELKAf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 06:00:35 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F187AC061574
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 02:59:26 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso2542740wmc.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Xv66uSypjir4jy5I6sEQsec6QT2ejT+lfOXgIGsNm/4=;
        b=YOW03NWqE16Y6IBJ+DPy98eDm2LqEsTemChzKWpn1VcvfZ7pCtR9naHEhbV8HmYOAy
         n9yNQ+4Hpal+NIgUSGWfyxKdQ44jWOOR7757EKyjjMGKWEtXMFk+W+d7NvzXyjV0Kx/B
         Chq+U3i/U4er3iGw397pxjLksy6DG9c3j/2r9NCT1EtCQdHbjJQ8V7Lbn4t7lBli5jaY
         hzSMIX+5+mTHFm07z48MYPnuy0+QQCHIVIve3YuezrYOMppUJqwdv85EJARs9r5LSRHh
         IT+v9wIuToPGhRBvtJ1afYZs3lAJbF1LRWp32eMA4BgkuQOCtCs6iDy49i5EXC+jwsLS
         HenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Xv66uSypjir4jy5I6sEQsec6QT2ejT+lfOXgIGsNm/4=;
        b=ZVlqTd3Qhwv8uWDfvSTYg/6ZGXcHbDlcvwr96zkXUAWdPfjScZ1gp6mkNKlMUbt2aa
         R9ASFKJW/0XVtp3w4IK6wYJjuah7MdlEWc6tXv0THcTKYA+j5XrLedxO4QIobUsVKYku
         Lv34LfpSswoJ9yDSRPwLkvcfFIwAwTCnLhp8S7+8KENhDmq8HXeodyGdsA5Sk9MgXqMA
         yZlzid2CS+pzHmuuJufZqy7sXxnXUoUYgm3YBNvb1YMNybih2r/w2lZp36K5FtI+JO10
         d47o4tTEjgLsm3gjYbeOZebOVC+jQy8RyDSWW89RMZbjeauR/7pPyoLpVQuAeedEQn4d
         oP1Q==
X-Gm-Message-State: AOAM531FlkW9uMA6+Uk+agv996MryTJxfF7jB/roSQqjGCM3A+uiBYDu
        jtY7HkwB+86gtcHM/KDxZoyWqw==
X-Google-Smtp-Source: ABdhPJyJ6fTwNwBxiKk/rB2t7DwtSsKLCKdlawNQfqUi2UqyOq4m86muCEXW3J52lt3SwEnYuPOwxA==
X-Received: by 2002:a05:600c:1907:: with SMTP id j7mr37178513wmq.158.1620813565641;
        Wed, 12 May 2021 02:59:25 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v20sm26793277wmj.15.2021.05.12.02.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:59:25 -0700 (PDT)
Date:   Wed, 12 May 2021 10:59:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mfd: lp87565: fix typo in define names
Message-ID: <20210512095923.GC805368@dell>
References: <20210219223910.1831-1-luca@lucaceresoli.net>
 <20210308140440.GH4931@dell>
 <365cc875-e1de-0a81-6163-007f574779d3@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <365cc875-e1de-0a81-6163-007f574779d3@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 12 May 2021, Luca Ceresoli wrote:

> Hi,
> 
> On 08/03/21 15:04, Lee Jones wrote:
> > On Fri, 19 Feb 2021, Luca Ceresoli wrote:
> > 
> >> "GOIO" should be "GPIO" here.
> >>
> >> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> >> ---
> >>  drivers/gpio/gpio-lp87565.c |  6 +++---
> >>  include/linux/mfd/lp87565.h | 28 ++++++++++++++--------------
> >>  2 files changed, 17 insertions(+), 17 deletions(-)
> > 
> > For my own reference (apply this as-is to your sign-off block):
> > 
> >   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> Gentle ping on patches 1 and 3. Both have at least an ack and are fairly
> trivial. Both apply cleanly on current master.

I'll take care of these this time, but in future, if you don't receive
further responses for ~2 weeks, you should collect all of the Acks and
submit a [RESEND].

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
