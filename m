Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBBA435FE3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 13:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhJULGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 07:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbhJULGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 07:06:21 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6671CC061749
        for <linux-gpio@vger.kernel.org>; Thu, 21 Oct 2021 04:04:05 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id s136so22024024pgs.4
        for <linux-gpio@vger.kernel.org>; Thu, 21 Oct 2021 04:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H7h39YJezI/AQjzQk8oI118TtArXLNThRmFxElKjFnE=;
        b=a1bkgZF6gr5217ghqtHlYdTpO7to3nZoAvYwPCZuwVYoiUubPl5CG1nn7ch82IiKos
         6JDR63byWaAWlVIQVX/Rx32kpPOzVakEbptqB4yAu74/XIgPe+E4ohPgPFblzd8ORglG
         UtyoB9CEQXNCJE9YRmrL4PdEnRUpTtRWYy3i+ciQCWH8cG119qPSL5yhLC+wYTHfuIto
         NzDaindrOC+BVi9vBeigGkW8HTQthkbqFf0Lxsug+5BqnUkhgAtqE8aWRvditDKH4nxs
         58LMMLQcApWbRH4MwoMmNREi/nuqQGxF/rrspY+ft9ooeniXN9pzfXE2TxMi1seO2cIi
         AXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H7h39YJezI/AQjzQk8oI118TtArXLNThRmFxElKjFnE=;
        b=Dm1grhprSuD+JVNGCNjiGDOo4lexyv0etWi5hZAC+kCoOVg0EiKE8ccudmSVco46VJ
         aznXkSwbY4VgSluERlIXmv/do4GgmW+cjEnPB0SCgnHQ5KipNeQmIPmBpJea39ByFs25
         G0BAeGZole+zPsB5vi+Jxyb36EAscXiLyVJVDr8nW4aJ0oancEOQgIZQws1Vfy7yyoWN
         cSBBF8HmLrtHxT9sqLB8U2DRRGKtFxRmq6kE7n0xt8IxLq4RMb8TEI/PxFvh+CzdNSfH
         PxlEncQWPWdaMjm2MHqWfEVusEWKVDv+z44ihWKC9DBMNhcD9Nj6lCeKktQH0oHOUwLg
         2lzA==
X-Gm-Message-State: AOAM530174i9jxJzQTWMgQvff7oAH47lONo+EVurvepcbgPXV2lhz4Yf
        Q9Poj+je6V1qh2vCSGmoKfmSaQ==
X-Google-Smtp-Source: ABdhPJyzXLbpHNyIhF4TwQtIBYQThWtMF9D4rpWdamXt6mDCp2GlP8GxsqU2v5c5DSAS2gqtU1MbVQ==
X-Received: by 2002:a05:6a00:138a:b0:44c:b200:38d7 with SMTP id t10-20020a056a00138a00b0044cb20038d7mr4858301pfg.5.1634814244820;
        Thu, 21 Oct 2021 04:04:04 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id s13sm6537994pfk.175.2021.10.21.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 04:04:04 -0700 (PDT)
Date:   Thu, 21 Oct 2021 16:34:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
Message-ID: <20211021110402.rpm4v3g4rhznjteh@vireshk-i7>
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
 <20211021043443.snhqpac5ofmxfb7k@vireshk-i7>
 <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
 <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7>
 <CAMuHMdWDRGmxt55vvRTnyu5SwXCDtkcOLmKA87cd4SSa8S+Z=Q@mail.gmail.com>
 <20211021104950.nhvify5lo7y5fdfh@vireshk-i7>
 <CAMuHMdUutrjVRv7QOjQ3dKqWxAD6fQu4QqXvOjCREj3guGi6xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUutrjVRv7QOjQ3dKqWxAD6fQu4QqXvOjCREj3guGi6xA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-10-21, 13:02, Geert Uytterhoeven wrote:
> Exactly.  And on CRIS (no longer supported by Linux), there won't
> be any padding.
> 
> So I recommend to always add explicit padding, to make sure all
> members are aligned naturally on all systems.

Right.

-- 
viresh
