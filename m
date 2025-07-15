Return-Path: <linux-gpio+bounces-23291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D96B05902
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 13:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61CD83A4F96
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 11:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D882D8DC2;
	Tue, 15 Jul 2025 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gAkgf2bT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4621919CC37;
	Tue, 15 Jul 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579503; cv=fail; b=RLuC0TH3WC6NijHD19wvISn12uhJT5hOAn67lluPb/f3xdzSGgaL+hlBuLLA+ySB3vxt8h/vIkJyIcu6F8wNcaftxfwPi1pE3MBphIjHl7cCfJdCIhgzk/+4DEm76WqVCRSUrX8mPLhrRv2/CwduRSJZ2Njz5Dfwm10jOdxPb5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579503; c=relaxed/simple;
	bh=fuN5XIffzb/++em0YXNm9E1RMRps9/yDhn72Z4dFwh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bzg3Q4Ny8gY+k0TNmKBrP2guXneT1s+RNvtuqaBr6mrU8rChdhfG9obgM0MAUpdxhqsDrPOr96A47DNcxGP9qHxYQhrin0T3up2lMBRlxAyoQ4NopNVgs361TsjefjRY+dMbG+yjSSqUFFcCa5DGM3huBgQ07JBnCJFtRKsvb1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gAkgf2bT; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+wPQYktCDPLmYPOZ1Xd9oa/PYs7bVhvU/1lUmNH4TTuk157wjYagQ4llNwxHMQ9cpWKYVHp9FGgkY39YYx+9dzvEBQuCvM3ABVAmwtI0SE+iloxntT/r5YNOe4KBHXA1i5/ozp+N2QJCKdp4DaFAUantgC1k0VpMAKMg4ITsTwKD88Wh45vT7cm8qLGVFgSVz9qlLA2e7o4jpvnWYEe88VtGa+bKnlRUNVC7bEk4NBSef2syYhC6fLHcXN/SQOwXRpGKjFzwYdxD7IwxpHJi2xPfEMp1+irym0EEDO+vHsiLDsCczhE4QlShh/+iejSYrTmvvNKewRSToSWpl91OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbCkwUgpO+yaSIeqKqxvl8+7eZuFdTBetiptnkqmqEc=;
 b=CQ2z8NvESQgwpGFUqheslg7IpPAJCS7xelVlzoz17jcr+Lr6mzl0Ar5M00khpJiTom2KFiJAMFd8B274fQosAdA4q8TrigUqn328TPD95FSo5Sq0Y1RvtJk8wcV3ylE1loYXmHX3uq8CXV6EOwClz7GTztI866ivBuF24EbuQCMnhVzbWmMuqYFtTYG0BTgTXa4ypkleUDWfdf9YTKqQD7YjAkFHehOdWRuP5g8WNDDrgonkEEX1E0vnbG8leuTp5DOLQBIvqbma0J46UBFaN0k2FPB0ZwsPGnYoxytGWX5RKfn0LYiCc4+UGoqgFz+HOTo3JB5pCriPLTfqiERRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbCkwUgpO+yaSIeqKqxvl8+7eZuFdTBetiptnkqmqEc=;
 b=gAkgf2bTpWTvFuGYOJA0eHasJyNkDgIfI3iK4sDJGpDIxjP4aaHE8T9MkVXfQjeTQjKgx9PxBKGZX5PMpBC4W/5dwX+pvczY2n9d2FJ2IQw9YIIi6wpCzYVAwqV0HAz5OuvD3bMnHZR90J4CRU55/1jrlM8U0xR8zcyf3CSnt5ABwNtpLlDeyBXhqe6Yp/T1vxG6nMjZ9ZeaiAuh++QqdSwJynjFkwskb1BkCMyOPYZ7FQxDnr5pR0lfwpNkemVAE9RYctq8gn0ZnIl2bPIh0qh3b1zrj2WjeJWhP2Nvz604lYn4KLE1dm/RRCqCoZRhgtra2QR2LGgXCGFMeD5MCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 11:38:17 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Tue, 15 Jul 2025
 11:38:17 +0000
