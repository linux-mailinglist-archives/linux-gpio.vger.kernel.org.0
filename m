Return-Path: <linux-gpio+bounces-34272-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GbONIaHxmlALQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34272-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:35:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6A3454C5
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B5D5300EF89
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 13:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E619831E85D;
	Fri, 27 Mar 2026 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H2jHCmQp";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="p8qe4sPo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055362EC097;
	Fri, 27 Mar 2026 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618407; cv=fail; b=X7TteAII0UhDIz8k/7+556FnkU2IkG8aizLZ3F+r2kvzHVmPufHOZao7T6D88qbQb+q9Ldh9+yiCxtfUHZqBZpKdgBHbeVG9tK4s2aSJ1FFdzzERhwmK8CcMHkaY7eJBJ7vgRrJxoK3oa62Wkl9R3c1qMPnxtEXUDUP5kSDHMos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618407; c=relaxed/simple;
	bh=2RyO3xfFnjqeyq7aoJnTvqDX7upp4FVy92MrjmOFp/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UEn+fBQsB8wKa6kfvUf4y3abpKXhnudVpmpa6+HKdkCRkg+nosiiq8s6A8/JojXa/NpsE6q7rLxUb11Bz+WfNl5EnHiqNvZDZDls4LBfBXkPH/IGgfEApjPlEyGAFG3vvMqZPZrLxLFklTKpkLJkArP3pzfx+y4Nh5rzlC5/Xso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=H2jHCmQp; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=p8qe4sPo; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 81eeddae29e111f1ae70033691e9ac7d-20260327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=2RyO3xfFnjqeyq7aoJnTvqDX7upp4FVy92MrjmOFp/E=;
	b=H2jHCmQpGgU0W8iEnjPv/1l4oFe2rbVwuZOZrhDFOMv73gvr+wQXv1u3B3iOJEcgTt2jZ8ZiFQOhaM3nJ2n1OiCDlxp9TFzYHZW9TGXVDBXvyl7GxnwtPQ4PNWqaHtaDMG4uXa/urxrv/e3vq9sOOaPAVCmfzJBhcj+JBl30Hs0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:35a14196-e080-4b1b-8d18-95e3d836de89,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:ce5835d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 81eeddae29e111f1ae70033691e9ac7d-20260327
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <deep.pani@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1525325537; Fri, 27 Mar 2026 21:33:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 21:33:13 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 27 Mar 2026 21:33:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojVIXRc7nFsRta0PNwIG/QTCAEzXKsh6cNPgE/3rbPBN1gw6hjzvqNM3dIiFuvlBjVl43GlukM+EDmC8JQDVfIcNbpQkJCZyBwjo2AIoRAtt+IXF2zxHWYb1XadvGd3fiUAioeTn7aGOgCjq/511MtYSNR1Xal1riTYlT3lmjL2ClK6uQCli8DOEA5z2V2eVmWlNAdIa0pnP1XwDCy68vjpRbUwBHDeuhCsHpWQSQTk0+hWJ36UG6pKUgR0fuM8fp8shRE0G2mM/rRw70+LO2tl4x4H6ts/qrAn7ySXjNzhIzXHEdtNpTjkEXxrwjNZzpzMFXtb8gTtLu/vex7mVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RyO3xfFnjqeyq7aoJnTvqDX7upp4FVy92MrjmOFp/E=;
 b=DRCEQZMWBdCNVdqrEYXUrKNyDrYpuPdJqs5Nhtfux20hkEilGOu453iU15q/VZ690xuXQyFzP8CeDzry4f30ZClCUb5Yz2Ls663m8hckVmtc8+bYZz5+rnbMIXQKSczgX0JUJVl8IpFt8otfFGVAO4JLxeNNaG/8kCa0OLvwdrfj4zF4eBhoAjcStyr1y+5qIP06pXHfRixgC5JFQntFNSMqroQInvXXnXmFKsjb44KdXuZDzBvtc8Z3/miV3A4DCqyK1X8K85VyK+9Q47xT/Cy0MMBAfjprhkgtxMvUFGVFqrFDy2oCrghYISZshooD3o6SZGNDgIdzw6NBwa1vYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RyO3xfFnjqeyq7aoJnTvqDX7upp4FVy92MrjmOFp/E=;
 b=p8qe4sPonN8JzEg9wkiK2KNzUrjddTLHEW/hBGsWkRuuSy0HX8JYbi1f7hm9Vb7iOn/WTwo3ntSi8p8sNZMbsjzCRfZAHWGp3aheflNCNBghztPY43csrQSZUaJtaeNBejJ9B2NU1qgoe/S3gF3eZ9B/4AzULEYF5k0YW7TGME4=
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com (2603:1096:301:118::11)
 by JH0PR03MB7379.apcprd03.prod.outlook.com (2603:1096:990:e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 13:33:10 +0000
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f]) by PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f%7]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 13:33:09 +0000
From: Deep Pani <Deep.Pani@mediatek.com>
To: =?utf-8?B?RnJlZC1XWSBDaGVuICjpmbPlqIHlrocp?= <Fred-WY.Chen@mediatek.com>,
	"andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>, Mandeep S
	<Mandeep.S@mediatek.com>
