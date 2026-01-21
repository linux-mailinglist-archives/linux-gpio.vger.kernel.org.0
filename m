Return-Path: <linux-gpio+bounces-30871-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GlwN0D8cGmgbAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30871-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 17:18:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110E59C72
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 17:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F358CAC0FB2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 15:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101294A138F;
	Wed, 21 Jan 2026 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BHz9PwEY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D83F23DE
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007466; cv=fail; b=H9vtRsWNrWjyOa7Bk7QRIAtM42wElh9wr3E7IHDM2uJSOa32FjzhJJqBuG4FmEPNmr8Xg77AWYHeVEBf/NpeWSlUQlNpgr5j9w772LV/EN18BT2af7LUeFi84KCtpow5R57luau+7gkKQ8Lq0gHeJHYm4Z3AwmjQClmu1YMyqCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007466; c=relaxed/simple;
	bh=scJNLglwcJyk/qHI3/n830nStth+EpaDAmYi3G3pvg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rLwT4bAj2Lrtjms25JDNCiwnhYhBLBRLwYWiflkppoegNvDy9YlFBtVwbM3OA9WmKrRsIQ1gLg1bAMIiHEQRH/eBE4TJ5lLuZ4RAuW6SFuv51y82VlcGQw2OsimXHhCSdrk2toyXxP16HizsPpdzuz2PG668Qyd3c88/J9i6Ys0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BHz9PwEY; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whWoMPlAnYWJXka/rhJFSqmNCzozkDnv9vBRl+hsZ/MQmCWiO5vxjoD85qS6WH5J+xgXocJJY3bb8Rf/UfHm2I/IQiEanYKpOPxRv3iwUavasiioSGSvqJJW7q3OycAkjC82YJj63RbLiOgzIMU3Y9lpY1/BhBlIqVuTQqJVxum4NyNaA7Xfu7jo7uGV1Wh05xr8J1Tcz8LV/6+Xzg8VgGE5ne2GHq9ajoGVMUo4XbjYAy8SeKJdBkCuWLZxOzhQCPHVDxdOzKE0e6tMbHyQQmOWJKIOgyW+8uvVPhuncLv2L1JHCV4sRNz0iOQNzK/gDmhDbJqXX/aaE87frskS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lZHxNsyKGa355cZo8zF72cbfZ/W9qTW1QU/xhajsQs=;
 b=brOLFec75CkLR4hjkGSlqz65+WeO4fChIzHIpWk8KhfkdjAPyeQFcD4UY/cpOrUS2Qi08fAdlBgxgX5TyHJzNqzM6ye4DDQMaDXupe29ayP39NrUB8Ah0DG4sbIUUvKsYWMHX2kra9yyBHqOILkNqJXe4MvmxNZeYJ2bFZKLy+5Z5tD+QuSctvGBqDH3dsGxPfzyz6Mvr0noApAtQ+hgneED1wC5QEgOw5qinak/DBNSwWW4AkfODHy8fJPpWjCbgnlyP+2Y3RPiBKl6gehf65uoIB7kzEWWoXUPsUZja0Xr7fy/gg75WB17/iTGW22FXXnth/xsNcoFHmYZXa/azQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lZHxNsyKGa355cZo8zF72cbfZ/W9qTW1QU/xhajsQs=;
 b=BHz9PwEYDKjdyqx/4Rg4jBW60DU2T1W5x0v3lBI0M/Y46otpxh4IbWBiqiXOoOfxn45nbzy8w+o0DEQatoB6cZwSeeJcnaIN6c09qf32lJCB58HKFjKVGqohMmzLeRMA41ZV82Ev0JTBD7/pqa3PKo5VFOOzG6Sm3WIw5/grWQQ5kXQE9jjsjEL17xZWHCc9O3LWmbYfh42wKzK4AoejrSMpY6ySLfFisCjhkv+oXWlI8M6TgE3mWIsXOtodldMfLWnsLwfS7Po/HTKyRvDqif2HO2gI5bMG9LaA6m920yV+/o47OVBS9Y44/uqhy5ClaNixuQ8MfpDpwhbp5N4TaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB12090.eurprd04.prod.outlook.com (2603:10a6:150:2be::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:57:41 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 14:57:41 +0000
Date: Wed, 21 Jan 2026 09:57:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
Message-ID: <aXDpX+Wm3HU8FYTA@lizhi-Precision-Tower-5810>
References: <20260121142047.10887-1-shawnguo@kernel.org>
 <aXDh1tc3x4aCZG0z@dragon>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXDh1tc3x4aCZG0z@dragon>
X-ClientProxiedBy: PH0PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:510:5::29) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB12090:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbc8ef3-6bdc-4fce-df24-08de58fd6d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|19092799006|1800799024|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWxZZno3ZVRNTkhacG1mM1N1Sk40aTBKaHlmM1FNYTB2SW4yTWVkbHpLU2pW?=
 =?utf-8?B?YzNWbEcxeHRHYjU1MndHemVJQXNyVmhFZVNRcEVmQTNxMk44ZUhaNWw3alJQ?=
 =?utf-8?B?eG4zTk5tUWx4TncvN3g0K3NTdlFGM1VDWFM1VWkzRmorSHY0YkFlbnR2V24y?=
 =?utf-8?B?cUtlWThtTElkSnpvRWRFaFRpd0xKdHJ3U3NwWjZXV0RPSjlqM1NETzFXcVZN?=
 =?utf-8?B?Z3AvSG5uVnBBRlpabytTRUgyZHFBZzlLYTdoeDBRZmhTaVFaekdNK0hoMnJO?=
 =?utf-8?B?SGlEUjZMaFFyVXlxMUpFNGpsd3RCalRBNisrNGUwNkVCTndqaG9BSUdPQmp6?=
 =?utf-8?B?c056dFZJWG1jYVJjSmRFWkorK0txNnQ2T1NsMjExeTFzOXpORWUrSkltZ2VY?=
 =?utf-8?B?MGsrd1ZINWJzdmVrZDEzZG9ZSFRrMWZ1cTRnMnVRTlJUcGpIMVRZekRJek1R?=
 =?utf-8?B?eFIxVTF3T1VXbWROVkZRbmFIMDZ0aUw0UWpic3VmOElDc0hvcVBYaUgyMlJv?=
 =?utf-8?B?Zzl5bUNLTnYzdzVpTHNnMGF5S2xLbEt6bU9WWHJMdS9VUGprRTJyQzNZODBU?=
 =?utf-8?B?YXBPR2VVdGlKemJrZjFsZ2twN2g5QWZYMzBMU094bEw1UGE0aE5kY1c4a0Jv?=
 =?utf-8?B?WHdQM1JTMElFZGtNQzBTNlZhNUNjNm5tWUVYSjN3WkpieFUzdFA0RWw1Szdu?=
 =?utf-8?B?MU42ZkpyL0V5RU04THBpQmtFbnlLN1FXdGFYaHBiNGxUaGdGcUhkdFZrSm5p?=
 =?utf-8?B?c1JIYitBREt5eE85WUNBb2ZaK3YxOWhZYjIvWTB4NlJlUnJFamZ2WUc5MVda?=
 =?utf-8?B?K1B2b21KeklTTk9pSWM5bVZlamRzZjdvQWUxaE9qSnJXcjFaaXQxQ25WUzFH?=
 =?utf-8?B?MitVWnY4Q1ZSUGxlVVRMc1BtS2xvWG5VeVpHVzUyeW5zejUvemp4SDRWN0Vs?=
 =?utf-8?B?eVVlZ2tkUithZXgrYVd5Znd2dU5TbStnZTJod1EwMVZMaTdaSTNzZERkNEp2?=
 =?utf-8?B?aUZKeXF0TnRxRTVDWFdqZjZRVmd4cTdMK0dNUG1HK0dxbmJQdVRURnRtMCtY?=
 =?utf-8?B?RldnRXlHOW9IRkR3dVdMSHdHcFZtN1pISlFLVmNXdkp4OTM1L1czdW04ckxi?=
 =?utf-8?B?UkVYdWRNN0w3d1l6QkFQMkRIb3lxU1lrSjM0RUxYcHRpVzRhRXVQMHYyNXpQ?=
 =?utf-8?B?bUJKTmFMN1JuM3lsaHk4SGhXWmVkWnZmY0VuQXRQcXBmSUZ6SW1MSU5yWEZr?=
 =?utf-8?B?cEljUmVhR3dYbHl4VEl3T2EySDFsUFlsU1NoemlPYjAwMGxYUzZSeDFvOEJK?=
 =?utf-8?B?Y2VvUmhVakIwWUJ2aEQ1R2FVZnFMMFQzRndSUFFxcnhPTFBFOUhBV056ZEp1?=
 =?utf-8?B?V0dTYVhYSnU1WStBVUZrTjRvWkZpV28xQ0RHMFU5RzVjN28xaG9xQWluTDFy?=
 =?utf-8?B?KzFHeUhLdDZYbWh0KzlhbDdIL1d1TzlUVzBCVDBVa1I2aS9yNnFkSlFCYlVS?=
 =?utf-8?B?bUJyTnV4ZHdXblljQ0hLVElLSytGSVV2MWhZRlpnVnhaUHIyeDNSanZSQ1pN?=
 =?utf-8?B?S094cGdCT3VJT1h0OWxoT2FvZWJkQlg3WVJQdWdtQVArejFuY3BjenNtQm83?=
 =?utf-8?B?TXpuNDFYZ0w4RE83eTBxYTAvUm4rdU01LzM1bkpHT1MvN2NPZWFkRi9mb20r?=
 =?utf-8?B?azh6Z3h4amtMdm4yaTRwVU1pRXJsTFdxYmhTZnl2UFl4Q2NzQjdZTTJYRzRE?=
 =?utf-8?B?OERkQUJvVUNzNWVudHpRWkdSMGVZRG54RTg5Y2RxbThzeVVQak92Y3MvdUhu?=
 =?utf-8?B?Wmc1eEc3S0J6TTNxUmg3dWlNcG1kSzlIQSsyZzBjNFBLelZGYjdmaS9PYXMv?=
 =?utf-8?B?NEFjVDllQ1ZMbEt0RmdNNFZsMU52OENpU2U0U1NGTGFieW1wcFkyYmp2aWI2?=
 =?utf-8?B?YkFJUUs4eGo2cGhVT0hsNWRFMXk3SytKc29DYlBReG82d210bEF0dm1rNW9m?=
 =?utf-8?B?b3I1Ry9jRHBxbHliQ2MyS0dmRko5MXhYUmJzKzhMRFU0a1A5Q0lzckYrcDVX?=
 =?utf-8?B?VjU1cVd4dGZSeWtnNk11NTdjd0xxWmpMajRVU1pkTVdwQXVJMGtXY1FoeHJL?=
 =?utf-8?B?TkFaVklGN2N2TllXVHoxcXlLL3gzN3grTHh3dTEvS1VRZUcva2VBbm15V3ln?=
 =?utf-8?Q?+eGi28Uquc+3Ok+bb4N4H8c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(1800799024)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlVPTFowSEh5UjhyeHM2ZTlxNjNsSTJyMXdhS2hia01MaWxYa0dodXA1Si93?=
 =?utf-8?B?S1p2elZidUx4Y2tFaGZ0WWgrelMwNTFNbU9sTUMrOTZVT1dHaDA5NnlJbUVR?=
 =?utf-8?B?dFlZaUFpaHRvYTJMU3liZkg4WjlvYUN3THFUQzh5eER0V2FBVkxOa2xvZytr?=
 =?utf-8?B?eFRoeDErS2ovNFVBRnljdHRacGVMcU9kUTRkdVFwZG4yUDNXZ25rWFkvL1Q2?=
 =?utf-8?B?QTFYQlltY2xIMlh0UmZVcFNJelptY1FVVVNSRUhodi8zNEdINUMvbTFjbERi?=
 =?utf-8?B?OGo2YStYYmw0bkMxbXloa0xXZjVaT0l6Q0ZxSjRjYWUxTFduTzcyWCtFNHdE?=
 =?utf-8?B?L3FnK3JVaUJvOHVBWVlZMnpmQmc4ckNwTmdWamllMG9kNXRZclVOQm9lUFU4?=
 =?utf-8?B?SllOc2xUeE12eEJxVkhzYk9sMDdMVlYrbHpyOHlqdDIybllBRDlCRlFkejFl?=
 =?utf-8?B?UzR3V0RHaVJhc045ZitwbUNMN3M4bTBJUEo4ZUtsT2pzYmdOK2dJdkF1ejF3?=
 =?utf-8?B?RkF0WVgrdUw5U3oyRHpYeVpURUNkdzdsTzF6MHJjK29rMyt3U25lNStudGpW?=
 =?utf-8?B?WE4vU0o5ZVNrblhSUVNkVE1LTHFMN2h4WUR4NFAzdDZPNlphSlM1bG9KcmVq?=
 =?utf-8?B?RExtWFlNalpLR01GMUFQT1oyYUQzU2ZPTHUyYXA4R0wzakNINWZralJVaU9M?=
 =?utf-8?B?VXI0VG1NMDk3Vmh6M3V5SGlUZ2YyWFRRckxyNzhLRkp0YjBtWXRQVHhEaVF3?=
 =?utf-8?B?ek5ocWFtaFBzQ3VVMktuMUMvYmtuSkdOWlVKNW5WTldWYnZoM25Lc3BaL0NX?=
 =?utf-8?B?dXZzOWtTb1BoK1ZacjlTSWRmcno2QTlpdXdsdERtZGVHb2ZxcERFTGRHMmRP?=
 =?utf-8?B?QWRTUXdqVmtTbFBFMC9xWmNRSEZpYzE2ZEFqL1VaemdYNkt4MVNLMWlrcjF5?=
 =?utf-8?B?T2JpMnpEU1hIWUt2dmFiNkwrMkI0NzRoNExzUnN0UC80cWl1Q0pJZHIwVGlE?=
 =?utf-8?B?ak1oS2M2blVNMm9VSzRKSU90YlhJajNQOHVPaDJnY2NabG1wVUt2ck1NYUFO?=
 =?utf-8?B?akZSRGRoOGIyMlp3eHBVeE9ySzQ2czBZelI0MnJab3JWdjFzWWhOSjlwcWVa?=
 =?utf-8?B?MVl0dUJ6U0pROHdIRHVWWVNKdkltK0h0ejg0cjJDdFlZTXA5MUk2TlVTK3VO?=
 =?utf-8?B?WkhBVG1ld3h0b1FqTFlQeDBJNENMWDZheGxEV3IrK0hSMTA3ZTA0TDFyVjcr?=
 =?utf-8?B?Z050eC9Uelo3c01PSllxc2RUWGk3U0trcGlzcFVkQjdqMTl2bjJ3RHJqMity?=
 =?utf-8?B?cVM3VHRweDBwdCtYcS9XMVZqVWtTZHJtNFROLzN3SzRzamc3bHNmdTVZdm9O?=
 =?utf-8?B?VUxyelMzYW5TSVljdVl1aVRnRDRyZVU0d3V1WnpSS3UxSVpxaHhBNk1RUWx4?=
 =?utf-8?B?aHk4KzR5NEFHcWVoRXdpS0pXNXFqeWZkSjFWdExrcHkzVWFHc0ViZnBzUkMx?=
 =?utf-8?B?M0loYWwwdFd3YlNNaXR3N0tVTEJiOHdaRHIzMmVVODlDZnh3OHRZTHMzZU15?=
 =?utf-8?B?OElKeGM2NFk3eVA1TUJqYnlFalBJQk85aTJVMnlhM3lkSTZ6MXUzMUIxWmNO?=
 =?utf-8?B?bzJYQllVNTM1MVZzQ3l2Y1Q0V2pZRFBJV2hXSURZUzRmV0kyb2xtWGdSMEZ6?=
 =?utf-8?B?VmhKTTRJVCsySGNiSlJmZEp5RWlXNEQ0dFh5dDBMSWhKbXZwbkJUcnU4Nndy?=
 =?utf-8?B?SjFieXJlRGFQd0NXcXErZEhZcm00dm9QVXQ5aHVYTXFPNUpGWTZlaVNVcElO?=
 =?utf-8?B?VnU4MEFvY3ljVXlIc1FGcFFBcWRTYmE3aFNIR0xmeGtMRGt2TDFPMkIraElX?=
 =?utf-8?B?eXlabTd1Nk9mUC9kOEw2KzJQRTd0M2NKTk9Oc3hnaHIwNDFOMCtJSXVPSW55?=
 =?utf-8?B?Z2lpSmtOUFc1cE1zQkdSdm03QTBaU1M2NnRsRjl2aVZSYU9ZVHpPWENVYVFh?=
 =?utf-8?B?bmw5ME5XeWQyVm1UYm1EcEdvb0UxeHN2WmtMQjU5Nlg1dWJlU09xYzQwb3A4?=
 =?utf-8?B?THQ2c0pPUEFOTm1pOVc3Nnh3aEpRZlZ4S2k1Wk9kUFVFODZZeFMxOEhYOGRX?=
 =?utf-8?B?TUhqQktQZFVZd2taK2RObDJaRkJwQ0pqNHl4eHErRnB2K3NINS9KUG5NcXov?=
 =?utf-8?B?Mzk0dGNVTUpWNVV0VEd2QU9rTi9VblVPVDhKUHh2WUNzZTlPcHZOU3ErY2RB?=
 =?utf-8?B?NGRraTltQzVEc29VdnN0Wi9ia3JUV2grRHlsSU5PNmd5V0JxMno3dDhRc09l?=
 =?utf-8?Q?OnG2hx8MB2jeA88Vh8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbc8ef3-6bdc-4fce-df24-08de58fd6d14
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:57:41.4714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBCcn6SUyhHG/aNQ/GTaN1k4g24E0C5vO3Ounr49tg9WKr1Lp16tX0a7ExVDjUv0K0Ow7JFHNutznpUT+pRn/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12090
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,pengutronix.de,gmail.com,kernel.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	TAGGED_FROM(0.00)[bounces-30871-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,pengutronix.de:email,infradead.org:email,nxp.com:email,nxp.com:dkim,linux.dev:email,i.mx:url]
X-Rspamd-Queue-Id: 5110E59C72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 10:25:26PM +0800, Shawn Guo wrote:
> Cc Frank
>
> On Wed, Jan 21, 2026 at 10:20:47PM +0800, Shawn Guo wrote:
> > Shawn is no longer interested in maintaining i.MX platform, and would like
> > to step down.  On the other hand, Frank seems to be the best successor
> > for this role.
> >
> >  - He has been one of the most outstanding contributors to i.MX platform
> >    in the recent years.
> >
> >  - He has been actively working as a co-maintainer reviewing i.MX
> >    patches and keep the platform support in good shape.
> >
> >  - He works for NXP and could be the bridge and coordinator between
> >    NXP internal developers and community contributors.
> >
> > Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> > ---

