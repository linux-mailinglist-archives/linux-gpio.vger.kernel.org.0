Return-Path: <linux-gpio+bounces-31491-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEe+LiLShWmOGwQAu9opvQ
	(envelope-from <linux-gpio+bounces-31491-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:36:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EB0FD4BE
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FAB6302E903
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 11:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529903A0B13;
	Fri,  6 Feb 2026 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="eW9M7J6A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023134.outbound.protection.outlook.com [52.101.127.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FEC399003;
	Fri,  6 Feb 2026 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377690; cv=fail; b=OFHQb/ckoJ00Ymn2tclQk179mWgQwX8NENXoTzLwhZRbpixFfs7xF+EYGpWiQc/OiE0fdXrQafcZJdW9u7Gn1KXpTyhH3pdoZrburYU3kzcUODEuMi66aYgYWjtGd2sCIgU6pPJCOkjgVhTZsqUrW5VqevshhtpWIHGfp6d465A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377690; c=relaxed/simple;
	bh=2LYB2Xon2R1NhSTYudhZ6oaYCsDuHXlEc/WriJLn+QE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DDbSdK/ns9dCuNeYmaDbeszBTFJYNUASXk+kcisJ/tYyWsmQAaSVa5WhffNbo+/vGNEGXcG4LVe3G/X2LPQCpAeoOaBzRx32Xu3aA5ONiy4LX5GtXSk/UnPDUNOZpVZ18nSAej6h4b9HQOLl6t1SBnKg39foOzcOTXHykOCLDk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=eW9M7J6A; arc=fail smtp.client-ip=52.101.127.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD+h0s2tYZmH85kFJZZn3v0J58PpkFPmuBmu0pHGBTEtnb+zpIODVYctCixKFkIgUzaAE38Wmwx2J4qeJE7CaMrRhV/aE+2ou5e7FZ9BUPQazUUZo6f/speKl1RVOzjqTfr8gFiqc3sV43cbYYDqLl2ODCRbWr5CxDk71PbKX5tlSTX9fRk4Pz/O2eR0qQyuxIuHurBEXEqUUZ3ivy/sYlCWDIFG4ybovOi2IKIrr0A4MVBUiVn7DizVMb49zN3aoOXXv+ROG517/ohw18LC0Vp9h0qKaASaPiSMDZHP6gX5cAycRuKgDsaUUIGLgLW/Sdt+pfRuS7MhsNXmRpYPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LYB2Xon2R1NhSTYudhZ6oaYCsDuHXlEc/WriJLn+QE=;
 b=FUZMnoZwKOEnl/h7wrnH4SM+wKPGYCTJj+nQJfSDhpALPkVGD94KFnyEQCjWkzCYgEjk2KTzzvAjJDylgzmQyaHwGWY4nwkrkMpp3histVEwHeViq5YmR2os9SVfFWZneSEQh04iA89vtog1Vv7YfgOIT6CC1i8FRWAjWAUanALpBryny9QXproZej9LaSZGb12GiHG36YlzRsw8eO44p8A4EoR9ygWBSYjBoUS2sKqbx4sdP6J+TgUHGFKthQgGMIQlbtFrLglANlpMfxhZ1WLQb9SgWZ+O2oyUdkIsclMGvOA7Or4j888XqiNnZBragNyOWqu0jDoNrPvY2YgB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LYB2Xon2R1NhSTYudhZ6oaYCsDuHXlEc/WriJLn+QE=;
 b=eW9M7J6AmOwEnuv5CtbKWzfQIPNMjwoUSSwVjGI3SyMEf19qh0+m+/ZwNNt2BOEpqo6hLZrHrgnlm9i7CL0vf9gdzXkbcTrXe7tQMjmWAljgrJBUFxn9pyATthksybo2fzBLEkaa9cj1vDUVGRh3PKNZKrnqheR11Ul5kqN3/SiFh771AIHA7mjvRtXV02jwcpwbPN55L5GhS0bmK16jo1oAwPscZO49Pz/LVY9oB645TdaDoLx8gU08RjMyCfIahYRuxvf9JF6brHeSA0CwxPFhwuiTOS8DLqfgJ3712I8WzL3LUqjPrk6ffeROkrbibIAp6PKW3QAJeHlV5k/b8g==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYSPR06MB6290.apcprd06.prod.outlook.com (2603:1096:400:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 11:34:47 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 11:34:47 +0000
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
 AQHcjBon++X4WP13bEy2OWyHfoxUrrVwK6aAgAH+4O+AAv2egIAAIat4gABOpwCAAAIPAg==
Date: Fri, 6 Feb 2026 11:34:46 +0000
Message-ID:
 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References:
 <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com>
 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
In-Reply-To:
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYSPR06MB6290:EE_
x-ms-office365-filtering-correlation-id: a13d407c-e9d0-4163-e5ff-08de6573bb3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZStSUzNzQ2IxczVTdmcvTjZ3d1d0V2MrZEhsNXJqa3pxVkQzTGhrd1ByYU93?=
 =?utf-8?B?b3Y1cGh4RUZQTEZxUmIzUFEyRklzdUhsdnlGcUpBMGtFYTdydlJPbG1YTWRK?=
 =?utf-8?B?Zld0K1RFT2I2c2xkZmVyOENSZ3dFaXZJRldKTHdFc0NuNytKbG1wVWhTU1NO?=
 =?utf-8?B?d04wbkNLanc3NFd4L3I4Y0VWU2tJdzRmZWdRMnlucTZHZ0FndDEyaGhQdlZ5?=
 =?utf-8?B?Nlg5VVdUT054ZXNJbEloK2cwNmxXckNSN1NXa1BvL2JmWXRmZzF0dWdnNkpL?=
 =?utf-8?B?L1pxSnc2MzlZbjZBemVWaGsvOXE3RE9mQUJXZWxkcVRIKzlzOXNJenluNkRG?=
 =?utf-8?B?cEZuWHpVaDhnLy9jYmxkSVh1blNTcnpSZWc1WXZRdjcxK09tMUtMSWJGc1A0?=
 =?utf-8?B?cGg3NTkyTWIySzF4YjhlcEhpRjRFb05kOE1NM21SSEk3Qks4eGk1Y1M0MUsw?=
 =?utf-8?B?ZlA3dGFwWUdRS05lbThMSHJnZjR4a0FnTXlmNjlydDF4OFV1YUpUcEkwT2tv?=
 =?utf-8?B?QnlXTUVORVVLMkdHYVBLeG91Uis2cDZlTlo2YlBXZFIvQUVZeHlZZ2wvNmpw?=
 =?utf-8?B?WXRoelkyc2s0b2Y2UWxZRFBHa3lMaVE3Njl3SFQrbjNGUjNaTWhqOVdxczBp?=
 =?utf-8?B?SXZoOWtwcjYvS01aVkNUZ1oyT3gwbUlWN1RJNnI2VEVpU2hjMklaY2xsYkxY?=
 =?utf-8?B?bXozTk41MjM4ZnVMdUJxcGlSelBNWEFvRHhRUlh2SmFFTVdST2dYVkxJWmYr?=
 =?utf-8?B?dy9wZE9KRlAwV3Z6RGdNN0Y3c1VXVzFxcUVXQks5RnRJVC9pcDNBaWtRall3?=
 =?utf-8?B?Wk81ZkVBT0w4b0ViU1Npa2Y0c2wzVWdpdnZLRXZHRENkcjdMTDJXRnE4THBz?=
 =?utf-8?B?M1lvTkRpQzdCSzFKUHRTeDRvNHp3ZEhzS00wTERLSVpiaFR0UE5iY0ZMaTFh?=
 =?utf-8?B?VWI0R0VjZ2t0RHRuZVZrSG0vQ2R5c2l1K1lCSVpQVWRnaUM1Q05iblRKeVVj?=
 =?utf-8?B?bWdQSXAzcmIzd1Z2NGVtUTJvTGRkRzBiUXZXYy9UcUphNmFaT3R3RVQxVHZl?=
 =?utf-8?B?Q2FtU09NL3IwYmFma1Z4YWlvWTJoY1B1YlF5RklHelBQdjJ2UDhFb0hESkd1?=
 =?utf-8?B?dUExVmFjSTJZQTRkNmkrTnZVbDZuMTB1RzJwV1Z0SFVJVWdncWVLSFBjZ3Fj?=
 =?utf-8?B?M0V6UXlxZGtuRHlmVW9LN1VJL0xHSE5QZFl3T0RPYi80ZmFTWk81N0VETi9J?=
 =?utf-8?B?eFhtY1lhMmRvL293UFZPTDdCdHRmM2ROV243WWNSZldpS1l0SndkNkxxZmxa?=
 =?utf-8?B?dEhydFlSS2dPQ1pvUDFRN0p0aHc2ZGxWZkZjMFBLQVhxcHltNnE4cFFqZS82?=
 =?utf-8?B?Q2MrMW1wekVyeE16aGdqZ1Jzc1FtU3JkcWJrazU4cFN5Zm9ta2c3N1FxL2pX?=
 =?utf-8?B?TVhiLys4czY5SndqWjVZNHJOZ1dqbEMxbGFweWJ4Z2dyMGJHSXBHc3B6T1VE?=
 =?utf-8?B?YjRHenFUblZhS0FDbVJjSXNscVBBckJDMzJJQlRQN1gzd0hFRkx4SWlqWDlu?=
 =?utf-8?B?MU1BaUhSR0JFV1A5bkQzenpHYjlSWkN4bk9hNlVFOXF2aUtEWDJsS05KOG8z?=
 =?utf-8?B?MDBWYk9sU2V4YitLSldORi9lWlNlOFVqMm9BMVZKSk8rRXp1WHFPVzdSN2R4?=
 =?utf-8?B?Tmk0OUlpb0lBdFZBMWFPTDE2ZW4vOXhnS0VjWlR0TDVlWk55R0hNRm01OUFU?=
 =?utf-8?B?TW9wdG5QUlJOZGVRSW1Ecy9iTG1oVk9VWXRhVGhYU01hSy8xdUJsR1pUVUtR?=
 =?utf-8?B?WTNVRVhPbkl0ZkpiSjA3NDdwTnh0N2pTNGROUlVLQnJZOTFBb3JDU2lxYzEx?=
 =?utf-8?B?MkZWSlNaeUY5NUtHVGREWnhnbWtiWE9WODVyUXVGNTk2dzI1WFBzWGVid1p4?=
 =?utf-8?B?TUdLUGxFaWJmRGo5TUREaldlTVZDT21IaSs1U1o2Lzc4RTVreTlpVmR6WHA5?=
 =?utf-8?B?V0xLV1lna3RYbDRoaEtuNGkwWDhvZk01NlpYY2tHVVJwMmVTSXdaODYzRTJK?=
 =?utf-8?B?Zm5aekM3bkd4QjlTdEk4Sk93cWVJVFlhdytzMUxHZWV6VGNMY0h6RjYxK1JP?=
 =?utf-8?B?WHhzSzVzMGV0MFhWYk00MHc4NmJUS3VnOWhCRVUxamsyOEsxS0J6cXNFb1dG?=
 =?utf-8?Q?0OuaTAla9vg2+jZxzFEMpeU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3FkTDNpZHB1Unh5akhlWnNwUC8vdmlsS0o5eXAzSHI1N2Zqb1hwaExUN1Zu?=
 =?utf-8?B?UDMrSm43R1BKem9IeDB4eEpqZERrVG8yMG8xNGNpSGc1aTlTU3l6aEZkWDZn?=
 =?utf-8?B?cEZJSHp2VDgwenlqWEYwWlNTYitiVmY1L1UrQnJzSGxpbnUrcU44Y1BEL0kr?=
 =?utf-8?B?U0hwZDNtMzd4T0g1TExaOGt2cEtzYTErN05tRlI5SWpPa25kQkpTQjBnSnlV?=
 =?utf-8?B?RDlaQ0xIMFhLOVFwSkNLM1pDOGNROE9xKzVTQ0lHQU90Y05qcFZGU0ZKT2xL?=
 =?utf-8?B?NEZ6Y0d6RW1NbWdIQ2NlMnNvVDhidFFSazA0WGNzVENXM213eHRiQmlQeHhv?=
 =?utf-8?B?b1czWnNqblFrVmFuVkZVSGVhTUtHWEFQc3U0YTRFemRlMzdlTFBhU1hLRzll?=
 =?utf-8?B?K3BGcnA3M3EvOFNTVmZyOGxXMTZQZ1I1MHNvV2ptdGYzRUM2TEdaWjdaaGFS?=
 =?utf-8?B?ZkxHcVVESy84TVFaMEJLTXZzN3gvN0l6WkhxQ2Nqbkw5Tjg4MTAxNUlnc0Rj?=
 =?utf-8?B?WUVLUGRTT0h1N01KZTZ1U2F0TnJ1clp3ZEp6RHpJMHllRDNHWndRYlhUWlk2?=
 =?utf-8?B?b2FCNkJLU012c3d2ZktxRkhodHhZSDFzaUMzSnBGcW15eU40d3laY2hWUXNs?=
 =?utf-8?B?U0V1MTdDZXlNbnZZVUFCYzR2clBYNmpuYU5HRjZISUNnaTVpVTkzVmd6YW41?=
 =?utf-8?B?b2V0bzhHdURieCtkRUZwNWtPbitWSHRna1JYRjRQVW9wQXQ4Vzd1U2ZvM1h6?=
 =?utf-8?B?T2xLS29aYzQvcDc5Wmt0STFpTjA1b3hOaUpuZE1rOUFzODRVYlA2eVFNOGtS?=
 =?utf-8?B?RXNmOHI0NmdLcFJZMUY3KzB3Y0lLU2duRkVHd09PTUZoM05KM2FEYzJrVjBZ?=
 =?utf-8?B?eWJIREdCOEhqRHNjeTJlVTJTSUx2anBrSGhEU00ycFJ2NXB6Q05jcTZiL2sr?=
 =?utf-8?B?WFZjODNyZHMwK0lEanRLYnFzbjdCRXNheC94bWNRYlVtbkZ4OWh2ait3alkw?=
 =?utf-8?B?eC9QeDdKNE0zdXlDUmphTVBTTmRlUGd4Vi9EeHplVlBhTmFYQndBdUoyZG5Q?=
 =?utf-8?B?emxTeTlLT21hcENSKytJM2lqTWpYa0h1Z0RJamMvRU9GYkFRMjN3M2hoSThV?=
 =?utf-8?B?MzA2Q2FrMEJNemlFUHBGK09FeCtLMHlwNmtPbUdyR2JhTlZtRFljRDhUVGpz?=
 =?utf-8?B?WS9JazJBV0xPeXIrMzVLMlBtdGRMbmVRL3hHRXo2cW52WWVOVVFPazJ6a215?=
 =?utf-8?B?M1c3YzU3M3dvakI3Vkt6ZksvMGVXb1pveVJIZXJPNjdvZUdUQjhEbTMwUzNo?=
 =?utf-8?B?SnFITGVXczl6a2s0Nkt2S3Z4Z0U1YVV5QTNFNzRSWmVxMzBKYmsySmQzQ1N0?=
 =?utf-8?B?NFErN0VOQkUxcXkzRUVwc0FaWWVEK1gxSSt4OVFnZGdyaGpSYVloYjJhcXNq?=
 =?utf-8?B?SmxuVllYay8rTlV6eDBKb0RidmxwZWdyVkVDdyt4K0VEbTdNU0VvNFNLQkVP?=
 =?utf-8?B?MGhvWVZtUnlpNzI4bkZkSWNuS3gxamZ0SjFnb21ocndXSkhraDUwdlNIUVUy?=
 =?utf-8?B?bWdjZ1JjQWdXZWJJbkhrK01LamVTVnVqSndINWlCTWdpVzlORzZQSkZhYlBL?=
 =?utf-8?B?TGJlbklzdERsNkh3UGVscW9qZDB2RVQ0V3h5K3lTVmdCbmFjeUtOc1RXNG02?=
 =?utf-8?B?M1BOOHhLc1NKc3NXV1NiRU9BL2k4UUNXSXcrVFZTSkhTcVJDUWlKM3ZyazQv?=
 =?utf-8?B?bkZ1VG02N1piYlFKalltbURKZnRqZ1pPZllYb1RKRjNiTDNpVGs2Q3cvdW5J?=
 =?utf-8?B?RDhVSHFJR3BWNjBzTS9tTGRxZEJGSUxDZVhhZCtQWU1nSDMyNDFqYUJoMUNt?=
 =?utf-8?B?ZXdIeDcySTU0N2p6Qlpway9iWjZLUG1LODlxbmNwWXhQZklRY2VOZUF2MjV0?=
 =?utf-8?B?bnlYTkt6TzVKb05sVmtMdEs5T1haMGhQVVZJcE1CTjZCMEI5VkJjNy9wb0JC?=
 =?utf-8?B?c3FNMWU5MmlNd2pISE9MVzczYTd2TU1Vem1QZUFFTjRWa21oVWRsTUZDREVP?=
 =?utf-8?B?bmdRMlk2cGo5d2JHd2t4QTJqd1hlNUhzRG5MS2NsZjl5OHh6WTcwQ1VGR001?=
 =?utf-8?B?dDU0VU9Uc2xzTitSUitkSDl2RFUrSmxkcWdwTW40dmEyOWF3Y042TC9GUGVk?=
 =?utf-8?B?SlMrbWc4dUZqRkYwYmtxYXBPZ0QwTDNoaHhLL21DZU8xVlBISjArYTQzU0N4?=
 =?utf-8?B?cllyZTYwUHBxNHNVdmN6QU1aeG9XQm83ajE2V3NyRy9YZUUwT0kwbFh1Ym9w?=
 =?utf-8?B?cTBWVXhiT1dTNUZOWUh3bTdtbU9jd21pYkYxSVNyYTZKWTFzcUloZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a13d407c-e9d0-4163-e5ff-08de6573bb3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 11:34:47.0081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sZ0y7w2u2Bw+soOGpwXLC92RHjnlvc/+6q4GHtPJNh14HJIDOgb3f+zH8GDGHOs9Dy9dYm/62uOr+hjjLAomoNymGrHRTECS4J59HTKpYWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6290
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
	TAGGED_FROM(0.00)[bounces-31491-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[OSQPR06MB7252.apcprd06.prod.outlook.com:mid,aspeedtech.com:email,aspeedtech.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20EB0FD4BE
X-Rspamd-Action: no action

Ck9uIEZyaSwgRmViIDYsIDIwMjYgYXQgODoyNOKAr0FNIEJpbGx5IFRzYWkgPGJpbGx5X3RzYWlA
YXNwZWVkdGVjaC5jb20+IHdyb3RlOgoKPiA+IEkgdW5kZXJzdGFuZCB0aGUgcHJlZmVyZW5jZSBp
cyB0byBrZWVwIHBpbmN0cmwtc2luZ2xlIG1pbmltYWwgYW5kIG1vdmUKPiA+IHRoZSBiaXQtcGVy
LW11eCBoYW5kbGluZyBpbnRvIGEgc2VwYXJhdGUsIG1vcmUgdGFyZ2V0ZWQgZHJpdmVyIGJ1aWx0
IG9uCj4gPiB0b3Agb2YgdGhlIEdFTkVSSUNfUElOTVVYL0dFTkVSSUNfUElOQ09ORiBoZWxwZXJz
LCByYXRoZXIgdGhhbiBleHRlbmRpbmcKPiA+IHBpbmN0cmwtc2luZ2xlIGl0c2VsZi4KPiA+Cj4g
PiBCYXNlZCBvbiB0aGF0LCBJ4oCZbGwgbG9vayBpbnRvIHJlZmFjdG9yaW5nIHRoaXMgaW50byBh
Cj4gPiBwaW5jdHJsLXNpbmdsZS1iaXQgc3R5bGUgZHJpdmVyIHRoYXQgY292ZXJzIGJpdC1wZXIt
bXV4IC8gYml0LXBlci1waW4KPiA+IGxheW91dHMgZ2VuZXJpY2FsbHkgKGluY2x1ZGluZyBBU1Qy
NzAwKSwgd2hpbGUga2VlcGluZyBwaW5jdHJsLXNpbmdsZQo+ID4gZm9jdXNlZCBvbiB0aGUgc2lt
cGxlciByZWdpc3RlciBtb2RlbHMuCj4gPgo+ID4gT25lIGFkZGl0aW9uYWwgcG9pbnQgSeKAmWQg
bGlrZSB0byByYWlzZSBpcyB0aGUgaGFuZGxpbmcgb2YgcHJlLXJlc2VydmVkCj4gPiBNTUlPIHJl
Z2lvbnMuCj4gPgo+ID4gT24gQVNUMjcwMCBzeXN0ZW1zLCB0aGUgU0NVIHJlZ2lzdGVyIHJhbmdl
IGNvbnRhaW5pbmcgdGhlIHBpbmN0cmwKPiA+IHJlZ2lzdGVycyBpcyBjb21tb25seSByZXNlcnZl
ZCBieSBhIHRvcC1sZXZlbCBzeXNjb24gbm9kZSBvciBieSBmaXJtd2FyZS4KPiA+IEluIHRoaXMg
c2V0dXAsIGRldm1fcmVxdWVzdF9tZW1fcmVnaW9uKCkgY2FuIHJldHVybiAtRUJVU1kgZXZlbiB0
aG91Z2ggdGhlCj4gPiByZWdpc3RlcnMgYXJlIHZhbGlkIGFuZCBpbnRlbmRlZCB0byBiZSBzaGFy
ZWQsIHdoaWNoIGN1cnJlbnRseSBjYXVzZXMgdGhlCj4gPiBkcml2ZXIgdG8gZmFpbCBwcm9iaW5n
IGFuZCBsZWF2ZXMgcGlubXV4IHVuY29uZmlndXJlZC4KPiA+Cj4gPiBXaGVuIG1vdmluZyB0byBh
IHNlcGFyYXRlIHRhcmdldGVkIGRyaXZlciwgd291bGQgdGhlIHByZWZlcnJlZCBhcHByb2FjaAo+
ID4gYmUgdG8gdHJlYXQgdGhpcyBjb25kaXRpb24gYXMgYSB3YXJuaW5nIGFuZCBjb250aW51ZSBw
cm9iaW5nLCBvciBpcyB0aGVyZQo+ID4gYW4gYWx0ZXJuYXRpdmUgcGF0dGVybiB5b3XigJlkIHJl
Y29tbWVuZCBmb3IgaGFuZGxpbmcgc2hhcmVkIFNDVS1zdHlsZQo+ID4gcmVnaXN0ZXIgYmxvY2tz
IGluIHBpbmN0cmwgZHJpdmVycz8KCj4gQ2FuJ3QgeW91IGp1c3QgYmFzZSB0aGlzIGVudGlyZSBk
cml2ZXIgb24gc3lzY29uIHdoaWNoIHVzZXMgcmVnbWFwLW1taW8KPiB0byBhYnN0cmFjdCBhbmQg
c29sdmUgdGhpcyBwcm9ibGVtPwoKPiBUaGUgc3lzY29uIGlzIGVudGlyZWx5IGRlc2lnbmVkIGFz
IGEgc2luZ2xldG9uIG93bmluZyBhbGwgcmVnaXN0ZXJzCj4gYW5kIGhhbmRpbmcgdGhlbSBvdXQg
dG8gc3ViZHJpdmVycy4KCkFncmVlZCB0aGF0IHN5c2Nvbi9yZWdtYXAgd291bGQgYmUgaWRlYWwu
IFRoZSBtYWluIGlzc3VlIHdpdGgKcGluY3RybC1zaW5nbGUgaXMgdGhhdCBpdCBpcyBmdW5kYW1l
bnRhbGx5IE1NSU8tYmFzZWQ6IGl0IGFsd2F5cwpyZXF1ZXN0cyBhbmQgaW9yZW1hcHMgdGhlIHJl
Z2lzdGVyIHJhbmdlIGFuZCBwZXJmb3JtcyByYXcgTU1JTyBhY2Nlc3NlcywKd2l0aCBubyByZWdt
YXAgaW50ZWdyYXRpb24uIEFkYXB0aW5nIGl0IHRvIGFjdCBhcyBhIHN5c2NvbiBjb25zdW1lciB3
b3VsZApyZXF1aXJlIGEgbGFyZ2VyIGFyY2hpdGVjdHVyYWwgcmV3b3JrIG9mIHRoZSBkcml2ZXIu
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXNpbmdsZS5jP2g9djYuMTkt
cmM2I24yMzAKClRoYW5rcywKQmlsbHk=

