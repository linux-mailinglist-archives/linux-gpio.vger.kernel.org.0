Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E226F25863D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 05:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIADh2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 23:37:28 -0400
Received: from mo-csw-fb1514.securemx.jp ([210.130.202.170]:42994 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIADh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 23:37:27 -0400
X-Greylist: delayed 1601 seconds by postgrey-1.27 at vger.kernel.org; Mon, 31 Aug 2020 23:37:26 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 0813CND2011436; Tue, 1 Sep 2020 12:12:23 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0813BuC7022206; Tue, 1 Sep 2020 12:11:56 +0900
X-Iguazu-Qid: 34tKBCMUDa3Kk8oMb3
X-Iguazu-QSIG: v=2; s=0; t=1598929916; q=34tKBCMUDa3Kk8oMb3; m=FwvLwA7Gtp1xohJRW9vikkBUe9L6k9nsC98tbCg0VCI=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1511) id 0813Bs17027133;
        Tue, 1 Sep 2020 12:11:54 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 0813BsRR028065;
        Tue, 1 Sep 2020 12:11:54 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 0813Bqs4007230;
        Tue, 1 Sep 2020 12:11:53 +0900
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
Subject: Re: [PATCH v3 5/8] arm64: visconti: Add initial support for Toshiba Visconti platform
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <20200831081025.2721320-6-nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Tue, 01 Sep 2020 12:11:52 +0900
X-TSB-HOP: ON
Message-ID: <87zh6aqjgn.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Iwamatsu-san,

Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:

> Add the initial device tree files for Toshiba Visconti platform.
> For starters, the only SoC supported will be Visconti5 TMPV7708.

The commit message is out of sync with the patch below. Maybe update it
to something like -

"Add the Kconfig entry for the Toshiba Visconti SoCs"


> https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  arch/arm64/Kconfig.platforms | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index cd58f8495c45..dce74d34d18a 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -300,6 +300,13 @@ config ARCH_VEXPRESS
>  	  This enables support for the ARMv8 software model (Versatile
>  	  Express).
>  
> +config ARCH_VISCONTI
> +	bool "Toshiba Visconti SoC Family"
> +	select PINCTRL
> +	select PINCTRL_VISCONTI
> +	help
> +	  This enables support for Toshiba Visconti SoCs Family.
> +
>  config ARCH_VULCAN
>  	def_bool n

With the commit message updated,

Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Thanks,
Punit