Date: Tue, 15 Jul 2025 14:38:13 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Lee Jones <lee@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Message-ID: <c4ff34jwaiyby52ambcxtu2mrjlkcv44scjsveb6s6pvaps33u@bvl3wz6mvsuo>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>
 <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
 <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
 <DBBKJ05VNSDG.30MNWDWT9JAEC@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBBKJ05VNSDG.30MNWDWT9JAEC@kernel.org>
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: b6714a5b-b217-45c5-4456-08ddc3941760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2tydGtNTCswK1Z6aWxtN0JJVmxYVnZ3dUxIR1FZeC9STUpMdkxQaWI3TWMr?=
 =?utf-8?B?M0tTaEFFNFRuQWxNR2ovbkloN3RHSGZhVE5NdUtwak9hQUhWdjhZOWdrYTBZ?=
 =?utf-8?B?N3RGeDY4c3BXSXZpRUw1TEZyQU5Tamw2SkVRb0t4RWtocjNhcVk3eWl1dUVx?=
 =?utf-8?B?RUxIT2JYQUpQK3MyemVWdlZnWC83YVU5cG90SFNNWHBxM0hqQjZNWk43Q20r?=
 =?utf-8?B?ZXM5NFIrd2ZUTWY0QTQrcjNUTDc1WGJsM0JOczB6TjQxR2xiQTV0S3FvN3Y1?=
 =?utf-8?B?NVlSdHVRck9mcXhONWRWL3RyaitwcG8vMjZ4SEhqSkNuejJlemhSeFNZcGJH?=
 =?utf-8?B?L0N4YmZaNEovRWZOL1ZXS3BKM21JUWgxejlOaWFvUzhQWVNYT2QzaXZwSlYy?=
 =?utf-8?B?V2s0eUVZMFNGSmdXV3kzN1hwN2FqOVlJelhNTGxsaUZOc3dmSXJydVYySzJ3?=
 =?utf-8?B?dmtzKzBDNmJaZVNTSmR6eCtXMjhjd2dpa0h6RHk5bmNQeTAvNWhlUEdGWk1H?=
 =?utf-8?B?Smp1NVNrMXNvbXRQZGYvd1g0c1N1MW9FL0QwNElKaVNFMmlnK2UvUnhyTEJP?=
 =?utf-8?B?OWkwR3JWRUIvSlc0dFo2ek1MRiszU21nYkVMNnd2cnpQQmFTcGtzdFhuQlZ4?=
 =?utf-8?B?TVVwY0dsaU5IdjNLUHViK1pwb0o5K2NsbGY5TUUyMmtkU3QzckMxOTViMFpp?=
 =?utf-8?B?UGtFTzJrZTZWQTdNRlRBSUkza0JQK0JDL01mVjBvcnVjd3ZubWc2RUF2V0di?=
 =?utf-8?B?eGpHT0lWWnFEV0JlMWJ3V21DSFh6bFoycGxCT2h1SG81ZkFCY1RGMk0xSWVl?=
 =?utf-8?B?S3JrSVRiSEJ6dDhVZXhJdUVQVVBGM2NuRGxTaVd5K1YrQW1uV3orYXhnVXkx?=
 =?utf-8?B?clQ4cjZDUis4MXM3TG1xQ3FnMm9oa2xEdm1RTDVVVXZHc3o1b0d5dmJYUlIv?=
 =?utf-8?B?VFdaeW5YQy9BOExhOXdLQ25Ya2dWanZ1cTJWUE5jRWw0cUpPNDNsSGtXVS8z?=
 =?utf-8?B?WUc4WVdiM2xvTGN5bU5DM2c2NFdCSkg2bXluZlJBN1ZjMkhVRmRhS1l0WkJF?=
 =?utf-8?B?YTNnYURmODhZbFBZZVRQb1VhUVRnZ1YzZjVXbWVhMGZmTUU4a3J2NFB1Y21p?=
 =?utf-8?B?eUREc2k2R1VWLzdDSVpaK2hzY2o5V244ZitxRU1yRDhNd2hYVHRWak1mMDQx?=
 =?utf-8?B?bjcxZmpsQVVRdHZ4cmh2UkNNazlVc3RDc0hURUxVcCt4NzlXOVE5aFVjSkV1?=
 =?utf-8?B?RE9iZ1BJVVlBSGM4SUNxZjR4K0k1NTBBMkhXOEZBQjdqakdpNDlUSXlnZEc0?=
 =?utf-8?B?WVNWc205R2NVOXVtaWJSWVNEdjFqWnRTOVA2Wk1WUmVZc01SRDROVmdERkRq?=
 =?utf-8?B?YzNyV01rV1dEUm0wYjBJSEFCR2pSMjlXcDVWSDF4TVBwSFlIVUZtd3VITEla?=
 =?utf-8?B?aHFRazJaWkJ0dTk5ZERROXlRZjhEUi9wSzR0cE9UUjRleCtJbmhmSVFES20v?=
 =?utf-8?B?aFpMRC9LVXluWXZWVHNWRjRzSGh6TXJRQXdsN2hMK3RXUytpSnBTbFNucmcv?=
 =?utf-8?B?d1pnRURodkIzaXRoVTFDSmcwQVFZcFZlV0NnUkpZcm15ajB2QmZDcmc0ZnIv?=
 =?utf-8?B?Y2JFOHBPQjZmcGd2cFdORnFmWTdXdjd0YU5Xd1I3aXhRL1ZTRVd1SUZJWi9h?=
 =?utf-8?B?dTJrcWd4UkxiMmdmc1VvbzA2MlRRTGJTby9wNWZGS3dvcHdNSzNRTXpud0t3?=
 =?utf-8?B?UzJuQTRXZXMrRGc2dUhEQWNYR1lnL2Y3MWkrSHJDYVdwMkRSSDhwZ0ZHRUMy?=
 =?utf-8?B?dS8wdVlsTlpxT05wRFppQ2s4cEZkR3RuaU9yeElaUFJOMWc3WlFLZFlsdEdk?=
 =?utf-8?B?V0lmSWpoU1dvYUxzazZxYmFla3dwT1ZneG00cURVbC9rSDV6d1pRZFhmeXFT?=
 =?utf-8?Q?c4h2/J6quZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmpDdXdsaVE0Mks2bUFXMXdNd0tjZUV4aTZNVTNnUkQ5WDZDTnptSGpKNTRk?=
 =?utf-8?B?UDRPSDcwMk5KR1Z4MzJzczJXSHpyQkpXR2lOUUpyVHcwa3ZQdStZcTdTSzZv?=
 =?utf-8?B?U1RvaHd2RjBJdkdTZGx3N3JHSHU0aDZYa0VrcEl2U3FGaGxiRHBDNGZPQjRj?=
 =?utf-8?B?NjRqQzNhZDhGR1Z6L2V4QTk2SENtWUZybmVMWXRLVmwvVVFsTFBHclVUbFY4?=
 =?utf-8?B?THY5ditlOFJOOUZmZ21KekgzYVJNZlh5TVBzTmlNZmtHWDJ4QmF3alZXdkNZ?=
 =?utf-8?B?OURDcEJXc2w1RFpNbTJBVUlKaHNyRzJQZkM5cFpIUXVUWVFTZVB4TWZkN2xu?=
 =?utf-8?B?WjhCRkpJWitHSVVSUjFzcG5neDh2V3A3dkU3aXZwNXN4Vnc4THJ1a3hnSGlq?=
 =?utf-8?B?U0xmNFVxRWhEaE1Tc2h1L012ejk5UHpTRmZaaWlZTWkxYVpCWGMyTnhHRjNQ?=
 =?utf-8?B?UklHZ0I2WGdveUIwejljbFNwMVcwc2pleU8vQjdqNS9ySExBRDZwcnlMOTlY?=
 =?utf-8?B?UUtEcjZ3TlMzNCtNbU1nemZRL29VeXhYZS94ekRCZkhzUjdrSEthM2xYREN4?=
 =?utf-8?B?TFVuTEx2ZkZQZjhKS2ppNStNNkVUUDNFdXZBaERYc0xnTytibWxFU21mS3BR?=
 =?utf-8?B?M2tVcGdmazBWZUUweSsxMlB1QmsxeG4xb3AwYmJjNC9oSWRIeitTeFhLcUE3?=
 =?utf-8?B?WThkNkovS1dOUmtoTElERklVSFh3SGovbmRuQWI0WUJBaERYQ2pxY1Rmdkxz?=
 =?utf-8?B?QVB4aC9wREM1QnorWjIvUElRWlVXM2ZRUnMvSnRrS3B4b1RzY2tub3dUMVdZ?=
 =?utf-8?B?dlRqOGM0MldVc09wRW03SnZCQUVrNVhwelhnVGFqNGk0cVpQRzBrc3N0N0pX?=
 =?utf-8?B?V1JzRGU1Qm5LcEdkT0RqSCsxYTQrLzJVUkR6ZDhGYVlIODNJWk0rVFlkeVNl?=
 =?utf-8?B?OEQzWVorb0FCSHdsNDhxK3JOckx3aE5nZHViN1VnalplWmVvTWJ5TWhpaVhs?=
 =?utf-8?B?Slh2cVBLWHVtcC9pTnZpOW1mbFBDTVJ2RVI4RDZMeC9xM0FrODNBMHNjTE41?=
 =?utf-8?B?bTVTcEtoY1Z5UlM2NEwyQkZqcWZwbTh4RGZRcG56TjZkSU9jM01wNytFeW9n?=
 =?utf-8?B?NUdORjRqSHFlaGt5b2tvWWs0dlpZMTBKdXZ3VG9RZHNOYyswcFdJeU1qWmQr?=
 =?utf-8?B?Rm9qeUt0TzQyWk9RS0FCMHpwYXJtTjVmRlUzSnl0bGo0UUw0M011SHZZUGdi?=
 =?utf-8?B?em1RV2QzWkpCbktlMmpCdi80YlBmdXNQd2lOWGpUVXhiL1M4MktMRERIdkRL?=
 =?utf-8?B?UUxxa3BBRWxCekEvYTRld0dCdHlTOXM5cmFVVUc2ZnV3YWRTd1NNN0V5emNh?=
 =?utf-8?B?WE14alNuSWIxZDlobGplNGRrL0dnaFk0dTQ4R0pBMStjT3ZNeWFnNzdhWG5p?=
 =?utf-8?B?Uk1ZcEI2RDlEY0ZlV1NQcDB3QU03d21yRkFYM21zY2preXhHYWVFV0lBZ3g0?=
 =?utf-8?B?d3RLY2t5ZWJjOWJCM1NJRFc4RWlwU0tOazgrVjNzaXpFeUxUdWxtdzdEelJP?=
 =?utf-8?B?bnJYS3FPc1dNWXFIdTNDN0g2L1YwdEplOGUzMGdQTU5IUzlSTVdoU0ZnU09T?=
 =?utf-8?B?UExZYm1BWWVYdnB0QzRPMTd3aTFWdXVmQytMb1dNaDE5MjR1UWNUczJRdFg1?=
 =?utf-8?B?QUVHMUF6eW1qYmtFcVNTMm5ReGRETUcrZm1oM29UZVZwb2ZNRHc0cnRPOXF0?=
 =?utf-8?B?eFViWnhGMjlReUxtRnpXdnVJcHBTYU5DUVJLMUhQY3Zjc2NHY1NqdVZyNUdi?=
 =?utf-8?B?MmE2OE8za3VWcWdrWkFYd05mMDJ5N3RWZUJ4MnljVTRyM2JEZkhDZ2RBY21u?=
 =?utf-8?B?L2NtcmJ0VVZXdDl6QUV4ZEVkRUNEcXhVTW5yTE9BOWpYNlpGdVptMk1SUVN5?=
 =?utf-8?B?NzVUVVNKR3ZMTWZkL2FTUzR5ZG9xVk53REd1Sm9HbUdrZzFJK0xYd0dDeUFa?=
 =?utf-8?B?bVBVZzNCV29xV08rUC9ibGVRQTU2RmhvOGdsd2N1MWRZSFFtYU0wVHhSdnhS?=
 =?utf-8?B?REoyRFRXN01RRy9CNzdmMTJyYkNEbGRVdm1RQjEzR2w2WVBTemRyQ3JSMlVB?=
 =?utf-8?Q?07l4WE3oKrpCkMg0Hvfr56xRW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6714a5b-b217-45c5-4456-08ddc3941760
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 11:38:17.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFm/wQj4B3b/S22p9yKaAkfan7LplhY0DydxDy3RevVJD6vasT+7wY+dAbh5qsIafqwkkGeE2CAU/NsaDBjuew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

