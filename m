Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9986BE521B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 19:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505797AbfJYRMo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 13:12:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505842AbfJYRMn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Oct 2019 13:12:43 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A06CD21D71;
        Fri, 25 Oct 2019 17:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572023562;
        bh=Z9kAbxaXKmbqq+OCusdDlzS7M+q9LbO89gcG35ir0CE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LK3DZoETxxt3Vx/AZOSrcG6Svt1lTR1XOwfx4jzOFxa5ghw2U5wmTPAqlPg+/A/MB
         XuqqbEva2CS6sCg3lPJcyunXWzVhQMKmM0tB+j9+5rMzWzelksgRQX/bbf8EH7ErkV
         n27ysL5zWgoUkUXAaX9RnB0EXijNmOiVvuhKoRhQ=
Received: by mail-qt1-f179.google.com with SMTP id m15so4356290qtq.2;
        Fri, 25 Oct 2019 10:12:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVt5AuVLM5VVDiMuRrPK96hAC4UotQOzRlLnigp6jk0t/C7fy8d
        +0oelijbrjrDQ3YrNE5PUr8+8y5mNrlZs+SAIA==
X-Google-Smtp-Source: APXvYqwyBAHU7XOj/9lEMryFKsyNgzQcpd0Pku9No2ZatJFpJeBh2HE7sqmId/JADfJ+vHbJLB4UWp8J+xFC4MKtpOw=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr4135876qtq.143.1572023561814;
 Fri, 25 Oct 2019 10:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191024202703.8017-1-chris.packham@alliedtelesis.co.nz> <20191024202703.8017-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191024202703.8017-2-chris.packham@alliedtelesis.co.nz>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 25 Oct 2019 12:12:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ6a6cSrZsTg6piXmuB6-zuP+EO9vwkRoeH2aS9AVOT1g@mail.gmail.com>
Message-ID: <CAL_JsqJ6a6cSrZsTg6piXmuB6-zuP+EO9vwkRoeH2aS9AVOT1g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 24, 2019 at 3:27 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> This GPIO controller is present on a number of Broadcom switch ASICs
> with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
> blocks but different enough to require a separate driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>     Changes in v4:
>     - rename brcm,xgs-iproc.yaml -> brcm,xgs-iproc-gpio.yaml as suggested
>
>     Changes in v3:
>     - incorporate review comments from Rob and Bart
>
>     Changes in v2:
>     - Document as DT schema
>     - Include ngpios, #gpio-cells and gpio-controller properties
>
>  .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> new file mode 100644
> index 000000000000..ec1fd3a64aa2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/brcm,xgs-iproc.yaml#

Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml: $id:
path/filename 'gpio/brcm,xgs-iproc.yaml' doesn't match actual filename

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
