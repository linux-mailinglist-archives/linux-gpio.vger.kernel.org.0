Return-Path: <linux-gpio+bounces-34208-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMA6KNcoxWkU7QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34208-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:38:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F67335522
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD0E330F4452
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B975399352;
	Thu, 26 Mar 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b+xiHEl1";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tgSq0th7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1F34CFDF;
	Thu, 26 Mar 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528413; cv=fail; b=M7hKdioCq/j0xsm84VgZYkcRjja++iyO1EZ+OOrkpJSlaWPg61W5KmaC+VdfzWQoZGgQmRZhqNSEKQ8ZF+Nt7tqkCyaXwOABArYatC0RBPTpNvOERxUPqg5JwONYdFx4texmbTIWZwzh+twcT5/kdJ9VgpGSjq6iOgNOce2X/e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528413; c=relaxed/simple;
	bh=ToyycJeMrSyYKOxSmwLTQ7GHL8OyTHhEP8aPMOvaqvo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ebbMzpZ1h9XFPVAzL4xBlnFdsjPxRTmoOJmaFVnx61Q1c7OsPzb+dqbxMsRIxDzUvDF2l/r77ijqOGs/niIpkHMeXg3k0QxccGbSK402oOLxIAMFEssYL2HvLxxot2P807YakU7SihOzAQRSUyrc2w87CXtmO7OsjSjS9mu0PYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=b+xiHEl1; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tgSq0th7; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f5cdd3b0290f11f1a02d4725871ece0b-20260326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ToyycJeMrSyYKOxSmwLTQ7GHL8OyTHhEP8aPMOvaqvo=;
	b=b+xiHEl1DwvqmyJsby3D1/kK32Z1eZtY2Xmnb+1XmyOWppKiuh6TrWoCma9/XDNnynAuKJMM6ffVJpMbaGnLTNfqxn6DuVNhM3EGjf9vi6jJy03EdWs57xWA2EsMqNTMceG2QhIrfXFJOSJR6bknjSgdLvgKinAhXlUEQXkUD2E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:24505cff-93f0-4f20-b744-ee5ebc1a016b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:8f1a2ad5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f5cdd3b0290f11f1a02d4725871ece0b-20260326
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <fred-wy.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1406478458; Thu, 26 Mar 2026 20:33:15 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 26 Mar 2026 20:33:13 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 26 Mar 2026 20:33:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjzOcrTHnrbALKOIHaEjafTWDWXu/k6GSxzCB9Uk/eFoh17Olsdu2Pig8FoTBHym8LAJQTcK21Gs6xmydmPVMyLRjp0rxnfsRCO1WehWbFWt9ekzRcupcndNQ/yUky9mmrZDEsdAyleB/wY61U8ukqXctzMp1xgaD2uF3JTih6bMcZf54TWYVfuXw2c7vWjC0rCiipR83LqoBhw2UbrVpMc26QRoMYetcunrtuPHpMNmisc+9AW/0+hmdzVbtqog14vzaUTPWh2/HlYtUYqN3Q6eokANKjwrqtmCmETvCg37jRpwYHS0BoMRRiD8s83eLMIGDnDiUoyDDtCFDsE0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToyycJeMrSyYKOxSmwLTQ7GHL8OyTHhEP8aPMOvaqvo=;
 b=o8OFnR3k11i6SrndgHL2CMnHHuzQ0zpTU48xs8lVKk+51SeGL0fqhI9EvabxtTdsKcqr8+NaPQmdS09u+qTQ6z7alouMIANLJkT8kK6OfEOGf4TNMkdY91tbK1RhfkxrgceRFQ0DZrtH1296KOa+dWKfOGoS7D34pJseMV0riQdHgxT+E4TWPLnMlzVTW0fGIsJU1xyTj2K7Azo9AUC8B5sZxIUzs4WxHfGvjqg/aItdAWI2QufoDhkCZSBEIdAwjZ9Hz5tZ3/116taeSjvtDAeiWtn+lyB9rTtr9FCJr2eyxnF32pjCuvXLMthU67237YmDNTfjBLW1YZTq/Muwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToyycJeMrSyYKOxSmwLTQ7GHL8OyTHhEP8aPMOvaqvo=;
 b=tgSq0th7vgnRl6StlETfsp1VWF35+4yV4Zad1qWUpr55CUfYpPolZJqQpc/mLv0Uu4f+9C3GS1/h3556tgh3AMvqgbuxfAvlZ3JfEdr1tRJImcSI1UaRNzJhGdTvs3E5ZEqkV4V+/zMkGYrS9ndtH7uAfE8KdI+GsBcYy2SvQfA=
