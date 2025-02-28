Return-Path: <linux-gpio+bounces-16788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0671A4948B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03DF63AAE0A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DFC256C8C;
	Fri, 28 Feb 2025 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MPgrtQ/x";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fySGxt+t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0A276D3B;
	Fri, 28 Feb 2025 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734103; cv=fail; b=fdWVwLUUssDzC6EC7AK/6vRgz8qCHdp1Rtk+5Y1w8gf8FUIUky9HLLX47YS9UagqkRBdx81H6B6E0qUFIKnxXuItMpuVueFW2HkOj5TPVLatfHDN5AMn8ZxfDksxTP6HhydeRgMIknMjWV6laTt9UHSp7E32OAT/qJveZFmPteI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734103; c=relaxed/simple;
	bh=V3TfRSOVVWU89lfFcSoz6NscG0ByPoKJPZwqhh0GSI0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tdH2Gw1lnEDBe+jC6bhKiP+CsQTZKJseKfAeszt60BBhIlzHlXknnTprjWQn7m43X2iC6L8fcuwQsb5oEgrx/0J2lH4U3FdpssM3k+ghBz9384OusCZCV7WWMhoAWIHER4SsG5Wf5/DYsx1+je+JCiuwqs2WIs+OlSC2Zpel8qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MPgrtQ/x; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fySGxt+t; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 54b7cd8cf5b211ef8eb9c36241bbb6fb-20250228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=V3TfRSOVVWU89lfFcSoz6NscG0ByPoKJPZwqhh0GSI0=;
	b=MPgrtQ/xHP+hs86d6HZX3Xo9dwiQcLASwcrl9hgY4D/u8izoz2WYhCmbhX63+vY14syq/OF9hhwE3ta5DDYnz7SB+3Pvrv7qUMzYWr2BZ3QdJ81QBqM0YitvYGEY62Xirc0rnl072tPhHCs64GmbtwhoLMNX46cj6h+gfExCF5w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:67397eca-4a64-497e-a8e9-40311721bc49,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cb4407da-654e-41f2-8a8e-a96c1e834c64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 54b7cd8cf5b211ef8eb9c36241bbb6fb-20250228
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 154860553; Fri, 28 Feb 2025 16:59:34 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 16:59:33 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 16:59:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUH0tUJG0mkpUwkDLlyu3mqNQ3kbfHARr+a7W+pxS8l8OqmtyaIt8PU+gmh1vcas/22t/hMODxG8SPvb6HmEDDgMKhXigOjq2fWSmoiJlusUBaLx+9YqG1a4jxlf00JLgceE7Na6lEi4JgqOyjE/DKLAy7m7jljzTtIpWDm46e3HWuco1FoPXgC04kBxKEqo31DZNH7igziL4XLo/wv0EeJuLXE1BraN9jDHLLlPvx4vWaIfIP3AsvMaoSB/XVhIxyaDTwQs3Uv+W510hv9fChnkeuDLObdi1aQH/1awZBKvJ6dlcserkWbUJ6cKzYnRmnc1RXam8WRDkQkY7FtxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3TfRSOVVWU89lfFcSoz6NscG0ByPoKJPZwqhh0GSI0=;
 b=GLrYjsZACypVvQbQ+J6AyPY81LldWICyAmnsShVlmtBGmRqC9LKPPZohFfthatFPj5oP1BEN5jGM7yUFnzQlvJELb0QjZFGGVap+RavV6ObvKU69MD328r8cB/kAWrArO5x6SFO20lr1C2I2pVQIuYnBnMZkkxKZQ1Lc1FiIZGTcqDr2dOkYEOKJ1k5T31kgIDvvUQCNQaHWbd1vJkOM7FZjNLU3vHlT6DTmpL9HYo1rhYG8XJc+f48rskmZpBPbRDCzm6JM+JI2vPqYe4LfT6Nfl00qJndyLZPCrtbfPBVXmyBWYzPHA3IdlfEkJHXRIema3MbKwkrS4h/JMipciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3TfRSOVVWU89lfFcSoz6NscG0ByPoKJPZwqhh0GSI0=;
 b=fySGxt+t31IRt+ZPFXYSnTQry6OZv5cYUrI4VX3/f8Geo5vwrXZVldd77zArKyFoG+tK1EmpePPv6umMbEOCiCx9UsJKUk+RBwzvW4MC7QUybGfCFM+pRY9gZamzxOBjgF4yd8CmFMPhzYp3hbcnSMQ4Z/Nd0yxNmxhuhLJOocg=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by SEYPR03MB8032.apcprd03.prod.outlook.com (2603:1096:101:16e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Fri, 28 Feb
 2025 08:59:31 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%2]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 08:59:31 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?=
	<Axe.Yang@mediatek.com>
