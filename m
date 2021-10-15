Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6F842E63A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 03:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbhJOBsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 21:48:05 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:43634 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229832AbhJOBsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 21:48:04 -0400
X-UUID: 6afdd2f74d7b426d89963329f900a6b2-20211015
X-UUID: 6afdd2f74d7b426d89963329f900a6b2-20211015
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1215342424; Fri, 15 Oct 2021 09:45:56 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 15 Oct 2021 09:45:54 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 15 Oct
 2021 09:45:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Oct 2021 09:45:54 +0800
Message-ID: <e7cb3220b925209d8f5229c207d5efbc42d58794.camel@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pinctrl: update bindings for MT7986
 SoC
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
        "John Crispin" <john@phrozen.org>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Fri, 15 Oct 2021 09:45:54 +0800
In-Reply-To: <1634221864.165084.3295876.nullmailer@robh.at.kernel.org>
References: <20211014075836.17681-1-sam.shih@mediatek.com>
         <20211014075836.17681-2-sam.shih@mediatek.com>
         <1634221864.165084.3295876.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

On Thu, 2021-10-14 at 09:31 -0500, Rob Herring wrote:
> On Thu, 14 Oct 2021 15:58:33 +0800, Sam Shih wrote:
> > This updates bindings for MT7986 pinctrl driver. The
> > difference of pinctrl between mt7986a and mt7986b is that pin-41 to
> > pin-65 do not exist on mt7986b
> > 
> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> > 
> > ---
> > v7 : updated pinctcl node binding description, and separate pinctrl
> >      part into a single patch series
> > 
> > Original thread:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com/__;!!CTRNKA9wMg0ARbw!yJc1hf6XafeskaOgY8TmMDpGDHuIDhx6AGIpuOiJRl7jCVYcnPmr6I4XKz2iy6O4$
> >  
> > 
> > v6 : fixed yamllint warnings/errors v2
> > v5 : fixed yamllint warnings/errors v1
> > v4 : used yaml format instead of txt format document
> > v3 : make mt7986 pinctrl bindings as a separate file
> > v2 : deleted the redundant description of mt7986a/mt7986b
> > ---
> >  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 364
> > ++++++++++++++++++
> >  1 file changed, 364 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-
> > pinctrl.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-
> pinctrl.example.dts:52.36-57.15: ERROR (duplicate_node_names): 
> /example-0/soc/pinctrl@1001f000/uart1-pins: Duplicate node name
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-
> pinctrl.example.dt.yaml] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
> 

Sorry, I took the wrong patch in my local environment for submmit

This should be "uart2_pins: uart2-pins { ... "

I will send next patch to fix this.

+        uart2_pins: uart1-pins {
+          mux {
+            function = "uart";
+            groups = "uart2";
+          };
+        };



> doc reference errors (make refcheckdocs):
> 
> See 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/1540821__;!!CTRNKA9wMg0ARbw!yJc1hf6XafeskaOgY8TmMDpGDHuIDhx6AGIpuOiJRl7jCVYcnPmr6I4XK9R-t-CX$
>  
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

Thanks,
Sam
> 

