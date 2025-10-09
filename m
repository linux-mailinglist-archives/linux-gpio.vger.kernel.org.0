Return-Path: <linux-gpio+bounces-26932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D8BC8AE0
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 13:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F93E4F4604
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 11:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E577E2E1746;
	Thu,  9 Oct 2025 11:00:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023130.outbound.protection.outlook.com [52.101.127.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25CB2E0B5F;
	Thu,  9 Oct 2025 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007639; cv=fail; b=r7VeODi9NGvTE0KgNwWiakhAgiOPE+WNO4WNl7C/IWww/iE5uBHmYb/wyOmWrAB22MrlBpKA2o1qjmTkUYd/7NQ8UxVyPlggeL+38bF+Ur8KfqnsVbEjrvkrJuqpG0DIFsoaQj4PEkhtlIDjGu/sHudwictye5iHfjucuOcT7Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007639; c=relaxed/simple;
	bh=CvrBmlidbVCuCwPDC3TlE7lzxuZwXNd5dYHyw/QvjQ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jqVaCJmnqY7g3cAPHmFvGePrKf0Q7rJmXzQLmsMZjm+hj7DlfIbL0MpYxbK+I9dvoFjO30QhmqhHitMmYWjHylRlUbzMHz8USeFe2jVoMTLE8WpSM4IAobWsFY4gPfp3nl7n0rXSrdu8Sr/cRTXXIf4CRzcAhvMWRGXDOrlZius=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyC4JmI1BTow/WHU1XFMFJ7aHQdH2Cse/jwfOD+ctMiDEVUywKb3pD9znD1eSzvjr6k1R08jCiFsYrBRIihMAjajz9msi2Dd6zchWZMc2WOwU7Djqo0mvzC4RmtQGqMsjUe3NWhOniZaBgiChvNKgLXleaAAHmNGBXWvWTcUxjEldWfsoZh0r3SJ5ZYZAV/ZpWafMDElui+6Oc7FTZUUkkewOBklzNHauPHtCdw2edi76Qx1NLgXFiSu6i1uMVdKMOF6VlhgSn1LDYqLtdd/aCfqD2+5nI9BAEElWShZTUTNdVN78jI8QOA9wVMWiTfm6dB245/ci/phL51hfFIotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvrBmlidbVCuCwPDC3TlE7lzxuZwXNd5dYHyw/QvjQ8=;
 b=rd3gUSlbCfC5x+uN2xc+xW6KlSKTrWaHdtNf4HoyA+dS8CPVPuSA1mpbvErA96kiRdbVcbjC8ETCQuJXP90J9e/oS7B923jkO+BFvwTibGPMTveg1dUPNJiFbLoeN+sgVTdKyKNkV4YTMdK+k64rXTMeTH1A9TaJQeT5I7s+PywVhKJHj4Ro9LZM0dkigcAT6EQKFihE9R5rClMeiCpHJH6zcUhZccCaKwlh/0Xb8BUeq7FhxaJ5bsje/E+nnlak78RSwEjC8ZCrKwzaRJM1xYlGlLBEVEEMPw2ZUkezE8Of/etB2/hCTRwmwz2NEQO7HRhi/+ZuDXYZ4HmSvcZ2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEYPR06MB6335.apcprd06.prod.outlook.com (2603:1096:101:13c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 11:00:33 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 11:00:32 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbdjIgMS8zXSBwaW5jdHJsOiBjaXg6IEFkZCBwaW4tY29udHJv?=
 =?utf-8?Q?ller_support_for_sky1?=
Thread-Topic: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
Thread-Index:
 AQHcI6tw6+x/ILBPUUWp4esQTXOPtLSPcekAgAQSvmCAAGttgIAEYAuQgBN1vwCADgjgQA==
Date: Thu, 9 Oct 2025 11:00:32 +0000
Message-ID:
 <PUZPR06MB5887FD7B2F0F768FAFE4C1F0EFEEA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-2-gary.yang@cixtech.com>
 <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
 <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com>
 <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdaQYb+tB+a9Q6j3xPq=BHbQV5-3hu3XiJkSU9CGtcHpiA@mail.gmail.com>
In-Reply-To:
 <CACRpkdaQYb+tB+a9Q6j3xPq=BHbQV5-3hu3XiJkSU9CGtcHpiA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEYPR06MB6335:EE_
x-ms-office365-filtering-correlation-id: b575156e-2a81-47cd-6205-08de07231142
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y2piWlYrS3NMRXZFRVFyUDZpcTQ2ZWpVZlhrMHlpbUlzYUl1emF4a0RhN0tU?=
 =?utf-8?B?Sy9mUUplVlVmYnNQVTJBU1gwNGpURGJKanpYU3NOMW40cUhncVVsZllDaWZV?=
 =?utf-8?B?SW1QVUY1aTUrMmtZSFZCUlI4OG9maVlORmpmWHloRkM2V3pYd3BFd0syRENG?=
 =?utf-8?B?Qm1UcitZODI0VmlEU1hXeUNWbUl4b1VsdG92VUVqRHFyc1ZPdFd0OVg1N1VV?=
 =?utf-8?B?K29BN0RLUXJZK2JFUUlaUG90VDUvb2JETlkxaEY4czNKQlVtU0J3TmNndGVu?=
 =?utf-8?B?U2UxcEpyT3l2ZkN0dFFXRVBiN0g2N3gwZndLOFBKaUZad0d4YlRoN0tyaEFy?=
 =?utf-8?B?OUNvaDlrdHVvYWlPMzg0aHpYcDgvNHhaQzNsbFdzcXNDcUNVelE4K1FxVzVD?=
 =?utf-8?B?OTdmQ1BDR3ljY3RYSit6UGdkamhGdmY5NG42blpYWks2bFk2a3NWU0V0MVk2?=
 =?utf-8?B?NTdTUVpzV1IrYTJqaEs2TjJYeGtERlZicFR1OExYRlRrbDUycy9hbUpVUEZL?=
 =?utf-8?B?TEVyZGhFY3VmdXRKNStrS2g4OUNiUStYMGlQOTlnWG5YRSs1TTNFQjdMV3ln?=
 =?utf-8?B?NUZPc2hIM0FJblFTZFp0ZlZyTnJGbXVBeDVPWGk4SEpwZ0I3cUdNYjdOeGl6?=
 =?utf-8?B?K2lBZll2QVhZQW5rWWtHTVZFK1BZMzEwWjVNeUFyQU41K3M3b0V4eWtoNXBS?=
 =?utf-8?B?bmwraWsvNUkramEvQlplU1NmYmVyZlJkVm5vTnNIR1h0cEJrVlVhT2wvQWE1?=
 =?utf-8?B?OWFwWGoxbDJDbVJIVTdYdldVL09KdVJrWDR5cERnTW9GZmMrNmRlZ0NIREdx?=
 =?utf-8?B?TVFxbjVubEFMSXU0K1Q1OGR0dmhSdU45L0pLMzZoUzJHTExNRVdlQytETVB3?=
 =?utf-8?B?Q1NVcTJXcnVJYXZSUGgrTlFwOFpoaFJpVUNtaTRHOFN4TldDWi9GVXE5eHF6?=
 =?utf-8?B?MVlUOE5CUVZiMy91ZElwUnJoMUV1dGkyek1WOWdDVCtVdUIxeXJHdndnZzk1?=
 =?utf-8?B?cC9RMUh2bVJ1U1pqTmVjSjF4MVFGanVpTy9qU0FQWWJBa3FtWTRoeUZRU3dm?=
 =?utf-8?B?KzhEMFMwOVdoeHR4VHZlZXNKMG0zVXFGVlZQMU5sVHZRVDdHNDhCK0RzOE85?=
 =?utf-8?B?ZFE3UEVmTWp4a1BZMFNseU5za3U1NmlOU2pyQnM2TkZaYWFkRGxvc2R0OGhq?=
 =?utf-8?B?SFJhdEVqSTFlVVlhMkp4SHpjNWpFUEd5M3BHQjRlL3RKTUxKcmU2eW5Sa1Vz?=
 =?utf-8?B?RExBT0tHOW1TL1FsejcrWEZVNC9mQncvdnRaSExBOVJDUm5zUzhjMXVpM0sw?=
 =?utf-8?B?eGpXVFNGaUdpVXJwVlUrdmEvcUtRYzhtR2psaHkrS3ljc1picHRoQXZScmhY?=
 =?utf-8?B?VEJtVCtTVFBwcEM4eEZuWEo4dGtER2hYN0ZQVHVvdGFqNlhuY1VINS9aYm9m?=
 =?utf-8?B?d3d4S0RYanMwRU94akpSS1Zhc3kzbDlEVytqdS9zRlpJVGtzVEM0MlAzTTdr?=
 =?utf-8?B?Tm00cUVrRDdRc3pBWk0wMldLcSt1QmdONXVMYzVXb3pTZUtpSHFXR3MrYU9L?=
 =?utf-8?B?M2dMVkJ1U0U5UFJGbWhOMjlYSm9FdTVmTEtzZStBZitFVE9PWHU5aG9YWklK?=
 =?utf-8?B?WUZraUhjcXZwZ3MzbXlOME1sRzRHZGttT1B2dzNzVnFjSzlOeU5GQTBXblIy?=
 =?utf-8?B?aUQzSk5vWDZiRHd2T3A2Q0ZyS0dZV2VFTXdvZkVaeStVYzIxSmw4Q0dxNDEw?=
 =?utf-8?B?VGcyZ2VEaXMyc25ma2RuUGt6emJrYmgvSHVXOEdxUUNIdlplMnJjOW5ybXJK?=
 =?utf-8?B?WFpvTmwycVNKV0FUUW9ldlV1dUpMRzBJdy9hQU5HVDZLMFVia0UrNzhZUkpY?=
 =?utf-8?B?Lzh3NThKTW5ubDBOSG5hYnlNYUQxT3U2dlZMcmkvSWg0VXpZV3hkRlIwZWs4?=
 =?utf-8?B?dXdkQTh5UzdoMGc1OUJJT2x0dG9yWU0wdTlBbkRONkpqYXNXSXNYcVJxTm9X?=
 =?utf-8?B?SnVueCtZbFdJYjlkNUlPalhmWW5JUXNaeWNPL1BWTlZlcm9tcWJJY1NZZzFR?=
 =?utf-8?Q?wNMjN4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWV1NkttSTVoRWloa1hUSTNmL2xIY2hkbC9qeW9RUVBhZFJZMjVLUm1XbW5G?=
 =?utf-8?B?UCt0cFhteGRRS09NVXppU0xITXpSS2d4NHhrMUlRb0ZRYnJEUjU0Q29jZ3h2?=
 =?utf-8?B?M0tNWGJmakxZakU3bkpNK0RFS1RpcnJsSXhlWWtTeTdoYUw3clBFdy8vVXYr?=
 =?utf-8?B?Nk9HVjBscWZyMlBuU1VIanN3YzhBTlFuSlJBb0lXc0ovQVhrbkNaTG9IRzMr?=
 =?utf-8?B?ZmtyLzZwTTlqTUFwYkhZNVUvd0FTbjhPWU9PWXV3c0FMNUtzWm5tYnB4VDFO?=
 =?utf-8?B?dVllTHc0VlFCdDFuNENPd00rVERvOWNqMEthTzY3VHloNC9KM2xkOWJBNlNs?=
 =?utf-8?B?c2hKVlFacFVDc2ltczZMdmRnZUVWQ3VNK2VLV0hPSEo4bllRTGRMdEUzVC9L?=
 =?utf-8?B?MzJZdzFvRlNnb1RHVVVodkxuT3dia2lOaElEYVRiZU9VZ1pkYjY0R0paZEVG?=
 =?utf-8?B?Rk5SVDFEeHk3QzNuOTNCSjJtKzF6VFBaM1pWV1Y1QXRvYndHcC91Q0w1Q1Zh?=
 =?utf-8?B?amRBeEZCemNFekpmV0oyYmt5OWlac3NWTDFIVGRrSDV3czZEVmt1Q3VCVkpm?=
 =?utf-8?B?SXlqakVyQ1J5U09LYUZJSy91Rm0wdUdqUG5GRWlMZk9lVVVhSlBNa05tT3ZR?=
 =?utf-8?B?c1hGbUFENGdiMFFZZnVMRGgwSkZIeTFkdWdxMk1OMFZJWEc1cEJZa1IzdEMr?=
 =?utf-8?B?enN2Qi9pc3l3NUdEQU11S3JpdWlyZzNxQlhzYU5iQzcxdVdGMVplT2pobGNy?=
 =?utf-8?B?eHNyelRKbUw2WU9kTmxYM2UwU1FJRmR0MkNSWlNoV05EWEFZYW56bjRRb0Ft?=
 =?utf-8?B?MDR1NHpNV3NqdHFTa0ZMeFdVUDRMN0RaQlVsa0N6blFDbkxkYmFFZmJZMFVO?=
 =?utf-8?B?ZTlDV0FRWEsySmdHVnhONXVvWE5WMUx4b2NjVjZaQXRRZ0lCNGZIZ08wM1Vw?=
 =?utf-8?B?TFl5SHJDYnJWQkJRaUtkOXRwODNVSjR2aU1oOXBIVm5scXdQYS9EYm8yN00y?=
 =?utf-8?B?U1NuMURZa0w3TG1nbS9wWTNEYkVVMUlqa0tMZGZ0SGhaRkxKR2VQUmRvM3Qx?=
 =?utf-8?B?b3JiVmdOQzJiL1lCeTM2TTB4S2laUlNGY29MRTZVcjJHVWMyNXlRYlRYTko4?=
 =?utf-8?B?Q2Z3cGM5UUxva2ZXdFVQdGQ2dHEvekg4bEJHOWYzWWt3YlFkblVFV0YzSXhj?=
 =?utf-8?B?dnc3MFE0M3ZrZTdRakFMeGNKNDgvd09QcFhIUVFpaVlSaDhaVmplcmdlWGlL?=
 =?utf-8?B?VFF2NG02MkxaU0JNMjRUcm94U3FLZ0dHYXpwT09ydGR5dENwdjk4dHJieFlr?=
 =?utf-8?B?NERPaVhEdEVDOVJDazZmUWJIUzUrNnhFbWF6TmJyRm94NTMreXBVNUJTYVc4?=
 =?utf-8?B?TVp3WjZYOFJIZlErV2tIejN0QnMxemMrS2R5VjRDdWFWRW9NWEd6SXRMTzFp?=
 =?utf-8?B?S0xhNWpSRlhuYUdnQ3RaTzVEaFc1WDJIUkhTSUI3QjJrMkFySzJkUS9ZU1ZT?=
 =?utf-8?B?a3ZteUN0SVBVdkh0dWVkdTA2NjJKeFpXQTAzSTd6end3a3Azem40R3BDY3pS?=
 =?utf-8?B?M2VRQUxjZ1laVkNxWmsvcVlYZnlBU3YwbTBwancrZDNZQTlPc1dMdmNPUWFn?=
 =?utf-8?B?VHNEV0hyLytMTnErRzBSU3orYjlGdTBUSUdqdERZbnVkN1NGbWVQNnEybkgr?=
 =?utf-8?B?cG5tb3lYR3p4RTRVcVBTcEdQbTV5YURHaGlWWGZqSlI3TThhcTI5MDNzdlNJ?=
 =?utf-8?B?MmNmakJTdkVXMkFPdXJUR2UwelM2YVBBUWN2SkVmdWRYSkdwMnVPSmRhZ1VC?=
 =?utf-8?B?QWM5bFoxYk9hWFhaRkRza01hZVNOSnhDM2k3MHR5OVhNU1JYR3R0U1l4UE55?=
 =?utf-8?B?TmFubVovUW1CRmtSQlVxN2dDMmVhN1N4NmNBV08zTXA3Uy84ZnUxSk1QN1F4?=
 =?utf-8?B?bDhwa09zVEFtbk51b1pFbTRqV1diVit3Wnd2eUlIdzRVc0VEWUhxR2t1TnFm?=
 =?utf-8?B?ZFcyQi94MzFVSzIrWWlHZ3JrYU9hTW9XSmw5ekFBNkpEVFRqNXdsTlFuOE40?=
 =?utf-8?B?Tk5ic0d0dkhxeW55bUViS093T1NaQkp4bXZhOEw4R1NKRy9lZ3FuandTdk10?=
 =?utf-8?Q?QxlnXK+Kwz+oE/v3x8pR97j94?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b575156e-2a81-47cd-6205-08de07231142
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 11:00:32.7493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: flAgb5Vja0iLg8r5Xql8UvsvzpA9oA8Bbnnqq8RM387WWI5T39NQZeazSYChhKEXYF4YEb1TfXmp6Uds/ZGoCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6335

SGkgTGludXM6DQoNCkknbSBnbGFkIHRvIHJlY2VpdmUgeW91ciByZXBseS4NCg0KPiBFWFRFUk5B
TCBFTUFJTA0KPiANCj4gSGkgR2FyeSwNCj4gDQo+IHRoYW5rcyBmb3IgeW91ciBlZmZvcnRzIQ0K
PiANCj4gU29ycnkgZm9yIHRha2luZyBzbyBtdWNoIHRpbWUgdG8gcmVzcG9uZC4gSSB3YXMgY29k
aW5nLg0KPiANCj4gT24gVGh1LCBTZXAgMTgsIDIwMjUgYXQgODoxN+KAr0FNIEdhcnkgWWFuZyA8
Z2FyeS55YW5nQGNpeHRlY2guY29tPiB3cm90ZToNCj4gDQo+ID4gTmV3IHNjaGVtZSB3aXRoIG1h
Y3JvcyBoYXMgdmVyaWZpZWQgb2suIEkganVzdCB3YW50IHRvIGNvbmZpcm0gd2l0aA0KPiA+IHlv
dSBiZWZvcmUgc3VibWl0IGNvZGVzDQo+IA0KPiBObyBuZWVkIHRvIGNvbmZpcm0gd2l0aCBtZSBq
dXN0IHBvc3QgaXQhDQo+IEJldHRlciBvbmUgcG9zdCB0b28gbXVjaCB0aGFuIG9uZSB0b28gbGl0
dGxlLg0KPiANCg0KT2ssIFdlIHdpbGwgcG9zdCB0aGUgbmV4dCB2ZXJzaW9uIGFzIHNvb24gYXMg
cG9zc2libGUuDQoNCj4gPiA+IEJ1dCBJIHRoaW5rIHlvdSBjYW4gc3RpbGwgdXNlIGEgbWFjcm8g
dG8gZGVmaW5lIHRoZSBsb25nIHBpbiB0YWJsZXM/DQo+ID4gPiBBbGJlaXQgbWFjcm9zIHdpdGgg
ZmxleGlibGUgYXJndW1lbnRzIGlzIGEgYml0IGhhcmQgdG8gd3JpdGUuDQo+ID4gPiBTYXZlIGl0
IHVudGlsIGV2ZXJ5dGhpbmcgZWxzZSBpcyB3b3JraW5nLg0KPiA+ID4NCj4gPiBJbiBoZWFkZXIg
ZmlsZToNCj4gPg0KPiA+IHN0cnVjdCBza3kxX3Bpbl9kZXNjIHsNCj4gPiAgICAgICAgIGNvbnN0
IHN0cnVjdCBwaW5jdHJsX3Bpbl9kZXNjIHBpbjsNCj4gPiAgICAgICAgIGNvbnN0IGNoYXIgKipm
dW5jX2dyb3VwOw0KPiA+ICAgICAgICAgdW5zaWduZWQgaW50IG5mdW5jOw0KPiA+IH07DQo+ID4N
Cj4gPiAjZGVmaW5lIFNLWV9QSU5GVU5DVElPTihfcGluLCBfZnVuYykgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPiA+ICAoc3RydWN0IHNreTFfcGluX2Rlc2MpIHsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICAgICAgICAgICAgICAgICAgLnBpbiA9
IF9waW4sICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICAgICAgICAg
ICAgICAgICAgLmZ1bmNfZ3JvdXAgPSBfZnVuYyMjX2dyb3VwLCAgICAgICAgICAgICAgICAgICAg
XA0KPiA+ICAgICAgICAgICAgICAgICAgLm5mdW5jID0gQVJSQVlfU0laRShfZnVuYyMjX2dyb3Vw
KSwgICAgICAgICAgICAgXA0KPiA+ICAgICAgICAgIH0NCj4gPg0KPiA+IEluIEMgZmlsZToNCj4g
Pg0KPiA+IHN0YXRpYyBjb25zdCBjaGFyICpncGlvMV9ncm91cFtdID0geyJHUElPMSJ9OyBzdGF0
aWMgY29uc3QgY2hhcg0KPiA+ICpncGlvMl9ncm91cFtdID0geyJHUElPMiJ9Ow0KPiA+DQo+ID4g
c3RhdGljIGNvbnN0IHN0cnVjdCBza3kxX3Bpbl9kZXNjIHNreTFfcGluY3RybF9zNV9wYWRzW10g
PSB7DQo+ID4gICAgICAgICBTS1lfUElORlVOQ1RJT04oUElOQ1RSTF9QSU4oMCwgIkdQSU8xIiks
IGdwaW8xKSwNCj4gPiAgICAgICAgIFNLWV9QSU5GVU5DVElPTihQSU5DVFJMX1BJTigxLCAiR1BJ
TzIiKSwgZ3BpbzIpLA0KPiA+ICAgICAgICAgICAgICAgICAuLi4uLi4uDQo+ID4gfTsNCj4gPg0K
PiA+IFdoYXQncyB5b3VyIHN1Z2dlc3Rpb24/IFRoYW5rcw0KPiANCj4gSXQncyBPSyBhcy1pcyBp
ZiB0aGlzIGlzIGhvdyB5b3Ugd2FudCB0byBzdHJ1Y3R1cmUgdGhpbmdzIQ0KPiANCg0KVGhhbmtz
IGZvciB5b3VyIHVuZGVyc3RhbmRpbmcuIFdlIHdpbGwgYWRvcHQgdGhpcyBzY2hlbWUgaW4gbmV4
dCB2ZXJzaW9uLg0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCkJlc3Qgd2lzaGVzDQpH
YXJ5DQoNCg==

