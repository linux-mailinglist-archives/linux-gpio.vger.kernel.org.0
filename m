Return-Path: <linux-gpio+bounces-27500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05779BFFAA4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E71D4FFF61
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 07:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8B02C0282;
	Thu, 23 Oct 2025 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MxZQI2+p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DAE258CE8;
	Thu, 23 Oct 2025 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205167; cv=fail; b=eOqNtJS2gF8R2lardNIDWUmwjgH6SjRbU243Jlz2t4SPGPOP/oFiRkcBh+IXKVS9IELpaQnds6Y/wfBBIRg775qHwRYC1P8fqdMqePlWBft63ehWMEIBQz3uD4U1FtNI1gn/rZogBMltL80h3rUjh29pohdYLD79Dl1MvXJ+xU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205167; c=relaxed/simple;
	bh=L0gGHVs3rG1Jf0G9a5OHxDjz+9q3xroW2IoAm5gyFDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R7jpqMQ0Okgojwz99knnwl+pWW+NhHB/EgoY64R45H2LSH3wNN/mTLHvbCbHv6Da0rZ52bSCv2aU1FAGDBslMPpKPbwTo7lZMRZT4NTYnOi4mizNzVhYgPJb2sYGKydg5zNcl5JWy5B3zH4JTLDrHNaDynmXEb0kIDt+WRbiNxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MxZQI2+p; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFiiYWK+kyeZcXbCgbVEk6aA6+BXHfKk9WbS1R+FYfVY9lVJe7cbxc2eqLxwUYytRcUZox/JlgmVyGiFUsKadorkiqzaNGvb8fvZuyEO+qhfM5sCKJmO7t7zis4HniQ3c+qlo7IK5yFvQXQsWWWZOdgDVcGX1UXiHiuPHrWl8DKwtOG1ojdDdax+OTfbVyWBs3bHujYUHHeihhARngWQBf/veYa5pDO7nT8miWADjkaUeOr2Xzng++F1ozJpUG5yU88zxdhyH+mTJD2Zmj5eAl1e+nFXgnJLEyYtGoVLDhW+SfM+w1E+Riy3HoeLa76xmKkZVoEcC97X2lWHFto04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE4/h+TnlII6xZMQ7UxPpaU+ZT5/j6gqgx8P6oXAlf8=;
 b=XRy634g6KhPU/pjxTDh3jlJpM+WG3k6jxJ+5qz8Z6s+/G4atKnMGe7hnArvIv13pulgDj40JQNIAjKebtx29L8X/uMYKhQfbVsIz3LE4BXhwI3s7ggfyLETfIGY6EatomSSr0CRaVe2dKTFNNW3v51BhzER8bgruv1aU74Sepl5eOa+qxSCpNfcPN981JNdrbt4xRyN15p9EgQPERT7RL01Yn4RbNXTnJjLXbJBjbLASJre+X6kh86Dk2huRRT6p/heVFRMauap7VMfk3amTxtiFB3OE93TLC/znmCwZBuEGH3QDUg2MRSrtzWB4NO4biSFA+Y7+heCRpdJwNh+z/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE4/h+TnlII6xZMQ7UxPpaU+ZT5/j6gqgx8P6oXAlf8=;
 b=MxZQI2+pcr3UuWZoem475ikyGyTdP1i8P5Vex2Z+B/oy6/P34OfPVk1K8O/vw6cvkPJZnEFuMVCNsQULgZ49KvjhV9OZBtq+wJeEw+c0f95kdraH0LFXy5oLe7NsPHwFRA5Tpi5YurIairerwjBnyXa/HSqtnxtv0ur2VqZ6CaQnjV8GbY2pbD18jUvY4YBUsOEdmjJS1pSdjSQt601UhJxpAeHKTyAn7dRDuhMnkD5Bob/ikwVzyNASqpI4lPr9app/hkMGNrsk++IcqsIrjRRXl2i1nwcvJxHMgu0MCATj0Xq5qMTNr8QybxRQj0G3jg0J0EQWVx9n6ztPWKmTtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 07:39:23 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 07:39:23 +0000
