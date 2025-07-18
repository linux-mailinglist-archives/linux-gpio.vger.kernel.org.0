Return-Path: <linux-gpio+bounces-23435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D290CB09C50
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BF5B189DDDB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E7321931C;
	Fri, 18 Jul 2025 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k90G25WI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC44218AC4;
	Fri, 18 Jul 2025 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752823487; cv=fail; b=Elos44sGKxPDNGqABcu8frhaCItTX90c5K9R9U6qxwhrRhkvcyYbmfv3EnbRe/OMNMHhTkSiNg9KX+9tFgoJBSPSdiGuVPb1k0lvx5kpGbaXzo5/7MHPqLk/UuopvcAjyF0eSc6vaVQm8eqr4fZ1oZJc6fXDp+egYBntUTbmhnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752823487; c=relaxed/simple;
	bh=fbR8Mp/6mcWYm99ozkev/AZSvXPTPAslekain/MOWtQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VVoMLqg/HnekgldtbumTGOUF5EaiuKWRqRf7ggSrWLX5WthFp5Z/VenfWPVc8v4aEEwkXFjJfu65S32hplBmWJcCbjmis0FaBMRPKCT9YIkiR2iUVmnNlc6TN61j/hiq3aEnjU2AjQOnnleL4ymDuWrjNWmQsJcpERxd1BSs2A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k90G25WI; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixc4b2eVwCPbOj6y6Of4Phoqjgd/lsfc4Mrmygnb/27mSbT888QkE7Aa0ofY+5SGZ4D8z2/DGJKI7auD0G+gJXtIivV63XWl+DiSbx2Q/I/qsDDPkep9hjQZz9peTn6cpAXHUbB76FpkOZBu8fFy7XbOXTr1d4rRDVnblQ205GXs9vMVezdAVmeiDHRAoaycarBJKR+33Z9S+bFmGr+JPq7ajojrSH1cL/7X+GVGqfxulrqDvmcVd+0XJ8ZjugVhlOSZNaP9IKEtlKgA30Emn08RN/aayXz69Bo9YKoavAPBvJyptABATsI2qUOFJ7Jy38GkRujgbuBYxGzLl4HOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73SbRONqFiKFJzvbBgmyYPOBZ8LemMBuitJzsctNCc4=;
 b=mCisYPbIJcrouKA4M5ta0Em+aECEO/7q5F5YxYqcxlicOD26mV2PO5uMeb76v37ZfQnp0ZfmidlOXsV0ZCcDy/t536fItd23wITyTEmnWiCyFoKDUzmZnohKm4ZUgoPPxgbvPjQ2Sl74jfcYTdbHkXrpYMoqWEUM8DaZmH/1e+1eCAIotzLNUMY/GCX7mJEWh4oRPY9Oxz/zi1MyQoUmtVeSHx4ZaEylWEaHyN4ENBn5XdA0gRUrfdULpvi3j91Fa9t5Ssbes2e42zLOczkPdgwlPt56s8Fzr0iFibt815HygzzTF+dgwUPQaO86jVaDsDXbR/559ASqMl7ey3oLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73SbRONqFiKFJzvbBgmyYPOBZ8LemMBuitJzsctNCc4=;
 b=k90G25WIr6DEbgu8WMKXzcJ/pZHto70pKJx1H7UviTkN/xsHlH6qmAR5VM/Suw0fsdF01Z2BGl8qBvH8++S6EhRokABo4BL8F4Q6p86hn0zr8v4Uae3IK77sNYz0y9OXCtC5v+/njV2H3EAJN7PH3HtN6wrzifbEmm1oi3p884k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW3PR12MB4441.namprd12.prod.outlook.com (2603:10b6:303:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 07:24:43 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:24:43 +0000
Message-ID: <8b0c852a-e7dd-434a-a8f1-a39b5d5906ff@amd.com>
Date: Fri, 18 Jul 2025 09:24:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] enhance zynqmp_pm_get_family_info()
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, git@amd.com
References: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0177.eurprd09.prod.outlook.com
 (2603:10a6:800:120::31) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW3PR12MB4441:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fd3bfa-1e6a-4467-3d1d-08ddc5cc2a78
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SllVZkg2N3BKY1hEZGNmc1p1dGVmdUF3d1NKQUxjOW56bDRrVVRnT3FkZlBW?=
 =?utf-8?B?ajc0TWtJNVVDelhoc09sSG5ZWXF1eEJaTnRkc0QvR3RObjNqempWQm04c1RC?=
 =?utf-8?B?V0NrS1ZPQ29acDBEb2hEdWoxL2NxVkxucjRLa3BoZjBscE1RTExPY2dPWTlx?=
 =?utf-8?B?R2JDMVQ0QnF6RFpVZzZ2T2FqUFZ0cnVwSGMybnNwb2hGeURqWjJDSTJjcVVN?=
 =?utf-8?B?MlZlNGcwNG4ycTRORy95cjV3R2JHb3hpblhaZkdleGdyck1pc1NMVTg5cUdW?=
 =?utf-8?B?Slo4ZTBGZk83aEZHRjh6MTEveUE3ZDNiVFhueno4Vy9tL1JMOG9XV0VWMkFW?=
 =?utf-8?B?aWhWMTVzZytQU1NPM1VVYlBFRExNSmV1Zi9BaWRhZ3Rmdkl0cW8vT2J4UWZm?=
 =?utf-8?B?QXgwWUFuVmErYXMrOEFWc242d2xuQ3NkRFgzS3pXbDNZUWpOMnlSZk1WdDJV?=
 =?utf-8?B?aEVaL1Q1ODNwL1hXZzJOZG5iWFdyVUQ4SXNxSndvS2JldDNZMCs5TGw5NW9H?=
 =?utf-8?B?OHdhNVI4aGJsVjJ0bmpQYVI5UXlHY2NjL1BwbUZsRXk2TkpuSGx1bFJJVllu?=
 =?utf-8?B?UFBCUk5nN2s3ZERkbHQ0UDI5ZjdWUWdaRDJicU92cE1nK0x6OGFITjBNYnlk?=
 =?utf-8?B?WUp4SVQ3cmV4VjJuMElzUC95VTRuMWxhRTZwUEpJMHEyWEtQOGdUYUF6NkpJ?=
 =?utf-8?B?cVNib0NON2pLdzNhT3RtMjBZQkVFSnNLWDZPb2lVNmZ2amZqbkp5QmpLd1N6?=
 =?utf-8?B?K3ZLUStURmk4ckk0cFc1SXJGeEx4UE0zQ1BIOUE2aTlEWGdYRUZMSkpXR0Ns?=
 =?utf-8?B?c2RHRllROE45Nkh1WWVnWGJiYm85YW9vK2d4NW16ejlJZkd2aG8rWVZDRGV5?=
 =?utf-8?B?QVBYaHE3QjFCRklUUllMcmxyMnBTMEtHaUJHN0hwRXMyRnlvM2hrMXpqOXhC?=
 =?utf-8?B?NzhmZlExK2cyRXRkMy9TV2hjTE01cDdRcUVZTklQYUpjUGRLQVVFR0s0VWRY?=
 =?utf-8?B?NzZTUmM5dVZYdXMvQUxoaXFwK2RqNjJBdkRSNzU4cGNMMC9tUFJib2Fxa3JP?=
 =?utf-8?B?bkx2SVNBUUlXdmNFUFNzdGxtWFFnd241UW02ZUU3QmN5R2VmOUpIcTgydWJz?=
 =?utf-8?B?eGE4SmxBQTVKMDZTV3FuRXNQTDBJcCtaVHZlcmNpRmVLSzNjS3oyZW4yK1dO?=
 =?utf-8?B?ZEhtUVZ2R0RsQlZEc3ZpRGJaMEM1dlExbnpRU1R6K2Z0M1k5UU10aTZWWUh3?=
 =?utf-8?B?VTF3alJUMU80Z28rWjRlRklma1k4cnBHNHd3Q0pxdC9TZVV0VGNRd21FSSt5?=
 =?utf-8?B?RjNtb0VBZ1dXb0RWTXp3Q2kxOWlrelducWc3dmdFOVZMRTF4TzhWZlZWeklh?=
 =?utf-8?B?aGxLMFF5Ui8yNDZHbEF6dXhubVdEM3FyeGNwS1BpOUduOHpJVml6Sk0xKzlX?=
 =?utf-8?B?Zk42RkFMaCtKWG90c2ZDdDhPNHFLaWc5YzA4ZEVZN05VTjhEUVY2Q3RITjZF?=
 =?utf-8?B?RUFFYUI3ZWdvcWNQY0FjdWZNZnZKYTFSSVdHYnBPNy9RTndMVEhRZStYY0g1?=
 =?utf-8?B?OXpocDhaUGNFNXlpNWNMQi9qaUFZRDV4VjJ3cG5TYVZYYVBTb3JlM1VPdjlL?=
 =?utf-8?B?NnZaMWV4WTJqUU55WFJ2T2hJT2dtRE13MGV5RFNJZ2g2YWlhTUVXV0hndWx2?=
 =?utf-8?B?U1E3TnU3RjgzOStQT1FlaW45dGQ3elVjVTh6NFI0aG5uT0VpY00weWgzcTc5?=
 =?utf-8?B?UU9ZdmtMbERjaXoyNkc1UFRHMW1TODRRWm1Pc0lPNkdKZHF3dDRWSDY5UWx4?=
 =?utf-8?B?K3FBN3RDa3Nwc08xcElJR0dMUllMVUR4OEE3MFk4c2RMa3AxK0RCYmZqRnFY?=
 =?utf-8?B?S3VEaXc5Um5uRkh5MjBTVDFwaW1lMG5IQW5zSjZoNXhXS0lhNmFGZGd6WmJV?=
 =?utf-8?Q?T6Isvf2leUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cElFMlNsSGU2THFzeW56cEQrc1JJc0p0L1QzQml5UjVXdEQ1azh2K0cyOUhX?=
 =?utf-8?B?ZTlNa3p4Q2E5MEE2MTk0N1Avb2pPV3hybEppcGk2VWYvdUsyOGw1OEt1ZDMr?=
 =?utf-8?B?a3Z2cVJUSXRvT3dXZm9MbTRZakxGMmFEMVVwQlIremNFWFF0STh5a3lzVDVP?=
 =?utf-8?B?VTBMcVM3N1hNdWlkMTVDc2ZPa21RZ2ROOVVDUUQ3aWluVXlDVFJNN21wb1A0?=
 =?utf-8?B?bnE1RWNGeTRjRXQ2RlJnanVldkNBYmsvRE9hL3JjWFZDL0RYWkNBbnU2RVhH?=
 =?utf-8?B?VTFCTjZOZUZ1cGVTdlJWT04vcC9pRU5GMFpITWhpSXV3SUZsS1RUZnVXTXRj?=
 =?utf-8?B?NHlrVG9hU3V5NjVweFQ4b1JKelZxL2FKd3ZBV1J4MTY5dklZUmVSaWV1c2dq?=
 =?utf-8?B?ajZOTUhjWUJnOThxYUVCc1diZnJJRjdKQXorTlNDWWYyUUthK3RQNE1kWm94?=
 =?utf-8?B?a2lQUTE3TWhJTVpDaWVoMlpZYUZ0L0x6OXZHTjdZSnFHWHBaMmZXNEdtTStH?=
 =?utf-8?B?QlVhM2huRjE0WWp3Zkk1U0xuSXQ4Z3h1N1k3TFptYk85bVFMWXNJNVg2blR2?=
 =?utf-8?B?aFJ6MHBKdDdROVhOZ2JmVUp6U1dNL0NFN2FuZWVOM296N0RCNUVGQmZOZ3Jv?=
 =?utf-8?B?NGFTVTgrUGdOSmR1R1N6ajhKakhnU3BaNElWQkJGR0R1dWZ4QTQ5WjdVcFNq?=
 =?utf-8?B?Sm44a3RnaTlVUnBDWHhPcW90Q3ExQy9CNGFXOTdFbE5KSEFIUzF5RG5FS3BV?=
 =?utf-8?B?cHNaOCs2a1EzQkVzZzE4dlh1SmJiZjBQZzNqbjhUMEpLSEYrNjZhaGUzOHUv?=
 =?utf-8?B?TVo3TXFGZ3pHcWZ1bC9lbEp2bUpOSE9vUmN1NHU5WUozSjdyTDN3OGtIQXVa?=
 =?utf-8?B?MDQ2QzE1RnY3S0ZhSDBjSjh3Z2VEZ3JrOU1naXpGUi8wWGd2V0owaGJHeXZS?=
 =?utf-8?B?emY1L2lNT0hzQmpzZ1ZScG9idGJLOVB3QW5jNkVyVXk3QUswNHZBcktwZkxD?=
 =?utf-8?B?akZKQ0cxVFN2bkozL0JPZ2hkTFU0bXdMNTJKWW16MG01aUpJd1MwRmREL3Zn?=
 =?utf-8?B?VnZPbllnbTNKOEVsM3l1QlRGeTBuam82QjErMDZmZkJ4QXh6bCtTWG9heUZP?=
 =?utf-8?B?YzNNTDdaNG12eGY0YlUwMEhNa2NVZmRkL2dHRUxSQ1lneHBkY1grYWtzdEpR?=
 =?utf-8?B?RXdINlNOQXlBQnNGRGEvTkgybGNFS3MzSHlCNlVwZTdNNTh3WmhQUStIOGRW?=
 =?utf-8?B?SHZiQm1jRXRSQWZrYmduMlJXTW5TNjBxc3N5ckoxUHpaQnIzeGhXeDdOakJD?=
 =?utf-8?B?VU05WG9mRWgyenM3N2xncVBjSDhObzBRTDJ3dGswWHlPdTR6KzYxeURXd3kw?=
 =?utf-8?B?aWtLR3FtZkc0RWlObEs2Vk05eE1uRkhhOElnSDUya2RzcjY3L1RhU05tYTBF?=
 =?utf-8?B?Q1JwVjlZSnVYenUrVU1pTFlnbzJLNnh0ZlFNR21xWmtjeExCYmRINWs1amt2?=
 =?utf-8?B?aVZveEtabzFoYlFKUXc0eTk5V2d6T2VqT2pleTVZcE04QWJlWUwwa0ZhR29U?=
 =?utf-8?B?TVg2bXRXSXY5MUdQVjV6YWJack9kL0NDOUdTVlpjOG1wMGwwRWpzV1Q4QTRB?=
 =?utf-8?B?TFdGRnhIU1dNdlpYcWpCVlhFTTJ5QkZvZndWRmliSWJXeTVuTjJzcVJqOEo5?=
 =?utf-8?B?R3JjdTM2VE40MWE5VDdSbEc0REVuVy92d2J1UTBldHp2M2FDQitsRVNwMG5u?=
 =?utf-8?B?QUZYc0QrRFplOGFWN1ZwQlgzdVl0TVA3Q0xqM2Q1QnJLUVBQdFloa0JmOUJD?=
 =?utf-8?B?Qkk0Yks3SDlrVXZtMWg5S0hKSlM0cTZTYXB4aEZGcmZaa1J4M2N6OU5mR2ps?=
 =?utf-8?B?U2kvQXZ5b3BZRjlPWnNpR1JLdk04UTZqeGI2NDRHZHNzVFYzK2owTkRYbTBB?=
 =?utf-8?B?cUt0Nk5NRGQvUDhDdTBraU45Y25HaVRrdmlnU2pnb0NvZmZMWnVwMnFJUmZJ?=
 =?utf-8?B?SUZ5bWZQZnhLS0dsVEl0RzNqNkljOFdVU282eWh0Q2dML1B4YTRPbXoyZnds?=
 =?utf-8?B?TVRBaGJVR1FtVU5mVFhXeUZoMmU3YWF4a3JKeWoxcGN3UVQ2OXppMDZIeHBs?=
 =?utf-8?Q?ho4n50WC6RWUMgpDB8EE1QVq5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fd3bfa-1e6a-4467-3d1d-08ddc5cc2a78
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:24:43.4092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LeYD9MHJU97W3aERKRiChJju6xGCzO1nsL1T5JO5MnNZWNC68+1mHUz9bNm7kpE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4441



On 7/1/25 14:38, Jay Buddhabhatti wrote:
> Enhance the get family info functionality in the Xilinx firmware
> driver. Changes includes adding Versal NET compatible string in
> firmware driver, adding a new unique family code for all platforms,
> and modifying the get family info function to use the unique family
> code.
> 
> Jay Buddhabhatti (3):
>    firmware: xilinx: Add Versal NET platform compatible string
>    drivers: firmware: xilinx: Add unique family code for all platforms
>    drivers: firmware: xilinx: Switch to new family code in
>      zynqmp_pm_get_family_info()
> 
>   drivers/firmware/xilinx/zynqmp.c        | 73 +++++++++++++++----------
>   drivers/pinctrl/pinctrl-zynqmp.c        |  7 +--
>   drivers/soc/xilinx/xlnx_event_manager.c |  8 +--
>   drivers/soc/xilinx/zynqmp_power.c       | 10 ++--
>   include/linux/firmware/xlnx-zynqmp.h    | 18 ++----
>   5 files changed, 64 insertions(+), 52 deletions(-)
> 

Applied.
M

