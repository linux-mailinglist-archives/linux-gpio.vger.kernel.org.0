Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7978D1D3188
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 15:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgENNmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 09:42:49 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:61750 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726197AbgENNmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 09:42:49 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04EDgMxu028132;
        Thu, 14 May 2020 15:42:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=tD1qvdb0EwmAv9XocfBUyYNcHtOhYgnwwbYe5684NcY=;
 b=lpZCseNN1q8B2O++L5FqZEfrupQp8UmuSICipi2VpYbbXdKqjviuS4uNBmOQ1Qk1/JYn
 FC0+aT7IZOR+0AaKhzk+Ozpgl88d1a5y1MBWH1j0sjx/T8Vy7mAFxLIZkKAuH5DBT24e
 w8vnJeOoFwf7/cYeADMBCKg6OvlIrAm70cghUtpnyO8Px5h4+ovsh1x/0sNyYzBPay55
 GNVpTBzYrzgrxIYjV346YgPOw8M8x1YuBl3tdk9ASS/dhGkQVptEBfcXiG2r4Y/3xJqM
 b1YktOvA+/Pa6WYvOrUBAuOptDbM+z10mLDDQLjERCoYWeW9MwohkWsITtdfWVTKKrAK eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vnbg0g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 May 2020 15:42:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CF2C100034;
        Thu, 14 May 2020 15:42:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA8332BE24D;
        Thu, 14 May 2020 15:42:32 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 15:42:27 +0200
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
Message-ID: <caef6641-b7c2-881a-a331-3d05f6f4bba6@st.com>
Date:   Thu, 14 May 2020 15:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-14_04:2020-05-14,2020-05-14 signatures=0
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

For dts(i) part, it looks good to me. I let Rob to review before taking 
the whole series.

thanks
alex


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