Date: Thu, 23 Oct 2025 10:39:19 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.li@nxp.com>, Michael Walle <mwalle@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/9] drivers: gpio: and the QIXIS FPGA GPIO
 controller
Message-ID: <ynk2vtpbidw76ku53tiefu267iwasc7wezwi5fvqodohcyrmer@brffm6erx2fe>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <176060910602.64650.7023197009719546944.b4-ty@linaro.org>
 <o3oknl2onntkl2dgzpzsjm6xeunqxrq3j5afo5zb5gdy6xyo2r@4ctlictxhdlv>
 <CAMRc=Mepg=Cw0yUouEi9sJw+rPh3xRCQsbgYc=GVCsLXr3GAXg@mail.gmail.com>
 <aPEFBXwDUTwJK4us@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPEFBXwDUTwJK4us@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P190CA0057.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AM7PR04MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 189c73d0-ad6e-42b8-5518-08de120748d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWdaaWZONkJPVFVZZDcrblJmUk5ERnpGZlVodWNXYTFrbkJvN0JiRHg2bVpM?=
 =?utf-8?B?SEtjU2F2WkJiTGNEemJibzZCQ1pXdjgvTkJsZzZDMUlNNENMSHRvdEtnRi91?=
 =?utf-8?B?dVhkZXBSVE9vSnRlYmxDdGU5UTFxMlc4Z2x2VGF4VTFWdFFEcHREVk5Ra01R?=
 =?utf-8?B?TURlU000dUwxUXFaWTk2b0tXVytiOURrenNCOERrU0J2UE1ocnZaTDhRcE5H?=
 =?utf-8?B?S25KTGtDSFhVT2FvWi9nbERMQzBXSGF0NUJKV3dlcUN2d29qMHRmbFcwYlBL?=
 =?utf-8?B?a1NVT2dnaWM0OHE1Y1AvbHdDTVRjb1B2S1BxOWNoRXhPR2lEcDB5K2hFbjlX?=
 =?utf-8?B?UEJ2cmpXWnBKdTFxNEo2UWV4Uk9wbDUydEt4TmtHMVJPUW1wMUc3QmdtRnJv?=
 =?utf-8?B?RDJhajM2ODQ4MTBiTEF4SEZFYUZlL2hxTFNTbnd2TXNuVFJoT3NKUVBjZmhZ?=
 =?utf-8?B?SWI1OEl4YVo5RTRKTmtERCtCL0ZEcEJMNndacVFxeTQ5Zk04Y0hQMW5yQ21G?=
 =?utf-8?B?Y2pJMkFPZUg3dkFsWFNDOGYzTDRZdDNDanhDUW1jaU43RFozL1p5R1E5b0p1?=
 =?utf-8?B?MzYrOUp0UWRTS2tqZUNXZTN0TjV4ejk2bW5xVnJOUVRjT1Evb2JlNUFLeUR3?=
 =?utf-8?B?bVVPWmExZkJzNHNrTXIxRzBXazQ2MkpxZEpDaDEzVCttQjBrV292akh4dVZ4?=
 =?utf-8?B?dWNjMkxWYUJPck5oMHZpWE96cjlUdElPdjYwN3FxbVpyNFRzd1NPWUxMbzBT?=
 =?utf-8?B?dXQ5Rk51dTJ0cVdZbFArWWtqckxnbCtWNSt6SklxRDJaNWYvQXNpM2VnN3F3?=
 =?utf-8?B?OU5FYnhYTXVpL3hEelEwWUtrRWhZdi9JVFpYNzJ3VngyRXliZ2EwOUlLMzVU?=
 =?utf-8?B?dXRaYWlpSUFyeFR3NHVBWkg3Y3VYT3JMTVBjcmt0M0JHb1FIdk8wdTlJaFRo?=
 =?utf-8?B?VTRKYW9DYXljZS8vYjdPSVlZV0tSdXVqVktaODFKNnNnQnBSQ0o4Mk9QaGxx?=
 =?utf-8?B?TGwxWS9JU1FBWFpxZm9NTFNQLzBUQzlrL0ZlbHhPM3lSN3VKTVBQNkdqSUJ1?=
 =?utf-8?B?OHByMEZZZ3N3TUhHM1hZbkRKeFN6QWg1WE4yNk4reXJ4OEkrM0ZTSVl5eFYz?=
 =?utf-8?B?UmZSL1kwK3ZQWHRScHp4ZmM0ZjVBOU1kL1MxUXFVR3dkUTRieUd5RE9wSEU5?=
 =?utf-8?B?ME1WZmJ2c0hXdUcxMTlYRVBSVDVJdGI4RFZ4MS81UGRRUisvSnNKTXZkck5k?=
 =?utf-8?B?RFNrU1kxSm05YmloK2lLOFZUMlRaUjlIa2FHWEU0bk03YVRzRlR6VExzem1V?=
 =?utf-8?B?V1h2TFBBOGtYdDduS2x3YjUxc25OM3dwWlBrYVlsNG8zdG9Zd2tVcERrQnpY?=
 =?utf-8?B?R3d4aGtUSUxUa29ySDZEeWtHSzM0dzkyaUtpb2lIRlkvbllvOVlZVVR3VURu?=
 =?utf-8?B?WkMwNnUyTmp4Kzd3VzVLMmdBTDliTEgwYlBnN0JlYkJCd1V5WGhIRGx0VzJB?=
 =?utf-8?B?MGJ2dEZHZ05nN2VTMUt1bVZiZUpRY1E5SGxkbVZlNlVOSHhOUzlybmhpSys0?=
 =?utf-8?B?RUhZWFlPSURMOXEvSWtTaFE5SzZud2dXbEM4S1pTdlZJby9OODZhYWFaVFpH?=
 =?utf-8?B?Ryt1SnBDcWlhYkQxeit1S0V5Y3g0aTQzZk5XYmtSdXlMREJCSUtYSUdrN0ZE?=
 =?utf-8?B?MFBWd3NqMy9Jc2xrWVp5cmJDancrNHBLK0JJSndyWmEvcVF1L3dHYXA2bHdX?=
 =?utf-8?B?Mlg3WXN2UzJ4cXhpaWJHejgrRjV1blhmMVhibkhsVmdGeDhiZkR0L211aDRu?=
 =?utf-8?B?L3dDYmVwTUM1S013YWtrZXhhV21xbnhUMnF2ZzN1Y0N0SWVhYzExM0JWRmhq?=
 =?utf-8?B?eXA0dDBWb2tKZ1g3NktVQXlDQXZqZkNnWWZYbzNJMTVqempydEd1cHRKQjhE?=
 =?utf-8?Q?nhQVXfmwfaAyXmyFWtdNneXDwCz9m8KW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjVPNWVkaUVKRWtiZlFZZy9CYTBGTGw1Y2diejI4cjlzRWRWc3JpSG5rZUhM?=
 =?utf-8?B?YlN0MERUTEs1dEtpOHBaRWg1RUhNbGdtNE9NUkh6ZmxQVkVobUdTMHpXZHBp?=
 =?utf-8?B?S3BHSHNqK2hpSWhjaXVzY1hTSXgySzl0djFST0NTNVA5QzJKQ2F1OUpDM0pI?=
 =?utf-8?B?UE1udjJ6WUhFSkhBaHJlUVZqM1BxdXBybXVKNWtpNkdXODdvcFNuMGNhaWtn?=
 =?utf-8?B?QlcwbTIwMEdxRDFxdzNvbnBxZkdTbFRQMmtBbHc1MmZpWnBzcG1OQTRITERR?=
 =?utf-8?B?M0N4L1pCZUdaVU10bWYvczdIVXhyUnhHamxoMk9MeTRDYzBFY1E3U1R6c0Qw?=
 =?utf-8?B?VUlzbFhQVElNL2N4Sk1mZ1kvb2llZldtY2hlbkJRY3BjcW05cVVmQ1E0ZURJ?=
 =?utf-8?B?OGdQQ0hyZ2Y0S2dWV3BTZ2wzZGdvcEI5ZVVuVGMrNTdxcnpYU0pRZ0FkRWVR?=
 =?utf-8?B?anlScnh1Yjh3d0NKcGViQVZWWGhGcXE2bkxBeUNkRys0MDF0ZU9lY2hkUFVu?=
 =?utf-8?B?SUhFQTUrMURDRXg4MzEzaFZOditPVkU1ZTZPZjhhTzhpQVR1aGJWb29haHpC?=
 =?utf-8?B?S29hOUs3OWxOQUd1SElSd0U3RElPSkZoQ2U5K1BmT1JHY1I3a3pBVndUb3lo?=
 =?utf-8?B?Q1N6enlEa2J0SU41b1FjbS9sN0FPdG9uaUFYalJINkhxMmsyMjFZMHhhNlkx?=
 =?utf-8?B?SW55UktNS2JIYnpEbzFQbXpLMzRNc1BRU2E1Q210bWpxZmFqMStGUWVzcG9D?=
 =?utf-8?B?YVJ1eVY1MmxJVFVua2Y5UXpnajFta3k2Qm5WK0xvYXNSUHZRVVNxcEpGUWRK?=
 =?utf-8?B?QlZZN1hCNGtFbXRBNXRqR3hhOXBGWEhzREFqNVdWNDF0am82eWF0eGh4SDgr?=
 =?utf-8?B?OHRwWmpEMkZiNUpmQUhJUnByQ0s1VDRBbmVrOXl3cE1tTWxKYm95aWE1NlBq?=
 =?utf-8?B?c295eFRUUXhyYitCWk1QVnBQSG9RUE9NSkxMQVVrZzkyVVE0OElDcWhqTzds?=
 =?utf-8?B?UTZwNGhWTGdVMnhPdzZKYXF4WFlXNDhTNGs3d2RiWUcvNklQMWo2aCs1ZEZ3?=
 =?utf-8?B?MXhqS3FSK1BFbTVPMGIxWVJtRXVTaHpwNGV0bGVwbXdZQTlJOURSb3hmaXhs?=
 =?utf-8?B?a1NVNThubnN5S20wTVhpZXUzY2R5bVBFdElyYjVETzRtL0sweWhXb1ZhR2I2?=
 =?utf-8?B?LzNTeXQrV21EbkdEa3M1K3lUb3gxVU5lSUNGdnQ4VjcxR3kxSkc4ekZwV1la?=
 =?utf-8?B?bk5wc3RmQWp3WkN4RzlLUkxIU011OHFaam9PZDhPeFNFVXNFVzIra3FDa0Q2?=
 =?utf-8?B?VzkvQWNFV1BhSTVLU0I2M3FxUDN1T2srMG5XYjRYaWVPN3RlRVNwaVlLV1FF?=
 =?utf-8?B?VDg2TFlxYVBKRmRWSTZSWjlFN0JRL0ZmSkpUYWEySlZIVUtBL1lEZ0d0MTBo?=
 =?utf-8?B?SFNCZHRTc0dpSGhvbE85K0d3eUFwVDBHdlQxN2k5TExJdFFaL2ZBcU04ZU9C?=
 =?utf-8?B?SXM4UVNyV1VWRlVLWUlmUzRwZEF0cVh0WXRwV2duUlVoV1JvVzJ4bnlBbFZj?=
 =?utf-8?B?blBaRHBGSlZvTzJOSmtIS3NnV1RIWlFaK3F2Y1MxTkZENWU1cEtGMThuc0lS?=
 =?utf-8?B?ajJybDZJYnIvaFpTZGYydjc0SUwrdVZwZFRRNUdhV2VxZnhBY1hMWEh4Nzlv?=
 =?utf-8?B?WU5RR2FGb0I2VmowaFZuS2ZGZnUvUENCZ0hmSEJTK3ZUajZUNEZWelBGT1dI?=
 =?utf-8?B?YldPQlZzajZFUHd4cHl5UUpidWFBZU9ib0VYTC8rL2JRMDVkRzQrKzdTWnR6?=
 =?utf-8?B?THMwY1lFTmY2T29zeTFjUW1HclptRnh4K0JpVGltakU4UTFLc2U1THlrU3Vv?=
 =?utf-8?B?QlR6NkVEOVgzNFRuVDZJR0N0TzlJS2ZDajRxSTdob3l1Y0VzOGFLRnhNMU1R?=
 =?utf-8?B?RFpkMm8xMFA0M2xnSnc3RDNSTjc5bWJIeUdiVkZaandBU0czV00vWVVORjFD?=
 =?utf-8?B?SU5VRmFmM1ppOVF1VWhaRStQeW91OS9qcnN2ZDlEK0hIR1Z4UC9lL3hqR00z?=
 =?utf-8?B?SVBDdnVJc0didlBLeUdKZGlCaFFiVzJWWnE0U2Q3VXlTaXhHZ1k1ZlJVcHNi?=
 =?utf-8?Q?JJ3mgqKIqJGymQ0pt6qIUC9AA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189c73d0-ad6e-42b8-5518-08de120748d8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 07:39:23.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8vTzSqS5LtaB9+CngGpgFBqYSpMW//PvY3TqvEi1O2iNeeKuWcGdH1xL18iiXGBkIXPlmfoCg0Zg/M6PRyz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

