Return-Path: <linux-gpio+bounces-23101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CC8B00525
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7FD1C82083
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833D927602E;
	Thu, 10 Jul 2025 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uiatFHmI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87999275B0D;
	Thu, 10 Jul 2025 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157356; cv=fail; b=CUBY51Pra9QSySLf350CDLQrmEG+/hlEMFKbwcaXhRyRNMWz560mcqH+1e6Wt5AhjUplCVjI8ngwCCNLqnUd3xKNEbXZRsy04pTGGH0nZ/UcrvS28QnS5UitZ5Bm4rTkn2tcf5qshcol+/ZPSKuVLYPPwRnclYuA9oWkLNZmA1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157356; c=relaxed/simple;
	bh=Ah2Y6t4NMk8/h1J4kA+pAuYZwJwq4TlyKkt7dUGH+sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mOzhWasz2yv9YeHxTjJDGtjsux9SpeHgY4rIrGace9Gb5W8sPyS9z+RHyM0E4akNk4etaBdmV2s54ACOd2Td0CHElfPmNxCB2sMl3/5dAx4nLThrIBmngeZuL0le4mIPiEoWkMtdxmQgfChX7uSRFqnRhEhkxUfwSGmPtmwbJFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uiatFHmI; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJX2tzf+v3eOW+Hv6JjMg9kVK0sjehiX/Pu8pY2ubAI198+C2hFMIpDyHeRunPFEazMlM6r/CTNQTCcgNhl9r8pZVcWyBaCV+yZbI5oikLurDa0yT4bWiKJs8QchbmPz7RiIp6rL2vmwND/6tJc5qIJrXp/uy0S/DHlNLc0xb/tT8Ah1/2DCuf+w5mBHu6UdDwOXU/yHIkCDkS0VBrGYD+iSmOpqWoDoDFWBFePlIpCPnDKjSbiFrIxfpXURlW3kWyMhMyUKWluiGi4lDJWUXooGVCn668GqVFvYqa2Q2hE1hQAK3gyzMgF/akC0MUQxjdmnrmdeEzIKMTQ7t//PHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCNbkghpuCQ0D7jMH9t0REYEu2GUSUva+y5P3Feb2ms=;
 b=AyjkrsRJ/Hm3fcZLyH3UNaExhVMc37VOfbYabc+NWrcy3etvsSs0FEu0dcwtzYsYJlsiHn4UxSq6ghwaaU832f9vPw/sFvyZsFPeZN+pe9kREIlhDLtfjPDOHpl7HaYnj1c44n39wWX917LdjEZ1aB7myTXXeAdbaEh3jWAWDxoA9jFglMCPa3NW5sHvWfWINwMlmUKXIx6R+omGXCL2QHNmqxcEKKH9IEYvc47nxHl29UPUlXS11iLMduOWQFplYgqYbknJ7N6/0VYFQbqq9B/qQ/dQToOfb7h6Eq6SPwiQ+h5ufxi7IY6ykN6MkZbxEEVTu0uOd+WeJjmVNrqGHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCNbkghpuCQ0D7jMH9t0REYEu2GUSUva+y5P3Feb2ms=;
 b=uiatFHmIlEHKT5LadVRyYIJiz5spO6YIgs9Z24tHOOKQP1kNFa+wvQBhakEI8+DhEiLpmZ9HY9LcOW62PrW3at2ZfVTWdhjqfwoWWOaM4Z6RNtp2XBO+ks7j0fuI58JTNtyRgFkdAK0C+bmw1r+f03zu4SuUV9Q7pOslfSXl+cmTPb20f/E2SILjI18ym2QqKHCQJjM1Tz916bf0jJYMgyTHvqQzAWnaV6hZBXMtCgUvfoy6RVoFFhcyJDKddkdLQbedlxfGFkT0ZXa1U5gpllPgn4NPf8Yb2BRmMXex7SHZmGSWry0NFHUa3hbFkTodGbKZGXwno+nq+ZX5PACgKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 14:22:29 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:29 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 12/12] pinctrl: s32cc: set num_custom_params to 0
