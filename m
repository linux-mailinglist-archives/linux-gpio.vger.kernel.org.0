Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2AF3A5F15
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 11:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhFNJ12 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 05:27:28 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:34518 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFNJ12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 05:27:28 -0400
Received: by mail-pf1-f169.google.com with SMTP id g6so10113685pfq.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zMkdb6UnzsmFoGQuydSUH9T+jo8wlm34o+dnsVNGaOY=;
        b=yj58aZCITvmYsGGj7Nk7gTFZgHtEggMHzWZ75qNOIRRTEuNfBJ51g2pH/ybeSJ1SwD
         QJKQQJ4431wv40jvILOT2zTpLY37Pmb79CZJvSH9WHYT8yESH/hcwodGpHJ7gNkzhqCZ
         6rK4tGwNcv/UNi3KOr5c8YYV7WaX7n3MlyFNONQPvGHS2n4KZq9R+KlFTnoCPbERBwo0
         CR/lqpjYEGcAVnQmENHr7EYajipilph4sbUz3rXzXsYYkck9f+B6Z6kqIA0bNpjbuhvH
         eoPjDL+Ot1oOiVyu34IiHe6hfhvBVP4ManGNNsyv7dUYrYolzHjOSubEfP+hSrWQeAdf
         s+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zMkdb6UnzsmFoGQuydSUH9T+jo8wlm34o+dnsVNGaOY=;
        b=Hkmo5IwrQFSOcfQj+uEtPPq09UNsu2OhdWg3eOrWgigC8h2hhF4/ZfhlDm52EC+5xh
         eS98LYOBtYrzUB0yDU9HwWxlxOmTJRonYrEsXTfE8NisrAU4jpkyaHuU3ywdNCBShfLO
         bDbcSQQFeAu0iJ7377i3qG5J0oWMJHM+qMv9tEvEAYmouKdWwKCnGiuHZVzVmrGElHOG
         9+I/gQocqW0PEiNbw9fujBuxBdUD6gt2MeBYQmT5XNoDVGaRVs5UEg8FSIQY1YdSeyFV
         JZvcmiaWMzAyGkEsUOqI3CtvgWJc8oWA0UGHNJesmt6lB+fUrq3Gubijc13/PmEwvsNT
         xrXQ==
X-Gm-Message-State: AOAM532wIVZH3IDmQk4R3JbX8cS5NnJ6p95zEUo8bhqnu0xkfmsgcKOc
        kfOArLb/3K2L9vzkkSClzt0NBA==
X-Google-Smtp-Source: ABdhPJxlNHDHLzS1JN+AlXEDxsg1diObJaCyoiXgBPZpknYyUf1Rtey2rbTHk5lENDG3Si5HyrUmKw==
X-Received: by 2002:a63:5057:: with SMTP id q23mr16171557pgl.271.1623662665642;
        Mon, 14 Jun 2021 02:24:25 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id ge13sm17169989pjb.2.2021.06.14.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 02:24:24 -0700 (PDT)
Date:   Mon, 14 Jun 2021 14:54:22 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        Alistair Strachan <astrachan@google.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210614092422.jmq2i3vlkjmy6cvf@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <db2d29fd-ff27-0c75-2472-dd031564dbf1@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db2d29fd-ff27-0c75-2472-dd031564dbf1@metux.net>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14-06-21, 10:03, Enrico Weigelt, metux IT consult wrote:
> for qemu side you might be interested in my patch queue from last year
> (including the virtio-gpio implementation) - it also introduces an
> gpio backend subsys that allows attaching simulation gpio's to various
> backends. so far just implemented a dummy backend (that can be
> manipulated by qemu console) and using it just in the virtio-gpio
> device emulation.
> 
> https://github.com/oss-qm/qemu/tree/wip/gpio-v2

Interesting, so this is a qemu-specific backend you have here.

The way we are looking to write the backend (in Project Stratos at
Linaro) is to make it hypervisor agnostic. So any hypervisor that
understands the vhost protocol can use our backend without changing a
single line of code. The backend will not be part of any
hypervisor's/VMM's source code. FWIW, this doesn't add anything
special to the virtio protocol (like GPIO).

Here is a C based backend we have for I2C:

https://yhbt.net/lore/all/cover.1617278395.git.viresh.kumar@linaro.org/T/#m3b5044bad9769b170f505e63bd081eb27cef8db2

I started with keeping code in QEMU itself but now replaced it with
one in RUST.

https://github.com/vireshk/vhost-device/tree/master/src/i2c

-- 
viresh
