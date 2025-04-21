Return-Path: <linux-gpio+bounces-19077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2898A94E83
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 11:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 964F37A689F
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 09:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F4D20FA9C;
	Mon, 21 Apr 2025 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R/Ir+Htj";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="b0Rv6o/o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B61D5CFE;
	Mon, 21 Apr 2025 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227217; cv=fail; b=bBm9TY2T443HRPNdbiex+TVaR0HkU54yOOofzSyWc0eji5uyFAz0oRMDYa9/ECWIqqkUYughIUwG7p+syUFd1U2cTdl/MkJ/d4uIO8QXgJSTb5XNpNYloAyxTIvJFCTHVgCsE/tcs1gL+fB6UQl1yrD2a01TAc18riRA9kMBKBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227217; c=relaxed/simple;
	bh=YdJfZG4p9/rp/h8ilHm3hwriZWQiesSXQLm52IZMM/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k3rPAY7tU6gh6NOWOLAqAMAiENMgi2wTFfKWsGUuhluuyWm948DOq/BCEXQGMw+I1d+5E8Gn+sOpeq3K3yVl751y095F14MCDiaueOoGeVVVXwHw5A8UP25Ri8XDaYwdBykD0bQ31Vx2g36mdPG0g7wP/P/K6iIk8xeLe3bkbU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=R/Ir+Htj; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=b0Rv6o/o; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d2c9caa61e9111f09b6713c7f6bde12e-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YdJfZG4p9/rp/h8ilHm3hwriZWQiesSXQLm52IZMM/4=;
	b=R/Ir+HtjcaQRMzpkAiU2iZakSJd6oKL12xgNzK/ezaRFukiCkOVlJnosvSU1KbyHX0S9oYmsK2dxJU1CZqBFrTqlre7cgx+R9+RtmhhnzyEbTCSI22oJiSZpfWjGYaUHf9A1h/rnEtsn37LDLgcj72GSZJ2FY6291z8Vv1OirSI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5ff1aef9-341c-4176-aab1-b2d2291d2edc,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:36447e8b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d2c9caa61e9111f09b6713c7f6bde12e-20250421
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1975942843; Mon, 21 Apr 2025 17:20:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 17:20:09 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 17:20:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqAMToS7h6/s6LNw97YU++6FZAQrAX5cdOJROtQ2Qrm2wDdHb3w/VTDXImB3S05Km4yBHPC71HDd1SUGbxC3US0srJU6KzHhd2h9k48A8Q9HVshsPq40u0UthUmBuuqSBvt4beSkpjur/WAAmT011FWUAiQX0lrLX2KgqY2FYza+PYkJYN2ygXN+Vhrv2bTzLb0Wbi3pFwjl7Qo9/N0A5QNcPnI9HEPd6Q7x3LVnwMLrTJyV9iKT9xhrvLPATjv/R24fDQSwDxV0Z08cNGX/PwV5lxP/hr3vtZHCXIeoFr+f8zCmpYPqtRqDVhXA6mp8+3R/e/4NC3T5/9jWleOsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdJfZG4p9/rp/h8ilHm3hwriZWQiesSXQLm52IZMM/4=;
 b=a74hpdy12GY0JrGKOSkmC75Df9tJFOZtsg8YPBAst1FWetm8pNU+X1gQ8814VF0qLIFwfeL3Jw+R7axySusL4IZmaNdgG4B2sGuQERO8TYjtXikW4UT/OS0aDkH5wGQZYwrydggoAEK46Vevop5+dciw20S+mSCwuSul3cMVBM48KABoYISKEPxebYr30868H9Qnqq8DfdCnReFa95R4MDzoeClqr1OBq6DL+iGcfZ6s4d6qZDh4/GOtGv8kWRALjq83hs4V4gOSkBlVtguWxTPLSaCvDgqLzmvujI820Hh97lhVHxYabZvT3SKTLE5VXVrh/cuIWKw36Bsutsublg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdJfZG4p9/rp/h8ilHm3hwriZWQiesSXQLm52IZMM/4=;
 b=b0Rv6o/oOQ5ePFCLEykX5gtpbXRsOIioYpk0w0szfLxqpD6iSDdcWOEZab5MHHRTpN2wIaaJS4KbANh8m2/bi81JunSeVtLpYdqeAf774SuKY2DbLk4ZoVSCL5Bqnb25NtZgkK8Ch4vaaE65/UETJrLzvF1/3zGny4paW6s962s=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by SEZPR03MB8016.apcprd03.prod.outlook.com (2603:1096:101:181::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 21 Apr
 2025 09:20:06 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%3]) with mapi id 15.20.8655.030; Mon, 21 Apr 2025
 09:20:06 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?Q2hoYW8gQ2hhbmcgKOW4uOa1qSk=?= <ot_chhao.chang@mediatek.com>
