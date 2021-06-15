Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318623A7D61
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 13:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhFOLjw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 07:39:52 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:34428 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhFOLjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 07:39:51 -0400
Received: by mail-vs1-f44.google.com with SMTP id q2so9600903vsr.1;
        Tue, 15 Jun 2021 04:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dEMwKaBtIH7S3fAHfNJawJ0VDIFQVTRz5VU7710Dgcs=;
        b=B+0zDrwsNnKxdnPYBuIeYJBCvXer+SpPMtRQGVQTLKVTv3fNWk4QgI0C4Wf41vskdI
         cJiqaIQ9ohZse7DuX2+Q4rsv+whkef7HR2QuThVLsn0Iw5bb8vfAkxe5Ew21fWE5t61n
         AyxCdg2QzAaNAxv5HGEwt13DfqKzwMopaVYImBj3aMBbTJfwAM7iC7LCmhVulAia9xqn
         k4RFPRiH9KEWI2z3zMvF3RxRddvS1L+P78mW5ORnQBwi+hXVRgaSiB7hXfeSNA5H9SaQ
         ArBqNSvQQnxBqDe1VbYM7C/VApLZBTk2kVYnkclmBxWnIzWq35Z4fItggVN1niRYZNv+
         ugxQ==
X-Gm-Message-State: AOAM533RwyKuTgarMNSJGfsho4IjYkT8xB2bZdZcZq25DN5/odh69WvK
        Jh9tY32vdlfx8oTiM7BLKYluNF05Fa8I8KteliI=
X-Google-Smtp-Source: ABdhPJzWu0ZzQHuXV4PYNLkuX4/zyAG0cMCexlumQE0LzgSqdbPE35wZuXi0z3ynFv+/B+I3sIMNXeQKnTb1W0uliBA=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr4274193vss.18.1623757067039;
 Tue, 15 Jun 2021 04:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7> <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7> <CAMuHMdVL4VH09ixPcpqqokNJeYd68Th2Y6Lz4PZTF7h06OOBGw@mail.gmail.com>
 <20210615111551.7tcz7teqp4olhodf@vireshk-i7>
In-Reply-To: <20210615111551.7tcz7teqp4olhodf@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Jun 2021 13:37:35 +0200
Message-ID: <CAMuHMdUKNgRgH+=fHW9RZijdFT9syPu-FD=EyA-PkrtUrg3AdQ@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh,

On Tue, Jun 15, 2021 at 1:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 11-06-21, 10:22, Geert Uytterhoeven wrote:
> > The same reasoning can apply to your backend daemon, so when using
> > the GPIO aggregator, you can just control a full gpiochip, without
> > having to implement access control on individual GPIO lines.
>
> I tried to look at it and it surely looks very temping and may fit
> well and reduce size of my backend :)
>
> I am now wondering how interrupts can be made to work here. Do you
> have anything in mind for that ?
>
> GPIO sysfs already supports interrupts, just that you need to register
> irq for the specific GPIO pins inside the aggregator ?

So far I hadn't considered interrupts.
Will think about it...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
