Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E503FC2CE
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 08:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbhHaGcr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 02:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbhHaGcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 02:32:46 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0AEC061575
        for <linux-gpio@vger.kernel.org>; Mon, 30 Aug 2021 23:31:51 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso1202534pjh.5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Aug 2021 23:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wx1FDrVHCRBqDvRaHXak7M9kfgXHCkU5zPaASGw2oLA=;
        b=aPJa2N2MY5Z7BKQF5gTAMAyTuN7gxdROFNru4ixmqR+6K6Eai7JK6GVv6IMqPYTQPm
         4woSXX6gnH0ZuFC+om9Bf8Or74CTSzg+74vMPY2T6kMxDYNIrKYjVocVCRo8e2qwiArE
         xWYvlUBy5P99Ix1QLLKagMn8X9VqOJ8f/JOlGz9poVdbWDKGvTHTiBtcPaKqLDvYCq6D
         HXI7K9qLNpnswBYh9p7MHorx65FTSxNO3oio2RIdYTG7XlPCcZJJDVUtkyENwTtpahCk
         TqUPv05fcWpSQ5y036aYs3PKvLN6+Z6oS5LGBCU8t+OT41qByaH40rSpslzEEMdN+KpE
         BkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wx1FDrVHCRBqDvRaHXak7M9kfgXHCkU5zPaASGw2oLA=;
        b=JGrVPeOHo0rlByB73pfqMH+42UKwllvnTzNVCMhmkLm7edFzv6qPkfg9ymeO7dUDBi
         rbPAhIjgSnZB1n3qPjE/HoVZw8AI+a+kM88pRHQH7xdfGM6Q8XwFj9zWyBdvDZvUbd2t
         4QxgpeH8zr0PRlzR1/EVeTSXPUFKv14grbJCWxnFGyTA1jmJss2LvzXXp88SDblCUK9M
         5gVIHWURQdalaOiPD/3GvsdBz/XKgUiTni9VdxtgHs8Mmg1+UZtAN1uXwsNuAcMCghSi
         26SSeuCDzyCPmv0bKqMV/L6iFrkuFe1vTzCrEEssTDZtg/3NvjIVgz80eHptddXoxoAI
         JuIA==
X-Gm-Message-State: AOAM531veSx533dteSI6tsHdMPo46lbUk9xaer56jGGjWGufv3ZG3+Ua
        jDpO19LcQT1+zBPr1PXS8Hs8IA==
X-Google-Smtp-Source: ABdhPJzwbDvXXfhIxrp8QSQqB48TnUI6F5NGl+r7oFXzRWGJBYGkY92yx00/9g0/BBpLhMowfwv1hg==
X-Received: by 2002:a17:90a:6a01:: with SMTP id t1mr3496203pjj.31.1630391511361;
        Mon, 30 Aug 2021 23:31:51 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id z67sm16827221pfb.169.2021.08.30.23.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 23:31:50 -0700 (PDT)
Date:   Tue, 31 Aug 2021 12:01:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel test robot <lkp@intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] gpio: virtio: Fix sparse warnings
Message-ID: <20210831063149.gcctzqtn635mn3wb@vireshk-i7>
References: <32ab7b833743449b21f529cae41f4cbb60dc863c.1630387746.git.viresh.kumar@linaro.org>
 <20210831022224-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831022224-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31-08-21, 02:25, Michael S. Tsirkin wrote:
> On Tue, Aug 31, 2021 at 10:59:25AM +0530, Viresh Kumar wrote:
> > Fix warnings reported by sparse, related to type mismatch between u16
> > and __le16.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> I'm not sure which tree has the above commit - can this be squashed?

It has gone via the GPIO tree:

https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/log/?h=gpio/for-next

I believe it can be squashed, Bartosz can confirm the same though.

> Also, the driver lacks a MAINTAINERS entry - we want at least
> L:      virtualization@lists.linux-foundation.org
> on all virtio drivers.

Sure, I will send a patch for that.

-- 
viresh
