Return-Path: <linux-gpio+bounces-18084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E5A746EC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 11:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63A133B7FD7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 10:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3E1214A8E;
	Fri, 28 Mar 2025 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="mPt6WGK6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39472914;
	Fri, 28 Mar 2025 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156145; cv=fail; b=bJi+waeTMoo5KRw3OTvBhxejd4iPC6MTkjKv+UP7mZtEAQwG4IjF398LTRIjS1SPJTHqx4su3nFFMBmDEjvZomxDgveOnWTIbySDzvBzviI2yRxNo4oaHlGXNNV8vbD9aiWn55LVOF9BoVpamIEpJABKB3Jp8QRo1io2FEs1I4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156145; c=relaxed/simple;
	bh=KZdsX902TVhaAq5DqkcIfYpC9iqtKkx5DGZRHe9fOOo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MPqdzguzJ5u8/MHvm1GCrHvArBMYtug2S25m2uYzYWRnODsI88vKGqG6F0XVnz/yJwXnKn+GzbFdXPFpu3CjTMtK0G0zZONF9nbFuDINgQBp13zoEKeE1hud9mTJu6BcWp+GrvJaJ+6mnAitAC/AxxgWO8+aFr/M7hAlx2+gZkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=mPt6WGK6; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S8jRw3006029;
	Fri, 28 Mar 2025 10:02:06 GMT
Received: from ma0pr01cu012.outbound.protection.outlook.com (mail-southindiaazlp17011028.outbound.protection.outlook.com [40.93.131.28])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 45hkb2u259-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 10:02:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY8gw9heTHtFS54LtG10YBJp8d+JezA/Ex8LndTjQcpBx6rSZVXsbS2xbvcAH8PIeG43uNgv9qcd3nn5ptJr30f5ZXOwFE6Km130M8+2eTVcXGc0v0nka5JngDfhCdXPlAdTWrOuiPGJcsGJLPN64z3SouICgDTTwVCak65WjpfKLUW5oKu9Oi5JqDYApx67nK1vmqFt6O3YBH2HP1zOLOCmIrVRYGP9YycNh+Yw0Bv/6OArOH4gaIEGNFhgMf3xq0wf0aCsRGmRBW9NSThgnkD4v1vLfiNBEwwGE35VamH84EKgV7IPuL0Ck5IaNYuAHSIXJP5jSxLlHhnaHXefvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUZKj6FSvd/Za6OD1EUdVJj66GfqGiWysvI7A1b4vxk=;
 b=TJLhoWGPj9A65/FWTwsNL3FOeyal5I/cv4NO0jTKcExZF1J/3aQ4vOOAIlZehz/VqI33zLBYKJd1RCsYQECvVQf/dFPF0m3gLWKawUz90XdtqdtZCAZXV8wBVQLVMA3D88n2nEPD8E8q9CI1KSomP9GuWOnS5GAu3Zf/iItK0f+ChT/jxeEhqAzu+7Mp8Izlg95BJ7Ou/fzGWIw9Mamw5P1ve9BMeunyU5Q1h6Br9jYVL+Gb6UjCM8jII83Rl4jTbtouU/PgtrwdW4Q3q6Sc5sh2W4m+xZkEA73gplL9ozfYlOUon20PurlUjh7vA1mTaaaYVZE/H2ztaIxAGhub+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUZKj6FSvd/Za6OD1EUdVJj66GfqGiWysvI7A1b4vxk=;
 b=mPt6WGK60aJUxthCPOZnAOSoO8T32Bd1Yxv0/FsY38x/5/5swAidUFSbRD1T1qyZZekgFa/jdyAeEZPji58QxNGScbuMenAfSkdtnk2MEvTaMOO6wAuRZFstdFdRPzutID47cNdVoZ9J75FftVe3Avi3UkVhqpU18E2hAehPleo=
