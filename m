Return-Path: <linux-gpio+bounces-18759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37AA87801
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC763A66EA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 06:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250011AAA2C;
	Mon, 14 Apr 2025 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cgVK4hUo";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YAuSJ0Ba"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD419F48D;
	Mon, 14 Apr 2025 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612638; cv=fail; b=k9UzJY0wpWEHOwoirG6C4kmi54HZ+CruVjU9Ye+0Rs4l2mu2uTVuRnn/Gncc4IbmG+7cqtTGVrTaUwnePvHohqc/sRj+ZOnBL3hVZ3zWxTSWX2J4iGLknUKkyG2Qj/qVHExmseRPnkn6H/fXmgf67GNf2cOTI5b7EB0xFhcIgnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612638; c=relaxed/simple;
	bh=10IKV5rZhvyAZBiydjhaoxdGp56qxrdz78USYSXvVfQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PdFk4ZI6xolmm+/4WW40gM5580cprHwodtkq6YZJa+sSgeElrx9SF0rzm1+n9gLc2KArKZoNkyVhxIjjNfjULWBC7/Qp/Rv93mU7VJfjV7JQMMZ699bW+Ea0ppjCVeG5PlZF53FEywNJJtF5VAHTs1WmiPeISSMrm/Oy/3mRlMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cgVK4hUo; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=YAuSJ0Ba; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e36f8a9018fa11f08eb9c36241bbb6fb-20250414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=10IKV5rZhvyAZBiydjhaoxdGp56qxrdz78USYSXvVfQ=;
	b=cgVK4hUoFGf1IXfMD3D9sOJcpozIqGgyPBiwa7+/GXjucx2f2T/C+UXFUvxC7V5J9U6qK1BnfD2iydx7XspSQaPrm0k+SZu+nHZh2jAnNC2/TCMTY3lG+zlj/ufAvbDZwWgsxbHLvMfnQDc0qZjIbCZDOrRyR5MmU3CsRSofKuU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2b21b613-ca6a-46a4-b0f5-6a62d06113f2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b3f3368b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e36f8a9018fa11f08eb9c36241bbb6fb-20250414
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 167900668; Mon, 14 Apr 2025 14:37:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 14 Apr 2025 14:37:07 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 14 Apr 2025 14:37:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duhasw0S6duAqX7ZkZm/kpjH32pSqYAK2m1PPtAYgUNBCJ6k6dN4NarE4D/pwvhVyEdy6lr+OT/xd3rkSup902Dri9B4koD+yFOWSNpU+/+ZKQhhTddKIhubblV77TMvqi1cKGUGcJHtQo25TIu2MVttVBimB01HZrcg08dzhtmOmSAyUPMkBJ4XsroqukwwSiiaHDEyUaveDuelZ40imqkku7kqeCbNJlzDQLTyItZVq10TvCGUREQwKLRRSRU11yAnJAB+CiIKZ+XY2veS9eZlk28UQdaWX9Sa+o5vaFompjxVXK4u3om1DrZdgSSqvQ1/nM1INX/nGKApZCAn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10IKV5rZhvyAZBiydjhaoxdGp56qxrdz78USYSXvVfQ=;
 b=ioVriZDirD0nIvTUn3vjH0dX64L5fnzNVVHyWL/5hMrjeXEHD2F8XAwG3iVjzePmVChzbzvnpnEBfhslDIRzG3WLO581Wo7gj33po0geEO4F1AA7yWEjPuEDealohphwmNbcDPSW/XrEy54bpBc/DmWEQsAdSj50tQF3VddmrtQgleHnyEky52Ae2aIpkT95f6YWpITY9WzNT808vgpzQh4aiAijfWnzhoEx6SCSlGl9e/TPNURdKNbyK5C1t2m1C4YV+3b901jduUNVrxePzQczXq7DCrhQJvgYesMfiJ4lndHMwSdGaTr0gGgw/iuRgTtZ66YOHCjfhtOPRaUhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10IKV5rZhvyAZBiydjhaoxdGp56qxrdz78USYSXvVfQ=;
 b=YAuSJ0BamgkLC8tAJlsvpoB3lVDNyI38CuM9N6XGwd8m71oNzyapic/Pq3ZtcIUNt6msv0XwfLGWxPAlD32huonfaokfIy9/lpx7L3k/j4u9j5bjbUFFJfUx6/xWhhGuaATvLOFBZsSyigzIs6alVq0+AQgwV1P4rwjYgLTxZ9g=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by SEZPR03MB6513.apcprd03.prod.outlook.com (2603:1096:101:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Mon, 14 Apr
 2025 06:37:04 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 06:37:04 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "robh@kernel.org"
	<robh@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 08/11] ASoC: mediatek: mt8196: add platform driver
