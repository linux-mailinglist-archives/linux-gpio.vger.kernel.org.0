Return-Path: <linux-gpio+bounces-34273-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PwxM2+KxmlELgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34273-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:47:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4580345898
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 083D1306C465
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 13:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D8D3EB7F8;
	Fri, 27 Mar 2026 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HAXJYOEa";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Yoe9v36h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1336481B1;
	Fri, 27 Mar 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618912; cv=fail; b=Zg85vVrJcvGg1WZrIgkulwa/SbnDPCtGal4JkB7aImhJE7KRNZHT6apHGmvPABGJLYegt+LJf3q/18cRnvwFnU8wDtWt378wJ8u/FeT4HYHFnt+kKPfirqa1O+t+kxNtfzNw/shs7skSaoJWghqjP+CBGqk11qFNZPNrWN569u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618912; c=relaxed/simple;
	bh=AT9qjITYCt6RH0+TJkR/UmvkeeLqyulSNdKLx8JbtF0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eq3PMng2d08r7MZ8fz5jVErCA15ne46sTaPAabrN0PBUbckkwq1SsRpCtQgWWMgdn0KRzL2zm7Ssw5cZtdrQygqLLtOSHteFjH7SxMCgiR0JXJsn3gb4s0ODcf3TnVNR/og3aUsvuoxok6cZnZPQ9zmeAlAHci7VP1wOsnGug5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HAXJYOEa; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Yoe9v36h; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b16bc61829e211f1ae70033691e9ac7d-20260327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=AT9qjITYCt6RH0+TJkR/UmvkeeLqyulSNdKLx8JbtF0=;
	b=HAXJYOEa0yHVnqIFnF/AZJNlK7o/aETAs9Odsfmbt4cpZFCnmV+/aUIeFwCPIUrSGghplvbRxEh39xi3U6+wPX209Zxkygd0jJljuIIFkvRSGNpwU7sC9h/KnOSWXbIhwa5UKdAJvl3qXPH0gT1r+kzvft14U/H/gTSL3Ye5Y+I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3d82bc06-b6c3-430d-8ed9-225b25a7c8b5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:f865c58e-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b16bc61829e211f1ae70033691e9ac7d-20260327
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deep.pani@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1783375836; Fri, 27 Mar 2026 21:41:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 21:41:42 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 27 Mar 2026 21:41:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rV21ShJdLRWPjaVDw450XLhq6+65DY1KKnL+4FVtsobK4kQUa3dl+uy2TWl667KUDDMgZFn5KQAdaLAfRHpTcAGzfjv8sZZ2HN+O7+UV2x0tWXYVyFiEJP73VSZrdILlbxvmGfGJ9vi895uLxp8jn/G3xbNDTWV7OqED+ct3ga+2XZtNRJc+MPNh1RWeBGfrei04q9dQZCjVKJt+KVgiPcz4MsrMhq+qjnSrrJR8GmvQBXpHpCZYjH2Iio9VDc/pb+IfYa8Ah0xUcWOmxbC+hmitqwykvgFsl1/goM+iT5NjCsT2LD5+ji4r3m6dfqZcYe5EJQ1K4R2rfBWiEAnnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AT9qjITYCt6RH0+TJkR/UmvkeeLqyulSNdKLx8JbtF0=;
 b=cG55NYsQi+AedcFSW702GE1oEQ9R6YlNlvPkUTEfLn0AUirh9xy8lhP/wPT919vENIQZuZlEa86L5hQ+9CVz4P/hZ8gNVbi+ULg1wc3eRJCgiewKh6D/CqasKMkXZmiv8LRy0d751XlT72t26g8/9SCOwy9E+zLISL3UbzZdiH2XqHOLhprN5WTggwLcmaTi1cYJElOU2SsW0H9gThhK2xG/Fn+jf2DByaPftq9F38Spn9YrVA8qyYVmRcBWHHR3qJTCppBqAe1PnXPBHDt7AHjYGv3zPGINwy4w6PVj72npQTAQnXfKLmw2hykvaLQYMhKkhtANULM44napXOrung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AT9qjITYCt6RH0+TJkR/UmvkeeLqyulSNdKLx8JbtF0=;
 b=Yoe9v36hpW6AErrchRG4jOWXsjr1PMh0+hl14+NQ2sc6O0FSdoXwfBONK2vIjdHbQ30YKTR8xmM7RMjdHWrWImk3RmFvs5naI7lLqE7zJJNmrHkiiFTwr1GnNh5K7DfSdSaCt8etxKGokPsYr8QMbdLO/tYCtV2chixwBQbQB5I=
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com (2603:1096:301:118::11)
 by SI2PR03MB6462.apcprd03.prod.outlook.com (2603:1096:4:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 13:41:38 +0000
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f]) by PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f%7]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 13:41:38 +0000
From: Deep Pani <Deep.Pani@mediatek.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?RnJlZC1XWSBDaGVuICjpmbPlqIHlrocp?= <Fred-WY.Chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Mandeep S <Mandeep.S@mediatek.com>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>
CC: =?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	=?utf-8?B?WWUgV2FuZyAo546L5Y+2KQ==?= <ot_ye.wang@mediatek.com>,
	=?utf-8?B?WWFveSBXYW5nICjnjovnkbbnkbYp?= <ot_yaoy.wang@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?= <ot_shunxi.zhang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH 3/3] pinctrl: mediatek: mt8901: Add pinctrl driver for
 MT8901
