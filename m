Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A89B3A7CF9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 13:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhFOLSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 07:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhFOLSA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 07:18:00 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32837C061574
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 04:15:55 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e1so8282347pld.13
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 04:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i84JjlRo2D2f/v7VuRGvpKj9m4FZoDnu564HcAYYGaY=;
        b=VTHFnc+4SnsSRV0D5jDxumRtE49WlOQLlikQFoE39XX8Wb5j25weHyQksV4/4Bn/f/
         2BlH2QShf5TXe7zDKdkjS+Gs3tE+RPTxzPeLwN6/cgZpqkATlyaJxVgB4UH0wPf327ZK
         3sg02GpQY+QtWBfJzL0HKJd0UvY+5w37Y3noV/Tr0+AqPol3BIvomuMAHNODERgZAoqL
         i/Vs7+tAbxxbfDyLn0N9FCKTiBr4s+0yLA7s9wxgR5BNyxKwXe1WIRfmXQ9vO7+XwMz+
         fRkr+bY9h/tbHmcW6rwAiRQ/L8eR4C2H9AUb+8oXl5chJm9EhUjEwS6TWkLgYkE2AW3p
         2uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i84JjlRo2D2f/v7VuRGvpKj9m4FZoDnu564HcAYYGaY=;
        b=Lu1T2nZQ6eDlaO61UXW7MDEaTMOcEV3AlmokOrAD0SioDVzxhmnIVDQNloAOuuVBTy
         jASorUyCMcP1SxhdHgHALLwO0cAOoGeIF3TBSnmw2GzRb9QrN+Vcvtblo9VkoPxp4Anf
         WcVRXS4gRoXsonuktc5Kt/89b6jHer6qQn7bN44AQJeRsOb9K8T61omUmWfJfUJcq4vQ
         fjm9DVuepIMoFdAndzwFS6ecysE7pL/mGOLBNr8+gfX3VDygXtJGB+wTvam4ZNBKZOaH
         pcjD/qnKXBcWZ1UfSpi9qlQEi5boa2i+iX2ZYgIGXGJD99JTXXbngwCGGxR3ZICXVtT5
         Vbjg==
X-Gm-Message-State: AOAM5322AMjHxFXfP1FqLipkC+gHuxodAbHEIC3+lOren/jGQWtU3LsQ
        WVXQcqD/JPX5wN80YZZj0BoV9A==
X-Google-Smtp-Source: ABdhPJyprFGOjuuA6oVBkx5SM8o2ljPT3jBLG+8fzP8YN3F1g2qb2jzWJ2heaZFu4ovB1sQ+xoLJ2A==
X-Received: by 2002:a17:90b:2504:: with SMTP id ns4mr4466637pjb.39.1623755754669;
        Tue, 15 Jun 2021 04:15:54 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id g8sm15949343pgo.10.2021.06.15.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 04:15:53 -0700 (PDT)
Date:   Tue, 15 Jun 2021 16:45:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210615111551.7tcz7teqp4olhodf@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
 <CAMuHMdVL4VH09ixPcpqqokNJeYd68Th2Y6Lz4PZTF7h06OOBGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVL4VH09ixPcpqqokNJeYd68Th2Y6Lz4PZTF7h06OOBGw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-06-21, 10:22, Geert Uytterhoeven wrote:
> The same reasoning can apply to your backend daemon, so when using
> the GPIO aggregator, you can just control a full gpiochip, without
> having to implement access control on individual GPIO lines.

I tried to look at it and it surely looks very temping and may fit
well and reduce size of my backend :)

I am now wondering how interrupts can be made to work here. Do you
have anything in mind for that ?

GPIO sysfs already supports interrupts, just that you need to register
irq for the specific GPIO pins inside the aggregator ?

-- 
viresh
