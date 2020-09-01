Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1EA258684
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 05:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIAD4M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 23:56:12 -0400
Received: from mo-csw-fb1114.securemx.jp ([210.130.202.173]:43070 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIAD4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 23:56:12 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1114) id 0813Br0X019218; Tue, 1 Sep 2020 12:11:53 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 0813BLaL023972; Tue, 1 Sep 2020 12:11:22 +0900
X-Iguazu-Qid: 2wGqimZzpaB4weLP6L
X-Iguazu-QSIG: v=2; s=0; t=1598929881; q=2wGqimZzpaB4weLP6L; m=x/hLZXmi+wSERSkfV+HapYy3Rw2ZPa4E1ZveFlFBryQ=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1110) id 0813BISu028072;
        Tue, 1 Sep 2020 12:11:19 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0813BIbH029600;
        Tue, 1 Sep 2020 12:11:18 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0813BIZd020715;
        Tue, 1 Sep 2020 12:11:18 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: toshiba: add Toshiba Visconti ARM SoCs
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <20200831081025.2721320-4-nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Tue, 01 Sep 2020 12:11:17 +0900
X-TSB-HOP: ON
Message-ID: <87eenmry22.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:

> Add device tree bindings for the Toshiba Visconti ARM SoCs.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../devicetree/bindings/arm/toshiba.yaml      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/toshiba.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/toshiba.yaml b/Documentation/devicetree/bindings/arm/toshiba.yaml
> new file mode 100644
> index 000000000000..efd3f4859669
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/toshiba.yaml
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/toshiba.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti Platform Device Tree Bindings
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Visconti5 TMPV7708
> +        items:
> +          - const: toshiba,tmpv7708
> +...

FWIW:

Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Thanks,
Punit
