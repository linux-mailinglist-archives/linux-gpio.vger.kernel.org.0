Return-Path: <linux-gpio+bounces-15563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D905A2C9B3
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 18:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3736B163700
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 17:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9C318FDB2;
	Fri,  7 Feb 2025 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NKtv0DZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30023C8DB;
	Fri,  7 Feb 2025 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947797; cv=none; b=h/0+Vu2U+9+4d4en6EuJu3kxWD+GwMpEETUZVkKLtDXlCZlhh/KH+wPX0oSMjy2yfxMAUEoNaSirEM6FqvoARAOxYg4gNDeAnTN4l6Vpaqc3jRBDEEHqSDksOdtxCmb66hC9OZdN/4XRo/JvuFjLeEhkut3XlUpoVoJ8MM83kKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947797; c=relaxed/simple;
	bh=oNUYLYJ3cBbS2gYJzUrPZKysiTn8zeg+2VOsqprROM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cEcLurwf4uy0/mQXj9EmsgjpX2VSsLs7ho3Eq5moroBrJGnu5Kc29mrWAJOOiu4XsxN/fZVCBPZM5QSM1TZnpEDQEXzpaoQGvHdCuh1cwTbrQ3sVYE730n7/Y7kZZRVDHXtj8NrcRbIVYax3CZL9rOj0YuuxL+Fa/CuX1+rNqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NKtv0DZX; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 517H2qbu3039421
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 11:02:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738947772;
	bh=oNUYLYJ3cBbS2gYJzUrPZKysiTn8zeg+2VOsqprROM8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NKtv0DZXtokLgalUpTO60zr4Cf092BJfxuhfrDpxAUoUfsROwTrh3/q9n5mXPkjbH
	 YgRW3VjP4wISo23vbD+PR4PjwilQoT/OWyZdPDmrWqWUHlttRLYxn+LPNKbd4OM5xL
	 HF8yee3ax0+YOWrbnW163mVqy7vQzwiCiPmxPLqw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 517H2qI7040519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Feb 2025 11:02:52 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 11:02:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 11:02:52 -0600
Received: from [10.247.30.175] (lt5cd3040qtn.dhcp.ti.com [10.247.30.175])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517H2qv4105448;
	Fri, 7 Feb 2025 11:02:52 -0600
Message-ID: <0c5f962b-3264-49c8-a1c5-893b8eb41b63@ti.com>
Date: Fri, 7 Feb 2025 11:02:52 -0600
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
In-Reply-To: <CAMRc=Meqjy+cqfueM_dQE8uP32zS0ib41qE+OPPWFkhoVTGc2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 2/7/2025 2:53 AM, Bartosz Golaszewski wrote:
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

These didn't. I figured with the dependency feedback, it was easier to combine the series for TPS65215 and TPS65214 into 1 series.

I submitted the combined mfd + dt-binding series [0] first, and once that was ACK'd, I will follow up with the gpio series for both devices.
Let me know if there's a different approach you would recommend!

[0]: https://lore.kernel.org/all/20250206173725.386720-1-s-ramamoorthy@ti.com/


