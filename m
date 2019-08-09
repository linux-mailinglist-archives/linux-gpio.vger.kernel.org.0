Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC31687D48
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 16:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407117AbfHIOzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 10:55:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33234 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406490AbfHIOzM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:55:12 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79Et7dA076455;
        Fri, 9 Aug 2019 09:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565362507;
        bh=SbXCWSXrPbzkxcNI0xPkTqByRL7MD28rx0zf/9b0SJc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=D8uJMUZHzeSslOS2jPMI47dDnvKaJuU35Im7B+slRsio4LKczitE4mJDuvStKX3f4
         rTinh2DrAaeKSLzM53fPmdaf/ELc+YtltA62G3pNMV9gORzCP7mSniSzYOv2ejrxgc
         xTFLgyPJLAdqJu7Usu22aO5SNXciof3OxvzeKmeo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79Et7Ow062013
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 09:55:07 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 09:55:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 09:55:06 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79Et38f088998;
        Fri, 9 Aug 2019 09:55:04 -0500
Subject: Re: [PATCH 4/6] arm64: dts: ti: k3-j721e-common-proc-board: Disable
 unused gpio modules
To:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Nishanth Menon <nm@ti.com>, <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-5-lokeshvutla@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <f6ac4c30-92e6-e952-237b-603537b67053@ti.com>
Date:   Fri, 9 Aug 2019 20:25:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809082947.30590-5-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> There are 10 gpio instances inside SoC with 3 groups as below:
> - Group1: main_gpio0, main_gpio2, main_gpio4, main_gpio6
> - Group2: main_gpio1, main_gpio3, main_gpio5, main_gpio7
> - Group3: wkup_gpio0, wkup_gpio1
> 
> Only one instance can be used in each group at a time. So use main_gpio0,
> main_gpio1 and wkup_gpio0 for the current linux context and mark other
> gpio nodes as disabled.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   .../dts/ti/k3-j721e-common-proc-board.dts     | 28 +++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 63b47b839388..509579ca3db2 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -52,3 +52,31 @@
>   	/* UART not brought out */
>   	status = "disabled";
>   };
> +
> +&main_gpio2 {
> +	status = "disabled";
> +};
> +
> +&main_gpio3 {
> +	status = "disabled";
> +};
> +
> +&main_gpio4 {
> +	status = "disabled";
> +};
> +
> +&main_gpio5 {
> +	status = "disabled";
> +};
> +
> +&main_gpio6 {
> +	status = "disabled";
> +};
> +
> +&main_gpio7 {
> +	status = "disabled";
> +};
> +
> +&wkup_gpio1 {
> +	status = "disabled";
> +};
> 
