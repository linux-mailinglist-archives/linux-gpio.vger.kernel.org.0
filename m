Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400683A66F9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 14:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhFNMwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 08:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhFNMwP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 08:52:15 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24088C061766
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 05:49:59 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id k8so3099772lja.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nzgH/7Iv6iyxaTVlqwmoCQllTxzdAPS+ij+2D3qFMC8=;
        b=MN3G10KS8zT9A3PhB5Whd+ylxP7qd2wucfj/5keASzzuwCyM4ftUcJHBgukcPd4Pbi
         M2sT9MXbnDkO9scWr2I3T528lXZnloLOK1R53oNHTI0JVx54U5c1yTOf4uax87g7oFG1
         PY/Wn2e/Jup0aTF0CuE3x3gdEb8yG3Kkf2YS+pSv0E/7cDpcfSnUO+o4gZlH7no8wL0b
         ANynTpBGzjNcn22NpH7+l2UqT/b0nm0eKwhq6DDUFLY6ou1PNlLUyuVplSvh0jJ3NxK5
         p1W5biqA2S8Vtimkdz9r7CO6lLavrfXQCKCxPWMUnSQ622Abr26sv3nFyaLvvja4JjyN
         C6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nzgH/7Iv6iyxaTVlqwmoCQllTxzdAPS+ij+2D3qFMC8=;
        b=KysrSpLOw5ClERicIOva35ro/oN/X/uX7zDXSVjZNkbv4hplP1x3GBKAl0XYJ78b1k
         e+mh+H9s57tD+N4HZSfrenPptQ05vAjlL5B08AkjOdvDlAmNv69KtBgXJe500TIImqc8
         eFslgF0siKV2FdI3eeS9NTQSGVIARDjYEhAp2MbK9RrVt/mOOzT6u/gLET88Ufk/soN3
         QOzTYkDx+4RPPxrUy6QX8lBtSaRyuLmzpADvy8kjtE4p5kWKu0RDnuKINxAfGbSwb3kt
         K/mPfudNnqVBN8Ncm/kSr8zVzKqioqdCrenGH7KTRVwPPOuD4flxxxE1dboJenM7ahdN
         rcdg==
X-Gm-Message-State: AOAM531PH65hdRH63mHGqMfWHh8sX/cfkeAocMbgnNvi8b6KHzMDeZYy
        vwodzkIhUoN0DWiq8wyz670qMZM1Wfh3MUiJ7l1tow==
X-Google-Smtp-Source: ABdhPJxXgaeWu55AiwDpFSX1knceRo6M50ozO98e2aZd+QWtZlRpV7I/Vq9pbwLxgqBjj3lTppA7lW4OmhWGDU9b5Wk=
X-Received: by 2002:a2e:858a:: with SMTP id b10mr13186671lji.445.1623674997438;
 Mon, 14 Jun 2021 05:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
 <20210614102119.qifm5sj7fpg54iqo@vireshk-i7> <CAK8P3a10yObfX_dFMSsqW_fGugdtz0nutJFwDB_OY0DebdGjXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a10yObfX_dFMSsqW_fGugdtz0nutJFwDB_OY0DebdGjXQ@mail.gmail.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Mon, 14 Jun 2021 14:49:45 +0200
Message-ID: <CAKfTPtA7p1JMP9g8o_qpZ4-2u4KVNs4VENJtrV4H7EnqrmYqHw@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Jun 2021 at 14:33, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jun 14, 2021 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 10-06-21, 15:22, Arnd Bergmann wrote:
> > > Can you give an example of how this would be hooked up to other drivers
> > > using those gpios. Can you give an example of how using the "gpio-keys" or
> > > "gpio-leds" drivers in combination with virtio-gpio looks like in the DT?
> > >
> > > Would qemu simply add the required DT properties to the device node that
> > > corresponds to the virtio device in this case?
> > >
> > > From what I can tell, both the mmio and pci variants of virtio can have their
> > > dev->of_node populated, but I don't see the logic in register_virtio_device()
> > > that looks up the of_node of the virtio_device that the of_gpio code then
> > > tries to refer to.
> >
> > To be honest, I haven't tried this yet and I was expecting it to be
> > already taken care of. I was relying on the DTB automatically
> > generated by Qemu to get the driver probed and didn't have a look at
> > it as well.
> >
> > I now understand that it won't be that straight forward. The same must
> > be true for adding an i2c device to an i2c bus over virtio (The way I
> > tested that earlier was by using the sysfs file to add a device to a
> > bus).
>
> Yes, correct, we had the same discussion about i2c.  Again, this is
> relatively straightforward when the controller and the device attached
> to it (i2c controller/client or gpio controller/function) are both emulated
> by qemu, but a lot harder when the controller and device are
> implemented in different programs.
>
> > This may be something lacking generally for virtio-pci thing, not
> > sure though.
>
> I think most importantly we need a DT binding to describe what device
> nodes are supposed to look like underneath a virtio-mmio or
> virtio-pci device in order for a hypervisor to pass down the
> information to a guest OS in a generic way. We can probably borrow
> the USB naming, and replace compatible="usbVID,PID" with
> compatible="virtioDID", with the device ID in hexadecimal digits,
> such as "virtio22" for I2C (virtio device ID 34 == 0x22) if we decide
> to have a sub-node under the device, or we just point dev->of_node
> of the virtio device to the platform/pci device that is its parent
> in Linux.
>
> Adding the Linux guest code to the virtio layer should be fairly
> straightforward, and I suppose it could be mostly copied from the
> corresponding code that added this for mmc in commit 25185f3f31c9
> ("mmc: Add SDIO function devicetree subnode parsing") and for USB
> in commit 69bec7259853 ("USB: core: let USB device know device
> node") and 1a7e3948cb9f ("USB: add device-tree support for
> interfaces").

And something similar is also done with SCMI protocols which are
defined in a SCMI node. A  typical example:

    cpu@0 {
        ...
        clocks = <&scmi_dvfs 0>;
        ...
    };

    deviceX: deviceX@YYYYYYY {
        ...
        clocks = <&scmi_clk 0>;
        ...
    };

    scmi: scmi {
        compatible = "arm,scmi-virtio";
        #address-cells = <1>;
        #size-cells = <0>;

        scmi_devpd: protocol@11 {
            reg = <0x11>;
            #power-domain-cells = <1>;
        };

        scmi_clk: protocol@14 {
            reg = <0x14>;
            #clock-cells = <1>;
        };

        scmi_sensors: protocol@15 {
            reg = <0x15>;
            #thermal-sensor-cells = <1>;
        };

        scmi_dvfs: protocol@13 {
            reg = <0x13>;
            #clock-cells = <1>;
        };
    };

>
>         Arnd