CC: =?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	=?utf-8?B?WWFveSBXYW5nICjnjovnkbbnkbYp?= <ot_yaoy.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?=
	<ot_cathy.xu@mediatek.com>, =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>, =?utf-8?B?WWUgV2FuZyAo546L5Y+2KQ==?=
	<ot_ye.wang@mediatek.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Thread-Topic: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Thread-Index: AQHcXbRYlgbtaZ3Ir0OupF8D0DojabUFQ3OAgLw6jICAAaMYgA==
Importance: high
X-Priority: 1
Date: Fri, 27 Mar 2026 13:33:09 +0000
Message-ID: <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
	 <20251125023639.2416546-2-lei.xue@mediatek.com>
	 <aSdBt937C6Cjj_8s@black.igk.intel.com>
	 <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
In-Reply-To: <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB7160:EE_|JH0PR03MB7379:EE_
x-ms-office365-filtering-correlation-id: 0e255198-111d-4771-dd49-08de8c056316
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: sVp8Q0VBLtdypftdvwsAYSqrTRI3J7Wau+eeOiuAdVXG5nbxeKqO8WvVWoEaxl8ZT6NkAO9F2oirIGZGMcaGCagT0Ro/PJHWIFiylRDUVErci9ktCMlSx2Wmf/dXCtTQU4x9AzkUXbbtopSEKc0OCtioEUApeC/NS+S+KIHqzK0DuX5sWy6QJR7uPaMTeeEvCwiXeTzAcNmycAL0fxvovP7feEdMzlD7x1/kHW71IllZxx4UrAs/Y/mEXFyWO+n6Jyw3m1xzwg/QAmTRuu6DHfyIzeCtFuaSx5sTQf0FzNkhsZS5Wd2G+fyv7x97EYOcIwVHNBgWO3YTtTzNk3mWYu/99JynYlVr6Jd9Gtt/sg+42DJYjjYdHSoPQf2/JX4m3bRmltfq3eaB1bQI46E+M9kIEzALrsj5gHM2pRJg75ZWFdUJy+U3V/2lFxxRX4ephwk401MwWUbJSHW9nW76dHjotJBAWSsqzcalTBg8BibKKSWgj6Ru4ZsYLhD/gI7bqolnHHZZ3Wv9qritnr8ZdFbnJd35U65F7alt1hL4YkAmSQXYqGruM/WbpgyebOywDFAGK/YPuWaNWioF4EnRzxjrNYa4NSf8Lm8/NKxlYtQOMeKhLaN5wDTstV1/qhDy/S73GhBisfVtYFuPsLfJYwpvJAyyU5S65jvKKcs6EyKclgQYAFPI71Ju6H8ddjF324pTr+5gunLkSaDvsQlCgMY/h4lRwliNT4TACM8ZMXxUgpztd81FY+ExCz9/rLF4cKV1UsyQEY5LcjPSLTDlos/2zDKY/lT3qsjXaCNXlrY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7160.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SytWVXlZMFFsclJzUTVJcWRnSWxDS1Nrb0JMdTdnUzBhb2hxV0FJWm11SGpT?=
 =?utf-8?B?d0VqaTJnL29Iajh5V2F5UE1vaTM4Y05TZG5hckhHTjRtTDE2bkdZcmRROUg1?=
 =?utf-8?B?UEpFekx3Zk1sR0ZvcWFuRmhMZ1dmL2lBNGVxckFrNTk1YmowdGlvWURzZXM0?=
 =?utf-8?B?WEZqcUpaNWpXNk10WkxaN2J1QlhRK0dleHdXQUNFdmVlUWdYdEl0VzRHQnBW?=
 =?utf-8?B?YlA1SW02c2p4cUt6SHBYMWJLb3JFWUs4NEoweG92NUJnWlBvS2syVHp5RVFI?=
 =?utf-8?B?SFFNOEhsMmJBWVFVSm85eWxlQXFuK0tXejFRZXBHTTk1K2N1anlsdmRlQzVw?=
 =?utf-8?B?ZmpHVGxOeURtRXhTR1p1NE5nT1ZiUDRTZUpjZVZFdmx3Zis0czlyMDU1Q25Y?=
 =?utf-8?B?Ny9Bd25WRVEzRExzUTVhK2lWYzJERmZHZ1dKNGg0eXJOZGt3bVFiMG4rR0NG?=
 =?utf-8?B?dWZZR1kzQk5YbnRlQlI2SWdFUExKaElZR0dCckF1OFo0endTckZjNUExUGVK?=
 =?utf-8?B?b2tZTWhMQ1l3UGR0aXdmMjBjM2kwa3NLc1c5ek11MTBuaC9iK2lIMnY1dENq?=
 =?utf-8?B?UmFabWp3QW9MdCtOam50dFYzMjdLVXZhVVJoYWkrOVUxMGNtUzU0MEhoOTV2?=
 =?utf-8?B?ano1TWJCcEh4MCtYbkVUSC8rYm9ER29RTnM1elUrTDVUUklQZFZDQTBRWjNj?=
 =?utf-8?B?L0NUVFRJaWppZlEzdFVWU2NWazJCbE9EdmZ3cFhSRUFMN3FXek9Ycjc5V3lh?=
 =?utf-8?B?K1VhZmxPc0xSWTQwbGhJTzg2NUZkUEdwZFhVZng5aVhCVFV1RUpUZkFBaWQx?=
 =?utf-8?B?Z2YwSndTSVh6WFNZK3dtL2IzWDl1NmJuMEhuS3M2eEU2YkFqWmo4V3VuVFhD?=
 =?utf-8?B?Ny9Ha2x5MU9pQzg4dWl0MWYxQnplNHcwbG5MY0RIdGl5RzBpSTVENjlMaUlU?=
 =?utf-8?B?c3ZZK21pRklKQnJ0eE02Q0JjK1BCdTNmd2o2cFdTeVpTTFg5bDRZaHZWYVpV?=
 =?utf-8?B?UmZTR20zM3FrVHg0cGdwb0sxTkxscEVwaDdGVktSUEoxQlJGVU8za1NJalNK?=
 =?utf-8?B?UXQ5dnd1UnJwT0wwTjVya2pqaUhjRlJrRVp0dUNPWlVVNEwyWFRISzJ2aVVC?=
 =?utf-8?B?R0pRb05KZDkzRG5lekZGbnNyc25jcGZpTEZ3bGpiUEV6UURWN0Q4SU1vWEhD?=
 =?utf-8?B?aDU4eGJEaG9WaFEyVk1YenRrZnZjNFRlYkVKNWNwU3FacDc0U2NzNEFyd3R1?=
 =?utf-8?B?VUpGVStSRWRDS1B0TEtteGxLaTR5b0V4QTcrV1U3OUdYVHE3aVZ2b2VjS2lK?=
 =?utf-8?B?MGhqaHhPVEp6QzFReDlhNE1FKzVDQzN4YWxVMndCQUZPVWd1N085ejIrRXE0?=
 =?utf-8?B?Z3Fla00yL29MZHA1SHFYMWpKS2x3Z3RLcSs5RUdBMTNHK1JHekk1OHB3NWdT?=
 =?utf-8?B?UEduTk1LdFYxME9EdnBUdTB5Z00xamJFQ1JUU21DamRmKzZqUjYyYUh0ZkVN?=
 =?utf-8?B?UmlHSUZ0Tzh0UUNrZHhoV2VkbnB5UGptVkprSUNsL08rMmRXVzJPL1BUdGpU?=
 =?utf-8?B?elFDcXlVOHlTRFpaY2R3Yk1iYXJJbys4VERSWHRXY3dyZGxDRDhKelIwTldw?=
 =?utf-8?B?WVZEdnVNbWp4OURDT0N6SUhNekhVRTBWODBuR29NRXFhYkd5YWxjZFFRd3Z0?=
 =?utf-8?B?YmRIQmRsckt1eUhKeTZldnZkSEhSV3lBcnVkbEpWOEN2NU9tdkdpaEFxS1RK?=
 =?utf-8?B?MVMwVHRsNjhyWWsremNVSmhvaDZjWjJtdldaeDMxakZtME1PVkE5SG9hWElG?=
 =?utf-8?B?dWVzS1ptMXpBci9Dczg4RXFzWnFYWXk4Ly9ENG8vcDdua0FlQWlobUtMeXVQ?=
 =?utf-8?B?N0o2QzNPUWNRd1BLbm12T3M5aXpuVys4MDB0dmVhNnJhRGx5Y3JEUWdVUHZw?=
 =?utf-8?B?ZGsweUN0R3pMN2RKZkQ4WEpCTDNXWFUzaGNwUUpiQ3FuMnV3SGF3UVI1Q1oz?=
 =?utf-8?B?UDBIcXRCMGJUWmUrTGUxcGlNemh0RUdmaE9vY2tzVkhCNnpBeW1scDdTMzI1?=
 =?utf-8?B?VzhsMjk0blAwaDBKc1Q1QUZVTVJSdFBoNjRYeVZWdUloT0FOUmpHQ01vMlBN?=
 =?utf-8?B?VXQ2YU1SWHBBUUdxWHdkcmQvdmZ6Y3Vza0h3VVZydXQ5akhwWHdvR3RrSFhB?=
 =?utf-8?B?Z2NSalFoYUxEKzRRRVk3ME5PL3d6cVFKUDIyc3NoM0MyNmNmRDZlSzg0cUtP?=
 =?utf-8?B?dzZ2cW1hWnpoNUltZkt1Z0tzcnczWnlPbDRBc05HZVBiR1ROeWkxV0ZxTVdt?=
 =?utf-8?B?Vm53ZjVDQnZDSmp1a2F1UG1kekVZeU5pbFl6eW4xNzhFeXNYTk9rUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95B630683ED70244ABB5BCEA7D13CBC5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O18nfLhxcTszDxys6LCWiAEA3fzo+Mc8yKrkZWimS8EGs0mRZOhP+pQTlv2fnD6VFhTghbMnZgr3ek4kcP+pGrWW+fuWM9qaMOSwRdQfptcanctx6JeK0oH/IZcekqBue+RkaTUvEY9tanq0IAMDnIQ+pHW1+RIqOGXzptCF20p9IlITrnAegWnDuvUOddyrL/PmsbJkh8Z6zgSa/guUJKPj84hEEJEvTeYEsc0l9z/BCkkqchxEddjPE5KqU8n9W4EclI21x3iOgpmjFdXxEjUt/UTCq82GoKAWCUbCXZWvs1JwNDY6bQ4RJj1JSwGk8Q0ia+HFXPCSNWScrS8QsQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7160.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e255198-111d-4771-dd49-08de8c056316
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 13:33:09.8194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aleeNl1JOW69fYPCbIm5Dq0ynXG9zTvrGCpOD/SM/DZqcBAYEaq7bWCmTVJAYowdwS/iyvZGuOMDXeMH+iofNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7379
X-MTK: N
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,collabora.com,vger.kernel.org,linaro.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34272-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_X_PRIO_ONE(0.00)[1];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Deep.Pani@mediatek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4DE6A3454C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQW5keSwNCg0KWW91IG1lYW4gZ3Bpb2NoaXBfYWRkX3Bpbl9yYW5nZSgpLCBjb3JyZWN0Pw0K
DQpJSVJDLCB0aGF0IGFkZHMgdG8gZ3Bpb2NoaXAncyByYW5nZSwgbm90IHRoZSByYW5nZSB3ZSBh
cmUgdXNpbmcgZm9yIG91cg0KcGluY3RybCBkcml2ZXIuIA0KDQpUaGUgcmFuZ2Ugd2UgYXJlIHV0
aWxpemluZyBpbnNpZGUgb3VyIGhhcmR3YXJlIGlzIG9mIHRoZSB0eXBlIHN0cnVjdA0KcGluY3Ry
bF9ncGlvX3JhbmdlLiBUaGVyZSBpcyBubyBjYWxsYmFjayBpbiBncGlvY2hpcCB0aGF0IGhhbmRs
ZXMgdGhpcw0KdHlwZSBvZiByYW5nZQ0KDQpJIGFsc28gcmVjYWxsIHRoYXQgZ3Bpb2NoaXBfYWRk
X2RhdGEoKSBkb2Vzbid0IGluaXRpYWxpemUgdGhlIGh3IGJ1dA0KcmF0aGVyIGluaXRpYWxpemVz
IHRoZSBncGlvY2hpcCBmcm9tIHRoZSBodyBkYXRhIHdlIHdpbGwgcHJvdmlkZSBpbg0KbXRrX2J1
aWxkX2dwaW9jaGlwKCkuIFRodXMgIHdlIG5lZWQgYSBmdW5jdGlvbiB3aGljaCB3aWxsIGhlbHAN
CmluaXRpYWxpemUgdGhlIHBpbmN0cmxfZ3Bpb19yYW5nZSBpbnNpZGUgb3VyIHBpbmN0cmwgZHJp
dmVyIHN0cnVjdHVyZS4NClRoaXMgaXMgd2h5IHdlIG1ha2UgdGhlIG10a19waW5jdHJsX2dwaW9f
cmFuZ2VfaW5pdCBmdW5jdGlvbiBoZXJlLg0KDQpGb3IgdGhlIHNlY29uZCBxdWVzdGlvbiwgd2Ug
YXJlIGtlZXBpbmcgaXQgYmVjYXVzZSBiZWZvcmUgQUNQSSBpcw0KaW52b2tlZCB3ZSBzdGlsbCBu
ZWVkIHNvbWUgb3RoZXIgcGlucyB0byBiZSBjb25maWd1cmVkLCBlc3BlY2lhbGx5IGlmDQpkaWZm
ZXJlbnQgcGlucyBoYXZlIGRpZmZlcmVudCBzdHlsZXMgb2YgcHVsbCBjb25maWd1cmF0aW9uLiBU
aGUgbWV0aG9kDQp3ZSB1c2UgaXMgdG8gZGVmaW5lIHRob3NlIGNvbmZpZ3VyYXRpb25zIGluIHRo
ZSBwaW5jdHJsLW10ODkwMS5jIGZpbGUNCndoaWNoIGRldGVybWluZXMgdGhlIGdwaW8gcmFuZ2Vz
IGFuZCBtYXBzIHBpbmN0cmwgZGV2aWNlIHRvIGFjcGksIG9uZQ0Kc2V0IG9mIGdwaW8gcmFuZ2Vz
IHBlciBjb25maWd1cmF0aW9uLCBmb3IgZGlmZmVyZW50IHR5cGUgb2YgcHVsbA0KY29uZmlndXJh
dGlvbnMgd2UgaGF2ZSBkaWZmZXJlbnQgZ3BpbyByYW5nZXMsIHRoaXMgY2FsbGJhY2sgaGVscHMg
YWRkDQp0aGVtIGludG8gdGhlIHBpbmN0cmwgc3Vic3lzdGVtIHN1Y2ggdGhhdCBvdGhlciBkZXZp
Y2UgbWFpbnRhaW5lcnMgY2FuDQplYXNpbHkgbGV2ZXJhZ2UgdGhhdCBzdWJzeXN0ZW0gdG8gYWRk
IHRoZWlyIHJlc291cmNlcyBpbiB0aGVpciBfQ1JTDQpjYWxscyB1c2luZyB0aGUgY29tbW9uIGlu
dGVyZmFjZXMuIA0KDQpUaHVzIHdlIG5lZWQgdG8ga2VlcCBib3RoIHRoZSBmdW5jdGlvbnMuDQoN
ClRoYW5rcyBhbmQgUmVnYXJkcywNCkRlZXAgUGFuaQ0KDQoNCg0KT24gVGh1LCAyMDI2LTAzLTI2
IGF0IDEyOjMzICswMDAwLCBGcmVkLVdZIENoZW4gKOmZs+WogeWuhykgd3JvdGU6DQo+IE9uIFdl
ZCwgMjAyNS0xMS0yNiBhdCAxOTowNiArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+
IA0KPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzDQo+ID4gdW50aWwNCj4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lg0KPiA+IA0KPiA+IA0KPiA+IE9uIFR1ZSwgTm92IDI1LCAyMDI1IGF0
IDEwOjM2OjM0QU0gKzA4MDAsIExlaSBYdWUgd3JvdGU6DQo+ID4gPiBLZXJuZWwgR1BJTyBzdWJz
eXN0ZW0gbWFwcGluZyBoYXJkd2FyZSBwaW4gbnVtYmVyIHRvIGEgZGlmZmVyZW50DQo+ID4gPiBy
YW5nZSBvZiBncGlvIG51bWJlci4gQWRkIGdwaW8tcmFuZ2Ugc3RydWN0dXJlIHRvIGhvbGQNCj4g
PiA+IHRoZSBtYXBwZWQgZ3BpbyByYW5nZSBpbiBwaW5jdHJsIGRyaXZlci4gVGhhdCBlbmFibGVz
IHRoZSBrZXJuZWwNCj4gPiA+IHRvIHNlYXJjaCBhIHJhbmdlIG9mIG1hcHBlZCBncGlvIHJhbmdl
IGFnYWluc3QgYSBwaW5jdHJsIGRldmljZS4NCj4gPiANCj4gPiAuLi4NCj4gPiANCj4gPiA+IMKg
c3RhdGljIGludCBtdGtfYnVpbGRfZ3Bpb2NoaXAoc3RydWN0IG10a19waW5jdHJsICpodykNCj4g
PiA+IMKgew0KPiA+ID4gwqDCoMKgwqDCoCBzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwID0gJmh3LT5j
aGlwOw0KPiA+IA0KPiA+ID4gwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+ID4gPiANCj4gPiA+ICvCoMKgwqDCoCBt
dGtfcGluY3RybF9ncGlvX3JhbmdlX2luaXQoaHcsIGNoaXApOw0KPiA+ID4gKw0KPiA+ID4gwqDC
oMKgwqDCoCByZXR1cm4gMDsNCj4gPiANCj4gPiBXZSBoYXZlIGEgY2FsbGJhY2sgZm9yIHRoYXQg
aW4gc3RydWN0IGdwaW9fY2hpcC4gQW55IHJlYXNvbiBub3QgdG8NCj4gPiB1c2UgaXQ/DQo+ID4g
DQo+ID4gPiDCoH0NCj4gPiANCj4gPiAuLi4NCj4gPiANCj4gPiA+ICvCoMKgwqDCoCBwaW5jdHJs
X2FkZF9ncGlvX3JhbmdlKGh3LT5wY3RybCwgJmh3LT5yYW5nZSk7DQo+ID4gDQo+ID4gTm90IHN1
cmUgaWYgdGhpcyBpcyBuZWVkZWQuDQo+ID4gDQo+IA0KPiBIaSBEZWVwLA0KPiANCj4gQ291bGQg
eW91IHBsZWFzZSBjaGVjayB0aGlzIGFuZCBmZWVkYmFjaz8NCj4gDQo+IFJlZ2FyZHMsDQo+IEZy
ZWQtV1kgQ2hlbg0KPiANCj4gPiAtLQ0KPiA+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiA+IEFuZHkg
U2hldmNoZW5rbw0KPiA+IA0KPiA+IA0KPiANCg0K

