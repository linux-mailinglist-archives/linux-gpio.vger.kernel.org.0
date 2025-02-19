Return-Path: <linux-gpio+bounces-16211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DAA3B256
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 08:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F4516C957
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 07:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EBB1BEF63;
	Wed, 19 Feb 2025 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X8A9nHvZ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Nde3h+hi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD6119F47E;
	Wed, 19 Feb 2025 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739950127; cv=fail; b=hg9slZFQQVD87OJqFWmAm+apsoh73vCFCJ2vH44AFKLEzmGNOW5X11zBTMfFjYlGvBk8lXKx92RRMRBEj8qI7JBSh38lPj8dxqTcIvP1dGHzNfLJIr9coMcXTzqzDmc/w7hoQBd7U9+phos3Hyf2gJTXvcxBAeRgv3BuxxD/sOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739950127; c=relaxed/simple;
	bh=k09uqj0BGpeneE6V6agP5I/8o92UQgGGZlWh05JWvuQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nc9ZKUFKK8+cgTG6dLozuL5tHg4U/W+1Rh2t6B39TSB+CFgPlI6gB0vpwvujr1Kb7vO4+gXjO0TY6v1hqC1M5RxLVlu7wF/pe/jeMSfqxCsruG5ZZfTZ/BlYKzKw9s0E1tiof9Tuu9eT9iqhj6kqzh1jZZ1++RdfqL6jBBl2GFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=X8A9nHvZ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Nde3h+hi; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 23213a22ee9311efaae1fd9735fae912-20250219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=k09uqj0BGpeneE6V6agP5I/8o92UQgGGZlWh05JWvuQ=;
	b=X8A9nHvZMkSqAcQbE2BvBtbaTPQ7A194arE71hqOvC+NOOKsuxIn4h/y38Opb4tUD3DI2nGucSmsNwkrC7MmVM8IVjRLt6kVhappBieHqXfMJTcCc3JiQcLT66KSjwym5pTQ6k6PJ9Y9PPKy4eZZpqpWD3EWM5OXcK8agElHMIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4efa54ec-58de-40fe-bdc1-209fa45fb477,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a1c14aa4-5c06-4e72-8298-91cabc9efadf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 23213a22ee9311efaae1fd9735fae912-20250219
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1645723123; Wed, 19 Feb 2025 15:28:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 19 Feb 2025 15:28:38 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 19 Feb 2025 15:28:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8laMVSP6zkORHPOnKihTUpuLybjwboi3NbTzL8bpf0KneFXrNUqnfWIyZVyhGEtHLrgPK/7t8fkVJkcHTWhlIT26tXqnwpmpeSWcBUr64z8VugZRUzoFclFzWR6azNeG8a/7RMJtFQNB02plFsVV1WeauE/OWhbQyxR0dO7YRedBWZevA5emclkxJUSfvqFMiVyeWKsVeP04SNCWi9kzcooabA4E0D6kucZ57fSxPv1MwUPfCHL30ILwiQaj3MBOfPQzaH0mO+ZQR1fCSBUZ7ls8hutA4AnBnqxAKidcxBSSb7hqYVKHuejl1w+/ll3e1/nsot8KNUsxGY1vsETqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k09uqj0BGpeneE6V6agP5I/8o92UQgGGZlWh05JWvuQ=;
 b=vH/2HDg/BZ2nPebZHEMZb5L9yBqEbpMY8q9Tf0QwP5ObHNSY+pykwE/uiVzn61X40tEs0H61ZkYZL2CpkLdm2XBFEGwxDOdtoqhH0+2J+7gxeYlvgNusNp4lqNqyKvTTKoGwGdcUiLMC/unUy2I7DjHlBDmV5DetQOR9ytXr/dPeB+QohzB5I0QJalwPZKRl2YC77IffAgncuYdGnFucmD9ZFDDXAixZga7oznuu4K54tsgtuJPpIHwXjTP2UE72L0ycPyw/YvSRJVGZxyEGT+HEXheGQSWwLdbYPgB64Unxg0kme40NSsXjD2vduOqeC0SLUF+9y15cbZJpXr4+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k09uqj0BGpeneE6V6agP5I/8o92UQgGGZlWh05JWvuQ=;
 b=Nde3h+hioze607S2UlzUHCICrq6C0+6/vde02UpYe8go/x9RJLe/e4EOVMp+SS2tzHNh7TbUyMlsARN2b/qXNOSJyRwTg9WWR+AYelvgoKXVc3J6SGGZmYSUIfwp/inpJyKKe48aDTQTU/LqvMDcpcaIM7W2F/hYjzJWT8mQtAk=
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com (2603:1096:101:173::12)
 by SEZPR03MB8815.apcprd03.prod.outlook.com (2603:1096:101:256::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 07:28:36 +0000
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f]) by SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 07:28:35 +0000
From: =?utf-8?B?Q2hoYW8gQ2hhbmcgKOW4uOa1qSk=?= <ot_chhao.chang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "seann.wang@kernel.org"
	<seann.wang@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2h1bmh1aSBMaSAo5p2O5pil6L6JKQ==?= <chunhui.li@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?SGFua3MgQ2hlbiAo6Zmz5b2l5bu3KQ==?= <Hanks.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>
