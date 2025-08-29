Return-Path: <linux-gpio+bounces-25190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3739B3B899
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 12:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4034858186A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 10:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8234430BF5D;
	Fri, 29 Aug 2025 10:18:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E530ACE4;
	Fri, 29 Aug 2025 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462723; cv=fail; b=LQwdk3dQU7KT1mmieOiT9pEP4zXMZ4hsRzol0IDT34Kn8Td0/fNcxGmow4UmKfZ4T1ZKNjNKy5A9M5XHcEdBSU5X1GDyRNIlo6Rik7MkKzX8yix1ZvtjwsUdQEPV4cbq8DLlSxQere1rm5+ukZ0KviJIZDhhG8QBMbZEmo/Tp8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462723; c=relaxed/simple;
	bh=+MYl9vcwFPO9QVduKm8L+5FyTl9tlrusnzQhrGlAUMo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qCL4sl2thUPBFo8HiSeGrwT0EyHS5cHKGSbvtnEHPps9tz7wPjnV5iso20VOmMS4f9KxThT6mKRxFWNqPQbgS52HEeyx0iVpcmn2MfM0iSRbj8gne2Lh6Qhtzk+WJA+bxVDnEsi63ZnotMuc7wmg3P9JbH/zJm82B8tp1KB25C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPdfaWVvnFXa2GJXznIs6lE837yHsZqa+FCMmnJOfqpeS/l9pbgHajk57IffzlKIob5MTO0m+a+2/4PiLBzcjNxKOdKhQQb1TCkLDyfOMvJxIHZX1UD+o0HNb5WlBtjnzw7nkfmaNGPAO+/y59Pf0eQCV+klo/D443tZy5re10iH8CGwIyeivQt2zVcDibNAboef7WxBla7J0WbT/QpDDVN0BJOfLM7Ojf9Y/5nRei1lpUFzK0Kp8QcRzhWC9YHEmJJkJs9fr1sfN7JEfbmQXU2aRppKf94O88w9/cymJGTM6saaRQ4VcDdzjvhAp3Gt+hZ3kB/V3fU2UC2mZpTStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MYl9vcwFPO9QVduKm8L+5FyTl9tlrusnzQhrGlAUMo=;
 b=ORhhP/rEdOt8WwS/wkV24h8yekwnrUdPkxoBIhAq1/4FdUd1Xx+a2hAtafHDzhxxZrkTLlYAB1QWvr/lqeCcGM4s3Ux/atp6iyKcwivFdpovILi+FvtFzGnQEwYqyWuY93g0B3/iyojnVKNtaeSgphnOD+8D835p8xysO74MUzcnQKr5WqRw+r52DSScKe7imhxjcYAE8pQUW6L8PW4ISBgcW6OUIv5Ac94bXBU0fy12yTRwQrE6S0bLobXTjc66I/pwvI7xBxMTQm/1wX9MdaVS93x7RUDu95G9e+t2ZJuCwoSUkc2NiFDeILTMUSBVF4ruqTv7YP835BWBPVwR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by TY2PPF121B89DC8.apcprd06.prod.outlook.com (2603:1096:408::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 10:18:36 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.016; Fri, 29 Aug 2025
 10:18:36 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0ggMS8zXSBw?=
 =?utf-8?B?aW5jdHJsOiBjaXg6IEFkZCBwaW4tY29udHJvbGxlciBzdXBwb3J0IGZvciBz?=
 =?utf-8?Q?ky1?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIIDEvM10gcGluY3RybDog?=
 =?utf-8?Q?cix:_Add_pin-controller_support_for_sky1?=
Thread-Index:
 AQHcFvw6qghsaPXOZ0esSR04j9LnwLR2NgmAgAFjVFCAAAhkgIAAG+4AgACflACAAJmccIAANXOAgAAzrkA=
Date: Fri, 29 Aug 2025 10:18:36 +0000
Message-ID:
 <PUZPR06MB588786D49A7C1964E4A39851EF3AA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com>
 <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
 <PUZPR06MB5887BFF27AAD64ACA625126BEF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <5d8aa064-6dcf-40ce-9e73-feaebca06965@kernel.org>
 <PUZPR06MB5887436E03C17498E80E43C7EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <f54d43ca-87cc-40bb-a56b-e49ee6a0a441@kernel.org>
 <PUZPR06MB58879645FFBD2B7D2B7E9BE4EF3AA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <3e0fb880-ef2a-482d-b008-9afcb46f9fec@kernel.org>
In-Reply-To: <3e0fb880-ef2a-482d-b008-9afcb46f9fec@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|TY2PPF121B89DC8:EE_
x-ms-office365-filtering-correlation-id: c8f86fbd-832a-4914-1d7f-08dde6e56a8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFIxdHZqdk9PQ1VKVmJOY29pZ0J1aXkwdSt3WDI5SnArNHZ0bW1MNlQyQlRF?=
 =?utf-8?B?YXVidWU5RkZVcVVFSmxvNEVmMWFndmY5bE1kTVRlVUgwUU0rMFozeFo1N1Ro?=
 =?utf-8?B?bU1QdWl2OW5OOGNWTzQ1VVdpbkV3KzZsTVBOSytEYW1nOUpvdnBicUttaG44?=
 =?utf-8?B?c2hDUzNiT0tUSHhzcm4zWHVTY0Jtc0xqcDkzalFTMVZaKzVkRHQ2OGRDTmQ2?=
 =?utf-8?B?cTNKVE1OYVY5Zk5mcUczdzI3bzVNaGpubUtjL1lwbytuTy9wQ0t0ZHdnWTN6?=
 =?utf-8?B?ZUVwVDkwdy9ac0NzaVh6V1hMbTliSFhkRXR1Y21DcG5pOFhld3pRWGJRampx?=
 =?utf-8?B?ZVcxRGNUSEF3NFlJWEpBYysyOC9IUnVHQ2RablRkTmpsZFY1aXdMUkp0RE1x?=
 =?utf-8?B?ZmRCSnN0OHYvNkNsanBtUURMNlZSb2czenUySTNsV29TSVpiQ3hjVDczYVA0?=
 =?utf-8?B?U21VL2JzSnBsMGFwTHYybGVHNnd0bXBrR1FNN3ZGc3dsUk5rOEk3YWdXL1Zr?=
 =?utf-8?B?dkUvZktBbGpNUmlVZ3h0c0p0ZURMZ2V4TjNXQkk3SEhQWjFxNWZjZkxWRHhh?=
 =?utf-8?B?MzcyMFBPSVZBZThBYnp6bFBKMDBOLzd5ajloUFpsR25TRTR1T25wT09CRG5u?=
 =?utf-8?B?bHE3VmpaakVsVzEycUk5aGZNeEt4OWxQRXlIdGRHSFRLbkwrVzd2R0k1NFhq?=
 =?utf-8?B?cUxqUWJ6d3ErSlJBRlFkNFFXaklObTRPRlFOTEdVN2VKZDFVZGtlc3Ria2Jy?=
 =?utf-8?B?ekJ2MjZGeGNGRmIxM3hBcWZGdE9mYkp1angzTUViSHNGNnhNcUpNNElLWTdZ?=
 =?utf-8?B?Q0Jyc0Q1RHY0NE1QeCszZnlMMVdtSW5HdFlscDcxWXpnanZsYlFseDdUb0xH?=
 =?utf-8?B?ZDRnVEtIRE4vdzlZU0hwSlJwQWVUZURwbUF0eVdpSWNCeGYzd2xTdmR4a2Zt?=
 =?utf-8?B?dGVYdVIwWVVRZUwwMmRMOWJ0MjBsV3lET0tDR3FzOFltci9ubTBlLzROY0Yv?=
 =?utf-8?B?QUlhOVNnVnQ4R0trcVRkdy83V25mVDduWkNpZU1FbWREWWxzTnZIa3k2dXZT?=
 =?utf-8?B?U1BWQ1hqWCtJUkEweERDeXUreHdhck5xQkkzVFBvWUJCdXdNWXJPdklCbEFk?=
 =?utf-8?B?YnQyT2cwRDJNZ2NHS3dnZysrOUFpcDBBSWZLb0ZHVVBiTEd6SFVFY1o5OTZz?=
 =?utf-8?B?SkYrWjNZbXNIeFA0RmpRZzVZSnpUM2FQOXcwNC83eG05RnRhSTkxaFg5c2lY?=
 =?utf-8?B?RmR0dHJ2eU5samlscEU1MHZ1UGUxQnM0UTFoY2tXa3I0UDR4QnNZT2dRMmd3?=
 =?utf-8?B?Q2ZoOUJCSkw3U2tPQmp0OUZHVzdOK2E2S0hGWEE4N0ZQNmluZXNvNGgzc1dH?=
 =?utf-8?B?SDVuTkRrZ3VHbW4rUkhSbDVPUGhoT2w3ekFjSkVpSmV6ZVRSNGkxclNXM0kz?=
 =?utf-8?B?dXVwWWVSRGJVUWY4UGZxc3dBSm9sdjBpWG40dUtiekhMVHBwZ3N0dW9JZHFK?=
 =?utf-8?B?NVJaNnY0aUpuVTFyTURrTjNzNlFzYjk0aERobFJmWDJZaDBtWGVYQkpPM0dI?=
 =?utf-8?B?WHd4K0pTMHl0SVMvV2lPb0FLNVJ3cDZlWFlUMlBOYWw2eE44dHFNbzhCbkNK?=
 =?utf-8?B?REdPR3krOTNCeDV2MUhoZGFwOG5ZT0dmcXFVd0dHZVVTVGl2NXF1cnV3OENJ?=
 =?utf-8?B?YjlMWWVPQTBheXNhRDM2RDYybWlwN2p2dzBHWkptbUgvTi9jNjJLTWZZS0w2?=
 =?utf-8?B?c2J2VHZReXpueFVURFVmaWt6WEp1TnRNaWpaN0tOMnJBdVgwMVBNMWJwVFBO?=
 =?utf-8?B?ejhWSGtlQ3FleURXNHpBOVFNRjdHWXFvWm1sZEFBSHl4a05uMk8wZjFSQjJD?=
 =?utf-8?B?cExUcjdTTGFxL25FUGQvVDl5OGc1VGl4aDk1bE1HejdkMTJSRk1lVmFMd3cx?=
 =?utf-8?B?ejYzSjV0T2F0SGp0a1BBaSs3Q0xmOTNMOXRoMU94RmdXbFBraUFkNUk3UEJB?=
 =?utf-8?B?eXVFc3hIeURBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ek9yeW5kQmJKNzNtVUIwQzkzeitTOEtGakVnNXoyR2l6RFRINVV0czF6RnI5?=
 =?utf-8?B?dzFxUGgyc0NNTVNuMnY1Z2hLVnlxVndqallXS0hYWStQWnNKVzRUaEczRmN1?=
 =?utf-8?B?M3UzNlA2V1E0TUVwQjNlaVBGdW9qVzhBaTBWbThaS3ZmNktSZjAyY1k4dWl1?=
 =?utf-8?B?R1hYb0lwbTdpbStiVHNBWlI2d2RRNFl1OGtmU3VQdE44aWp6SkY4cGtyKzc1?=
 =?utf-8?B?VitSeVFsL1dGdU81K1gya3FFZExvNGY3SzdmN0xzN0hLRHpuTk9qVlowUTRi?=
 =?utf-8?B?ZlJwMnNnWCtXZ1ZDclZTQUtxazBQYTljUzBNTW54M0w3K2YwTittRG1GVTdZ?=
 =?utf-8?B?RXdteVZsT3RxYVR0WXZiWno1UGxiUWtmSEc2b0dwaWozOHFwWVB4aEwwampY?=
 =?utf-8?B?bFF0STVCSXhoZ3lGd1NBSFZOTjVJVTAvNW5FOEtCRXZZdnFoTlNmdDVYWHBW?=
 =?utf-8?B?b3c2RkdUWXdJV3RSaElvMlppc3hoOHRZUzJiWmlOTGRTWTB4b2w2Y1M0Zm9E?=
 =?utf-8?B?a3pTaW9HMXZJREs3UkNLY0N6L2JlYkZvQkVuMVBvMUQ4NWVzbkV1TFhVYUR6?=
 =?utf-8?B?MjB1dnlpcmpybWRNdzF1YjRhSGsySVZ1Y0hSalNMTGRjUnRGYkx1ZE8rT21z?=
 =?utf-8?B?dlc4dGkrWEtFVmZFNEJQN21lNnVrUmgrRmwzem9vSkw2djVVS0NjQVFYaE01?=
 =?utf-8?B?cVJ6UWtMcUwwNFhFb204UmpqazNTU2E3WFdwaEdveTZIYWR5ZGNRNXo0aGJp?=
 =?utf-8?B?ZVhRUGRtVkxIOHUxa2FQTUtMWUltam42cXY5a20zLzFjdmZwdlVtNXRod3hH?=
 =?utf-8?B?VXVzRVRFS0ZvNFZVN3A4MTAwdmMrUHNWOXhLMUZnaEhXcnNINGwzaGVkYjND?=
 =?utf-8?B?V2lTZmJFdEZ6Mm5vMytpdTcrTmNzQ3JJOGhNUTBjWWZsWmQ5NHA0YkRWcVM5?=
 =?utf-8?B?UEdHaEhYbFF4cnhubStzY213R3VESnFMNHY2N0pZRHRqQVo2MkI0SS9BRW1K?=
 =?utf-8?B?bmdmZ1FwYXVOYkhTRE8wRnIxdEloYkwzZngzNkV5aDl3NW9MaVpIV2JVM081?=
 =?utf-8?B?YzZPQVp4SFRZeXpDb04zTTJyc0tmd2NrbFBGaml4U0FGRlpBcEF0dEJZM2cr?=
 =?utf-8?B?QkkreGZzYi9jUlo0MmdwREx0dUtYYnpWQWVoM0g3MWhON0FIc3VkMlNZOHNx?=
 =?utf-8?B?Yy9yMzFiNE5UK2h2d1pEUE1YK0s2bGt6akxwd3NmZHpta3ZtQUF0RmtpTFVy?=
 =?utf-8?B?ekUzSXQ3RFR4alBXWjBBSURteHdET1E3SWJ0cDJNOHRURW1TQjJ1N2QyNVRE?=
 =?utf-8?B?eis5elhOaWFSYzFKanV0NS9Telk3TFBnRlh2cFpmL0lXaXhyZXlOSzM5Tk9Y?=
 =?utf-8?B?bjd3QkNNUmI4K1cyQ0VRNWFxQUs0S0NidzdVVkJZc2p5VGZvUCtKTHNqWTlI?=
 =?utf-8?B?S3hEUlpoVlpJcFRkd2o2K3R6cndXckVCWVdxSk1sUlFZSUUzdmFFZlhBdHZk?=
 =?utf-8?B?MWRPYXBsVmJGN1NXMklMNXd4SGlhbWd6SnpZd01WRWZJcGdBaDA5enFnckxh?=
 =?utf-8?B?Vmx6bnJjdFU1cjNzNzdNaFBJaDJHV0xMV0dqelBqblB4TVA3NUowZndodFI2?=
 =?utf-8?B?dksxcmhpL25EK0drUjE3dEZESXpzT1JtYm9pSVp5OWxUUCs3VVhDSXB1WXRh?=
 =?utf-8?B?Q0h1V0N2QnJNeE50eWlTYUtOYVloUmtUaEh3NTE0S2ZLUGNFZmxFWkVmamFm?=
 =?utf-8?B?Wmk4ZDVPYllOamdYN1E3WHJZR09JeXN3WDFrYTk1aFJCUVdmMWtCbjQySktT?=
 =?utf-8?B?MlU3aTdXdGQ3ZjdLUGQ0bS95UnFEQzZweFkyZmxGMzd5L1FnK29xQVhHazkz?=
 =?utf-8?B?N3pLTjA2WE9WSXBNSW5lSHpmWGlnY3l5eDUrbUtQR1RsZ2VpdXRVaXZRS1RK?=
 =?utf-8?B?MWxkOG44SmpkbnFGdUJ2S3RUZk5wRk1tbldzaGZLeStsWlRaeFd1clREbUUw?=
 =?utf-8?B?S2E0dW95OG5LSTREcDhQcDgvU1YwV3lNOUpVcWNEUWc1ZWt0VmhFL0NQdTVF?=
 =?utf-8?B?cm5oOWMzK3phS2s4Ukp0bGczL3pZZTdKOHZURlk2NU9rVEg1SmgzbC83Zytq?=
 =?utf-8?Q?dNDbtHcPjxdS+OII37ima2zNk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f86fbd-832a-4914-1d7f-08dde6e56a8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 10:18:36.5619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 291xOvpenybOJCbTNHB9/0SxeQaoZ7prblOPpExOV2P7bywOLTdjzBNuhU/+2tfX/JdPo0r8Lh4fGHMxn+u+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF121B89DC8

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAyOS8wOC8yMDI1IDA2OjMzLCBHYXJ5IFlhbmcgd3Jv
dGU6DQo+ID4gSGkgS3J6eXN6dG9mLA0KPiA+Pg0KPiA+PiBPbiAyOC8wOC8yMDI1IDEwOjMyLCBH
YXJ5IFlhbmcgd3JvdGU6DQo+ID4+PiBIaSBLcnp5c3p0b2YsDQo+ID4+Pg0KPiA+Pj4+DQo+ID4+
Pj4gT24gMjgvMDgvMjAyNSAwODo0NCwgR2FyeSBZYW5nIHdyb3RlOg0KPiA+Pj4+Pj4NCj4gPj4+
Pj4+PiArICAgICBpZiAocmV0KSB7DQo+ID4+Pj4+Pj4gKyAgICAgICAgICAgICBkZXZfZXJyKCZw
ZGV2LT5kZXYsICJmYWlsIHRvIHByb2JlIGR0DQo+ID4+Pj4+Pj4gKyBwcm9wZXJ0aWVzXG4iKTsN
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBZb3UgYXJlIHByaW50aW5nIHNhbWUgZXJyb3IgdHdpY2UuIERy
b3AgdGhpcyBhbmQganVzdCBoYW5kbGUNCj4gPj4+Pj4+IGVycm9yIHByaW50aW5nIGluIHNreTFf
cGluY3RybF9wcm9iZV9kdCgpLg0KPiA+Pj4+Pj4gRXNwZWNpYWxseSB0aGF0IHlvdSBub3cgcHJp
bnQgZXJyb3JzIG9uIEVOT01FTS4NCj4gPj4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IFNvcnJ5LCB0
aGlzIHByaW50IG1lc3NhZ2UgaXMgb25seSBvbmNlLCBub3QgdHdpY2UsIHBsZWFzZSBnaXZlDQo+
ID4+Pj4+IG1vcmUgaW5mb3JtYXRpb24NCj4gPj4+Pg0KPiA+Pj4+IFRyaWdnZXIgdGhlIGVycm9y
IGFuZCBjaGVjayBob3cgbWFueSBlcnJvciBtZXNzYWdlcyB5b3Ugc2VlLiBJIHNlZSB0d28uDQo+
ID4+Pj4gWW91IHNob3VsZCBrbm93IHlvdXIgY29kZSBiZXR0ZXIgdGhhbiBtZS4uLg0KPiA+Pj4+
DQo+ID4+Pg0KPiA+Pj4gVGhlcmUgYXJlIHR3byBwaW4tY29udHJvbGxlciBvbiBza3kxLiBUaGV5
IHNoYXJlIHRoZSBzYW1lIGRyaXZlci4NCj4gPj4+IFRoZSBwcm9iZQ0KPiA+PiBpcyBjYWxsZWQg
dHdpY2UuDQo+ID4+Pg0KPiA+Pj4gU28gd2Ugc2VlIHRoZSBwcmludCBtZXNzYWdlIHR3aWNlLg0K
PiA+Pg0KPiA+Pg0KPiA+PiBObywgeW91IGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIGhvdyB0aGlz
IHdvcmtzLiBUZXN0IHlvdXIgY29kZSBhbmQNCj4gPj4gaXRzIGVycm9yIHBhdGhzIGFuZCB5b3Ug
d2lsbCBzZWUgRk9SIE9ORSBCSU5EIG1vcmUgdGhhbiBvbmUgZXJyb3INCj4gbWVzc2FnZS4NCj4g
Pj4gUGx1cyBteSBzZWNvbmQgY29tbWVudCB3aGljaCB5b3UgY29tcGxldGVseSBpZ25vcmVkLg0K
PiA+Pg0KPiA+PiBJIGFtIHNvcnJ5LCBidXQgdGhpcyBpcyBiYXNpYyBDLg0KPiA+Pg0KPiA+DQo+
ID4gSW4gb3JkZXIgdG8gdHJpZ2dlciBhIGVycm9yLCB3ZSBhZGQgYSBzZW50ZW5jZSBpbiBza3kx
X3BpbmN0cmxfcHJvYmVfZHQoKSBhcw0KPiBmb2xsb3c6DQo+ID4NCj4gPiBzdGF0aWMgaW50IHNr
eTFfcGluY3RybF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBza3kxX3BpbmN0cmwgKnNwY3Rs
KSB7DQo+ID4NCj4gPiArICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gICAgICAgICAgIC4u
Li4uLi4NCj4gPiB9DQo+ID4NCj4gPiBkbWVzZyBzaG93cyBhcyBmb2xsb3dpbmc6DQo+ID4NCj4g
PiBbICAgIDAuODEyNzgwXSAvc29jQDAvcGluY3RybEA0MTcwMDAwOiBGaXhlZCBkZXBlbmRlbmN5
IGN5Y2xlKHMpIHdpdGgNCj4gL3NvY0AwL3BpbmN0cmxANDE3MDAwMC9ob2ctcGlucw0KPiA+IFsg
ICAgMC44MjE5MjBdIHNreTEtcGluY3RybCA0MTcwMDAwLnBpbmN0cmw6IGZhaWwgdG8gcHJvYmUg
ZHQgcHJvcGVydGllcw0KPiA+IFsgICAgMC44Mjg1MDNdIC9zb2NAMC9waW5jdHJsQDE2MDA3MDAw
OiBGaXhlZCBkZXBlbmRlbmN5IGN5Y2xlKHMpIHdpdGgNCj4gL3NvY0AwL3BpbmN0cmxAMTYwMDcw
MDAvaG9nLXM1LXBpbnMNCj4gPiBbICAgIDAuODM4MDU4XSBza3kxLXBpbmN0cmwgMTYwMDcwMDAu
cGluY3RybDogZmFpbCB0byBwcm9iZSBkdCBwcm9wZXJ0aWVzDQo+ID4NCj4gPiBJIGRvbid0IHNl
ZSB0aGUgZXJyb3IgbWVzc2FnZSB0d2ljZSBwZXIgb25lLiBUaGVyZSBhcmUgdHdvIHBpbi1jb250
cm9sbGVyLg0KPiBPbmUgaXMgL3NvY0AwL3BpbmN0cmxANDE3MDAwMC4gT3RoZXIgaXMgL3NvY0Aw
L3BpbmN0cmxAMTYwMDcwMDAuDQo+IA0KPiBBbmQgdGhlIG5leHQgZXJyb3IgY2FzZSBmcm9tIHNr
eTFfcGluY3RybF9wcm9iZV9kdD8gLi4uIGFuZCB0aGVuIHRoZSBuZXh0IG9uZT8NCj4gQW5kIGFu
b3RoZXIgb25lPw0KPiANCj4gUmVhbGx5LCBlaXRoZXIgeW91IGRpZG4ndCByZWFkIHlvdXIgb3du
IGNvZGUgb3IgeW91IGp1c3QgcHVzaCB0aGUgc2FtZSBwb29yDQo+IGNvZGUsIHJlZ2FyZGxlc3Mg
b2YgcmV2aWV3LCBiZWNhdXNlIHlvdSB3YW50IGl0IHRvIGdldCBtZXJnZWQ/DQo+IA0KPiBUaGlz
IHdpbGwgbGVhZCB5b3Ugbm93aGVyZS4NCj4gDQo+IFlvdSBoYXZlOg0KPiANCj4gK3N0YXRpYyBp
bnQgc2t5MV9waW5jdHJsX3Byb2JlX2R0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNreTFfcGluY3RybCAqc3Bj
dGwpDQo+IC4uLg0KPiArICAgICAgICAgICAgICAgaWYgKCFmdW5jdGlvbikNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+IC4uLg0KPiArICAgICAgIGlmIChyZXQp
IHsNCj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImZhaWwgdG8gcHJvYmUg
ZHQgcHJvcGVydGllc1xuIik7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiArICAg
ICAgIH0NCj4gDQo+IFRoYXQncyBhIGNsZWFyIE5BSy4NCj4gDQo+IFRoZW4geW91IGhhdmU6DQo+
IA0KPiArICAgICAgICAgICAgICAgaWYgKG5mdW5jcyA9PSAwKSB7DQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIm5vIGZ1bmN0aW9ucyBkZWZpbmVkXG4iKTsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IC4uLg0KPiArICAg
ICAgIGlmIChyZXQpIHsNCj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImZh
aWwgdG8gcHJvYmUgZHQgcHJvcGVydGllc1xuIik7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiArICAgICAgIH0NCj4gDQo+IHRoYXQncyB1c2VsZXNzIGR1cGxpY2F0ZWQgbWVzc2Fn
ZS4gVFdJQ0UuDQo+IA0KPiBZb3UgY291bGQgZWFzaWx5IHNwb3QgaXQgeW91cnNlbGYgaW5zdGVh
ZCBvZiBrZWVwIGJ1Z2dpbmcgdGhlIHJldmlld2VyIGZvciBzdWNoDQo+IHRyaXZpYWwgc3R1ZmYu
DQo+IA0KPiBOQUssIHBsZWFzZSByZW1lbWJlciB0byBuZXZlciB3YXN0ZSByZXZpZXdlcnMgdGlt
ZS4NCj4gDQo+ID4NCj4gPiBTbyB5b3Ugc2VlIHRoZSB0d2ljZSwgb25jZSBwZXIgb25lIHBpbi1j
b250cm9sbGVyLiBCVFcgYXMgeW91IHN1Z2dlc3RlZA0KPiBiZWZvcmUsIHdlIHdpbGwgcHJpbnQg
dGhlIHZhbHVlIG9mIHJldCBpbiB0aGUgZXJyb3IgbWVzc2FnZS4NCj4gPg0KPiA+IElmIEkgbWlz
cyBhbnkgaW5mb3JtYXRpb24sIHBsZWFzZSBraW5kbHkgcmVtaW5kIG1lLiBUaGFua3MNCj4gDQo+
IFlvdSBzdGlsbCBpZ25vcmVkIG15IHNlY29uZCBjb21tZW50Lg0KPiANCg0KRmlyc3QgeW91IHdy
b3RlICIgWW91IGFyZSBwcmludGluZyBzYW1lIGVycm9yIHR3aWNlICIsIHBsZWFzZSBwYXkgYXR0
ZW50aW9uIHRvIHRoZSAic2FtZSBlcnJvciIgc3RyaW5ncywgaXQgbWFrZXMgbWUgY29uZnVzZSwg
SSBtaXN1bmRlcnN0YW5kIHlvdXIgdGhpbmtpbmcgDQp1bnRpbCB5b3UgdG9vayB0aGUgZXhhbXBs
ZSBhYm92ZS4gU28gdGhlIGRpc2N1c3Npb24gaXMgbmVlZGVkLCBub3Qgd2FzdGUgb3VyIHRpbWUu
DQoNClNlY29uZCB0aGUgcmV0dXJuIHZhbHVlIG9mIHNreTFfcGluY3RybF9wcm9iZV9kdCgpIGlz
IG5vdCBvbmx5IEVOT01FTSwgaXQgY2FuIGFsc28gcmV0dXJuIEVOT0RFViBhbmQgRUlOVkFMLiBB
bHRob3VnaCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBidWcsIHRha2Ugb3VyIA0KdGltZSBjb25z
aWRlciwgSSB3aWxsIGRlbGV0ZSB0aGUgcHJpbnQgc2VudGVuY2UgaW4gc2t5MV9waW5jdHJsX3By
b2JlX2R0KCkuIEl0IG1ha2VzIHRoZSBlcnJvciBtZXNzYWdlIG9ubHkgb25jZS4NCg0KVGhpcmQg
QWx0aG91Z2ggdGhlIGF1dGhvciBpcyBub3QgbWUsIEkgcmVhbGx5IHJlYWQgYWxsIGRyaXZlciBj
b2RlcyBiZWZvcmUgdGFrZSBteSBjb3VyYWdlIHRvIHN1Ym1pdCB0aGlzIHBhdGNoLiBNYXliZSB0
aGUgY29kZXMgY29tZXMgZnJvbSBvbGQgZXhhbXBsZSwgDQp3ZSBjYW4gdXBkYXRlIHRoZXNlIGNv
ZGVzIHRvIHN1cHBvcnQgdGhlIG5ld2VzdCBzdGFuZGFyZC4NCg0KRm91cnRoIEkgd29yayBhcyBh
biBrZXJuZWwgZW5naW5lZXIgbWFueSB5ZWFycy4gQnV0IEkgZmlyc3QgcHVzaCBwYXRjaGVzIHRv
IExpbnV4IGtlcm5lbC4gSWYgSSBtYWtlIHNvbWUgc3R1cGlkIG1pc3Rha2UsIHBsZWFzZSBraW5k
bHkgcmVtaW5kIG1lLiBNYXliZSB5b3VyIGtpbmQgbWFrZSBtZSANCm1vcmUgY291cmFnZSBvbiBk
b2luZyB0aGlzIHZhbHVhYmxlIHdvcmsuIA0KDQpJZiBtaXNzIGFueSBpbmZvcm1hdGlvbiwgcGxl
YXNlIGxldCBtZSBrbm93LiBUaGFua3MgZm9yIHlvdXIgdW5kZXJzdGFuZGluZy4NCg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KQmVzdCB3aXNoZXMNCkdhcnkNCg0K

