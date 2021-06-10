Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9133A31A8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 19:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhFJRFv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 13:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhFJRFu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 13:05:50 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5773C061574
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 10:03:53 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id f17so6592001wmf.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bXhxyKfILOtbokM8zhO9ev3eR2f27dRG5A7af/C4DQw=;
        b=DMyaY3PS/UuBOCcAv0WKwICkJXkmfeM1e89x3xj9HxEmJIz6oMmNdMb5eAxBcJE0Ys
         bBYF6hJmSOu1r9AXjTt02A+9yWHb2AUNUR5G68af8Izv9M/m9oQ+7um/mBKwUI+Oj8jY
         uFZavM16DaPHRWGnWxm8xL8lk3c2OR+yJKUuHP6C21C2wlGRBlUfkopWVLIIZeEv9Zoo
         DuMiThPgXP3rTj7udUcSIJRmiJcB1D3p8tjJvPngix5g94LRqb3vPJubGySqimN2h/qh
         sthYQNqh7TJB6t+6mhomwCA7RYVht4W0QLKOtvLb4Txkoesmu75s7JE07l+BFw7aq4u8
         cDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bXhxyKfILOtbokM8zhO9ev3eR2f27dRG5A7af/C4DQw=;
        b=mOkTHmD7BY+oUwOQsQTu7IY4ZrT+qb/qhMI5UymSwZg218WvEtEiwjfQVCrxGWsn4o
         VcTRrtQugnLYKqtFsXsRxl5R/wJVAfnBSzvcpcPAlqkEfJt8JmwzbhljhVvA+8PCKs08
         BYyEI0t7gtdPHX5gA6DTuaPEVo60AiDIEHDD6O3u6kGCrtEB6Bna6PWH45a/yILPX5Kl
         BNeAIugIyZpnUBHXUrgj5zlRZrnvn3ZQbk4I+ZjM+L7sEwWXuasSU5Xb7yMQvAt4OUkt
         VJHvRHHDvoj+PLUKsfxNkAMxikzL3MC8gN2nZgPdIkT0gqhWlKSqYT3oOZnE9Y/kooV9
         d1ag==
X-Gm-Message-State: AOAM532B/K9m+tAKt4PjhZfriMZqOGhrYKVDZM1/gbeRT1zu6ruSMtnc
        pGfBOjOujcn6mD2CG0qkMk6I8A==
X-Google-Smtp-Source: ABdhPJxKsTVP9wK9UsF+G/NtCMnej7AiNjRbbyOwhC+0A8plqOW12aHey11nmX6sZiUmWulu0ZQt1Q==
X-Received: by 2002:a05:600c:b50:: with SMTP id k16mr6024505wmr.137.1623344632456;
        Thu, 10 Jun 2021 10:03:52 -0700 (PDT)
Received: from myrica (adsl-84-226-111-173.adslplus.ch. [84.226.111.173])
        by smtp.gmail.com with ESMTPSA id 4sm3823543wry.74.2021.06.10.10.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 10:03:51 -0700 (PDT)
Date:   Thu, 10 Jun 2021 19:03:33 +0200
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Arnd Bergmann <arnd@kernel.org>,
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
Subject: Re: [Stratos-dev] [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <YMJF5fF31ksmSdiq@myrica>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
 <01000179f6a7715c-cd106846-7770-4088-bb7c-a696bfcbf83e-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01000179f6a7715c-cd106846-7770-4088-bb7c-a696bfcbf83e-000000@email.amazonses.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 04:00:39PM +0000, Enrico Weigelt, metux IT consult via Stratos-dev wrote:
> On 10.06.21 15:22, Arnd Bergmann wrote:
> 
> > Can you give an example of how this would be hooked up to other drivers
> > using those gpios. Can you give an example of how using the "gpio-keys" or
> > "gpio-leds" drivers in combination with virtio-gpio looks like in the DT?
> 
> Connecting between self-probing bus'es and DT is generally tricky. IMHO
> we don't have any generic mechanism for that.

DT does have a generic description of PCI endpoints, which virtio-iommu
relies on to express the relation between IOMMU and endpoint nodes [1].
I think the problem here is similar: the client node needs a phandle to
the GPIO controller which may use virtio-pci transport?

Note that it mostly works if the device is on the root PCI bus. Behind a
bridge the OS may change the device's bus number as needed, so the BDF
reference in DT is only valid if the software providing the DT description
(VMM or firmware) initializes bus numbers accordingly (and I don't
remember if Linux supports this case well).

Thanks,
Jean

[1] Documentation/devicetree/bindings/virtio/iommu.txt

> 
> I've made a few attempts, but nothing practically useful, which would be
> accepted by the corresponding maintainers, yet. We'd either need some
> very special logic in DT probing or pseudo-bus'es for the mapping.
> (DT wants to do those connections via phandle's, which in turn need the
> referenced nodes to be present in the DT).
> 
> >  From what I can tell, both the mmio and pci variants of virtio can have their
> > dev->of_node populated, but I don't see the logic in register_virtio_device()
> > that looks up the of_node of the virtio_device that the of_gpio code then
> > tries to refer to.
> 
> Have you ever successfully bound a virtio device via DT ?
> 
> 
> --mtx
> 
> -- 
> ---
> Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
> werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schlüssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287
> -- 
> Stratos-dev mailing list
> Stratos-dev@op-lists.linaro.org
> https://op-lists.linaro.org/mailman/listinfo/stratos-dev