Subject: Re: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
Thread-Topic: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
Thread-Index: AQHbbtQbeP3hDe2dmkmw7M1P7Az3/rMqhRcAgCPdBAA=
Date: Wed, 19 Feb 2025 07:28:35 +0000
Message-ID: <8c62eca41c042425f575314ce88096e2fdb92ceb.camel@mediatek.com>
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
	 <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
	 <bfce3aea-490b-4311-ad4a-ab567d2a0572@collabora.com>
In-Reply-To: <bfce3aea-490b-4311-ad4a-ab567d2a0572@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7841:EE_|SEZPR03MB8815:EE_
x-ms-office365-filtering-correlation-id: 824481e5-77b8-487f-f2cd-08dd50b7058a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Qlp4eWtodkkzd0I3bUNDS2dXM3B0N2xLTXN3ZHJTRzdmV2YrU21GTHRzZlJZ?=
 =?utf-8?B?TlBKOWxPb2dhNy9DVUx6aExMU2FOMVUrbGhiZVpiWm1teld5N0tueS9UaWdE?=
 =?utf-8?B?ZzRzaUxGbG1xb0lINFZmRGw3WEwzTldOc1Y1djVRckV3ZVVUNnIrNU5LMGNr?=
 =?utf-8?B?V29vM1NJYmRkYzJCRWNid293VDVxc2JaRUhtUVYxcTJ0emRINUx0MnhZU3Vk?=
 =?utf-8?B?blFsSVFEbi9yYmxUMzlHOHVjU0gzemNjanpKeTZqcHE1V1hZWEgzL3VVa0py?=
 =?utf-8?B?VVJ0QzFTOGFEOGxoNkFCbWkyOWh6MVdTRm11dmhuTXBQU1ZKandwQUpvT0ZH?=
 =?utf-8?B?M01hb01aQlowaUg5MWF1QTJpL01qTTlwSExBN25zODVOSi9Hc1VSRExsTDUr?=
 =?utf-8?B?QXp5ZDB0SkpzL2FiUTBRSmIvMytSc3RibDQvZTgxVnVHQkd4SnZYT1UzWE1z?=
 =?utf-8?B?Tm9xblpKQ1pJdUVsOVc1MGhBNzQ3cHdQa0hmWmlvdlNqYlBLNC9uQjRVU2Rx?=
 =?utf-8?B?WmJpY0ZFRUp6Zjhhb2hndlpISGM4a0YzbjkzeGNOVytJQnFCWmowWWxzZnky?=
 =?utf-8?B?TUw3M3RVaHhscmJTV2VXaDd6WlhZMXdpViszb0EvSjM0c0tOMzVxTUlpc3Fa?=
 =?utf-8?B?QVBsQllMN2Z3ODZSclBqUVFxQlUrZTY1eXQ5dUVjNWlDU3V3ZU83ZkQyZmxq?=
 =?utf-8?B?Z2ZlTzB2a2toekN1a0hiU0dBL2JtZ2JtTFB5eFdNT21OMzdkMkxZV1JCZUpp?=
 =?utf-8?B?NUhXMEdHQ1YzQ3p0N3c0YkNCYnlGV0dPbEtSSVdLZFlUQ0xiRjBRTmsyN01v?=
 =?utf-8?B?bHRKK0gxQVhwVkd0MDlkV2xhNkJHSzZaRkxEelRxUHNQbW4yaEl2SUZuTEFI?=
 =?utf-8?B?dU9zbGtKTkQxMnNFa0xrTklSeDBKU1BvMitGZkRORm1WK1VEZGx3M0JCbkU0?=
 =?utf-8?B?TUdzbTc2ak5PaXNUYVNTUk5iUFo0U2lSTDExMDlFYTkwUnFsUUtoMHFYNnBV?=
 =?utf-8?B?dnBMaTdvZGVPSjVpM0xna2FSelpDUGNBNVJQUmlEMFJFejhtblN0VDQ2aGNo?=
 =?utf-8?B?YUdXbmc2bk1kUllveGpZajRsYWtuZnhyT1NuR0ZTMVUyWDJJYTYyd3hrdEVX?=
 =?utf-8?B?UGtCeUNyYm5UMEs1TjUrNG5rQXN5YnhZRXlUNnFEcWtOMndXRmFCVTZBMW5S?=
 =?utf-8?B?VlgvU20yV3VoNm5HY3UxWm1DZEQzVDlQSFpQSDNNVXhranl0MHlWQ2c0eUxm?=
 =?utf-8?B?UWx2UGIxS0Jzd2FNTW9zOU9CZkhhNlVEazJLVE5Bc0NGb0hkd0dNMk41dUxM?=
 =?utf-8?B?TkxCK1l1R0pOWkFETHFabWYrU3hUd1FIdW84VE9BSHJtMGo0dUVxTkdPeHcv?=
 =?utf-8?B?N1pjRnREd2FRTlg5WTNJWEVIckdSZ0tHblpBZTBEajAzbHcyK0gxWCtMbEJU?=
 =?utf-8?B?ZlNhV1Fram9DNzBqdWg4YnBSZld5eWVYOU1sanRYd0dqUDVLaEZteStiVjBu?=
 =?utf-8?B?TUNwZUJyRFJDMmM1U2tSUm5PTHZHY244WGI0R0Z6S1pQSlJiUVUrS1lnenBw?=
 =?utf-8?B?elRmUEl6YWtoTkdMUUdFWWNPbkN4QUZuSnNKWkttNnQrSHhmOSszOGFTZXp3?=
 =?utf-8?B?YlM0M3dybG56VWsyYXZFeVNZUUw3Z3FrK3JrZkFNeHNHdnlkbFRVdnpEY2k2?=
 =?utf-8?B?dGx3QUVDYUxyWFNvNGdhM00xVktvUG5IMVpFWTUyNWRWbDMyMkV1eS93MWdD?=
 =?utf-8?B?S3BUYXZCWnV1Ty9GcTk0MUR3OGhxcENEU3owVmwrQ2dJMXZGRVQvZkF5ajhB?=
 =?utf-8?B?VStudGppdlRJS2tJdTh1NnhGclQ5bDVRc0JiWlZEeENQSlVkcDFRWVR1MjlO?=
 =?utf-8?B?cVNHaFdGa3p4eDRTRHBJZlFranV1NXQ1L2dFSGFiSGt0QmFlZzBRZDg2L2Ny?=
 =?utf-8?Q?xlXeARF5YSQ67LlJQfCz3uybWZ5eO+l9?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7841.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVpxUGpFWTVxcUFxU2tSVWRKcHRJdlo0Z09INmdpdEo1K1FYRTF5WHVaQ2pu?=
 =?utf-8?B?QjM5UlczQ0oyUlV5bjhUbFdJUkthbUxPcWhhd2k5aVpQaFY4T0lJbWdnamI5?=
 =?utf-8?B?cTNaL0Q1WVJtcSt3UlViWVY1MFltWENyQzcwejVCaDEzRU16bm9hRWNvRnBa?=
 =?utf-8?B?MEY1QnllczNGczJUaTFHZlA1QzFvM0pRK2owWUZCcWZqTFNvY3JNZDZXdGZM?=
 =?utf-8?B?YTA3T1RsQ1ZxK2Qrb0RvblhEWldaTDdFWC8wdkFHQXhiSWRjTlc4Mm5JaUwz?=
 =?utf-8?B?azNpeEMvL1hrcGQ3TkpKYnRDMy90NVRqN3RwcHFwQm84WHI2R2dIQ285c2Ra?=
 =?utf-8?B?V1BSS2tTRkxCa280UWx3NEM5MXQwNDJCNmNBZWFwQndKcnZJV2c1WU5RcUVS?=
 =?utf-8?B?VEhuTEg1dTR0RHB6bmlnMlV0cjF3U0NKdXBIRVFkM2VoU3MvNGNvY2NLelZs?=
 =?utf-8?B?Um1rcHpyT1djaXFvajVPQ2FpR2dWVFpjVEJYOEZka2tTVTFiN2FycWlnZEo3?=
 =?utf-8?B?SjVjRXBJK3FHSkpJcTNDVXdnQjRMaG5YVldtUmphTWtsYkpDa0VpQThFbDU2?=
 =?utf-8?B?S2J1bFFYa29UaGY2MEpvV2cxYjlmSy9yOWt2Vks3VFBsSDJjenBzZUJwdTYr?=
 =?utf-8?B?VUxrN0MrMFdkbFp4TXdnV2lRSWJPVXhjY3o1cnhqOXk2V3Z5QlJ2QTRaN3l5?=
 =?utf-8?B?cDZWNitRYlVaOENJaDBsTlV1WENYK0p4eFhHcG50V0RWNURFZjhPemVRb0tr?=
 =?utf-8?B?L0t6azhLNG4ram5vQXkvem0yL1JtSjc5QWZjMlBqaGNRd3dUMytWVlFtZ3hj?=
 =?utf-8?B?eERNSjNLQUlwOUM3blBnQkQxRlBUSkQzOVgrUW9iRG82c21Vb2dkV3dhSThE?=
 =?utf-8?B?UUhwbm9DR0V5b2F0QnFJNXV4TW93SUNmN0xnYWhlUWZZTUtYaGswa1NWNU52?=
 =?utf-8?B?QktwNmVtdmViN00wVk9KRCtaVzZGWWVmWDY4bDRFemVkbTNHN1NkQ0M5MGla?=
 =?utf-8?B?RjRRTnlBRjJleDhmK1FaK3VmZ1ZBSG5aVlBUME92akIrYVBHVnZZOXdTT3R3?=
 =?utf-8?B?RWhCU0hJVEpldFlaek5yQzV0KzRiN1p1ZFc5Q0R1a1pUU1BGbGIrV2VhVmlC?=
 =?utf-8?B?bWpYRFZ5cGl0N200Rm01VGZjazNFcStjTjVPZlNTK3NsTjlvZlF4bU8vbWRr?=
 =?utf-8?B?dVNTczIwVmdvK2d0NkFpTjZJQ0grbVcrMWVaZ2o1Q0JuUUxITnk0OUlvd0ps?=
 =?utf-8?B?VlpxRTRrWnVTVE1lVllEM09HQTFxeUJ3czJGTngyWTQzandpSWZKWVpZZjBU?=
 =?utf-8?B?SkRKS00vdmZRUXdDTVNEcVlJVTVqWS91bUI1MFZLME5pTFRKRkhNYUdyYitZ?=
 =?utf-8?B?emZBK21GTWxMSEQxS1lLY05odGNNWDh2ekd4NkwvSGJ2dytjaXVGSzNteG44?=
 =?utf-8?B?QWdVZGpjWnpZbkczRC9mRlJURm5mTjZlUHNTR1Jza3B2a3hqekN4dXdLZis2?=
 =?utf-8?B?c2VaV0lSVTZWTmwrY2dubTVPRDBlcDkvdEFQZFJXWU5wMXlmTjY5Mlg3ck5o?=
 =?utf-8?B?ck1hc3p1RTBROUxVUHluWGExbVRNSHB2Rzg1UkF5dnA5Q25wVVdqdmcva25O?=
 =?utf-8?B?VzFCUGFQcXFyRUJvZHBIMG93dEVubmlsMENJdjNDMnZ5Ty84aVRPMXIyZk5s?=
 =?utf-8?B?dDcwZ01wRVVFSzdtR0FzZFhKQTZDTkVCMXJteWpRSGNOZG05M3VjcDg1S2w5?=
 =?utf-8?B?Qk8yUW1zWkR3dkJ2elFzRmp0SVp6b0V4ei9udXNUbmNCVDVxeHRMQXpIUVo1?=
 =?utf-8?B?akllWTNrdFI2Vmh3UVgxOEZlNDJPak8zNS9sN0V5b0RlbTR2REdSdHkxZkdp?=
 =?utf-8?B?Wi9JeTJhcEtGaUUxYjlQdFFqaWxvS2Y3V2FwVDROUkt2VnRFaDNybHNRUGhN?=
 =?utf-8?B?YTlCNXF5Y1hwMUVlU3VlOUY5cVhBWHRVTjBCTjd5d1F2cDRnKzVLT3JBajFV?=
 =?utf-8?B?TVIvSFlndnErUlJnN0RrUVN0TWw4Zi9uU2JkS1Q4Qi9ZNjRWdUJBc0ttT2h1?=
 =?utf-8?B?WU5nblpMTFNRYm5FZHdYQ2hGYTl4SkxzTzM2ZFY1YU1sVmM0TzZjRzVNRnRt?=
 =?utf-8?B?M2xNU3FzWU1GZ1Y1U3RWTEx4V0ZIcVdkQmJTZDBJdXhZTWFiTWZ6MGc3b3JP?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <921934D745C56B4DB314DBE6BEB9395D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7841.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824481e5-77b8-487f-f2cd-08dd50b7058a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 07:28:35.8203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MkmH3nf0hdPMhe++yLhIY75yHe7gWBIoo5L5Ybn4lplMeR6rPy3kFFfDJG9XZf1ivl7Seo8PnEK0cSg+ocm/84VJ4/st8JgSH3qgUzhLGc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8815

