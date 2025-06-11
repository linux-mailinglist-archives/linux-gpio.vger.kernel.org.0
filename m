Return-Path: <linux-gpio+bounces-21388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDF5AD5672
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8EB5163EE5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A0B273D6D;
	Wed, 11 Jun 2025 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b+n82pnV";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="b1CxA3yk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741BF2874E4;
	Wed, 11 Jun 2025 13:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647142; cv=fail; b=VE5zbIux6Wc6TYOqQHd0nRd6YumobBDs+allUnG7Ukfav9RabLVYRBi2k7b4ulvE4qnXyC7CxOkUUUm3S+94w2f+M3ZJoOWKofH/FoODkO3b7D4rqokCqMBUs3iMtCYSoaVF/y8lmIBMDo83bf4sHeyBmXhkZgfqQk6iP7cLENU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647142; c=relaxed/simple;
	bh=XYnRJEcEKhrKY5Zx3DZHwDP8JduFSaE386c7Xmrniuw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ixHMsue8u0O9RVzqWcVsRd8LoiMLrAdNAxuQDq+Ya2lXW0+9yHcWHdgkx8/i6a0xYX41josa9dQRthtW4zn+yWFAJJ8ONrGX1Qmrdho0duWGl+zVh0lEImuSrAqCP3ELfgaF68Qlhh+pXTL+V31hL0waaK4AJ7QpjzscU9n+7zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=b+n82pnV; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=b1CxA3yk; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: bf1c8e0c46c411f0b910cdf5d4d8066a-20250611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XYnRJEcEKhrKY5Zx3DZHwDP8JduFSaE386c7Xmrniuw=;
	b=b+n82pnVkDRYR6xI6/OEBbH2dGnR6l+mAVYAhAZYkK35mP5512ysywsCjVWYWphsG9JECvDEwYXGhTHmyqFAfVpCQ8FWUt7bZijK9cPoap5zL9SFNnr3nFaRW0tTvLJQiNitENJG3AbrTIA457Nu1JxG/t0wf8r6EBNIIhqRT4E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:f5604bf2-6b06-4ed1-9156-57f1a2c9ad96,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:23e65828-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf1c8e0c46c411f0b910cdf5d4d8066a-20250611
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1281612617; Wed, 11 Jun 2025 21:05:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 11 Jun 2025 21:05:26 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 11 Jun 2025 21:05:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SARDlbZ86g1pdCCT6SUOD8pksiKT51tH2BULctETQ3Wuk/Shc7AR7QqVeqMIEcUh114y8C5yx03eUUEjXdagb1Z0qAhOEij4UCq42iHJQ6NUuWaJ+DZWblHytjIoT37jqFgXKnwm6apiWrSd6gc4zJKuxEA8pEceZ20bXSL/11L6zZ8nwHkT88oNx8KXPw+mgQT4QpfX1m0Ek3pTYDw4oXmFFluc14WcTJPOekCAndKpYeSFeDkYrklWPGPbAqUvwEirbx1dI1pJh07x+Rmwv8pFbWeJsvwPyhJu8Vr1h8A8fB85skaisuMrhmZ2nfgx+ukcD6F6GBYgcVudVKswig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYnRJEcEKhrKY5Zx3DZHwDP8JduFSaE386c7Xmrniuw=;
 b=vtMj+xj21hyka5JOIc909pFolJnFWCV5Dli7oc7woCrcTFYrGt/dovqHIMpUEcPSbL70sca+d4UaVi6P6V8LXW34lMpBPJ6UJoOy9WC0cmQ2IInZ1RrdkCXqGHBPw5M6CWC4nG7T3Xc44Od6E6M3clzJ+2HKtV6Z8d7Gm22qFhesYUsYAgcr5aLyvrqwnhXFER0oTN3a/OkAcnQsPaOEIukOdUHE0AHjcse8X5nOCx4Cc5UyXoOfz7XGG/iUT0m+yGwMcjdur6PPmI1vfY29JE/jYez5RTKIRTiyqw4PBSL9bcDAvZZfsGltFAonwWu7t3dUWT9pa+ZmH5D3rBv16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYnRJEcEKhrKY5Zx3DZHwDP8JduFSaE386c7Xmrniuw=;
 b=b1CxA3ykDl9XUCyRE8q2yQAJrlvfnQT6zS4PIUPr7Rma80hQQDsKSk8A5Pb38Reue8fN4Htu/HVLkliKecwiUirgZbBzWQk9Axpw/+FlAs6rv+kkpfMj7YqecbTCsACS20rFmEErqTggy2qXwE7yhUzpGiD2mEPD8acUR/5JL7o=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by TY0PR03MB6583.apcprd03.prod.outlook.com (2603:1096:400:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 11 Jun
 2025 13:05:23 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8792.034; Wed, 11 Jun 2025
 13:05:23 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "tiwai@suse.com" <tiwai@suse.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "krzk@kernel.org"
	<krzk@kernel.org>, "perex@perex.cz" <perex@perex.cz>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"robh@kernel.org" <robh@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Thread-Topic: [PATCH v3 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Thread-Index: AQHbxKgldFlQJpkhMUWGq86WL79BDLPR870AgCvqloCAADtWAA==
Date: Wed, 11 Jun 2025 13:05:23 +0000
Message-ID: <9f22c7b26b389303f1a6748788428515bb00744c.camel@mediatek.com>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
	 <20250514081125.24475-9-darren.ye@mediatek.com>
	 <e74d82b3-ed4a-433b-9305-a80b68130a6f@kernel.org>
	 <d08cb08c-4bdd-4715-8273-9feb7de7474b@kernel.org>
In-Reply-To: <d08cb08c-4bdd-4715-8273-9feb7de7474b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|TY0PR03MB6583:EE_
x-ms-office365-filtering-correlation-id: a9fe3dc4-a8a3-4ee1-a38e-08dda8e8a06f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aGtub1BCMzBFOFp6ZnNXTFFyNEQzNkJIbVJPVjFsL09qamxJNzRFQTdLVkJ4?=
 =?utf-8?B?QXFSd1JRcUlWTGZidzBWZlo2a3NKZWx4T0t1RjB0WEFDbXI5b2t3R2lXWmFD?=
 =?utf-8?B?Q2ZqaHFVVjhkMlpJYm1qRWxVRzNuTHJXZ2x6eEo2UU1GVFFmUFB5YTdEWHlj?=
 =?utf-8?B?QWNSaXI3MCtHblJ3SWZCM2ZqS2ZhL2gvSTg5d09xYkdoZ2hvcFp0RHVtRzZ3?=
 =?utf-8?B?dFRlRzJ1TXM1UGdDL2kzbzlnMkdjeHhZVFloc3p3bllwQWtXYk44ck5DMDFm?=
 =?utf-8?B?MlBZUFZ1bE1tUWZvU2VGbGRUK3ZMN1oyTGFFRUVNQzFoVGNaQ2ZYL1JMWmFJ?=
 =?utf-8?B?emNWS0Jma1FzWG80MGdYZmE3NFlOUFlNS2pkeWIrdWliQjd1d1VDVVgrK0dw?=
 =?utf-8?B?WjFLZzB5VU56eXdlaTIvbWlMS0VoclhBb29jWjMvaDk5N2IyZGhTR21WVmxD?=
 =?utf-8?B?Vnd4Q2xTNVIraEZ6TW9LTzlPQ0NRODJNanFDYmxvSklMMFRWOXp1Y1luWWVx?=
 =?utf-8?B?Y25MUVdmSGh2dlBic0tUMnJ1RDJUanNJNWFTbk9oUU5aekJsajYrVXJMRlhv?=
 =?utf-8?B?ZkdOV1RydjdLVDhrVHc4UzhLYnZ6ZHErbzJ0Tmx2V3VrNTdNTitZYmp3MkhH?=
 =?utf-8?B?blVreTcvV2FMMndiTk8wVUlCYTFHSFhQb05RY0IyZDRwSkhrV0pRK003ZmNJ?=
 =?utf-8?B?UjJwV2MxZEY2SEhUTnRRTFdDWHZvdWIzWU15Q0xDditXWGNCejZrODBpcG8x?=
 =?utf-8?B?dWFsbmZudEtQMXFuazFwRWI2dlhSbjhhZU93TFFxdnRFZDhWSFVnOEFmTEdO?=
 =?utf-8?B?aWhZUjNhaks0TS9OaWRGQ1FjNWJrWGZtUmFWRXpsaGdzbnduN3pmR1RKOENk?=
 =?utf-8?B?ZEhiNmZrdm9ka2xGYWZhKzJRQldlRitnTyt1MENUbVNMNmhWQm1xdTVvZXBE?=
 =?utf-8?B?WUJmMlBNa0p4ZHhCL3hBbUp5NVZUc2ZRUUVGMWE0T3J5S24wdS9WMGNYUFA5?=
 =?utf-8?B?cWJEUTkrUENyQ0xnWUdXbU1RMzVyaHVxcnZ0UmM0RGtqWTZ1eWtTeXkvOE1M?=
 =?utf-8?B?dFR6cEJxVzJuWm9MMGNnYUJhQm9KMllkakRjaGNUYXEyNS94Ulc2d3lDV21X?=
 =?utf-8?B?djVHQ1lXYS9kQzZEWFRGbDAzWk5wVGdKZzVreUFrcEpnMWxNS1JCSkV3UjV1?=
 =?utf-8?B?NTJFcm53WUpXN2NkTWc2aUg3dHJPNFlqUlM2cWlTaVJFVjVaUUQyN1drcC84?=
 =?utf-8?B?Qlp4ajNvYWRZZnFKUVd2QjJvYndGKytvcUg2c25teVFsa1p2YjQvRTdRVk44?=
 =?utf-8?B?Ym1UUGo5OW9lN0MxZDE5dXFuRVhWZkFvQWlSOVR0aTk0cGh4L05yRFpqWk50?=
 =?utf-8?B?TWVjemQ5Ujh0VjZ2cDgrSDJnT1dEdW9QQm8xQXFZWU14YURxWVJwU2oyd08y?=
 =?utf-8?B?Rm41RWhRdUVUTzd6WXdONnNGRHN5TzZTYy82MU55MUNZK3NqeXI3cm1kaWox?=
 =?utf-8?B?OE9YaGsvSVhHTXEwK0xEVlFCb0kvcENZSTZKR24yUVlLWVkwSHQ4dCtmbkVQ?=
 =?utf-8?B?OFFpcnVKRFVzRmpSWnhPeUI3dHZvQ3RwdmFpZUZ1TWc5bi83ODR5QTU2cXB6?=
 =?utf-8?B?U1dmaXI1SHBWMUlOUS9CTnk1dUt6bEd1RjZKRngyZTBndGRXYzkvUHU1bnZ3?=
 =?utf-8?B?eTJKczZMVnVvUVhkdFJGelFDSUlCV0hxeHdMTVpLZHlGZ0F2cGljYWdGcElh?=
 =?utf-8?B?djU2dERKSTlibUt6cTBRRzNJMW82elFRRjJYZTVFMk5GWTd0OVh1NW1xUWVI?=
 =?utf-8?B?K2dXU0k3ajVaRC9oTzZuOWtBRlNuZTk4VlRhdFU4UStxaUZLTkl0OWM5UWVX?=
 =?utf-8?B?L1EvSVBwUTFuTTRhMWQ1Q1N0YUYrU2VROW0rNFZ6ZlBhNHZGcVhQck11QXhH?=
 =?utf-8?Q?3q4EaPtj2oKnQcEeupvJxNsY31xQEvD3?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vi9SelAxR1d5Q1pQQkl5cXNnL2grdjViL1d4RERFbHJGRFNIdDBrWDVnTnZ0?=
 =?utf-8?B?bzFYdDhIbDFBSkgrOGNkb2dNMU80RkxtRjdTdmQ3S2JmdThMS0NhR3FLTDV0?=
 =?utf-8?B?TFZEa1J2VGVSOE83bEoyZHdOUTVJM2ZvVkJKdWhNVnM5aGsrMm9DRUJzbFEr?=
 =?utf-8?B?TDBCR2RHaXFNd3hadHNWcktZWEdiUE84NlpEeER0aG4vckpwQ3JBYzNQb2hs?=
 =?utf-8?B?dE9TUlgzRWZZUDFzZTFxYnJPczhGdjNSRlNpK1RwRTNwT3JURmRaUk1iNUZF?=
 =?utf-8?B?VlhwNWhiWmEvQzQzaDM4ajlwcXBHRng0YXFIdjVsNXc3VHE0eGxlN1J6elIx?=
 =?utf-8?B?cnZobFNiUFhjck1VeFRUb2t1TXFaRHpkSG01U0xOTndxaEExYXFaZi9lSVB0?=
 =?utf-8?B?VlY5cUpIWkEya2E2WDVyRjFSTEpldk5PTzhoM3hCMktEVk5XRHBHM2o4dVZZ?=
 =?utf-8?B?MnBJUG1helBIa2ZlamVzbG5mZEhpQjd6TVF5RlFtdERRamFIL1I0WGdRY0FY?=
 =?utf-8?B?RVBneFJpdVllOWZlSTBKZDQzSk5FaS9kVUx5VFZrTnpZbDNOUXF0SmgrVktE?=
 =?utf-8?B?TDREUmtjeUpmTGkzSmhCT1RzTlh5RFk3cVRZV0FESU1abVNPWVZ0Q2hUZzNp?=
 =?utf-8?B?cFFsSytoKzV4WHR3OG1BbmZsOWphUmluYlpncFk2dnRReXo3NFRjZndsVThv?=
 =?utf-8?B?Y1dFWW1saitobmxUYk1CY0dMU2E1SDV4ampJM1cyWDlUckk0WU9uRjhRRW52?=
 =?utf-8?B?ajVreHl6aW5MamtjMG0yOGVWVlVxSTFzdC9VTmN0SkYvYm9uaDlDT09YcGdq?=
 =?utf-8?B?QkZjcFRoUnNnbS9vYThDelhTWlA5MytnaWpaaThCSXJMeGU0Tk5DSDB6bGpl?=
 =?utf-8?B?RDBBOGZKdjlmWW90OVM0d0Jvd1pTVGNxVkxtRExxUlJxMFQyeGY4dUhETmhl?=
 =?utf-8?B?RzU4aUNEZE9EYVE0NklHSUpUdFJXNU9VNEtSSlpjWnJIZFJlSFhkL1VXSUZh?=
 =?utf-8?B?VExRQkFSS0JVTVpLejRaQWc4SE5pNzFDSXZ6emNSZTJCVjdZeWowVDRMSTBp?=
 =?utf-8?B?ZDd1d29sUTdHOFAzWWlXcDNubWxWeWVjL01LdkI3QlBoKzRDOS8wckljZ1pJ?=
 =?utf-8?B?czZIanFqZzBPbHZTQk9CSUJ3OXVBeVk3UC9CdWpIREx5ZTU4ZFNJY0JFTmhJ?=
 =?utf-8?B?OCtlL1FBZVJNeVhrdFFNc0RFYVBCVlUramNSMDVKVDQ5US9iaVdvVVVKb1Jm?=
 =?utf-8?B?U2svUWRycE1sWlpiMTlSN0J1S2t4ZzVRVWdxY0NaeGhGNk9qaUNHZXhyR3Jh?=
 =?utf-8?B?VHVZdUlPdkZUS0YwUUI0bzF6ajBkbXljZFhDYlNTQm5YSXVGdWtUanJmS3FQ?=
 =?utf-8?B?VHlvOWtJdUdoNGVHbGx1WWNzV2h4YmlkbTIyYWxyK1lRN1l6RlREZXNHeXJR?=
 =?utf-8?B?enIvQmx0bWdHdFM5NC9UZHZ2Y2w0RFczZE9vdGk0TG5haFRnTVcvbm92dFRM?=
 =?utf-8?B?WEJ0aTBxdE9zQ01vaFFjNWNVTHp2RGhlUzh2MlpOK1hoWjdwcnFUN3dFc0tC?=
 =?utf-8?B?bnlYa1dvbHBYZzlRV3Q0cTBuZzhNV1lTZjlORGJtRHBWcHhnS1Y1bjYwQW9u?=
 =?utf-8?B?K29ZbDhZTjEvSXpMd3daRWJBcDBBVmU0Qmd6MW5ZSkNZMnVHOEFuTzdYaDVo?=
 =?utf-8?B?b29Zekl4ZkVNZEUwVEdYaHJzNGU4MFpGb0dLNUVrS2cyalVRR2JEQ3VMVlR3?=
 =?utf-8?B?T3kyK2lvQkpYalhTVGtNMlpXRnZqdzhaOWEvVms2TjJlRC95dTVCQUdGUHFv?=
 =?utf-8?B?ZDdTS3hGL3RHa3diM1RFRGRFTEJqTjY2MC9FNjNFNWpNeHQvWVVPVnN0UTJ0?=
 =?utf-8?B?d1VBUXBXdHRidExGdi9nTzVoNWdqYmNKVkhldEhQQWtPQVR2T3V6UkdMdXp5?=
 =?utf-8?B?Tmc5S3g1VXVzdnRIZ2VvTmRiYlhVdjVxT1dBSzlJSm9CTHBwYzdUdGxCdUE4?=
 =?utf-8?B?QllYWmpzUnFkSFZNWXRkMzA2cDlsTjBzbE1iY2d5c0o5RUp5VlBpR2JTY3Na?=
 =?utf-8?B?NHRJUEZndHpFUXZldVozUXZsRGRBUFJCeW91dGtBUkJOQUVqQzhtUWpScjJ1?=
 =?utf-8?Q?PUOUOFYyt7BxE+uJHfQKxvgZe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA638853AFB8D84E9A560F2F94EAFE4A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fe3dc4-a8a3-4ee1-a38e-08dda8e8a06f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 13:05:23.3989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rMcJGPjza81r1ObndNVnmQwD2yEgNfejU0jBNl67v0a9oM4DalDipP7ciqVH+wFpgI2rTzcXrU3StkMI0cLO/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6583

T24gV2VkLCAyMDI1LTA2LTExIGF0IDExOjMyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE0LzA1LzIwMjUgMTI6NTQsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6DQo+ID4gT24gMTQvMDUvMjAyNSAxMDoxMSwgRGFycmVuLlllIHdyb3RlOg0K
PiA+ID4gRnJvbTogRGFycmVuIFllIDxkYXJyZW4ueWVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gDQo+
ID4gPiBBZGQgbXQ4MTk2IGF1ZGlvIEFGRSBkb2N1bWVudC4NCj4gPiANCj4gPiBBIG5pdCwgc3Vi
amVjdDogZHJvcCBzZWNvbmQvbGFzdCwgcmVkdW5kYW50ICJkb2N1bWVudCIuDQo+ID4gU2VlIGFs
c286DQo+ID4gDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuNy1yYzgvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0KkwxOF9fO0l3ISFDVFJOS0E5d01nMEFSYnch
bDNZQVNFNjREVE1UcDhiT01yeTlVeUJNZi1JY1lGVHZYT2xQMkRYZnBlVUVGZFFLNzl4R1lFbnN4
bkp1TWloVlg3X1doRWUzcTFldlNnJA0KPiANCj4gU2luY2UgeW91IGFza2VkIHdoYXQgZGlkIHlv
dSBtaXNzIGZyb20gcHJldmlvdXMgcmV2aWV3IChhbmQgSSByZXBsaWVkDQo+IHRoYXQgRVZFUllU
SElORykgdGhlbiBtYXliZSB0aGlzIHdpbGwgaGVscDoNCj4gDQo+IEhvdyBkaWQgeW91IGltcGxl
bWVudCB0aGlzPw0KPiANCg0KTXkgbWlzdGFrZSwgcGxlYXNlIGZvcmdpdmUgbXkgY2FyZWxlc3Nu
ZXNzLiBJIHdpbGwgY2hhbmdlIGl0IHRvIA0KQVNvQzogZHQtYmluZGluZ3M6IG1lZGlhdGVrLG10
ODE5Ni1hZmU6IEFkZCBzdXBvcnQgZm9yIE1UODE5NiBhdWRpbyBBRkUNCmNvbnRyb2xsZXINCg0K
VEhpcyBwYXRjaCBhZGRzIGluaXRpYWwgc3Vwb3BydCBmb3IgdGhlIGF1ZGlvIEFGRShBdWRpbyBG
cm9udCBFbmQpDQpjb250cm9sbGVyIG9uIHRoZSBNZWRpYXRlayBNVDgxOTYgcGxhdGZvcm0uDQoN
Cg0KPiA+IA0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJyZW4gWWUgPGRhcnJlbi55
ZUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gDQo+ID4gLi4uDQo+ID4gDQo+ID4gPiArDQo+ID4g
PiArcmVxdWlyZWQ6DQo+ID4gPiArICAtIGNvbXBhdGlibGUNCj4gPiA+ICsgIC0gcmVnDQo+ID4g
PiArICAtIGludGVycnVwdHMNCj4gPiA+ICsgIC0gbWVkaWF0ZWssdmxwY2tzeXMNCj4gPiA+ICsg
IC0gcG93ZXItZG9tYWlucw0KPiA+ID4gKyAgLSBtZW1vcnktcmVnaW9uDQo+ID4gPiArICAtIGNs
b2Nrcw0KPiA+ID4gKyAgLSBjbG9jay1uYW1lcw0KPiA+IA0KPiA+IA0KPiA+IEtlZXAgdGhlIHNh
bWUgb3JkZXIgYXMgaW4gcHJvcGVydGllczouDQo+IA0KPiBIb3cgZGlkIHlvdSBpbXBsZW1lbnQg
dGhpcz8NCj4gDQpJIGhhdmUgYWxyZWFkeSBtYWRlIHRoZSBjaGFuZ2UgaGVyZS4gVGhlICJyZXF1
aXJlZCIgZmllbGRzIGhhdmUgYmVlbg0Kc29ydGVkIGFjY29yZGluZyB0byB0aGUgb3JkZXIgb2Yg
dGhlIHByb3BlcnRpZXMuDQo+IA0KPiA+IA0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBIb3cg
ZGlkIHlvdSBpbXBsZW1lbnQgdGhpcz8NCg0KU29ycnksIEkgZ290IGl0IG5vdy4gSSB3aWxsIGFk
ZCBpdCB0byB0aGUgY29tbWl0Lg0KPiANCj4gDQo+ID4gDQo+ID4gPGZvcm0gbGV0dGVyPg0KPiA+
IFRoaXMgaXMgYW4gYXV0b21hdGVkIGluc3RydWN0aW9uLCBqdXN0IGluIGNhc2UsIGJlY2F1c2Ug
bWFueSByZXZpZXcNCj4gPiB0YWdzDQo+ID4gYXJlIGJlaW5nIGlnbm9yZWQuIElmIHlvdSBrbm93
IHRoZSBwcm9jZXNzLCB5b3UgY2FuIHNraXAgaXQgKHBsZWFzZQ0KPiA+IGRvDQo+ID4gbm90IGZl
ZWwgb2ZmZW5kZWQgYnkgbWUgcG9zdGluZyBpdCBoZXJlIC0gbm8gYmFkIGludGVudGlvbnMNCj4g
PiBpbnRlbmRlZCkuDQo+ID4gSWYgeW91IGRvIG5vdCBrbm93IHRoZSBwcm9jZXNzLCBoZXJlIGlz
IGEgc2hvcnQgZXhwbGFuYXRpb246DQo+ID4gDQo+ID4gUGxlYXNlIGFkZCBBY2tlZC1ieS9SZXZp
ZXdlZC1ieS9UZXN0ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3DQo+ID4gdmVyc2lvbnMNCj4g
PiBvZiBwYXRjaHNldCwgdW5kZXIgb3IgYWJvdmUgeW91ciBTaWduZWQtb2ZmLWJ5IHRhZywgdW5s
ZXNzIHBhdGNoDQo+ID4gY2hhbmdlZA0KPiA+IHNpZ25pZmljYW50bHkgKGUuZy4gbmV3IHByb3Bl
cnRpZXMgYWRkZWQgdG8gdGhlIERUIGJpbmRpbmdzKS4gVGFnDQo+ID4gaXMNCj4gPiAicmVjZWl2
ZWQiLCB3aGVuIHByb3ZpZGVkIGluIGEgbWVzc2FnZSByZXBsaWVkIHRvIHlvdSBvbiB0aGUNCj4g
PiBtYWlsaW5nDQo+ID4gbGlzdC4gVG9vbHMgbGlrZSBiNCBjYW4gaGVscCBoZXJlLiBIb3dldmVy
LCB0aGVyZSdzIG5vIG5lZWQgdG8NCj4gPiByZXBvc3QNCj4gPiBwYXRjaGVzICpvbmx5KiB0byBh
ZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVhbSBtYWludGFpbmVyIHdpbGwgZG8NCj4gPiB0aGF0IGZv
cg0KPiA+IHRhZ3MgcmVjZWl2ZWQgb24gdGhlIHZlcnNpb24gdGhleSBhcHBseS4NCj4gPiANCj4g
PiBGdWxsIGNvbnRleHQgYW5kIGV4cGxhbmF0aW9uOg0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEyLXJjMy9zb3Vy
Y2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QqTDU3N19fO0l3
ISFDVFJOS0E5d01nMEFSYnchbDNZQVNFNjREVE1UcDhiT01yeTlVeUJNZi1JY1lGVHZYT2xQMkRY
ZnBlVUVGZFFLNzl4R1lFbnN4bkp1TWloVlg3X1doRWNpY0xWNnhnJA0KPiANCj4gSG93IGRpZCB5
b3UgaW1wbGVtZW50IHRoaXM/DQpHb3QgaXQuDQoNCj4gDQo+IERvZXMgc3VjaCBxdWVzdGlvbnMg
aGVscCB5b3UgdG8gZmluZCB3aGF0IHdhcyBtaXNzaW5nPw0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg0KDQoNCkknbSB2ZXJ5IHNvcnJ5LCB0aGlzIGlzIG15IGZpcnN0IHRpbWUg
dXBzdHJlYW1pbmcuIFRoYW5rIHlvdSBmb3IgeW91cg0KcGF0aWVudCBndWlkYW5jZS4NCg0KQmVz
dCBSZWdhcmRzLA0KRGFycmVuDQoNCg0KDQo=