Thread-Topic: [PATCH v2 08/11] ASoC: mediatek: mt8196: add platform driver
Thread-Index: AQHbp7Yox2OQU35yjkK1YEKr0gaO/LObzJAAgAbzRgA=
Date: Mon, 14 Apr 2025 06:37:03 +0000
Message-ID: <e88e171bccff3cd06abea64aefd9f248ff57e671.camel@mediatek.com>
References: <20250407120708.26495-1-darren.ye@mediatek.com>
	 <20250407120708.26495-9-darren.ye@mediatek.com>
	 <369cb94e-290f-425a-93e7-fcde11221dee@oracle.com>
In-Reply-To: <369cb94e-290f-425a-93e7-fcde11221dee@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|SEZPR03MB6513:EE_
x-ms-office365-filtering-correlation-id: 6329f5af-94aa-4e19-bad9-08dd7b1ec4f7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?VW53NzlFYThDcGtpUUxGU01ZSDR1TW1HZmFTcmhkT2RIeE9TYXJIeWFzVU0w?=
 =?utf-8?B?RlVPeFlJZU1FYjM5bUNCOGRXK0xXdUxWMWh6S3JiRkdQWDZabTB1dC9zL3Za?=
 =?utf-8?B?ZFlieXU3Ym9ocXVEcDZKOVVnbDZDb0V3QjVMVUsyQjNZRGhRa3E0SG1iL2NG?=
 =?utf-8?B?VHN5bktpUDFIZ1l5a0w4OERtRkhkWVE1TS8vQ0RreXBVZnVtWmFlaDRFK0N2?=
 =?utf-8?B?TDlCVUN6UHdTeE4xc3pmY2JxbVp0Ti9uMUxSTHFGZ1dST0YyTmJPTU9BRXFv?=
 =?utf-8?B?RjByQis2bUZvaldxMUJCNE50eHJzMjlab1BuRVh1a0dNVlR6Ym8zdTVVOEJw?=
 =?utf-8?B?M0VyV25wRUVIVnBCWTVVakdZbHkrODBxSzR4VEQ3QnJkRlkyTG1TeTA1TTlR?=
 =?utf-8?B?azR0ejd6UHVvaHVwVnREUG9FMjFEUVhyVU16OGk1WklKUUFDeUlpUE8zM3Ro?=
 =?utf-8?B?dVcxU2x1dzZsbCtaNXp6eThmL1oza0pVeXhtR1RwZDhhSTNkVUlFb0ZmNmUw?=
 =?utf-8?B?KzBUbzdaNi9IaS8zZ2orUE9LQ3RqYUFBbFdMd0k0S1FBSU1kQzhBZnp5Zlhv?=
 =?utf-8?B?dG1qbko0NWlrWnFqc091OFNtbUxtK21wK1lSWGJkc25uTDFKMUlEUUI4S1BK?=
 =?utf-8?B?Uk5jTm56YzNTVFU4Z1Z3Vjk3SkdaemJOelU0RzZhY0VhdnFocUJTaXRkY3hV?=
 =?utf-8?B?NmNXUC9Qakd6Uk1FcFRORVI3ajBuTjJlVlFVRnBLeDVFSStMY3RkY2lNWUp1?=
 =?utf-8?B?dVZ0ZS9BOGgwMytCa2xHdE5MSHF4SGhLWm9YcUgxcSttL0hMVXlNK3NJQnpx?=
 =?utf-8?B?WVM1Y2VBdmU1Ylk4TGxDM21ObWltMGVrSUhsR1ljME96czd1cW1YRFIvVk9W?=
 =?utf-8?B?b1NjWDVSUnNHajdFM05TUWhSUnE2a0hOSU13cHpkVlZwakZkbjhQeERodFd6?=
 =?utf-8?B?aVdFbVdJdFp5WHZLV2FySHpObnluRERkTGZyMFYyU2hGa3k2RFJHTjVpTlY0?=
 =?utf-8?B?c1Y4VHpzS3NYZVAxUU9vMFRrSTk3L1RoNzlBYkhDNDlPZElad1dnR1hJbFVK?=
 =?utf-8?B?N011WThHWmFuTTBiNFpPbDhVM1UzcTBGeEw0eUdKTkVvajE2TjRjUE1KNGhy?=
 =?utf-8?B?VWZjeWhreksrc0VwUllVMjNSd3kvYXYxakNUaDRXVnpab3BQMU1HellWdkh1?=
 =?utf-8?B?ektMNFJEb3drMWhNc1VJdjZsNnRMT0NEbkxxTEU1ZlZjNHpVNEtqM3k2YlB3?=
 =?utf-8?B?bGl4ZDdNMEMwYnFMSzZpbUNHalhkNk1MU3dOc1FXWGxmUTRVZkxwZ1ErSGd3?=
 =?utf-8?B?THpJV2tpRjNMV0JwNzFVTkMzV0ZEbk5LUDRLZC9PSkRnTWFXUThKZThCMkRT?=
 =?utf-8?B?eTFzcHF0dkxVaDBvaVR4YjIreXY5SHFZU3lZSGxWbnJLL1lZSS9DNmF5cEZM?=
 =?utf-8?B?R0YwWTZLd08wZ0huVGNlUzNhZ1NGRUNJaFhtRVNVYmh2VTBlZmIwQmFYYVpG?=
 =?utf-8?B?ckZqcDJRSzYzMnZVL1NZOFFwa0NXdWZuYjZBenJNaE1ndkhFWjFpSUo2N1RH?=
 =?utf-8?B?NmtmR1N2U2VNSDJXaEZsRjc5QjdxcG5IdW9TVU5aNnJXanRpSnFSNllWLzUv?=
 =?utf-8?B?LytGR1F4T00zTzI1YzgzWk5xVWFZM2xNYnJiN0V4LzY4c2ZNOUtqM3dhVDJ4?=
 =?utf-8?B?QldjZjYrb2p3K2syWEt0UkFLb3dTeVdmUHRDTXVqdmpPY1JVK1hFRzZHQXJ0?=
 =?utf-8?B?SlBnTjVmMmExa3BIaWFRRW5GMjBsN20zZjE4NkcrdEkrYy84RXlLT3RLNm5i?=
 =?utf-8?B?VkhkSmtuRjROZzdjVjMvTDhBRU9venB2NXhWT25vOWtBZkxtS0JZaVl2Uzlq?=
 =?utf-8?B?ZFBudWp6cEt2NmJxbGdCeHJuZG9BZ0E3cnB1akFIUllBcWQrQnZnT1d4ZGpD?=
 =?utf-8?B?OFZLTnBKVE9VUGpKeFVNbjlvREpualAyL0s1cTVEWGJ3V2N2andNWUxtYlMw?=
 =?utf-8?Q?+8p/VcYNu5fd1sx2VlOPpwIIiyymZY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG1FT3AzWmRveEkvVGkxc2JuRVZ6ZnlBTGxraHpFUDhpSS94S29FRHRJSHdH?=
 =?utf-8?B?WUZNZG9LK3F1d3pVdGpGbk14UFY2UlZmYlFnWDArcUd2SFdoZkx3QTExdFdu?=
 =?utf-8?B?ZElOZVRTWnR0TFg5bWZxRmtWWU9uN3JCU1NyUnFrTXZFSjNzOU9kMjFrejdv?=
 =?utf-8?B?c3FmUlJuRlp1MWtmdEdoRVl4VVZ1S0hkRUFaWjlEL0d6a0R5V3VIRVZpTUlC?=
 =?utf-8?B?MzEwZG5jZmV4SkJoeWZpaWVhSHZSUmUyQ3NhRms2djBuYkZQWHR4VmZVWFU4?=
 =?utf-8?B?SmJ4Um0wOUV5L2FtdjNqcTN4bUhKTG9CSTFlK0JTd3J6MWdCYVYxS05GOU5N?=
 =?utf-8?B?VC9DdGJnM0llby9uS0VOMnRJT3RZZDJ6T2lBRVE0dnlVVmQreEo3eXRnTHpS?=
 =?utf-8?B?bjh2WlFGSStnakZrNmxsQytrRzhHK0NMM2lwOFh6R3UwLzljVUJQa2dNSGo2?=
 =?utf-8?B?RGFUa1pSVWJwMmg3RGlNVVY5aFd4UVhQUnZIVjE5SHFaRytFVGIyam9vSXBj?=
 =?utf-8?B?YmFaV1pMbWxMOTcwcFJ5R3BUL3loTk1ibGNIR1MwY2hTUEUvL0VFNWc4NGRn?=
 =?utf-8?B?bHZybmNXSmdycjliOTYwRmdISmRXMk5sc1U5dnZrTmVSOGZrUmFrQlFYWUUr?=
 =?utf-8?B?VnFkVlBMYlZtRDh6WE0zU0duWHdRc0hrUkg2VHBnNGg2UFBUbmZTY0lvWjI5?=
 =?utf-8?B?UTFPajN4S0FmeTFTTjhZN0VYbmRlRlRJdjZSdElDU1hqTFh2RUt3cEQ2ZTQr?=
 =?utf-8?B?Vk9zV1RFWUkzMW11VWkyYWN5L2hLV3M0YlMyaSt4RzBJZEpVeFZrSHhkVnF0?=
 =?utf-8?B?KzZ5SWVvV0xoVElxQWZLZVpwNDdDQThRSHJlUkttTVBHMU91RThORUxOS3ZY?=
 =?utf-8?B?OHpYRmtFaEhFOXZieXlBa0xvOEpuWXFHYXFTU2N4a3dhNWx0VjJIU1Q2d01l?=
 =?utf-8?B?Ry9TdS9KV09FWXQrQnZ5b2NsRnFZNGluNE51MWI0bi8veDAvbWw4R0oxRTN3?=
 =?utf-8?B?cmhMbVZ2bDJ1M3lVbVRBcFpHR3VSM2lkd3dGVUNhVUl3WkFWY2NlMUFmZVlS?=
 =?utf-8?B?cU1DWERXVWhDMDRHeDI5T1FDS2t6ZGtScjJPUUVuQWRtWmhFRFlNSnhRdTFC?=
 =?utf-8?B?dE9qRk5vbmdNK0c0eXZNb1FLMEYwZXNld2hOMzVGUVVqYmdRQlNucExtVEIw?=
 =?utf-8?B?Z3g5dEhBVWVUN2lIVGt6VVdmcFhDcHRDSVhJWWlvSkE3aWxWY1VlcGp2YkJP?=
 =?utf-8?B?cDlSalpCVmcyemR5RVlBVU9tY0pJOGs1V2JwL3FoSnVXckh3OEJYRnJXTjZP?=
 =?utf-8?B?L0JOVnFNZXFKUVJaQ2JIR3RwbjBqV3hmNVIycDA5WjkrdHcwQjc1dXgvNjA3?=
 =?utf-8?B?cTl6MFVNN1Y1VnFqSDJITXFTaW9EWVB6elp3RFUzVmp3d2hoQ3ViZjEwWktX?=
 =?utf-8?B?M0w5dXU2TTFXaklKWFpIUzB6cnhlU3BoS045dE16RnMxeEJTdlhOUFB2Qlc0?=
 =?utf-8?B?REo2VjBTSERKZm5jK3hJK1liVWl3Vjg1dXFhQ1Jwd2dMUHBTc1JpT1BEeVRX?=
 =?utf-8?B?N0RqeitFYXNVM2t6ektCeko0NDJQejJJQ0NjT2ZZSGYwTGNzR3hVWlNoSll2?=
 =?utf-8?B?UVpwNTNqSmNXN0V4bjJldlpsRkxJdjZ6aUd2eWkyMGZCcWE4QmhLZ1VraHNu?=
 =?utf-8?B?UFVzT0dlV3BGaWE5cFFGNHN3U2pEQXdnV0Z3Z2RtVXpCbVM4RzU1ZWhQWEdM?=
 =?utf-8?B?cWx5Njl3ZFJpRE5IZGJmcHJKWFVXY0hlRVQ0NGl0ZGw2NHVXZ2tEeU94cWdK?=
 =?utf-8?B?NjdYQk80eDh4Q2FVQkx1djFwWVYrdEdGaC9pK0EzV3ozdWhNTWZQSzJXN3FZ?=
 =?utf-8?B?eXhqbWF0Q2lEQ1JTN2hCelJ0NnBWNThNa1Z2WnNGN3BjZHZ3eDdsdWxKR09Y?=
 =?utf-8?B?VTBsWXUvVmpERUtQcjA4VE9ib0JQTmgzbkdzMlRrOG9EOUdWcHVzQkJ4Tnp2?=
 =?utf-8?B?RHJ3dzlWd3JMVmlDNTVObjNsWkdWTTdtemJnOFpXM0oxK21za1pxTkJibEkv?=
 =?utf-8?B?RjlaUnNnYVhCd2tORG9aL1JMQnVuVGVjdkZXTEZxZVltT0sxRXBJNldPVTBB?=
 =?utf-8?B?VUZBSmJFOVUyNFVHWGloRUIwQ3QzWGVWY3VCbDI5UUJOY1RCVFlLVDN6cHFT?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1FF79F9F779BB40A5E2FCE0547C614E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6329f5af-94aa-4e19-bad9-08dd7b1ec4f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 06:37:03.9647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVJL54ND0BRcOrQYkUGpeaEo+szn51nP77LYkJdA2LRgyewIdYIp5W3+PFPmW8emmd0U37mrrkBsZDiDlVZVsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6513

