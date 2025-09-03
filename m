Return-Path: <linux-gpio+bounces-25423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77089B41366
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 06:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15E5A7AC983
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 04:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621682D1F5E;
	Wed,  3 Sep 2025 04:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NcjIBun3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991432D0637;
	Wed,  3 Sep 2025 04:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756872434; cv=fail; b=rv1kArB4EqeRO+p8kpKzoHyKqXOYkIbK1tcrFpH7z/Aurohvb8MYcvQrJb8SU+2n5NT/B23mFX86LGimjVi2QH3zT+Sn/LvG4ORJ+8BBJ1iFw3ItHTL5gQsIRSeqEtlbh1D5h+B5i43g/N4nMOHASFd56/nNr5WIn1JlKRDGPak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756872434; c=relaxed/simple;
	bh=JiNUeGcM5IWsIIel3mfzwFSDFhmVT9YnuETv3FP2jXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=twFvZuYHtHhifebhQ2caflEcXG7vFyPLjCU49FdPEjJbvO4SYD5ALdmC0I0yOtWRWpOduAxFvKkQ7MRZUb5uNdOmQZWYYhFW9kaBRKX+IZxrfKaTVlhZ8Vpo6iQOpRBy3h/zfVMjPo8+WYd85uVaFN9QWvc1RlDD01cc4Hv9RDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NcjIBun3; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXgnTWYATK7kjLpyabMY3cRWn9RDCdlFyS6dczYySc0PhC8Uhez6vTbilC/IdOJLCtgbcAr5NGwLsaJvC1t7dPTW0/J2moaDTx1FkE6CbSowIFoMpQWYXygI1XhNCXAnGjRelD/9hwdLfBF5IVKbHfdr7xE4ONTvqCEByzNBH41n1/VDmTE2HdDQfOhVpXaubdtV4kL6qTPI1p8uya+6o9XR5/jeWrlUgTUPhsB7KK3rEZa4m+T2NBdcE1x6NChlciLD+NYrgQ41VBAs+qQb3NB/dInUcV++hnhG91z5FEngMa5GcuiaLiNt1kz/xIKuXqQZcglLQaCc1kCXsX34hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wrryc+xoDAL8WbxL8l5WFdCaEHYGlAMgC3ifbkVKLJU=;
 b=orhtK+WqCsl9s1xMC3xXpCblo+Zb8sKAMlgLfZORVyKrEJJVoC2Or3UdkLZhaz8GlLgjgxyux8S13pt/JevMDInzbbbUtTEzWXh1fgxwa2InfjAuaAd7fNr4bV8tSLn0GmL+naTMOjssIgL7ru6CoaM5ujSyivdl1Uhub6tjOfnmclYRuO5VQo2CHft+g8uYyi9vIEEySlvVyTI6NEN35RyZKO1Oy7GCnGHtzY7ss8lwVGFNBFgJLgLDtYx+YxznLFVusUlB4BRDPcLtbsOUEQLbY+UZFqWaS+bdtAEqbzOcW07Y50OYtqFx5tAMQqEExZ2qzf5Ng6l4TUJl9vUXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wrryc+xoDAL8WbxL8l5WFdCaEHYGlAMgC3ifbkVKLJU=;
 b=NcjIBun34zhfeJVW70wt38HRtBo0Z8y85CSRWON4q3cZkMJx46lxrdphnrWFJ/7N55WBdd0E4RVLcc6pN2fQvaYXYl+tsaf9WaD7Ld9Fhq+RGNwK60GdGFgF7p0iT+Cp0XOoOBUwYZpnZLmP+GNeOyaP5ksDfai5rEUdhcFshUEgAL/MUodRFzRhgeHBywykF1ylNM8tLTbchN9iXzYnurourpavPv9fcowimCFCi4/v3YeplxNxdR1ayUyXmkWONwn3s+LcbwVdNO1IXdLw27YFCjVJiL59tZ/APfkaKTopa47OHFHU8sR54A2UEn4EY4Xo0NUhpqC29qD8Hpql1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 BL1PR12MB5924.namprd12.prod.outlook.com (2603:10b6:208:39b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 04:07:08 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 04:07:08 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 webgeek1234@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: tegra: Add Tegra186 pin controllers
Date: Wed, 03 Sep 2025 13:06:38 +0900
Message-ID: <5247140.MHq7AAxBmi@senjougahara>
In-Reply-To: <20250812-tegra186-pinctrl-v3-3-115714eeecb1@gmail.com>
References:
 <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
 <20250812-tegra186-pinctrl-v3-3-115714eeecb1@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|BL1PR12MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: bc61058e-31f9-4c51-0889-08ddea9f59cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajZTa1d0TVZsZVFzTFVnaXlFaDYwRVJJQlZyMGpwd1hxWlIxNWxpb20xelRB?=
 =?utf-8?B?cW1EdDdOb0l5NFVMc1FYZkhUK1J3WUJkajl6Y1dMOCtsdUI5b2RIcVFuU1NQ?=
 =?utf-8?B?UGFiWU1jSXdRRFQwaG5uY3cvTHdHSitFaU41QzdpZ3lDbGEyVytLeE9oUVI4?=
 =?utf-8?B?Y3JWK2ZTaWJzZEdUYzZTdnJ1dFhobHhnUk1YcGY1ek5wcVB4dnkxdHlTYUtz?=
 =?utf-8?B?UnJSUmErbnNzRzVvSEh2cEh3Z1JTT1g1N3pWaHFLR0wyZ1QxUThsTlFJQ1RY?=
 =?utf-8?B?R3VuOTdFTGtvcStnZXNybnFmbmRKT2tVTmprUllzUWkwQitwTDZqTTEwajV2?=
 =?utf-8?B?b0RvNGs0MlMwQzNldmVUenhnb0s4MXI3S1dZdXlXcy91elBDR05MRDRRY2lT?=
 =?utf-8?B?YXJhaUliQkpIeHNoOVhzQXZveEhzaVhPdncyZ1N2cWx6RVBGalh0SkE3Nkgr?=
 =?utf-8?B?N2dGRTJaRmJyVmhIMHJQOFZ2NjlkRGp2MEl3RXRodWtsRmxXbkZXeGJVZkxM?=
 =?utf-8?B?NENDY0huUDhVT2pJYnlobW5pK1I4L2tOSmVhZU9lbUN3MERxeXhzeGZIL1Jm?=
 =?utf-8?B?ZkdGdUlNZmZXQTh0d21XUG9ObllnTXBUb3IreTdGV3NkUkVJT2U5Yi9UU1FF?=
 =?utf-8?B?QjJsNzdHM0greTBnRWdldWNONG5jeHJtNnZNemlxeGNacG5QOUc1K2ovQlZa?=
 =?utf-8?B?YU1GZmtvcWNYcTBIdE54MGJ0VUkrT2Z3MTIvQjNzWnBQQmdscTNqejVlSGpQ?=
 =?utf-8?B?bmVDSzBlbmJJYmZDTExGU2VDZ1RSa3dCeHJMbDFha1F3NUhZemNYZFlhU3lK?=
 =?utf-8?B?cEZTeFhpY1ZjMTBnUXRFWFNQOGg3ZkF5VTdjaVRDS2dzWmFzR1dUMHU5ZUlw?=
 =?utf-8?B?djRkTlhYOTlkdkp6bWpKY1BRWVFJdy84bkhScno3YTFZOGo2K2s4YTJJclla?=
 =?utf-8?B?NXZ2ajhrY1l0SzU2UnF5V3F4MXk4Q3dZa1VZcVFiTU5aUmFiOWRJcnhnUHlL?=
 =?utf-8?B?WG01NnJQbW1RZjJrcVJjdnRQQWJDL1BYaXQxcitUQnhCbU5NRElMbkp4by9E?=
 =?utf-8?B?TTRNZWdGRXZicmc2YWVTaUNzZFRFakJIQVBLS0hKeTdqYkNLK3d0YTFIdDVt?=
 =?utf-8?B?NHRwa0ZvTzA3bnZZRTVrb2dxU2ZYRnRvMklHWjFCWWpqZE5oa3RjY2x3Undp?=
 =?utf-8?B?OG83ODh0Znoxa1dJUTR4N2xhTlFpcUZhTzQ3SkpOUVBac1ZBQlkvSHJHdGxH?=
 =?utf-8?B?K3doZUYwRTE0Q3lxYkkzWlRmUjVqL25HakhVSXRPU0dyWXc2dm1VQWtUMlZQ?=
 =?utf-8?B?dFpjbjlaT3B1dkViaEc4b2l0cFg5RTNLUXJsUHpycFpQRFJRUFcwUGRsT1lC?=
 =?utf-8?B?R1BQeHIvenNGUTRFOUxNazV0STV3b04zbjJKZEQ2Yy94dUN5ckpLVXI0aTRt?=
 =?utf-8?B?UFZqWVlwWktERnpDOXdRNERBaXFyT0tsR2o5aVBPQjZoK1lUYS9mbXlNL3Jr?=
 =?utf-8?B?WUtoUHdlQldrWC9DUmNBUHdEUDRkSjNRbngxTzZOKzRxMDRFcU5SRU0yY0Fz?=
 =?utf-8?B?dzF5blVJaFF1c0d2ZXlRenFnWkd4UVVZVlhvUGIxOFREOHVnUEVaRG05alpR?=
 =?utf-8?B?NUJENnZvZE42YmN5SW4yMHpWRlpOWW9mUkMvQUNOM2NwMnRJQ3VQaDZybHpF?=
 =?utf-8?B?Q2ZBbzFpV3E0emp4MDNnZ0UwbTE3OW0weXVDUVRuaVJ3RGg2SVhjR1U4L0pD?=
 =?utf-8?B?RjVNU1h0cTM0bWtueFZwQ0xqbWRNNCtkQ3lsaWJHcFJmdjc0dGwyTVFWQ211?=
 =?utf-8?B?c2JGM0pYQnFid09yZVp3bkxNUHJiRWhVUTV3bnlCN3R0TndGYjNrWmN4cmUz?=
 =?utf-8?B?ak1GcGo2U0VHOWdxUDRKQm9oTStQeHd4QzJFZnZJRVliOWI0ZkJQQkp6ZDBj?=
 =?utf-8?Q?eEjJtnMzuGE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjFLQmZsYmdSY29zUlRuTDMwM0NGN2hCeEtEOVdCZVV0VmJHQzYzd2c0bzB0?=
 =?utf-8?B?ZkRDbzhGOHZxM1FEcE1ZOUQ0WXp4eEdWd2NFVFdyNzJhVk1XVHN1UG1sbGxr?=
 =?utf-8?B?YXg4RU1HY3diQWYzSm9XMGZPTituaU1IZXY4Y2l6UDFpTUhnSSt2NitQTFRn?=
 =?utf-8?B?dlVvSkw4UGlXYmZTR2FYdVU2alNmS0hVL1V3M3NzamVmVHpwaHY5Q3Q1TDA0?=
 =?utf-8?B?dHhWcjVBekRuQkd0TkVHVnZ3TVlaVXUyZ2hEeC9adzJlV1Y2bkxWSEdMcTdO?=
 =?utf-8?B?V28rcEFsRlRXV1lSSE9sNzJXZDE2bmEyNUJUQ1FDMk5BWmQ1S25EUHRQUUs2?=
 =?utf-8?B?WkREenp6TlpONXp4MlFXQlE1YVNOSWRrbFp3eHk5OUU0YUt2c2d6aWtWc3BE?=
 =?utf-8?B?eXY5TzBUdy9hMWVOMEF6cmQzZjVOVmwvQnpicEN5SEs1N1pPYVZVbzQyZHNH?=
 =?utf-8?B?YjNLVVVLU0RNRE9xTXdPdkxSVUZ3THlPVnRoQ2IrUWxNWW1TUFk1YzhzMWpP?=
 =?utf-8?B?K3FWaGxUdzBXdm92SVRrbHVkUGFuQ3VZMTFOQlcyZ1kreXRZdUlRcVMxeFlN?=
 =?utf-8?B?My9MTml0RGUzUmI2cXJuVzJNa3N4eFJheXg5VUlBRzVqR2VNZWtLR3NvOHhv?=
 =?utf-8?B?ZGZoT2RydGM4aExvV2hLMjBDVGUrR2c4SXl4TDN6bUE0MXR3NytWVnE1SDVt?=
 =?utf-8?B?Yk9GZHlwTTQyWGgzOFF4RndCM1FJTzVXVllyMlhMQ01BQkZEL01MaWRaaFZ2?=
 =?utf-8?B?dDlyaEdUMUNsaExRNzVyaGpxU2dMWHFjYW1zVHZOaTVWMFAycXROSi9IZUlE?=
 =?utf-8?B?ZThwY2ZrTXlQbjlXaUVJNE1aUG1teFl2b3lockJzTENNUkpJeGY4V0RqVUha?=
 =?utf-8?B?UzRaM1BtTVZqZmFsR1EyWVhyc2szYXVsdGhOVTRWQXc4Z2lCeFYwR3dnRW5P?=
 =?utf-8?B?NHlnaDdJNVRzZU9XRXBGcytTUFBlKzdBUk9ueGlsVWdoUzllQ1JaY09ldEhF?=
 =?utf-8?B?ZW1ZZkh0YnBlVEdYSTNuaGlXeVE3OEZOVlpLcDBzeVZiTVdkUVNyejREcjFy?=
 =?utf-8?B?SGhhZklQVEZRZ1ROSjljRjFKMVJFbWl0NUtySW5uNitsR2tCM2JCN3hSYVlW?=
 =?utf-8?B?K3JzNjNMTUlJdWltc0wxWmZQQjBUS0FBNDZZWlA3aW1HTG80ZzVObFdxYmdu?=
 =?utf-8?B?WE9SeklWcDBmaE1XQmRPS0R5MEVKZGtDcGZINUQrQmhzMC9JdmxmM0ZJcG5z?=
 =?utf-8?B?VVhSU0J2L2tacGVkT3hjVFcyeUJxUHc5TkVGRkE1QmNVWnlVcUpvNUROcG95?=
 =?utf-8?B?VXJRajZDNWJKY3FrQTFwTGlNbUFvczdEUHFIT0ZDQ0N6dzlUQ2RqNUY2NGVr?=
 =?utf-8?B?VENuak1vWU1ibm1QWjFHTXlnU290WDJFYThKb2JJVFc5ZFJ5SnM5bTg4MTh0?=
 =?utf-8?B?V3dMTGlaZzh6cHBLR2dHS2FBVDNWT0N3OC92ZVJNMU1wU3BiNFVlZkVqa2lp?=
 =?utf-8?B?WENzQkVsTVJvT3JEL3BVZE1ZR2plWUJkQTRlY1VRMUV1K2Y5Uk1tZkxSSVRZ?=
 =?utf-8?B?emRXMUtoL3RZTTlwYlp6VjkrS2ZjemI0Yk5hRkYxcGVXbW5jSUZyN3VPaW8y?=
 =?utf-8?B?UHAwMTZIc2Q4aFRSNHk4ak9odDJBWGNmTmg5V3N3M2tqamxwNlhkcTRvd3h0?=
 =?utf-8?B?NzJybzNwM0lSaWk2TDM5aXdZRGd2YVVXQXdvem9XYnk3WlFMRTlyU0JheTlh?=
 =?utf-8?B?eTBJRUR5ZkRBWXdlMmM2elRPNzNDd2Q4SWlKcWV3cm9lNHh3c1E1a3kzTkhy?=
 =?utf-8?B?NmRiakV5S2FRbzlvSHNhVjRxZ29SZXF1a2d0WkFTQy9pRUl3c09GMFFROUVO?=
 =?utf-8?B?MGtuM0l1U3RUcGN0aGp5bG5uRyt5bXh0OEs3ZjBVVDJobkF2bEE5SHJLOVdn?=
 =?utf-8?B?OHlrcUQyQXBqcFJ0QWN6SEcyOUhmTDJlczlLTDVGeDNqK2Q1NndQUjNFaGRZ?=
 =?utf-8?B?Q3I1ZTlYZG8vNzRoZlZrc0daOFRrb1QrblpDUzBjeUpNaytqbW1XN0oxS2RI?=
 =?utf-8?B?YVV4VnptRXRtSjNuanRvSi9sMWIvNVpVM0RIdWEyVmdodE05NjhVMEVqcFVt?=
 =?utf-8?B?NDZrazNBRUhNVk04WGFUTFJWMCt5UjR0eTJHSVZDelBUbU5WeU5aU3I2WUE3?=
 =?utf-8?B?N1JFOEkxQWVIQWRVd2FxVE9saWRZMW5YaHpyakRJL2xUNnVmYzlVcDhjMEsw?=
 =?utf-8?B?SHduQkxHOTFzbis1N25LRWRvM1lRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc61058e-31f9-4c51-0889-08ddea9f59cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 04:07:08.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13l/B9mjc7LG90yRkqlWBczSTAfGW8Kc6utAniujLjyTe8K46XKfo1cvEjQn9vjtYAIYXHJGgS5tQMgNGr9BEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5924

On Wednesday, August 13, 2025 6:24=E2=80=AFAM Aaron Kling via B4 Relay wrot=
e:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Add the device tree nodes for the MAIN and AON pin controllers found on
> the Tegra186 family of SoCs.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi |  12 ++
>  drivers/pinctrl/tegra/pinctrl-tegra186.c | 207 +++++++++++++++++++++++++=
+++++-

The whitespace changes seem to have ended up in this patch. Please separate=
 them out.

Thanks,
Mikko




