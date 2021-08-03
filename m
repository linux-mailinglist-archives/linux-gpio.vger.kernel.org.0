Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76FA3DE55C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 06:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhHCEaa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 00:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhHCEa2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 00:30:28 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08830C0613D5
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 21:30:18 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so3020437pjh.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 21:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WuU0zqp5FxDzXHdF6RFEsqh5sXTxns57RbzCe8eINV4=;
        b=U0yP0tud2140rIMQ9BsrY0xo0wzev+KHGRy4B6aHwt9CP2EJ8MocyiIyz6yYB2ZIEi
         6E6HN96OA3LJipeTxDzH+TNXQgVULyaQXWnUW/n1JlvjmsuBXmSDgkPgcNB3+RhQ6o+a
         ovnCxRYGzDDoJ7RcGNJmCYAS8gJLdYcBSYIEJAExO2xfpAHCwtCg79OsAXUpotjUU2BE
         spNmP4St0+FcuQt0c5hi/YfpOtY9epEeQ7lDNvdb91GTR4e5l44hQFy43MMux7+ienso
         1fgASFok9lixiXvGJaxhUw8PkcDvlGkykRO/WbHigND+qBGpks5pa/MByls6+VnwNc8W
         MIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WuU0zqp5FxDzXHdF6RFEsqh5sXTxns57RbzCe8eINV4=;
        b=GmitzUHtSQreN3I1Ly+H2TwHaNff6GlSmoMNeId3FGDv8yNCe9JHhiSxtmHuSv6gvb
         XYb8H10rDHLoj6tLEw/7/8eUJFSVK3ERwxiYUNta+zaVE0I5dyepuhCNLhWm4/iI1Htd
         dFTz1nuFYHHftW4o02wauYFjv9uXPLBDi3iqhs5MrG3pKx2lNgukrwKYhMFK5LlO5feC
         rbNML6Z4k5OQz9fc+g5THYz+wRXyoIiKJAJ9eCUehbx4qeIC/LiIfsRpiLiCyrkJKZsf
         gu4jJKHjdVrwxU3bKCkJ0QaxDSd8BdwYDf2beM7e60+PLJgkthllKgSi3UGIPYf8I1r5
         fCjA==
X-Gm-Message-State: AOAM533umHtFOj0biKeapg4jJeaJw2wb1SFKYXlAzO/66ehvAYsUqrNI
        HZSw/xq2zeFAYntqdT9x5aZO/g==
X-Google-Smtp-Source: ABdhPJwWgvDbFps8MFCa+isFcB0DfTlVKe9/ZNKxGryq1uLTkKlvKLKaFxw5Sik7NQhNI35ZTv1CSA==
X-Received: by 2002:a62:8fd4:0:b029:3af:3fa7:c993 with SMTP id n203-20020a628fd40000b02903af3fa7c993mr19305886pfd.77.1627965017486;
        Mon, 02 Aug 2021 21:30:17 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 21sm13539667pfh.103.2021.08.02.21.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 21:30:16 -0700 (PDT)
Date:   Tue, 3 Aug 2021 10:00:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH V4 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
Message-ID: <20210803043014.paskwghdio6azplp@vireshk-i7>
References: <cover.1627362340.git.viresh.kumar@linaro.org>
 <acf7402ef4aabc0ad6295c32846f2bef1cd9b56a.1627362340.git.viresh.kumar@linaro.org>
 <YQhKKyPmOUE8z+US@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQhKKyPmOUE8z+US@robh.at.kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-08-21, 13:40, Rob Herring wrote:
> Humm, how does one implement interrupts without a parent interrupt? It 
> uses the parent virtio,mmio interrupt?

Kind of, yeah, but not necessarily.

The interrupt information is passed over buffers shared between host and guest.
Now the guest may process the buffers when it receives a notification from the
host, that will be at downpath of an interrupt for virtio,mmio. Or the guest may
poll on the virtqueue and process any buffers as soon as they are made
available, no interrupts then.

-- 
viresh