Thread-Topic: [PATCH 3/3] pinctrl: mediatek: mt8901: Add pinctrl driver for
 MT8901
Thread-Index: AQHcXbSA3dPwahzj0kaOPW2QUXG1wrUDKBgAgL5Wx4CAAaSVgA==
Date: Fri, 27 Mar 2026 13:41:38 +0000
Message-ID: <666207716ac5021e81736c30e802ba2febfed081.camel@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
	 <20251125023639.2416546-4-lei.xue@mediatek.com>
	 <df11bbf1-09d1-40fc-be56-6a98d90abcb6@collabora.com>
	 <0df339f15f4ba7e55880194edfdec1155f2f20f7.camel@mediatek.com>
In-Reply-To: <0df339f15f4ba7e55880194edfdec1155f2f20f7.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB7160:EE_|SI2PR03MB6462:EE_
x-ms-office365-filtering-correlation-id: a3775686-16b4-49fa-f896-08de8c06920e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: QaZX7vPn8UQ9bqx1ntErem22K7qDIx+y5zg5Hy3N73Lq8GbK+el7vcirGRHR54eK5socLGSkgj5ifqTw7UNNEtnwiNaX/FRuwraHkyq2kRZduCtR3ze/5yWjBV53vgih5ISatcvAV5Btg15wq0dBeNWG2nTdkYS7B52b62NTUVScbBlqz/R98LAF3e6M0iZtLrNUeQGBWhdfuY8ko50HqHleI0b5sL8/jq1V+l6R6XxHiMEc5VkIngoldjo3rVjpLlXpV3jPZx8tQERQgMm6myrK5sEvxUb36DKcMsGhSfZIIfjbPARzI7ViTd9+qhLm660O90agquMqRvwQwvdXZjepqxtQr8N8dFLL1VyXQJDl7wxJctMocuEl7n8mTD95joVFcGlSbyJZwmvZtY3lc2+Noe/sfApJmwVAIq4tZz3uqO6xBoVGt8yXcS+W3gm1AqoSYdaEM+La2K+XcN4WGUYy9UIkyPjIRGDJY70SxcpD+0RRjT+APKpCvDPUwaSghZ38taBIDVm183cnnuHnh+CEgMuBbCIBNMQuOOJ4oS4QqwvAj6KTXexnqXbVPzJ5XLutPGZy9oKubCBITCzorhr1YiVUkd3uraHMKiZgoZbnxfeB7vlbh8HX3LcUiEJIe6n/w9JaJcJNcpO6a+s5BBLpT+mBdXlezOK4FSWhN4bPSrY6FLgSWdzVHaCY9pSeWtOamQ5ZCQ9LM1PQZgN7v3yUjSJlyP/kOF6oj8MHN97Ykz/ycQ4YawB50yHbdo4yoMsDV6lgxOqcyUt8RadqmN6ndhhEhqu0Tfm0EE3ROns=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7160.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk5YcE80d0pkcGRMaGVKUDdCZVpBK3hXZHRjUWUwb0NsN1pqVW1pU2JTUmZF?=
 =?utf-8?B?VHQ5Nm9KT2JwYjhmaC81Q3I0aVM1ZG5lekhsdEgvdW11cmhLOURSbHNmWDJp?=
 =?utf-8?B?NnVWTlVNcHNPTjVWWWVadDdEbHZIUW9WUHU3akR2UjNic0FMeW9HVTJWSTkv?=
 =?utf-8?B?UHRoc0JyM25acjR0bU04eFVhYzZsQmFIN0RrOGdpdU14R1BTeDZJMTRDQlNz?=
 =?utf-8?B?NnVwV2pqTytnWmRNckVOZDNEVGVPbXNaeXNpaW1wdllNZTlOSFRpeU5FSTRv?=
 =?utf-8?B?bUJkbHR6VkdhTXdNWWlnWjdWYmxjQnZ5KzZ5OE90K2pBM2VBbXlkQUNKYk5H?=
 =?utf-8?B?NUZ1MXQwS0pJZnVlSFNBMGNvZFp6ZUcvZE1TL0Frbk55dmdjYm5lTVlXVmNq?=
 =?utf-8?B?YmVOaWQ0Lzdud2gyMVQzTk5HcjRNSVg2OUJsK3lpNG9SNWRkay85UHlvVUM5?=
 =?utf-8?B?MllJbmFJZDFvaVhjbWpJVG5lOW5VbFplSGQ5blF1a3B0WU1ha29veE1VSm5S?=
 =?utf-8?B?UXFYWmp6U3AwZlBCMmg1emsrSVh1U0xjaCtUQnlrS1l5cnJZdGMvSERYbVY5?=
 =?utf-8?B?TnBPQ2VYdForeElSb0tGd0NJR3lpdC9vT01wZXR4UnNaR0k2TFgyUmZTbVU4?=
 =?utf-8?B?eVNaVmNxSGc4b2tRemVZSmhPZjRtZnRWeWo2S2Q0dW5UclFMQk05Tmg3bktv?=
 =?utf-8?B?UERoYmF2U1o1dlZMOHpqWFhtYWNtMTlMbGVHWTlnRGRFWXdablRoNnM5VDJn?=
 =?utf-8?B?MkhOVmdvbDczZEVOM0N4d3M0eHYzakhtWmFYeGY3RE9nd0NGdCtwcjl3M1da?=
 =?utf-8?B?K0xXaEQrZUUrQUZqbWJhcERiY1Z2TW1tQUp6S1dQN2FscVhwbExiSTNwK21u?=
 =?utf-8?B?SVNMa2J5VWhtbnM1OXdVOVdZTkZoOHNVcEZCeTZuNW13QndpVlpZRTFhSkRV?=
 =?utf-8?B?UXdSbk9lWHZ5QjU3MDdZSXNOSjZoS0liTTllYzVIWkZVZmg0SnNqV0QraGJK?=
 =?utf-8?B?ZExobldNbW41WERaMmoxc0pydHlKc2RXOC9kT052aXd6U1VnM3pTM1FHNkNV?=
 =?utf-8?B?OW9GaU5wNzFiTXdMRlVLUERDMXBXRUxZVTgzMmNSMmxrYXZsalhralNWTXVY?=
 =?utf-8?B?TktpVW9wY0tQdkVsUmoxOU1zajVJSWhLV3VIdi80SWUvcnpSN0paUUdTdVp3?=
 =?utf-8?B?dkRmUFp0TWRkNW11S3ZqaHEwQWlHclZQNnBpelQ3N1pMNng3ektsaFJENlUy?=
 =?utf-8?B?bnJ0d0FKNEpxOXZRQlJ6aHRTTDdLVGNua3lXNXIzUnF0SXUxcUpPbVF0aGI5?=
 =?utf-8?B?VUtsTDhEalBLbnYyQ09UNmx4VmRPTFpYWFFNb3M4UEFOWE5VcVdWTXdiVmxt?=
 =?utf-8?B?T1VYWTlRZ2pMS1F2eVl5dGRUUVBmdFNaSnRuTkhGQzNBWjlHM29sZkdFd1JW?=
 =?utf-8?B?YWZsT3NQVTVBbVRmVmJPY09KKzluYkNZSEJwTm9YVzBURTU4UUsvazdxUHY0?=
 =?utf-8?B?dlNzQ2xFaCtZM01HbXp6aXBYWUxCRStQcnVvSm44WWNSY3JHMHh6SUFHNWZG?=
 =?utf-8?B?Y3VGOVVTTlZ4enVMTnV4VUlDYzNSSTYvZm55RlQwZnRrSE9uTDdOQlozSEVK?=
 =?utf-8?B?d0ZSSnUrT2JtcmxOOFVXSzlXeGJXR25PZ3IyTDNSeGhzSW9SUGpTOWp6QklG?=
 =?utf-8?B?Rk5lWmplTGd1eWdhM0xqY2dCRml3bGlNTWZoS2NaeG9XNHVINjl1VUl4RjlY?=
 =?utf-8?B?VmNCMWpUbDZvUnpQT0htWEVSdzV5UEE2Rm5adVVockdMdElDNlhrMDFkdHNz?=
 =?utf-8?B?RExkL3Y0UHN4QnRmT2FXZ1hmSVpMWVpYNHNqVFY5TlJUQUUrdmR1TS9Ed3VQ?=
 =?utf-8?B?REZnSGMrdS9GWjk2Nk15YWQ1ZWx4amdBMk1WKzlXRnJnTkduTk5EeW9kdVFy?=
 =?utf-8?B?K1cvQk9kOEdxT0QrTEVCYmRPN0l5M3F4SFVWc3B5UHBmZHlpWHlRYnE1bkta?=
 =?utf-8?B?N1pHcVU1M0FXazJTbHNIbGRkV2pWV0x3Q1NucVZCaGFGcE9UWHk2eHMrSTNQ?=
 =?utf-8?B?VURDcGt4NldnMEhWSUxhQWMvblU5KzFlRFpDUldaUUF1TVEzdmFzelZnRFRQ?=
 =?utf-8?B?enRWa3NDbkZpS3AwUnR5bHd5T3Y5KzJpTndOK1JlaEQ0c2RuVXgvbFpKb00x?=
 =?utf-8?B?Ym1keUZ0WTlVZm1DRkxZNnB3U2luWGtFL1djSUJsRTl1R2N6NGRlMFMyc0d0?=
 =?utf-8?B?QzVjQWRDaUdsUWtTdUYzRUY0ZnU5ZXBBbjFkVW9CUStScFNrcFlJc3pPbGVx?=
 =?utf-8?B?bHFtNlBqaXlxSFVobW5tU0dweEFodHVZU2tGSWxmNmhzOWxHWEl3RmkyYjlu?=
 =?utf-8?Q?9y9WGpzG76iQFyEY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D124B469416B0A4ABEA9BB19A0CBCC5F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z1xJsL/jxdIOOmPhNoUdHh+wY6Ztsy64sC93lBT8ZXPz9yscM9B93EYoFv607hlrNKFmD6zwaqpJU5tCssCGKqJ6W0d8NW/bZlzUeq6uF6/oStAJRxNvLOyhPeNy3+e6PBs2ROSbU5hWIbvNH6bTQGgpYbsB9d8r6W6COJFLar2K9dHlbokilkcvEOCodWTaUOJyhPAEhZ4XlCRgBasbB0RfbNDMEOc2/DJW8l+PdRA5IeybR/wbCsDoRdZR7/su+rBzIiRKjWTMKVA5cyx0JRThZv+iaqLz3VNUU3FfO4DXZAZMvn+UpCldi38PJbQgqoNNVGo05PviI5gwJ9300A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7160.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3775686-16b4-49fa-f896-08de8c06920e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 13:41:38.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3Bdbe3a60ARKxfdjcXShWd7f7IJbQq3cupVX1g3ko6x4A7WCEdBOhlfjHBHMAilZh8g/mrO2s53+kgxX5kRFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6462
