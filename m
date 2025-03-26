Return-Path: <linux-gpio+bounces-17994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FCCA70F4F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 04:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 318CC189D1FF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 03:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA2A158A09;
	Wed, 26 Mar 2025 03:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ig2X798I";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fMmGwyBz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B7154BFE
	for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2025 03:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742958695; cv=fail; b=mdeTqH9xwneVavgSx8+gl8ffolGuJq7uBdVZt/tFqvFjRzSGBtNHjUwh38tsW/wTUEAdZMg1KamOxLxMe9WuZvdNNbJrJmrxfPvBNbCeQPYDZG1I2nVegMy9cnZ/+f01F8FCRtQcghr9+RhCiowE1RiD0Oj5Gw8thcSooxJLXpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742958695; c=relaxed/simple;
	bh=Djhi2NQGhDrQmkqGEtxOvMBJGLVFEw0Vv7OHMNXikMY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gaXcA9QKI4T5AwVB9I/UjG7r/msB0NHAMkS9b/KjNmQbmbSDdxGcqQMKRe4v6fwCUBdsy9wS2pmx5WWr+GvF9Q2qMWdAeyKBb3sf655i639FV9sPnse4dXFciIccaIdPYka+gA8b/wl7jot9H6vk6/v63Q+UFs20Lc+m/PRl36c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Ig2X798I; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fMmGwyBz; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fc7f3e3c09ef11f08eb9c36241bbb6fb-20250326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Djhi2NQGhDrQmkqGEtxOvMBJGLVFEw0Vv7OHMNXikMY=;
	b=Ig2X798IAe3S2r4W63HXGkYZTTc3L9ONcA7Ksz/8AcWfzrRmq5Qk48QVhtGZmQNS9O4NJEJiKb6RD3L68i/lSxHB3MyqoL93994kD4pPu/0VxKoFh/U/TXaJCh9JhHWxcHD2Lq8bGfwrsEzMvD1cAf15vmo1yltcMDD1OK7LkoA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7560d4e2-fe66-470f-96d1-593a25d4f1ac,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6733cdc6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fc7f3e3c09ef11f08eb9c36241bbb6fb-20250326
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 42998353; Wed, 26 Mar 2025 11:11:18 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 26 Mar 2025 11:11:17 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 26 Mar 2025 11:11:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsmG6yGMRyviuDlmGvv9jmAx/h+6n6Bp0dYbiWrD939BQM4frKqjts66m7xMrMWWT35SWie+ZWvLAhCYQ1kwu9I9Fm+nyVMEbE6v+fSkCO/dRyqF172qHJNHwA4hLaXnUq9lhqdeI2TDMjZC+KDgcQ67OnQthnkt8cmp0XgRq29uYzoSVYzN16VVWGyJpaT8upcB7INXHIrdB+6HcmRx4GoS3DaxDQ6p6IvVZFjJnvbig2QQomhZ20hs2437JdmojzSbvkOd+oOjezuGOA/AxsnR3M6aVLDNdaYgx96qIJaNF5nct4yYyewNdhA4bWXSn1BItRF8OjgTOB8cXGIEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Djhi2NQGhDrQmkqGEtxOvMBJGLVFEw0Vv7OHMNXikMY=;
 b=aQ7WerXhHniPrPGRc9m2DFg+qpPj7C1yWDARYXfQpSHSHIlGJjNi0+g3E0J70ChadxC5GHCkozOQRLy+/vjwkWz7S0Q6uF7oxoDtwMST9UF9/HWvhp84Ogn9ta6qTo4eKWrJ+gXWo39b8hm24GT4DGEkJTrMJPbIkmUuQnN7GbUv5CfIJZTss/VfpYl3Mc8ICQ8hHtJMq3lM72mDG3G1DExNFK+Z6lpQ/q1+3xGBgLjgMjI4hbkiCb45Ts5Jv+vR8QMhhvyjKOhhDPR+Jc5dtdZdRRgKMgrUfdZR3eBgCveMk5Dw1one9CKOhIbNmHSKcf3T8YvgahVJ/blOZsm9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Djhi2NQGhDrQmkqGEtxOvMBJGLVFEw0Vv7OHMNXikMY=;
 b=fMmGwyBzLz9BsMR8EIvYsm0wIjsm0KNF4HKrw31bE3ZigFfaOaeJtdjValpnEo0BNE77Ru5TIFaaTsqIg0Jpo132LC2kt8Lq5tt6Tvdxmi6E9g/Fto5hfRCXQHFARCpTSAWUM4FykoobyCpGjGY86D9ssA4/bU+IxI5p2EMxHL8=
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com (2603:1096:101:173::12)
 by SEYPR03MB7069.apcprd03.prod.outlook.com (2603:1096:101:d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 03:11:06 +0000
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f]) by SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 03:11:06 +0000
From: =?utf-8?B?Q2hoYW8gQ2hhbmcgKOW4uOa1qSk=?= <ot_chhao.chang@mediatek.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [bug report] pinctrl: mediatek: Add EINT support for multiple
 addresses