CC: =?utf-8?B?Q2h1bmh1aSBMaSAo5p2O5pil6L6JKQ==?= <chunhui.li@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	=?utf-8?B?SGFua3MgQ2hlbiAo6Zmz5b2l5bu3KQ==?= <Hanks.Chen@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?=
	<Axe.Yang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
Thread-Topic: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint
 pin
Thread-Index: AQHbrqD3EZCe51zS2kKcQt2WV4E66bOt398A
Date: Mon, 21 Apr 2025 09:20:06 +0000
Message-ID: <b5efc09fa655702077ac2958c5f115637b6f64b0.camel@mediatek.com>
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
	 <CACRpkdZ63dWzMg0t96zPFL4+4Ewg1nA=utPJ2QUg2DvmFe0_FQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ63dWzMg0t96zPFL4+4Ewg1nA=utPJ2QUg2DvmFe0_FQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|SEZPR03MB8016:EE_
x-ms-office365-filtering-correlation-id: bbf8d37c-2249-46ac-e3ff-08dd80b5b488
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NWRHSWY2SVdPeG5xcjFoWVh3TXJOUTl4M2dJZ2R6ZEFDQnRNN0ViNTVmTjcr?=
 =?utf-8?B?ajNuNzJuaFNDMGRBSmtyMnJoRFhlNmpxU2xCcTZhb2x0Q3pMcjBCQjdpMWhK?=
 =?utf-8?B?eGZKbGZTa0p1MGZvcHJOYURKU2I2R21JeU9aaXd3ckZUNi9xQVQyVXlrazN1?=
 =?utf-8?B?YzFUd2dqckJMT3Y0OGZYVFhuR3QzV3g0UkdFU0NjbXZ3TmN2R2dQT3pkVXNH?=
 =?utf-8?B?b0dFRGNJWktiMUQxMml2MVpCUC9Uak9XK0lVZVZ5dFBIZ1MzRzc4NEMzaldv?=
 =?utf-8?B?dVduTUZiK1VKUnNxaU8ycTlrUDhzZlZRSGVHSWo0ZWphZSsxRko3QVR5dVJp?=
 =?utf-8?B?ckN4cXdMSGlYOXQwR2NMRDY0STUrdnIwdEVRMlU0L0E5d2VyUzFDTkQ1WEZQ?=
 =?utf-8?B?MVY1WkVhMDZEdjlqT3lINFNYSWd0R0E5SG5kaTI3VWFZWGpjODZRdFNCblpX?=
 =?utf-8?B?ZDZOR2xOZWI3eFBrZHBoaXpVT1o0cW5tYXJ6MlF6eVBkN1AzVjM5UVRXVE5y?=
 =?utf-8?B?TVdDNU52aXlEblR0S3FsSVg4YkozME93bWpJMi9aVTVpVDduSFVrazVCNkNK?=
 =?utf-8?B?ajRoTXVjS2dXU0RyVHZUeURBRWRCVFdqSkVIZGpCa0t3enV5d25pT3F6cGMz?=
 =?utf-8?B?eGwrK25PR2l6ZXZBN3lhMENJN2hFT1hkd0dBM1J5VUZrN0lsVmFaZm5lZ2Ns?=
 =?utf-8?B?a1gzTFNNSTVYdkdHZTljR3I2a1dZU1IzUTlNSWkzRFQ2SzJuN3lRS1p4azFG?=
 =?utf-8?B?clZCTHRVQmNpNDJ6Z0JTT1dCUjVaQmRyOElIajZUR09TWU8vWllXTlZMYy9L?=
 =?utf-8?B?RUliSmp1QkQwb1NIanZjTlZiZkJSeXM3dG1Pa1JJSkI3N0lKMk1pRUZCMWpv?=
 =?utf-8?B?RU5WQXE2ZlVpYjFvTHc5aUF0TWtsaThxdHBrVXl2RTYxbGkwcWFQVldqZkVq?=
 =?utf-8?B?K2VqVWJzaFFOR2hWUklQQXQ0dHJRMGZXNmEzcERuZHo4aHozUEYrU1FhS3Zs?=
 =?utf-8?B?a0FoY2tleHBjSEJ0Uk5GNThJQzlqeXd5NUw1dThYaCs1NGZENzdPZFZuNUIy?=
 =?utf-8?B?UlcxbHZKU1hJcC9XTUp4WkI2a2k3YndhYXBNbkRUK1FtbGRseXlDc1dma0Qv?=
 =?utf-8?B?a09tNkNPUVlIVTRseGgybHl3bGx5S0JRSk5JYzQ1OUYrbUtaQmtJNlN0KzFH?=
 =?utf-8?B?MFdvbW1WOTMwaXV6RFBOdVFtSVg2VXQ2b3V1WjB6Uyt5WGQrZ2JBVnIrNlhS?=
 =?utf-8?B?SXhFTVhuQmY0UWMzVXdVRWlmYzVZMTVVQ2V6NGsyUUpqMWRQSUU1Wi9Pd29B?=
 =?utf-8?B?RXZuMEU2djYxM0NaVk1NU1ZnUXBreDJRZDRoM3FFcW93M1ViTHFZYWE0aGNw?=
 =?utf-8?B?QUZnU3RkVU8xNitJTlYyRk11UGQ0ZkljWDc2WVJCbGlsV2lnZEovMXpnNzE1?=
 =?utf-8?B?UTBFWjNRZGRCSzR1WlpjUmU3YVFSWEw4eUl6Y3FnaVlPeWVqNlRiWDZja2FB?=
 =?utf-8?B?VHo4RlNuVzhRaDJKVnVUbVdpaTRib0F4U01tMTY0UjNJVjQ5TDRXd0xIOTdD?=
 =?utf-8?B?TkNqMys0c2s5NEVxcUFrZnUyc0xyS2NXTTRBdFFldFQySjBvVFFyVGI0YWJM?=
 =?utf-8?B?TXdGTGlmVW1DNEc0VVdycjVIS0dTRU15RlRtUEc3cEdyU2tSbmhIZEN5ZVEw?=
 =?utf-8?B?dmVOTDZxOVN1bTN6RGhiQkFnNHMzQ2t0Z0VmT3U4eW5RcGszaDB6eXNGWmdu?=
 =?utf-8?B?SEliN1pyTVltM2hwZTErV1FXSnZxdm1UQ0tMRHRXUi9lSUdNUDRMMGFIYnNL?=
 =?utf-8?B?ZU51K0VtWG0wNWlzTWkzOHlMbHFjYlByTW9uZU1OZEhoOU9NMmhYOGExNmtr?=
 =?utf-8?B?YVdVYnZYWUFaQWVwYlY3Vnp1SzRNeHF3TFY2bENJeVFJZTVEak0xTXVpWlk2?=
 =?utf-8?B?UEdxUVRpQk9sUjF0V2JQcjBYZFdsTkNmci9nWXdRNlZYMG5VbVgzTExxSHVx?=
 =?utf-8?Q?sGS80nB1T6/80yA8D4j9gjvNvAc9f8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWU4TWQ3Zkt4UEpycmFodEFDOUQwekd5ankwSVFJS280VlhsK1MwSCt6V1px?=
 =?utf-8?B?VmRXNEtFQjVGbHFBdkJ0OTNQakNJdERDR3A1Z1RaL1pKU0p3NzhvdlRmVTJu?=
 =?utf-8?B?MFJDdGVYOEZ5TlJzaENBNTBBTXBsd2syZTZOTXVGM2t2NlRSeGFaMkdrUFNa?=
 =?utf-8?B?eHFjSkYyN0laemNoT1VUV3l1bkk2dlFxd0FDRjczZ3FmbGFPNGdoRDBOQzY4?=
 =?utf-8?B?UVJWeEZLTEJrWTBkcWxmRkYyb1BNZURqTC9JYy9nSUxaNG5zdXZwY0pKQkZk?=
 =?utf-8?B?UUw2ZlFKZlFtdkhvK0RhMUhBdDdWcWc1VXc5Qk1BQ1BKb2ZkcEo3L1h3eWhk?=
 =?utf-8?B?dnpwUjhsd1ZvT1ZqZ1FGQ1RSVXBBbXgzWFBlN09rVmtaQkErMFFGNktzTXBM?=
 =?utf-8?B?QUtoeC84T2x2VG9aRVU4VE9SQ2dpaWtuUXVEQ2d6b1BZMEZOZkZBQzRWUFhQ?=
 =?utf-8?B?M1NCZElKdWprVGFRbUU3NzJGdVplZGNRTkttT1R2Nkttc0ZnMnpNSXJ0cUgw?=
 =?utf-8?B?L1FWd2grTlRMS3l5VUdzQVYrc1RqcDZYWjUyaTJXN3Rua0lHVURmL1hRdlV4?=
 =?utf-8?B?Q0Vwb04wQ3hYOWFJMGYwZW9mMXM0ZENOTFZkMGN2alV2ZjFwSTljWnhIU3Vk?=
 =?utf-8?B?Vm1jdFkrbkIzVk51eWs1cEFHSkEwd0dsWUlSVFFpU2FHWVo1MkJxTmJDVS8r?=
 =?utf-8?B?bHNua2huMjdXTWx2NGFtVktoaXMyR29LdGhrMkdEcGZwSllneUxJd1Z2RjIz?=
 =?utf-8?B?TXBHQWZRUVZNMlEwMGthMDhUQzQ1TmVDMTY5Rml6K0ZZQ05ST1lYSUJTdXpk?=
 =?utf-8?B?eExwalM4RmZYYnRGMHlIMVdCVVpGSUVXZEhONDFnNXFyN2xxN1BYMWYwcHdU?=
 =?utf-8?B?aDM4SSs5Vld1WVl5UnE3b2ozWFZoemh4OTFncjhsdm5LRml6ZEtjNjVnM0s3?=
 =?utf-8?B?bm1DL0FvV2J0U1Vhbkx6bjMzd0Y5MkJrREcvZTRLMjUyYmJPZTJ4MTlCQUlS?=
 =?utf-8?B?ZkZuZWpWbWVmdWFLR3lMMUQzZHhrTFFPd1ExejZhTURjMEFNdDhrYWl6dU1Y?=
 =?utf-8?B?TGwyYnFIbnBqaFQzeVZIV3BNQ2o3cmhOM2FURSt6TU5LNWp3NUtjN3owM0FZ?=
 =?utf-8?B?VEpiclZGNEo4clI4Qm5qOGdwS01LK0luMlBVa21yS01Jck85RmxTOXo0RVl5?=
 =?utf-8?B?MGl6ZFI1VEJRUWhROVFJKzl1OWoxWndUamVzaCtVWFVsa2Uvc2tYY0pvc1V5?=
 =?utf-8?B?UFdoVVMxbUV1aVVGVDh3MzRybWI4aWx0dTdhMU9yT29nOUpPWGpIVldXWFpU?=
 =?utf-8?B?a3I3YWI2N09aV0NUN25ROERqT2QrT01zVk1FeUFtRkdwQjR2MzlIVit6RWpT?=
 =?utf-8?B?RGp3VUY3Zi9ia1drWEluaG5ReW5VV3J0cjdHTDBUTmt1U1JHWlM0a2Vja0tm?=
 =?utf-8?B?dkpjd05Nc09odWloR1FxcFVPZDcvOW4wN3l5WGFFS3lmTUQ4MGhRR2pqeXN0?=
 =?utf-8?B?bWx0aEhndzJjVHBTbTZ5bHFLMUVjb2FiNmtOai9lVzIySEhSZ3k5UUxQWHFp?=
 =?utf-8?B?Q1RnKzNtZWVJR3pyNnpMWE1zSEQ5TldvWkMzZUVsT2ovVW5CUnYvS1NLdC9I?=
 =?utf-8?B?VGptRW5BMXkzMlFmdlhCWlVJY3F0eGkvTmcra1lLWHkxc09ibWEza0IvVEtB?=
 =?utf-8?B?SGZobHd4YXpIbFI0aVNSVDRIUDJLbGlWSWwvcVRtOTZmT0lFTk1hK0RvTDZv?=
 =?utf-8?B?dDVubmtqZEZBcURUdkJ5QUhtdk4yZjg3cytFenBIYkU0UUlnTEVXUEtwN0Fk?=
 =?utf-8?B?TEZlRG9CMUhVQjUxNU41L05xMExTRVdxR1pUM1lWRm83dFJSN0Z0U1ErQXdJ?=
 =?utf-8?B?Y2FTZkkvRzVzdXpPVGNjVDBZU2hzVnhJOExtL3oyTlpBcDh6RmxpVHRxSDJy?=
 =?utf-8?B?RGlTYmxNQUVKdklqWDBiNzdKWTc4eGc3d1J6Q1BXejgwWDlMZm5ZV1Q0ek55?=
 =?utf-8?B?TU54MDMwaHhuSmNGbE5WeUc0NnE3cktZNTNwQWZ1cTk5bjl2K3h2dm5DWXVq?=
 =?utf-8?B?bHA2UWl0YXZTQVQ1TkVlbDdrWEw4SDFrb0ovZGx0eENlcitjZHJObkw2NGRh?=
 =?utf-8?B?eXVoaVpPYUc1VWJheGpRSDdnTmdMWFRvN1RSMGI3a2hVcmo4YkVaTEVsTFND?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAA1DC63973193428D4B31F91B4AEEDB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf8d37c-2249-46ac-e3ff-08dd80b5b488
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 09:20:06.2182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQE3jnQcpEYDYMHyPD6Js25aNXkFJnvj21b5vE3RIQu1iXeiHryTbs4lXvFzFFrFRfRcW47B/GXx4Tu/DqDzCIr4QrT3XXClOMuZnWbpNf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8016

