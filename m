Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE851009BD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 17:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfKRQxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 11:53:47 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42683 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfKRQxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 11:53:47 -0500
Received: by mail-oi1-f196.google.com with SMTP id o12so5815511oic.9;
        Mon, 18 Nov 2019 08:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hqTOasQxtcpYkZR/qyY0Ns887QHHgqrNr6obLQsmNsI=;
        b=OWcHeOLBFcvsJGM4bLKrsbHY1ywlzAMVlzijeOfEGBK/N0Jh1Sol1ekSSLR02gfBIY
         FlkgaQ8h39q6D0Fgso6CK23rttxDepbChSmpC+P34nzqkblv0ZgZLLiG1kiLocci25Wu
         gKiqoU4s9ynUYwdAc9vaBYnCYoAjdAokWu9Fwgr+QW9Hg+Vd89X4ad3PDOhlvm504Ip8
         iSpdo6mGx6NBP4SobWaSYYnP8ketB8xNkBfvDWUR7nDcuX4d4a2BeKooQ9JmEYGgt4L1
         Wxkksa8GDAYnPLUhl2UKzOWYYyBARx10vypQ8WkUsonuXflGMrKKAArVOjxC+Hr56jjI
         VY1Q==
X-Gm-Message-State: APjAAAVrB1r4NDT2YvrDZc8Z7mfjGQpqMFH1q/Smw4TWoB+dgnrI1ouk
        PGmlIjgFobWY77uGmg4oRA==
X-Google-Smtp-Source: APXvYqxhK6+LinJAXcIhwyYoIbpoJYerjNgZrjGX55HdjJe+rrjIeNxntyurC83Ly9lLYUCNhH+m7w==
X-Received: by 2002:aca:451:: with SMTP id 78mr21727660oie.170.1574096026456;
        Mon, 18 Nov 2019 08:53:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o18sm6447650otj.38.2019.11.18.08.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:53:45 -0800 (PST)
Date:   Mon, 18 Nov 2019 10:53:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: Re: [PATCH 2/4] gpio: sifive: Add DT documentation for SiFive GPIO
Message-ID: <20191118165345.GA3935@bogus>
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573560684-48104-3-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 12, 2019 at 12:12:06PM +0000, Yash Shah wrote:
> DT documentation for GPIO controller added.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/gpio/gpio-sifive.txt       | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.txt

Please make this a schema. See 
Documentation/devicetree/writing-schema.rst.

> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sifive.txt b/Documentation/devicetree/bindings/gpio/gpio-sifive.txt
> new file mode 100644
> index 0000000..d3416d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sifive.txt
> @@ -0,0 +1,33 @@
> +SiFive GPIO controller bindings
> +
> +Required properties:
> +- compatible: Should be "sifive,<chip>-gpio" and "sifive,gpio<version>".
> +  Supported compatible strings are: "sifive,fu540-c000-gpio" for the SiFive
> +  GPIO v0 as integrated onto the SiFive FU540 chip, and "sifive,gpio0" for the
> +  SiFive GPIO v0 IP block with no chip integration tweaks.
> +  Please refer to sifive-blocks-ip-versioning.txt for details.
> +- reg: Physical base address and length of the controller's registers.
> +- clocks: Should contain a clock identifier for the GPIO's parent clock.
> +- #gpio-cells : Should be 2
> +  - The first cell is the GPIO offset number.
> +  - The second cell indicates the polarity of the GPIO
> +- gpio-controller : Marks the device node as a GPIO controller.
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells : Should be 2.
> +  - The first cell is the GPIO offset number within the GPIO controller.
> +  - The second cell is the edge/level to use for interrupt generation.
> +- interrupts: Specify the interrupts, one per GPIO

How many GPIOs?

> +
> +Example:
> +
> +gpio: gpio@10060000 {
> +	compatible = "sifive,fu540-c000-gpio","sifive,gpio0";

space                                         ^

> +	interrupt-parent = <&plic>;
> +	interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> +	reg = <0x0 0x10060000 0x0 0x1000>;
> +	clocks = <&tlclk>;
> +	gpio-controller;
> +	#gpio-cells = <2>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +};
> -- 
> 2.7.4
> 
