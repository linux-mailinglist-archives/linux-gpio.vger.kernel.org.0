Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF27438DE6
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 05:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbhJYDtS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 23:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbhJYDtR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 23:49:17 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF98C061764
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 20:46:56 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id o133so9420969pfg.7
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 20:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/AFzt9a03HvrzF/aUcgwiHi6Uj4MGjCuRw7CvjIeKX4=;
        b=vRD7I9Iqo/IdEJamLZ+mSLIqTJLY4hw9nYeDuf4mXsWCteFyfOUwkyEwHXGDKeQ49h
         o2XCiirScHDWlVq/Ucy87qtW/H0r5gJ+m4HTzohlY39OaSvyNh29zpgyuXl3SEZD3GRU
         4A4PK2+shid7pzrq8Tkni1OUkXpHlPmsweTKC5TjuJqsJifv9aiXyoF48brHiMogybsc
         jDoBEF8rR9vT6zgpOjWC1Q3G6n7cqX6xjG1h2Si2Uvo8rU/Xj4TFEe4cJHCpBMCcydnl
         Tsh+H286ynxrS2MidBThuOCVOnpd4P8CN+NnvRHctkG8FkLHLmN06WMk+6yYavqw2WS0
         pZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/AFzt9a03HvrzF/aUcgwiHi6Uj4MGjCuRw7CvjIeKX4=;
        b=kmfPaTGta2BrrtYAEJL9SPW5x6tdiUbSltzcy5QZ520+r6ccG9qm64GL9xsK5n7hYG
         Z7wKGBngQfADvKYXe68bfx52zEIZH88lElIe5JIQceGzdta/RS9pSMcqayQuvEuTyV5Y
         AX41T0oP+g73VJ/xCP8Ni6HNqfM7Od3SDKpM3Ykg7UUVA7kLG7LDNZLK3mtvTCMy8HEU
         34nOCJuqgGfteOHo5dpmLZj5LK0wqwuHJHXVYAsnASIpO1OhS8bNmmpUE7iXyxMU6Oyw
         CFQ+qP/kW0/1UHHfCre2xNkoT7tciOAYwQ5w1qcnWAg5WkDpRCWFzLqWZWC8uAZQWRdS
         j7tg==
X-Gm-Message-State: AOAM5333TxdSNKEOFxIfBbOAAamtDwPPcHMa1Bv6EAaVeIybwAbd3lx+
        qellrrZjXpL9S8XWK9sjf8dBEw==
X-Google-Smtp-Source: ABdhPJxt2uJ//k1UJHoYEOz48FeXXbEX1gBN3xG1Lxq7tI1tBMysKqYM2K7XLXlqrZRNBNRVYL2QjQ==
X-Received: by 2002:a05:6a00:cce:b0:44c:af88:eb00 with SMTP id b14-20020a056a000cce00b0044caf88eb00mr15920107pfv.45.1635133615614;
        Sun, 24 Oct 2021 20:46:55 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id t2sm14432258pgf.35.2021.10.24.20.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 20:46:54 -0700 (PDT)
Date:   Mon, 25 Oct 2021 09:16:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH V7] gpio: virtio: Add IRQ support
Message-ID: <20211025034645.liblqgporc53lkg2@vireshk-i7>
References: <ae639da42050ee0ffd9ba1fffc2c86a38d66cec4.1634813977.git.viresh.kumar@linaro.org>
 <20211022060746-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022060746-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22-10-21, 06:11, Michael S. Tsirkin wrote:
> On Thu, Oct 21, 2021 at 04:34:19PM +0530, Viresh Kumar wrote:
> > This patch adds IRQ support for the virtio GPIO driver. Note that this
> > uses the irq_bus_lock/unlock() callbacks, since those operations over
> > virtio may sleep.
> > 
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> I think this can be merged - while ballot did not close yet
> you already have a majority vote Yes. Worst case we'll revert
> but I don't expect that.

Thanks.

Bartosz,

Can you please pick this up for upcoming merge window then ?

-- 
viresh
