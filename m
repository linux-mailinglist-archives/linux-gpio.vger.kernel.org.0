Return-Path: <linux-gpio+bounces-20290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26055ABBE98
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 15:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24B5D7A96ED
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 13:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E0A279337;
	Mon, 19 May 2025 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L+cqsmqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A0F279356;
	Mon, 19 May 2025 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660007; cv=fail; b=giUamLrbE+nnsVgqzRhxYw2z5iGalieznycIxBx+kGd76UeaMW7/Qx7X1tKQTGX8S5FWusxYF0nnRlB17uP1gWY+lQx9+sQOy3BvV81Hk4Bc1FqWsDPaL9m6JNk7Juc8pDNL71G0sPZxMnExrN3w6rjQ0jouNEAMAJEKD3KJvKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660007; c=relaxed/simple;
	bh=ICDeqQBix/e7BkiFMjY00a+JfRtRd/bDJrm1Y5uXhQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FUM2b4kdlHsfWlHu9ElIQxoi8PHF4kIs/Nqz6dLA+lOm+5MSqa0Ckt07k3sXo2PCx0U0DC9cwyI/QPXT6qo+P1k8mFnQ4bEUkTubw5yMeePMOaUlec8YoYkGotlkdXyOh09LzU7Z2/0MVXBqsDUDlHt2pJVbxIkzugTijYhXbTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L+cqsmqE; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgDuRC4vWKUSu4BCL0Ry0d+yIFUjAGzyp+kppx9uvfOgpafApW2CIRfNSMR4t1dH5vSYR+KmbmaN6WG1K60gqd7VFtYPeaViHQFJVoj1M+AZ4tNmYidMrGiBf2MAx13oc1IPuxhwgbRjAArSKi08icCmnWjLkMh9OOSjdNcKd+i+xtGnbk0L7uUjuPYY8yJ424duFH9Tfk5Pat8NGM2UOLH0R8xSDY0M3vgdllC0QTr/zqK8RGInC8j6I38LhAfWNEDCrmihbKm4EUkv0+Wh/wjuJpvl+jyQVPU/e/NO1wHLGahNtlnqmY0qkht3pSRVSLHgNlw7ITRnCPMXT46KTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICDeqQBix/e7BkiFMjY00a+JfRtRd/bDJrm1Y5uXhQU=;
 b=W+jYPhmknwSTUEDYprLKWT3MAnHMnY2eFo84NqdAXTUDfuBFCCYSZcbVt7gtI2L61cjQq228NO7EbhFLmsV571UJJkF5aSPwsZunsgmOxXKkOOAMosTN6Od3zCo2/hhnOu8X7DkEKY0t7MToaryWyzAu+T1tyy/XZ1qVigAjKigYhbBvrwB4zhdSDBA7pvsZFdpA8RLyc6vM8yzl08fNi/QBPTW8ZPuvaVKXhn7J6o0FqMvvjTue1+qCfS04obL9bQ9T/PwejeiyRH3FHRXk2TYid1FuUHjH0uuZ6rLtvllw3se8sWX92FACTQyOKifDum5KRjvgDNNL+NOdFdPnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICDeqQBix/e7BkiFMjY00a+JfRtRd/bDJrm1Y5uXhQU=;
 b=L+cqsmqE701Z7p8ZxU6sBLlyBkWfEErb1BgE703sDwftVLWB9zvvQ8JimhTHx+A3ws/w7nmgWZcL1GtnLenDgtHltdG1AiYUCbcnXN9XkX7H4eN0jVU5utm/vHUbYoAxynkMLfpUYSe7t3IGLtVNBIaGRy+kFv9qg/YGcHCqFMQQAJo04g2Nfejf447LG7e/7QvD/UmYEXlJdrSi0XPRXfpJtNhZaSGzPImbkHFEUIaG0YE89wrFYFjS9ibpvikvqsHUCtY0h2/OpcWaXsfIis5OYcunpuUiq/Y22VeOfDywUPo5bIuUePA69bM+vAh6tXhgHgwuzjbqy+P27wB31A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:06:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 13:06:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot
	<lkp@intel.com>
Subject: RE: [PATCH 0/3] gpio: fix Kconfig issues
Thread-Topic: [PATCH 0/3] gpio: fix Kconfig issues
Thread-Index: AQHbyK6re5DUy5+h10GN3yjOHnjlxrPZ6tUQ
Date: Mon, 19 May 2025 13:06:40 +0000
Message-ID:
 <PAXPR04MB8459E842E66442A0B2197D7C889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10729:EE_
