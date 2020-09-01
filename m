Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495D4258673
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 05:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgIADrU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 23:47:20 -0400
Received: from mo-csw-fb1115.securemx.jp ([210.130.202.174]:56014 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIADrU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 23:47:20 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1115) id 0813C3C7010446; Tue, 1 Sep 2020 12:12:03 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 0813BZp7000647; Tue, 1 Sep 2020 12:11:35 +0900
X-Iguazu-Qid: 2wGqzHwiyjCtv19vmM
X-Iguazu-QSIG: v=2; s=0; t=1598929895; q=2wGqzHwiyjCtv19vmM; m=lSg7qkxMeab8pr1m4H90VJFJ9rv8rDYDKeRy9AP0TbE=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 0813BWEv005470;
        Tue, 1 Sep 2020 12:11:33 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0813BWO6029674;
        Tue, 1 Sep 2020 12:11:32 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0813BW4w020811;
        Tue, 1 Sep 2020 12:11:32 +0900
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
Subject: Re: [PATCH v3 4/8] dt-bindings: arm: toshiba: Add the TMPV7708 RM main board
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <20200831081025.2721320-5-nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Tue, 01 Sep 2020 12:11:31 +0900
X-TSB-HOP: ON
Message-ID: <877dtery1o.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:

> Add an entry for the Toshiba Visconti TMPV7708 RM main board
> (tmpv7708-rm-mbrc) to the board/SoC bindings.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  Documentation/devicetree/bindings/arm/toshiba.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/toshiba.yaml b/Documentation/devicetree/bindings/arm/toshiba.yaml
> index efd3f4859669..0e066290238e 100644
> --- a/Documentation/devicetree/bindings/arm/toshiba.yaml
> +++ b/Documentation/devicetree/bindings/arm/toshiba.yaml
> @@ -16,5 +16,7 @@ properties:
>      oneOf:
>        - description: Visconti5 TMPV7708
>          items:
> +          - enum:
> +              - toshiba,tmpv7708-rm-mbrc  # TMPV7708 RM main board
>            - const: toshiba,tmpv7708
>  ...

FWIW,

Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Thanks,
Punit
