Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC60C3A5EF9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 11:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhFNJQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 05:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhFNJQ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 05:16:59 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9641C061766
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 02:14:43 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id z26so10085078pfj.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KENaF6daomgz5scNtXqZjtsZnSgCNhEWOpxx4RhJ4Yw=;
        b=VJx+kBHFYVtSRtJbdOXkmjTmPuh/Y5FBlscGVnemlXQ3z5mQXpwXFHZoLmqxiGjhtw
         2svtmA0s+JTY622IJYpBay/e18FAtFK/RPkWfhhZuYCViUuRfEMXq1g4zNG5foQm83d6
         /7vAoP1BIr5vfyTnu69CjoTZcvGzNZdYn7HShgbPX3tKMk/cMTVatGYnzhWyH+/9M/jY
         igBoSRq2zPYW5clyihkJiXhHvWbACfbXXZiP8lZmeCsjJx4bzSosRmGKuiHBLWcHiIFW
         IUk0fA+Np1DkJepm6lBOeLr/0E7lWKK9O6mUo6p0CwBt8dxpY1ePRhBm3GZz9A3/kq2L
         mhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KENaF6daomgz5scNtXqZjtsZnSgCNhEWOpxx4RhJ4Yw=;
        b=bwsZZA5rtkNQXaLNoGShmpGiGP3AnZYnmn4ioEZVGphxaMnYiotCC7qHgsbusm869O
         VD/C6IrRaINDbr12Elps094e+i/a/js7t2HP4MizcUgoSuPQXzYV78FMuzTyzFLw/pBf
         AJqVwinY9mEkpWmLGuR4rw9fSIiryf8jbgVMDRfP47lfRg1TIgeLIle9fk+cc94Kndc7
         QGmFYpinjzBI+QLgrlPvW0k/xVqHObyfdajRygIzFA8qlHvWZTU83Ppjam4pQmJ1wEev
         5yO5TasBds8iisYiRBKaaqOqE6CNG5Drm9t2Y4M6PYf7i8Tq+GgRX0M8PdnYQGW9wPlu
         jFaw==
X-Gm-Message-State: AOAM530VfxgkcfYjRKm0xqry3GECoCwcteP5k8bgamPaNDmoJhXmxiga
        dEhKjyOuNdR5BtBDScbRtUKkYw==
X-Google-Smtp-Source: ABdhPJzZLhEjeNg7mvi5U/yF0J7tUlxRUljd+rBr+kbJUkO3TmIBNVQe5LHoPiXGtU3JUsIhK4bRTQ==
X-Received: by 2002:a63:4653:: with SMTP id v19mr15988605pgk.240.1623662083282;
        Mon, 14 Jun 2021 02:14:43 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id w21sm12531959pfq.143.2021.06.14.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 02:14:42 -0700 (PDT)
Date:   Mon, 14 Jun 2021 14:44:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
Message-ID: <20210614091441.b6gaei3dgx73skvt@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
 <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
 <CAHp75Vf0+bCnnD3wtkrPvFbr2k3A0r3eWNp87PyksiC7euaqdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf0+bCnnD3wtkrPvFbr2k3A0r3eWNp87PyksiC7euaqdw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14-06-21, 11:12, Andy Shevchenko wrote:
> On Mon, Jun 14, 2021 at 11:08 AM Enrico Weigelt, metux IT consult
> <lkml@metux.net> wrote:
> >
> > On 11.06.21 10:01, Viresh Kumar wrote:
> >
> > > No, QEMU passes the raw messages to the backend daemon running in host
> > > userspace (which shares a socket with qemu). The backend understands
> > > the virtio/vhost protocols and so won't be required to change at all
> > > if we move from Qemu to something else. And that's what we (Linaro)
> > > are looking to do here with Project Stratos.
> >
> > Note that this is completely different from my approach that I've posted
> > in autumn last year. Viresh's protocol hasn't much in common with mine.
> 
> That's why we have a thing called standard. And AFAIU virtio API/ABIs
> should be officially registered and standardized.

Yes and here is the latest version (which is based on the work done by
Enrico earlier). It isn't accepted yet and is under review.

https://lists.oasis-open.org/archives/virtio-comment/202106/msg00022.html

-- 
viresh
