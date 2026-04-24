Return-Path: <linux-gpio+bounces-35446-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCvFIofJ6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35446-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:38:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C32458CBB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2125F3003347
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98A527A133;
	Fri, 24 Apr 2026 01:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MHkqraXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9926A0B9;
	Fri, 24 Apr 2026 01:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994686; cv=fail; b=DuXgGWrkKtrSmh5/VgkRQOn7/C5+8DK9dU9ggb8JEwGJYPepR5WwtidF1l2RAROm0OiZJ/y2QqiD6wK10kfLgfJufjfapGUjUXK7njpFB4E7OW5GT1URVc+2Q3ErZ0MDHvSSYW/tforEI3ZVuy6dvfaWktk1HR8liifoJNZS3sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994686; c=relaxed/simple;
	bh=xGXna7TSX4utzRX4Z6JlXWEhjH5Mim2RuN/1yeegJLg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hjEjkUJP8sM8pqxIsWOzqAZywdASmFkzAyikJMR+6aP5FKNZos8PA6qGdsI+4vw+iptA2hxxozh6qxYJK0IYnSroIdw9HFvv885ykNtCqyrvQ334E+0c8Il1I6cJy40ozaoa9qI4uQwQucL8JDC0vTzFql31gw3O1FBlT0DHGhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MHkqraXj; arc=fail smtp.client-ip=52.101.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1FCzIEdm/kkR0ZVZkppe2lY9qIBshiqzOcQRFYFvObgs2cv+5zGPG91g4FUgxfUNEUgPPcKO2goRpvk6e52xoQ0oRq+KQSey/Qo2yTcooD0xL7VLXv13HDWlwRUbsNdTXBBKmI7p7vChuLs8D4zNKn5phOaos4sCoMozb1HdDXIgd8ZxpvL0uD53xVDx0VUCUgkW1YWElHbjUWEmOeKNG7K5Ug4mEQk9dfHwOdmdfsHboO+iD0SxxBymN8g1ZHz3s8Ar2fZP0SeXt5jNaoMMcfFiAu5V9vYt8HhbjLlMKqK2+jQkwD03F3yubtHPSjZi6adprskt77miLF8YDyY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGXna7TSX4utzRX4Z6JlXWEhjH5Mim2RuN/1yeegJLg=;
 b=Si/WHVq21IpMxUksO9G2eTXrbb4B1qoHCwBf28R2CAgq3DjFEsr2TRMVCYG7uOHL99SUr3qUVGwsfHTxooM1V46kBxRhF78b0mVRe9eSJMxWI4etKgoWfW6+us9I1f2RKIFvpVexdJVEqs6PDLWb9uf3Y0zmZIRrj6rZUYhH65oMt2Fp/ddQKkt357jZtUcV1HhlwjmUYg/iXpqDsdPTITnQacfbZNxxcrBDTtT38nR9Jx0w285HGBfxouy8HPBkpJE/wPqCnYswGzk7AjDGalDpbfxJVkKn28Clca09RG6eTkHQUAKvYyux7eWNixU7BhodLKJLmw7gmEkyesi7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGXna7TSX4utzRX4Z6JlXWEhjH5Mim2RuN/1yeegJLg=;
 b=MHkqraXj2eRmn8j0ZZRbhI+ZKOISQAqiUgStZ2kO45O+FALY503KUK68httXHIeK4ldAdT+FxtEPXY8SimVVQjmixcRq9FznXEU7fAjTWrR8mO46TzwpSs8liKMEDxbbPMUJqLNfNjRd9+VvhAUngSAOB8u7DMAU4oWkuErQ1BkHfw+US5v6Lx2Y07EMAQyq9yGKq6ZNHqXHQ1WSK6gNbJktMfer0IMMRe5CzJRKabHaCT+I+Cc/Rkw6/GAEdikfbfw9acpJegianFS1NeNUht0alNWN0gq20kEwsLRNKNKcL4hSY+6Hjq1KWyOUSgSEV/+rg5DGpTF6D7ic2o4BnA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:37:58 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:37:57 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH upstream review v6 0/4] media: i2c: ds90ub953: Add back
 channel GPIO support
