Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEDE3D5525
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 10:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbhGZHdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 03:33:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232876AbhGZHdd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Jul 2021 03:33:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A73D60F50;
        Mon, 26 Jul 2021 08:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627287242;
        bh=5mjM1Ytfi5UgsmQfBbGqvUg9ri6hULEJaJw17eMMlrU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PRyl0o0QYjgZE2Zd2xnNkmNRrIhZzCYf+ftl+vgT1TbsZPPQhuHlmXYbJeaVwKV09
         yPAqKFMGC8fJvg4jBg63eZlQ8w+h3IjO3GZgKUWEeNQANn/ODDTxk+V9S4PjdxLnqf
         szqlv5gv3HStKG2aMMhVRhAYNq7gSAWVoVxzIeAjvDH87bSwZRKnc/S6W7nqj946AU
         JIeqBw5d6lDBG6qceQf+AfeBGqRN63dbFUN1nm9iKLK52RoL5GEfqrZGy9DnQY9608
         7cz+lK5gEB7BdioUvCuloZhbkDmlKr0Dt+c/R9DF5zpy8gdFVW/kwk2qaYf0+cQ4DL
         0qelRX6l20KoA==
Received: by mail-wr1-f54.google.com with SMTP id r2so10029067wrl.1;
        Mon, 26 Jul 2021 01:14:02 -0700 (PDT)
X-Gm-Message-State: AOAM533sjwx9AFqFzNUfn5QjPoGJ+Uq5pKcXHMMtYF8kad5nS8NIo2bG
        fRRDszjnA+1YCGbNTOrsbQoxzkElUD0zELoehYQ=
X-Google-Smtp-Source: ABdhPJyNYev5KC65NvMDPeSDIxa4em4yA71IxUWsUgKKdyCd+J+znxk2GeXMgj/FHnhisgchv8xKKXErQEqEI7NQRSI=
X-Received: by 2002:adf:f446:: with SMTP id f6mr4981837wrp.361.1627287241223;
 Mon, 26 Jul 2021 01:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627273794.git.viresh.kumar@linaro.org> <605b87ce93b9a528810a5857984bfe6b913d5e73.1627273794.git.viresh.kumar@linaro.org>
In-Reply-To: <605b87ce93b9a528810a5857984bfe6b913d5e73.1627273794.git.viresh.kumar@linaro.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 26 Jul 2021 10:13:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ze7+z=KQVtYZeGuA3Sjw=wWb44bjsbPpTaw_8m8U5ww@mail.gmail.com>
Message-ID: <CAK8P3a1ze7+z=KQVtYZeGuA3Sjw=wWb44bjsbPpTaw_8m8U5ww@mail.gmail.com>
Subject: Re: [PATCH V3 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 6:53 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This patch adds binding for virtio GPIO controller, it is based on
> virtio-device bindings.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>, except

> +
> +properties:
> +  $nodename:
> +    pattern: '^gpio-virtio(-[a-z0-9]+)?$'
> +
> +        gpio: gpio-virtio {
> +            compatible = "virtio,29";

The node name here does not appear to be mandated by the schema, but
most others name it "gpio", so I would do the same here instead of
"gpio-virtio".

       Arnd