Received: from BMXPR01MB4501.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:7::7) by
 PNYPR01MB8176.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.27; Fri, 28 Mar 2025 10:01:59 +0000
Received: from BMXPR01MB4501.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::be1e:370b:bafc:28f8]) by BMXPR01MB4501.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::be1e:370b:bafc:28f8%4]) with mapi id 15.20.8583.027; Fri, 28 Mar 2025
 10:01:59 +0000
Message-ID: <6b8583c9-3755-4b33-a454-261854e6cf2f@blaize.com>
Date: Fri, 28 Mar 2025 10:01:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill
 <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
 <20250327-kernel-upstreaming-add_gpio_support-v2-1-bbe51f8d66da@blaize.com>
Content-Language: en-US
From: Neil Jones <neil.jones@blaize.com>
In-Reply-To: <20250327-kernel-upstreaming-add_gpio_support-v2-1-bbe51f8d66da@blaize.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To BMXPR01MB4501.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b01:7::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB4501:EE_|PNYPR01MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f84fbc-c63b-492b-6c0b-08dd6ddf9488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L01JeGkrNTN3WDZTODFqYXJhbnNiOXdsWEgrT1NmK0cydDMwRWJkT0orTitM?=
 =?utf-8?B?eUtWZHFxeU9QWkp3Z3I0MGk5ODhKQkdzc3hyYkJ1THR3UVBxcm9mTlE3amJa?=
 =?utf-8?B?dGdCeUdZRDVKUUpxQTJvRldIRXpwWkxnUjBBNFZmNnlUQ2VxRFNrbHJTZnU4?=
 =?utf-8?B?SlNiY2tEbHZpelpTMHVnY09vL3pudWJKdVFXdk1ta1piL1NBUDRIbG1KbDVI?=
 =?utf-8?B?STZWQTcwUjkrSFJsR3MxRURMbkpPeTVBVGxIcTcyL2ZoMEtlMWZMS1lmOHVK?=
 =?utf-8?B?R0F0UFgyWkhCRkdLUDhzQ09uNUwwY0J1d2NkT28zT0xpaTNxRUY0UEU0RVM1?=
 =?utf-8?B?dDhseTF5aDZrb3FTUTVoLzhncHVzcGVTdDVvWnVaaEZkSzU2WGVPRDFDU2tV?=
 =?utf-8?B?aVNjUkIvMmdBUUNDU2VsNjNLSW9RcGtBSWRMNTFDc2RvcmcrOVlRcFVkZTZV?=
 =?utf-8?B?WWdmYk1nRGNMQlNvV0ZoNzR0Y1Y3ajN5KyttanBITUppRUsveHhETG1rbDIv?=
 =?utf-8?B?QVdRWVpDRlp1aDZVNDJZQnlrUTV1eWNkUTZTSDZtVU5WSjNDRzE0YUxLWkFq?=
 =?utf-8?B?L1d4TEpFSC9OckFGcDBMTTRqOEF0YkhqTk5sNWJCeWgzR2owU0lSSXZqeS82?=
 =?utf-8?B?SElNTDBkbFppVG1SMzFuK2IvUzRUbmpXTVBqUDJWRlcvN21PNTRkOWJac2NK?=
 =?utf-8?B?UC9PbTM5UlNTczhOSldYa0VFWnFYMVV3WHhnMy9XS0wreituVThHMVZ5aFUw?=
 =?utf-8?B?UWgxL1VMeWxSbnNXenpHVkFBVWlNQzlPcnlyS0lxQWZaUFhYU0R5WWZUY0k4?=
 =?utf-8?B?clViQUNjSWpQM2ttbEtOekdSVTJRS3JqVlNDUndIQzhzdisrejdWTUx0Rkcw?=
 =?utf-8?B?YlhoTjJoZFdpWVM3Ujc3QmJYeEZCSUJEc0M5dXdBU2MvdXViREpQZGZvNFps?=
 =?utf-8?B?dWpvbVVuSDlMaGMybkpZNGJBbzhWV2NZalFuZTJNMGw1TmNHMWV1SVpoaGVE?=
 =?utf-8?B?ZHZvMjFXTDJnRW1jbDFtckJwV2czMmVKTUxZN0tBUFk5SElEM2p6ZzI5dlI0?=
 =?utf-8?B?N2ZMY1JpZjBsVUF0VHE3dXptYmVDbjhucU5rY2tJanZxbjFCUjFybUYvMXdW?=
 =?utf-8?B?ZVRid2FuVmZaTzNUYkNSQlNkN2pFRWhQUmI5THNoaGExNE9rU2lsRlY2a2l2?=
 =?utf-8?B?b1k1SUpEbTJkZFF2NkNEMm9DblA1TUFLeEYyNUNac09rbmJsaVRpMDIyYk4w?=
 =?utf-8?B?ZTRJS2VwcHZ2dXhrS0lyRTZwNDhYckd6d0lVWHNpYnFrRCtGMjBaaWhvOFY0?=
 =?utf-8?B?dzh0QWs1K3BkdDRJNjVrQWo2aUR5dFQ3bFhGaEgzMjJxNS9kblNud0xWTmZy?=
 =?utf-8?B?cDV3OGNCTGVwRHJ5S0Q2cWNlRU5kUmszVmhMNjNaeVhpZE1vc0MrYUhXYnpV?=
 =?utf-8?B?dTNxV21RL2tjY25CWDhqMWdmVEc5NXhadmVlQlNmZ2pmSS9lT1JtM2U1Uzdp?=
 =?utf-8?B?Z3RSRWNEUlFPSWpjRVZQRjVXVERIMVdXTmdwVmdtTkdMTjlJMjQ0c0tRNnlr?=
 =?utf-8?B?RzhhWERvRmtqbXVlZXhKS0xleTRSUmFTRS9MSEd5WW5CN1BTVDI5bThwYVF4?=
 =?utf-8?B?azg5cXFuYy9BY2xyQ0VONEJXWUNCK3dTc2FvdVd6U1pyYVFzODlBbTdqVVUz?=
 =?utf-8?B?cnJsOVdBYkZlQWMxQldXWjVMZDRGajBBYUF5cWw4R3Q0bWdER0tkRDhFWHA3?=
 =?utf-8?B?SHlzN0xBTjVsZVBDcXNvTjZxY0pjSFdNNW9JS1lhTS9HWFpyeEhnYmNTeU53?=
 =?utf-8?B?R1VBNFcxb0ZSUHZzQ2I3ZGZVTi9XWkZERjlTTzdLb2ZzOXNwUmczRE92TnEy?=
 =?utf-8?Q?14kXXT05rf4P0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB4501.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0xDeUhRdzQ0T2NPSHRtd3I5a0RPbjMzUmFRQTJMd0c3VTZ2VnJFTjBHZ1Jv?=
 =?utf-8?B?eldYUnU4MnUxaEJrMjNuTk5ZVXNLWTRRK3N4eExnUHVNdXhSeDBrS3FYSDVI?=
 =?utf-8?B?ZVBOK3c5VElqTWpVWGdYYlZyeDdyaWxJdUlNU1ErY01rMXRReFkyVk82MWJy?=
 =?utf-8?B?QVg0V0ZZQk93aW4vMnBKeGNpY1Iyek4wK2NKRU1hSTQ3azYvamxrSWtrWU82?=
 =?utf-8?B?V01HUGhSNkZiUlZnV0NLclE5OWRDMDArb3hmZGgxdGpHbmVtRWpReThhOU1S?=
 =?utf-8?B?eG9GV2JlWHRsWWhRUVZiSUE2SXhoallDUnM0Tm9WY2Y0SVRrc0NwdnVXQ29u?=
 =?utf-8?B?NGhqT0gwMEcxcVJIU0xoYlBFL0wvdEVTQnVkUklxaElCN2Y4bGl2WkhDbVMv?=
 =?utf-8?B?L2h6cTViUEc5MzMzRUh3b1czRThQaS9sSlROdUgrbDRVMWp4bFNYUEFCM3Vt?=
 =?utf-8?B?NTFEQ3FaUHl4U1pOMWhoTWozSjdmT1I5T2o4YVhreTJnZ1l0UTFRbVFJT2ZU?=
 =?utf-8?B?RHNSdVdlVGhQVDVJU2cxMmpLaXAwbk03R3ZNbndCeWQ5eVJURDQxWWFBaWtH?=
 =?utf-8?B?L2dQYXE3ZktNQmJ4U0ZmTzNmYnE2cDJjdFV0ZVpCTXFrcWlnd3FmNDY5WFFn?=
 =?utf-8?B?UU9JRUVReFMzanV2YlNVcVdROGVOQU54QTNSRkhYdzJZNGt3VUFWbGo0N3pq?=
 =?utf-8?B?UnhraHlpQWhveEpuajNHKzNSS1BVSU5Xbi9GSTNrRTRrYnJid0FtTU0zUjRx?=
 =?utf-8?B?ZzYrbCtqQ09BWEVTOVFFWXpKRDRsaGdjUXNIVjF3OVJ5bjA3Y1VwSDdWYWor?=
 =?utf-8?B?bzJOa0I4SmYxcWJEWGsyNWMzclA5dXRoUkZHeGNZczNCOE5XWTRqSDBmR1Q1?=
 =?utf-8?B?MXRTZ1BWbVBleVRLdnpkY3o0eVhFRmhtL0hjaWMwQTFJVVBsV1cxRm5DMHV4?=
 =?utf-8?B?NTYrWEJjdmNSSFBYa1VVNERCdXVUTlZ1YTlIOXBUT2o5MUdrcjdIVy9nRDMv?=
 =?utf-8?B?YmFpUmtBK1pHSlRVc2VCOEhtVDJuZWw4VXlHZ1JKNEl5anlrNXNZWVlPVHhl?=
 =?utf-8?B?R3ZmUlc3RXJjN0tzcUcxWFNFS0RFN0pMaVlmRW5Oa3ZOZEg3SUN1TkZ0cURM?=
 =?utf-8?B?N0dXU3BNNkV2WElUbUJ0cnFUd05ZUktyRnBvYjdtVEpkdmhvU1FNNllnSVlB?=
 =?utf-8?B?cG11ODVvWGlodWpLZmwvbzdkYm1NRmt1RXVJOFNrdXlwU0VCOUtuWnRvQmw4?=
 =?utf-8?B?cVY2MVZZejlIWmJNekZrMXNwU3VKaUFvZHhzamRGMWg5OTBRVW0rb3d3eW0v?=
 =?utf-8?B?LyszcE9USVkwUyt5MXdjbjIvL1hYWE5MTlZvdGFDc1NtRnBOYVkvU3Y1S1cw?=
 =?utf-8?B?b3VmOXFncExJZ0cvNFVJVDBMbWpQYk01aVdWcDYwR3FFeW5PSlQzSDY4Mmll?=
 =?utf-8?B?bGw4bFlocWpiNXdjNit6cytTdWVPaElhb05hbXFGNStsL2kwN3NERzUzcmkw?=
 =?utf-8?B?bHN4eGl6TVFRSUN2UE9hYmNma3c3Y21mT3c5NzNneEdEeVVpVEgwQVhUOEFT?=
 =?utf-8?B?ZEdOMUl1TmloV2dsSXdLM3IyYjl2Zk1raS9mZGx4ZC8zMXNmRTNMaWNDOG9l?=
 =?utf-8?B?NC9SdmVGQzRNaXh1eVRNbk9YMGZBRnVvcTNjK2lsQWZ0MytwRC9yVUIxUXls?=
 =?utf-8?B?Y3hqRXVKY1NsaUtiaUo5OFRuSG1FMGpqRzd0MEdNQldRUzc2M2lvWWtrSmpD?=
 =?utf-8?B?OEpicFkyOVpiV2xScHAzQXNjUUtNRGR2YUJweGh5dEtlNGw3ZUNZYVljdEdZ?=
 =?utf-8?B?RnJLb1BYNDZLVTVpVU5qNnZibG9ORVJHSFNpS1dWa29qclZxWEtLcUdDNXJp?=
 =?utf-8?B?TGNBbUtiM1F5UUtFajFjRnROc1BSVTl4NDMzME1nK253My9JWXk0NDJoblIr?=
 =?utf-8?B?YitlQ1hZNE1LZnJGS2huMHhGdXpsdGhFaXc2QjdlVm9qYTMwTE5ZbjN1eTdT?=
 =?utf-8?B?UkNER0hHZWt2QVA5QjAybXRDdkVldEJnT0VEM204TEQ5YldTVHhwTDZ6UzFV?=
 =?utf-8?B?b3R5NzgyR2NUNkM0a3k2ajExS1FyN2ZJQzZHNGFqdHdwYnZPQWZ3RXM2ZTFN?=
 =?utf-8?Q?RMFUp31EIEFypOzZCjfvhARuO?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f84fbc-c63b-492b-6c0b-08dd6ddf9488
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB4501.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 10:01:59.6691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STWcamIRZFuie0R9ut4QKpifG3gFslFRDzpCwXOPGHsdTuFq5UAZ0KPskDLm+vRZK6pQhEYReg0bu2MEyVNU8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB8176
X-Proofpoint-GUID: _21Sbfo98H_fZG4eoUGvvYqDCHokqj0E
X-Proofpoint-ORIG-GUID: _21Sbfo98H_fZG4eoUGvvYqDCHokqj0E
X-Authority-Analysis: v=2.4 cv=JvjxrN4C c=1 sm=1 tr=0 ts=67e6739e cx=c_pps a=g6sBawl8R0naeIbhPH00Eg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=-5LYVjoNHPMA:10 a=gEfo2CItAAAA:8 a=SrsycIMJAAAA:8 a=VvJ-tOkakI1MohUfBUUA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

