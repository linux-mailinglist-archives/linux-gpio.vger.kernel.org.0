Return-Path: <linux-gpio+bounces-15886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B82A3314E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 22:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328D91883386
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 21:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980EC202F67;
	Wed, 12 Feb 2025 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="inJruE/z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB9D200B95;
	Wed, 12 Feb 2025 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739394790; cv=none; b=OVB302x1fEEAUNf2+aCLXlpzPodv7Hvt0FD1bp/ly9nXnomPtsfFqyWpONDdz7ug1qbK4g9GEH83dDyeSDg5UMRWTg998LC0m3hLujTBJPqB7n3dj7mK1Vb2I9+/xistTd58NwPO9hwEavG0PK7/4inUyJgaYyr8m+X5WDWWc1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739394790; c=relaxed/simple;
	bh=S2zA+V93rzV22fzbSTDU7gIlGOraXu55Diwx5MBdt/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FM85/bBlveR8Z3htEq+vmVWWR8/VaWaekHRt4GNZQ+8wrXjCrr6Duoog0s8+DgxL00lHC3s5Bj/Yl2f2dvAVAVQVrKgKK439o/w9FwNoFWTYW0assBAilF+3NcEFiGyq66QAVgNqzmNEVduFR/NXdY3788TFmU2md2Nm1aSKKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=inJruE/z; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CLCiHO3875956
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 15:12:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739394764;
	bh=4z6w0bnAWvx2g2n+JlxwFqtCphZzu2LQDSbTYizfo20=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=inJruE/z/Cz3CUtyCgUvZXb6YZVumt7HRyJ4Xe0Qp8XRpk1ZD1nISbJI2m5gmy47N
	 TGOcTxNOdxTYsWfxZjB/hB7bp1SzTLR1Trucqj4gAxCgKniohCK5S9Vltfo/pQErEU
	 uGqK3rRsO5Zfvrt6zyjGdYBfWoRyh+RWsQuOAHX8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CLCigr006188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 15:12:44 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 15:12:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 15:12:43 -0600
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CLChvK105055;
	Wed, 12 Feb 2025 15:12:43 -0600
Message-ID: <065cdaca-cc37-4b1e-9c1e-e2dedbb2ffd5@ti.com>
Date: Wed, 12 Feb 2025 15:12:43 -0600
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
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <CAMRc=Meqjy+cqfueM_dQE8uP32zS0ib41qE+OPPWFkhoVTGc2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,


On 2/7/25 2:53 AM, Bartosz Golaszewski wrote:
> On Mon, Jan 13, 2025 at 11:55 PM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>> TPS65215 is a Power Management Integrated Circuit (PMIC) that has
>> significant register map overlap with TPS65219. The series introduces
>> TPS65215 and restructures the existing driver to support multiple devices.
>>
>> This follow-up series is dependent on:
>> Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bindings")
>> Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC")
>> Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")
>>
> Did these go into v6.14?
>
> Bart

The dependencies listed in the cover letter were just applied by Lee Jones:
https://lore.kernel.org/all/173928615760.2233464.12306998726512431222.b4-ty@kernel.org/

The rest of this series still applies without a need for code modifications.


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


