Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B751F9458
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 12:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgFOKIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 06:08:38 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:17446 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726111AbgFOKIh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 06:08:37 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05FA4rPe026164;
        Mon, 15 Jun 2020 12:08:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=P5EQA0kAJCU+qpoArB1dL5j+XIOcEoHAZRZPU8tJLpA=;
 b=fblue4OGMu74YEGyWEtTI5zp+7RsKb6+m9fchxDjseMEs6haCHJHJ4eF+YwlTFuwgeoe
 NYmfJwVtfycsBB94nHzPJN7DTodmVR8fp021QY+QQ1DK5mucaHtj6NCWpWIrWt6kyNnX
 W2Y9tVrCFHHpIXWwS+iFeQ0bYGXeuZPqpTKy2krM+5obz/WBGHLUeMpBuocsIOaJ/5SB
 i/xxNKCidvMeEBha5oAVPNBaEh7GSebmHMgC/ufCu1oSgJfaL8xVOwrhGmsI30F0vunH
 DT64ZluIZg6NcrfH+fW0WaPjsR7iCSO3MJQp1QslgstKQgpUz/SQFHst+j40TPnhi8mt 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mmjvs19m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 12:08:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBF77100034;
        Mon, 15 Jun 2020 12:08:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D99A72C38BB;
        Mon, 15 Jun 2020 12:08:22 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun
 2020 12:08:22 +0200
Subject: Re: [PATCH 00/15] Fix STM32 DT issues on v5.7-rc4
To:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <gregkh@linuxfoundation.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6b0e95ab-e240-c493-1bc1-276dd68933fe@st.com>
Date:   Mon, 15 Jun 2020 12:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_02:2020-06-15,2020-06-15 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Benjamin

On 5/13/20 4:59 PM, Benjamin Gaignard wrote:
> This series fixes issues hight lighted by dtbs_check on STM32 devicetrees.
> The patches has been developped on top of v5.7-rc4 tag.
> 
> Benjamin Gaignard (15):
>    ARM: dts: stm32: remove useless interrupt-names property on stm32f429
>    ARM: dts: stm32: update pwm pinctrl node names for stm32f4
>    ARM: dts: stm32: update led nodes names for stm32f249-disco
>    ARM: dts: stm32: update led nodes names for stm32f469-disco
>    ARM: dts: stm32: remove useless interrupt-names property on stm32f746
>    ARM: dts: stm32: update led nodes names for stm32f429-eval
>    ARM: dts: stm32: update led nodes names for stm32f769-disco
>    ARM: dts: stm32: update led nodes names for stm32f746-eval
>    ARM: dts: stm32: remove useless interrupt-names property on stm32f743
>    ARM: dts: stm32: Update nodes names for stm32h743 pinctrl
>    ARM: dts: stm32: Update nodes names for stm32mp15 pinctrl
>    ARM: dts: stm32: Add missing #address and #size cells on spi node for
>      stm32mp151
>    ARM: dts: stm32: update led nodes names for stm32f746-eval
>    dt-bindings: pinctrl: stm32: Add missing interrupts property
>    dt-bindings: usb: dwc2: Fix issues for stm32mp15x SoC
> 
>   .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          |  3 +++
>   Documentation/devicetree/bindings/usb/dwc2.yaml                |  6 ++++--
>   arch/arm/boot/dts/stm32429i-eval.dts                           |  8 ++++----
>   arch/arm/boot/dts/stm32746g-eval.dts                           |  8 ++++----
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi                         |  4 ++--
>   arch/arm/boot/dts/stm32f429-disco.dts                          |  4 ++--
>   arch/arm/boot/dts/stm32f429.dtsi                               |  1 -
>   arch/arm/boot/dts/stm32f469-disco.dts                          |  8 ++++----
>   arch/arm/boot/dts/stm32f746.dtsi                               |  1 -
>   arch/arm/boot/dts/stm32f769-disco.dts                          |  4 ++--
>   arch/arm/boot/dts/stm32h743-pinctrl.dtsi                       | 10 +++++-----
>   arch/arm/boot/dts/stm32h743.dtsi                               |  1 -
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi                       |  6 +++---
>   arch/arm/boot/dts/stm32mp151.dtsi                              |  2 ++
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                         |  2 +-
>   15 files changed, 36 insertions(+), 32 deletions(-)
> 

Series applied on stm32-next. Note that changes in patch 11 were already 
present thanks to another patch and patch 14 has already been taken by 
Linus.

Regards
Alex
