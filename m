Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2EA3A6743
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 15:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhFNNCY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 09:02:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:49244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232685AbhFNNCX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Jun 2021 09:02:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2640A6128B;
        Mon, 14 Jun 2021 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623675621;
        bh=cmeghb5OpWFLq7tRJ6LNoYRfIj4uzggUba4RYoZl59E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=O/Rkeb0apUkYKz50aDex7cYYeGXodeaALATWbTaG7B6ydyZhDsa/57RY/ZXpiK37X
         sefVH+cJ/LdQ+OkUQUQpY9BmXQCC2dNKeP4uVUqYgU0oa4emcMAzBEbHvFhU0BPnQc
         T1vuLpBZ0E6WG154WE4xz3owQOgN1saYzGz6XFBgztaqitICYdIgNk4sW6BecY8gUZ
         si2qVtF+EPO26MtRVvTAMQwn/SsoyCBEmv+kYsFe1OpmBgCYkyaGRoTSN4QDN7D09m
         YZO5gQ/PSWV90r+d6FL0+VerZu++yEn60Xy+CHUmRqq/g+VP0Le1JkeywQh3f1H7+e
         YMTxvqIv3naWA==
Received: by mail-wm1-f50.google.com with SMTP id g204so12075241wmf.5;
        Mon, 14 Jun 2021 06:00:21 -0700 (PDT)
X-Gm-Message-State: AOAM531FCBUp4B4P1o2SZ7Pme+P4W6J0j2j/huzmTD0TYQEbsnDDdYkA
        mb5HI2veMRMHjg7ZlFdBQzix1vAbJ43PqL2/JB8=
X-Google-Smtp-Source: ABdhPJwI7/6ClkT5wfhMFBzNmwwqYDceFv7C8RzAp2xaxsyDD8fdovvEndgASYFqSxX3VykY8T0kDzgJ2nmh+wbdycU=
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr32196928wmc.120.1623675619684;
 Mon, 14 Jun 2021 06:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
 <20210614102119.qifm5sj7fpg54iqo@vireshk-i7> <CAK8P3a10yObfX_dFMSsqW_fGugdtz0nutJFwDB_OY0DebdGjXQ@mail.gmail.com>
 <0100017a0a9264cc-57668c56-fdbf-412a-9f82-9bf95f5c653e-000000@email.amazonses.com>
In-Reply-To: <0100017a0a9264cc-57668c56-fdbf-412a-9f82-9bf95f5c653e-000000@email.amazonses.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 14 Jun 2021 14:58:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0-cVF=n1OxURZM8yXLKCPAAgBnZNXZVUzxA8m2ZzjP1A@mail.gmail.com>
Message-ID: <CAK8P3a0-cVF=n1OxURZM8yXLKCPAAgBnZNXZVUzxA8m2ZzjP1A@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 14, 2021 at 2:50 PM Vincent Guittot via Stratos-dev
<stratos-dev@op-lists.linaro.org> wrote:>
> On Mon, 14 Jun 2021 at 14:33, Arnd Bergmann <arnd@kernel.org> wrote:
> > On Mon, Jun 14, 2021 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > I think most importantly we need a DT binding to describe what device
> > nodes are supposed to look like underneath a virtio-mmio or
> > virtio-pci device in order for a hypervisor to pass down the
> > information to a guest OS in a generic way. We can probably borrow
> > the USB naming, and replace compatible="usbVID,PID" with
> > compatible="virtioDID", with the device ID in hexadecimal digits,
> > such as "virtio22" for I2C (virtio device ID 34 == 0x22) if we decide
> > to have a sub-node under the device, or we just point dev->of_node
> > of the virtio device to the platform/pci device that is its parent
> > in Linux.
> >
> > Adding the Linux guest code to the virtio layer should be fairly
> > straightforward, and I suppose it could be mostly copied from the
> > corresponding code that added this for mmc in commit 25185f3f31c9
> > ("mmc: Add SDIO function devicetree subnode parsing") and for USB
> > in commit 69bec7259853 ("USB: core: let USB device know device
> > node") and 1a7e3948cb9f ("USB: add device-tree support for
> > interfaces").
>
> And something similar is also done with SCMI protocols which are
> defined in a SCMI node. A  typical example:
>
>     cpu@0 {
>         ...
>         clocks = <&scmi_dvfs 0>;
>         ...
>     };
>
>     deviceX: deviceX@YYYYYYY {
>         ...
>         clocks = <&scmi_clk 0>;
>         ...
>     };
>
>     scmi: scmi {
>         compatible = "arm,scmi-virtio";
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         scmi_devpd: protocol@11 {
>             reg = <0x11>;
>             #power-domain-cells = <1>;
>         };
>
>         scmi_clk: protocol@14 {
>             reg = <0x14>;
>             #clock-cells = <1>;
>         };
>
>         scmi_sensors: protocol@15 {
>             reg = <0x15>;
>             #thermal-sensor-cells = <1>;
>         };
>
>         scmi_dvfs: protocol@13 {
>             reg = <0x13>;
>             #clock-cells = <1>;
>         };
>     };

But this example seem to be completely different from the ones I mentioned:
The scmi node that you have here looks like it shows up under the root of the
device tree, not below the virtio device that implements the scmi transport.

         Arnd