On Mon, Jul 14, 2025 at 08:36:03AM +0200, Michael Walle wrote:
> On Fri Jul 11, 2025 at 8:06 PM CEST, Linus Walleij wrote:
> > On Fri, Jul 11, 2025 at 7:45 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > On Fri, Jul 11, 2025 at 07:43:13PM +0200, Linus Walleij wrote:
> > > > On Wed, Jul 9, 2025 at 5:09 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > > This is not my area, so i will deffer to the GPIO
> > > > > Maintainers. However, it is not clear to me what get_direction()
> > > > > should return.
> > > >
> > > > This callback should return the current direction as set up
> > > > in the hardware.
> > > >
> > > > A major usecase is that this is called when the gpiochip is
> > > > registered to read out all the current directions of the GPIO
> > > > lines, so the kernel has a clear idea of the state of the
> > > > hardware.
> > > >
> > > > Calling this should ideally result in a read of the status from
> > > > a hardware register.
> > >
> > > O.K, so completely different to what is proposed in this patch.
> > >
> > > Maybe you can suggest a better name.
> >
> > If the hardware only supports one direction, then .get_direction()
> > should return that direction.
> >
> > What the patch does is to
> > read the direction from the hardware and use that in the
> > set_direction() callback, as if all regmapped hardware in the
> > world had fixed direction, that's wrong.
> >
> > I'd just add something custom in gpio-regmap if this is
> > something reoccuring in regmapped GPIO drivers.
> >
> > bool is_fixed_direction(struct gpio_regmap *gpio, unsigned int offset)
> >
> > or so?
> >
> > Then the core can use is_fixed_direction() together
> > with gpio_get_direction() to check if it can do
> > a certain set_direction().
> >
> > Pseudocode:
> >
> > mydir = get_direction(line)
> > if (is_fixed_direction(line) && (mydir != requested_dir)
> >   return -ERROR;
> 
> You don't need a .is_fixed_direction(). You can deduce that if only
> .get_direction() is set in the gpio-regmap config.
> 
> mydir = get_direction(line)
> if (!config->set_direction && mydir != requested_dir)
>   return -ERROR;

This implies that gpio_regmap_config gets two new callbacks
.get_direction() and .set_direction() and that in case .set_direction()
is set in gpio-regmap config, then its used directly from
gpio_regmap_set_direction(), right?

>
> That or either Andrew's idea of setting a bitmap within the
> gpio-regmap config which already tells the gpio-regmap core and then
> amend gpio_regmap_get_direction() to return that fixed direction if
> that bitmap is not NULL.

Even though at first glance I was under the impression that the bitmap
solution is cleaner, how big should the bitmap be knows only the final
gpio driver. Without this information, we cannot know the bitmap size so
that we can use the DECLARE_BITMAP macro in gpio-regmap config.

Ioana