Thanks, Shawn, for your great work maintaining i.MX platform support. I’ve
learned a lot from you, and I’m happy to continue maintaining the i.MX
platform.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> >  MAINTAINERS | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5b11839cba9d..a294b4e952a9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2745,14 +2745,14 @@ F:	arch/arm/include/asm/hardware/dec21285.h
> >  F:	arch/arm/mach-footbridge/
> >
> >  ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > -M:	Shawn Guo <shawnguo@kernel.org>
> > +M:	Frank Li <Frank.Li@nxp.com>
> >  M:	Sascha Hauer <s.hauer@pengutronix.de>
> >  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> >  R:	Fabio Estevam <festevam@gmail.com>
> >  L:	imx@lists.linux.dev
> >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> > -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
> >  F:	Documentation/devicetree/bindings/firmware/fsl*
> >  F:	Documentation/devicetree/bindings/firmware/nxp*
> >  F:	arch/arm/boot/dts/nxp/imx/
> > @@ -2767,22 +2767,22 @@ N:	mxs
> >  N:	\bmxc[^\d]
> >
> >  ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
> > -M:	Shawn Guo <shawnguo@kernel.org>
> > +M:	Frank Li <Frank.Li@nxp.com>
> >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> > -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
> >  F:	arch/arm/boot/dts/nxp/ls/
> >  F:	arch/arm64/boot/dts/freescale/fsl-*
> >  F:	arch/arm64/boot/dts/freescale/qoriq-*
> >
> >  ARM/FREESCALE VYBRID ARM ARCHITECTURE
> > -M:	Shawn Guo <shawnguo@kernel.org>
> > +M:	Frank Li <Frank.Li@nxp.com>
> >  M:	Sascha Hauer <s.hauer@pengutronix.de>
> >  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> >  R:	Stefan Agner <stefan@agner.ch>
> >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> > -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
> >  F:	arch/arm/boot/dts/nxp/vf/
> >  F:	arch/arm/mach-imx/*vf610*
> >
> > @@ -20562,7 +20562,7 @@ F:	drivers/pinctrl/pinctrl-amd.c
> >  PIN CONTROLLER - FREESCALE
> >  M:	Dong Aisheng <aisheng.dong@nxp.com>
> >  M:	Fabio Estevam <festevam@gmail.com>
> > -M:	Shawn Guo <shawnguo@kernel.org>
> > +M:	Frank Li <Frank.Li@nxp.com>
> >  M:	Jacky Bai <ping.bai@nxp.com>
> >  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> >  R:	NXP S32 Linux Team <s32@nxp.com>
> > --
> > 2.43.0
> >

