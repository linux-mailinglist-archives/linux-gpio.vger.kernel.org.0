Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64DDF249EF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 10:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfEUINt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 04:13:49 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:18594 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726193AbfEUINt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 May 2019 04:13:49 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4L875aA001663;
        Tue, 21 May 2019 10:13:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=wbqGG8HuDpV3tZJFOhJKGCU27qgfbSdFuxdaOzI8vDQ=;
 b=Qa0hmHH3fbgr1Qh1hO3qmsjBmLMxNUiuF2akEV2t1FZ+ymEY/RoQG2Sd6wOw2yMHsUwE
 tyUWx/GFZbFk77lanlGc9DENBAFoUjcs9Yc4h2gX9v5Rxe+YPRAOQIUmt8B/XQY1dauJ
 Az4cSInjeewi4fCnbtuVbUzVXEgGUfndzsFzpVKiuAtPeorw70Ol3Z5gtj9OQM4pdWVN
 QzL1PNjj2Xbleil4j/QqkJJu9osO1xzjHGLC/L6qlSoWtoQNe2alBIi38qOJvBvpA37z
 p3QqGZ1G3umnhIDWZR18W1Pz8zoqrzMwVrFkWajybeg0q9cySz2ZumtQ4C+BAQQoNwUm OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7h0r4ck-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 21 May 2019 10:13:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0040A34;
        Tue, 21 May 2019 08:13:36 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D20E17FB;
        Tue, 21 May 2019 08:13:36 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 10:13:34 +0200
Subject: Re: [PATCH v6 0/9] Introduce STMFX I2C Multi-Function eXpander
To:     Amelie Delaunay <amelie.delaunay@st.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <0a9bf716-addc-9342-09fe-06ff048ff7d7@st.com>
Date:   Tue, 21 May 2019 10:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-21_01:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Amélie,

On 5/9/19 10:58 AM, Amelie Delaunay wrote:
> This series adds support for STMicroelectronics Multi-Function eXpander
> (STMFX), used on some STM32 discovery and evaluation boards.
> 
> STMFX is an STM32L152 slave controller whose firmware embeds the following
> features:
> - I/O expander (16 GPIOs + 8 extra if the other features are not enabled),
> - resistive touchscreen controller,
> - IDD measurement.
> 
> I2C stuff and chip initialization is based on an MFD parent driver, which
> registers STMFX features MFD children.

...

> Amelie Delaunay (9):
>    dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
>    mfd: Add ST Multi-Function eXpander (STMFX) core driver
>    dt-bindings: pinctrl: document the STMFX pinctrl bindings
>    pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
>    ARM: dts: stm32: add STMFX support on stm32746g-eval
>    ARM: dts: stm32: add joystick support on stm32746g-eval
>    ARM: dts: stm32: add orange and blue leds on stm32746g-eval
>    ARM: dts: stm32: add STMFX support on stm32mp157c-ev1
>    ARM: dts: stm32: add joystick support on stm32mp157c-ev1

Device tree patches (5 to 9) applied on stm32-next.

Thanks
Alex