T24gTW9uLCAyMDI1LTAxLTI3IGF0IDEyOjQ4ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyNS8wMS8yNSAwMzo1MSwgSGFvIENoYW5n
IGhhIHNjcml0dG86DQo+ID4gVGhlIGVpbnQgbnVtIHdpbGwgb2J0YWluIHRoZSBvcGVyYXRpb24g
YWRkcmVzcyB0aHJvdWdoIHBpbnMuDQo+ID4gQ2hhbmdlIHRoZSB0cmF2ZXJzYWwgbWV0aG9kIG9m
IGlycSBoYW5kbGUgZnJvbSB0cmF2ZXJzaW5nIGEgc2V0IG9mDQo+ID4gcmVnaXN0ZXJzIHRvIHRy
YXZlcnNpbmcgb25lIGJ5IG9uZS4NCj4gPiANCj4gPiBDaGFuZ2UtSWQ6IEkzOTYyYjc4MDQyZDMy
NTAxYTczMTUzMjAxY2RkZjUyYzZiNjJhNjk1DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFvIENoYW5n
IDxvdF9jaGhhby5jaGFuZ0BtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUWluZ2xp
YW5nIExpIDxxaW5nbGlhbmcubGlAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL210ay1laW50LmMgfCAzOCArKysrKysrKysrKysrKysrKysrLS0t
LS0NCj4gPiAtLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvbXRrLWVpbnQuYw0KPiA+IGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL210ay1laW50
LmMNCj4gPiBpbmRleCA1NDAyNDVjMzEyOGQuLjk0OWEyMDE5NmY3NCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9tdGstZWludC5jDQo+ID4gQEAgLTUxMyw2ICs1MTMsNyBAQCBFWFBP
UlRfU1lNQk9MX0dQTChtdGtfZWludF9maW5kX2lycSk7DQo+ID4gICBpbnQgbXRrX2VpbnRfZG9f
aW5pdChzdHJ1Y3QgbXRrX2VpbnQgKmVpbnQpDQo+ID4gICB7DQo+ID4gICAgICAgdW5zaWduZWQg
aW50IHNpemUsIGksIHBvcnQ7DQo+ID4gKyAgICAgc3RydWN0IG10a19waW5jdHJsICpodyA9IChz
dHJ1Y3QgbXRrX3BpbmN0cmwgKillaW50LT5wY3RsOw0KPiA+IA0KPiA+ICAgICAgIC8qIElmIGNs
aWVudHMgZG9uJ3QgYXNzaWduIGEgc3BlY2lmaWMgcmVncywgbGV0J3MgdXNlIGdlbmVyaWMNCj4g
PiBvbmUgKi8NCj4gPiAgICAgICBpZiAoIWVpbnQtPnJlZ3MpDQo+ID4gQEAgLTUyMywxMSArNTI0
LDExIEBAIGludCBtdGtfZWludF9kb19pbml0KHN0cnVjdCBtdGtfZWludCAqZWludCkNCj4gPiAg
ICAgICBpZiAoIWVpbnQtPmJhc2VfcGluX251bSkNCj4gPiAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOw0KPiA+IA0KPiA+IC0gICAgIGlmICghZWludC0+cGlucykgew0KPiA+ICsgICAgIGlm
IChlaW50LT5uYmFzZSA9PSAxKSB7DQo+ID4gICAgICAgICAgICAgICBzaXplID0gZWludC0+aHct
PmFwX251bSAqIHNpemVvZihzdHJ1Y3QNCj4gPiBtdGtfZWludF9waW4pOw0KPiA+ICAgICAgICAg
ICAgICAgZWludC0+cGlucyA9IGRldm1fa21hbGxvYyhlaW50LT5kZXYsIHNpemUsDQo+ID4gR0ZQ
X0tFUk5FTCk7DQo+ID4gICAgICAgICAgICAgICBpZiAoIWVpbnQtPnBpbnMpDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBnb3RvIGVycl9laW50Ow0KPiA+IA0KPiA+ICAgICAgICAgICAgICAgZWludC0+YmFzZV9waW5f
bnVtWzBdID0gZWludC0+aHctPmFwX251bTsNCj4gPiAgICAgICAgICAgICAgIGZvciAoaSA9IDA7
IGkgPCBlaW50LT5ody0+YXBfbnVtOyBpKyspIHsNCj4gPiBAQCAtNTM2LDM0ICs1MzcsMjkgQEAg
aW50IG10a19laW50X2RvX2luaXQoc3RydWN0IG10a19laW50ICplaW50KQ0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICBlaW50LT5waW5zW2ldLmRlYm91bmNlID0gKGkgPCBlaW50LT5ody0NCj4g
PiA+ZGJfY250KSA/IDEgOiAwOw0KPiA+ICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgIH0gZWxz
ZSB7DQo+ID4gKyAgICAgICAgICAgICBlaW50LT5waW5zID0gaHctPnNvYy0+ZWludF9waW47DQo+
ID4gICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgZWludC0+aHctPmFwX251bTsgaSsrKQ0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICBlaW50LT5iYXNlX3Bpbl9udW1bZWludC0+cGluc1tp
XS5pbnN0YW5jZV0rKzsNCj4gPiAgICAgICB9DQo+ID4gDQo+ID4gICAgICAgZWludC0+d2FrZV9t
YXNrID0gZGV2bV9rbWFsbG9jKGVpbnQtPmRldiwgZWludC0+bmJhc2UgKg0KPiA+IHNpemVvZih1
MzIgKiksIEdGUF9LRVJORUwpOw0KPiA+IC0gICAgIGlmICghZWludC0+d2FrZV9tYXNrKQ0KPiA+
IC0gICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gLQ0KPiA+ICAgICAgIGVpbnQtPmN1
cl9tYXNrID0gZGV2bV9rbWFsbG9jKGVpbnQtPmRldiwgZWludC0+bmJhc2UgKg0KPiA+IHNpemVv
Zih1MzIgKiksIEdGUF9LRVJORUwpOw0KPiA+IC0gICAgIGlmICghZWludC0+d2FrZV9tYXNrKQ0K
PiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+IA0KPiBUaGlzIGVycm9yIGNoZWNr
aW5nIHdhcyBmaW5lLiBQbGVhc2Uga2VlcCBpdCBjb3JyZWN0Lg0KPiANCj4gaWYgKCFlaW50LT53
YWtlX21hc2spIHsNCj4gICAgICAgICByZXQgPSAtRU5PTUVNOw0KPiAgICAgICAgIGdvdG8gZXJy
X3dha2VfbWFza19hbGxvYzsNCj4gfQ0KPiANCj4gYW5kDQo+IA0KPiBpZiAoIWVpbnQtPmN1cl9t
YXNrKSB7DQo+ICAgICAgICAgcmV0ID0gLUVOT01FTTsNCj4gICAgICAgICBnb3RvIGVycl9jdXJf
bWFza19hbGxvYzsNCj4gfQ0KPiANCj4gPiArICAgICBpZiAoIWVpbnQtPndha2VfbWFzayB8fCAh
ZWludC0+d2FrZV9tYXNrKQ0KPiA+ICsgICAgICAgICAgICAgZ290byBlcnJfZWludDsNCj4gPiAN
Cj4gPiAgICAgICBmb3IgKGkgPSAwOyBpIDwgZWludC0+bmJhc2U7IGkrKykgew0KPiA+ICAgICAg
ICAgICAgICAgcG9ydCA9IChlaW50LT5iYXNlX3Bpbl9udW1baV0gKyAzMSkgLyAzMjsNCj4gPiAg
ICAgICAgICAgICAgIGVpbnQtPndha2VfbWFza1tpXSA9IGRldm1fa3phbGxvYyhlaW50LT5kZXYs
IHBvcnQgKg0KPiA+IHNpemVvZih1MzIpLCBHRlBfS0VSTkVMKTsNCj4gPiAtICAgICAgICAgICAg
IGlmICghZWludC0+d2FrZV9tYXNrW2ldKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4gPiAtDQo+ID4gICAgICAgICAgICAgICBlaW50LT5jdXJfbWFza1tpXSA9
IGRldm1fa3phbGxvYyhlaW50LT5kZXYsIHBvcnQgKg0KPiA+IHNpemVvZih1MzIpLCBHRlBfS0VS
TkVMKTsNCj4gPiAtICAgICAgICAgICAgIGlmICghZWludC0+Y3VyX21hc2tbaV0pDQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsgICAgICAgICAgICAgaWYg
KCFlaW50LT5jdXJfbWFza1tpXSB8fCAhZWludC0+d2FrZV9tYXNrW2ldKQ0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBnb3RvIGVycl9laW50Ow0KPiANCj4gc2FtZSBoZXJlDQo+IA0KPiA+ICAg
ICAgIH0NCj4gPiANCj4gPiAgICAgICBlaW50LT5kb21haW4gPSBpcnFfZG9tYWluX2FkZF9saW5l
YXIoZWludC0+ZGV2LT5vZl9ub2RlLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBlaW50LT5ody0+YXBfbnVtLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmaXJxX2RvbWFpbl9zaW1wbGVfb3BzLA0KPiA+IE5VTEwp
Ow0KPiA+ICAgICAgIGlmICghZWludC0+ZG9tYWluKQ0KPiA+IC0gICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07DQo+ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9laW50Ow0KPiA+IA0KPiA+ICAg
ICAgIGlmIChlaW50LT5ody0+ZGJfdGltZSkgew0KPiA+ICAgICAgICAgICAgICAgZm9yIChpID0g
MDsgaSA8IE1US19FSU5UX0RCTkNfTUFYOyBpKyspDQo+ID4gQEAgLTU4NSw2ICs1ODEsMjIgQEAg
aW50IG10a19laW50X2RvX2luaXQoc3RydWN0IG10a19laW50ICplaW50KQ0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVpbnQpOw0KPiA+IA0KPiA+ICAgICAgIHJl
dHVybiAwOw0KPiA+ICsNCj4gPiArZXJyX2VpbnQ6DQo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8
IGVpbnQtPm5iYXNlOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgIGlmIChlaW50LT53YWtlX21h
c2tbaV0pDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldm1fa2ZyZWUoZWludC0+ZGV2LCBl
aW50LT53YWtlX21hc2tbaV0pOw0KPiA+ICsgICAgICAgICAgICAgaWYgKGVpbnQtPmN1cl9tYXNr
W2ldKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZtX2tmcmVlKGVpbnQtPmRldiwgZWlu
dC0+Y3VyX21hc2tbaV0pOw0KPiA+ICsgICAgIH0NCj4gPiArICAgICBpZiAoZWludC0+Y3VyX21h
c2spDQo+ID4gKyAgICAgICAgICAgICBkZXZtX2tmcmVlKGVpbnQtPmRldiwgZWludC0+Y3VyX21h
c2spOw0KPiA+ICsgICAgIGlmIChlaW50LT53YWtlX21hc2spDQo+ID4gKyAgICAgICAgICAgICBk
ZXZtX2tmcmVlKGVpbnQtPmRldiwgZWludC0+d2FrZV9tYXNrKTsNCj4gPiArICAgICBpZiAoZWlu
dC0+bmJhc2UgPT0gMSkNCj4gPiArICAgICAgICAgICAgIGRldm1fa2ZyZWUoZWludC0+ZGV2LCBl
aW50LT5waW5zKTsNCj4gPiArICAgICBkZXZtX2tmcmVlKGVpbnQtPmRldiwgZWludC0+YmFzZV9w
aW5fbnVtKTsNCj4gDQo+IC4uLmFuZCB5b3Ugc2hvdWxkIG9ubHkga2ZyZWUgd2hhdCB3YXMgc3Vj
Y2Vzc2Z1bGx5IGFsbG9jYXRlZCBiZWZvcmUuDQpUaGFua3MsSSB3aWxsIGZpeCB0aGlzIGlzc3N1
ZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KPiANCj4gPiArICAgICByZXR1cm4gLUVOT01F
TTsNCj4gPiAgIH0NCj4gPiAgIEVYUE9SVF9TWU1CT0xfR1BMKG10a19laW50X2RvX2luaXQpOw0K
PiA+IA0KPiANCj4gDQo=

