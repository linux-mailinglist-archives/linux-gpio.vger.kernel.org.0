Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA483701FB
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 22:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbhD3UUp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 16:20:45 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:40836 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhD3UUo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 16:20:44 -0400
Received: by mail-oi1-f178.google.com with SMTP id u16so53903327oiu.7;
        Fri, 30 Apr 2021 13:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Aw2YFdMeRBDtOUpE+/zM3s478RUBDTvqUKeVTeNhzu4=;
        b=HITzMcOnECqWxZgKktzXuor87i3jlPxrzdJ7D+q8hcvhPnw/y/EuPVgqqwpG1rxeTx
         6EjHL2yUxLe1UIHkRPQoIme+o0K6JJIYQ0u9cTp/ynGtNrCvVe6PpS8Hv+ZscMWaaWrq
         hYeV1PJ+RanrE4VRGLWmxta7PWOxuBHEVnQPyHaGvdTKXU+W0hTe/hsvo8qT8YMUW0Zf
         KrVDbCdYbOeNJ2mHmIGV6DvxirzGgFKFIWClebBKb3mI4C1ZkitdcTzmXa4OcRmA6gmQ
         KhQ3DpZqUUmvmj1NrWM0RiiT3mt5zKc4wEAcOauJpMGNHU1Xe0fN58n21b5nyW+rUklb
         /u6Q==
X-Gm-Message-State: AOAM531ySzIKFmTa6eg9UVimUrgaWvBNkjnKu70/5lQPqD2ZnRdywDyw
        Zh0In9u4GQ2h+ofcSg0bdg==
X-Google-Smtp-Source: ABdhPJy3JfUBvKEvMp0Fz+v/JfK2sB72f0Ebp7ReItbPDYXLhqBmUUPy/7BUPI1CpfPLI8inv/mtGQ==
X-Received: by 2002:a05:6808:54c:: with SMTP id i12mr2955972oig.110.1619813995298;
        Fri, 30 Apr 2021 13:19:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p65sm1011106oia.46.2021.04.30.13.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 13:19:54 -0700 (PDT)
Received: (nullmailer pid 3819633 invoked by uid 1000);
        Fri, 30 Apr 2021 20:19:53 -0000
Date:   Fri, 30 Apr 2021 15:19:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC32434 GPIO controller
Message-ID: <20210430201953.GA3819580@robh.at.kernel.org>
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <20210426095426.118356-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426095426.118356-2-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Apr 2021 11:54:26 +0200, Thomas Bogendoerfer wrote:
> Add YAML devicetree binding for IDT 79RC32434 GPIO controller
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v4:
>  - renamed to idt,32434-gpio this time for real
> 
> Changes in v3:
>  - renamed to idt,32434-gpio
>  - drop ngpio description
>  - use gpio0: gpio@50004 in example
> 
>  .../bindings/gpio/idt,32434-gpio.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
