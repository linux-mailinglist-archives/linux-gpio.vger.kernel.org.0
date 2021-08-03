Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8402A3DF1C5
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 17:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237007AbhHCPsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 11:48:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:46396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236994AbhHCPsH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 11:48:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A5A60EFD;
        Tue,  3 Aug 2021 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628005676;
        bh=MG4fAieao0UPi4ffT0mbv01ftN/DNkPTsgdtYW/U3b0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JMxzV8817ns0XcLosSwn1TLOGdXCxTTb3nBhRBb1PdBUrW5Nnd/7xx/D7oh3eGvTM
         WK1nrMfIGlBgj7eHwljrNB2a1OnkfMJy7eONBxFJhrggHMOCOUN1B5BN/95IaHuFIu
         bKsNYve1kUpE/mRsq7C2W9RwB3aJbpS5fWCspPTpUnYsLDtpNQ+6joNtsFAUvZpFiS
         Nn4D8Ebal1JPMuyTxipY5u6vuLpi6GcF7JPCcO1X6WZLcUGk2fanMfHA/k8pSD8xs5
         e2NoXPjBkwojqn0SEcGmhOWB4eimT/NVQe+KT65xA4lDP1+U9wKRypiL6AY0r2p3m1
         r3tLen9j4PnBg==
Received: by mail-ed1-f51.google.com with SMTP id x90so29529755ede.8;
        Tue, 03 Aug 2021 08:47:56 -0700 (PDT)
X-Gm-Message-State: AOAM533wiHrQL0uvpBzbRiHK6anfO79FkzfhOAQ1prFHMycVL9n+HKem
        H+Y7hEIFc4B67nvguEUkT+fppZkQMNd/YuHy2A==
X-Google-Smtp-Source: ABdhPJzuBnfkNQtqqLg2h9sTkUQTkdyCINtgxA59VUetynvl9LB1QKx942SZoaOuOW2U1PMG/KLxk/DqtQdWvGwL0ik=
X-Received: by 2002:a05:6402:2043:: with SMTP id bc3mr26352466edb.62.1628005675201;
 Tue, 03 Aug 2021 08:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627362340.git.viresh.kumar@linaro.org> <acf7402ef4aabc0ad6295c32846f2bef1cd9b56a.1627362340.git.viresh.kumar@linaro.org>
 <YQhKKyPmOUE8z+US@robh.at.kernel.org> <20210803043014.paskwghdio6azplp@vireshk-i7>
In-Reply-To: <20210803043014.paskwghdio6azplp@vireshk-i7>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 3 Aug 2021 09:47:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ6_ktTQKiy_xx9DhjQ3=imfvSZpBem5fXwVY7O49EgCw@mail.gmail.com>
Message-ID: <CAL_JsqJ6_ktTQKiy_xx9DhjQ3=imfvSZpBem5fXwVY7O49EgCw@mail.gmail.com>
Subject: Re: [PATCH V4 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

n Mon, Aug 2, 2021 at 10:30 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 02-08-21, 13:40, Rob Herring wrote:
> > Humm, how does one implement interrupts without a parent interrupt? It
> > uses the parent virtio,mmio interrupt?
>
> Kind of, yeah, but not necessarily.
>
> The interrupt information is passed over buffers shared between host and guest.
> Now the guest may process the buffers when it receives a notification from the
> host, that will be at downpath of an interrupt for virtio,mmio. Or the guest may
> poll on the virtqueue and process any buffers as soon as they are made
> available, no interrupts then.

Okay, thanks for the explanation.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