Subject: Re: [PATCH v4 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Thread-Topic: [PATCH v4 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Thread-Index: AQHbiX7bCOjjxDUCzkqeQTrFO1RX7bNcaG2AgAACvAA=
Date: Fri, 28 Feb 2025 08:59:30 +0000
Message-ID: <b3b8b1afb7410a779eae4009db76352e921695e3.camel@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
	 <20250228011702.16493-4-ot_cathy.xu@mediatek.com>
	 <4ae2ef45-93c8-4cac-8331-0962085cea10@collabora.com>
In-Reply-To: <4ae2ef45-93c8-4cac-8331-0962085cea10@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|SEYPR03MB8032:EE_
x-ms-office365-filtering-correlation-id: 8c4b4272-073c-4a3c-9421-08dd57d636c5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N2ZqcWtZd2NnNkZnc1AyQmtPbDVnTHQ3dHh4aTlTM3YvNjg5MDVNVHRjVUpL?=
 =?utf-8?B?cVBGdUlVM3pvNjU4ZmJBb2R0aTREL0hLeVc2VGhDSGEzVEVON2lQdTg1eS96?=
 =?utf-8?B?YnpScmhkWHlMbjhicDZIRHBwQ0JnYUpsK3lsVzJXZ2NldFdOalpBa0lUYkdh?=
 =?utf-8?B?dVhVN1VnN1NkbjNXM3ltenc5Vm1jcXFIaUVUZnI3dUtSV093S0tCaWtVbjAy?=
 =?utf-8?B?NGNuMytqUUM5RXRHUFZZVEszVzQxWE1rbVhJekt2VTRVb0hiVkx3NWkrQ2No?=
 =?utf-8?B?NDFoL2Z4bXNHYTk3SDlCeFFRS0lhSHZJcjA5VTZsb3VlNVViMU5icGdSYW5E?=
 =?utf-8?B?WHpMSTQ3Sk43MU1uWHc5Vm9kMHljcU8xWkFDdmlLUHZLdlRjL3lZTkdid0hL?=
 =?utf-8?B?Um5VeVVVeUx5a2t0S2ZqdmxPWjFsbWRGWmloT0xDRmQ0S0ZFMzl6U1p1elJY?=
 =?utf-8?B?YUhkVEh3dXdWaGt6eTNiZkRTWWRMNHZPdm1QV09udUt5U09jZ3d5UUJ0M1Jo?=
 =?utf-8?B?U2N2dElLUFBVK1QyTm1Sd3pVYlVsdWVJTk5YRElTUnVLWWErNXQ2N1dtYWh0?=
 =?utf-8?B?bytLM3RDbTR5bnRXaVBLcnNzTXEyY2l2cnRwR0ZubklxbTlCeG8yOXNDaS9s?=
 =?utf-8?B?cE1rN2dISjJUM3dmVjJkWlpQMlZCRWR5NFhYdFIzaURUUHJscFNNOWFHUHRW?=
 =?utf-8?B?U3ZGK0dubExUYjJnTnM1Z2xzeG1yL05nSVZFZmYwajhoMFZDSnNVTmFjSU5i?=
 =?utf-8?B?bUFXRkx0dTlubFlPYTJEVG5HUGFsNXpJTi94bkFvdnlPTUtxQ2d2UEY5cG1s?=
 =?utf-8?B?eWpGVWcreDF3bUF4NHQrNDFXcU1QTWtUS2hFWTBUbG5Ha1dQdWVRY0I0QWVl?=
 =?utf-8?B?K21NSGJvNGx1V0d5aTdBNWh0ZlRmaW1kRHBRUXloS1F5UTI3cXlpNmxUamE3?=
 =?utf-8?B?NlZoWUV5NldTSWJBMHlld3NlbStpRDhLUFJ4Mm81d0pRa05qQW5keTg3ck9B?=
 =?utf-8?B?RFhETGFtdDY1NWNSZVg5dktCZWJOL2QzY3duc0tkR0xkUTZtSU0zSjNDNUl4?=
 =?utf-8?B?NXR4L0VybEs0bGczTEhxUm5ac21jaFBxcWdFZGgxT2t3ZzJVcmQySWNQKzlP?=
 =?utf-8?B?bnFjbUt3c1FyR2xrVVNWZmFIYkNCNmtFVG5nS0Y5MUZDYzIxQmgwNmlxZ0Rl?=
 =?utf-8?B?SGVIQkRSTTlhQ29uK1MvUmJkczRkUi9xRWVmNzZzVHZqQUZJQ3JZU0ovLzVF?=
 =?utf-8?B?cjhseVR3aktFVWZDbjBXMXNzaGVVYnBJeWVTVWhVWFdsMFU1QnVORTdoeGlF?=
 =?utf-8?B?Y3FEeklWQmNFY0M5TlpjRGIxTVZoRG5GdHRVQUJFUHBDOVdCRnVhYjQxUVhj?=
 =?utf-8?B?bVFGTEFScmhsbGZtL3MyK3F3S1pUeTRONDd4UlY1blZrK1NyTGltTElFS1Uv?=
 =?utf-8?B?TDgvazlNUkpGWWJ0MzB2Nmx1Qm1oeXNFOWdHdTNRTko1STFnTzRoQ3gxRVFT?=
 =?utf-8?B?d29TNHUreWdJd0N1NUorSFJmWllJNUM5VndYZlVqeHU4VkQwVGZ3U3hmNjFq?=
 =?utf-8?B?UnpGOGg0T1JUZ3Y4aGRtYlBzbWZ5ZDl1U0Jtcy9yUGdvSWNWQVdXS25iczR2?=
 =?utf-8?B?MXRjam1vdUlQVmZKYTQvTld3NzM2MUpteUFDc2kwNzg5cEI2WDdoVi9FZGIr?=
 =?utf-8?B?TjZaR2RVTFlDa3hkNTZERDVzb2JIOWROeC9KTkQ2TE1XaXpySWJwSHZpeVIw?=
 =?utf-8?B?cE9vdkRTdnBqUGxkN2VBWjllbDVLdXJrMTlxWUw0Sko0TnN4L0hKTlJGUlJD?=
 =?utf-8?B?U0dOVUUyQkJndGtzZW95K2N4T2ZheU9ZVnRGekxUOTNvODZWU0tMYjFWWmVy?=
 =?utf-8?B?Yk9qSmkwVXNlbmhGU1ZIdUs1N2J0WUNaNGdSQWl5UEJyNlR3V2JpK0pRaUhF?=
 =?utf-8?Q?O945iTOufUse5KOSPkX1qpRLq5DKj+Pw?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUlTY2JmYkxSWDJsVGVhZVpRRHJXOE96am1nMU4rbmMxd1EvREYrbVExUDlj?=
 =?utf-8?B?U254UkdQdXlCazdneWRkaFhxdCtYaWFyTXVIeHlpd1RNamNwV0RlQUtyVDNN?=
 =?utf-8?B?dWZqb1d2ZWJiVlQ5TjJLejd6MUZxeFVzdG9mKy81bzYyU0MweFEwMkxXOGQ5?=
 =?utf-8?B?bUF1Rm1NdTZSQjRRL3lCS3ZuZXFGZit5RW5pa0xDUWt2RXdVT0hIUWozdmND?=
 =?utf-8?B?ZWV2MVF2UDdFMXJ3SlFCeHN2SUhFaVNCZDJZeXlvTDlnMmdpUnJQTng2eFh2?=
 =?utf-8?B?cC9OTVd5NXNvUTFzTnRVMzUvQ1BNWVJCUFhnY0hQRlhsRXVhQnFGRjVNTU5m?=
 =?utf-8?B?TjJFR3BwZ1ZhaVdpcVhSbnJObWVIU05KdHVkUWllQW9LWUdjS3FZMkxmSzNU?=
 =?utf-8?B?bll4UWpCamNVNUtoZ2NxUWxVQTBWbWEzZ0c2OHc3dW9wVk5OSVdMOVBtZ0Vq?=
 =?utf-8?B?eGJFN1hBWkRKL1NiVEExOTJXeFd5YnNyMzF1NlpBUzZkVkRsTExuazliYU0y?=
 =?utf-8?B?bUZaajh2bkdocU5PaEo2UmsvT2JJQ0pJRkxYKyt2V0VsM01wdktiVDBmZnpV?=
 =?utf-8?B?dTNQWkRqMzQ3R2lvOXlZTFVabC9uc0Rrb1FQUytzMXF4REUxa0RKL3BhWmla?=
 =?utf-8?B?TGNOeHBnYjVoZEo4S05NM0VjTmNpemlYWm9NWTNsVUlHY2poTHJwUmVlU3k4?=
 =?utf-8?B?UGZXaCtDV3Awa3pKb1ltUE9VTW13NVZxenV2ZUQrUmVobGJPcFUrZ1VGTXNx?=
 =?utf-8?B?TmlPdC9IU2VUR3dPcDVtTHorL1FwK0JYaHNpSDFQRDhIZnp1d2tmK0RMTUhR?=
 =?utf-8?B?cm5OZkEwdEJaQSs3Vnlnb3JqRVdZR3cvb3VuRy9weFB5b0tYNW51MWI5RUZp?=
 =?utf-8?B?V2NwSWV2YzJkTFRzNmlGQjdJOUVZK1d0c2VRNWZVamxyT3pZZXI0Z0tyRC9h?=
 =?utf-8?B?RWJ4NW9qWkFyVjRvYzYxY2FCZXkwRWJITE5RODR2b1B2S3RKQ0t1UTJOaitY?=
 =?utf-8?B?LzdNenVLNUN1aG82MStjZnY4VENUTWd5K1VuSmoyZGd0bW9aT2YyNzBMUjBI?=
 =?utf-8?B?KzdZbER6Y1JNRTR3NHZFOWVZNmN5ZVNGTGk2dXphUWFEWjFqM3RodDZrUGJs?=
 =?utf-8?B?S0ZpbXQxN0t6a0dHMWNaeGgyeXIzRVFPd0REZkhhZTlsek41cnNDVFY1ZEw0?=
 =?utf-8?B?K2RseVcxWk56NkVmYkJwUmNYUFBsRWZVMHBiSUVLOWFTbmUxMTUwYTFnaFBQ?=
 =?utf-8?B?QnNoUlM1UTJIVXJGV1JJQjhPRVFWdW8yb3crU3ZudkFyZ2U0dXFVMUp6UEdT?=
 =?utf-8?B?OWxxdnRUcFpxNkZtZlppWm10cEt2Y3ROYWt5bUZ1RXE0U0JDS0NzNWtBQ21l?=
 =?utf-8?B?WDk3bXVJTkx4RzJiYWJ5VHdnVjhYUlVQRCsxeUR6ajhnSGx6aXVIZlVtaHhF?=
 =?utf-8?B?d2EwdlNEWldVS212dnc0Q3B2eElQenZDS0Y2Um5xTzM3UXFYUW1hZDVSbGpC?=
 =?utf-8?B?ZyttRkpiNFpZY2tKMkRNZzdGQVdCeSt4WE41ZS9kQ1hqeE5EZ3V1ZnVUZFc0?=
 =?utf-8?B?bSt4clZ1WUpKRUVRdHo2c2xYc2h5b3lBdERaZjVmOXA5alcxVnM2azZUblZ0?=
 =?utf-8?B?b1g5SEluTXZWdGlVNXV2M0gvcDZ5d2FDQzdrdHlEQjZ6WDkzWC9vSXMxdFlp?=
 =?utf-8?B?QTRyeHh0dXNZWmdJSmVwb1N5NzFWMlp5RS9aVDhQbDNHdENPNi82Q05RcElr?=
 =?utf-8?B?eXFud3l3Z0dER1AzczU3dlk3TXNYZ2Rqdmt4b3k2dFdRQXdVV2ZneXZScUlm?=
 =?utf-8?B?SlRRcE9hUlpUQU1GMkNnZ3RKcGZQd2dTckFCMWhjaERyWGpZVHFTR3EzQmEw?=
 =?utf-8?B?MW9iTW9ObG1SMEZ6d3BKeGY0Q0o5RWVQQWhmQVBPbnVpdTgvQWRsaWpCMzBi?=
 =?utf-8?B?WW1NMjNGRG5ZQ2xsOHBSMHZPS0ZTVjh0bVl5NlpmWFhKSmp1VE9LNDhGYVZz?=
 =?utf-8?B?bTlCVHI4YkU3YWI0OVZtdG9PZzJkY1g5L0JYWFdYZXhnNmQwSUpUbUgxM2RI?=
 =?utf-8?B?TDlyTythR2pWaFNrQWpRMGtjcWxjNVFBRG5kVGs2K3RVV1BNdzRHU25XeHhk?=
 =?utf-8?B?ZWtwUnFjdnZ5bnZSRG5jY1pBSHNmck5SNXZNalIxUjB1ajVQUkNvSkQ2S3J2?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC9A6D19DC0581439D481E00CDD42948@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4b4272-073c-4a3c-9421-08dd57d636c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 08:59:30.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGvG0+p3HCZbwaZlaCooMZZLy/uLkB/StddfBzaJQYSIRfJE3P2ANr+yTcs7g959E+V41k3QR0u4J19Wh1JyoVN3R5ILUfId69N9mhE+7CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8032

T24gRnJpLCAyMDI1LTAyLTI4IGF0IDA5OjQ5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyOC8wMi8yNSAwMjoxNiwgQ2F0aHkgWHUg
aGEgc2NyaXR0bzoNCj4gPiBGcm9tOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVAbWVkaWF0ZWsu
Y29tPg0KPiA+IA0KPiA+IEFkZCBwaW5jdHJsIGRyaXZlciBzdXBwb3J0IGZvciBNZWRpYVRlayBT
b2MgbXQ4MTk2Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgTGl1IDxndW9kb25n
LmxpdUBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2F0aHkgWHUgPG90X2NhdGh5
Lnh1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9LY29uZmlnICAgICAgICAgICAgICB8ICAgMTIgKw0KPiA+ICAgZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gICBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTYuYyAgICAgfCAxODU3ICsrKysrKysrKysrDQo+ID4g
ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ4MTk2LmggfCAyNzg5DQo+
ID4gKysrKysrKysrKysrKysrKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNDY1OSBpbnNlcnRp
b25zKCspDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXQ4MTk2LmMNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ4MTk2LmgNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9LY29uZmlnDQo+ID4gaW5kZXggNThmMzI4MThhMGU2Li5iNTlkOTRhMGZlM2IgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcNCj4gPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+IEBAIC0yNjMsNiArMjYzLDE4
IEBAIGNvbmZpZyBQSU5DVFJMX01UODE5NQ0KPiA+ICAgICAgIGRlZmF1bHQgQVJNNjQgJiYgQVJD
SF9NRURJQVRFSw0KPiA+ICAgICAgIHNlbGVjdCBQSU5DVFJMX01US19QQVJJUw0KPiA+IA0KPiA+
ICtjb25maWcgUElOQ1RSTF9NVDgxOTYNCj4gPiArICAgICBib29sICJNZWRpYVRlayBNVDgxOTYg
cGluIGNvbnRyb2wiDQo+ID4gKyAgICAgZGVwZW5kcyBvbiBPRg0KPiA+ICsgICAgIGRlcGVuZHMg
b24gQVJNNjQgfHwgQ09NUElMRV9URVNUDQo+ID4gKyAgICAgZGVmYXVsdCBBUk02NCAmJiBBUkNI
X01FRElBVEVLDQo+ID4gKyAgICAgc2VsZWN0IFBJTkNUUkxfTVRLX1BBUklTDQo+ID4gKyAgICAg
aGVscA0KPiA+ICsgICAgICAgU2F5IHllcyBoZXJlIHRvIHN1cHBvcnQgcGluIGNvbnRyb2xsZXIg
YW5kIGdwaW8gZHJpdmVyDQo+ID4gKyAgICAgICBvbiBNZWRpYVRlayBNVDgxOTYgU29DLg0KPiA+
ICsgICAgICAgSW4gTVRLIHBsYXRmb3JtLCB3ZSBzdXBwb3J0IHZpcnR1YWwgZ3BpbyBhbmQgdXNl
IGl0IHRvDQo+ID4gKyAgICAgICBtYXAgc3BlY2lmaWMgZWludCB3aGljaCBkb2Vzbid0IGhhdmUg
cmVhbCBncGlvIHBpbi4NCj4gPiArDQo+ID4gICBjb25maWcgUElOQ1RSTF9NVDgzNjUNCj4gPiAg
ICAgICBib29sICJNZWRpYVRlayBNVDgzNjUgcGluIGNvbnRyb2wiDQo+ID4gICAgICAgZGVwZW5k
cyBvbiBPRg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZp
bGUNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+IGluZGV4IDcy
MWFlODM0NzZkMC4uMDhlNzIzOWZjZDhiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9N
YWtlZmlsZQ0KPiA+IEBAIC0zNiw2ICszNiw3IEBAIG9iai0kKENPTkZJR19QSU5DVFJMX01UODE4
NikgICAgICAgICAgICAgICAgKz0NCj4gPiBwaW5jdHJsLW10ODE4Ni5vDQo+ID4gICBvYmotJChD
T05GSUdfUElOQ1RSTF9NVDgxODgpICAgICAgICAgICAgICAgICs9IHBpbmN0cmwtbXQ4MTg4Lm8N
Cj4gPiAgIG9iai0kKENPTkZJR19QSU5DVFJMX01UODE5MikgICAgICAgICAgICAgICAgKz0gcGlu
Y3RybC1tdDgxOTIubw0KPiA+ICAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MTk1KSAgICAgICAg
ICAgICAgICArPSBwaW5jdHJsLW10ODE5NS5vDQo+ID4gK29iai0kKENPTkZJR19QSU5DVFJMX01U
ODE5NikgICAgICAgICArPSBwaW5jdHJsLW10ODE5Ni5vDQo+ID4gICBvYmotJChDT05GSUdfUElO
Q1RSTF9NVDgzNjUpICAgICAgICAgICAgICAgICs9IHBpbmN0cmwtbXQ4MzY1Lm8NCj4gPiAgIG9i
ai0kKENPTkZJR19QSU5DVFJMX01UODUxNikgICAgICAgICAgICAgICAgKz0gcGluY3RybC1tdDg1
MTYubw0KPiA+ICAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ2Mzk3KSAgICAgICAgICAgICAgICAr
PSBwaW5jdHJsLW10NjM5Ny5vDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10ODE5Ni5jDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdDgxOTYuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi4xYmFlZmRjN2UzNmQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4MTk2LmMNCj4gPiBAQCAtMCwwICsxLDE4NTcg
QEANCj4gDQo+IC4uc25pcC4uDQo+IA0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfcGluX3NvYyBtdDgxOTZfZGF0YSA9IHsNCj4gPiArICAgICAucmVnX2NhbCA9IG10ODE5Nl9y
ZWdfY2FscywNCj4gPiArICAgICAucGlucyA9IG10a19waW5zX210ODE5NiwNCj4gPiArICAgICAu
bnBpbnMgPSBBUlJBWV9TSVpFKG10a19waW5zX210ODE5NiksDQo+ID4gKyAgICAgLm5ncnBzID0g
QVJSQVlfU0laRShtdGtfcGluc19tdDgxOTYpLA0KPiA+ICsgICAgIC5laW50X2h3ID0gJm10ODE5
Nl9laW50X2h3LA0KPiA+ICsgICAgIC5uZnVuY3MgPSA4LA0KPiA+ICsgICAgIC5ncGlvX20gPSAw
LA0KPiA+ICsgICAgIC5iYXNlX25hbWVzID0gbXQ4MTk2X3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9u
YW1lcywNCj4gPiArICAgICAubmJhc2VfbmFtZXMgPQ0KPiA+IEFSUkFZX1NJWkUobXQ4MTk2X3Bp
bmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lcyksDQo+ID4gKyAgICAgLnB1bGxfdHlwZSA9IG10ODE5
Nl9wdWxsX3R5cGUsDQo+ID4gKyAgICAgLnBpbl9yc2VsID0gbXQ4MTk2X3Bpbl9yc2VsX3ZhbF9y
YW5nZSwNCj4gPiArICAgICAubnBpbl9yc2VsID0gQVJSQVlfU0laRShtdDgxOTZfcGluX3JzZWxf
dmFsX3JhbmdlKSwNCj4gPiArICAgICAuYmlhc19zZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFz
X3NldF9jb21ibywNCj4gPiArICAgICAuYmlhc19nZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFz
X2dldF9jb21ibywNCj4gPiArICAgICAuZHJpdmVfc2V0ID0gbXRrX3BpbmNvbmZfZHJpdmVfc2V0
X3JldjEsDQo+ID4gKyAgICAgLmRyaXZlX2dldCA9IG10a19waW5jb25mX2RyaXZlX2dldF9yZXYx
LA0KPiA+ICsgICAgIC5hZHZfZHJpdmVfZ2V0ID0gbXRrX3BpbmNvbmZfYWR2X2RyaXZlX2dldF9y
YXcsDQo+ID4gKyAgICAgLmFkdl9kcml2ZV9zZXQgPSBtdGtfcGluY29uZl9hZHZfZHJpdmVfc2V0
X3JhdywNCj4gDQo+IEluIHRoZSBjb3ZlciBsZXR0ZXIsIHlvdSBzYWlkOg0KPiANCj4gIkFkZCB2
YWx1ZXMgaW4gU0kgdW5pdHMgb3B0aW9uIHRvIHxzdHJ1Y3QgbXRrX3Bpbl9zb2N8IGluIHBpbmN0
cmwtDQo+IG10ODE5Ni5jIg0KPiANCj4gLi4uLkkgZG9uJ3Qgc2VlIHRoYXQgaGVyZSB0aG91Z2g/
DQoNCiAgVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4NCiAgSSBhZGQgfC5waW5fcnNlbCA9IG10
ODE5Nl9waW5fcnNlbF92YWxfcmFuZ2V8IHRvIHN1cHBvcnQgU0kgdW5pdHMsIA0KeW91IGNhbiBz
ZWUgfG10ODE5Nl9waW5fcnNlbF92YWxfcmFuZ2V8IGFycmF5Lg0KDQo+IA0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ4MTk2X3BpbmN0cmxf
b2ZfbWF0Y2hbXSA9IHsNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5
Ni1waW5jdHJsIiwgLmRhdGEgPQ0KPiA+ICZtdDgxOTZfZGF0YSB9LA0KPiA+ICsgICAgIHsgfQ0K
PiANCj4geyAvKiBzZW50aW5lbCAqLyB9DQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXQ4MTk2X3BpbmN0cmxfZHJpdmVyID0gew0KPiA+ICsg
ICAgIC5kcml2ZXIgPSB7DQo+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJtdDgxOTYtcGluY3Ry
bCIsDQo+ID4gKyAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBtdDgxOTZfcGluY3RybF9v
Zl9tYXRjaCwNCj4gPiArICAgICAgICAgICAgIC5wbSA9IHBtX3NsZWVwX3B0cigmbXRrX3Bhcmlz
X3BpbmN0cmxfcG1fb3BzKSwNCj4gPiArICAgICB9LA0KPiA+ICsgICAgIC5wcm9iZSA9IG10a19w
YXJpc19waW5jdHJsX3Byb2JlLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBfX2lu
aXQgbXQ4MTk2X3BpbmN0cmxfaW5pdCh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICAgcmV0dXJuIHBs
YXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmbXQ4MTk2X3BpbmN0cmxfZHJpdmVyKTsNCj4gPiArfQ0K
PiA+ICthcmNoX2luaXRjYWxsKG10ODE5Nl9waW5jdHJsX2luaXQpOw0KPiA+ICsNCj4gPiArTU9E
VUxFX0RFU0NSSVBUSU9OKCJNZWRpYVRlayBNVDgxOTYgUGluY3RybCBEcml2ZXIiKTsNCj4gDQo+
IE1PRFVMRV9MSUNFTlNFIGlzIG1pc3NpbmchDQo+IA0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0KPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLW10
ODE5Ni5oDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ4MTk2
LmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDM0
MmQwOTE2NzJjDQo=