Thread-Topic: [bug report] pinctrl: mediatek: Add EINT support for multiple
 addresses
Thread-Index: AQHbnUkq1E2wLPg4dkiVPSsnsGC5z7OEvtmA
Date: Wed, 26 Mar 2025 03:11:05 +0000
Message-ID: <5ae93d42e4c4e70fb33bf35dcc37caebf324c8d3.camel@mediatek.com>
References: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>
In-Reply-To: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7841:EE_|SEYPR03MB7069:EE_
x-ms-office365-filtering-correlation-id: 74912c15-2213-42b7-577e-08dd6c13d92a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Znc4TEtBQXFBUWsvazRSV0tsV3FTQU92V1M4UkpyNzdhMC9JNjRCSlZVZnNo?=
 =?utf-8?B?Z0RxcHJUT3g4ZDkxWWJyYmo0WDhRdEdjekpyZkdnRDE0cm9FOFJ1cStvdnZZ?=
 =?utf-8?B?cVBwQ1g4RHA2VHBvQzdIUlZVOHRiSWI0eVEwcWpOeWpxalcwOW1adERYRXZ4?=
 =?utf-8?B?SnFkNUxhdGxOYUxXalo4bEREaUtYdGhNMVVSbGNFb0NIUFFtdi85cGhFOWgz?=
 =?utf-8?B?Sm1FVklzWWJ3UGpmbGxscnE2WnpSWWJRU09BZi9ETEUzSWYwVGltT05VNS9M?=
 =?utf-8?B?WERKVThiSkozQjZaa0JCeE85NFZHUjllREZ0enpZVlNBaEJtN1VGcFAzWU52?=
 =?utf-8?B?TGI1dHhQaEhIMjFLWFFQa0ZQUWhTQis4aHVwMzJGRVZxeU5GU3gzMU94SFlw?=
 =?utf-8?B?c1dVbUlqRTJndG9SMUV0cDA3dGlZWERsOUovZmJ4THdYcU9CTXlGM3N4K0R4?=
 =?utf-8?B?QlRrVDlZN01XaTNOcjY0N2FLR2hTYkMrUGg0UjBaTG05MzhKWlZMKzZMT290?=
 =?utf-8?B?anlqaWlTOTVDZk0wM1lUZkQxOUZMRHBoRXA5ZHhsV1JRZC9vR0lOMzI5QTFY?=
 =?utf-8?B?ODJBbmNLcGtxa2hmaFpPZ1U3VTI3c1VXa2hHa2Iyd1kwaXpZTWhHM1BRTmtU?=
 =?utf-8?B?U3BWVDg1UEJ2VGhQYmxLR3dwakNJYkVTeG01RmNsdU9MbnFLbEJmOThVOXpN?=
 =?utf-8?B?RThmUEFzbEFWbjczQjJCZ2k1d1ZOT29mdnFBazlEZzI3a1ptUGl3MG4zMU9W?=
 =?utf-8?B?a0tzNzNYYU54REJONEdxZEVBOGdIUVBZVHRONk02algxczV0OGMzUmZLbjZE?=
 =?utf-8?B?Q3BFR1ZyOXR2UnRWS0FjQWVOU0c4YVMxdVBFQ2V5aWJNamd5RHBwZGxTK09k?=
 =?utf-8?B?T2dnMkVwd01Ub0M2amlhOVpRNXUzT2ZCZHZBWE9vRGlLbEtqRkxqRFl5WVBM?=
 =?utf-8?B?WG9TNzJPWnpFMkdSN3RhU0V1MTgxTTNFL3daMUxNYmxUcjJQRUNRZUNaVDJ0?=
 =?utf-8?B?TStzd3BQby9ydmtVMGtJbFR3dWlDbjRUWUk1VHlidzB2RHY1aE1sc1hPMzRG?=
 =?utf-8?B?cXBIMjBIUUd1RjRwelJVcnBsY1FpR2d5L2p5djZpYjk4Y083RFlRL3VsVElH?=
 =?utf-8?B?RW52V1dOSnZ0VmdEdGcxeCtlYUlyODlwWVB6Wm5HbkFZWEpTcGp2UXhvTG81?=
 =?utf-8?B?MmRMRDRuV0h2dDlOcEd4YVpxbnUwNjJkVHpZTzlleGpNcndhdnlhb0Q3NFcr?=
 =?utf-8?B?dTVHVjl3SXRsYkZLdFlNSUx4dzJmTUR3aGtvandwL2ZCcmZGbjR2L25OeTd2?=
 =?utf-8?B?QmxscGE1WnJnRzRrYUhtVGp4cnczcHNMZXBMb3FFOFd4cGVTQzRYMkErOXBD?=
 =?utf-8?B?Y3RqenpMemVXbE5peDRBR2JjMDJXUllIdDIrbExZVElzYmIyeVFiNjY0MEhZ?=
 =?utf-8?B?K2Z1SnhVMW0vMHI1d3E3WkxaVHN0R1FFSExvcUpSQXE0S1lhMWlTYUNuemda?=
 =?utf-8?B?VG9Td2YzRDM3TkFIeXQ5dld4Y3IyOHJKb0FEaHJ5cGNjb2lJVzFIdERXUjgr?=
 =?utf-8?B?YnBabXQzVHF0RWsyY1E4V3BHOS8vOUJkMmlaYlNlR0hRK2ZWMys2UTV5ZW90?=
 =?utf-8?B?N2NlVTlHTUx0a25yMk1RSVVCcEc1YUdsUXpBa1lMMUhLOFc1OFIxa2dlUlBE?=
 =?utf-8?B?czM1YkNUamoxZCtEcWc3Q09IOXl1c01ORFhtR2I2Q2NjeE10NUYxazcwY3dS?=
 =?utf-8?B?M0JmZTdoOFl3clNnOGtKaE5yejlSSHE0NWtsSGFHVDVteVFaTVlyYjBCT2Yy?=
 =?utf-8?B?MTNmUjR1eGRYMGw5ZTd4Ym1vSks1OWlDNTVaTTAzcWdidXBxUEp0K2twU2Ev?=
 =?utf-8?B?OG13VnJpZmR0bUJlRnhmZ29sTFVLaWpiaENOLzYwUk5ldmRZdG1DR003cDJV?=
 =?utf-8?B?V3VaTmFHL016TlZDUFZoZUgvcE4vTm5HeS9CenZNbXVvMzlFT0lJNERhcGhU?=
 =?utf-8?B?bVVBbFNtMkJ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7841.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHpPTXZadUpWZHVyU1dIRDEyVldsRTErVzRhM3F3ckw1ZXF2WTVhOTdDcVhG?=
 =?utf-8?B?YUdvd1pRNjFCc0NiSjBWZTBUYWlYVUxCRnlGL0QwMUkrNmUvVUgrZmdMMW5j?=
 =?utf-8?B?OEM2aXFWSTA2RFRISkdIVjZINENsdk05UVBuSzFHa1kzQjJoV0hUK3hON3lK?=
 =?utf-8?B?VnRKRnJic0FEUm1wc21nNGp1akFFeWJqaVkyZy9mSGlJUjIyNzN2YVptU2Fm?=
 =?utf-8?B?R3J5SmhlNnRFY2ZMSGtSb1ZZbVlEMjBSUEZGMkdJTXk1ZXVMYU1aWmU3S1dE?=
 =?utf-8?B?S0NaSDYzSkhKYzUrQkd1b0JGU3pHaGs0dytnWkpJNmxIVzJLbDlQL2xzWXNK?=
 =?utf-8?B?elB2MEJpcFEvbWtnaWtqYWhsQ3UvRGNGSmNxWDIvcWlDc1JCVWhBWWhMa1VX?=
 =?utf-8?B?MFJWaVFEOEs4ZU5LTXpFa3ZjWlVoTUVKTmhRei9FamI1N3VLMlg4V2xwZHRh?=
 =?utf-8?B?VzhsdWh3S0VVNW1pbHZoVFhXenRWRG8yb1UrY2IzSmFLWUlnYms3QWUyWGRz?=
 =?utf-8?B?cFJkOUlEbVhveUMySVNsVUxBQm5JdHArd3M4ZzlpZ052TWYwR3RzaEtiNHlm?=
 =?utf-8?B?UFZ0Vm9KL255S3VMc3FJc3BEbFhsdk1FVG5OaW1OSkNkbVp0NGtjL1hWQ2Vw?=
 =?utf-8?B?UEo1dXNlaWpITG1zbUtZSUlYWVhFSW43SjZwanNEZUtTQm1zQUxTdEY2Y2xo?=
 =?utf-8?B?elBzbCtHb0R6YWFCbGtqWVlYK1ArTmdqVUJLUllHVnA2MFpzMy94QUNQQ2pQ?=
 =?utf-8?B?d0t0UWRSOFptNGdpc3BKbVZiNk82M25QZVhkcG5ZLzJVNXVpV0FnSmxnazVP?=
 =?utf-8?B?dTNYWDRPeU9ucWpGcmdWeUlZbGltTjZjMzJQMUFSU0ZUSCtMbkJrUklxRkd4?=
 =?utf-8?B?bGd3VTVUOXYrS2YxNWpscE5Jdm8yb0x4bWhaUVdXV2JwbmlvU0VjNVQ4QTZM?=
 =?utf-8?B?bjdFcVc0TFRTRDFuMHpZOTB4NklMY2U2eWpMWjBEVEdZYmlyUCtwT0g4bnpK?=
 =?utf-8?B?L0owT2dLY2tZbUIzTitLelNHU2dTbFRxZ3RoL2VqeGVscmlLdCt6WVQvdis2?=
 =?utf-8?B?S250bWNoQnZQQjYwcHRyNFc1WnFZQ0R0cGxUWFNSRkh3cHRqdWZKallzQzRq?=
 =?utf-8?B?Y09OWE5ibkNvNHBEWE56QWFuTGc4NmtMeDVUQ3dkZUJMaDZvdC9VemZ6dWVH?=
 =?utf-8?B?QytmSGZ0Q3N0VnowWms2ZXJObjVwN05JUnBHRFdRelFlUk5WZ2VpYzg1TWlE?=
 =?utf-8?B?T09VbFlFZnBGQXpBUlVVN216bW5SNVFEbHBvVGtzM3AzczdPc2tBdzBGUjly?=
 =?utf-8?B?UGZPY01URHo1NlBCQXdub29BZUR3NE1Dd1RsRGRyNjFKZG1nN2t2cnRlUXdn?=
 =?utf-8?B?cFh6eTBHWEgvbVBROTRhRWMwbWs5NHJJTW5jOFZmalVORDAzN3FKaXNzRDI2?=
 =?utf-8?B?T3hqcUp3VHdtdVpqVUJrcmM3cFpMRlpqTGxTSVdXOGN4elBHS1kxUXdoWkky?=
 =?utf-8?B?RVhwVXZFZ2J1MkZuaWlLeCtsbUNlM1RPMW1YeFZBb25FVWpjU0FDOThQUXBK?=
 =?utf-8?B?Qm1rZTA0enFjRG01cDdFUm4zeHRxMzhSMVJLUng3V05XQ01sS0xlTUNZeDBK?=
 =?utf-8?B?QndyNWpLYng1Q3VHeis3WStjOVpNd3J3S3cyZTQ4WUhIQnR6d0lBSEVMa1Nr?=
 =?utf-8?B?MnBud3Jkck15YS80bmFUV3hPQzVEY2RpV2hrRzNBZ21IQ0R5ZEJyMnE4bVY0?=
 =?utf-8?B?ME9nMUVUaDJ4MGVKZGxRY3BvUTMrZGUwSVpCeVE1N1RydGtQUDk4TlM0OEI4?=
 =?utf-8?B?MUxIbWl2Y3loOHBER3o0TkxKMnBkVzVUOEU2Ullud0xOWkoyMW10UUpEeERN?=
 =?utf-8?B?Mjk4U2dNd1Q0ZFJ3WktJQ2FLSXhJbFFzVE1pOFdIdDd1Ry9wSnBaanJUUUR0?=
 =?utf-8?B?a20vcjNFY0pKM0ZXSVNOMFNHbEZGSDNLSm41aTVCUXMxcFU5eWFld3RNZDE3?=
 =?utf-8?B?NnJEZkFNYjBMQTRvcUEzalBXUUtVUG9lUU5mZmNJK21NYndtalVxc2NabEQ3?=
 =?utf-8?B?UHIyTytlVEN4SHB0ZTJGYWFKeFZSUXBPbSsvMUxmSDdDT2wyQUxnSGVDbURG?=
 =?utf-8?B?Wkd6SEJucStYaG5qK2svZ3E2eXBZSTl0M0dGamQ3SFI1Ujhlb2pkdU52d0RQ?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A0713C2BB3DD74989ABD151E8F38456@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7841.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74912c15-2213-42b7-577e-08dd6c13d92a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 03:11:05.9870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Byz/NjmWzUE2w4XfAwpGpjOZF9T9te43mtemc4FlyipSkSXW/vLS+lv7Gya9heHO5Jn20NMHPt5R2GhhYOFBfdbgUyiC9B3yGq690i6NEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7069