Received: from SEZPR03MB6594.apcprd03.prod.outlook.com (2603:1096:101:76::11)
 by SEZPR03MB6668.apcprd03.prod.outlook.com (2603:1096:101:7f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 12:33:10 +0000
Received: from SEZPR03MB6594.apcprd03.prod.outlook.com
 ([fe80::6810:8e15:46f9:a857]) by SEZPR03MB6594.apcprd03.prod.outlook.com
 ([fe80::6810:8e15:46f9:a857%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 12:33:10 +0000
From: =?utf-8?B?RnJlZC1XWSBDaGVuICjpmbPlqIHlrocp?= <Fred-WY.Chen@mediatek.com>
To: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, Deep Pani
	<Deep.Pani@mediatek.com>, =?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?=
	<Lei.Xue@mediatek.com>, Mandeep S <Mandeep.S@mediatek.com>
CC: =?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	=?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	=?utf-8?B?WWFveSBXYW5nICjnjovnkbbnkbYp?= <ot_yaoy.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?WWUgV2FuZyAo546L5Y+2KQ==?= <ot_ye.wang@mediatek.com>,
	=?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?= <ot_shunxi.zhang@mediatek.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Thread-Topic: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Thread-Index: AQHcXbRYlgbtaZ3Ir0OupF8D0DojabUFQ3OAgLw6jIA=
Date: Thu, 26 Mar 2026 12:33:09 +0000
Message-ID: <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
	 <20251125023639.2416546-2-lei.xue@mediatek.com>
	 <aSdBt937C6Cjj_8s@black.igk.intel.com>
In-Reply-To: <aSdBt937C6Cjj_8s@black.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6594:EE_|SEZPR03MB6668:EE_
x-ms-office365-filtering-correlation-id: 4f3e4ceb-a0ac-4fad-b63b-08de8b33d6fd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: eNF1lN+Tu4YvmEBWeVPwDXBKPHbSl/NrPER5yPGedo4K+pKkQBORlJd0BQ+by4q+hoJsBgYjPXuULKEK2K5WW9oGPSdLNB+KqKkQtc3tqVUaYqOPCBcmKikK0o884owsYCITJsDzYo2Yyt2dxcrIaNmqWCLDWfiJczvcCDQcjEjixJD7vSR/FbZdxQs9Me604bk7ihv7lJQ+iXidTWSrN7FSzd71G6ieMvmyFmYcnEPSDyIJXmenrxzxBza8KQbDKK8rtFN57HNF0OXhUv7dGpD31/faTocsxU/+bIzBOUSEnn3ZY2qb3tM1Q1FZ1Hr0RnQwxTgp3b3Jwl3XY7GJ7PcWgaHFrxER00IWBJ1PcUQ6r/UuWsNfNy27RVYzPXgS8HR1aEP828kd/OMl0IrCLvP1PVkXOSI6qNjBQ3qZIztedlt75XGJy7BHwf/PQRi35o8Dv3HkR+89P64ENaDU/K+swmS6bF1nFfpbEDVN0mpgmnf6FKXk2PX8hr56dTxYIZ5m9DtTOBEeX0jTmAQ5eAMFh/qSgcRANMI8dj+3R/nvBZvmjKZpUO5cq94NAiGyDpIBeB+6LYXAMIzqkLaqcabFei19W3bc+9qvj4sJdLiBWY479mSSaAHvabLxJ/mD6HhemYCKd0X55Vz41ihAIKMjeZpsOMHXJ3YtpOadQashzQu2vAs0Sihyjyyh3kpulO+k0CbzmUFfbBzFlPqq0mUjsD/loIny0c28xDMPOKIohuEIHuzBSdi6bg8WkAw5Y3FCka4rBb4ZaC3xFOVnWZl07boi3OlcQNPYYQiJaOU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6594.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTRpSTcwSkRQYm5sRUhtcVBXWTF5ZFVZTmgvM2tUVWsyRXdzQjlFVS9MWWZ5?=
 =?utf-8?B?TzZ4amxjbzl3bCtFYVVraVJ2d3h0UW40dUtIMW5LZnUwQm9ydVY4OGJXKzZE?=
 =?utf-8?B?SHJLMXJYZU8xcUVjU1g5U0JRZUYrczNuZC82RkUzWVlCazBXeStITTJqbmhs?=
 =?utf-8?B?RGZwc3VkdE9aZUJZQ1pZdk5zdUt2a3VmekdwemxtY3RuSjVMN20va1FaSnVI?=
 =?utf-8?B?NUtRemMyUnc1d1hLMDREdUFpOW5HYlZiaWozQ2ZWKytySGgxdU94SUU4RWY0?=
 =?utf-8?B?dUp2c2FRN095K09GSmtITkNyMVpNbXNxQ0lTQmpjSG9yaG9ZVzBPNS9GNW1P?=
 =?utf-8?B?c3pmWlZIRXVUNGQycTZVaFNiTFJmSGFvZFNFaHZpbWFzd2pqOUhEZjBMUW5O?=
 =?utf-8?B?YzhOc2ZMb3JmYnp4QzlQbk1kZTBzN0xtSTQ4V0hhNXlyRHM1S3lkNmpCSFJy?=
 =?utf-8?B?ZXJ6TndRSDljUDZ5cU1kS2lQOWlVclY4bnpTQXVoUld1Z280K3Z0engzUXZz?=
 =?utf-8?B?QTNaQzRoVkF5aFJiUGdtYmo5alJ4ZjhlU0JhUDZrRE1ORG1lMVJxZUVWUUwz?=
 =?utf-8?B?N25aMTg4Q3JNYlIwNUtBTVZTR253RUtKb3R6T1QzRXdZcFk1bUI1WFF0amlF?=
 =?utf-8?B?Q25naXN4THZ1ZTl1d01xQkRVc2pBUTRsdURRZStKZktpM1oxSWRWdXpDc1VX?=
 =?utf-8?B?WlZZaWQzd2VhOUhxWUZnOGxMSHlSTXZ1MGFhT2JlQ3dxMUtFM2x5U0FpSGl5?=
 =?utf-8?B?cndoSmNpbEdNNFFJN3VLYnRlL1kzTWRCRG9TWVo2SEg5SFFGL2ZQTmp4SEg3?=
 =?utf-8?B?bFg3cGtPN3ZZU25wa2NRRThvL2hLRmd6WGJFanpWcmNWcVc0Y3VqZzROUVR5?=
 =?utf-8?B?TVJnZHZlVU8xRFlhZWRRRng1Lzg4YXRHWGVHZ2liZmJqRmNKYUo0SWtmQXRu?=
 =?utf-8?B?bGd5eGhRdktERTVaUCtlcFRWaXROVEFJLzRERDFzRVR3ZmhXRnBycWFjYnhz?=
 =?utf-8?B?TGRHY2EybW9jMm1mZ2dzTzk1bVBXVVdvRjI0NUIwdnpuOC8vZXJpOS9VTSsv?=
 =?utf-8?B?OW1yWWRTMHN2cktzTGFCYU1iVUU4RjZjL0FhckEvNEp1SnBGSzhzaXQ4alAz?=
 =?utf-8?B?WHhQc3pOS25OS2lidTRhYXN2aGt0b3F5UFRaTnJoNXBrd0J3TlZZVHdLU2w1?=
 =?utf-8?B?OGk4TllDWExqbm5CcE13VHUybld1WWUxRlFVMlBRdWI0OWlhczc5QXFnSVRN?=
 =?utf-8?B?WVdFK3pTTllwemg4RFVWSVIxaitpKzJ2RW9KS3JSVStRZVJvRCtyQVZyTVBY?=
 =?utf-8?B?WUJZM1ZOUlhHUVkxcUxVL05zbXNEMzQwOUpYcTAvTWhULzZvYzYwejhiemtF?=
 =?utf-8?B?YUUvQ0lsWnE1VFFGYkl2RXF5SkVKU0RiRDRRYW1kWXg3VkVtd256Y05iR2hI?=
 =?utf-8?B?cEVmYjhuKzFQdG9nMFk4TkZDRW0zUlpGNmtadEZvZTc2YzBiVm9WYUtxWVVn?=
 =?utf-8?B?TnlVeTl3QU5wL2lyd0htb3ZrbTl4SnlMVVNoSXdWVWI1blNvZCs5NjNKbngr?=
 =?utf-8?B?UE9laFV4TTJCUHUzRnlER2Zqc3pOYVB0U2I4cFdOeFd4dUdyWWJiWmM3YjY5?=
 =?utf-8?B?VURpWFBURERSeUhLRUV1Nnd4eVRUdnhHT2lFYldrNnRaVGN2NERSMzhkTzRm?=
 =?utf-8?B?MWpJUWg1NGxGWG9NN28yL1JBTDFtdGFER20wbVhzTGhBd3RiVjdjb2xQNkRL?=
 =?utf-8?B?NDEzaTI1ZFJ6YVpPZnNvSWdnV0VHV3pIQjRVUnhVNTBqaVd0ZFg4bFRVYzY0?=
 =?utf-8?B?cTQwbEJnN0paemw5WmhydFVhdXZVY1BQeHllS0hEVHpuYVVZVWgzV2U5UFVC?=
 =?utf-8?B?QVFCQmtnSmlMbENrZjJpVzV6c2l0bjFVRlNBeDBDa2hOMlN5Smo3RUJGc2Uy?=
 =?utf-8?B?Zm9BZGxRSnZCMlhPcUFVd053QjVzbkgyVEpBVGdqVmM1TDFiNlNXKzFKamtS?=
 =?utf-8?B?bmJTNFNtZmV4c1B4UFhaMUNibS9NeW9lTW9FZ3JPYzFnVFlucUh6eWNwNzlE?=
 =?utf-8?B?eHpVVzU0Qi9XZjJ5dDhsRlRSeTV2Tyt4SzRDYkQ4cEMrMi9aNWJGVkVpNWVu?=
 =?utf-8?B?V2tvanZrOGs2SEVyTkFESVI5V1NsUUF2d1VCU1hxOGtCR1ZQcVYvVE5ERmZm?=
 =?utf-8?B?eVVuUEwxTTd4cjFTQndEendJOVNlWVZRRjdYSzhOckpTSmhETjZWZkNNU0dp?=
 =?utf-8?B?cVppcXBYUHlGUmxOZ3JIOTRzanBjVllkRkRRVStBWkd6RXYvcG9nazIvYmxB?=
 =?utf-8?B?TzNzajliS1BGYVVIRUg4bFF3M1Nnc2FPdE1VVFRZRkJPYjZaY0U0Ykp2akYv?=
 =?utf-8?Q?e3dESi26lgACjdrY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5285922EEB97642A88CA67B80AED9AE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q8Q7p3JOWl+Al23EnCKkK/mHBp29nYde5lmQks/KJXR26aa3UZPj2JHOBfQmHAE2Dpr5v+nri5mr4CHDULDfJWL0wnbCU2dkRJ5MGSrvrBvR03vUJeXCK4QnGLwwtVjRCtrKuRhfZzlO1AfrX9V5DQ2dORnachh8kmJkOXaGqEfr0CyhHiULLj+RAJc7EGErKMaTg+7V2zUIWS++WNjFq8LFq2SjBAmyq7Im8tp6xvzGFqIcJFF48ar6EjXb5XbKrJ/Qyu6WXnFdWDeLDHVSnWppxraeCuKdrjaSVS8uO4bfPdwIJFRUNdbMyyj5lO5wAwsIR7a6Y/cWgpYXq2KJ3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6594.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3e4ceb-a0ac-4fad-b63b-08de8b33d6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 12:33:09.9584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: muLWQ7cTYSfsGMycFFDJNKeRakamgioaCl7C94m1kYpXQcRKKVDKOL1hUtmYhG0jrh3HljDKUTBlR5u/gg4jH+v8eDTPJ0uJxQRi8NrzfLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6668
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34208-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,collabora.com,vger.kernel.org,linaro.org,lists.infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mediatek.com:dkim,mediatek.com:mid,mediateko365.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Fred-WY.Chen@mediatek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 15F67335522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCAyMDI1LTExLTI2IGF0IDE5OjA2ICswMTAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFR1ZSwgTm92IDI1LCAyMDI1IGF0IDEwOjM2OjM0QU0g
KzA4MDAsIExlaSBYdWUgd3JvdGU6DQo+ID4gS2VybmVsIEdQSU8gc3Vic3lzdGVtIG1hcHBpbmcg
aGFyZHdhcmUgcGluIG51bWJlciB0byBhIGRpZmZlcmVudA0KPiA+IHJhbmdlIG9mIGdwaW8gbnVt
YmVyLiBBZGQgZ3Bpby1yYW5nZSBzdHJ1Y3R1cmUgdG8gaG9sZA0KPiA+IHRoZSBtYXBwZWQgZ3Bp
byByYW5nZSBpbiBwaW5jdHJsIGRyaXZlci4gVGhhdCBlbmFibGVzIHRoZSBrZXJuZWwNCj4gPiB0
byBzZWFyY2ggYSByYW5nZSBvZiBtYXBwZWQgZ3BpbyByYW5nZSBhZ2FpbnN0IGEgcGluY3RybCBk
ZXZpY2UuDQo+IA0KPiAuLi4NCj4gDQo+ID4gwqBzdGF0aWMgaW50IG10a19idWlsZF9ncGlvY2hp
cChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3KQ0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqAgc3RydWN0
IGdwaW9fY2hpcCAqY2hpcCA9ICZody0+Y2hpcDsNCj4gDQo+ID4gwqDCoMKgwqDCoCBpZiAocmV0
IDwgMCkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+IA0K
PiA+ICvCoMKgwqDCoCBtdGtfcGluY3RybF9ncGlvX3JhbmdlX2luaXQoaHcsIGNoaXApOw0KPiA+
ICsNCj4gPiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiANCj4gV2UgaGF2ZSBhIGNhbGxiYWNrIGZv
ciB0aGF0IGluIHN0cnVjdCBncGlvX2NoaXAuIEFueSByZWFzb24gbm90IHRvDQo+IHVzZSBpdD8N
Cj4gDQo+ID4gwqB9DQo+IA0KPiAuLi4NCj4gDQo+ID4gK8KgwqDCoMKgIHBpbmN0cmxfYWRkX2dw
aW9fcmFuZ2UoaHctPnBjdHJsLCAmaHctPnJhbmdlKTsNCj4gDQo+IE5vdCBzdXJlIGlmIHRoaXMg
aXMgbmVlZGVkLg0KPiANCg0KSGkgRGVlcCwNCg0KQ291bGQgeW91IHBsZWFzZSBjaGVjayB0aGlz
IGFuZCBmZWVkYmFjaz8NCg0KUmVnYXJkcywNCkZyZWQtV1kgQ2hlbg0KDQo+IC0tDQo+IFdpdGgg
QmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4gDQo+IA0KDQo=

