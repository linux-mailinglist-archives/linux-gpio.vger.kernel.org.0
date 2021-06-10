Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C073A343C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 21:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhFJTo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 15:44:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:45798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229823AbhFJToz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Jun 2021 15:44:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7A0961414;
        Thu, 10 Jun 2021 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623354178;
        bh=e1qYqp9Ml4zXeFi4sMYRsxc9z9GOxYqqa+CE28wWI4U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UtwWwOounqCQDCI2o/53cZnytek08hk2lIx6VXjwSc6qRSpnetjeqNGhQ4NmbEvU1
         GkCRcTc3Y45E2a8Dvqy5J3RoNJMbMqPt597XTM7Jgw7RZAFohVLRXHjb691iK1autt
         /Lbe0GfobQxTqPF2ahUPC+oQ7PvJrocoT6vNfYMHp/adAsqhzqXJ7MN509Q6moDtNU
         qV3C8Uti77SZZaJDiSZDiihxsDa69eg6/CZw5XGIPXgSi4xfK8uEmKvtLsNJRQAnkx
         aS5T6Mtwplu/kd6YAYlLwQKFf8IgrC14aEN4PDVRPYlRQIKAlxEiVEeeVOpsNjDa0P
         wyBVZb8KIpBkA==
Received: by mail-wr1-f49.google.com with SMTP id c5so3538812wrq.9;
        Thu, 10 Jun 2021 12:42:58 -0700 (PDT)
X-Gm-Message-State: AOAM531D1dvpY5+mNf2xqIj3xFAm6f28hzc44RYUYkzZoB7WaXJbpUAE
        xKZOTJcwnD0GCUuJFbqRIME9+oA4Ih9s5OZCjro=
X-Google-Smtp-Source: ABdhPJySe7wd3XPNxujQj2IjqvLZE5RbBmPWKoLwo/i2COztQ95WbJMiDewLDXNHMXFcXE1bVv/W041r59h4dgeLYOE=
X-Received: by 2002:adf:a28c:: with SMTP id s12mr104051wra.105.1623354177356;
 Thu, 10 Jun 2021 12:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
 <01000179f6a7715c-cd106846-7770-4088-bb7c-a696bfcbf83e-000000@email.amazonses.com>
 <YMJF5fF31ksmSdiq@myrica>
In-Reply-To: <YMJF5fF31ksmSdiq@myrica>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 10 Jun 2021 21:41:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1E7WzhX4NvUPn6iDzsUqTzAEMcsow7feTGRWTLe9+FFQ@mail.gmail.com>
Message-ID: <CAK8P3a1E7WzhX4NvUPn6iDzsUqTzAEMcsow7feTGRWTLe9+FFQ@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 7:03 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Thu, Jun 10, 2021 at 04:00:39PM +0000, Enrico Weigelt, metux IT consult via Stratos-dev wrote:
> > On 10.06.21 15:22, Arnd Bergmann wrote:
> >
> > > Can you give an example of how this would be hooked up to other drivers
> > > using those gpios. Can you give an example of how using the "gpio-keys" or
> > > "gpio-leds" drivers in combination with virtio-gpio looks like in the DT?
> >
> > Connecting between self-probing bus'es and DT is generally tricky. IMHO
> > we don't have any generic mechanism for that.
>
> DT does have a generic description of PCI endpoints, which virtio-iommu
> relies on to express the relation between IOMMU and endpoint nodes [1].
> I think the problem here is similar: the client node needs a phandle to
> the GPIO controller which may use virtio-pci transport?

Right, the code to set dev->of_node is fairly simple, the device probe
just needs to scan for child nodes. Aside from PCI, similar code exists
for USB and MMC/SDIO, which are usually discoverable but sometimes
need additional properties.

> Note that it mostly works if the device is on the root PCI bus. Behind a
> bridge the OS may change the device's bus number as needed, so the BDF
> reference in DT is only valid if the software providing the DT description
> (VMM or firmware) initializes bus numbers accordingly (and I don't
> remember if Linux supports this case well).

I think you can mark the host bridge as "probe-only" to prevent the OS
(at least Linux) from renumbering the buses.

The part I did not find though is assigning dev->of_node in the virtio_device
to a child of the PCI device node.

      Arnd
