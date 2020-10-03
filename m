Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823AB281F84
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Oct 2020 02:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgJCADH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 20:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJCADH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 20:03:07 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A30C0613D0;
        Fri,  2 Oct 2020 17:03:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so1883659pji.1;
        Fri, 02 Oct 2020 17:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4wadPL5eRQ8Hbv2G79TEpM4KGWCbAz6BIZrfCkhvXS4=;
        b=CX4FzF5HQo4aWMpOFQeBvEIGgwmdmfw6z4UFMbpOr4+Yli8BuDlsgSCyJF6bbIhK8N
         VHRf4mfrwHm37t9Pj7SljZf5XiZdimtHl/6qWWt0YfzA/Xg/inK2dV2+qm5fbvnnzJsf
         kJc6Oj6fBl3ABeZ+torudGhywLeQa8emLGVNVVcTVGKGpTQCvN7EUreJVjHlqvjaRe2h
         ACeNJVPKyP0Y4WRvYjZiYClbZHVkad0yp2VhClN/dqhqoXKmmD2gvOZVUOMZ215QzQrw
         43L1zT4DIr0mHCAv8T6k1ZFggbaHkJQoSe9jLWJVAZCCHQO3BD2FnKeNqmMN0zMFhKTm
         Gwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4wadPL5eRQ8Hbv2G79TEpM4KGWCbAz6BIZrfCkhvXS4=;
        b=p9A/djUV2RD175V/g8wl5+QkOJ+NkfZistTS557gfI6tsP6MWrzzT8n5kqDGD/Ivax
         S3QExtdhOkjWzl/dPZvZ5loBIM51aA28bdEzpITJ5S+T34yDJkGLpQmZpw8i7LIoiA/s
         RW1KQphmAjK1CZ9cOChcAjYB3U1tpInex2KfGIx46KXjmX4ZsCj26waY02V/2NsscxSq
         444MGH62pmaocdq6iw8CDTPmFouVaqlkpG0YB7dsGInMIo95ZpyH+XtD5GG9pwyc4BAg
         e4Y1UWBHxRl5JcdHVh2poZPZb1+oqnUT49PDF+chMCZXOBjmC2lXlnX9LLcoDhxrfs5R
         8l3g==
X-Gm-Message-State: AOAM531PPMHeSN3flmR9vOUbPcnek5VsOIHsUUd3Wgul7pRG7rHxyQjC
        /FZMkSBoNBU/cSTwP+J5cJw=
X-Google-Smtp-Source: ABdhPJy6aDucl8FLM8J70ZSmYRA259SOdEdYonn852vYH80Q/GKrkairB+m/ReHBi3u1R0VQ+/Qamg==
X-Received: by 2002:a17:90a:b293:: with SMTP id c19mr3434480pjr.122.1601683386425;
        Fri, 02 Oct 2020 17:03:06 -0700 (PDT)
Received: from sol (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id r14sm2877142pgm.7.2020.10.02.17.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 17:03:05 -0700 (PDT)
Date:   Sat, 3 Oct 2020 08:02:59 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] docs: gpio: add a new document to its index.rst
Message-ID: <20201003000259.GA6321@sol>
References: <cover.1601616399.git.mchehab+huawei@kernel.org>
 <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 02, 2020 at 07:49:50AM +0200, Mauro Carvalho Chehab wrote:
> There's now a new ReST file. Add it to the index.rst file.
> 
> Fixes: ce7a2f77f976 ("docs: gpio: Add GPIO Aggregator documentation")

Shouldn't that be:

Fixes: fd1abe99e5fb ("Documentation: gpio: add documentation for gpio-mockup")

Cheers,
Kent.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/admin-guide/gpio/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
> index ef2838638e96..7db367572f30 100644
> --- a/Documentation/admin-guide/gpio/index.rst
> +++ b/Documentation/admin-guide/gpio/index.rst
> @@ -9,6 +9,7 @@ gpio
>  
>      gpio-aggregator
>      sysfs
> +    gpio-mockup
>  
>  .. only::  subproject and html
>  
> -- 
> 2.26.2
> 