x-ms-office365-filtering-correlation-id: 18e6fa6b-fb85-4c90-55f7-08dd96d5fea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDhpaVRWY2VQWjF5RjdKTlgrY3RFbGhqdy96d09MeDNRV2VVSnRNTVM1WW5z?=
 =?utf-8?B?OGhKdFVMZUNmbWkxOWc2ZVkxN0Q2NXJ6WTVYMms0QU96dEN5V2FzYnErbDhG?=
 =?utf-8?B?V3R0b3RpNUJKbS82RllRV1l5Wko2VVlTRFpZSk5KK0NlNGVRZHRpc0Z2SUVz?=
 =?utf-8?B?aDlSQXJ1bHBLWDVXV3RMdWtWbEN0TXh6S1ZDdGxic2VJekR4VmVHM290WWF0?=
 =?utf-8?B?WWJlZEhLL2ZaVmNuSzZOdUNQUzZhbi9jZHM5S2xvVmsrbHFBY0ZqQ3VZN1A4?=
 =?utf-8?B?YngvTU9EbTQ4RStwNmFEKzA2S0tpTFdybXVtZld4dEluRlBNd1lpUzk3cFRw?=
 =?utf-8?B?TENCa0tZR3dJdmw2TGFwZmE2VldzRksvTHhuTTloa1RzcUtqZGgxRW5EcEJ3?=
 =?utf-8?B?UFZoYTMrd2poU05wMW5IaTQxODZWRk02b1NNaWxNb1ZVTUVBSG5BVG4rT2Rl?=
 =?utf-8?B?ZFNwckRCZDJoZ3NBeTQ1bzZCREV3WXlKazVTb0VqN29maVdSaVBCWDdwWkdr?=
 =?utf-8?B?TmpYcjhVT21Oc1drT2tabTNCbUxPc2ZiMisrZWFVcmJvSERTY2Nyamg4aElV?=
 =?utf-8?B?TUVYRjZUU3czbU02bU8zWTFSNmVPdjBJbEQ2R1NkN3Y4d1JBRSs0VjArRUZq?=
 =?utf-8?B?U1IwcUtEdCtXdGlyQ01QdGhwSGYvMUZqY1RBTm9WUTVvek5PWnVabG5wMG1V?=
 =?utf-8?B?bHhrN01mR00vci9rdmJtcEtjaWJRMHRLWnl4TFIwdEhKT09JNGVwRG5KTzdw?=
 =?utf-8?B?Rm9CMDg3RW4xZUlZRWxzRVQwWHQvUjFrMGJJcU5IbWxSYkZyRGx3R1Z4cXBN?=
 =?utf-8?B?WTB5ckRHMVpuaGpIWU5KbTlvMzE2RE8vSGhGU3hNd3VudlpMWTMvaE9EVmZO?=
 =?utf-8?B?czNkSytraGN1ZEgzWUhmQ2tsUE14ZENHTWpJVW9BdVNqK1BrMHFuWHMvS3hk?=
 =?utf-8?B?Yy81VGVMa3A2cmF0RnJ4a1dqbXFuRW9IV0ljcmd3dHZkNXl4TGhyeFEyZU5y?=
 =?utf-8?B?MkdJNlorMkQ5Z3dwbml4bFlDS2kvVG14VFQ0V1h1QXdySjZPbmMvZ3VYTmE1?=
 =?utf-8?B?TFczYXdWNGt6NTBuUHRSVUthSXdTb0wxVko5djZ6elhWSFhRR2ZBWGlTLzJM?=
 =?utf-8?B?RXNiRFFCblZLL0tJUmJvQW53VlI3TktBZkpXVzVkeDNKSTZsSlVNNGhaVGdp?=
 =?utf-8?B?T2JzWjZZWlhNUjhQWHBBT2wvd2NBZWVrYzQxYmRMY21QNlFaMWpMaHpTZkIv?=
 =?utf-8?B?S3Jra1hLb0ZPWWpsUUhreUJKRUNyNnMraHVFZjRpREdWeTExM2s5b0Mrbnpl?=
 =?utf-8?B?dUUwK0cxNms3OHNIREUzNWRkRjE3VGhNUGFwMG1KUlBXdUlzMmhOdmdHRWk5?=
 =?utf-8?B?U3pzRUxLdHZocCs2YkFuSHFqS2hFdldmY2d5cXc3V2V1ZGhCQXRlTWFFRXdl?=
 =?utf-8?B?T21RbW9HRlM2M1NWZ0hzZW14dERNbEdlekdMZUFKYVd2bCs2Rk1FQlJvU0Yr?=
 =?utf-8?B?NzlUVmEya0R3KzRoTmwxMGJwQ1pYNzl2NjhVbFhsbERYSWcwZmhwRHpmMHc4?=
 =?utf-8?B?dSs2d1RKdkFRZWN4ZnN4QmcxLzdvODlBMVp5YTZMZ01yTkhsdURLWDl2c3JF?=
 =?utf-8?B?NTgxWUZ0OCtHLzZWVG5JeFlWaEgzaFlGR3VFMHJvMVZTSis3Qmt3UFJaVHF3?=
 =?utf-8?B?U2tXaHFweHpmMi80VW9hY3JNcVphZnNLS29IZDhXcnZmREY1WUJtTk92MG1P?=
 =?utf-8?B?ZFdzVkZRQVJFSVIwaitNcUhGd0ZweGQ1V0pScFRkSHFlWmJxQURLTEJQQnkz?=
 =?utf-8?B?TXhJN0haanNVN0xKd3g2M0hsdXdZWCtNeXNiRnVRenFPQkR4QldnZkZSUjU5?=
 =?utf-8?B?THN6Z1hUSGNEa3hXelFSTlBrb3ZTT0dPZSthck9CVTVvajA2anBRTUQ4Sk01?=
 =?utf-8?B?RGx3UURNbjZJTk8rR0dTenNkc3doeFlkK1ZzYjhzckJBT1V0Z09jTVd5WHNC?=
 =?utf-8?Q?lupTHKiXp7WARw71Qk2s762LVVXSmw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUlpT2k3bzRYbE9hR05hOEpLcTlWUkpCckxhSkN4ZGk3Rm1PQXBMcVBRdTdz?=
 =?utf-8?B?VFBDcFhhS1VSSnM2SzE5VVVUR25naWVEaGtTNDlrUm53cG9XOWdMek9SNDk1?=
 =?utf-8?B?YzBLV0F5bUZqRFdsMW9PMmw5R3cvNmNRQnBOcHJNZ0h3M1BoMkhUMXQzeEtT?=
 =?utf-8?B?RmtJLzJJaENyM212MFZpWVUyc29yeFQ0NU5jdWR0RlByVXpaaTkwSk5EMTFa?=
 =?utf-8?B?TDBFU0RuTmhVamUzM1NyY241RUZiN3diMTBJekJkbUVSdFRnbU1iUHJML1BZ?=
 =?utf-8?B?eDVJUThHd256OFdkWmxqK1Z4VE9pdWFFbitOQ2JpSkhScDBQa1Foc0RKdzA5?=
 =?utf-8?B?VmJWNWhZSm5aYi9EdUtJaUk4ckQ0MVB0bmVJVDIwYmJGaElPZlhaWjhqdDky?=
 =?utf-8?B?ZVA3KzJUWk5IMDhZRHUyODFkRFBYTmkxblNLU01wb0Fvc1hJeDM0YzdzbW5Q?=
 =?utf-8?B?UkFCN3N2ODRIakZTc2p0NUZiUGhaSlhEY0VNVU82UC91WHlxWFVMTVB4ZWgx?=
 =?utf-8?B?L1ZvS0wzVVJDTVdZc2lrc2k4ZmFHL1ZYc0NZeS95L0dNSWs0Rm5sTGlWd3Bx?=
 =?utf-8?B?bzFZNnF4YVYybi9NU01DYU9GcVF6SEZVTkhpMlE1NDVYTERrY2hNNWRUZTFU?=
 =?utf-8?B?Z0ZacmlrSWdkZHpLQlk2RUd0ZDRaODM1NHFSdmw1YkF0TVdZb25iUnViMHls?=
 =?utf-8?B?dlJMTVdaTWhPenpMdG14M2pNWW1hcGRoVUQ2SXN3UTYzNnp2aWpTRFNxRmF6?=
 =?utf-8?B?N1g1MWYvVHYwa2hFdGIwRFJvUHBOMXZnMHlnR1BScEhMdUYvTitiMk12ZVBE?=
 =?utf-8?B?VmJYV0pFblhyS1dSakY0VXQ1WGpQMHhHcWwycEZxYUhIK3NCU1F1ektyWGVy?=
 =?utf-8?B?MHpjQXV6S2wxRzNVVmh5NUFpdzlXZGZOMUFWeGlnUTJEbTFybnpvUFhlMkVv?=
 =?utf-8?B?VTJLellBTDFEbThIcDR1NVVhVjEzZ0pSNHJaOWRWQU5VY2o3b2pJVk5jRkMz?=
 =?utf-8?B?WUxyYmo1amFRS0UvelpQemZCc1l0bVBSdjZXZEthVXlwSFcwb20rQjh5N09R?=
 =?utf-8?B?SXRBVXU0by9vRTdVZzUxd09PdkIrdkp4bEZ6bEhoRnh6WmEwdUV4UzcreEhL?=
 =?utf-8?B?ZmFBb2p5VDBuK2JZWVZMYmJwbmFtTTJ4d3RvT1RTaDhMZWd4TlZUTUtxUElr?=
 =?utf-8?B?NCtPdFBiWi9vZHlJQTFmdW9uVjZYS2tINFZyN2NrNWxhcVhtdVlUR3c1K0E5?=
 =?utf-8?B?RllwcWJ6QmRRMWhTUHZHMzA2ZEFwN1p0ZlpDaEtPNzMvMFRuZlpKK0xZRSt4?=
 =?utf-8?B?enllVHRVRlJ0R0NrVHVyOWlQVGsvTEFLa0xHTzFOei9uTDBFaVVtVmgrMXVx?=
 =?utf-8?B?VHVuNm9vNjBYSlhNQ3RlUnM5RlZRdXRjYyszeUdWVm9Ed0VWK1VJelBJK1FV?=
 =?utf-8?B?bEd6cDVhYkJrTmx6TnJtbDkwTG9PeE1LV1pXaUl2cVRZTTAwSlI3L1RtT2pj?=
 =?utf-8?B?Y2FobWpGMThYcjlWejdKQTVSWkR0bEh4ekt4T1dSS2drNndUVGd1SDBTMGE5?=
 =?utf-8?B?TUhvSkkzZmlpb0pVU0MrVWVPWElnMkthdDJGU29mcEJmQzlhc2FwYnQ3Si9P?=
 =?utf-8?B?K0laQW43bDhDalVQR0xUaE9FZHlHYTFCYUk2QUlrTEFJeno0NC9zbk4rR0tE?=
 =?utf-8?B?TndJNXNobmthSUp5SWtVMHdIaUFoQk9uUlhoRjI0aXhDV0grWTJHWjlTQUFE?=
 =?utf-8?B?a2xrN2t5aG12ZXIwQk9sVUJJQ1pkWWRieG9weVdyZllNYktlOTRIZ0ZKWWRa?=
 =?utf-8?B?K050T1BpNDlzQnBKSjhvdldEODFUbVBuRHM1OUc4d0REY2ZUTDlXNW5wSjJo?=
 =?utf-8?B?Ym9pMlNqdlNIWHBBck9KUkxTdVpGYnRLRDF4ZkZDVEdPakQwQmpJZkwwV0Zv?=
 =?utf-8?B?azhJTiswM1IzZkFocGdTeWZRbW53YUxiZFNNTmhybFM4aVZIMGVkMVEycE5r?=
 =?utf-8?B?UUxlTTlGM1JWeWx3RW9VYXRvVXdQMllhUU1BK0dscGZhVFgxZVlmem5iS1ps?=
 =?utf-8?B?WjlPeDBLL1BLdnJnemc0bTE5a1BycEIxZjc2VmxtVzlRNkdMNG55Wm5Bem9U?=
 =?utf-8?Q?eXpQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e6fa6b-fb85-4c90-55f7-08dd96d5fea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 13:06:40.0519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9UFv2OGfXn+6Xvffx2XftuAPoGVbLPPPdcFbrRoeYe8HXUaTYJVy1mWuULOnhpaTFx2bhEO7OUp9xCc3KaSsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729

PiBTdWJqZWN0OiBbUEFUQ0ggMC8zXSBncGlvOiBmaXggS2NvbmZpZyBpc3N1ZXMNCj4gDQo+IFRo
aXMgZml4ZXMgdHdvIGlzc3VlcyB3aXRoIHRoZSBjdXJyZW50IGltbXV0YWJsZSBpcnFjaGlwIHJl
d29yaw0KPiBzaWduYWxsZWQgYnkgdGhlIGJ1aWxkIGJvdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4g
LS0tDQo+IEJhcnRvc3ogR29sYXN6ZXdza2kgKDMpOg0KPiAgICAgICBncGlvOiBweGE6IHNlbGVj
dCBHUElPTElCX0lSUUNISVANCj4gICAgICAgZ3BpbzogbXBjOHh4eDogc2VsZWN0IEdQSU9MSUJf
SVJRQ0hJUA0KPiAgICAgICBncGlvbGliOiByZW1vdmUgdW5uZWVkZWQgI2lmZGVmDQoNClRoYW5r
cyBmb3IgcXVpY2sgZml4Lg0KDQpBY2tlZC1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
DQoNCg0K

