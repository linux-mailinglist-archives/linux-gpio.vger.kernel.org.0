Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C133F0226
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 13:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhHRLBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 07:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234630AbhHRLBN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 07:01:13 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A31C061764
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 04:00:39 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id y11so1736703pfl.13
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 04:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8C/in0krB+riQ0eZSSRSdP7EkmxB2WMWHtktCVN2wqQ=;
        b=B5S47QTtJ0TKz8xiiW7dUEgvBk/vW8gRuxTgStnQ8EQW3frKYCeVls+9FSzj3XDjgk
         pAHkPji3llkZ9ZLm4Q1xaT9Hk6mT9InN0qWbbvf4AcoK/cnXWKVtqy0NcghLEQSAvuwR
         MPpQlYin/FFiPKtv3dzH8O1j61FhMZ2JMGVC2m5lIz8Ki3K9w9fXOTPvbkwj6+wcH1Dx
         rysSEZ9J2Y61NCGVP6+WFCaIGqtqLumGAUkz63dS/kW7tR5crCwrxJVR7hHbrTYB60LM
         ZhTHvDu/ozuEjX3NzN1S1Bdu1eiYWzR/HpQMgEiKbzO+Kgp8heriROilo1G7o0bY9zdh
         HUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8C/in0krB+riQ0eZSSRSdP7EkmxB2WMWHtktCVN2wqQ=;
        b=Z/0zOsHl9YmLe/lQtLGzLaD5oVxHQ/yA1vjNTExCzQLAbOq1ahxBMpOcskNIXBMjMc
         LPLBswUN9TYlSVbQ+a7G807VqscVWW7ZDOWEkInp1C04s5FXoy/XXnk0TmP3wFZ5kWGW
         ckjbMp3gLGPJFC4SMRC+m2o/Sn4/Uij+NQGXMaAFO7RxaQ/bc1vzKoWPJJDSlESBkc/6
         HO3jA5jFx+07Dex3ekaRLeMGva2ZdHlwRCkgxZ+0ze93oM1yoWttH9mlS0+EDAMVSlEq
         pe1KDg5AXY5UlJhqjkazLB9MGbDzHfTijHIj1qVZLlqEe8ciUkb6VCNltU3oYsg0GH/J
         pq4A==
X-Gm-Message-State: AOAM5337zxGfr/nKKqxOhcxgxo7N4rTiio+mmLCWKnFHfXHoO/npBPeN
        YW5d0IUvmykB+bPXOO3dxDcb/g==
X-Google-Smtp-Source: ABdhPJwcDoOFfIzbJ+GjtEmN+5qujYZSrtK6wkrgL2lusIyF7Rfn+jMrdM3OuvseOINoaBvZjckVFg==
X-Received: by 2002:a05:6a00:238e:b029:35c:c5e:b82d with SMTP id f14-20020a056a00238eb029035c0c5eb82dmr8785069pfc.33.1629284438811;
        Wed, 18 Aug 2021 04:00:38 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id gl12sm4938471pjb.40.2021.08.18.04.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 04:00:38 -0700 (PDT)
Date:   Wed, 18 Aug 2021 16:30:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 2/2] gpio: virtio: Add IRQ support
Message-ID: <20210818110035.w6o2gpx5af5x2gm2@vireshk-i7>
References: <cover.1628590591.git.viresh.kumar@linaro.org>
 <96223fb8143a4eaa9b183d376ff46e5cd8ef54b4.1628590591.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96223fb8143a4eaa9b183d376ff46e5cd8ef54b4.1628590591.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-08-21, 15:55, Viresh Kumar wrote:
> This patch adds IRQ support for the virtio GPIO driver. Note that this
> uses the irq_bus_lock/unlock() callbacks, since those operations over
> virtio may sleep. Also the notifications for the eventq are processed
> using a work item to allow sleep-able operations.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/gpio/Kconfig             |   1 +
>  drivers/gpio/gpio-virtio.c       | 301 ++++++++++++++++++++++++++++++-
>  include/uapi/linux/virtio_gpio.h |  25 +++
>  3 files changed, 323 insertions(+), 4 deletions(-)

Marc,

Will it be possible for you to have a look at this patch, it will help
us understand shortcomings of the specification better and this
implementation as well.

Thanks.

-- 
viresh
