Return-Path: <linux-gpio+bounces-14858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA562A13527
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 09:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ADA43A6876
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 08:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6139319D8A7;
	Thu, 16 Jan 2025 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZZyXn+JI";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZoQ+K7Om"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94319ABD1;
	Thu, 16 Jan 2025 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015515; cv=fail; b=KnYXRu6Fc+42M8rzSnTevUrKCAeL5Os9obi7/aHoNbmx3ck5dY3upQKUqX2PNv0ayJc5nV5kiUJWIAugDs3UsFuQCfI4zQnt/Y4CeoiSZ/u1ojkSadXU7erKTqv5G4eXf+J+U4udGNdsZXr1Wn9KLqv3AHJIU9xLk73+iW5djGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015515; c=relaxed/simple;
	bh=4tlP8OavgltJJx+CFSHpwCoXFssZS1wFM075Xlkj+8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qbwpSYXGeeNA0KEBcoq0nQDcV91/otxeMJxAxQOIXAPdcMxveiiQECqRpLW6SiyUZYNbzBPhNKa6XzG1s5WhcQItoBxdszcg1E5KMoX2HRAqcmKF003OQoi0NaPABNvTFUhaZfe4levZf+UJ+HoTMC8VazQyGA7TQzf3bwggupc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZZyXn+JI; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ZoQ+K7Om; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 72dad954d3e211ef99858b75a2457dd9-20250116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=4tlP8OavgltJJx+CFSHpwCoXFssZS1wFM075Xlkj+8U=;
	b=ZZyXn+JIA0DQP3Izwx76/wRr7gMmMokPUIBCXlabPS5wwDbiKrBk9h0RABMvyFbLcfys5/+gkyDEAAO+CoEkwuboeFKvyCLHBjJAVbznH1/ajAlTPZFm7DQSxKAnzNFzTXbNEuDyn3r5MAersHa5IWleo6A7JmRgLhf7cWtcwIc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9f37f44b-df24-4e61-bb02-8d9710eb4b78,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:8852fc0e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 72dad954d3e211ef99858b75a2457dd9-20250116
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1553596386; Thu, 16 Jan 2025 16:18:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 16:18:20 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 16:18:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYdfFEM/ezxCrg8Bsh6TSDFcV7Pp3OLZLXwKnu3JgE6D8NhU/ZB4ZLPRJcDOms/6kP2iSDEfCM+A1jUfYXk70aMh1Yx6mu7fHCMOVmyZCqguXNjA40EfyfB04cMtv/UatawNnRoMAUhj/tzpTHeWn46OJkjUMeV9oQ0d0NaeIT6VTIqdh364XXTsmZHUJzZ8YE87GKHzwBff8waH29LjH8fGuNIaN3VWlDjNW5/N5UPRUtNzEmogvNHAxFTRzJqBSUNOE12z4ivsS+xcnLDa+6E7Sh8kS96cUq67MuVJionSye+9L6MpjnJEx23mHJxWYvRBipbdyyUhv09GzWf3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tlP8OavgltJJx+CFSHpwCoXFssZS1wFM075Xlkj+8U=;
 b=WGr7mn588701BHE9fQcPoYR1OK3RXBa11fETTLmq8lljWpr1J/gR+aS5jyK3LAZ2EKcRhize1WouFJyuHMqHTJVAdsuekJuJL9bqxy3HTJ4A1hxuei5v6EaiXw4zoQP6JHEkM2GfrrOagXh46XAM9bFwPhEz8yRk0+8mpvw4tv4i0BYLrlzR01fmPo2SqtHiIo0iLlPmjtFFCUUllo5Z1igQ4bYDqWREzYRUVkTjpAmO65ViFdxkjbWJ4FTMB2qvETt9Jmv7ckkzG+tfzJj8ZLCBlyHG2rn44jXsEJtrQabtOr8b7kxnQssRSD265p5+TxjljR52j4AAKEubduP44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tlP8OavgltJJx+CFSHpwCoXFssZS1wFM075Xlkj+8U=;
 b=ZoQ+K7OmoHsQtd5xJfNZGeeIwbCulYsfo5mE3zql8j29ewNT+pxRKfUWsRxYiL1B9wz5rPHNz16c8kOJ1yS0zwj9nRWMDJg1/bIrA6bAokcTVTtWfZCYeRY5B2bxSfIlt4DQT7utCFsfChQpbTL4fzTL+G3UGCgcYWOew0kzVzo=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by PUZPR03MB6988.apcprd03.prod.outlook.com (2603:1096:301:f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:18:17 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Thu, 16 Jan 2025
 08:18:17 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Topic: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Index: AQHbZxfJWswQS8bGo0GLMRlAoA/hErMXl4qAgAEUwQCAAFYhAIAADccA
Date: Thu, 16 Jan 2025 08:18:17 +0000
Message-ID: <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
	 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
	 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
	 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
	 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
In-Reply-To: <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|PUZPR03MB6988:EE_
x-ms-office365-filtering-correlation-id: a9d371d2-c8c4-4822-fab0-08dd360654c9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T1ZBcURpNW9md0o4SG0xa2lsbnZwSU56Slgxa1doN3orUEloZXQyeEJTS01j?=
 =?utf-8?B?VnFmNUljOHk0WDRzSGNkdTlGbTc4V2FxR0pLNHl2SVZicWhpbFFjT01tVlA4?=
 =?utf-8?B?VnByVWRSSTlHaC9CeGFVL2pYcnFGMklUUy9BRzFJeS90cmNCQjcyQTVkTExL?=
 =?utf-8?B?NWJ3NCtPUnVrc2NjR3lSU01xSzVyVVBpeDdsV3Y0TlY4eDZNSi9UTG9Yb29h?=
 =?utf-8?B?R25JT3F5R3ByM0FMVmw3V0dwZ28xeVlXcVMvbUd5YlpqMk1FVHZ4SXVKZHhy?=
 =?utf-8?B?TEJ3U3NBVnNDL1Z1c01VMnpHbkRxT2pTM3RUMi9UNDZzaFFUeUhNVEZ0K25o?=
 =?utf-8?B?My9sdDM0QWhTVWhCUTh0S3JURXVjQUJ1UnprSlJtNkJTWWxibFRSTGExU3ov?=
 =?utf-8?B?SmVJajFreW9FYTZsaDc2UHkxVk9HQmxiZHlWNkpINnAxMjJGb1Q4c25BOXlh?=
 =?utf-8?B?N2daaGE3OUd0azdONnBYRDhDMDF0cU9MM0Rma1cxcGl3R3V3TlpPZGU5Rm1t?=
 =?utf-8?B?dlp0RVFyUzR3WEN3V1N5dU8wMEE2M01iR29RbEUzY1NBRFJpRTlDYmFwSHgw?=
 =?utf-8?B?NHZJcFVDeEVrUHNkUUk2ZmZVSTVucG9zcjVLMGN1OWpYeDRXVENnS0lHRzY0?=
 =?utf-8?B?U3ZWTXJWRThnWlNUOUJGdkc0dlhpTHRyb3J1ZzlPa01SVzVsU2NLR1FhOG1l?=
 =?utf-8?B?MTc1S1V6NzhEbnpGWVBySDUxeGMwdEVTNUljSzAway9lNm91eFZsRlRUVU5a?=
 =?utf-8?B?aFYxUHkwVk95T3dJOVpDT1U1RTVDamZiSkJQZzY3bDN0V3R3bnBRMGp4dkl4?=
 =?utf-8?B?R0lFTmI2THV4elNGTkgwYThaaXlEY2o4TnpBV0VtZk41dGZFMFRMRHBLMU5y?=
 =?utf-8?B?NGJjdkFTN0JJeE9TNUpZMTYxRzFvWDJQcTVlNjVKKzJtcDFjWW9HeHNsVk9I?=
 =?utf-8?B?UmwrOVVLQlpCN0xIaTA3c2IvYzVIS1Z5TEFmbUhXSmR4dUFmRm1SN2NRc0FG?=
 =?utf-8?B?cTd3V3FIdTFsZERGeVpqWlBzOEU3K2RHQkRNbUpjaDk0VFhFV3pibE42M2Vr?=
 =?utf-8?B?b2dHbDhFWDVvSFRDdTZEV3M4UkJMNDJFbk54cVA1ek40Q0pGcmdyVjJsOVZB?=
 =?utf-8?B?QURWbGRzdnhSTXhvTTIxZXhlNjRDVGZXaDkxUEV0SmlaMHBJWlcvVlcxb3BN?=
 =?utf-8?B?K3BqSWtodG5YejBock8zZHhZT3lIZ3hUKzlqOXo5N3gwQXJ2NmJ3YTVGQm92?=
 =?utf-8?B?Q3p5a3pqeXdCZC9SUjFtWno1Wm9mQkJ1VHlUeHpob3JMVzdNcmdWMUxNNitz?=
 =?utf-8?B?MWRKYnpUVTJnQXBMQlRSNnQwd0FvT2Y1TmcvY0lWVUZ1WTZsRGQzc3pQY3JV?=
 =?utf-8?B?ZytBbVg2T1hibDJDeTcwbkVZMytsTGJHWFU5LzZYTXY0MCtQM3dJbDdlc3Fm?=
 =?utf-8?B?NGRXMzh0b3VTMFd5eHJjMWRqNzM2cGhmcmR0TjBBTGg3dXQzUEdmVXc3a3Ns?=
 =?utf-8?B?dW5xZkhTcWNaSms0bVZ5WVNxckNsdjNMVGJRdGN5TG00b0FZN2pJZVl6ckJ3?=
 =?utf-8?B?cXlhQkhDQnRvRmM0ckxFS1MzMTd1SGF2VVBpSzdLMG5Ib0dpSFhIbzJNMmZQ?=
 =?utf-8?B?M2xWV1BXVzZzVzlLRy9BdmVCZHZkdFNrVWl2bXdjZEJBaE15YnBOUTMyUFJr?=
 =?utf-8?B?Q3V5dUtKWW1qM0ZNYmFUQ2ZHeEh0YlNVR01DR3U4bTNCaW9JVStrVzRqdDRy?=
 =?utf-8?B?UWFMd2ZJVjVoY0tsbFNFd2NSUVlZanVrTTNVWWRNL1RtYUlUVW9ib1VoNVlP?=
 =?utf-8?B?NEc5MzBnOFNUaU5JSlJROTlvUUJWc3VBMVhWKzZEcW00NkQwYmE1b0k3azht?=
 =?utf-8?B?YjV2MHRMUGpIZVRNdUg4U0pSbktLTERpN29EM0ZFb3JLRDIrRC9renNzTkJw?=
 =?utf-8?Q?p0IiTZx8vR48IAydqqJzav7xWGD4qkqv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clAySks1UnAwK29YVHB1TnIrcnpvQjhsRUpHZ2dCTWRJZnd2MUcrR1JNZkJl?=
 =?utf-8?B?YXZqQ09sRmsrckdlZWkzemVlS1Rqbk5EUm9Rc0J3ZW82RTFXUUZxT1hLc0JN?=
 =?utf-8?B?d211SGgrSkx0LzN5dHBPRnpGclFOaDBqcTZRNTY3MFN6T1h6SnZzVFhseGVi?=
 =?utf-8?B?V1VtNk5CN3cvSnY3TWxZWG96cXJDYzcvMnpkYTJPaDNXZFRpUWdVVjlmRzdI?=
 =?utf-8?B?VWxadkxpQUkvei9hMm50ZU9TSjZHYk1ML1BMN2pZMjlYUWVlUWpYVXhRb2hq?=
 =?utf-8?B?akl1QXd3NVc5alVzNmR6Y0NhVk9wRDVRVmJhZHZhMlkwcWxJWThaeG9naUlE?=
 =?utf-8?B?WkFoQjZ5RFozaEIzV1VKMGF1TERHY3pOaHQ2bmh2dUl6LzFpUG14cDExR0I3?=
 =?utf-8?B?MUI5YkxRY1p6dWZud3BUckZBR2tPTXV5cnQ1TzFFNWpNbnM1ZTBEaFdtS3c3?=
 =?utf-8?B?c1FldmsxQXFXOUJkcHBFVkMyaU9mNDdabXlIcU5XWWZHUHFKbUlPRG9uTVpB?=
 =?utf-8?B?ZlUyN1hGRFphckwrN1JBd3RtMWI3SGpRd25LSWpkZmEzem5LM0VWZEV2Uzhw?=
 =?utf-8?B?a1VmNnM2cWxrdDVOVGYrZWFuY3lyaVlFMHJvdFhIcm4yRTZZd2d2NmVJTjRX?=
 =?utf-8?B?WW1HREJ5YThaMHd4Nm9sN2tHblFFVncyMFVnMUoxUUhLakNhQnQxYS9DcFdo?=
 =?utf-8?B?TVN1OVZzQkpSa1MwT0w1YXlLM2VvRk9tVGd3dGlXcy9pOGZzdmZSSFBjb1pC?=
 =?utf-8?B?cnVNVkNjMFRiRDgyR1E1RWwvU1pma1VxNVFBMnBhb21oa2JydGdCaXVhVW1E?=
 =?utf-8?B?d1BDQ1RES2M0NTVaeERaOFg1U3dHMWZlZXNFWkhuWjhtUjM5anl2M1B4azU5?=
 =?utf-8?B?TXBkczlacG9ZbHlJbFFUMHRkYkd1RmVvR1A0TGlCdndTMkRvV0ZUeEt0MWZx?=
 =?utf-8?B?V3lYWURGVjdJU1J1UURJZVNnZ1RwSWRjeUhWN01iMytPcUU0MFNwUVJHRE1R?=
 =?utf-8?B?MVNJSWJoUU4yODJkMjc3VEpkcWF0ZmxXR05lcFBpK1BYSnFJc1ZqaXhqWTha?=
 =?utf-8?B?UUtzeGUvUW5OdmdzL21OSkU0SG5lR2FlWWEzWmJyRlhIREVFdGk4UWVhWXh6?=
 =?utf-8?B?YVBPNEplMVZ3cE10R2JtazRqcHhFYXNTSHMvMFRmMmpjWHR5cWhBSU5SSUk2?=
 =?utf-8?B?YlNOVGNydUlaUmRFb2hlTHlhY01SN1FkVndORHd0djBwVTFWb1krUktOaDg2?=
 =?utf-8?B?QlFKbzlrYkFQcmxFclF2R3d1N0hkaWFHTmRNK05KbkZhUzY0cy9FNENwcmVF?=
 =?utf-8?B?WDBxckwvQjFzeW1xN1Q1YTR2NTVycFFHLzBxWWZqZTk1YmZRdlJrVXdtYmRh?=
 =?utf-8?B?UUY0b1IzUjl1NDVFbW45bnowNmV4Y1p6a0pvYkxGTENDSjVyYUhxWXVIczkw?=
 =?utf-8?B?VWV6S0FVQmgrSVpnS0xLU1lOdEs5elQwOHRiR09mUnhJY3NZL201SVljV0Z5?=
 =?utf-8?B?TmNxWEg0MC9SUzZhb2UzQ3Y5UW9uUHhvUjlwcUdiNXUzcTd4ZWVtbTd5SVRP?=
 =?utf-8?B?cGU2MlFNYmtsbjJsNm1Jd1V5RE5qNForRjY4Q3R6ZVVFcUJIUFlyaWFTcTVM?=
 =?utf-8?B?MFBSSk84cFVkRndwRFZvSW5uelhKWWJTYld5SE5yTXF4UUZ4SGRWcGw1UDZM?=
 =?utf-8?B?YzMzSVVxbG1Ya2ZJbDRsOHFzaU5mbTBmNW5HV1JuTzJqMHlmNkJjaTNZZU1w?=
 =?utf-8?B?RTdZTE91c0dCVlFCNW45cEcydTNVZFJyV09CK2xpaWJ0WlBlV3dIVWdPdTFP?=
 =?utf-8?B?ZS9vUGdUSi8xcGZTQ3pFN2VuVnFzN1Nqd0FVUEppbmsvTllWY1hXT3BSdDBD?=
 =?utf-8?B?aGpqQkpJdHJ6bndpMndubFQzNHBnOVpxQ3JoQi9vdlVOaDdhRXFmNVRNQnc5?=
 =?utf-8?B?QVhSbWlHcDR2VjRENmtOaVNsU3BqZjhLYmx1S2NhTjV0MXJGZlBjendUN3Ju?=
 =?utf-8?B?WHowYW1SMk4xMzI4cFpOS3NWOE45djF2K0l5R2JIT2dURlNIaERUZVBqbEVM?=
 =?utf-8?B?MldsaVZZMTFJcFpHZ1c2eWQzMmt3MEVWeGZnQy9Ha2Z3NVFPT2ZuVWY2TEpN?=
 =?utf-8?B?bUp3bFVrQ2FWNzFEK0JZa3ZYTjU4VVZXRDFuTjNFdmFiL3NxYisrOGdpVEg0?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C39371A944926E439F41A21C0786D36B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d371d2-c8c4-4822-fab0-08dd360654c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 08:18:17.6150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q91WUQ8p8tzUKgu20suLk+bHHWJYL7B75lyY7tLJ0qiInY82UqGovDp8RMDYPkTXvFO+6k7PVm8mho9U9gaZG5j1ii9waV1D4S3+Ewi72gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6988

T24gVGh1LCAyMDI1LTAxLTE2IGF0IDA4OjI4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE2LzAxLzIwMjUgMDM6MjAsIENhdGh5IFh1ICjorrjl
jY7lqbcpIHdyb3RlOg0KPiA+ID4gPiArICAgICAgICAgIGJpYXMtcHVsbC1kb3duOg0KPiA+ID4g
PiArICAgICAgICAgICAgb25lT2Y6DQo+ID4gPiA+ICsgICAgICAgICAgICAgIC0gdHlwZTogYm9v
bGVhbg0KPiA+ID4gPiArICAgICAgICAgICAgICAtIGVudW06IFsxMDAsIDEwMSwgMTAyLCAxMDNd
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5NiBwdWxsIGRvd24g
UFVQRC9SMC9SMSB0eXBlDQo+ID4gPiA+IGRlZmluZSB2YWx1ZS4NCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgLSBlbnVtOiBbMjAwLCAyMDEsIDIwMiwgMjAzLCAyMDQsIDIwNSwgMjA2LCAyMDddDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5NiBwdWxsIGRvd24gUlNF
TCB0eXBlIGRlZmluZQ0KPiA+ID4gPiB2YWx1ZS4NCj4gPiA+IA0KPiA+ID4gTm90IG11Y2ggaW1w
cm92ZWQuDQo+ID4gDQo+ID4gICBJIGhhdmUgcmVtb3ZlZCB0aGUgY29udGVudCByZWxhdGVkIHRv
ICdyZXNpc3RhbmNlIHZhbHVlJywgd2UgdXNlDQo+ID4gJ1JTRUwnIGluc3RlYWQgb2YgJ3Jlc2lz
dGFuY2UgdmFsdWUnLg0KPiANCj4gU28gdGhlIHZhbHVlIGluIE9obXMgd2FzIHJlbW92ZWQ/IEkg
YXNzdW1lIGFib3ZlIGRvIG5vdCBoYXZlIGtub3duDQo+IHZhbHVlDQo+IGluIE9obXM/DQoNCiAg
WWVzLCB2YWx1ZSBpbiBPaG5zIHdhcyByZW1vdmVkLCBubyBjb2RlIGhhdmUga25vd20gdmFsdWUu
DQoNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gPiArICAgICAgICAgICAgZGVzY3Jp
cHRpb246IHwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIG5v
cm1hbCwgaXQgZG9lc24ndCBuZWVkDQo+ID4gPiA+IGFkZA0KPiA+ID4gPiBSU0VMICYgUjFSMC4N
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIFBVUEQvUjAvUjEg
dHlwZSwgaXQgY2FuDQo+ID4gPiA+IGFkZA0KPiA+ID4gPiBSMVIwIGRlZmluZSB0bw0KPiA+ID4g
PiArICAgICAgICAgICAgICBzZXQgZGlmZmVyZW50IHJlc2lzdGFuY2UuIEl0IGNhbiBzdXBwb3J0
DQo+ID4gPiA+ICJNVEtfUFVQRF9TRVRfUjFSMF8wMCIgJg0KPiA+ID4gPiArICAgICAgICAgICAg
ICAiTVRLX1BVUERfU0VUX1IxUjBfMDEiICYgIk1US19QVVBEX1NFVF9SMVIwXzEwIg0KPiA+ID4g
PiAmDQo+ID4gPiA+ICsgICAgICAgICAgICAgICJNVEtfUFVQRF9TRVRfUjFSMF8xMSIgZGVmaW5l
IGluIG10ODE5Ni4NCj4gPiA+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlz
IFBEL1JTRUwsIGl0IGNhbiBhZGQgUlNFTA0KPiA+ID4gPiBkZWZpbmUgdG8gc2V0DQo+ID4gPiA+
ICsgICAgICAgICAgICAgIGRpZmZlcmVudCByZXNpc3RhbmNlLiBJdCBjYW4gc3VwcG9ydA0KPiA+
ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMDAwIiAmDQo+ID4gPiA+ICJN
VEtfUFVMTF9TRVRfUlNFTF8wMDEiICYNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIk1US19QVUxM
X1NFVF9SU0VMXzAxMCIgJg0KPiA+ID4gPiAiTVRLX1BVTExfU0VUX1JTRUxfMDExIiAmDQo+ID4g
PiA+ICsgICAgICAgICAgICAgICJNVEtfUFVMTF9TRVRfUlNFTF8xMDAiICYNCj4gPiA+ID4gIk1U
S19QVUxMX1NFVF9SU0VMXzEwMSIgJg0KPiA+ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExf
U0VUX1JTRUxfMTEwIiAmDQo+ID4gPiA+ICJNVEtfUFVMTF9TRVRfUlNFTF8xMTEiDQo+ID4gPiA+
IGRlZmluZSBpbg0KPiA+ID4gPiArICAgICAgICAgICAgICBtdDgxOTYuDQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ4MTk2LXBpbmZ1bmMuaA0KPiA+
ID4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTYtcGluZnVuYy5oDQo+ID4g
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYmYw
YzgzNzQ0MDdjDQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5jLmgNCj4gPiA+ID4gQEAgLTAsMCArMSwx
NTcyIEBADQo+ID4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSAqLw0KPiA+ID4gPiArLyoNCj4gPiA+ID4gKyAqIENvcHlyaWdodCAo
QykgMjAyNSBNZWRpYXRlayBJbmMuDQo+ID4gPiA+ICsgKiBBdXRob3I6IEd1b2RvbmcgTGl1IDxH
dW9kb25nLkxpdUBtZWRpYXRlay5jb20+DQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gKw0KPiA+ID4g
PiArI2lmbmRlZiBfX01UODE5Nl9QSU5GVU5DX0gNCj4gPiA+ID4gKyNkZWZpbmUgX19NVDgxOTZf
UElORlVOQ19IDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5j
dHJsL210NjV4eC5oPg0KPiA+ID4gPiArDQo+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9f
RlVOQ19HUElPMCAoTVRLX1BJTl9OTygwKSB8IDApDQo+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9H
UElPMF9fRlVOQ19ETUlDMV9DTEsgKE1US19QSU5fTk8oMCkgfCAxKQ0KPiA+ID4gPiArI2RlZmlu
ZSBQSU5NVVhfR1BJTzBfX0ZVTkNfU1BJM19BX01PIChNVEtfUElOX05PKDApIHwgMykNCj4gPiA+
ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX0ZNSTJTX0JfTFJDSyAoTVRLX1BJTl9OTygw
KSB8IDQpDQo+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19TQ1BfRE1JQzFfQ0xL
IChNVEtfUElOX05PKDApIHwgNSkNCj4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5D
X1RQX0dQSU8xNF9BTyAoTVRLX1BJTl9OTygwKSB8IDYpDQo+ID4gPiANCj4gPiA+IEkgZG8gbm90
IHNlZSBob3cgeW91IHJlc29sdmVkIG15IGNvbW1lbnQgZnJvbSB2MS4gSW4gdjIgSQ0KPiA+ID4g
cmVtaW5kZWQNCj4gPiA+IGFib3V0DQo+ID4gPiBpdCwgc28geW91IHJlc3BvbmRlZCB0aGF0IHlv
cHUgd2lsbCBjaGFuZ2Ugc29tZXRoaW5nLCBidXQgSSBkbw0KPiA+ID4gbm90DQo+ID4gPiBzZWUN
Cj4gPiA+IGFueSBjaGFuZ2VzLg0KPiA+ID4gDQo+ID4gPiBTbyBleHBsYWluOiBob3cgZGlkIHlv
dSByZXNvbHZlIG15IGNvbW1lbnQ/DQo+ID4gPiANCj4gPiA+IFRoZXNlIHR3byBleGFtcGxlcyB3
aGVyZSB5b3UgY2xhaW0geW91IHdpbGwgY2hhbmdlIHNvbWV0aGluZywgYnV0DQo+ID4gPiBzZW5k
DQo+ID4gPiB0aGUgc2FtZS4gSSBza2lwcGVkIHRoZSByZXN0IG9mIHRoZSBwYXRjaC4NCj4gPiAN
Cj4gPiAgIFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW50IHJlc3BvbnNlLCBoZXJlIGlzIG15IGV4
cGxhbmF0aW9uIGZvcg0KPiA+IHlvdQ0KPiA+IHF1ZXN0aW9uOg0KPiA+IA0KPiA+ICAgSW4gdjEs
IEkgdW5kZXJ0YW5kIHRoYXQgeW91IG1lYW50IEkgZGlkbid0IHNlbnQgYSByZWFsIGJpbmRpbmcs
DQo+ID4gYW5kDQo+IA0KPiANCj4gVGhlIGNvbW1lbnQgaXMgdW5kZXIgc3BlY2lmaWMgbGluZXMs
IHNvIEkgc2FpZCB0aGVzZSBkZWZpbmVzIGFyZSBub3QNCj4gYQ0KPiByZWFsIGJpbmRpbmcuIFlv
dSBzZW50IHRoZW0gYWdhaW4sIGJ1dCB0aGV5IGFyZSBzdGlsbCBub3QgYmluZGluZ3MsDQo+IGJl
Y2F1c2UgdGhleSBhcmUgbm90IHVzZWQgaW4gdGhlIGRyaXZlci4gTWF5YmUgdGhlIHVzYWdlIGlz
DQo+IGNvbnZvbHV0ZWQsDQo+IHNvIHdoaWNoIHBhcnQgb2YgaW1wbGVtZW50YXRpb24gYXJlIHRo
ZXNlIGNvbm5lY3Rpbmcgd2l0aCBEVFM/IElPVywNCj4gd2hpY2ggcGFydCBvZiBkcml2ZXIgcmVs
aWVzIG9uIHRoZSBiaW5kaW5nPw0KDQogIEkgZ290IHlvdS4gVGhpcyBiaW5kaW5nIGRlZmluZSBt
YW55IG1hY3Jvcywgd2hpY2ggd2lsbCBiZSB1c2VkIGZvcg0KJ3Bpbm11eCcgc2V0dGluZyBpbiB0
aGUgRFRTLiBUaGUgdXNhZ2UgbGlrZSB0aGlzOg0KDQogIGFkc3BfdWFydF9waW5zOiBhZHNwLXVh
cnQtcGlucyB7DQogICAgICAgICAgICAgICAgcGlucy10eC1yeCB7DQogICAgICAgICAgICAgICAg
ICAgICAgICBwaW5tdXggPSA8UElOTVVYX0dQSU8zNV9fRlVOQ19PX0FEU1BfVVRYRDA+LA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFBJTk1VWF9HUElPMzZfX0ZVTkNfSTFfQURT
UF9VUlhEMD47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAgfTsNCj4gDQo+IA0KPiANCj4g
PiB0aGUgYmluZGluZ3Mgc2hvdWxkIGJlIHNlcGFyYXRlZCBmcm9tIGRyaXZlci4gSW4gYWRkaXRp
b24sIEkgc2hvdWxkDQo+ID4gcnVuIHNjcmlwdHMvY2hlY2twYXRjaC5wbCBhbmQgc2NyaXB0cy9n
ZXRfbWFpbnRhaW5lcnMucGwuIFNvIGluIHYyLA0KPiA+IEkNCj4gPiBzZW50IGEgcmVhbCBiaW5k
aW5nKG1lZGlhdGVrLG10ODE5Ni1waW5jdHJsLnlhbWwpLCBhbmQgc2VudCB0d28NCj4gPiBzZXBh
cmF0ZSBwYXRjaGVzLCBvbmUgZm9yIGRyaXZlciBhbmQgb25lIGZvciBiaW5kaW5ncywgYWxzbyBy
YW4NCj4gPiBzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCBnZXQgbmVjZXNzYXJ5IHBlb3BsZSBh
bmQgc2VudCB0byB0aGVtLg0KPiA+IA0KPiA+ICAgSW4gdjIsIEkgdW5kZXJzdGFuZCB0aGF0IEkg
bmVlZCByZWZlciB0byBnaXQgaGlzdG9yeSB0byBtb2RpZnkNCj4gPiB0aGUNCj4gPiBjb21taXQg
bXNncywgc28gSSBtYWRlIHRoZSBjaGFuZ2VzIGluIHYzLiBUaGVuIHlvdSBhc2tlZCBtZSBhYm91
dA0KPiA+IHRoZQ0KPiA+IGRpZmZlcmVuY2UgYmV0d2VlbiAnUlNFTCcgYW5kICdyZXNpc3RhbmNl
IHZhbHVlJy4gSSByZXBsaWVkIHRoYXQNCj4gPiB0aGUNCj4gPiAncmVzaXN0YW5jZSB2YWx1ZScg
bWV0aG9kIGlzIG5vIGxvbmdlciB1c2UsIHNvIGluIHYzLCBJIHJlbW92ZWQgYWxsDQo+ID4gY29u
dGVudCBhYm91dCBpdChpbmNsdWRlIGVudGlyZSAncnNlbC1yZXNpc3RhbmNlLWluLXNpLXVuaXQn
DQo+ID4gcHJvcGVydHkNCj4gPiBhbmQgdGhlIHBhcnRzIG1lbnRpb25lZCBpbiBiaWFzLXB1bGwt
dXAvZG93bikuDQo+IA0KPiBZZXMsIHRoYW5rIHlvdSB0aGlzIEkgc2F3LCB0aGUgY29tbWVudHMg
YXBwZWFyIHVuZGVyIHNwZWNpZmljIHBsYWNlcywNCj4gc28NCj4gb25seSB0aGVzZSBwbGFjZXMg
YXJlIGRpc2N1c3NlZC4NCg0KICBvaywgdGhhbmsgeW91LCB3ZSBjYW4gZGlzY3VzcyBpZiB0aGVy
ZSBhcmUgYW55IGlzc3Vlcy4NCg0KPiANCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0K