Thread-Topic: [PATCH upstream review v6 0/4] media: i2c: ds90ub953: Add back
 channel GPIO support
Thread-Index: AQHc04owaMaAlDJNfE+rm0kNN4dBxLXtbt1w
Date: Fri, 24 Apr 2026 01:37:57 +0000
Message-ID:
 <AS8PR04MB9080DBA5F39C2E8AC93AA162FA2B2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260424-ds90ub953-v6-0-a63cf480f8b0@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-0-a63cf480f8b0@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VE1PR04MB7455:EE_
x-ms-office365-filtering-correlation-id: 16c1af83-925d-44ee-a322-08dea1a21d16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|56012099003|22082099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 U18kFsdTwN0hMd04YDl9U8yznztCVJHqKtpBk8UXiEhhMbhF1dhm8cAGOfXk1ZI0CmJol+jVvs4zS7vmixJbJNCEkmabL/1jmbSOtFZm5iQl+1XPAtZW1BdNcw7Rh1FymQv5yW1CzBa2Ui0r9HkvotbEtKxxsFMEdje6KvE7KLSRButqgIO29pGY6iABDrnlYoZHG+nV4vL8DOZG1WKQLVdbIKDiEyvTibo/O2N+Ydn6JgRcmasE8b55L1DlDyFoDNFjm2AEXPmDMXUHxDnfuY2al1B88SNx6EbNgRf0ikrNdXuZaD7OVjAr6T7WAR3sRjYShhqk0h6857C05oP6ORsIMBuJi3RTWhnY4NVhR0TIihtsE2kvHTMlO+SMSepSbmpNz3+lx/tZeUxW12a6sk1zV/J87GrK/uE6Uqp+0xhjAxRb8p5a/Dav6cBwAkjaWybdKq3xvrBjDre0nGW8NCm6rbgw4S0GPJgEPofLqmJJfApF44HdnV1FIbYLbHv+tFFuNrits0eA145+ZgX7/qglYyP5sdth/r0t6PbhS1phadBVlBgpK2YPiECzjZAHlThFkIq8LJLIIXDxM3hcf037cX0kozDyI/MPdPrlxrRZi4vlDjelFLIufSPrw5HoGT87DbqzRarhFwKT3v+Q4UhbgY0WmUUwlLvuOBaZJNhDE1o1CWOVcs62jP/uKPOcqOSC7sp/f4TwGmdjjXL4xlEX1BdcePXuN0FtHqfwqCDC8FyXYjPrAwSelU2lpdn2H16SUKslADvjPaqzRnBgDZU/RccFyW17vq+6LaaGaWT381XkuPS3zvl8DzIlAOuU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enVLUkdLNHcyeGRBNUpWQlVsMUJTSko5cTNDa1IyVTNDTVZWYmt5em1ad3RD?=
 =?utf-8?B?cmc4M294cE9Ed2lUYzd0NFpsQW5rSk9TbG0rZ0ZKTktXSlZzS2xmUTBmaFJM?=
 =?utf-8?B?OWxOb0FER2FnbjJtczZTeUN4eHdzK3U2M3ZJUjJ6alVPbi9sajVJZzYrbGhR?=
 =?utf-8?B?dklLZFpvZGFocTFQc3JOMG56ZGdqamVpdi9mMm0vR3RaYXFKRzJoMGl5WUpI?=
 =?utf-8?B?dlVUZk1xRElTd0FTRWFqZUZMOTN6WmMvOTQ3VnFrT1pGVzMrQjZyOWVjZFJO?=
 =?utf-8?B?Z0RoNFY3c21WbXlQeHJ1bmNnVmRvd3dkbXFmZDJmTCtKMFpJdEl0bVJIRkxZ?=
 =?utf-8?B?QVdEVmtIR3JxTXpDR3p5Sm9FNklJTHdJeW0yRWxZNFRtSkhIOXNLaGd2Y3Z2?=
 =?utf-8?B?REJiNTBsempKSTlQa1FiaUJCakd5Zit1cjE3QUhTVnBhTW5JRmJNYmYzUnkw?=
 =?utf-8?B?UEd4Nnk0amJZaDRuZHl3TVQvOUwyWE5EWFRiTjcxbDY3MWxMclp0amczb3py?=
 =?utf-8?B?U1RtSFJtcWpNT1YvNXVMZmlwdkZ4Q1AxcUFhL05qVTJDd0YrbkhxaGpXN2tz?=
 =?utf-8?B?ZFY3aC9jNTJONEU1Z2wwczJSbmdDVjdXR0VTbi9NbjZaQWRPQlJvZ2sycVhs?=
 =?utf-8?B?VE5xbExXT2NxK2ZjbDhGNnRUVGwxQXhlR1VJTDd2ejZEM1kvSW5YOHJDaXBi?=
 =?utf-8?B?L0gzT1lPbTczenF5OWNZbXVETkNQd1JSNDNIdFFpS3NuaDVNQkhoRTVuTVJB?=
 =?utf-8?B?Zit6NXA4R2UyS1lCbDdiemxNbDMzVG5SVFlzWW9qZ1NQV3dmNjFjM2daczZK?=
 =?utf-8?B?cEhEMFJGM1lRdGpRekNUeTdpRUYvc3dldk1wVjVseVMwT3Z3SVQ1QTVjQlAz?=
 =?utf-8?B?UGNXdUkwN1NKTXpjeVN2ZGZNN2dTMEFIRGx4UUJVRWRDS0xBYzZTUGFFWEZC?=
 =?utf-8?B?RkJSZDlrckhDVWxjOHdwQTFjM2pLRUd2eDNhQ2pLVzJ6TEtNTG1pWFFWZUcx?=
 =?utf-8?B?ZC9RZ3VURUxBU1VkSXdsdC91Umcyd0t4V3RJdi9scEhOQnVHbFNFT25kaGRW?=
 =?utf-8?B?RDBKdDRKT2R4Q2QvTmczb2txbXFMNTZuSzdGSFQzdks0OVhTazdKMm5wbDRB?=
 =?utf-8?B?ZDY5V1dQMmROeUE1aHU1OEFFMlRwMnZESGd0VnN6WlVWRWJ4NkpRTFhYcnJo?=
 =?utf-8?B?eGJheVlVc1hubVpHT2lWVUg1dFlUeEhzVnFWWWFUMXJOS3dQcHBmMHZOVGY2?=
 =?utf-8?B?RnZOS0JvMnVFcGRkUzVBdUNWbWpxQmF0SjFrZUpqS2puM09iZ2UyUUNYVStK?=
 =?utf-8?B?MmRESkpPSmtiRHBqYjA2THYyQVJuelRSK2ZyTnd0dk1ZeFhQMTF3Z1E3cDZW?=
 =?utf-8?B?cVZGK1ZuWVBGTHlJR3hlb3g1c3NTTHBEYjJLeFdDcnMwUU9sQmpFL0JFdDJC?=
 =?utf-8?B?MkU5UUZiV3NGS0V4bVlpVmtWNllFd1prdk9STzJhUmtHQ2pqa0VLOUJkWElk?=
 =?utf-8?B?cnhHeFVENlFsdXFhU0NsSWNpQTRka201NlRNcjk4YnpreG9uUkFQaXpKVTFI?=
 =?utf-8?B?eTZQbVN1bTQ3SU5PdkZGRFNjK1lFd3RoM1dJSEpmd3Q1OVhUclhmWURYZFd2?=
 =?utf-8?B?eHIrWnZEYXYybk5leVFEME1SRVNKQXFWVWhud3JsNkxpaFgwVFlQeXk2cFZF?=
 =?utf-8?B?YzJ6dnhZcmI3WGZnM0F0emdoZTNYYTBsdEdiZ1FUeFZIZUJiZUsxOW04QXds?=
 =?utf-8?B?QWNpMTBvbXFvQVNNQTdsMytzZmVydGxQT2xlL0FydjF0UWQyUmZlWnRWcThk?=
 =?utf-8?B?TFVZTVV4RlFob294ckFFZlExQnNxalZVcHBNeEhLOUUzT3lVMzJRdDZ2K2xQ?=
 =?utf-8?B?RFpGQldMSkVBb2l6SGswRG00aWp3aEl6U3FYczEySWkrR0I2enM3b0tnakh0?=
 =?utf-8?B?UTY3dUpINXVxbm03UjhNZEZucFJpL1dwZGR1QzBrczJNSnFRdnZvUjV3V3hQ?=
 =?utf-8?B?MmNidnltSDNSYmJUWlY2eStyTmNWQ3hXSGNXUDRobzZLcHNCV0xtV2ZaVVp1?=
 =?utf-8?B?aDRqS1pqREJmWDZkNUdOWGhHamoxci84bFE5eS96emZjS1RVU2ZrRlJHNjhy?=
 =?utf-8?B?UmU0TjRTdWFsZUxBcWZtd01GdVBHYWlzYkZ3ZXAvZUZsR3htdXh6a281Vmpz?=
 =?utf-8?B?WXUxamdpYUF0UEpNM25NK05pM3U5cHpvTnlLZjloRHZoNm9QeTB5Rjh6eDlK?=
 =?utf-8?B?NXFOTHcwaUI5ZnRRUEVTd3hIdXBKa2JiWlROWFNYemF4VlcrRUZ5UFJIL0x3?=
 =?utf-8?Q?sX9HXUzKx1qABGuhs7?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c1af83-925d-44ee-a322-08dea1a21d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 01:37:57.7513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WpHLKOuHwdiLA1NCtgoxypcTTXqiMVGILd5fSzJwmeav7niCZ/+suSdOAhWwsXCNtXDh8kOiSyofGvESh0pHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