X-MTK: N
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-34273-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,mediatek.com,collabora.com,kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,mediateko365.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Deep.Pani@mediatek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A4580345898
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQW5nZWxvLA0KDQpNVDg5MDEgZG9lc24ndCB1c2UgZGV2aWNldHJlZSBmb3IgZ3BpbyBwaW4g
Y29uZmlndXJhdGlvbi4gQUNQSSBBU0wNCm1hY3JvcyBhcmUgZGVjbGFyZWQgaW4gdGhlIGRldmlj
ZSdzIF9DUlMgbWV0aG9kcyB0byBkZWZpbmUgZXhhY3QNCmNvbmZpZ3VyYXRpb24gZm9yIHRoZSBn
cGlvIHBpbnMuDQoNCldlIGhhdmUgYW5kIHdpbGwgYWx3YXlzIG1ha2Ugc3VyZSBBQ1BJIGlzIGFs
bCBnb29kIG9uIHRoaXMgcGxhdGZvcm0uDQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkRlZXAgUGFu
aQ0KDQpPbiBUaHUsIDIwMjYtMDMtMjYgYXQgMTI6MzYgKzAwMDAsIEZyZWQtV1kgQ2hlbiAo6Zmz
5aiB5a6HKSB3cm90ZToNCj4gT24gVHVlLCAyMDI1LTExLTI1IGF0IDEwOjU2ICswMTAwLCBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gPiANCj4gPiBFeHRlcm5hbCBlbWFpbCA6
IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+IHVudGls
DQo+ID4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiAN
Cj4gPiANCj4gPiBJbCAyNS8xMS8yNSAwMzozNiwgTGVpIFh1ZSBoYSBzY3JpdHRvOg0KPiA+ID4g
QWRkIG10ODkwMSBwaW5jdHJsLCBncGlvIGFuZCBlaW50IGRyaXZlciBpbXBsZW1lbnRhdGlvbi4N
Cj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVpIFh1ZSA8bGVpLnh1ZUBtZWRpYXRlay5j
b20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmln
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMTIgKw0KPiA+ID4gwqAgZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAg
MSArDQo+ID4gPiDCoCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqAgNCArDQo+ID4gPiDCoCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvbXRrLWVpbnQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSArDQo+ID4gPiDCoCBk
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDg5MDEuY8KgwqDCoMKgIHwgMTQ2MA0K
PiA+ID4gKysrKysrKysrKysNCj4gPiA+IMKgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5j
dHJsLW10ay1tdDg5MDEuaCB8IDIxMzANCj4gPiA+ICsrKysrKysrKysrKysrKysrDQo+ID4gPiDC
oCA2IGZpbGVzIGNoYW5nZWQsIDM2MDggaW5zZXJ0aW9ucygrKQ0KPiA+ID4gwqAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODkwMS5jDQo+ID4g
PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXRrLQ0KPiA+ID4gbXQ4OTAxLmgNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9LY29uZmlnDQo+ID4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9LY29uZmlnDQo+ID4gPiBpbmRleCA0ODE5NjE3ZDkzNjguLjQ4MjBhZTUxOTdhMCAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnDQo+ID4gPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ID4gQEAgLTMyMSw2ICszMjEs
MTggQEAgY29uZmlnIFBJTkNUUkxfTVQ4NTE2DQo+ID4gPiDCoMKgwqDCoMKgIGRlZmF1bHQgQVJN
NjQgJiYgQVJDSF9NRURJQVRFSw0KPiA+ID4gwqDCoMKgwqDCoCBzZWxlY3QgUElOQ1RSTF9NVEsN
Cj4gPiA+IA0KPiA+ID4gK2NvbmZpZyBQSU5DVFJMX01UODkwMQ0KPiA+ID4gK8KgwqDCoMKgIGJv
b2wgIk1lZGlhVGVrIE1UODkwMSBwaW4gY29udHJvbCINCj4gPiA+ICvCoMKgwqDCoCBkZXBlbmRz
IG9uIEFDUEkNCj4gPiA+ICvCoMKgwqDCoCBkZXBlbmRzIG9uIEFSTTY0IHx8IENPTVBJTEVfVEVT
VA0KPiA+ID4gK8KgwqDCoMKgIGRlZmF1bHQgQVJNNjQgJiYgQVJDSF9NRURJQVRFSw0KPiA+ID4g
K8KgwqDCoMKgIHNlbGVjdCBQSU5DVFJMX01US19QQVJJUw0KPiA+ID4gK8KgwqDCoMKgIGhlbHAN
Cj4gPiA+ICvCoMKgwqDCoMKgwqAgU2F5IHllcyBoZXJlIHRvIHN1cHBvcnQgcGluIGNvbnRyb2xs
ZXIgYW5kIGdwaW8gZHJpdmVyDQo+ID4gPiArwqDCoMKgwqDCoMKgIG9uIE1lZGlhVGVrIE1UODkw
MSBTb0MuDQo+ID4gPiArwqDCoMKgwqDCoMKgIEluIE1USyBwbGF0Zm9ybSwgd2Ugc3VwcG9ydCB2
aXJ0dWFsIGdwaW8gYW5kIHVzZSBpdCB0bw0KPiA+ID4gK8KgwqDCoMKgwqDCoCBtYXAgc3BlY2lm
aWMgZWludCB3aGljaCBkb2Vzbid0IGhhdmUgcmVhbCBncGlvIHBpbi4NCj4gPiA+ICsNCj4gPiA+
IMKgICMgRm9yIFBNSUMNCj4gPiA+IMKgIGNvbmZpZyBQSU5DVFJMX01UNjM5Nw0KPiA+ID4gwqDC
oMKgwqDCoCBib29sICJNZWRpYVRlayBNVDYzOTcgcGluIGNvbnRyb2wiDQo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gPiBiL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+ID4gaW5kZXggYWU3NjViZDk5OTY1Li41N2M2
OWIxZTVjMmQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFr
ZWZpbGUNCj4gPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+
ID4gQEAgLTQzLDMgKzQzLDQgQEAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MTk2KcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArPQ0KPiA+ID4gcGluY3RybC1tdDgxOTYubw0KPiA+ID4g
wqAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MzY1KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCArPSBwaW5jdHJsLW10ODM2NS5vDQo+ID4gPiDCoCBvYmotJChDT05GSUdfUElOQ1RSTF9N
VDg1MTYpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IHBpbmN0cmwtbXQ4NTE2Lm8N
Cj4gPiA+IMKgIG9iai0kKENPTkZJR19QSU5DVFJMX01UNjM5NynCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKz0gcGluY3RybC1tdDYzOTcubw0KPiA+ID4gK29iai0kKENPTkZJR19QSU5D
VFJMX01UODkwMSnCoMKgwqDCoMKgwqDCoMKgICs9IHBpbmN0cmwtbXQ4OTAxLm8NCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQuYw0KPiA+ID4gYi9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQuYw0KPiA+ID4gaW5kZXggYzhjNTA5N2Mx
MWM0Li5iNWE1YmVlYmY5Y2QgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvbXRrLWVpbnQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL210
ay1laW50LmMNCj4gPiA+IEBAIC03MSw2ICs3MSwxMCBAQCBjb25zdCB1bnNpZ25lZCBpbnQgZGVi
b3VuY2VfdGltZV9tdDY4NzhbXSA9IHsNCj4gPiA+IMKgIH07DQo+ID4gPiDCoCBFWFBPUlRfU1lN
Qk9MX0dQTChkZWJvdW5jZV90aW1lX210Njg3OCk7DQo+ID4gPiANCj4gPiA+ICtjb25zdCB1bnNp
Z25lZCBpbnQgZGVib3VuY2VfdGltZV9tdDg5MDFbXSA9IHsNCj4gPiA+ICvCoMKgwqDCoCAxNTYs
IDMxMywgNjI1LCAxMjUwLCAyMDAwMCwgNDAwMDAsIDgwMDAwLCAxNjAwMDAsIDMyMDAwMCwNCj4g
PiA+IDY0MDAwMCwgMH07DQo+ID4gPiArRVhQT1JUX1NZTUJPTF9HUEwoZGVib3VuY2VfdGltZV9t
dDg5MDEpOw0KPiA+ID4gKw0KPiA+ID4gwqAgc3RhdGljIHZvaWQgX19pb21lbSAqbXRrX2VpbnRf
Z2V0X29mZnNldChzdHJ1Y3QgbXRrX2VpbnQgKmVpbnQsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBlaW50X251bSwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5z
aWduZWQgaW50IG9mZnNldCkNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvbXRrLWVpbnQuaA0KPiA+ID4gYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVp
bnQuaA0KPiA+ID4gaW5kZXggM2NkZDZmNjMxMGNkLi4xYjE4NWY2NjBhZmYgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQuaA0KPiA+ID4gKysrIGIv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL210ay1laW50LmgNCj4gPiA+IEBAIC01Myw2ICs1Myw3
IEBAIGV4dGVybiBjb25zdCB1bnNpZ25lZCBpbnQNCj4gPiA+IGRlYm91bmNlX3RpbWVfbXQyNzAx
W107DQo+ID4gPiDCoCBleHRlcm4gY29uc3QgdW5zaWduZWQgaW50IGRlYm91bmNlX3RpbWVfbXQ2
NzY1W107DQo+ID4gPiDCoCBleHRlcm4gY29uc3QgdW5zaWduZWQgaW50IGRlYm91bmNlX3RpbWVf
bXQ2Nzk1W107DQo+ID4gPiDCoCBleHRlcm4gY29uc3QgdW5zaWduZWQgaW50IGRlYm91bmNlX3Rp
bWVfbXQ2ODc4W107DQo+ID4gPiArZXh0ZXJuIGNvbnN0IHVuc2lnbmVkIGludCBkZWJvdW5jZV90
aW1lX210ODkwMVtdOw0KPiA+ID4gDQo+ID4gPiDCoCBzdHJ1Y3QgbXRrX2VpbnQ7DQo+ID4gPiAN
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDg5
MDEuYw0KPiA+ID4gYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDg5MDEuYw0K
PiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzdk
ZWM4NWZlMjliDQo+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi9kcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdDg5MDEuYw0KPiA+ID4gQEAgLTAsMCArMSwxNDYwIEBADQo+
ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiA+ICsvKg0KPiA+
ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBNZWRpYVRlayBJbmMuDQo+ID4gPiArICoNCj4gPiA+
ICsgKi8NCj4gPiA+ICsNCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPg0KPiA+ID4gKyNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiA+ICsjaW5jbHVkZSAicGluY3RybC1tdGstbXQ4
OTAxLmgiDQo+ID4gPiArI2luY2x1ZGUgInBpbmN0cmwtcGFyaXMuaCINCj4gPiA+ICsNCj4gPiAN
Cj4gPiAuLnNuaXAuLg0KPiA+IA0KPiA+ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgbXQ4
OTAxX3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lW10gPQ0KPiA+ID4gew0KPiA+ID4gK8KgwqDC
oMKgICJpb2NmZzAiLCAiaW9jZmdfbHQyIiwgImlvY2ZnX2x0MyIsICJpb2NmZ19ydDEiLA0KPiA+
ID4gImlvY2ZnX3J0MiIsDQo+ID4gPiAiaW9jZmdfcnQzIiwNCj4gPiA+ICvCoMKgwqDCoCAiaW9j
ZmdfdHIiLCAiaW9jZmdfcnQwIiwgImlvY2ZnX2x0MSIsICJpb2NmZ19sYiIsDQo+ID4gPiAiaW9j
ZmdfcmIiLA0KPiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfZWludF9odyBtdDg5MDFfZWludF9odyA9IHsNCj4gPiA+ICvCoMKgwqDCoCAucG9ydF9tYXNr
ID0gMHhmLA0KPiA+ID4gK8KgwqDCoMKgIC5wb3J0c8KgwqDCoMKgID0gNywNCj4gPiA+ICvCoMKg
wqDCoCAuYXBfbnVtwqDCoMKgID0gMjA5LA0KPiA+ID4gK8KgwqDCoMKgIC5kYl9jbnTCoMKgwqAg
PSAzMiwNCj4gPiA+ICvCoMKgwqDCoCAuZGJfdGltZcKgwqAgPSBkZWJvdW5jZV90aW1lX210ODkw
MSwNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3Bp
bl9zb2MgbXQ4OTAxX2RhdGEgPSB7DQo+ID4gPiArwqDCoMKgwqAgLnJlZ19jYWwgPSBtdDg5MDFf
cmVnX2NhbHMsDQo+ID4gPiArwqDCoMKgwqAgLnBpbnMgPSBtdGtfcGluc19tdDg5MDEsDQo+ID4g
PiArwqDCoMKgwqAgLm5waW5zID0gQVJSQVlfU0laRShtdGtfcGluc19tdDg5MDEpLA0KPiA+ID4g
K8KgwqDCoMKgIC5uZ3JwcyA9IEFSUkFZX1NJWkUobXRrX3BpbnNfbXQ4OTAxKSwNCj4gPiA+ICvC
oMKgwqDCoCAuZWludF9odyA9ICZtdDg5MDFfZWludF9odywNCj4gPiA+ICvCoMKgwqDCoCAuZWlu
dF9waW4gPSBlaW50X3BpbnNfbXQ4OTAxLA0KPiA+ID4gK8KgwqDCoMKgIC5uZnVuY3MgPSA4LA0K
PiA+ID4gK8KgwqDCoMKgIC5ncGlvX20gPSAwLA0KPiA+ID4gK8KgwqDCoMKgIC5iYXNlX25hbWVz
ID0gbXQ4OTAxX3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lLA0KPiA+ID4gK8KgwqDCoMKgIC5u
YmFzZV9uYW1lcyA9DQo+ID4gPiBBUlJBWV9TSVpFKG10ODkwMV9waW5jdHJsX3JlZ2lzdGVyX2Jh
c2VfbmFtZSksDQo+ID4gPiArwqDCoMKgwqAgLnB1bGxfdHlwZSA9IG10ODkwMV9wdWxsX3R5cGUs
DQo+ID4gPiArwqDCoMKgwqAgLnBpbl9yc2VsID0gbXQ4OTAxX3Bpbl9yc2VsX3ZhbF9yYW5nZSwN
Cj4gPiA+ICvCoMKgwqDCoCAubnBpbl9yc2VsID0gQVJSQVlfU0laRShtdDg5MDFfcGluX3JzZWxf
dmFsX3JhbmdlKSwNCj4gPiA+IC8qbnVtc2VsKi8NCj4gPiA+ICvCoMKgwqDCoCAuYmlhc19zZXRf
Y29tYm8gPSBtdGtfcGluY29uZl9iaWFzX3NldF9jb21ibywNCj4gPiA+ICvCoMKgwqDCoCAuYmlh
c19nZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFzX2dldF9jb21ibywNCj4gPiA+ICvCoMKgwqDC
oCAuZHJpdmVfc2V0ID0gbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JldjEsDQo+ID4gPiArwqDCoMKg
wqAgLmRyaXZlX2dldCA9IG10a19waW5jb25mX2RyaXZlX2dldF9yZXYxLA0KPiA+ID4gK8KgwqDC
oMKgIC5hZHZfZHJpdmVfc2V0ID0gbXRrX3BpbmNvbmZfYWR2X2RyaXZlX3NldF9yYXcsDQo+ID4g
PiArwqDCoMKgwqAgLmFkdl9kcml2ZV9nZXQgPSBtdGtfcGluY29uZl9hZHZfZHJpdmVfZ2V0X3Jh
dywNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9k
ZXZpY2VfaWQgbXQ4OTAxX3BpbmN0cmxfYWNwaV9tYXRjaFtdID0NCj4gPiA+IHsNCj4gPiA+ICvC
oMKgwqDCoCB7Ik5WREE5MjIxIiwgKGtlcm5lbF91bG9uZ190KSZtdDg5MDFfZGF0YSB9LA0KPiA+
ID4gK8KgwqDCoMKgIHsgfQ0KPiA+ID4gK307DQo+ID4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShh
Y3BpLCBtdDg5MDFfcGluY3RybF9hY3BpX21hdGNoKTsNCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdDg5MDFfcGluY3RybF9kcml2ZXIgPSB7DQo+ID4gPiAr
wqDCoMKgwqAgLmRyaXZlciA9IHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm5h
bWUgPSAibXQ4OTAxLXBpbmN0cmwiLA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
YWNwaV9tYXRjaF90YWJsZSA9DQo+ID4gPiBBQ1BJX1BUUihtdDg5MDFfcGluY3RybF9hY3BpX21h
dGNoKSwNCj4gPiANCj4gPiBQbGVhc2UgYWxzbyBhZGQgc3VwcG9ydCBmb3IgZGV2aWNldHJlZSAt
IEkgaGF2ZSBhIGh1bmNoIChhbmQgSSdtDQo+ID4gc3VyZQ0KPiA+IHRoYXQgSSBhbQ0KPiA+IG5v
dCB0aGUgb25seSBvbmUpIHRoYXQgQUNQSSBtYXkgZ2l2ZSBzb21lIGlzc3VlcyBhdCB0aGUgZW5k
IG9mIHRoZQ0KPiA+IGRheSwgb24gQVJNNjQuDQo+ID4gDQo+ID4gT2YgY291cnNlLCBJJ2QgaG9w
ZSB0aGF0IEFDUEkgaXMgYWxsIGdvb2Qgb24gdGhpcyBwbGF0Zm9ybSwgYnV0DQo+ID4gc3RpbGwu
Li4uIDotKQ0KPiA+IA0KPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10ODkw
MV9waW5jdHJsX29mX21hdGNoW10gPSB7DQo+ID4gwqDCoMKgwqDCoMKgwqAgeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDg5MDEtcGluY3RybCIsIC5kYXRhID0NCj4gPiAmbXQ4OTAxX2RhdGEg
fSwNCj4gPiDCoMKgwqDCoMKgwqDCoCB7IC8qIHNlbnRpbmVsICovIH0NCj4gPiB9Ow0KPiA+IA0K
PiA+IMKgwqDCoMKgwqDCoMKgIC5vZl9tYXRjaF90YWJsZSA9IG10ODkwMV9waW5jdHJsX29mX21h
dGNoLA0KPiA+IA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucG0gPSBwbV9zbGVl
cF9wdHIoJm10a19wYXJpc19waW5jdHJsX3BtX29wcykNCj4gPiA+ICvCoMKgwqDCoCB9LA0KPiA+
ID4gK8KgwqDCoMKgIC5wcm9iZSA9IG10a19wYXJpc19waW5jdHJsX3Byb2JlLA0KPiA+ID4gK307
DQo+ID4gDQo+IA0KPiBIaSBEZWVwLA0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayBhbmQg
ZmVlZGJhY2sgdG8gQW5nZWxvPw0KPiANCj4gUmVnYXJkcywNCj4gRnJlZC1XWSBDaGVuDQo+IA0K
PiA+IENoZWVycywNCj4gPiBBbmdlbG8NCj4gPiANCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgaW50
IF9faW5pdCBtdDg5MDFfcGluY3RybF9pbml0KHZvaWQpDQo+ID4gPiArew0KPiA+ID4gK8KgwqDC
oMKgIHJldHVybiBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJm10ODkwMV9waW5jdHJsX2RyaXZl
cik7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gK2FyY2hfaW5pdGNhbGwobXQ4OTAxX3BpbmN0
cmxfaW5pdCk7DQo+ID4gPiArDQo+ID4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiA+ID4g
K01PRFVMRV9ERVNDUklQVElPTigiTWVkaWFUZWsgTVQ4OTAxIFBpbmN0cmwgRHJpdmVyIik7DQo+
IA0KDQo=

