Return-Path: <linux-gpio+bounces-25521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1734B422C2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9FDA7AC3F7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE513115BE;
	Wed,  3 Sep 2025 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dv+aGAmr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35E430EF6D;
	Wed,  3 Sep 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907920; cv=none; b=LDzPpQ1SEsvUD2E4SwNdda1nm+xlP2Tp2r/q+zDI6p0/pzliNUb1v04I42GTfvKKcx9QaXqr1FXk+jN3rH71HXsof/W0x8Wz4XXm4t9VOdsAhpoyN1y1fxUzv51ykviTg6uXkYyX1momZ59A4y6rxVTKrvGfEYWH76+EjUDArdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907920; c=relaxed/simple;
	bh=x94k57n5g4szNvbim9+TTaaBYUxakxMIrHZ7n4YCMcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RakVgCMc8TlSIN+0zTn/rcwfWNDid2UeFJgIbr5HZjY+u2mXsmU9h0Pt6YuSjAkPJTxzUasSty+C1Evt+BG99hAUsZNaJ/lCMUzxUIiXjhcEvzPROvudYJDd6smm3KgDvJHSv4mEqwSyUMNomn77GQGEsOgajYkslYIAKLRDoN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dv+aGAmr; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BRm9D016232;
	Wed, 3 Sep 2025 15:58:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4UlTu2YpLab0/pa6q4pnPYbb7UfqHxugcQ+IeQKpoe8=; b=dv+aGAmrdVz2+GR7
	WbDwiJvebx2c1PJDxXNLuofMlIPs+uPWjzRncV3nJtg529P2gJ38/DUXZI5R9qSl
	q8xEuxTcsC9GTw6bAT8OWdgHd3mqQU6mCLGHVvl0PL58yezEUoff4wlMfedUl7GQ
	vC/SuSvFwhMjOZFIc1uHi8dyse+ZOpaGzp5Pa4DJNAQ1vdb0tKxq0S0/pWyKN15W
	pyt+LdVjNuT6NCU6m/f5aKVTgN1ywevniL28nsQgnW/MkdlHiL+O1bqP5fR9QXOL
	nb44vr2wn/jF/Z5r9DgZBr9Qg9YoPCRFChnxVQnDZ+wpd34L4sO44ppHbMbvgcad
	k+rH0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6frr2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 44DEE40048;
	Wed,  3 Sep 2025 15:57:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64962399931;
	Wed,  3 Sep 2025 15:56:57 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:56:56 +0200
Message-ID: <66a94f4b-2efa-4671-9668-71995a9c1ac4@foss.st.com>
Date: Wed, 3 Sep 2025 15:56:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux function RSVD
To: Antonio Borneo <antonio.borneo@foss.st.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01

Ciao Antonio

On 6/10/25 17:23, Antonio Borneo wrote:
> This v2 is a subset of the v1, split-out to simplify the review.
> 
> This subset:
> - introduces the pinctrl mux function RSVD,
> - adds two use cases requiring RSVD,
> - minor re-format of the dt-bindings.
> 
> Changes v1 -> v2 subset:
> - rebased on v6.16-rc1,
> - added use cases of the new mux function RSVD,
> - added Reviewed-by: on 2/5 (former 04/14 in v1),
> - added commit to re-format the dt-bindings,
> - Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/
> 
> 
> Antonio Borneo (3):
>    ARM: dts: stm32: Add pinmux for CM4 leds pins
>    ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
>      stm32mp15xx-dkx
>    dt-bindings: pinctrl: stm32: Add missing blank lines
> 
> Fabien Dessenne (2):
>    pinctrl: stm32: Handle RSVD pin configuration
>    dt-bindings: pinctrl: stm32: Add RSVD mux function
> 
>   .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 25 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 14 +++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts      |  2 ++
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  2 ++
>   drivers/pinctrl/stm32/pinctrl-stm32.c         |  9 +++++++
>   drivers/pinctrl/stm32/pinctrl-stm32.h         |  3 ++-
>   include/dt-bindings/pinctrl/stm32-pinfunc.h   |  1 +
>   7 files changed, 55 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

DT patches applied on stm32-next.

Thanks!!
Alex

