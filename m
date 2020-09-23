Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5961427539E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 10:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgIWIsR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 04:48:17 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:39194 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgIWIsR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 04:48:17 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 08N8lcDA014200; Wed, 23 Sep 2020 17:47:38 +0900
X-Iguazu-Qid: 34trFrx2pz2XvDY2bd
X-Iguazu-QSIG: v=2; s=0; t=1600850857; q=34trFrx2pz2XvDY2bd; m=yuROmr2bkKfRiiE5m/2Wv/S+dwBQQr3INAXhZAc0fXI=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1511) id 08N8lZw5024388;
        Wed, 23 Sep 2020 17:47:35 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 08N8lZ1J009798;
        Wed, 23 Sep 2020 17:47:35 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 08N8lYVF032477;
        Wed, 23 Sep 2020 17:47:34 +0900
Date:   Wed, 23 Sep 2020 17:47:33 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, punit1.agrawal@toshiba.co.jp,
        arnd@arndb.de, catalin.marinas@arm.com, linus.walleij@linaro.org,
        yuji2.ishikawa@toshiba.co.jp, linux-gpio@vger.kernel.org,
        robh+dt@kernel.org, maz@misterjones.org, sudeep.holla@arm.com,
        olof@lixom.net, will@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Initial support Visconti SoC for the v5.10 kernel
X-TSB-HOP: ON
Message-ID: <20200923084733.tpaincn6yq63yocp@toshiba.co.jp>
References: <20200918231541.azafr4jspq5lqlyu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918231541.azafr4jspq5lqlyu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Sat, Sep 19, 2020 at 08:15:41AM +0900, Nobuhiro Iwamatsu wrote:
> Hi,
> 
> This is the first pull request for Toshiba ARM SoC, Visconti5.
> Please pull this new SoC patches for the v5.10 kernel cycle.
> 

Sorry, I received a Reviewed-by tag from Rob to DT after sending this PR.
I will create a new tree and tag with this added. 
So, ignore this PR.

Best regards,
  Nobuhiro

> Best regards,
>   Nobuhiro
> 
> The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:
> 
>   Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-initial-for-5.10
> 
> for you to fetch changes up to 974fc359cbd4a16a7c4fdfeddc78f777d4f43828:
> 
>   arm64: defconfig: Enable configs for Toshiba Visconti (2020-09-16 16:37:22 +0900)
> 
> ----------------------------------------------------------------
> Visconti5 SoC changes for v5.10
> 
> - Add dt-bindings for Toshiba Visconti ARM SoCs
> - Add dt-bindings for the TMPV7708 RM main board
> - Add initial support for Toshiba Visconti platform
> - Add device tree for TMPV7708 RM main board
> - Add information for Toshiba Visconti ARM SoCs to MAINTAINERS
> - Enable configs for Toshiba Visconti to arm64's defconfig
> 
> ----------------------------------------------------------------
> Nobuhiro Iwamatsu (6):
>       dt-bindings: arm: toshiba: add Toshiba Visconti ARM SoCs
>       dt-bindings: arm: toshiba: Add the TMPV7708 RM main board
>       arm64: visconti: Add initial support for Toshiba Visconti platform
>       arm64: dts: visconti: Add device tree for TMPV7708 RM main board
>       MAINTAINERS: Add information for Toshiba Visconti ARM SoCs
>       arm64: defconfig: Enable configs for Toshiba Visconti
> 
>  Documentation/devicetree/bindings/arm/toshiba.yaml |  22 ++
>  MAINTAINERS                                        |  11 +
>  arch/arm64/Kconfig.platforms                       |   7 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/toshiba/Makefile               |   2 +
>  arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |  43 +++
>  arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          | 390 +++++++++++++++++++++
>  arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi     |  93 +++++
>  arch/arm64/configs/defconfig                       |   1 +
>  9 files changed, 570 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/toshiba.yaml
>  create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
>  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
>  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
>  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