T24gV2VkLCAyMDI1LTA0LTE2IGF0IDA5OjI2ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgQXByIDExLCAyMDI1IGF0IDEwOjQy4oCvQU0gSGFvIENo
YW5nIDwNCj4gb3RfY2hoYW8uY2hhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gDQo+ID4gQWRk
IGVpbnQgcGluIHN1cHBvcnQgZm9yIE1lZGlhVGVrIG10ODE5NiBTb0MuDQo+ID4gDQo+ID4gLS0t
DQo+ID4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uDQo+ID4gW3YzLDIvMl0gcGluY3RybDogbWVkaWF0
ZWs6IGFkZCBtdDgxOTYgZHJpdmVyDQo+ID4gW3YzLDEvMl0gZHQtYmluZGluZ3M6IHBpbmN0cmw6
IG1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3IgbXQ4MTk2DQo+IA0KPiBJIGp1c3QgbWVyZ2VkIENh
dGh5cyBwYXRjaGVzLCBjYW4gSSBoYXZlIGEgcmV2aWV3IGZyb20gQ2F0aHkgb24gdGhpcw0KPiBw
YXRjaCBzbyB3ZSBhcmUgYWxsIGFsaWduZWQ/DQoNCiAgVGhlIGNvbnRlbnQgb2YgdGhpcyBwYXRj
aCBpcyBmaW5lLCBidXQgSSBhZ3JlZSB3aXRoIHlvdSwgaXQgaXMgbm90ICAgDQpyZWxhdGVkIHRv
IHRoZSBkdCBiaW5kaW5nIGNoZWNrLg0KDQogIFRoYW5rcw0KICBDYXRoeQ0KDQo+IA0KPiA+IFBs
ZWFzZSBhbHNvIGFjY2VwdCB0aGlzIHBhdGNoIHRvZ2V0aGVyIHdpdGggWzFdDQo+ID4gdG8gYXZv
aWQgYnVpbGQgYW5kIGR0IGJpbmRpbmcgY2hlY2sgZXJyb3IuDQo+ID4gWzFdDQo+ID4gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9JnN1Ym1pdHRlcj0yMTUwMDgmc3RhdGU9JnE9
djMmYXJjaGl2ZT0mZGVsZWdhdGU9X187ISFDVFJOS0E5d01nMEFSYnchaXZCLVpiRnVLQ2ZoQk5T
NzhETGhFTUp2R0ZCUzlhNUFaVGNvQ2NqbXp6ZWxGU0ZIaWRRTlJKQ1dpblQ4SDFtYm92V3NjdU9M
TWYzR3lub0dvWHdxcXRYN0RjMUUkDQo+IA0KPiBJIGRvbid0IHNlZSBob3cgdGhpcyBwYXRjaCAo
d2hpY2ggaXMganVzdCBjb2RlKSBjb3VsZCBjYXVzZSBEVA0KPiBiaW5kaW5nDQo+IGNoZWNrIGVy
cm9ycz8NCj4gDQo+ID4gLS0tDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSGFvIENoYW5nIDxv
dF9jaGhhby5jaGFuZ0BtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUWluZ2xpYW5n
IExpIDxxaW5nbGlhbmcubGlAbWVkaWF0ZWsuY29tPg0KPiANCj4gVGhpcyB1c2Ugb2YgLS0tIGNv
bW1lbnRzIHdpbGwgbWFrZSBzdHVmZiBkaXNhcHBlYXIgd2hlbiBhcHBseWluZyB0aGUNCj4gcGF0
Y2gNCj4gYnV0IEkgY2FuIGZpeCBpdCB1cCBJIGd1ZXNzLg0KPiANCj4gWW91cnMsDQo+IExpbnVz
IFdhbGxlaWoNCg==

