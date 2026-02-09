Return-Path: <linux-gpio+bounces-31517-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPvsCvlFiWkT5gQAu9opvQ
	(envelope-from <linux-gpio+bounces-31517-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 03:27:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C99ED10B14D
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 03:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AD0630125FC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 02:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D949325A34F;
	Mon,  9 Feb 2026 02:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Ej6dgm2w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023127.outbound.protection.outlook.com [40.107.44.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683F1F7541;
	Mon,  9 Feb 2026 02:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770603933; cv=fail; b=FArl8J0dbPwrtQmFx3ToYZKybpzKA8Km3eS53x3ZNF4xaPLcmHRy/IyZOiR75J7x8EA2Z5fHmc42QGiHjpgD/q1Q8Qx8JI3buXLqeqRXwv8l73fzjAWzI8t/Go65bRsK0yfWHmpxcEdvvf6+nDaPEADjbW8NeZw+/1TkIcsr0o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770603933; c=relaxed/simple;
	bh=SsciKYg8SxjdbMPT5XH2Cge67k2i+CoED066IQj9uxw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oeqku5l/ZynB48Q9mF8aHp1737Zk5rYBKi00TxMvnKNl/2WN1TtMjKWen0WusLUWeOFkXa2dvOmvJWeSvpxiG31oLPziIrGefamtw/zDek61MWMBeD8d2eLp7twVX+sz3Qk3T5DlkV529/F1quVCHC+AX567aXRCKm21cXcwCcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Ej6dgm2w; arc=fail smtp.client-ip=40.107.44.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkKmaBNb2G51pqtqzyOEWuV+vCiPcqeayoi9Y9C2WUBOUIcP/RTZOrUTG6LJHcOoUeykjz5g19Puji1h2vf64FlKBSJUKxU28gMMNgHhD5TcuYgUGtNV6coCQK/pe6M64re0NZSI+GbaPg1IF44/VpugzQ8Z20Pjv03TK69UshwzMIHGXsxr9T+Ag30umNMkolA+CC6wbG1sxRAIwhqxIKQcSN/UQ1f7Bn+KSk8l3i5qnZIiF4R7TNlkN7cx1fL27Q4C7TzetUtw71TLA3BR1wx3VsAUSajbWhF1sWAIgbV6GWdgqi24dPYSDJzrkRDRpdKyAtUcbVoTSYetfOFWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsciKYg8SxjdbMPT5XH2Cge67k2i+CoED066IQj9uxw=;
 b=BlCGr/MlKvpvvdsl13Jn5u2C3vCtXGl7LXVIkNzwbvhrJOaDDgdKlRofU0ZbZcCJRza2IdQJRjDy+iowXMqxw3gYqdpyhQa0UvjyuQoQ+DXbilDL5RkZfjtvSJAdFvVPzKHT1LOHraywcNRtKKDLfXtfWqWZg1cSrKdglnjkahCDZxBal615V32/7H77wtjq1Z6a9AZUY8GriaSgaa7/EIvxa5GhIAAhpHP/L4ubMJqkeiAIcy9bPO5JZrixKEmX78VmljnZhpKyUi9GMvaq99sygwMdHGfyBDsYTjcO7UdLhO1p74BUskhgvq69pA93yCsL2l8R3M0cslQna6V0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsciKYg8SxjdbMPT5XH2Cge67k2i+CoED066IQj9uxw=;
 b=Ej6dgm2wHF/HwjvRzP0NcKcfZs5hsJzhIsOWt/kNyLycbXm5x902BLkI8ck6HPEURncSeA9nVVMiI3HAxKadOSo4tBQS7H8r/b+zaY0xmr6ySJQ5wHPZ/JEJrBn175ym07GKAaGBKpTEPMxYVk6kA5d20k8Fce7sooLtE1CpHPQ0TjTJ10xQY01CdtLpKWYK4tL8t2WW/ZR9f18nSmxw//fkbpAAWH8y/uP/do8WoU09atgaph8GgOPm4BRcif6Gq0Je93VAs08Jbh9YcQQi+1YBrviBY8THtJV6pkH2adytYknPGjaIq7bwGA1T0bXHRhTvVYFdbMSYVibga+bfKg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TY0PR06MB5803.apcprd06.prod.outlook.com (2603:1096:400:27f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 02:25:25 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 02:25:25 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Thread-Topic: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Thread-Index:
 AQHcjBon++X4WP13bEy2OWyHfoxUrrVwK6aAgAH+4O+AAv2egIAAIat4gABOpwCAAAIPAoAAG5WAgAQGN3w=
Date: Mon, 9 Feb 2026 02:25:25 +0000
Message-ID:
 <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References:
 <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com>
 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
In-Reply-To:
 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TY0PR06MB5803:EE_
x-ms-office365-filtering-correlation-id: 9eb8a243-d307-4a04-cdab-08de67827be3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0xOMEVpU0thVGREUjdneDJ2T2pWVFc1M2swaCsrZ2hBNmgzZ0RaVk9ycEpR?=
 =?utf-8?B?SUwvWStaQmlLd3RUaERXWlA5OXE0bFJjbUhxMklwQWZLb2F1UHlBRUtXc2VM?=
 =?utf-8?B?NmsxT1hub3k3cEJNTElkazUzY2NJNVVud3JsanhtbDNjMEprQWhab1h6dFN2?=
 =?utf-8?B?Rlppbm9qMTRuMWhZV0pLRWQ5Wm9hZnRCQ3NiT01KWW44Y09GUGpJbTFuN3U0?=
 =?utf-8?B?VHV0bXVJbEM3UHVrb1E1cDFORnlpck00L0FieGxnSFdjcUhCcjBWOEJEZ3RY?=
 =?utf-8?B?UDBlOXBQQ3BuV1U5SUZrZkR3QkNaLzVnMFdJL3BxRG1DTVFKdXNOZXI0M0NY?=
 =?utf-8?B?NnJzdzRpSWFFWE8yNWhXMnFrTm8xMEZKN2NyemlQeHdrWnV4QlJjSU05RFlo?=
 =?utf-8?B?QTh2S2N4bFQ2U2YrL0JBNzZqSStRb1Nwc1FobXhGc0p2SWxRKzdzTE91R2d5?=
 =?utf-8?B?Szdpb2F1dm4zd0lKYVVQd21UMGhIcW9mMjRxTy83WTc0aHlPR2c4eWpHTE9a?=
 =?utf-8?B?QXJhWjNUY014ckFUQlROUlhHSU9kK010eEN6YXluV1VFbkxqTXZ4ZytEbWM1?=
 =?utf-8?B?cmNmWWQ0MFRvV1cxYjZQeEQ0VnhHSDBsTzRabDJYQy9XSFhOejZETnBPTCtw?=
 =?utf-8?B?TytwdzVpNzZ1MFRqazI0aU9zbHEwdGw2WkpIK0JLd2RCTHZodmVIM0Q2elRa?=
 =?utf-8?B?VEZQRlNoNC9rSDZNMGgza2dhTzQ1RCtXNVAyY1JMVXU1M1NsZ0QydTRRd0hR?=
 =?utf-8?B?aXVQNlRReDV3WElSVmpvUUZnbHhMN1Jlb2JZQXNkV0dGdFg3V1YwZ0UxZVVI?=
 =?utf-8?B?K1ZyWkNwTm9ZbmNrZExuNVVPaW11Ly9mZXdJU05hUDRFbHFhWmFvSGNmTUxq?=
 =?utf-8?B?ZGtLWm5nSHFuWVlqNlhaR0paK2dGaHQrV0w5anRCeDFvbFNwMCtNN2xwUzBk?=
 =?utf-8?B?akZnclp0YUVESkxRYmE2VzZlKzVHK0hkUjJsdnpHVERrVFhkV3RHNlRqeEhS?=
 =?utf-8?B?Z1dNblBsODRackpaeWtRRVNlTFM2THk4QjFkbW9rQXpqZFNPR21lOEZDc01J?=
 =?utf-8?B?dUcvQnpIOEM1VmFJSFV4aDN6WlNmcUNvdVdCL3plWWV2clhqRWRtdVR0dDE0?=
 =?utf-8?B?ZW9KOFF0d3VsR0pjS2ZuZm53SGlRWlNTY1NwUE50UjJZRHM4ckNmK3BwNk40?=
 =?utf-8?B?OUg0eGtZZzhWb1ptYnl1WFh6T0tTL1NrSFhudE91TTdCc3BtMFhzZzhtRmMz?=
 =?utf-8?B?QmFMQU5lZnJGYnV3RUxsUXdCd3FYZnN0cmlWN21jUFFieC9rY3lkWHdKdUpt?=
 =?utf-8?B?UVB6TFpITDVqY1dONGN5WHhaTWNscURieFJYa3VyeHIwOFpZeUFhQy92WElU?=
 =?utf-8?B?SzRrWHFlRUhmeG12T3NldWJwMTZiUzAxRkJ1NEtSOFBYTzVjR2I3UTdRVjJn?=
 =?utf-8?B?dnlpbWQybjJIK1laZlFrS2QrejZGR2ZNOHNNTERndmxON0RGWjZXTk53cEpu?=
 =?utf-8?B?NHJ4eVM3N1pnVEIvSi9icFBxb3YzRzZMVXphbHFtcnZTVWp5ZHhHaG9QWUtC?=
 =?utf-8?B?ZmxvOXNLUURCcWt3ektQcXEzeFVUV2Q5bkllTHd4cVFkSW44c1RlVE9yZDN2?=
 =?utf-8?B?NGpVQjBuSGdsTEhNWHhYN2JncllVRVNXYnFHOWw2d01ESTNEb01SWHQzRW0y?=
 =?utf-8?B?YkwvVmErZXRSdWo5dDdxOHF4MmZpaWREcWZMMTdjLzJibGNNbXl3NWNiRGlt?=
 =?utf-8?B?Q3JVa3EySDErK2lLcUpxc1J4emJrNEIrSXdONnlTWXU0eU5ZU3QreHFoUzdR?=
 =?utf-8?B?WVlsa1hLODZJWHVMR3gxTmhzQ2pkQTRmUmtTUFRKYmZ6VURHZGt6QS83cG40?=
 =?utf-8?B?aERiTUVicUtZWkhJSDMzaHo0T1NBdC9ydXdpNEhYeElTSUxNTi95M0d3ZTVS?=
 =?utf-8?B?UzFlRHAwcXF0M2UxMktWcXRqRExDTm80TnJSZ3g5UkxFdENVVTJuWjcvWXBJ?=
 =?utf-8?B?d1lGcHFzMFpsNXdIMFl5TllBV3FwZlR5R0ZIb3Urc2djSEhSUGUvbEQ4UXIy?=
 =?utf-8?B?Tnk5NzJ5a0tmWktxUlRKSEkzWHZrZDI1RFNGbHo5NWtsQXZ6UjhrQy9NRndO?=
 =?utf-8?B?U1hBMXBObC9HU0JXS3F6RStld2xTZGd3K0pKclo2RzdQYWErbFlwNERyTkox?=
 =?utf-8?Q?//JyuNF5mP/fm1obLN77+EM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnBuenBSZm5jT0U1aC9vOW1leGgwZUd0aklsaVBrYkZYQkMvTFpoWXBVdnll?=
 =?utf-8?B?cm1KZEVVQ092eSt1ZXBhQ1hOMlo2V1BnRWxvaSt6eXlTeis1RDRybzVxRGZK?=
 =?utf-8?B?c1dKbWJyeUxadnpWZDA4bDVqcHVvOXRnUVlRQXl1VmpSZEREWnV6bXFZZTZB?=
 =?utf-8?B?TXF5Qlk5enJmMjR1MWc3WkJ1NzRkbkpGOFZLenFpNnJTSkE1ekVmM0EyZ2hz?=
 =?utf-8?B?UkwwdThudDBpQ09oNjZoZHRJU1hJUWdiNmhwUGFraTVEczdiTStDQkE0MVhp?=
 =?utf-8?B?VkwzMk5MYWRwWjNaZXA0dUtNV0lpdlErTysyS0JzQVFwZmdQRHBIYTBmYWNV?=
 =?utf-8?B?Qkx5czBkUmJnUVVFVExEb0VWa1haYURTTU1FUWV3Uk5hYlFIVDR0OHlOODVO?=
 =?utf-8?B?VUI5OWRlRnM4MlNEOHhTR3Y4ZjNmUUpIalYzQmJVTUxFMmZtSzBLdC9tcFRv?=
 =?utf-8?B?U2R1TzhUSWsxNy9JZVJ3VDZtY3JldUhLUEo0OTd2bE9XS1plODBWTkYzV040?=
 =?utf-8?B?cGlYNk1zbktkNWp3dnNHWG1PSXByYjcxMlJIWkRobjRmWkFiTTkrOE8xNDI2?=
 =?utf-8?B?WHl4Q1diRENSVHM1TXA1eU1BRlREUTROTzhnLy81eUR2bmppaHlMOG50dWJz?=
 =?utf-8?B?cXlYdU40ZUQyMlpYTDBGYnJyQUNQTHg2aGJ2M0NPRkM2ODIvelVYbjVBb0ph?=
 =?utf-8?B?N1ArRVNnajJ2VENrNUcvNUlhd3JhWkw4eHJ5bEdTMVVydVFKSUx3LzJraFpt?=
 =?utf-8?B?Y2Mvc1g3NzRsOEtlaEVEVjdTUDZxRVpFa2xYSkc3SlVYRUZteHBJa0s3VTgx?=
 =?utf-8?B?cE53cHVlUm50UzhKQ1lIRDVneE9yVVUrZi9zdUNHYzdaTWNZb3pidENwbmNZ?=
 =?utf-8?B?dGJYdFJCWkpOZHh3N3NFTUw4RmVjemNDNXYyRUI0NHZIbGRNZ2hxY2l6Um5F?=
 =?utf-8?B?UFdlb256bm1YVlVVaVhOcUFWY213YTAzclh4UWZhdFlNck9GTmtVY1ZsdElm?=
 =?utf-8?B?UTFoVEVLc1FyR2NHenlWWTdyOGQvV1ZiZFU5RUdDRS9uYnVtc1dZVFJQb2dE?=
 =?utf-8?B?Q1RlU242bWdyOWRSeUVoTzBmcHhweXFkemdYRHYrODRjSTVBK0w1TE9scVky?=
 =?utf-8?B?c2pXV2x5cFFSeTAxY1hTQ1orOHdGSFB2U0xBYi9CMStxRDN6SVJFRlU1OFJh?=
 =?utf-8?B?VFJYRVJNcDJVZ3pqRVoxenNicmRtWDl0TEhhUGxWMkorSUtaNTlBcUZDZk9h?=
 =?utf-8?B?bUZiSHgwdFVnZjFGSUpNOU1RYWswUndKSlM1N3NqZnhxTWU0eXg2MytaYU1J?=
 =?utf-8?B?SHFNQTFFMFNCdVI5T2dEOUxrbVpqOG93VUxQZE10b2lyRzZlS0VtOGlUdTNh?=
 =?utf-8?B?dXlCWlM2ek9JMWZKTk9kTTBqZzFyTnhXSy96SnAxU0dnYnJqcUdCWjd4VG9L?=
 =?utf-8?B?ZHNFaG9tbGVxY3ZkV1R1WHZHL2lzQTNPc0cvS3J1Sy9lOExoYi9mdmZhWjFk?=
 =?utf-8?B?R01KVzJhcWRVRWtxMXluZ0ZBQWZMT1RRci8wZ3N0UEcxNTNuSER1V1FKYyt6?=
 =?utf-8?B?aW9JY1ZwSGl4TTNmOVoydG9IQ3VaNzBxendKY1ZaZnlYWnQ1NnFvRVp5RXdj?=
 =?utf-8?B?SEhINmNGVU84ZVgrRWdxVWxYeTRUZ0FySmw1REcreDNLaEZWMUtLeDJFOGNt?=
 =?utf-8?B?dHZJRjNkRmcybEN2eXU5Nk43am1sOUVpWlFqdFJ1M0pEY1JWUHpRL2xRNCto?=
 =?utf-8?B?UDhSTFQ2MU8zUkwrSEo5RlhYSGdHT0FZRzVOdjViR1FYcGd6Y1hqMjJOcjZl?=
 =?utf-8?B?cDdsZUZMMlhnOVNabXpYRk53R21TcE14Z09kV2o3c1JoSVA5ZXhxeTJqSEt5?=
 =?utf-8?B?U0VTblozZGZhS1grZFd3THk0Y3dlUEo1enJVVE1GTW1SbWxMU0J6Q0YwSzVV?=
 =?utf-8?B?ZUx2ZkRMaVN6Q2dTc0k5eGsrWG92VDNuYmhMaXlKVkFWaU1nZVBNV0FoM29G?=
 =?utf-8?B?a3AyS3BWaUhteFIyZjhENFl0YlZXTDFrSzlxakVyQkNuR0U2UTNhZHJCc0Fw?=
 =?utf-8?B?cU9xUDBTcmMxQnkvYUt4OUw3dTlHTWl4elU3NE5MWFkzMTY0d0FtYWhWWVNQ?=
 =?utf-8?B?WmJnQ0plSmhvaHorSHZ1MTBpcDQrWlhzbm1MWUxZeWhzS3k5V3NQQ2FHWWNJ?=
 =?utf-8?B?dllqdE1id3JqbWFKTGozZTRRMytRSW9xelExQldEeHhxdDRsai9lZ095aEpS?=
 =?utf-8?B?Q1VnVnVmc3hNMVpKd3pCWUJRcDJvNzg3QW5LYWUzRnp1OG9YY2RHNDdIdXRJ?=
 =?utf-8?B?ZDRKNHZzcVc4Yk5Fak5KaUdqUUhjcWRoUVlTS2VSYlJObkN2M1hMUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb8a243-d307-4a04-cdab-08de67827be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 02:25:25.4855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jdqW+swb00XZUffkLM8tp7QvTSvBOZNPogxNf6BfAxIQowwtvme64foCysasJ6o4OyAppZRRhLaV9ksNYPF53jIHpQ4jbqNlpH04tpALQBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5803
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31517-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,OSQPR06MB7252.apcprd06.prod.outlook.com:mid,aspeedtech.com:email,aspeedtech.com:dkim]
X-Rspamd-Queue-Id: C99ED10B14D
X-Rspamd-Action: no action

PiA+IE9uIEZyaSwgRmViIDYsIDIwMjYgYXQgODoyNOKAr0FNIEJpbGx5IFRzYWkgPGJpbGx5X3Rz
YWlAYXNwZWVkdGVjaC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gPiBJIHVuZGVyc3RhbmQgdGhlIHBy
ZWZlcmVuY2UgaXMgdG8ga2VlcCBwaW5jdHJsLXNpbmdsZSBtaW5pbWFsIGFuZCBtb3ZlCj4gPiA+
ID4gdGhlIGJpdC1wZXItbXV4IGhhbmRsaW5nIGludG8gYSBzZXBhcmF0ZSwgbW9yZSB0YXJnZXRl
ZCBkcml2ZXIgYnVpbHQgb24KPiA+ID4gPiB0b3Agb2YgdGhlIEdFTkVSSUNfUElOTVVYL0dFTkVS
SUNfUElOQ09ORiBoZWxwZXJzLCByYXRoZXIgdGhhbiBleHRlbmRpbmcKPiA+ID4gPiBwaW5jdHJs
LXNpbmdsZSBpdHNlbGYuCj4gPiA+ID4KPiA+ID4gPiBCYXNlZCBvbiB0aGF0LCBJ4oCZbGwgbG9v
ayBpbnRvIHJlZmFjdG9yaW5nIHRoaXMgaW50byBhCj4gPiA+ID4gcGluY3RybC1zaW5nbGUtYml0
IHN0eWxlIGRyaXZlciB0aGF0IGNvdmVycyBiaXQtcGVyLW11eCAvIGJpdC1wZXItcGluCj4gPiA+
ID4gbGF5b3V0cyBnZW5lcmljYWxseSAoaW5jbHVkaW5nIEFTVDI3MDApLCB3aGlsZSBrZWVwaW5n
IHBpbmN0cmwtc2luZ2xlCj4gPiA+ID4gZm9jdXNlZCBvbiB0aGUgc2ltcGxlciByZWdpc3RlciBt
b2RlbHMuCj4gPiA+ID4KPiA+ID4gPiBPbmUgYWRkaXRpb25hbCBwb2ludCBJ4oCZZCBsaWtlIHRv
IHJhaXNlIGlzIHRoZSBoYW5kbGluZyBvZiBwcmUtcmVzZXJ2ZWQKPiA+ID4gPiBNTUlPIHJlZ2lv
bnMuCj4gPiA+ID4KPiA+ID4gPiBPbiBBU1QyNzAwIHN5c3RlbXMsIHRoZSBTQ1UgcmVnaXN0ZXIg
cmFuZ2UgY29udGFpbmluZyB0aGUgcGluY3RybAo+ID4gPiA+IHJlZ2lzdGVycyBpcyBjb21tb25s
eSByZXNlcnZlZCBieSBhIHRvcC1sZXZlbCBzeXNjb24gbm9kZSBvciBieSBmaXJtd2FyZS4KPiA+
ID4gPiBJbiB0aGlzIHNldHVwLCBkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbigpIGNhbiByZXR1cm4g
LUVCVVNZIGV2ZW4gdGhvdWdoIHRoZQo+ID4gPiA+IHJlZ2lzdGVycyBhcmUgdmFsaWQgYW5kIGlu
dGVuZGVkIHRvIGJlIHNoYXJlZCwgd2hpY2ggY3VycmVudGx5IGNhdXNlcyB0aGUKPiA+ID4gPiBk
cml2ZXIgdG8gZmFpbCBwcm9iaW5nIGFuZCBsZWF2ZXMgcGlubXV4IHVuY29uZmlndXJlZC4KPiA+
ID4gPgo+ID4gPiA+IFdoZW4gbW92aW5nIHRvIGEgc2VwYXJhdGUgdGFyZ2V0ZWQgZHJpdmVyLCB3
b3VsZCB0aGUgcHJlZmVycmVkIGFwcHJvYWNoCj4gPiA+ID4gYmUgdG8gdHJlYXQgdGhpcyBjb25k
aXRpb24gYXMgYSB3YXJuaW5nIGFuZCBjb250aW51ZSBwcm9iaW5nLCBvciBpcyB0aGVyZQo+ID4g
PiA+IGFuIGFsdGVybmF0aXZlIHBhdHRlcm4geW914oCZZCByZWNvbW1lbmQgZm9yIGhhbmRsaW5n
IHNoYXJlZCBTQ1Utc3R5bGUKPiA+ID4gPiByZWdpc3RlciBibG9ja3MgaW4gcGluY3RybCBkcml2
ZXJzPwo+ID4KPiA+ID4gQ2FuJ3QgeW91IGp1c3QgYmFzZSB0aGlzIGVudGlyZSBkcml2ZXIgb24g
c3lzY29uIHdoaWNoIHVzZXMgcmVnbWFwLW1taW8KPiA+ID4gdG8gYWJzdHJhY3QgYW5kIHNvbHZl
IHRoaXMgcHJvYmxlbT8KPiA+Cj4gPiA+IFRoZSBzeXNjb24gaXMgZW50aXJlbHkgZGVzaWduZWQg
YXMgYSBzaW5nbGV0b24gb3duaW5nIGFsbCByZWdpc3RlcnMKPiA+ID4gYW5kIGhhbmRpbmcgdGhl
bSBvdXQgdG8gc3ViZHJpdmVycy4KPiA+Cj4gPiBBZ3JlZWQgdGhhdCBzeXNjb24vcmVnbWFwIHdv
dWxkIGJlIGlkZWFsLiBUaGUgbWFpbiBpc3N1ZSB3aXRoCj4gPiBwaW5jdHJsLXNpbmdsZSBpcyB0
aGF0IGl0IGlzIGZ1bmRhbWVudGFsbHkgTU1JTy1iYXNlZDogaXQgYWx3YXlzCj4gPiByZXF1ZXN0
cyBhbmQgaW9yZW1hcHMgdGhlIHJlZ2lzdGVyIHJhbmdlIGFuZCBwZXJmb3JtcyByYXcgTU1JTyBh
Y2Nlc3NlcywKPiA+IHdpdGggbm8gcmVnbWFwIGludGVncmF0aW9uLiBBZGFwdGluZyBpdCB0byBh
Y3QgYXMgYSBzeXNjb24gY29uc3VtZXIgd291bGQKPiA+IHJlcXVpcmUgYSBsYXJnZXIgYXJjaGl0
ZWN0dXJhbCByZXdvcmsgb2YgdGhlIGRyaXZlci4KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMv
cGluY3RybC9waW5jdHJsLXNpbmdsZS5jP2g9djYuMTktcmM2I24yMzAKCj4gVGhlc2UgY29tbWVu
dHMgd2VyZSB1bmRlciB0aGUgYXNzdW10aW9uIHRoYXQgeW91IGRvIHdoYXQgVG9ueSAmIEkKPiBz
dWdnZXN0ZWQgYW5kIGNyZWF0ZSBhIGNvbXBsZXRlbHkgbmV3IGRyaXZlciBmb3IgdGhlc2UgdXNl
IGNhc2VzLgoKPiBTb3JyeSBpZiBpdCB3YXMgdW5jbGVhci4KCkhpIExpbnVzIGFuZCBUb255LAoK
VW5kZXJzdG9vZCBvbiB3cml0aW5nIGEgbmV3IHRhcmdldGVkIGRyaXZlci4KClRvIG1ha2Ugc3Vy
ZSBJIGFsaWduIHdpdGggeW91ciBleHBlY3RhdGlvbnM6CjEpIFdvdWxkIHlvdSBwcmVmZXIgdGhl
IG5ldyBkcml2ZXIgdG8gYmUgZnVsbHkgc3RhbmRhbG9uZSAodXNpbmcgdGhlCiAgIEdFTkVSSUNf
UElOKiBoZWxwZXJzICsgc3lzY29uL3JlZ21hcC1tbWlvKSwgcmF0aGVyIHRoYW4gdHJ5aW5nIHRv
CiAgIHJlZmFjdG9yL2V4cG9ydCBoZWxwZXJzIGZyb20gcGluY3RybC1zaW5nbGU/IE15IGFzc3Vt
cHRpb24gaXMgdGhhdAogICBwaW5jdHJsLXNpbmdsZSByZW1haW5zIHVuY2hhbmdlZCBhbmQgY29u
dGludWVzIHRvIHN1cHBvcnQgZXhpc3RpbmcKICAgdXNlcnMgYW5kIGJpbmRpbmdzLCB3aGlsZSB0
aGUgbmV3IGRyaXZlciBvZmZlcnMgYSBzaW1wbGVyIGFuZCBtb3JlCiAgIG1haW50YWluYWJsZSBv
cHRpb24gZm9yIFNvQ3Mgd2l0aCBiaXQtcGVyLW11eCAvIGJpdC1wZXItcGluIGhhcmR3YXJlCiAg
IGxheW91dHMuCiAgIEFjdGlvbiBpdGVtOiBJbnRyb2R1Y2UgYSBuZXcgcGluY3RybC1zaW5nbGUt
Yml0LmMgZHJpdmVyIGFuZCBEVAogICBiaW5kaW5nLCB3aGljaCBjYW4gYWxzbyBjb3ZlciB0aGUg
ZXhpc3RpbmcgYml0LXBlci1tdXggbG9naWMgY3VycmVudGx5CiAgIGluIHBpbmN0cmwtc2luZ2xl
LmMuCgoyKSBGb3IgdGhlIHN5c2Nvbi9yZWdtYXAgaG9va3VwLCBpcyBpdCBhY2NlcHRhYmxlIHRv
IGFkZCBhIHN5c2NvbiBwaGFuZGxlCiAgIHByb3BlcnR5IGluIERUIChlLmcuICJzeXNjb24gPSA8
JnNjdT47IikgZm9yIHRoZSBuZXcgZHJpdmVyIHRvIG9idGFpbgogICB0aGUgcmVnbWFwLCBvciBk
byB5b3UgcHJlZmVyIGEgZGlmZmVyZW50IGJpbmRpbmcvcHJvcGVydHkgbmFtZT8KClRoYW5rcywK
QmlsbHkK

