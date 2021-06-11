Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEE03A3DB5
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 10:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhFKIEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 04:04:38 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:42815 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFKIEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 04:04:38 -0400
Received: by mail-pg1-f169.google.com with SMTP id i34so1798959pgl.9
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 01:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dDD6ozQuHkfsjJXIeMviIaHXaasyFUacyXt/Ls+8R/4=;
        b=H2vJeZvjIh9pgu2UG0sKGBhDj+x8aQhG/MfT1Cxtztd+CblLvs4QSwrLvNWyQ01BVy
         i6rUSqwWT6YxqHNCSJ0o4eDEUa0E51TjjqikU8ZGPtTjHvKJxcqAci0jvgffQrMqqyPl
         5GWj7dgoSke+cSE0YiCPmRTujqWqKuHKMMo10p8azW1mM7x/cuOtHMabsZUBU5OBD2+a
         lUX+G37CNYrOL0Gt8PzG3CIysFGvU9gqaETpWcWCaPrG5IBtUfmv9N79D9bToGBjgCRR
         i2ThzGT/BoEAOF2sV+5EkiQxPUywzJwdzzTtLePbsw7q6Z2f4vkYfFjgP4ws+Otgcu8Q
         G/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dDD6ozQuHkfsjJXIeMviIaHXaasyFUacyXt/Ls+8R/4=;
        b=dt4snaalR4psVbACMCM3th8t51eqdwzvdoUYuRkf+7jZorA+Zpii9GGm/nCIoWMB+0
         1GHSMExWWjOoRTvMylVcjyCrxGeEsRsi7qdoxTSKNhGcf/rvkc7TF/Cb3jA01YJBD1dn
         vIHS6GdsitBRM2hZTa0YIj+tlgXuUzcSBEKb87K0kn3M6pkx31fEGFnSU+FTMfUYA5oI
         Q1w6FJUe+Z5uv1GAkE3Nf3TxMJ5TfjzjUb+JTdGJCsXO9wNyt0E4oSW4s1nAMj9CKgZP
         xCsbx5yiXTf6kq1kgme40YKbw74jqvPRy4Glj7Aweb1/1jHvPxyV4vEyBtqR2vDDXIe4
         s10Q==
X-Gm-Message-State: AOAM533lOch093qJDwJ+SoDiPUdweopOsiJzNY2RV/0E36CEODBhiNgx
        aUMZqe7B5cnXGVwXMRoB+nbXOQ==
X-Google-Smtp-Source: ABdhPJzQqL9BA7ZqXfmHsqjU1YOZ0ByTX9+TANEafYUiavQpaP9W5HLlNZKSJtUVqq4l4MmWcghzvA==
X-Received: by 2002:a62:2c92:0:b029:2ef:6118:a934 with SMTP id s140-20020a622c920000b02902ef6118a934mr7063663pfs.80.1623398484479;
        Fri, 11 Jun 2021 01:01:24 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id j4sm4258445pfj.111.2021.06.11.01.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 01:01:23 -0700 (PDT)
Date:   Fri, 11 Jun 2021 13:31:22 +0530
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
        Alistair Strachan <astrachan@google.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-06-21, 09:42, Geert Uytterhoeven wrote:
> Hi Viresh, Linus,
> 
> On Fri, Jun 11, 2021 at 5:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 10-06-21, 22:46, Linus Walleij wrote:
> > > thanks for working on this, it's a really interesting driver.
> > >
> > > My first question is conceptual:
> > >
> > > We previously have Geerts driver for virtualization:
> > > drivers/gpio/gpio-aggregator.c
> > >
> > > The idea with the aggregator is that a host script sets up a
> > > unique gpiochip for the virtualized instance using some poking
> > > in sysfs and pass that to the virtual machine.
> > > So this is Linux acting as virtualization host by definition.
> 
> The gpio-aggregator is running on the host...
> 
> > > I think virtio is more abstract and intended for the usecase
> > > where the hypervisor is not Linux, so this should be mentioned
> > > in the commit, possibly also in Kconfig so users immediately
> > > know what usecases the two different drivers are for.
> 
> ... while the virtio-gpio driver is meant for the guest kernel.
> 
> I my PoC "[PATCH QEMU v2 0/5] Add a GPIO backend"[1], I didn't have
> a virtio transport, but just hooked into the PL061 GPIO emulation
> in QEMU.  The PL061 QEMU driver talked to the GPIO backend, which
> talked to /dev/gpiochipN on the host.

Hmm, interesting.

> > Well, not actually.
> >
> > The host can actually be anything. It can be a Xen based dom0, which
> > runs some proprietary firmware, or Qemu running over Linux.
> >
> > It is left for the host to decide how it wants to club together the
> > GPIO pins from host and access them, with Linux host userspace it
> > would be playing with /dev/gpiochipN, while for a raw one it may
> > be accessing registers directly.
> >
> > And so the backend running at host, needs to pass the gpiochip
> > configurations and only the host understand it.
> 
> So QEMU has to translate the virtio-gpio communication to e.g.
> /dev/gpiochipN on the host (or a different backend on non-Linux or
> bare-metal HV).

No, QEMU passes the raw messages to the backend daemon running in host
userspace (which shares a socket with qemu). The backend understands
the virtio/vhost protocols and so won't be required to change at all
if we move from Qemu to something else. And that's what we (Linaro)
are looking to do here with Project Stratos.

Create virtio based hypervisor agnostic backends.

> > The way I test it for now is by running this with Qemu over my x86
> > box, so my host side is indeed playing with sysfs Linux.
> 
> Can you please share a link to the QEMU patches?

Unfortunately, they aren't in good shape right now and the backend is
a bit hacky (Just checking the data paths, but not touching
/dev/gpiochipN at all for now).

I didn't implement one as I am going to implement the backend in Rust
and not Qemu. So it doesn't depend on Qemu at all.

To give you an idea of the whole thing, here is what we have done for
I2c for example, GPIO one will look very similar.

The Qemu patches:

https://yhbt.net/lore/all/cover.1617278395.git.viresh.kumar@linaro.org/T/

The stuff from tools/vhost-user-i2c/ directory (or patch 4/6) isn't
used anymore and the following Rust implementation replaces it:

https://github.com/vireshk/vhost-device/tree/master/src/i2c

I can share the GPIO code once I have the Rust implementation ready.

> The GPIO aggregator came into play after talking to Alexander Graf and
> Peter Maydell.  To reduce the attack surface, they didn't want QEMU
> to be responsible for exporting to the guest a subset of all GPIOs of
> a gpiochip, only a full gpiochip.  However, the full gpiochip may
> contain critical GPIOs you do not want the guest to tamper with.
> Hence the GPIO aggregator was born, to take care of aggregating all
> GPIOs you want to export to a guest into a new virtual gpiochip.
> 
> You can find more information about the GPIO Aggregator's use cases in
> "[PATCH v7 0/6] gpio: Add GPIO Aggregator"[2].

So I was actually looking to do some kind of aggregation on the host
side's backend daemon to share only a subset of GPIO pins, I will see
if that is something I can reuse. Thanks for sharing details.

-- 
viresh