T24gVHVlLCAyMDI1LTAzLTI1IGF0IDA4OjQ1ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEhlbGxvIEhhbyBDaGFuZywNCj4gDQo+IENvbW1pdCAzZWY5ZjcxMGVm
Y2IgKCJwaW5jdHJsOiBtZWRpYXRlazogQWRkIEVJTlQgc3VwcG9ydCBmb3INCj4gbXVsdGlwbGUg
YWRkcmVzc2VzIikgZnJvbSBNYXIgMjIsIDIwMjUgKGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUN
Cj4gZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPiANCj4gICAgICAg
ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmM6Mzg0DQo+
IG10a19idWlsZF9laW50KCkNCj4gICAgICAgICB3YXJuOiBlcnJvciBjb2RlIHR5cGUgcHJvbW90
ZWQgdG8gcG9zaXRpdmU6ICdjb3VudF9yZWdfbmFtZXMnDQo+IA0KPiBkcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMNCj4gICAgIDM3NCAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+ICAgICAzNzUNCj4gICAgIDM3NiAgICAgICAgIGlmICghb2ZfcHJvcGVy
dHlfcmVhZF9ib29sKG5wLCAiaW50ZXJydXB0LQ0KPiBjb250cm9sbGVyIikpDQo+ICAgICAzNzcg
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiAgICAgMzc4DQo+ICAgICAzNzkgICAg
ICAgICBody0+ZWludCA9IGRldm1fa3phbGxvYyhody0+ZGV2LCBzaXplb2YoKmh3LT5laW50KSwN
Cj4gR0ZQX0tFUk5FTCk7DQo+ICAgICAzODAgICAgICAgICBpZiAoIWh3LT5laW50KQ0KPiAgICAg
MzgxICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gICAgIDM4Mg0KPiAgICAgMzgz
ICAgICAgICAgY291bnRfcmVnX25hbWVzID0gb2ZfcHJvcGVydHlfY291bnRfc3RyaW5ncyhucCwg
InJlZy0NCj4gbmFtZXMiKTsNCj4gLS0+IDM4NCAgICAgICAgIGlmIChjb3VudF9yZWdfbmFtZXMg
PCBody0+c29jLT5uYmFzZV9uYW1lcykNCj4gDQo+IGNvdW50X3JlZ19uYW1lcyBpcyB0eXBlIGlu
dCBidXQgaHctPnNvYy0+bmJhc2VfbmFtZXMgaXMgdW5zaWduZWQNCj4gaW50LiAgU28NCj4gaWYg
b2ZfcHJvcGVydHlfY291bnRfc3RyaW5ncygpIHJldHVybnMgYSBuZWdhdGl2ZSBlcnJvciBjb2Rl
IHRoZW4NCj4gaXQncw0KPiB0eXBlIHByb21vdGVkIGFzIGEgaGlnaCBwb3NpdGl2ZSB1bnNpZ25l
ZCBpbnQgdmFsdWUgYW5kIHRyZWF0ZWQgYXMNCj4gc3VjY2Vzcy4NCj4gDQo+ICAgICAzODUgICAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICAgMzg2DQo+ICAgICAzODcgICAgICAg
ICBody0+ZWludC0+bmJhc2UgPSBjb3VudF9yZWdfbmFtZXMgLSBody0+c29jLQ0KPiA+bmJhc2Vf
bmFtZXM7DQo+IA0KPiBody0+ZWludC0+bmJhc2UgaXMgYSB1OCBzbyB0aGUgbmVnYXRpdmUgdmFs
dWUgaXMgdHJ1bmNhdGVkIHRvIGEgbG93DQo+IHBvc2l0aXZlDQo+IHZhbHVlLg0KPiANCj4gICAg
IDM4OCAgICAgICAgIGh3LT5laW50LT5iYXNlID0gZGV2bV9rbWFsbG9jX2FycmF5KCZwZGV2LT5k
ZXYsIGh3LQ0KPiA+ZWludC0+bmJhc2UsDQo+ICAgICAzODkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoKmh3LT5laW50LQ0KPiA+YmFzZSksIEdGUF9L
RVJORUwgfCBfX0dGUF9aRVJPKTsNCj4gDQo+IFRoaXMgYWxsb2NhdGlvbiB3aWxsIGFsd2F5cyBz
dWNjZWVkLg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24sIEkgd2lsbCBmaXggdGhpcy4NCj4g
DQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCj4gDQo+ICAgICAzOTAgICAgICAgICBpZiAo
IWh3LT5laW50LT5iYXNlKSB7DQo+ICAgICAzOTEgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9N
RU07DQo+ICAgICAzOTIgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2ZyZWVfYmFzZTsNCj4gICAg
IDM5MyAgICAgICAgIH0NCj4gICAgIDM5NA0KPiAgICAgMzk1ICAgICAgICAgZm9yIChpID0gaHct
PnNvYy0+bmJhc2VfbmFtZXMsIGogPSAwOyBpIDwNCj4gY291bnRfcmVnX25hbWVzOyBpKyssIGor
Kykgew0KPiAgICAgMzk2ICAgICAgICAgICAgICAgICBody0+ZWludC0+YmFzZVtqXSA9IG9mX2lv
bWFwKG5wLCBpKTsNCj4gICAgIDM5NyAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihody0+ZWlu
dC0+YmFzZVtqXSkpIHsNCj4gICAgIDM5OCAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBQ
VFJfRVJSKGh3LT5laW50LT5iYXNlW2pdKTsNCj4gICAgIDM5OSAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIGVycl9mcmVlX2VpbnQ7DQo+ICAgICA0MDAgICAgICAgICAgICAgICAgIH0NCj4g
ICAgIDQwMSAgICAgICAgIH0NCj4gICAgIDQwMg0KPiANCg==