On 27/03/2025 11:27, Nikolaos Pasaloukos wrote:

> This is a custom silicon GPIO driver provided by VeriSilicon
> Microelectronics. It has 32 input/output ports which can be
> configured as edge or level triggered interrupts. It also provides
> a de-bounce feature.
> This controller is used on the Blaize BLZP1600 SoC.
>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>   .../bindings/gpio/blaize,blzp1600-gpio.yaml        | 77 ++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8b7842331a22b7b9fbfa42b9c711da99227de2e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/blaize,blzp1600-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Blaize BLZP1600 GPIO controller
> +
> +description:
> +  Blaize BLZP1600 GPIO controller is a design of VeriSilicon APB GPIO v0.2
> +  IP block. It has 32 ports each of which are intended to be represented
> +  as child noeds with the generic GPIO-controller properties as described

Typo here I assume, should be nodes ?

Also maybe better worded as:

Blaize BLZP1600 GPIO controller is an _implementation_ of the VeriSilicon APB GPIO v0.2 IP block

> +  in this binding's file.
> +
> +maintainers:
> +  - Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> +  - James Cowgill <james.cowgill@blaize.com>
> +  - Matt Redfearn <matt.redfearn@blaize.com>
> +  - Neil Jones <neil.jones@blaize.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - blaize,blzp1600-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  ngpios:
> +    default: 32
> +    minimum: 1
> +    maximum: 32
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +dependencies:
> +  interrupt-controller: [ interrupts ]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio: gpio@4c0000 {
> +      compatible = "blaize,blzp1600-gpio";
> +      reg = <0x004c0000 0x1000>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      ngpios = <32>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +...
>

