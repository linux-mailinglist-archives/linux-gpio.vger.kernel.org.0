Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA099CE17
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 13:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfHZL0B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 07:26:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:43514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbfHZL0B (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Aug 2019 07:26:01 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D32021852;
        Mon, 26 Aug 2019 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566818760;
        bh=+fXhBoV3XoXFJXbmFYt1JnaExIkAJtARzjPEGayT5QE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=W+JhO28faytRxkR01BpmD3xQ0SLFisGlTfAHYUH5U5tvO8lEXDhf+7uk4Lgy4Deop
         kM0XXilgvWbCIJTrmZ/JYNWlJRcdZtSNkuKdmtNL5b6zVEvvMj8qhABLmohejC/0lN
         e3vnwo0aRmJ6ClEfBMuhXEaW4rlaXVCAmIL1vT3k=
Received: by mail-qt1-f171.google.com with SMTP id q4so17465322qtp.1;
        Mon, 26 Aug 2019 04:26:00 -0700 (PDT)
X-Gm-Message-State: APjAAAXgfjJhx5LGM01QYIbLQLxfPuILZGOpcHxmZy4Jcq1CMBiXmW34
        QZ7EsyoEz7Va9t4n5HVCX+jSHSr30iAlmmHYgA==
X-Google-Smtp-Source: APXvYqwVSHUzvW1aqou+M9OekO609XNKUgfgglRIqoHtf6kZSH40aebGSx2wdYu9Nkuxgdf7crX95Zj0JXvLQ7mws0w=
X-Received: by 2002:a0c:9782:: with SMTP id l2mr15081337qvd.72.1566818759166;
 Mon, 26 Aug 2019 04:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190809082947.30590-1-lokeshvutla@ti.com> <20190809082947.30590-6-lokeshvutla@ti.com>
 <20190821210232.GA22578@bogus> <da0286cb-8e4c-e12c-240c-b6de72bdd0ee@ti.com>
In-Reply-To: <da0286cb-8e4c-e12c-240c-b6de72bdd0ee@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 26 Aug 2019 06:25:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKpWhmKJUEWD-hKzmxLnHG4VVZbFR04BeQevP0zOoHKiw@mail.gmail.com>
Message-ID: <CAL_JsqKpWhmKJUEWD-hKzmxLnHG4VVZbFR04BeQevP0zOoHKiw@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: k3: Introduce pinmux
 definitions for J721E
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 26, 2019 at 5:27 AM Lokesh Vutla <lokeshvutla@ti.com> wrote:
>
> Hi Rob,
>
> On 22/08/19 2:32 AM, Rob Herring wrote:
> > On Fri, Aug 09, 2019 at 01:59:46PM +0530, Lokesh Vutla wrote:
> >> Add pinctrl macros for J721E SoC. These macro definitions are
> >> similar to that of AM6, but adding new definitions to avoid
> >> any naming confusions in the soc dts files.
> >>
> >> Acked-by: Nishanth Menon <nm@ti.com>
> >> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> >> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> >> ---
> >>  include/dt-bindings/pinctrl/k3.h | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/include/dt-bindings/pinctrl/k3.h b/include/dt-bindings/pinctrl/k3.h
> >> index 45e11b6170ca..499de6216581 100644
> >> --- a/include/dt-bindings/pinctrl/k3.h
> >> +++ b/include/dt-bindings/pinctrl/k3.h
> >> @@ -32,4 +32,7 @@
> >>  #define AM65X_IOPAD(pa, val, muxmode)               (((pa) & 0x1fff)) ((val) | (muxmode))
> >>  #define AM65X_WKUP_IOPAD(pa, val, muxmode)  (((pa) & 0x1fff)) ((val) | (muxmode))
> >>
> >> +#define J721E_IOPAD(pa, val, muxmode)               (((pa) & 0x1fff)) ((val) | (muxmode))
> >> +#define J721E_WKUP_IOPAD(pa, val, muxmode)  (((pa) & 0x1fff)) ((val) | (muxmode))
> >
> > checkpatch reports a parentheses error:         (((pa) & 0x1fff) ((val) | (muxmode)))
>
> This was left intentionally as this macro is giving out two entries in DT like
> below:
>
>         pinctrl-single,pins = <
>                 J721E_IOPAD(0x0, PIN_INPUT, 7)
>         >;
>
> comes out as
>
>         pinctrl-single,pins = <
>                 0x0 (PIN_INPUT | 7)
>         >;
>
> If parenthesis are added for the whole macro, the following build error occurs:
>   DTC     arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb
> Error: arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts:41.24-25 syntax error
> FATAL ERROR: Unable to parse input tree

Okay, NM.

Acked-by: Rob Herring <robh@kernel.org>
