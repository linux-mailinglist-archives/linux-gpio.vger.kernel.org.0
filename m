Return-Path: <linux-gpio+bounces-17902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92DCA6D5EA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D19961689E0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AC225D1E4;
	Mon, 24 Mar 2025 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hUS04IEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2070.outbound.protection.outlook.com [40.107.105.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2AB2EB1D;
	Mon, 24 Mar 2025 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803789; cv=fail; b=QUqKSDp833xfwaRjc36zwM1KLrQY6uKUwPdl+KUtR46f4KyO1jqrkV3bSCJXGVKvXiFqZ2g6s78FV7tssp5HZIv3YmodAl1vAQAz6FiOOG2oE164QAjd6UwJWDypYUV4Ii2+88PzNLEYyr5r7x6P+Cl8sN+turcHgvB20bz5nKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803789; c=relaxed/simple;
	bh=jjh69pIp31vGkQtRAK12kOZViy2O9w69v/YHoy/+aQM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CFR6x1nXnuRLiQORv9k+TMUA2DvWw4hbexJX2rg+S5J83ZIicfsbnQZ4hwhCz+8UMDfAjOGn1xHLSZNh9F9A6f+NR7WMJCr51iJOO1uAZkCp0lRofvHglgAPe7jj6dBie42sdc6SxxTn9tRvjMR5pdBVb5dmTJstWSJ2hTghHv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hUS04IEG; arc=fail smtp.client-ip=40.107.105.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3HYUIQTE/O6at6tbkdoze2Gs2vQLfwhsbCNw1ww+sdnqRsyhHUzAGl4K6ex8oi2sFCYeLpq0OWXS0ckodLMlRGABQ3Yxa4yhPMz8pl4gMkQe8Ug0wSU08mB6x3xseLLRfNIrhhdjF2CnV6s5OoUHLbVNWppXllnToWoUCXGjY77jmH3L8qJ+qYrZWAeIr1UgPLD5pmEjIcQ9nVYCrhIKF3JGZAjWdg9dEE5dFAzBbXFzd6VE2eVQ1kgF63T4MMGOwfTETjuz+RqEnWD0oqzKM6rcVAF+tDX1jjCzZQiDxON5fskKTIcOQspXG1qKPZhlpwsQ6b9aabppQsvOYN1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjh69pIp31vGkQtRAK12kOZViy2O9w69v/YHoy/+aQM=;
 b=o4tzRuHBEfJ5PYE8JUp8k+C7GQ/zn1QixFmhYAIbh6rmMbMbFzl63lVr6zNXnN6x2M1c81/zfFFIrgRyuMe/Rxt9OWnsLanq5kVe2Scm6fhoH7RJDnzBnMjYSBiUZNXdUfL5z4YTdzA8zypDzYznLTrNfqybhTfkQrh2u6R/VW7HSjbksfwmf4v0HFuwjEDjf/AwYkaNx3EEf4VapwyNIlLhiW6Epz5Q90OBqDFkZ/42EA7usw7z5MXNGs1R9e/prEIcgwN+mIK+5Ze0RLboEgQaypdr9EdlFAt3CpxQ/zpe3dJF1MZTiatygrg7NY0SvS7eeSmCVmdYAywYIwrjyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjh69pIp31vGkQtRAK12kOZViy2O9w69v/YHoy/+aQM=;
 b=hUS04IEG5mNYK3Pyp0xdHQs4UZoWGO0JvtzLbLFBZfOASIuY2pfUfI0L0zJpHNYF7wPf7AFqQzijevRkKVZp3NvQ7yrbaJImkW5owoorkeUSNkx+EYlPDGXKpBaXbDIm4nrluIy+wEr8PZajQZWaE2zyP6xz9v27+TFe/gnBTifPAXyDPP4Iregz4j04O3H0V2ozPkYxFnABGKVmYJ8YoUyvO8CmOyV3/whebpplDAMBX5wUT5Ioj8GY/9QTYxzxM2q9R1qmuJQDqWj25LZ132uqwL/LBAAAm2KUSETIyL2vpq2HhNatU/4sW2OXe8n4TF95g/JeiX2B0+a0ybRypA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 08:09:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 08:09:44 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
CC: Steev Klimaszewski <steev@kali.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Topic: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Index: AQHbnGRhRMwe0OLhtkis9ybXJA3l0bOBpEqAgAA//SCAAASKgIAABPeAgAAAzgA=
Date: Mon, 24 Mar 2025 08:09:44 +0000
Message-ID:
 <PAXPR04MB8459B60880CC19480C5902B388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
 <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
 <Z-ER6elHDYtIY0ap@hovoldconsulting.com>
In-Reply-To: <Z-ER6elHDYtIY0ap@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DUZPR04MB9966:EE_
x-ms-office365-filtering-correlation-id: e40f507b-88c4-4453-1efb-08dd6aab3c61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnJIWm5FM2JHSnpGbDhyelN2Tm9ZLzZ5RHNTZDdjZWI0QnhTYmd1RlpSK3Ev?=
 =?utf-8?B?SGdJaHFXNDl5NWFCdUw4Z1dFWjJtKzNzcXFmcEo3TEpXTHFJQXhOZUgwcU1N?=
 =?utf-8?B?UXZ1TG9VWkw0UytpVlJHUHYydlErcFUwQWNqN3Q0SzAxWVk3azUraktPN3hL?=
 =?utf-8?B?VC9CWFFUUFZLRzNPVDhKem1WcG9rZjJWZzdocDZpWFBxV3ZkUHQ2U2h6dFRT?=
 =?utf-8?B?YWNQaktUZmJlY05qWDNJdEtBREZCYzlzRDVYbnJvNmhiNzRXYzhHQnVKejVT?=
 =?utf-8?B?NFk2Mkp4Y1ZWTy9nNmQvTGZKbkR3ZklvSTFuM2ZyR053QWZoVDFYREp4dW9p?=
 =?utf-8?B?UXJ0ai9JcDJHUWxLK3JTcGV5OUxGMTYyMEh0eEEzb3k1Y0FnbmtEeWQ0Uzc1?=
 =?utf-8?B?emVINW80ai9sUWM3d2d3TjJvZkdneWQ3Um44bEoxdTFSeUNwY0N0Z0diaVph?=
 =?utf-8?B?Skp5cmJjZGZ5ZkFGOUJnWjZMTzJxN29IV1lmK2dJK1VidjRWbGhkRHNKK000?=
 =?utf-8?B?NnozcC84bmFDWHA2Zm1kMlRVcmw2ZEtZZ0NpaENQRHRldytGRDlwOGJmbjgz?=
 =?utf-8?B?MXU2THEybjN4RVQ0WXhhY0ErMFFiREg2cWhOU2FxYzloMVd0eW5EY0ZvbWVo?=
 =?utf-8?B?eXBVRU9GS3pvOGRzcnBSU1ROc0o1Nkp6UTRaYmhWOTUwL3o3TTNtVy81WVdQ?=
 =?utf-8?B?WHY1eGZrQlkrZnlYTkNxMFFJZGRxMWpuNXh0ZTJHMllOMHlNL2ZrRGxMWEtV?=
 =?utf-8?B?aHBWa2ZrNVVzRFZZUVJiZitQb1pGTWdjOTI0ZXBCbm1Nem1hcmNveFBJbW41?=
 =?utf-8?B?MlFiUjNRVG5ML1REQitPWXNKSVBrbTBUc0o0bHVNelA1SWZSaGhid1ZFLzBD?=
 =?utf-8?B?RndZeCszZW51TWNRTkw4ekoyUFhkSjE3TFlHTlUrNFNzQWMxUCtZWElzWjJN?=
 =?utf-8?B?RUQvLzNxQU5JQmFQcDlRM3FyYW9VbCtCSXN6aFNLeVVuVzBaanpBTlUrRlMv?=
 =?utf-8?B?TTdHMkQ3LzdaelhrMmN6UFVjeS92RGtDUXAvSHBqdjZUbERTQmk5anhCMk5W?=
 =?utf-8?B?eGNUMzZsai8vM2psTittaEVvdHNiZ1dKTDJwMHN5ODdDQytZLzZBTXoyNVRy?=
 =?utf-8?B?dW03bS9ENGd5cEF1TmZ3UnM3VVBxckEwWVZRU3BzTEovSytaSzIyR0xSUlI4?=
 =?utf-8?B?bVE4aHRMbEFxNVd5SUJsN2E2dXFnZWtzMlozVzlyK0E2N1F1S1NyK3lWenFn?=
 =?utf-8?B?UjBaTktMUWdpa09VR0ozSFhweUV4M3g0Sm9ZTFdsdHU0WGxCQ0lwZmROa1Ro?=
 =?utf-8?B?c05ibzlvT2hUakZaNXl1YkF3R05SSXcwckhUbUZmQXcvZ2lFd0xJRzZXbjJa?=
 =?utf-8?B?Nnk4NjA1QmFWczNvdmZJdWJLMzYvdzd0dDN4Vk9ka21BTkRTc0YzakEyTFU2?=
 =?utf-8?B?YUttUzloWDRiNnF3SXdlcEVBbStOOGZVR3NIekhsZExMdWtuaDBrOTNsMHJN?=
 =?utf-8?B?Z2JMWHFSc2dJNXhtbVFRbk9Pck9iZ20wT2JiNFdsMlV5cldwc3BJVHpFMjNo?=
 =?utf-8?B?c29LK0YvRUYyemdQL2hqMVA4ZWt3VFgvMkF6eWh0cGRld3lIb1U1U1dNaGQv?=
 =?utf-8?B?YkJCc1M2ZGVkUHg1WDh0V3MwYlFIV2t3MUR4ZWdnZHFtWUNnYXZXQnFOQ2RG?=
 =?utf-8?B?NlZEWUs1c25yQzdMSGMrTm10cWhldE03dUR4a1gwelVVZlM1VGtOZUhjcTJ5?=
 =?utf-8?B?b2dHcDFlYlJ0UDNneitUMVhyS2xIa1hXdjBvR09NRVBqMFFPSDRyL0p0b1Ey?=
 =?utf-8?B?TThLcVdxQ2d5bTFpZ0ZqeEdja0pDRVI1bDhwRTVkSnJMbzBEUzU5L0cwelJS?=
 =?utf-8?B?cWZJYkJ1OEppak04ZWp2ak1jczFUTmJ0eVgwV0V6VEQxdFZKMzgzSm9yTlZC?=
 =?utf-8?Q?0Z6NA6UCZQtL5kKuEKi9LE2VY7ick4Dr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXJrQW1keFMrN2QyeFRBZG5DNGV4cXplU2x0T1o4d1VTeCt5N2d5dFhJUGFm?=
 =?utf-8?B?WXNsNlhBK1ovWjRBbk5wMFhac3BraTBoMmlKOUt3ZGZ1SDVGQkRsSzFmWEM0?=
 =?utf-8?B?WTJnallUN2dlaE9ubVlWR1NlcWlDZnpyU0g4Z0cyNmR2RHU5Tlp0Z0JIWmx3?=
 =?utf-8?B?NUZVTS9NczV1L2ZsSHJmYm80TzJDQzFvR0Q0NlJ3RHIzTFdHeXFtM3dqbFNi?=
 =?utf-8?B?VUxmS21yV0hadjA1U2Z0NUtlY28za1V2VFBsTTBGc0MzM3VyUzYzdVhnaUVV?=
 =?utf-8?B?Z3hkUEFMdTgzSkJHYVJFdzhDWmhZNEFhUnFja1h4Q05wZmdGUzlZclJROUFr?=
 =?utf-8?B?NzByK2p5WmpyUWk5ZmVRZU5XUThnTHZtdmVUSmEzTnhOaUQ4M284OUxZdkQw?=
 =?utf-8?B?MThDUmhVTXgwN0tCaHdzRnFZQUplZjdKREV6Y3BhZnl0TnBKU0RWSWRuc1Fx?=
 =?utf-8?B?NjVtdlB3WHMrWUMyb0hVRWNjZGU2WlBqejFrSDVCTlo5eVlES3J6czc3aFpj?=
 =?utf-8?B?NlBYQ3ZpMU9ZUGhaSWZOd0RFcFZkQ1RpUEhJTlNXTW55L0pHZHJORWtTdUts?=
 =?utf-8?B?c05JWWNuekRDVU5IeXVJK3RFSGpSZzRERmJGMmM0U2ZETlF2eDc5S3Fqbmxr?=
 =?utf-8?B?Y1cxa3NZTDhwRWg3MTBtczdsMENOalhTMjRmS0JON241aVViWEdSdTFXWXpS?=
 =?utf-8?B?cmVUelVUV0RvNGpjMDhyc2VXRlRIMlZucEFiNFkxUGxyQ0RYNUY0M0JBSTlK?=
 =?utf-8?B?ZlBGVWszQWdQUlpIUlpkUGJaaDN1aDF5dWlJTUN0eERwNnEydis0QmVDajRW?=
 =?utf-8?B?Y051ekREQitFMVhLSU13dnU3eE04b3YvWUEyUjZxT0hBV3FvWS9oMjR0QzhM?=
 =?utf-8?B?WUZlTHI5TlZueFpNR3I1MVl2Y2dydmd3TkNvWUFjYUhvdUVYWGdUeEh4dHc5?=
 =?utf-8?B?ZjROWitsb2FVRTh0RE50UkV6LzdQOXBGNEpJS0ZSOEtyeERVQWhpQlY3cnJR?=
 =?utf-8?B?cC9IbGxCWFFuQTBoNDNiZEZTVUNad3ArVGhvRmE3Wi8zakxqVGVaZzFtSnM0?=
 =?utf-8?B?RUx4WEtJT0E2aHJPY3BPdzNtSzhVR0xGTEV4bm9CYU5Cc3hKUTRIVHgvb0lT?=
 =?utf-8?B?ZDN1c21RQTdnZWVudlhHdUpRNnZPMUJWblZSMENqbVFTQlovYmt5ZUZJRW9o?=
 =?utf-8?B?ZDZtaGRkTTBQSjIxUkVOS1JNQlBpQVA0eDZoZi9XRW1MN3c1dnBpQ0ZIYUtN?=
 =?utf-8?B?Zzg1TWFlQ1duTUFoWWtyK1FIcEhyOWVGanRrL1ZLdDJTQ0dCMDdvb2ZENm1w?=
 =?utf-8?B?eUVvaUw4M3FZbXVEQUxiNTUrWUIwVWNkNjBwMTJRTE5BWWk3emtETDJMb1VS?=
 =?utf-8?B?MUFtbGUydEpxV05pNXF5ZjY0Z0UzakliNEZzRjZSUXdlL2Y0ZE1maDJMZUZX?=
 =?utf-8?B?SVZaTE5LSGlERjc4UjlXbVpLM2kxTUtzTDl6M0VDalZiWlVVMDRLOUtSUnRp?=
 =?utf-8?B?VEdHMTdGQXJPdEErVitvZXg4VHRPRFdCRmYzNGovY2wrMlV6VGpJbjQ5TWpU?=
 =?utf-8?B?QzRxczNFeVM5S3oySXFrNnh6bTdUL2tBUVpZZGxZVzVJSjNFWkFPc2NhUGFa?=
 =?utf-8?B?UVJ3ZDZjZFFrUVpTTlgvRXRLU2paY2RwUXdKVmRjbnJZbi9scFRKeHNJb0NC?=
 =?utf-8?B?S2s4Vm9UWlJNQlYvR2pzUUszNWdIc0N0cUgvQ1JVMURUdTV2NVNkZXVucjdV?=
 =?utf-8?B?Zm96SHFCYUp1TFNONGFxMUR2SFR4QXVPaXJFam5iRG03eFplcXJGY3E3SmQx?=
 =?utf-8?B?UFVHMTVNckxYWlhnTm5aU0wxWjBqV2NPMGJOeDdMVWRieHN4M0MrV0d3em9n?=
 =?utf-8?B?bFpiUlpMa3lyZGIwUkRZaDVVTlEwVTRSeXRKbGk1cElnMkpHOEF3dS9LckFN?=
 =?utf-8?B?Y05wNlZucjl5eHlYdGFiYzJscGpCM0JoWXVWZlVwc2loSWd1RVoycHRPT0Vs?=
 =?utf-8?B?eHUrV3RLaDZzUlhKTXVxU2pwMEFERm5BNERZMFlGVGNrY3QycVhMRHlqSEhh?=
 =?utf-8?B?dUFGWUs2QkR3SldkblpLdkJJYnJxelVSbFJqd0FDcHdjMG1zTTIvNTlTazcr?=
 =?utf-8?Q?cdEg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40f507b-88c4-4453-1efb-08dd6aab3c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 08:09:44.1401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oAHVkaOoTCd/ELBJFAmrxYsg4sgEbRD2NMWYgSfECQ2bQmOP398Tpg1cj2xQsBvn+SwutgCkvysi3mRsrRMW0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gQVNvQzogY29kZWM6IHdjZDkzOHg6IENvbnZlcnQg
dG8gR1BJTw0KPiBkZXNjcmlwdG9ycw0KPiANCj4gT24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgMDg6
NDY6MDdBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gPiBPbiBNb24sIE1hciAyNCwg
MjAyNSBhdCA4OjMz4oCvQU0gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IHdyb3RlOg0K
PiA+DQo+ID4gPiA+IFdpdGggdGhpcyBwYXRjaHNldCBhcHBsaWVkLCB0aGUgd2NkOTM4eCBjb2Rl
YyB1c2VkIGluIHRoZQ0KPiBUaGlua3BhZA0KPiA+ID4gPiBYMTNzIHN0b3BzIHdvcmtpbmc6DQo+
ID4gPiA+DQo+ID4gPiA+IHdjZDkzOHhfY29kZWMgYXVkaW8tY29kZWM6IHNvdW5kd2lyZSBkZXZp
Y2UgaW5pdCB0aW1lb3V0DQo+ID4gPiA+IHdjZDkzOHhfY29kZWMgYXVkaW8tY29kZWM6IEFTb0M6
IGVycm9yIGF0DQo+IHNuZF9zb2NfY29tcG9uZW50X3Byb2JlDQo+ID4gPiA+IG9uDQo+ID4gPiA+
IGF1ZGlvLWNvZGVjOiAtMTEwDQo+ID4gPiA+IHNuZC1zYzgyODB4cCBzb3VuZDogQVNvQzogZmFp
bGVkIHRvIGluc3RhbnRpYXRlIGNhcmQgLTExMCBzbmQtDQo+ID4gPiA+IHNjODI4MHhwIHNvdW5k
OiBwcm9iZSB3aXRoIGRyaXZlciBzbmQtc2M4MjgweHAgZmFpbGVkIHdpdGggZXJyb3INCj4gPiA+
ID4gLTExMA0KPiA+ID4NCj4gPiA+IFRoYW5rcyBmb3IgaGVscCB0ZXN0aW5nLiBCdXQgcGVyIGN1
cnJlbnQgaW4tdHJlZSBEVFMsIHRoZSByZXNldCBpcw0KPiA+ID4gdXNpbmcgR1BJT19BQ1RJVkVf
TE9XLCBzbyBpdCBzaG91bGQgd29yay4NCj4gPiA+DQo+ID4gPiBJIGFtIG5vdCBzdXJlIHdoZXRo
ZXIgeW91IGFyZSB1c2luZyBmaXJtd2FyZSBwdWJsaXNoZWQgRFRTLCBpZiB5ZXMsDQo+ID4gPiBj
b3VsZCB5b3UgcGxlYXNlIGhlbHAgY2hlY2sgdGhlIGNvZGVjIG5vZGUgdG8gZHVtcCB0aGUgcmVz
ZXQtDQo+IGdwaW9zDQo+ID4gPiBwcm9wZXJ0eSB1bmRlciAvc3lzL2Zpcm13YXJlL2RldmljZXRy
ZWUveHggPw0KPiA+DQo+ID4gSSdtIGFsc28gYSBiaXQgcHV6emxlZC4NCj4gPg0KPiA+IEkgdGhp
bmsgbWF5YmUgdGhpcyBkZXZpY2UgaGFzIHNvbWUgRFRCIHRoYXQgY29tZXMgZnJvbSB0aGUgdmVu
ZG9yDQo+IHdpdGgNCj4gPiB0aGUgd3JvbmcgcG9sYXJpdHkgOi8NCj4gPg0KPiA+IElmIHRoaXMg
aXMgdGhlIGNhc2Ugd2UgbmVlZCB0byBhZGQgYSBxdWlyayB0byBncGlvbGliIHRvIGZvcmNlIHRo
aXMNCj4gPiBHUElPIGludG8gYWN0aXZlIGxvdywgIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+IA0K
PiBJJ20gcXVpdGUgc3VyZSBTdGVldiBpcyB1c2luZyB0aGUgbWFpbmxpbmUgZGV2aWNldHJlZSB3
aXRoIGNvcnJlY3QNCj4gcG9sYXJpdHkgc28gdGhhdCBzaG91bGQgbm90IGJlIHRoZSBpc3N1ZSBo
ZXJlLg0KDQpvaywgdGhlbiB0aGUgb25seSBzdXNwZWN0aW5nIHBvaW50IGlzDQp3Y2Q5Mzh4LT5y
ZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXQoZGV2LCAicmVzZXQiLCBHUElPRF9BU0lTKTsNCg0K
SSBtYXkgbmVlZCB0byB1c2UgR1BJT0RfT1VUX0xPVyB0byBjb25maWd1cmUgaXQNCnRvIG91dHB1
dCBhcyBzZXQgcmF3IHNldCB2YWx1ZSBhcyAxLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBK
b2hhbg0K

