Return-Path: <linux-gpio+bounces-25532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5EBB426FE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 18:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B5C7542611
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 16:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A441C2F99A4;
	Wed,  3 Sep 2025 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lQhwXFr1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BAB63CF;
	Wed,  3 Sep 2025 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917249; cv=none; b=ZfeAEiD6crwKNJvwyYZvXttGRmheIFKjFiXcy1pwKUoLtGfHmvWIiNLelmzaEZnQ6dlNalJU09moc2kCUXUOP33ddmvVlIb4UXux5FNQ1NKgYnHd8jEbEV+CtPLbW3BWk+BEW+W3e/3pKbUFVMW/TdmS7wRygyMS0zir/wpSY6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917249; c=relaxed/simple;
	bh=iB3eSa4qb2TKPpsDg8G7juz993c3qWuMusLv6itIAIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cy/l4dcoDrpfswNbi6FPUdXyhdcZKy6fGaIsyCSYW9mSt7VRX8Ft33XfTperGs2s4bbu3hi+IjhFSjW3SALatHhUVYE2PFz9jQvibG3WH3HzxmBriooeCsRE0FV1FBym8WBqZRQDvfz/j5SZrqQ1qxhzc7bWB4obY2iudKmCIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lQhwXFr1; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583EMrHv014128;
	Wed, 3 Sep 2025 18:33:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sJgQ4wFgS+Q4c8sjFQ1HI1R30BLvBEm5k6Lw0ZflD58=; b=lQhwXFr1YA3vYFsB
	zEywhbZtYavi123rwSnRHg/LdNbXMB1hUX9pim/k7svnF2laG1phu1TzK+36lh64
	b4TGruJGG9evzDFBdnDPPgQjiLusbVYh0linc2EpPu3HsCuAWxRHfNxXDS6YRsh2
	W/NVMeGGLB/XvQdPez4RzXVxxUcc3TFp5bE0DhDOLZEx93tRXp5SyciK9nAsfQty
	TaE8wePCS5xM7igexFkTuC+HcQTwe0wQnZPZiKnEPisqaHjmNZlToYJfcqjnFTvU
	quMwNmwdMeX3kcmfL4O7ouCIg7RDASYEhQXsUtmUx9V9JtP910fcSObpphS0BEvq
	0ZYxIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2qr89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 18:33:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A7DB140047;
	Wed,  3 Sep 2025 18:32:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2601E2B4B65;
	Wed,  3 Sep 2025 18:31:31 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 18:31:30 +0200
Message-ID: <2e57454f-14fd-4d41-8753-2eac06f0597d@foss.st.com>
Date: Wed, 3 Sep 2025 18:31:29 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        "Linus
 Walleij" <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01

Hi Clément

On 7/11/25 09:41, Clément Le Goffic wrote:
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
> 
> It includes updates to the mmio gpio driver, the addition of device tree
> bindings, the HDP driver, and updates to the device tree files for
> STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---

...

> 
> ---
> Clément Le Goffic (8):
>        dt-bindings: pinctrl: stm32: Introduce HDP
>        pinctrl: stm32: Introduce HDP driver
>        MAINTAINERS: add Clément Le Goffic as STM32 HDP maintainer
>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>        ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board
> 
>   .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  | 187 ++++++
>   MAINTAINERS                                        |   6 +
>   arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  25 +
>   arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
>   drivers/pinctrl/stm32/Kconfig                      |  14 +
>   drivers/pinctrl/stm32/Makefile                     |   1 +
>   drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 720 +++++++++++++++++++++
>   10 files changed, 980 insertions(+)
> ---
> base-commit: 31b6d25a25ac3fe4ee6092f2bf04a816e4b5b64a
> change-id: 20250224-hdp-upstream-622e5da14a9f
> 
> Best regards,
> --
> Clément Le Goffic <clement.legoffic@foss.st.com>

DT patches applied on stm32-next.

Thanks.
Alex

