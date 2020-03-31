Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A9B199EDD
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 21:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgCaTYp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 15:24:45 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40531 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbgCaTYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 15:24:45 -0400
Received: by mail-io1-f66.google.com with SMTP id k9so23045189iov.7;
        Tue, 31 Mar 2020 12:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X77i90u4PCyWY02QSuEiirQj2VUMtCdRQ2cq3iyBOh8=;
        b=LqW1xxh8RSelvIejExMle3J6DDYPpbfV886AhUI2N/zZ4w+x1aTb1/n/FrpEg/1kP2
         Pr2CVj4EZBRlJUlZ3bt/rALmLJfioMITvwM0HC9EXKsNlcOxHPU+SkfwAvkYrUtadZqj
         4idhPtecO9w1vXSBraaeESEpkn6iDeDiurOUuvikqUv9en4lGZAYQqTuHUs5oBBQRnfi
         ouzQPz1B7YBzrvHxRhnBw2I5Q65Izqh6GX51s2Oc382NYLDa6dX9aMARHF6v2/C+wXtn
         rselP4sNh/4LVf/NEM4eRjn23qmYzEEMWOXRXWdWpOy+w/pqCPLvsU6Uu8ygcUs6UD5Z
         mZtQ==
X-Gm-Message-State: ANhLgQ3XoRbFrEj3RouJ715P2Rb+n/HSoId5YsB7CSjB/Y74itamjN4I
        /2kj0Gzvmkel7dVB1fRbFQ==
X-Google-Smtp-Source: ADFU+vsSqcC7Ag+/ySb4VioprxxbvnAwFTpsEFlHwD+rQibUQP8A0ZLaFD2aNYVxNYiqgE+AehpjAA==
X-Received: by 2002:a6b:c916:: with SMTP id z22mr17113646iof.138.1585682684488;
        Tue, 31 Mar 2020 12:24:44 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y1sm5196263ioq.47.2020.03.31.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:24:43 -0700 (PDT)
Received: (nullmailer pid 20084 invoked by uid 1000);
        Tue, 31 Mar 2020 19:24:41 -0000
Date:   Tue, 31 Mar 2020 13:24:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: gpio: Convert snps,dw-apb-gpio to DT
 schema
Message-ID: <20200331192441.GA32248@bogus>
References: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
 <20200323195401.30338-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323195401.30338-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 10:53:56PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with DT schema. This commit replaces Synopsys DW GPIO
> legacy bare text binding with YAML file. As before the binding file
> states that the corresponding dts node is supposed to be compatible
> with generic DW I2C controller indicated by the "snps,dw-apb-gpio"
> compatible string and to provide a mandatory registers memory range.
> It may also have an optional clock and reset phandle references.
> 
> There must be specified at least one subnode with
> "snps,dw-apb-gpio-port" compatible string indicating the GPIO port,
> which would actually export the GPIO controller functionality. Such
> nodes should have traditional GPIO controller properties together
> with optional interrupt-controller attributes if the corresponding
> controller was synthesized to detect and report the input values
> change to the parental IRQ controller.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ---
> 
> Changelog v2:
> - Use lowercase hex numbers in the main node name and in the sub-node names.
> - Use "allOf:" statement to apply uint32 and "minimum/maximum" limitations
>   on the "snps,nr-gpios" property.
> - Discard "interrupts-extended" property.
> - Make sure the sub-nodes have names with either 'gpio-port' or
>   'gpio-controller' prefixes.
> 
> The DT scheme provided by this patch will pass the dt_binding_check
> command after the next patches are merged to the dt-schema repo:

Merged now.

> ---
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       | 129 ++++++++++++++++++
>  .../bindings/gpio/snps-dwapb-gpio.txt         |  65 ---------
>  2 files changed, 129 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt

Reviewed-by: Rob Herring <robh@kernel.org>
