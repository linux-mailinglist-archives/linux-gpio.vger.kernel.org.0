Return-Path: <linux-gpio+bounces-25038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27044B393AE
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 08:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE021B2212F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 06:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946D1278154;
	Thu, 28 Aug 2025 06:14:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022075.outbound.protection.outlook.com [40.107.75.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F96270EC5;
	Thu, 28 Aug 2025 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756361651; cv=fail; b=E1CaPX/6J5Mv6bSyycNYvNy607RK9Xbzbe0okC9IV3HhHW9MThxMvQRTTkMumYV+XXVKaeL5a+YZ51PPtBh7ZAT6kxXHkuSS9McZEpXpgueQwZE5Tu2IgwhjJEIUztlsbKRXauAsIbH1c8Xgvd0bIZSFCdyqDaIbLnRUi5Ei3EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756361651; c=relaxed/simple;
	bh=HwVy+jJ5H6S52f9lFddT0UidD5JYyLdhKrlzlTUi6lg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FA4CeuK9D+tC3SJYZdPsktpFRHrOHof5l+Vx5s6ry8roePtFWLtOYK/x2bf646na+dQL/I+2g9xpTMcmxH9LbNyewLv+CJ+XXXZpT0KblElt65TzRXO8tcrJHTMPPxSpkaizu23bnCEAlsd0mYPglmXTkKz7lRqo+TcwgOftVOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhuZx64BU3zT5ybN/jYmmMG/7BCZ0du9IARED6EAL8qJwuNzcx0ZKJelfsbgwaCcMoRw4RJkzrw5xSCVOTHPd9Un3OnJn4qA6vp6YBO13rz4OrUp6/6fsyYqjzKU/pnBKYA0kmcRbzpsdVUe9viWHde+uU49ilzi4gsqbzIuHdQgGr567OfU2GB7OotwwbQ2r1Dta2g07W6+u447VoGNBnU7EHGKVX8SOk40Rb92hWId3PBpkmWpZbGLEOQN11QBRU8NOt6P0gJa5PJhDGPnTWwE2BqdEwlKSOXJ6I/HLNOFHct+nF8JThvERvyLxyXUlg9uizwmu/Ah6pYpR15kiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwVy+jJ5H6S52f9lFddT0UidD5JYyLdhKrlzlTUi6lg=;
 b=sgzUMzBTIxpcDpp1HuCDFDfz9AfsXerOsu5BO+lG7kSFUTKvoDpd2zSrckpEXgtxzqQxUCvfZQaVCNrj0ydbxEawtI/oqf+ODge23k60BNZ1+zGq/aJY2aw6WquBq4rx/l4bTu+IDAuGTf6PzDxmKDtqwKuNABfjtOOLWq7hWd9VVTAn+pX5nC1UbYV/qZP6YRrNnOUuJwB/jBz6giZZ+COcBs9MLQ7w0nhXUUOVj37qUpiaYpoLJi23psTEw8CKj3ipSgim01L6DY++BR/3QTU33eVOs5Dta1pKbI9975A/fR+Zx72AOFYvvuhp4ZiXIKgMYGf5JD7SC28bixzglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEZPR06MB5168.apcprd06.prod.outlook.com (2603:1096:101:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.17; Thu, 28 Aug
 2025 06:14:06 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 06:14:06 +0000
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
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMy8zXSBhcm02NDogZHRzOiBjaXg6IEFkZCBwaW5j?=
 =?utf-8?Q?trl_nodes_for_sky1?=
Thread-Topic: [PATCH 3/3] arm64: dts: cix: Add pinctrl nodes for sky1
Thread-Index: AQHcFvw5eys67g/tn0eHEJxlmjP5NbR2KbqAgAFoOGA=
Date: Thu, 28 Aug 2025 06:14:06 +0000
Message-ID:
 <PUZPR06MB5887E5164D22D5E42D1442F9EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-4-gary.yang@cixtech.com>
 <05c468dd-526d-4367-8e24-98647d5232fd@kernel.org>
In-Reply-To: <05c468dd-526d-4367-8e24-98647d5232fd@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEZPR06MB5168:EE_
x-ms-office365-filtering-correlation-id: d854d7f4-b1e2-47a2-bf5c-08dde5fa17fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NlFqK2tTcjRxUWpoN3BUVjNvMnR3UXMzWUVBTXJITVRvbjZQaHd6ZS8yMkxu?=
 =?utf-8?B?RzlZekZUTkU4R1N0Z01CNklBdXdCV0lERVp3clRHUFR3djVwcktsRDVkVmdk?=
 =?utf-8?B?VGJoNnRjRXhGVkltQzRlbHZZZ3RPTFh0Y2NQMGh2SFVTaGMwZnR1cktEWGNr?=
 =?utf-8?B?QVRONUhaS1ZMalZjZ2RUNDk0K0FCdlB5UXoyRDNjdzBRdkhZV3M0aEZMSk1v?=
 =?utf-8?B?RHZwQVJBWmlXZlBDZnJoSEZ1d3NWNkZkalhlK0o1MG5NVlZSWkdjT3JncDRR?=
 =?utf-8?B?dVVaMUNNUlBiRk9Sc3MyUFJYRGhCbitSbllsTEFJNWJSTk1QNGRSVnEyYVhy?=
 =?utf-8?B?eVUvN3hmUTVXVWR4WGdFaGpFa1FGbnJpTkJHeUQwSEVzZU9SOWFiTWs3TVNw?=
 =?utf-8?B?a3JIOWM5MytMd2IwbHdOK2tjNEliQUtQWWljRkdITStZZCt1ekRyakxITVIz?=
 =?utf-8?B?TjdzZzlEanB4Y2crQ2NJMFp4MGNGUXdTUmppM3hDOW9XNXFVNmNHd0Z2ZHpl?=
 =?utf-8?B?T1NmNVduQnp0Szg3U0tYWjhDS2xrS0Z3cWpCbjhVOTZSQ0ZxVkhpNXFEdFF3?=
 =?utf-8?B?UGZjL1B3UDVDZlJUeitEM2FQbHJRK1VjOEN4NHVBRVBkS0dqS2lkUE43WldN?=
 =?utf-8?B?Z3NpaElwdHpyUVlVQkFwYnZwSm1mT3ZtNFo0ZEk5NmdpV0JtK3hCclFUcWtD?=
 =?utf-8?B?eVEyS09QQWFrdy82YnY5dHF6cUlRUnJlbEdlWUQ2L0tpRjhWNXliN2lnRGJI?=
 =?utf-8?B?a2ZyMUtnUERudkhDdi93M2JZQTR0Y2doL2ZQbG55ajltYlI0Z09LMFYwMmhD?=
 =?utf-8?B?ZWJFYlplLzlabWVZNHJxckRuN0Y1SEtWUjdZMTJ0QnJBQnpIN1lDWlRlQkxE?=
 =?utf-8?B?U0FWZHI0a1VZVnppZ2hqcDlKRGlIeDBybG9mNHVNWTdHekNVbFl4NERPWEFi?=
 =?utf-8?B?NFRjb2tYbi8wTEFiM3N0V3NWQ2RwTEVKVVJiN0NrUUFibGZrTDRROVQ2S2Rz?=
 =?utf-8?B?cWpnLzdkeE5ZaHlobEw5dE5UY3ZEbEtnQ1ZIUi8zZGFKaHNyMGNuR1Nkd3Uv?=
 =?utf-8?B?LzZBRzVYSzZuQ3B2NzROTFowZitkQWZwZWFPeHBIaG5VL2QyZThXQUZTeEtT?=
 =?utf-8?B?YVgyZ05CYU41ZjR0RlRkRG1HQ2szOGZFRGtuYlV4QlNiaUFNa1VISXJTRm4x?=
 =?utf-8?B?U0dqRDVETmJza0VIbUR1Rzl0VjJVcllucFdXYTg0c1R4eDZHV1hka3h6Si9I?=
 =?utf-8?B?REtJZTJHejRWVEUzTWNXNHArYVZsVFBBd1B0WWJxdTIxYlJaMTdIazZzQTFF?=
 =?utf-8?B?ZEdqL1pQbWNTYzBZaUl0OVMzTWpHSmwyd1pId1hFZGhPSTJBUGk1cENDQzlZ?=
 =?utf-8?B?UEJ2dGlHVTM0cmNZVlFMOXAyYVE5ZGpoNHp0WGFpOUJLTmxkUFlkWkg3SHhM?=
 =?utf-8?B?ZlFNWDhFbXpiSTZ2SzM3Y0NiOWEzaWdPaUpSY2t0aFZ6NDFYNmhxU1dLOWZ6?=
 =?utf-8?B?VFpjZ0Zpc3FHR016SzkwM0xjSnlFOUFKT1MrZUpDcW1GWldRRkhkYWVxOVk0?=
 =?utf-8?B?TnFsaEtLeUttbnNPVkZyRXc5UFRpZDBmMVRvVkVweVBFOWp0OUJnekt5WDdL?=
 =?utf-8?B?NzlQWE1XV1pHSllnWlBnUjZ2Ulh5OEY3TDFRcG1IVVhjdlA4NlZEZDlteUhj?=
 =?utf-8?B?SjljRG5vbkVic0NUOU5uaUZWTCtZMWRpTzBmNngxUG5qZXhjc1ZoZmk2NUI1?=
 =?utf-8?B?cmF3bmFkVVdUVCtrNEMveEo3eEpleGhIay9JeWNSd0g5ZGlrelJDLy96OU8r?=
 =?utf-8?B?U2xLTE4zUGFmWEk5VDJMNEswSS9vcXZtMlJReGhKOU5NVTlkZmNkcXNQSkRZ?=
 =?utf-8?B?QVNBcExxcUR3SnJZTWtTeStWdE85bFZwRFc3a3FPdlhYTHRIMTA0b0dpN1NN?=
 =?utf-8?B?SWs4V2l1SWs1RXp2aE9GUnQybllPVkpveDFjajFiY2lndkpWaXNGZlRhWU83?=
 =?utf-8?B?RGZZb0ZZeE9BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGpxM2Y4TkNNSGlYay9Dbkdld2Z4aWJwQ1J5SnhRcmFlSEp4VnAvZzgybExW?=
 =?utf-8?B?Sm1Tb1NjWklKM1NvelNNSEFMWENYd1BXWHB4N1dMSGhnLzVwQjkwNmxpVUNx?=
 =?utf-8?B?RDVjMFFudnBLZ1pPSlRRdWFndTJoTXlsS3BOSUp1M3grR3BGZ3NSSjh3RDQ1?=
 =?utf-8?B?WUcwVlA4azR4Yjc2cDl6eTF1dUg2akFsR013K29hbXJ3RUdENHh4Q2luQzVp?=
 =?utf-8?B?bWpFeS9hWmVQcHNwK3pyVGdEWEVDT2JtUy8wdXVwTnRlcU1UbTZvZUJBVGZu?=
 =?utf-8?B?MTR2enFJRFJ5TWhFU2tNd2NtODcrSnI2WjY5WmVEdlFjb2NYY1JSZE5BdjZM?=
 =?utf-8?B?WlVydjY4SUJQQmYvenhWSWw3andPM3Fsb3VQY21WbTN6NjM4M1hZckJyMkds?=
 =?utf-8?B?TTNyL0lxK2lNalA2aFJBOUJvS283clMzYTJKdDZ2UDRwSkp4c0YvY0hDTnZR?=
 =?utf-8?B?SEs2TWppVmtSR3JHc001VWJZbXVZc0RQTVNZTHZOSG5lSEQ4V25zbHRIL2ZS?=
 =?utf-8?B?VnRXNU9WQ2RsNlFnWDU1VXAvOUdTOUR1dXdEUkc0Ukg3dzZxRGMya0lQWnhT?=
 =?utf-8?B?ZnIxS1FOcHlUS2d5Nm9vanR2bFZxakFOUkwvTVNwNkZBN05YTHBjejV0OHFF?=
 =?utf-8?B?LzJGU1pxczBEODZpdC9xdkc4MGc5dGRnRDNFRVNQcTRmSWlrcThWQkNBNGM3?=
 =?utf-8?B?UUwra05KU1EyUzFGZS9RTmtZWi9vc2JUdFZJMnFlRURxRzVPZGZKc0hjSDgx?=
 =?utf-8?B?dXRCdEt1VmNYS2NoYkcvRkoyOGFHL2svamVoVkkwQytwa2dnVFpoak1yWitI?=
 =?utf-8?B?bktMeUZqTkFGYkpjTzMrL3M0NGlrbFJDRVdEWjBETmkzQVp2M3E1UDQ2M2Zn?=
 =?utf-8?B?OHZmaHE3dm9idDEwWVdEcjFyWE9scFlBTGg4T2pUcGg1andYYjJaeVZVWUhn?=
 =?utf-8?B?M0RZQlVacFdJRmc3L0pDMlBEeHpVRVVmZ3YvVXhMcHo1Njl0bzVkTzkzWU8v?=
 =?utf-8?B?eW1IN3ZkdU4zU0ZvbDA3YlRoMFRFTXEzY0hBUWsrL1BxSlV6MVpKUG5TV0tW?=
 =?utf-8?B?UFBzRFljMFBGSGVZczdNZndwM1Nha2o1eDRZeTFuaktPUWZOUjNUdkZPdWI3?=
 =?utf-8?B?M2VQNFFqSytVaGJTMm5xUWhoMjR5VnJkaWcyVXNQNkhOS0w1dW9xZWVvL1RI?=
 =?utf-8?B?alhiYmwrRkJZWmozRzY3VmZlZmlIWXdmVkM1alB6MVRMQkM1VEpHU05qQXZO?=
 =?utf-8?B?ZHBMSEVGT1Z0YXQ0Z1VmemdBZFZ1ckg5UytwcFJXMFFaRXBEdkVRenpmRzVB?=
 =?utf-8?B?RWg5ZG43ZGNhNFVPVC9DVHZiY3hQWGV5WDV4dWh0YmtKdXE1b1lCTzVLODNn?=
 =?utf-8?B?RTIvUCtwUzRvWC9nUndHazlGSG1xTFlRbEtzQVo2VStJNXVJN1ZRTk4zQjB6?=
 =?utf-8?B?UVlUUytpZkMzK1BmcldoVlRObVZjdEJFTkJBQWZSOUNzYzFxSXMrVGlhUGlR?=
 =?utf-8?B?c1JmYjR6OGRndmJLRDFoV3lDM1JXYmIyaHd1VGlyc1I5SGJsOHdtRzRMMUYr?=
 =?utf-8?B?U0Roc2dkUEtJL2ErUWVXSjhvdE95WVYwWmcvM1ZlUmhBTzFtbW95VVhuTi9k?=
 =?utf-8?B?TmdKclRTOXRvcTlPRk1sWFBDMmxidk1FM0hhY3pMQVdzdDlHVS90bmNQTDNE?=
 =?utf-8?B?a0ZmVmJXQm5xU3pCR1gyZ0hYYlFtazV5VlpURUdrbHBjdDVQUld3eU9GWUc4?=
 =?utf-8?B?dGJZS3R6YWpPQ2MyQjFSMzU2cXFRVU92OEVabU9va0M5TkpZa2JhL1N3bHZ6?=
 =?utf-8?B?N0s4SFFVdklrQlZ1TzA0QnJZU3J2K2hJQzJTSnIzRWRPelNBcnFObnlzNUhr?=
 =?utf-8?B?QjZ2MzVma2w5UnFXbXp6by8zMTdGQ0JzdWpxOW1wWlI2ZVR4RHhpYWZmUG1j?=
 =?utf-8?B?ek5oRGV4VEZPdFBGN016clFJekdEUHRyMGtNbURYeC9qa2V2RE5Xb0Y1VHNM?=
 =?utf-8?B?K1Q1Z3BrbmpUamdYQmI4STlRZzE4QUxsMDlsVEU3T1VvQVpuQ0RJcE1qY0Yv?=
 =?utf-8?B?UVhHQ2pSUVVFaXAwRldTNnRVRVRGZkhTU0dYWkYwQ3RPR2NDZ2lmaUxoNVhG?=
 =?utf-8?Q?8V0pszT1PEAbbQDKJqgVFFCfa?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d854d7f4-b1e2-47a2-bf5c-08dde5fa17fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 06:14:06.2867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k2DzavIJHg3Ty28LeW+6oiEroy9nuTA8O1HdK0MazWlw3JJA8CDCa7M14w8pN1n/Mn1kDJ0PCyoaUI8Tlw2Gtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5168

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIDI3LzA4LzIwMjUgMDQ6NDIsIEdhcnkgWWFuZyB3cm90ZToN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiAgICAgICAgICAgICAgIH07DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAgaW9tdXhjOiBwaW5jdHJsQDQxNzAwMDAgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNpeCxza3kxLWlvbXV4YyI7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgwNDE3MDAwMCAweDAgMHgxMDAwPjsNCj4g
PiArICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgaW9tdXhjX3M1OiBw
aW5jdHJsQDE2MDA3MDAwIHsNCj4gDQo+IEFyZSB5b3Ugc3VyZSB5b3UgZm9sbG93IERUUyBjb2Rp
bmcgc3R5bGUgZm9yIG9yZGVyaW5nIG9mIG5vZGVzPyBMb29rcyBsaWtlIHlvdQ0KPiBqdXN0IGtl
ZXAgYWRkaW5nIHRoaW5ncyB0byB0aGUgZW5kLi4uDQoNClNvcnJ5LCBJIHNlZSwgd2Ugd2lsbCBj
b3JyZWN0IGl0IG5leHQgdmVyc2lvbi4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzDQoNCj4gDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiY2l4LHNreTEtaW9tdXhjLXM1
IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDE2MDA3MDAwIDB4MCAw
eDEwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgfTsNCj4gPiAgICAgICB9Ow0KPiA+DQo+ID4gICAg
ICAgdGltZXIgew0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkJlc3Qg
d2lzaGVzDQpHYXJ5DQoNCg==

