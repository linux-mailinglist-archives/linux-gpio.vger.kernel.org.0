Return-Path: <linux-gpio+bounces-28618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D907C66B08
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 74B81241DE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779412EC56D;
	Tue, 18 Nov 2025 00:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IdWr7dr8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984921FF4A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 00:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763426694; cv=none; b=A42uNK/pesK3HPgdcuNEpi99uQe/sfOH4+S2yCszUfJ6rfp+VZK5z8MBLncM/72546YUXjTzxm1RDGhJQaBiiH/5XiiV7JVoeQwbLfC5VqmhyjGrNLNrpElzEasWoMa7jYaTEbl6iH7K1fNh7oXiCz6M1d8V9Drv1gsbk9ubpgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763426694; c=relaxed/simple;
	bh=rnGwOTLoCmSfZWKsdFEq3d0FYol6YLV5lEAAq9NHz8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Fy/LWBTiy2aGdb/BZ0dhk7jUrhau/WYjuNn4Ow1RIeuN14xHgIQxg5viAvjvCm5/jp2MgWjoA/63ppvQTFqaS/+dAc6R9L2WI48PHqyyOJwnAuC9YuJe6snkKWfWazfLJkomOUexarBJyqbflOhX6KgWGpj7io8HdPrpyIiao0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IdWr7dr8; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251118004448epoutp04a48973d67506065125e8ece1243e5f36~48zsHtr1U1922319223epoutp041
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 00:44:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251118004448epoutp04a48973d67506065125e8ece1243e5f36~48zsHtr1U1922319223epoutp041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763426689;
	bh=kFvpwnIBXk6/SfJojjGBr4Pm95AOa5Yd9irGKpoKo9Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=IdWr7dr8ERXGjQJKx5XvJ4TvTa/S7mI+ewUMatrez1pidMfb8hLWomNL6l39ufrfy
	 cRdpHLGJ7DvW0+ov5Ctsz5pU1zQKZl0z3Tc93Qn5+e8xxeUrrsyqIl7HdTmN/wl+n9
	 zrN68+ahEMrdVHbgOHqzLz8NDV1EPS4Bh7YE3t/M=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251118004448epcas2p4990b7cc628c8f69b0aa4417e053b68ba~48zrWrmCK2473624736epcas2p4U;
	Tue, 18 Nov 2025 00:44:48 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4d9Qqg5CF3z6B9m6; Tue, 18 Nov
	2025 00:44:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251118004446epcas2p2de701b1d9607623cff5a06d241db6285~48zqQBOaB0462004620epcas2p2_;
	Tue, 18 Nov 2025 00:44:46 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251118004446epsmtip1c2afdb5c4f1268c6a0ea1147c09edb43~48zqJnd592500525005epsmtip1d;
	Tue, 18 Nov 2025 00:44:46 +0000 (GMT)
Message-ID: <f960540a-e5d5-40e3-a2a5-6a775a17fbee@samsung.com>
Date: Tue, 18 Nov 2025 09:46:09 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 2/5] pinctrl: samsung: fix incorrect pin-bank
 entries on Exynos2200/7885/8890/8895
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, krzk@kernel.org,
	s.nawrocki@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org,
	peter.griffin@linaro.org, semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <15549ffd-9ae6-428a-a9b0-73676fc252fa@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251118004446epcas2p2de701b1d9607623cff5a06d241db6285
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073603epcas2p1366028012403591bd297764f91694181
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
	<CGME20251117073603epcas2p1366028012403591bd297764f91694181@epcas2p1.samsung.com>
	<20251117074140.4090939-3-youngmin.nam@samsung.com>
	<15549ffd-9ae6-428a-a9b0-73676fc252fa@gmail.com>

Hi Ivaylo,

On 11/17/25 22:42, Ivaylo Ivanov wrote:
> On 11/17/25 09:41, Youngmin Nam wrote:
>> This patch corrects wrong pin bank table definitions for 4 SoCs based on
>> their TRMs.
>>
>> Exynos2200
>> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>>   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
>> - Per the SoC TRM these banks must use the 'alive' layout
>>   (.fld_width = {4,1,4,4}).
>> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
>>
>> Exynos7885
>> - etc0, etc1: update bank type to match the SoC TRM.
>> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>>
>> Exynos8890
>> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>>   a non-external interrupt bank.
> 
> Interesting, so there are disparities between vendor kernel drivers and
> TRM?
> 
>> - gpi1, gpi2: update bank type to match the SoC TRM.
>>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
> Vendor kernel [1] points to these being bank_type_4 (4, 1, 2, 3, 2, 2)
> 
> [1] https://protect2.fireeye.com/v1/url?k=4f17b83f-2ff52562-4f163370-000babd9f1ba-2f14da64e4262efc&q=1&e=e88c07b3-b735-4e09-975b-82266d6f3d7b&u=https%3A%2F%2Fgithub.com%2Fananjaser1211%2FCronos_8890%2Fblob%2F0460c258d6910628410263dc838a81be8bda6776%2Fdrivers%2Fpinctrl%2Fsamsung%2Fpinctrl-exynos.c%23L1281C24-L1281C35
> 
>> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
>> - apply lower case style for hex numbers.
>>
>> Exynos8895
>> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>>   unchanged.)
> 
> Also differs here [2]
> 
> [2] https://protect2.fireeye.com/v1/url?k=5498d3ae-347a4ef3-549958e1-000babd9f1ba-ad745ff8945d06a1&q=1&e=e88c07b3-b735-4e09-975b-82266d6f3d7b&u=https%3A%2F%2Fgithub.com%2FNeternels%2Fexynos8895_kernel%2Fblob%2F5eb1b4159bc466602e7634b1f7a4f471f4c027e2%2Fdrivers%2Fpinctrl%2Fsamsung%2Fpinctrl-exynos.c%23L1799
> 

I'm not sure why the vendor driver differs from the TRM,
but since we've identified the mismatch, we should follow the TRM.

>> - apply lower case style for hex numbers.
>>
>> This aligns the pin-bank tables with the documented bitfield layouts and
>> wakeup domains. No DT/ABI change.
> 
> I suspect the changes are valid, unless trms also don't contain false
> information. In any case, this makes me wonder if there are more
> instances of such errors for older SoCs.
> 
> Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> 

Thanks for the review.
I believe the TRM is correct and should be treated as the source of truth.
I checked Exynos 2200, 7870, 7885, 850, 990, 9810, Exynos Auto v9, 8890, and 8895,
and found no issues other than the four SoCs addressed in this patch.

>>
>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> I wonder, what was this tested on?

Tested on Exynos850(E850-96 board).

> 
>> ---
>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 40 +++++++++----------
>>  1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> index d11b2d4ca913..b4a7d86b82fe 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> @@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
>> -	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
>> -	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
>> -	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
>>  };
>>  
>>  /* pin banks of exynos2200 pin-controller - CMGP */
>> @@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
>>  
>>  /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
>> -	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
>> -	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
>> -	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
>>  };
>>  
>>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
>> @@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
>>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
>>  	/* Must start with EINTG banks, ordered by EINT group number. */
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
>>  };
>>  
>>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
>> @@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
>>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
>>  	/* Must start with EINTG banks, ordered by EINT group number. */
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
>>  };
>>  
>>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
>> @@ -1544,15 +1544,15 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1a0, "etc1"),
>>  };
>>  
>>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
>> @@ -1563,9 +1563,9 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
>> @@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
>>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
>> -	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
>> +	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>>  };
>>  
>>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
>> @@ -1695,15 +1695,15 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
>> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
>> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
>> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
>> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
>> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
>> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
>>  };
> 


