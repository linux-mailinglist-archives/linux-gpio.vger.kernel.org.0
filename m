Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48B337996D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 23:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhEJVuq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 17:50:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:59236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhEJVup (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 17:50:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89DEA61585;
        Mon, 10 May 2021 21:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620683380;
        bh=shdNg0dj5nmPSU8o9YJGnMTIgQFNDoi38aBF/3eSl00=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Vlk6qbHvO6iOYUttDcm58ZQoOi6kGx3KHkLquvwW8+OxRo0w4VwiGyB53wrLR5HI3
         cg2+2b74zYYY1IxUvZzmpA2YGY4Clqh7XN2LQ/YeCvFlONNkIOpQ6TFqSfNvQg+ytJ
         PDM0z5XMFtT/vgsB+9k6XqMzQMqkqCYkBL60QJQZ+hLSLXa67iKuUveZQCspPIa5iG
         HY7080h7MemFF1mKyBDRXXBlU0fIdCCquM130CrmzdY5Do2/Oczlm0WFRQnGhlgasP
         B0ERF012kXvHqsJjluteLfF3o/p/6TvGnnS18JJVp98fpELR+tLKnOS6x42JuWwB/Q
         WMdIB5b+whAuQ==
Received: by mail-ej1-f52.google.com with SMTP id b25so26696933eju.5;
        Mon, 10 May 2021 14:49:40 -0700 (PDT)
X-Gm-Message-State: AOAM531hTm55mxR0OJjkv8XwAh2UUrcRpne40PUdbfhEG6Q3IE5J/iF3
        SeNfWNd9u8ovz/P9ed7XZuRQt1hUwM9ROjdZmA==
X-Google-Smtp-Source: ABdhPJxk2i5SpC56oKHnArvb6C95SwClkJseSzpWshAodQWBwLA3X9ow9/6fJ7P26yOTzvnV9O4XfkzAPr2zVgFWCOc=
X-Received: by 2002:a17:906:1d0a:: with SMTP id n10mr10911690ejh.341.1620683379036;
 Mon, 10 May 2021 14:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210508123743.18128-1-jbx6244@gmail.com> <20210508123743.18128-3-jbx6244@gmail.com>
 <20210510161234.GA210306@robh.at.kernel.org> <a30fe9fd-d4bb-c5a7-f8bd-e783a6373727@gmail.com>
In-Reply-To: <a30fe9fd-d4bb-c5a7-f8bd-e783a6373727@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 10 May 2021 16:49:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdygCgvE4tyMfoGWHvm2ucYC0g9gMQz9nq-16RCR-eHQ@mail.gmail.com>
Message-ID: <CAL_JsqJdygCgvE4tyMfoGWHvm2ucYC0g9gMQz9nq-16RCR-eHQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: soc: rockchip: convert grf.txt to YAML
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     "heiko@sntech.de" <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        David Wu <david.wu@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>,
        Liang Chen <cl@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 11:32 AM Johan Jonker <jbx6244@gmail.com> wrote:
>
>
>
> On 5/10/21 6:12 PM, Rob Herring wrote:
> > On Sat, May 08, 2021 at 02:37:41PM +0200, Johan Jonker wrote:
> >> Current dts files with 'grf' nodes are manually verified.
> >> In order to automate this process grf.txt has to be
> >> converted to YAML.
> >>
> >> Most compatibility strings are in use with "simple-mfd" added.
> >>
> >> Add description already in use:
> >> "rockchip,rv1108-pmugrf", "syscon"
> >>
> >> Add new descriptions for:
> >> "rockchip,rk3568-grf", "syscon", "simple-mfd"
> >> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"
> >>
> >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >> ---
> >>
> >> Changed V3:
> >>   remove select
> >>   change unevaluatedProperties
> >>   add separate schemas for each 'if' subset
> >
> > Sorry, but by separate I meant different files. But you don't *have* to
> > do that.
> >
> >>
> >> Changed V2:
> >>   add rockchip,rk3328-grf-gpio.yaml
> >>   rename grf-gpio nodename
> >> ---
> >>  .../devicetree/bindings/soc/rockchip/grf.txt       |  61 -----
> >>  .../devicetree/bindings/soc/rockchip/grf.yaml      | 262 +++++++++++++++++++++
> >>  2 files changed, 262 insertions(+), 61 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
> >>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> >> deleted file mode 100644
> >> index f96511aa3..000000000
> >> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> >> +++ /dev/null
> >> @@ -1,61 +0,0 @@
> >> -* Rockchip General Register Files (GRF)
> >> -
> >> -The general register file will be used to do static set by software, which
> >> -is composed of many registers for system control.
> >> -
> >> -From RK3368 SoCs, the GRF is divided into two sections,
> >> -- GRF, used for general non-secure system,
> >> -- SGRF, used for general secure system,
> >> -- PMUGRF, used for always on system
> >> -
> >> -On RK3328 SoCs, the GRF adds a section for USB2PHYGRF,
> >> -
> >> -ON RK3308 SoC, the GRF is divided into four sections:
> >> -- GRF, used for general non-secure system,
> >> -- SGRF, used for general secure system,
> >> -- DETECTGRF, used for audio codec system,
> >> -- COREGRF, used for pvtm,
> >> -
> >> -Required Properties:
> >> -
> >> -- compatible: GRF should be one of the following:
> >> -   - "rockchip,px30-grf", "syscon": for px30
> >> -   - "rockchip,rk3036-grf", "syscon": for rk3036
> >> -   - "rockchip,rk3066-grf", "syscon": for rk3066
> >> -   - "rockchip,rk3188-grf", "syscon": for rk3188
> >> -   - "rockchip,rk3228-grf", "syscon": for rk3228
> >> -   - "rockchip,rk3288-grf", "syscon": for rk3288
> >> -   - "rockchip,rk3308-grf", "syscon": for rk3308
> >> -   - "rockchip,rk3328-grf", "syscon": for rk3328
> >> -   - "rockchip,rk3368-grf", "syscon": for rk3368
> >> -   - "rockchip,rk3399-grf", "syscon": for rk3399
> >> -   - "rockchip,rv1108-grf", "syscon": for rv1108
> >> -- compatible: DETECTGRF should be one of the following:
> >> -   - "rockchip,rk3308-detect-grf", "syscon": for rk3308
> >> -- compatilbe: COREGRF should be one of the following:
> >> -   - "rockchip,rk3308-core-grf", "syscon": for rk3308
> >> -- compatible: PMUGRF should be one of the following:
> >> -   - "rockchip,px30-pmugrf", "syscon": for px30
> >> -   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
> >> -   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
> >> -- compatible: SGRF should be one of the following:
> >> -   - "rockchip,rk3288-sgrf", "syscon": for rk3288
> >> -- compatible: USB2PHYGRF should be one of the following:
> >> -   - "rockchip,px30-usb2phy-grf", "syscon": for px30
> >> -   - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
> >> -- compatible: USBGRF should be one of the following:
> >> -   - "rockchip,rv1108-usbgrf", "syscon": for rv1108
> >> -- reg: physical base address of the controller and length of memory mapped
> >> -  region.
> >> -
> >> -Example: GRF and PMUGRF of RK3399 SoCs
> >> -
> >> -    pmugrf: syscon@ff320000 {
> >> -            compatible = "rockchip,rk3399-pmugrf", "syscon";
> >> -            reg = <0x0 0xff320000 0x0 0x1000>;
> >> -    };
> >> -
> >> -    grf: syscon@ff770000 {
> >> -            compatible = "rockchip,rk3399-grf", "syscon";
> >> -            reg = <0x0 0xff770000 0x0 0x10000>;
> >> -    };
> >> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> >> new file mode 100644
> >> index 000000000..264e2e5ff
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> >> @@ -0,0 +1,262 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Rockchip General Register Files (GRF)
> >> +
> >> +maintainers:
> >> +  - Heiko Stuebner <heiko@sntech.de>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - rockchip,rk3066-grf
> >> +              - rockchip,rk3188-grf
> >> +              - rockchip,rk3288-sgrf
> >> +              - rockchip,rv1108-pmugrf
> >> +              - rockchip,rv1108-usbgrf
> >> +          - const: syscon
> >> +      - items:
> >> +          - enum:
> >> +              - rockchip,px30-grf
> >> +              - rockchip,px30-pmugrf
> >> +              - rockchip,px30-usb2phy-grf
> >> +              - rockchip,rk3036-grf
> >> +              - rockchip,rk3228-grf
> >> +              - rockchip,rk3288-grf
> >> +              - rockchip,rk3308-core-grf
> >> +              - rockchip,rk3308-detect-grf
> >> +              - rockchip,rk3308-grf
> >> +              - rockchip,rk3328-grf
> >> +              - rockchip,rk3328-usb2phy-grf
> >> +              - rockchip,rk3368-grf
> >> +              - rockchip,rk3368-pmugrf
> >> +              - rockchip,rk3399-grf
> >> +              - rockchip,rk3399-pmugrf
> >> +              - rockchip,rk3568-grf
> >> +              - rockchip,rk3568-pmugrf
> >> +              - rockchip,rv1108-grf
> >> +          - const: syscon
> >> +          - const: simple-mfd
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +
> >> +unevaluatedProperties: false
>
> Hi Rob,
>
> I've tried without '$defs' and I can't get dt_binding_check error free with:
> allOf:
>   - if:
>       [etc..]
>   - if:
>       [etc..]
> That's why this construction.
> Could you test with patch below.
> Please advise.

There's a requirement that all the properties be defined at the top
level. If 'unevaluatedProperties' was actually implemented, we
wouldn't need that. So you need something like this:

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 8a8943317544..8034458fb969 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -46,11 +46,18 @@ properties:
   reg:
     maxItems: 1

+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
 required:
   - compatible
   - reg

-unevaluatedProperties: false
+additionalProperties:
+  type: object

 allOf:
   - if:
@@ -158,13 +165,6 @@ allOf:
               - rockchip,rv1108-grf

     then:
-      properties:
-        "#address-cells":
-          const: 1
-
-        "#size-cells":
-          const: 1
-
       required:
         - "#address-cells"
         - "#size-cells"