Date: Thu, 10 Jul 2025 17:20:35 +0300
Message-ID: <20250710142038.1986052-13-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: b16bda26-3452-4599-d545-08ddbfbd33b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3hkazNWcnZCRTM0MXd5amdJaHM1UG9yVVN2bnFSQWdFQVRRUk9hNGFDOXNJ?=
 =?utf-8?B?ais1NnlBdmhNaCtDdGpvRFAzOWx5SndsbHlBUDFlZEM3L3dWcjJJMlk1QUdn?=
 =?utf-8?B?NkFTSG1tVW5NYXdXT2JZVURaZmoxQ1hka1lrNWdBYitlTkN6bUtwZkRxbVQx?=
 =?utf-8?B?ZGZzOXIwT0lpRVZsTXh2Zmx0OUFSUm93ZmlHSTNlY2xlN1JJWlJQbDJYQTZI?=
 =?utf-8?B?Qm1NS0x2cGIxR1owWTRFSVZLajhqb3kwR3MxTE8yWXVHV2d1N1lMYjRwZUJY?=
 =?utf-8?B?RkVDSlZ5Z3JHY2ZQQ0p1NWpoc0o0V3l6ZU1Rekpqa0xhV3ExYjN2VWRmMExT?=
 =?utf-8?B?Kzl4ajBHVHE2aFpyRkU2UUVKSnBkT0NJWmlKQURsZ0MrRzlWL0hOWi8rVmdQ?=
 =?utf-8?B?eUEwM3hkNDl2eS9GNU9XVHhFSSsxdnUwTWpZOEFoOGhiSGgvQytLWkxTYUlW?=
 =?utf-8?B?Z2dpUXdpNUwxaTZZVEVZOGxyU2NUNDk2Y1NsSmtJbWNPYldheGZkYnd4T1pF?=
 =?utf-8?B?QTFhL2I1cG5ETmxZaDhpRHcrZlZSY3BNM2k2NnFzem1uL0RBZ2ZnOXNzb01N?=
 =?utf-8?B?dlpMRG9HNFpyOEhFOHlXRDlOSTEwY2pjbFVFVlZvV0pqSzN1TzZnenJ2a0lB?=
 =?utf-8?B?cExZUjYvaWF0cXduajFBVGFxZ2ZiZHo2S0VJdjVibDlad2JPUXRlT3ZKdGZj?=
 =?utf-8?B?b2I3MmtHVmdROU4xV05ockRGdk9PRFErMlJyYklSS1dScXJyRXpITDkxOGRs?=
 =?utf-8?B?cEFuZ2prT3pzNXBzdXQzWExNTElIZk9taDhwRXEydlB0VXY0Wjhta0xEdnBi?=
 =?utf-8?B?alNuaFJQQW5Tei9UU1Bsd3A4RjNCMTRtSi9QTVJwOS8rREo4clFXLzN0Mzhz?=
 =?utf-8?B?SGt5R0ovb1NVUnduWTJoRWJpRDRFRFJPTS8zTjJRYXVhcVpPZkY5UG5zTnpQ?=
 =?utf-8?B?WlVBbU1yRWJPSWw0VDQ3M3liaHdRTnZGUjZyYmpnTDRuMlkrSHY4YlcyWVVL?=
 =?utf-8?B?RmxOS2J2SnFqS1pwZ3E4ZTZmeTFyQ29UZWtOV21XNytMakFtVDdZckFIUkgw?=
 =?utf-8?B?Y0R6bU9rbEZYeE5qd0hYTEpGNFE5Z2hWMHpDM2N2ODV5NStsZWhyNGVSU3da?=
 =?utf-8?B?MW55N29uK1dXRkNyRzNEL005YkRRZlNsbXk3K2Rwd2Y2UEtIUFBiSXl6MVhw?=
 =?utf-8?B?cFUxWHVnTGlDb2tEUG5iaWZoZGg4YzFGT25DaFNvTHExZXhTcTRSLzVwMERl?=
 =?utf-8?B?N2lzQ05DUlloTXo5T0NGTmNBZWtGc1NrV0RiQm5Gei91R1VvQ3VaTVRhMHRC?=
 =?utf-8?B?QTh3QzBVRkRySkRiSnB5Y2lycTFCZmVwL2FjL0dMNUdLMDBlQ0ltVThFNGhz?=
 =?utf-8?B?MVVDVTdlMkNIeS9icjFidTB3M2Vwa0FzMnprVU1GZmdpM0VMVXk4STlETXBq?=
 =?utf-8?B?TDhOVnh2NlNKSnd0Y3V5bXMwTFpEb1JWejg2blhuVzJSMjc0Y0F4bWZLZmV6?=
 =?utf-8?B?ajNoL2o3N0c2QnBCSUt0Zy9UNnVkMDFrdktydDU0UGdIWlRSUEJZSXFXVWdX?=
 =?utf-8?B?bER1d1Fqd0VQTjUrS1NKL3RDelg2MU5EVFJsaVRWUjJ5M04ybEN3UTQ4L2dV?=
 =?utf-8?B?dmxlWURzN1J6QVVEL2lYZ2JTUjVTdTFINzB3R3BIWSt3b3pqK2VNNGxydElv?=
 =?utf-8?B?eVlST2RGamdkWVp4YjhITG9XZThOZVgxYS9lNGw4bmxzczd1aWxMMkdERUlw?=
 =?utf-8?B?bTZVbVNLMmhwT1BNa1U2cmUyS0hHWmtxQ3N6OHFpQXJGRjVHNFpTNG9RcjZP?=
 =?utf-8?B?M3FIZVRVR1VvQitlYUFIaHdSU25ESXpjT1lJM0IvRTFYUE40cUJYUXVXR1kz?=
 =?utf-8?B?dXRIUlllYmJJc3JFNHhWdVFwREdzZ3Y1ZVhFR09UTWhZUmZHc0xRVHhrUGFi?=
 =?utf-8?B?TWdQQlVwZ2dYWlZqMjIrcmhWci9rd21na1dXM3gzOHp2YitUc3YxbmNnZVMw?=
 =?utf-8?Q?77BnaBlO8zUdI0+f0w6d3m34k479lg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0dVbVZuMW5QTUYrbVNIcmdSbzZmSElDVlc1aEtmL2lSUEpPNUg2bjRZbVda?=
 =?utf-8?B?YnZlS0YvVklJNE0vUUlOQ0R3N1loa1NGY0FWYUwzSTVOYVdxcGF0dzZGWVND?=
 =?utf-8?B?cUVic0pQWGEwWk5IQlNQYnp2dmVCY1pFSm9YREJlQzJ4VDBkMU4xVmVrYi93?=
 =?utf-8?B?b1hBYUVPeXdOcC9XL08wNVhCcm5xTFRpbkxHMXVmOWltQjQ3VUg5aHFtdGdB?=
 =?utf-8?B?ZWxCSlJEdWFsRmFqK3M3eWNqQ0UyWXNGZjd2TEpOMFpkbVZETXQrT0x5RmZa?=
 =?utf-8?B?WkxFSFdPUjhiNUxTVE1ya0lQak1SZ3dwWEZ4bGtwc01Ycm1Jay8vT3FPVmIw?=
 =?utf-8?B?ZktON2huVHZtamREbENOK3FJL0Zkaks2d2RMMVJxc0pzbU96ZGY3S1lENFBJ?=
 =?utf-8?B?UmxqVGVmdFpaV2dob0tsS1htY0RVNVljN2VpUGNFNEFDTmhRZ0hMTE9DNjFq?=
 =?utf-8?B?OGpWWEFTd1ZvTktvTExhUHRXQzlXZWw3THlHbThPSWcxTVBFSzE5c3ZYdFIy?=
 =?utf-8?B?akJXQ0VYTUlqZkd2TnpMR2x1dUpBR0IvYnlPdmFJa2JTWnZFcWFiejJUWkFD?=
 =?utf-8?B?OVlRNGJ0cFFDZHl3K3V5YnpYa1plOFRVOUU5RzNHK0hHMUdiQ3BGK0EzQnZo?=
 =?utf-8?B?NU90bHlIVHppek9ZZkRLeFFoZHFnbUhsaW1sVUdNWFVFeHhldWRzSDhuYWRk?=
 =?utf-8?B?OFpIYmlKdGN2VnRvL3Bkc2dRZU1JMU1OMlM3MTg3aEJpSmY0eFJrNXlacjVD?=
 =?utf-8?B?cjRJZ1pQRy9pcW43blBVQk1JQkdiYXkyenRUWnpHL0JwRFNndjlZNXFFQkZk?=
 =?utf-8?B?V3RhR2Q4V2ptWVJib0FxZnpYanJWbUVlVVZEWWlSdThtUE03UjV1VWNQY3hp?=
 =?utf-8?B?NXREbURYTWppMVdYUXBvTFNpaERsZjJCVHRoVUljVlVGSDljR1Z1cVczZWpV?=
 =?utf-8?B?eXZkLzJCUEZETkQ2Y0xaQjRlUDJPUnFIS3JpTGs4NmZ0VE5ZWW8vd0pZa3pl?=
 =?utf-8?B?V2gxYkJMaFFMbnlrT2h6bUgyQjJQNmNoanp3OVdkSWhKd1pNcEpaamE4VkZY?=
 =?utf-8?B?ZmVHN0V0MHhJUG5ZVzVwOHE4Yi9Vc2pkZWdWNnJPSy9VZDZiV3R0dmswVTlw?=
 =?utf-8?B?N0p2M0hTcXltbnZDNlNTOVplb045b3hIWlJ3ZnpweE80cnlYWnY1MDVDSFQr?=
 =?utf-8?B?MXplMHh4emZVbllobkduMWlmV0l2RlZkZGRubDcvT09IYmE3dWNyU3pyVVBB?=
 =?utf-8?B?QVhqNWlqczdsQXI2T3htZ21lM0tURWtKOFZrY3JzalhSeXJZKzFTRWszVkVW?=
 =?utf-8?B?ZjJiYXpSMjZibVAybE1oS09UNSs0UEdJK1NEbXZYek5sTkpYS0JyNUYzQjdv?=
 =?utf-8?B?cGFiZkdMWlE1THFNODdWY04vMHU0UmJvRFlpMlcySHZUU1Z2YnpYKytxblo2?=
 =?utf-8?B?eTFxamREQU9MUXBMcitncmRCbmNrKzVsenY3Z1gxaVlkUHF2U1B6VjhGT1Yz?=
 =?utf-8?B?d3NkbVVjK1pMMzdOZ3lGM2ZnVXpudnl0U1VuMnQvNi90NWdWdmlCVkxzcW1Z?=
 =?utf-8?B?bUtZaWNZaW40ZCtTb0pQai9sSHFHaWM3MjlueGczbmphNFZIQWo1UEhaODBW?=
 =?utf-8?B?S2hQWW9PS3JTeUJZUWpZaTh5UGdHT3lEakFCdU9hWUVJN0ZpNENxZ09kWEtK?=
 =?utf-8?B?bFkwZm4yRWFGSHhYYUw0YXdpN2pTOUVmLzN3YlBYS1JiOE82MnBtMmZPOWc2?=
 =?utf-8?B?eW5FZ1hnMVN6NnRLQTdSbUdPMGJDTlA5cVBQVlNheUhKM0VBc0YxdUNENGYz?=
 =?utf-8?B?Y1gwalQzMUZzS2gvUWlSUTZaY3NzTTE4NDN3SHQ1VTAyTWhmZVM3bnRyRE9F?=
 =?utf-8?B?VzNpb2VNUkhuWmxrUXZvbXlpa3FxRlJUT3FRWEVnc3VlVHhQSG5IVFdEZDAx?=
 =?utf-8?B?T1RMWlhacEtaK0hNVFh6UUNIUG1kcWxPUDhETDJoTlIvaGEyWXkrcmliQTZF?=
 =?utf-8?B?bTVqMXh5akhjMGFZMjFJcU9ZYWR1WW1kdTRkVC85ZE0rc3VDQjhob1NlbnE0?=
 =?utf-8?B?Y3hpa210eWwzcG9PUDBxcjZrYmdvK3ZTUWNFVTh3MW5QZzNwNmVldFZxNVBj?=
 =?utf-8?B?KytXTWx4WXlrNitYS0VoK2lPaStlM2IvTFdSS0VHZFNhZWhmTWNZYnkxRkFj?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16bda26-3452-4599-d545-08ddbfbd33b0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:29.5757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtJ2hId5LM9BJz7kQOs5qo9RMYro15KWAjmFhYT6/XFPBmIfQBCtNATQs9JQUZFkUw1h2OIdmsGR18S+AzbtuzKU3r8oRSWnvWPM5tt+H+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

The `num_custom_params` was not set to 0 and the pinctrl_desc structure
was not initialized with 0. This would result in errors when parsing
pinconf properties from the device tree.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 8e9da792d035..097f74904c34 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -1273,6 +1273,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->pctlops = &s32_pctrl_ops;
 	s32_pinctrl_desc->pmxops = &s32_pmx_ops;
 	s32_pinctrl_desc->confops = &s32_pinconf_ops;
+	s32_pinctrl_desc->num_custom_params = 0;
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
 	ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
-- 
2.45.2


