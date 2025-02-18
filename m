Return-Path: <linux-gpio+bounces-16203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C81A3A469
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 18:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE3C1696E2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 17:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A281B26F45C;
	Tue, 18 Feb 2025 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Sn83F6p0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762023497D;
	Tue, 18 Feb 2025 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739900059; cv=none; b=PvUIathmnUiq5yfGsOj8GBn+JXK6fzmibdD84DGB5LY/q1wtvOjISCp5oGeXkZ9gijNTrCNEyrjbpBvNvX62k7ye1l/KbRarRoKDRXlWNWFZYCeFwIGdIpt97oZbM27sI4IGoYrKwvus+k6BV+WxskCwk7zn3FgaXkwd/JXLYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739900059; c=relaxed/simple;
	bh=pxveCCd+0WuDtzslFIWMUmLkuSfXogvGgq1ZCpgIRTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JExUzikuWhPKAD1nwOFtkDbf/e4ci2ZUrKJpNvWM4HvNtj9Di+2PL322Rc0Xx5n7IoDaGUWVmKbyYx8pVV02ZFlgji9Kg5Da4Od1qtq5XDjLcx9AjAN6ZHXBMpD89292ywIfRzeM6PnPX6fqHXIuy5zpx5yB1tkA/c7mpTXzjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Sn83F6p0; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IHXhih1719889
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 11:33:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739900024;
	bh=APPaTWCDnxYJLE0VYqIvhKqd5gtGQPP8bAgHzOeugXU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Sn83F6p0MCJsKg8Rbdis+Xu6V3a/WcTnbV2rN9T80EUPq7dnjRlL2q4HX127vvNgy
	 VLZ84Y2+553DGxXdJ7UJAw+7sYlUf9u5iPlcB3d1VcMUWo+QSk9LlqeVbsZBNGtTZj
	 5+bHPVgkpSdgU7QR1O5LadJkkzRVsGJmEm02MyyM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IHXhrs004385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 11:33:43 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 11:33:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 11:33:43 -0600
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IHXhM5037290;
	Tue, 18 Feb 2025 11:33:43 -0600
Message-ID: <a7a2709b-f7ad-469e-86f3-6db4b4b3b37a@ti.com>
Date: Tue, 18 Feb 2025 11:33:43 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add TI TPS65215 PMIC GPIO Support
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
        <christophe.jaillet@wanadoo.fr>
References: <20250113225530.124213-1-s-ramamoorthy@ti.com>
 <CAMRc=Meqjy+cqfueM_dQE8uP32zS0ib41qE+OPPWFkhoVTGc2w@mail.gmail.com>
 <065cdaca-cc37-4b1e-9c1e-e2dedbb2ffd5@ti.com>
 <CAMRc=MfR2q8TTcEHtbX9HxyFikHP_nS+Mva3dTwmgu4tvkxJ1w@mail.gmail.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <CAMRc=MfR2q8TTcEHtbX9HxyFikHP_nS+Mva3dTwmgu4tvkxJ1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,


On 2/13/25 2:11 AM, Bartosz Golaszewski wrote:
> On Wed, Feb 12, 2025 at 10:12 PM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>> Hi,
>>
>>
>> On 2/7/25 2:53 AM, Bartosz Golaszewski wrote:
>>> On Mon, Jan 13, 2025 at 11:55 PM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>>>> TPS65215 is a Power Management Integrated Circuit (PMIC) that has
>>>> significant register map overlap with TPS65219. The series introduces
>>>> TPS65215 and restructures the existing driver to support multiple devices.
>>>>
>>>> This follow-up series is dependent on:
>>>> Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bindings")
>>>> Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC")
>>>> Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")
>>>>
>>> Did these go into v6.14?
>>>
>>> Bart
>> The dependencies listed in the cover letter were just applied by Lee Jones:
>> https://lore.kernel.org/all/173928615760.2233464.12306998726512431222.b4-ty@kernel.org/
>>
>> The rest of this series still applies without a need for code modifications.
>>
> I'm not sure I'm following: should this series wait until v6.15-rc1 is
> tagged? Or did you ask Lee to create an immutable branch? Or doesn't
> this series depend on the MFD changes at all after all?
>
> Bart

Sorry about the confusion. Lee didn't create an immutable branch and the series does depend on the MFD changes,
so this GPIO series should wait till v6.15-rc1 is tagged. Thank you!


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


