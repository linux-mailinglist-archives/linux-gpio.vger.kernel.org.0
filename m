Return-Path: <linux-gpio+bounces-23629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D8B0E069
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 17:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BC2FAA5550
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 15:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFBC26980E;
	Tue, 22 Jul 2025 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n4heGJCp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD3266573;
	Tue, 22 Jul 2025 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197853; cv=none; b=D1m9WAtMFYksCw2JCMTi3LofRm7DrjJ9j+uG4uRbpoGNOtfxhY8bDEIKPE9QJozsWTptbn8YoTEYEDxbtVe6tddj8TafE42Y7Yy7865UHz3STjN/bijG9okLl8+UwmkTeSZ/8dH55cqWF5eX4YZ2p/GgIWuEZTomnW8ETCNmQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197853; c=relaxed/simple;
	bh=A8wLSwm9xXnzb2apvA8fQLXT7w0e0Ve3BVS5t7DOv74=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oOwpwISLY8N19VPlK7R76m5iXBsyK/Wy6tcsLlJfXzuBbSYD5HE6Js5uuu//Jyxgk/l8X56Tx/1bo4GFx0282dPBMaeoOIPXAT7JtW6iyzMrXJbr5Ipc/AnOnPwFiVPSUhnIz1zkpHGauga49XQeelHb6he9V0Cn/Pi6Fig7Kec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n4heGJCp; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56MFNZvT1522352;
	Tue, 22 Jul 2025 10:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753197815;
	bh=sW2GBEQrQi+JKAM+Fhb11vtMQlSPhTqXkwDIFlPCD0I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n4heGJCpphWB85Vzz/BU1WCFjcvz7lYq4soTiS1Xe7ocR/+MC3UvK8PArUPbbTK8V
	 eIcxUiiZ85qSo0qnMuvn3cBPTXadlO3TgvJfIQX1UUU+AMwlfToG66hYAOMzxjF/fx
	 3tMWCM3NG7Ey+X13STG3lagbSo/smVQzgEum4uis=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56MFNZlo1117951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 22 Jul 2025 10:23:35 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 22
 Jul 2025 10:23:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 22 Jul 2025 10:23:35 -0500
Received: from [10.250.42.221] ([10.250.42.221])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56MFNY4t1539170;
	Tue, 22 Jul 2025 10:23:34 -0500
Message-ID: <9b64b787-81bb-4a87-8d4d-3879a116b9d4@ti.com>
Date: Tue, 22 Jul 2025 10:23:34 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add TI TPS65214 PMIC GPIO Support
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
        <jcormier@criticallink.com>, <christophe.jaillet@wanadoo.fr>
References: <20250721233146.962225-1-s-ramamoorthy@ti.com>
 <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 7/22/2025 7:33 AM, Bartosz Golaszewski wrote:
> On Tue, Jul 22, 2025 at 1:32 AM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>> The related MFD series was integrated in mainline during 6.15 cycle [0].
>>
>> TPS65214 is a Power Management Integrated Circuit (PMIC) that has
>> significant register map overlap with TPS65219. The series introduces
>> TPS65214 and restructures the existing driver to support multiple devices.
>>
>> TPS65215's GPIO specs are the same as TPS65219, so the "tps65219-gpio"
>> compatible string is assigned to two devices in the TPS65219 MFD driver.
>> No additional support is required in the GPIO driver for TPS65215.
>>
>> - TPS65214 has 1 GPIO & 1 GPO, whereas TPS65219/TPS65215 both have 1 GPIO &
>>   2 GPOs.
>> - TPS65214' GPIO direction can be changed with register GENERAL_CONFIG and
>>   bit GPIO_CONFIG during device operation.
>> - TPS65219's MULTI_DEVICE_ENABLE bit in register MFP_1_CFG maps to
>>   TPS65214's GPIO_VSEL_CONFIG bit.
>>
>> TPS65214 Datasheet: https://www.ti.com/lit/gpn/TPS65214
>> TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
>> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
>>
>> Tested on Jon Cormier's AM62x platform with TPS65219.
>> GPIO offsets remained consistent and functional.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> Tested-by: Jonathan Cormier <jcormier@criticallink.com>
>> ---
> This doesn't apply on top of my gpio/for-next branch. Do you think you
> can quickly submit another iteration rebased on top of it?

Will rebase and re-submit! Would I send it as v7 RESUBMIT or v8?

>
> Bartosz