X-Rspamd-Queue-Id: 31C32458CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35446-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

UGxlYXNlIGRpc3JlZ2FyZCB0aGlzIGluY29tcGxldGUgcGF0Y2ggc2VyaWVzLiBJIGRpc2NvdmVy
ZWQgYW4gaXNzdWUgZHVyaW5nIHN1Ym1pc3Npb24NCmFuZCBvbmx5IHBhdGNoZXMgMC0xIHdlcmUg
c2VudC4NCg0KSSB3aWxsIHNlbmQgYSBjb3JyZWN0ZWQgdjYgc2VyaWVzIHNob3J0bHkuDQoNClNv
cnJ5IGZvciB0aGUgbm9pc2UuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBBcHJpbCAyNCwgMjAyNiA5OjM1IEFNDQo+IFRvOiBUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT47IE1hdXJvIENhcnZhbGhvDQo+IENoZWhhYiA8bWNo
ZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRv
Zg0KPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3Ir
ZHRAa2VybmVsLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgVmxhZGltaXIg
WmFwb2xza2l5IDx2ekBtbGVpYS5jb20+OyBMaW51cyBXYWxsZWlqDQo+IDxsaW51c3dAa2VybmVs
Lm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1n
cGlvQHZnZXIua2VybmVsLm9yZzsgRy5OLg0KPiBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggdXBzdHJlYW0gcmV2aWV3IHY2IDAvNF0gbWVkaWE6IGkyYzogZHM5
MHViOTUzOiBBZGQgYmFjaw0KPiBjaGFubmVsIEdQSU8gc3VwcG9ydA0KPiANCj4gQWRkIGJhY2sg
Y2hhbm5lbCBHUElPIHN1cHBvcnQuDQo+ICAgZHQtYmluZGluZ3M6IG1lZGlhOiB0aSxkczkwdWI5
NTM6IEFkZCBzdXBwb3J0IGZvciByZW1vdGUgR1BJTyBkYXRhIHNvdXJjZQ0KPiAgIG1lZGlhOiBp
MmM6IGRzOTB1Yjk1MzogQWRkIGJhY2sgY2hhbm5lbCBHUElPIHN1cHBvcnQNCj4gDQo+IFVzZSBo
ZWxwZXIgbWFjcm8gdG8gc2ltcGxpZnkgY29kZS4NCj4gICBtZWRpYTogaTJjOiBkczkwdWI5NTM6
IHVzZSBkZXZtX211dGV4X2luaXQoKSB0byBzaW1wbGlmeSBjb2RlDQo+ICAgbWVkaWE6IGkyYzog
ZHM5MHViOTUzOiB1c2UgZ3VhcmQoKSB0byBzaW1wbGlmeSBjb2RlDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMg
aW4gdjY6DQo+IC0gUmViYXNlZCB0byBsYXRlc3QgbWVkaWEvbmV4dA0KPiAtIFJlcGxhY2VkIGxh
YmVsICJlcnIiIHdpdGggIm91dCINCj4gLSBDaGFuZ2VkIGFwcHJvYWNoIGZyb20gZXh0ZW5kaW5n
IEdQSU8gcmFuZ2UgKHY1KSB0byB1c2luZyBhIGN1c3RvbSBHUElPDQo+ICAgZmxhZyAoR1BJT19E
QVRBX1NPVVJDRV9SRU1PVEUpIGFzIHN1Z2dlc3RlZCBieSB0aGUgZHJpdmVyIG1haW50YWluZXIN
Cj4gLSBEcm9wcGVkIFJldmlld2VkLWJ5IHRhZyBmcm9tIFJvYiBIZXJyaW5nIGR1ZSB0byBzaWdu
aWZpY2FudCBiaW5kaW5nIGNoYW5nZQ0KPiAtIEFkZGVkIEdQSU9fREFUQV9TT1VSQ0VfUkVNT1RF
IGZsYWcgdG8gZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmgNCj4gLSBVcGRhdGVkIGR0LWJpbmRpbmdz
IGRvY3VtZW50YXRpb24gYWNjb3JkaW5nbHkNCj4gLSBBZGRlZCBSZXZpZXdlZC1ieSB0YWcgZnJv
bSBUb21pIFZhbGtlaW5lbg0KPiAtIERldGFpbGVkIGNoYW5nZXMgY2FuIGJlIGZvdW5kIGluIGVh
Y2ggcGF0Y2gncyBjaGFuZ2Vsb2cNCj4gLSBMaW5rIHRvIHY1OiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjYwMjI4LWRzOTB1Yjk1My12NS0wLQ0KPiAwNTZjZjA3Y2M4ZjFAbnhwLmNvbQ0K
PiANCj4gQ2hhbmdlcyBpbiB2NToNCj4gLSBJbXByb3ZlIHRoZSBkZXNjcmlwdGlvbiBmb3IgIiNn
cGlvLWNlbGxzIiBhcyBjb21tZW50ZWQgYnkgQ29ub3IuDQo+IC0gRGV0YWlsIGNoYW5nZSBzZWUg
ZWFjaCBwYXRjaGVzJ3MgY2hhbmdlIGxvZy4NCj4gLSBMaW5rIHRvIHY0OiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjYwMjI3LWRzOTB1Yjk1My12NC0wLQ0KPiBkZWE1OTYyMDVmOWVAbnhw
LmNvbQ0KPiANCj4gQ2hhbmdlcyBpbiB2NDoNCj4gLSBSZWJhc2UgdG8gNy4wLXJjMQ0KPiAtIFVz
ZSBmb2xkZXIgYmxvY2sgaW5zdGVhZCBvZiBsaXRlcmFsIGJsb2NrIGZvciAjZ3Bpby1jZWxsIHBy
b3BlcnR5IGRlc2NyaXB0aW9uLg0KPiAtIE9ubHkgbG9nIEdQSU8gMC0zIHN0YXRzIHNpbmNlIHJl
bW90ZSBHUElPIDQtNyByZXVzZSBHUElPIDAtMyBwaW5zLg0KPiAtIExpbmsgdG8gdjM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MTYtZHM5MHViOTUzLXYzLTAtDQo+IGJiN2JjNjU0
NWRhN0BueHAuY29tDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIE1ha2UgR1BJTyByYW5nZSBm
cm9tIDAtMyB0byAwLTcgdG8gc3VwcG9ydCBHUElPIGRhdGEgZnJvbSByZW1vdGUNCj4gICBjb21w
YXRpYmxlIGRlc2VyaWFsaXplciBzdWdnZXN0ZWQgYnkgUm9iIGluc3RlYWQgb2YgYWRkaW5nIHRo
aXJkDQo+ICAgY2VsbCBmb3IgR1BJTyBjb250cm9sbGVyLg0KPiAtIFVwZGF0ZSBkcml2ZXIgdG8g
ZXhwYW5kIEdQSU8gcmFuZ2UuDQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MDkxMS1kczkwdWI5NTMtdjItMC0NCj4gMDNlZTc2ZWI2YjU5QG54cC5jb20NCj4g
DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gUmVtb3ZlIG5ldyBwcm9wZXJ0eSB0aSxncGlvLWRhdGEg
YWRkZWQgaW4gcGF0Y2ggMS4NCj4gLSBBZGQgdGhpcmQgY2VsbCBmb3IgR1BJTyBjb250cm9sbGVy
IHRvIHNlbGVjdCBHUElPIG91dHB1dCBzb3VyY2UuDQo+IC0gTW92ZSBQVFJfRVJSKCkgaW4gZGV2
X2Vycl9wcm9iZSgpOw0KPiAtIFBhcnNlIGdwaW8gdGhpcmQgY2VsbCB0byBzZWxlY3Qgd2hpY2gg
R1BJTyBwaW4gdGhlIGRhdGEgZnJvbSByZW1vdGUgY29tcGF0aWJsZQ0KPiBkZXNlcmlhbGl6ZXIu
DQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDkxMC1kczkw
dWI5NTMtdjEtMC0NCj4gYTc4MTNmZmJkZjExQG54cC5jb20NCj4gDQo+IC0tLQ0KPiBHdW9uaXUg
WmhvdSAoNCk6DQo+ICAgICAgIGR0LWJpbmRpbmdzOiBtZWRpYTogdGksZHM5MHViOTUzOiBBZGQg
c3VwcG9ydCBmb3IgcmVtb3RlIEdQSU8gZGF0YSBzb3VyY2UNCj4gICAgICAgbWVkaWE6IGkyYzog
ZHM5MHViOTUzOiBBZGQgYmFjayBjaGFubmVsIEdQSU8gc3VwcG9ydA0KPiAgICAgICBtZWRpYTog
aTJjOiBkczkwdWI5NTM6IHVzZSBkZXZtX211dGV4X2luaXQoKSB0byBzaW1wbGlmeSBjb2RlDQo+
ICAgICAgIG1lZGlhOiBpMmM6IGRzOTB1Yjk1MzogdXNlIGd1YXJkKCkgdG8gc2ltcGxpZnkgY29k
ZQ0KPiANCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9pMmMvdGksZHM5MHViOTUzLnlhbWwgICAgICAg
ICAgIHwgICA2ICstDQo+ICBkcml2ZXJzL21lZGlhL2kyYy9kczkwdWI5NTMuYyAgICAgICAgICAg
ICAgICAgICAgICB8IDExOCArKysrKysrKysrKysrLS0tLS0tLS0NCj4gIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvZ3Bpby9ncGlvLmggICAgICAgICAgICAgICAgICAgIHwgICA4ICsrDQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFz
ZS1jb21taXQ6IDRmYmVlZjIxZjUzODcyMzQxMTFiNWQ1MjkyNGU3Nzc1NzYyNmZhYTUNCj4gY2hh
bmdlLWlkOiAyMDI1MDkwMS1kczkwdWI5NTMtMTY4NjI4YzUzYTAwDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IC0tDQo+IEd1b25pdSBaaG91IDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCg0K

