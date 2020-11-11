Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C5E2AFD13
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 02:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgKLBcS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 20:32:18 -0500
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:44514 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgKKXb3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 18:31:29 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 0ABNVF1W012197; Thu, 12 Nov 2020 08:31:15 +0900
X-Iguazu-Qid: 2wHHjV7mwWTUzZyVaS
X-Iguazu-QSIG: v=2; s=0; t=1605137475; q=2wHHjV7mwWTUzZyVaS; m=qdzL3FmPwUzOTh+X5YYacVrNgBQ6c7qXFMJeFaTqLYw=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1113) id 0ABNVE05007658;
        Thu, 12 Nov 2020 08:31:14 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0ABNVEn7028254;
        Thu, 12 Nov 2020 08:31:14 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0ABNVD0K032349;
        Thu, 12 Nov 2020 08:31:13 +0900
Date:   Thu, 12 Nov 2020 08:31:12 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH 1/4] dt-bindings: gpio: Add bindings for Toshiba Visconti
 GPIO Controller
X-TSB-HOP: ON
Message-ID: <20201111233112.GA803632@toshiba.co.jp>
References: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201111172553.1369282-2-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201111191838.GA1860931@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111191838.GA1860931@bogus>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Nov 11, 2020 at 01:18:38PM -0600, Rob Herring wrote:
> On Thu, 12 Nov 2020 02:25:50 +0900, Nobuhiro Iwamatsu wrote:
> > Add bindings for the Toshiba Visconti GPIO Controller.
> > 
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml: properties:gpio-ranges: 'truei' is not of type 'object', 'boolean'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml: ignoring, error in schema: properties: gpio-ranges
> warning: no schema found in file: ./Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> 

Oh, this was typo...
I will fix this, thanks.

> 
> See https://patchwork.ozlabs.org/patch/1398028
> 
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Best regards,
  Nobuhiro