T24gVGh1LCAyMDI1LTA0LTEwIGF0IDAxOjU4ICswNTMwLCBBTE9LIFRJV0FSSSB3cm90ZToNCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBPbiAwNy0wNC0yMDI1IDE3OjM2LCBEYXJyZW4uWWUgd3JvdGU6DQo+ID4g
RnJvbTogRGFycmVuIFllPGRhcnJlbi55ZUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRkIG10
ODE5NiBwbGF0Zm9ybSBkcml2ZXIuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRGFycmVuIFll
PGRhcnJlbi55ZUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBzb3VuZC9zb2MvbWVkaWF0
ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgIDEwICsNCj4gPiAgIHNvdW5kL3NvYy9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgIDEgKw0KPiA+ICAgc291bmQvc29jL21l
ZGlhdGVrL210ODE5Ni9NYWtlZmlsZSAgICAgICAgIHwgICAxNCArDQo+ID4gICBzb3VuZC9zb2Mv
bWVkaWF0ZWsvbXQ4MTk2L210ODE5Ni1hZmUtcGNtLmMgfCA1MDcwDQo+ID4gKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNTA5NSBpbnNlcnRpb25zKCspDQo+ID4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Ni9NYWtlZmlsZQ0K
PiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTYvbXQ4MTk2
LWFmZS1wY20uYw0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVkaWF0ZWsvS2Nv
bmZpZw0KPiA+IGIvc291bmQvc29jL21lZGlhdGVrL0tjb25maWcNCj4gPiBpbmRleCAzMDMzZTJk
M2ZlMTYuLjYwNmYyMjFlMjM4YyAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvbWVkaWF0ZWsv
S2NvbmZpZw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9tZWRpYXRlay9LY29uZmlnDQo+ID4gQEAgLTIw
NCw2ICsyMDQsMTYgQEAgY29uZmlnIFNORF9TT0NfTVQ4MTg2X01UNjM2Ng0KPiA+ICAgICAgICAg
U2VsZWN0IFkgaWYgeW91IGhhdmUgc3VjaCBkZXZpY2UuDQo+ID4gICAgICAgICBJZiB1bnN1cmUg
c2VsZWN0ICJOIi4NCj4gPiANCj4gPiArY29uZmlnIFNORF9TT0NfTVQ4MTk2DQo+ID4gKyAgICAg
dHJpc3RhdGUgIkFTb0Mgc3VwcG9ydCBmb3IgTWVkaWF0ZWsgTVQ4MTk2IGNoaXAiDQo+ID4gKyAg
ICAgZGVwZW5kcyBvbiBBUkNIX01FRElBVEVLDQo+ID4gKyAgICAgc2VsZWN0IFNORF9TT0NfTUVE
SUFURUsNCj4gPiArICAgICBoZWxwDQo+ID4gKyAgICAgICBUaGlzIGFkZHMgQVNvQyBkcml2ZXIg
Zm9yIE1lZGlhdGVrIE1UODE5NiBib2FyZHMNCj4gPiArICAgICAgIHRoYXQgY2FuIGJlIHVzZWQg
d2l0aCBvdGhlciBjb2RlY3MuDQo+ID4gKyAgICAgICBTZWxlY3QgWSBpZiB5b3UgaGF2ZSBzdWNo
IGRldmljZS4NCj4gPiArICAgICAgIElmIHVuc3VyZSBzZWxlY3QgIk4iLg0KPiA+ICsNCj4gDQo+
IGlzIHRoaXMgbm90IGRlcGVuZHMgb24gQ09NTU9OX0NMSyBhbmQgc2VsZWN0IFNORF9TT0NfTVQ2
MzU4LzYzNTkgbm90DQo+IHJlcXVpcmUgPw0KDQpJdCBpcyBiZXR0ZXIgdG8gYWRkIENPTU1PTl9D
TEsgYmVjYXVzZSBpdCB1c2VzIHRoZSBjbGsgYXBpLCB3aGljaA0KU05EX1NPQ19NVDYzNTgvNjM1
OSBkb2VzIG5vdCBuZWVkIGFuZCB0aGlzIHBsYXRmb3JtIGRvZXMgbm90IGRlcGVuZCBvbi4NCg0K
PiANCj4gPiAgIGNvbmZpZyBTTkRfU09DX01US19CVENWU0QNCj4gPiAgICAgICB0cmlzdGF0ZSAi
QUxTQSBCVCBTQ08gQ1ZTRC9NU0JDIERyaXZlciINCj4gPiAgICAgICBoZWxwDQo+ID4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+IGIvc291bmQvc29jL21lZGlh
dGVrL01ha2VmaWxlDQo+ID4gaW5kZXggNGI1NTQzNGYyMTY4Li4xMWQ3YzQ4NGE1ZDMgMTAwNjQ0
DQo+ID4gLS0tIGEvc291bmQvc29jL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gKysrIGIvc291bmQv
c29jL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gQEAgLTEwLDMgKzEwLDQgQEAgb2JqLSQoQ09ORklH
X1NORF9TT0NfTVQ4MTg4KSArPSBtdDgxODgvDQo+ID4gICBvYmotJChDT05GSUdfU05EX1NPQ19N
VDgxOTIpICs9IG10ODE5Mi8NCj4gPiAgIG9iai0kKENPTkZJR19TTkRfU09DX01UODE5NSkgKz0g
bXQ4MTk1Lw0KPiANCj4gb2JqLSQoQ09ORklHX1NORF9TT0NfTVQ4MTk2KSArPSBtdDgxOTYvIHNo
b3VsZCBiZSBhZnRlciBtdDgxOTUuDQo+IA0KPiA+ICAgb2JqLSQoQ09ORklHX1NORF9TT0NfTVQ4
MzY1KSArPSBtdDgzNjUvDQo+ID4gK29iai0kKENPTkZJR19TTkRfU09DX01UODE5NikgKz0gbXQ4
MTk2Lw0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L01ha2VmaWxl
DQo+ID4gYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L01ha2VmaWxlDQo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjliY2MwOWE5YTk0ZA0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L01ha2VmaWxl
DQo+ID4gQEAgLTAsMCArMSwxNCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+ID4gKw0KPiA+ICsjIGNvbW1vbiBpbmNsdWRlIHBhdGgNCj4gPiArc3ViZGlyLWNj
ZmxhZ3MteSArPSAtSSQoc3JjdHJlZSkvc291bmQvc29jL21lZGlhdGVrL2NvbW1vbg0KPiA+ICsN
Cj4gPiArIyBwbGF0Zm9ybSBkcml2ZXINCj4gPiArb2JqLSQoQ09ORklHX1NORF9TT0NfTVQ4MTk2
KSArPSBzbmQtc29jLW10ODE5Ni1hZmUubw0KPiA+ICtzbmQtc29jLW10ODE5Ni1hZmUtb2JqcyAr
PSBcDQo+ID4gKyAgICAgbXQ4MTk2LWFmZS1wY20ubyBcDQo+ID4gKyAgICAgbXQ4MTk2LWFmZS1j
bGsubyBcDQo+ID4gKyAgICAgbXQ4MTk2LWRhaS1hZGRhLm8gXA0KPiA+ICsgICAgIG10ODE5Ni1k
YWktaTJzLm8gXA0KPiA+ICsgICAgIG10ODE5Ni1kYWktdGRtLm8NCj4gPiArDQo+IA0KPiBuZWVk
IHRvIGZvbGxvdyByaWdodCBzZXF1ZW5jZSBsaWtlIG1lZGlhdGVrL210ODE5NS9NYWtlZmlsZQ0K
b2sNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTYvbXQ4MTk2
LWFmZS1wY20uYw0KPiA+IGIvc291bmQvc29jL21lZGlhdGVrL210ODE5Ni9tdDgxOTYtYWZlLXBj
bS5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjg0
Y2NiYzc0MTljNw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9zb3VuZC9zb2MvbWVkaWF0
ZWsvbXQ4MTk2L210ODE5Ni1hZmUtcGNtLmMNCj4gPiBAQCAtMCwwICsxLDUwNzAgQEANCj4gPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogIE1l
ZGlhdGVrIEFMU0EgU29DIEFGRSBwbGF0Zm9ybSBkcml2ZXIgZm9yIDgxOTYNCj4gPiArICoNCj4g
PiArICogIENvcHlyaWdodCAoYykgMjAyNCBNZWRpYVRlayBJbmMuDQo+ID4gKyAqICBBdXRob3I6
IERhcnJlbiBZZTxkYXJyZW4ueWVAbWVkaWF0ZWsuY29tPg0KPiA+ICsgKi8NCj4gPiArDQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBp
bmcuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvb2YuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxzb3VuZC9z
b2MuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX3Jlc2VydmVkX21lbS5oPg0KPiA+ICsNCj4g
PiArI2luY2x1ZGUgIm10ODE5Ni1hZmUtY29tbW9uLmgiDQo+ID4gKyNpbmNsdWRlICJtdGstYWZl
LXBsYXRmb3JtLWRyaXZlci5oIg0KPiA+ICsjaW5jbHVkZSAibXRrLWFmZS1mZS1kYWkuaCINCj4g
PiArI2luY2x1ZGUgIm10ODE5Ni1hZmUtY2xrLmgiDQo+ID4gKyNpbmNsdWRlICJtdDgxOTYtaW50
ZXJjb25uZWN0aW9uLmgiDQo+ID4gKw0KPiANCj4gaGVhZGVyIHJlcXVpcmVkIHRvIGJlIGluIGEg
c2VxdWVuY2UuIGVhc3kgdG8gcmVhZCENCj4gI2luY2x1ZGUgIm10ODE5Ni1hZmUtY2xrLmgiDQo+
ICNpbmNsdWRlICJtdDgxOTYtYWZlLWNvbW1vbi5oIg0KPiAjaW5jbHVkZSAibXRrLWFmZS1mZS1k
YWkuaCINCj4gI2luY2x1ZGUgIm10ay1hZmUtcGxhdGZvcm0tZHJpdmVyLmgiDQo+ICNpbmNsdWRl
ICJtdDgxOTYtaW50ZXJjb25uZWN0aW9uLmgiDQo+IA0Kb2sNCg0KPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IHNuZF9wY21faGFyZHdhcmUgbXQ4MTk2X2FmZV9oYXJkd2FyZSA9IHsNCj4gPiArICAg
ICAuaW5mbyA9IChTTkRSVl9QQ01fSU5GT19NTUFQIHwNCj4gPiArICAgICAgICAgICAgICBTTkRS
Vl9QQ01fSU5GT19OT19QRVJJT0RfV0FLRVVQIHwNCj4gPiArICAgICAgICAgICAgICBTTkRSVl9Q
Q01fSU5GT19JTlRFUkxFQVZFRCB8DQo+ID4gKyAgICAgICAgICAgICAgU05EUlZfUENNX0lORk9f
TU1BUF9WQUxJRCksDQo+ID4gKyAgICAgLmZvcm1hdHMgPSAoU05EUlZfUENNX0ZNVEJJVF9TMTZf
TEUgfA0KPiA+ICsgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwNCj4g
PiArICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSksDQo+ID4gKyAgICAg
LnBlcmlvZF9ieXRlc19taW4gPSA5NiwNCj4gPiArICAgICAucGVyaW9kX2J5dGVzX21heCA9IDQg
KiA0OCAqIDEwMjQsDQo+ID4gKyAgICAgLnBlcmlvZHNfbWluID0gMiwNCj4gPiArICAgICAucGVy
aW9kc19tYXggPSAyNTYsDQo+ID4gKyAgICAgLmJ1ZmZlcl9ieXRlc19tYXggPSAyNTYgKiAxMDI0
LA0KPiA+ICsgICAgIC5maWZvX3NpemUgPSAwLA0KPiA+ICt9Ow0KPiA+ICsNCj4gDQo+IA0KPiBU
aGFua3MsDQo+IEFsb2sNCg==