On Thu, Oct 16, 2025 at 10:45:25AM -0400, Frank Li wrote:
> On Thu, Oct 16, 2025 at 03:47:30PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 16, 2025 at 3:25 PM Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> > >
> > > On Thu, Oct 16, 2025 at 12:05:13PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > >
> > > > On Tue, 14 Oct 2025 18:53:49 +0300, Ioana Ciornei wrote:
> > > > > This patch set adds support for the GPIO controllers on the QIXIS FPGAs
> > > > > found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
> > > > > the same time it describes the SFP+ cages found on these boards, which
> > > > > are the users of those GPIO lines.
> > > > >
> > > > > Before actually adding the GPIO driver, patches #2 and #3 add and
> > > > > describe a new compatible string - fsl,lx2160ardb-fpga - which would be
> > > > > used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
> > > > > other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
> > > > > fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
> > > > > will be used in the next patches when the gpio controller node will
> > > > > define its unit address as the address of its underlying register offset
> > > > > inside the FPGA. This requirement is described in the yaml file and it
> > > > > only affects the newly added compatible.
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/9] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
> > > >       https://git.kernel.org/brgl/linux/c/d5896130a8781de5ac8970dbb7083ce4cd6fe57a
> > > > [4/9] gpio: regmap: add the .fixed_direction_output configuration parameter
> > > >       https://git.kernel.org/brgl/linux/c/ae495810cffe29c3c30a757bd48b0bb035fc3098
> > > > [5/9] gpio: add QIXIS FPGA GPIO controller
> > > >       https://git.kernel.org/brgl/linux/c/e88500247dc3267787abc837848b001c1237f692
> > > >
> > >
> > > Thanks!
> > >
> > > How are the two remaining dt-binding patches going to be handled?
> > >
> > > The driver changes for the new fsl,lx2160ardb-fpga compatible were
> > > merged but not the associated dt-bindings changes in patch 2/9. And for
> > > patch 3/9 there are no associated driver changes.
> > >
> > > Ioana
> >
> > I would assume Frank Li will pick them up? Ping me if that doesn't
> > happen in the following days, I'll pick them up into the GPIO tree.
> 
> I think Shawn Guo can pick it.
> 

Hi Shawn,

Are you able to pick up the remaining patches from this set? Meaning the
dts ones and the two remaining dt-bindings patches?

Ioana

