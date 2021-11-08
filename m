Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C09C4478EA
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 04:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237239AbhKHDdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Nov 2021 22:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237235AbhKHDdn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Nov 2021 22:33:43 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DF4C061714
        for <linux-gpio@vger.kernel.org>; Sun,  7 Nov 2021 19:30:59 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id s24so14947496plp.0
        for <linux-gpio@vger.kernel.org>; Sun, 07 Nov 2021 19:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g2PQ6C+FR5hJWiqWPGZRyR8q4wNDTf7CmMs7qJQULxc=;
        b=ypH6yPWgnEHzQ/nzEzuFR1UHC/JDbLCq6QxJuFwHznzSvyA+KEInRyo0mW64LN7G39
         pIlLxp0F8XPNHUYp+6lIxm4dIwF85FjEJDR1RNjfBJugQA3ushLqDs4R4SE89Pty/P1D
         VNke3D7YhY7yzbOjWBCp8sPw7pQ7PYWqaIu76cNsxTRVaERx2igHMWiMABrkpeuh1y8x
         UoJXi8+xjMceIpW8Em6se176NDwDrtfgGvS0kWBwE2Ssi62Sm7+RM0cdc87yw/Y6G2O8
         Dy+IRrl0zXk32meGbJaf0LoSFu5UdsSUt8nL1IJNjjGE5eGA6S9Hsul+VR8CmOgs5F18
         m0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g2PQ6C+FR5hJWiqWPGZRyR8q4wNDTf7CmMs7qJQULxc=;
        b=Jqdeg3aCorAVehFB7rq1NgoMsl8t3Tv9XjVLJA3RGtVfF0mUDorzVCnarDCFcUxodH
         SGKf6eUmOz+8dZM5xCL7KfCzuVP04mHJUTYwjIYHFAp+2zYX918VbeUbO8ugpnCSJQdV
         4o2Xbn/MNaT2Kn1eVM446mvwQsMNMb/mGQXW1w1pdNf6zArWMCQexm6Vqk6cFlfxpu/e
         FjRxTRb7kk132JMyU39/+o+L2KuzyUE9uKrKZTYysrW+YaklZ55f690/nkjLKPQ4vkqd
         Ugl1BSC+MRjXm3JqXM3Alz4oEw9XKyha0aL3I77QpirDU741f3v6njjuhb36qtwf3SKw
         MGng==
X-Gm-Message-State: AOAM530FK9C+PyxNAnL8JYfQwpOBdSZ9bCnwSVjjmLilqpREJExv3FfF
        VPwRWWwvy2KsA4XJj4eF0D913Q==
X-Google-Smtp-Source: ABdhPJyghMeimTOuGNkOw96lKUav/KH8HAFXBfKsgjwu7gPty/HHoV837fxU8OqGbGchOXl+m2qoDg==
X-Received: by 2002:a17:90a:1190:: with SMTP id e16mr48859089pja.209.1636342259167;
        Sun, 07 Nov 2021 19:30:59 -0800 (PST)
Received: from localhost ([223.226.77.81])
        by smtp.gmail.com with ESMTPSA id e8sm11008595pgn.46.2021.11.07.19.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 19:30:58 -0800 (PST)
Date:   Mon, 8 Nov 2021 09:00:56 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH V7] gpio: virtio: Add IRQ support
Message-ID: <20211108033056.gdslnxjp4fc7473i@vireshk-i7>
References: <ae639da42050ee0ffd9ba1fffc2c86a38d66cec4.1634813977.git.viresh.kumar@linaro.org>
 <20211022060746-mutt-send-email-mst@kernel.org>
 <20211025034645.liblqgporc53lkg2@vireshk-i7>
 <CAMRc=MfPtRiBYxsTzz06qpUiNTSw4kPjz3B5YbH_WJ7zN6jvYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfPtRiBYxsTzz06qpUiNTSw4kPjz3B5YbH_WJ7zN6jvYg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04-11-21, 16:37, Bartosz Golaszewski wrote:
> I picked up the v7 I see in patchwork (but not in my inbox :( )

I did send it to and can see both in the --to field:

Bartosz Golaszewski <bgolaszewski@baylibre.com>,
Bartosz Golaszewski <brgl@bgdev.pl>,

Anything wrong there ?

-- 
viresh
