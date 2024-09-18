Return-Path: <linux-gpio+bounces-10236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7E97B8DD
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 09:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBD5F284D3B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 07:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA3C17625F;
	Wed, 18 Sep 2024 07:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x1NEBOUi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013000.outbound.protection.outlook.com [52.101.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF817333D;
	Wed, 18 Sep 2024 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726646271; cv=fail; b=fBggAEViaPCiVctm+QF+dLzf/VSQXRPWSCbyvwYtROUZyAEYS7FzzyL4KO9gsArM03HXGmPRNrmqYQIcGbQO1gNe2Bot3ez3YidwYRHX6WbJpF6d/rSUiYMBuc6Zt/5EKveck0U3bDgH2p6IXQoFB+G7B7ywCKHNEDmSsw2OI4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726646271; c=relaxed/simple;
	bh=dDIpRxITC5rsLkLGbElH4HUPgRXs47TXFC0Kh33C+wE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B2AWd+oGIAtGoDUi8neCaBx1BVPD5YaFCfhN2t2xrpIa4djgANEc8RiWyt7scJwldcnK/27bnHFtWwfn+kNnrisAbLtzoBbOIk1xy9QpIBmJ/thPwnW6YJJS7Uweck8bV5djn1bcvl9O9Py2emPS529YMOZ/wly348bYWgdMEg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x1NEBOUi; arc=fail smtp.client-ip=52.101.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOCTcg71CRZf4d4j96DQXC/La0f7ronfuLT1A5U9BcIIwq3gla02fhEFIfixORIoRXen6WPMCjfLZ+xIurlLUeoXMpZjlp+Z823Ce0FM2CmLDXcIiWHqKvQsmdHOcfRyjG3xzI5Byxe9TsXyOm7N3OjhCweVdxvXRY5Pu4yHc3NM865/Y6TdznN2AYfj4p8dJd0Z+vwJr/auoDNY+Kws0BufM2+qmWK7cnhH664UcZ8iBE6oFN/tioNMxzrD9+jHNt9r0drAW/XHfg+Q0VBEZniRCPhbOqgXN7zbhBx3yL9smD3NK6S55abApPhcfqHKw+d0v9/+rPBrIKqHQQvgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIF/CFTubDdCOYAJuYpBINCOtdVFlO5wKYrcmOrXUME=;
 b=ou3o2rJ3fMsJXS/fh/X+k3SuaD6h6+BkvYUOCcOm49plzoZ3I6Ex2g9PkgrI6yxRlskjrxcLYXYwsgDsl0rLvKgVtCt86XrUUc+eAecFcCeyj94yJwFOhHbjO34plGQr+LNFfALDRbhsSpDRz+hUbsO1bLxD+6YKemrmw/nE6JXTIBWPW2Y069LZtPunvA/V1mzILvfLcRzRx4St7V+7v/rfgZsg+QJXkGnXaSrMH20Bnj8pE+nq8vPkvtnSSQzP3fNILAFTnwxcCuRzt+VrQt0ik7/TT/ybgXe/ri89dSss9i+G/mydR7HDqtDJo4HHjGR6j6NNfCek7wAZWupSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIF/CFTubDdCOYAJuYpBINCOtdVFlO5wKYrcmOrXUME=;
 b=x1NEBOUiFOkDYMHZ1befIDYtGqnjbwTr/lINiB27j6rzYNTZMIz96iZteUkQnM4cckGodpgDcC7lhs58QG9rpF7liEpWNyDgtb9S4zoGcB6ViBnYbQcCic4DR5TRFOkaU5CtmZ4gHP7z11I1kBtVPiSNwOGjmgTzQGKDxYo20IxWlbCJV4cRhN5RnEyNZMyg3zVQ/fRwo8acR5b98gvYqPGdajjwuQQwkuegLiomdTwFexg1bUWl7zs8vrKG98JR53e56xPNgCr4uQ1Y0d4JGTN85hS+c01upuprIR2GbwAbm+ityFDU1YqAfoeGB8bS9dDHlZmn2TixwwAU+Pytnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10631.eurprd04.prod.outlook.com (2603:10a6:150:202::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 07:57:43 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 07:57:43 +0000
Message-ID: <53bae020-3d82-4966-8a51-2b3853d07eb8@oss.nxp.com>
Date: Wed, 18 Sep 2024 10:57:37 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-5-andrei.stefanescu@oss.nxp.com>
 <bd886183-273d-472b-a96f-3fed1dd493c1@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <bd886183-273d-472b-a96f-3fed1dd493c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:802:2::35) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB10631:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd9c858-cb28-4db3-56e5-08dcd7b7927a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTRoY3NTaUtVOE4xOUN5T2p2SlFDOHd5bzhBODI2c1NqQW5hM0RmaHpCcTVW?=
 =?utf-8?B?R0t2ZUxQaHY3bnJYSFUrSXFhKzRjWmQ5d0xtWHpNczV4SGZjMVNLRUtqUm1T?=
 =?utf-8?B?Rjd6SHUvUzNQVEd3YkwvZWtnQzA0ZWJhYUNLQ2EzajNreVhhUktWemN4aGZo?=
 =?utf-8?B?OXJVNy9vbjd5eVplLzMzeGNIRUZWNGo5WEVGT1ZXcW9PQlJXbDNsazFaZnVV?=
 =?utf-8?B?NUJHM0plcHpvLzRJNXJWNjd4RHNOU3JEZGpLMTlpZEgxSnRzY2FBd1E1clFm?=
 =?utf-8?B?Uy8wVExHQitrczNGdHhxMTNvTVBqZkYwZkxZUFFVcGRsVUVKMnZMa1Zyamt1?=
 =?utf-8?B?cG5jTzA4eEV3cnVxOElCRmZJSnEzbFJ0ZUw4MGZ6enU5NityNXB1ODdVbUlq?=
 =?utf-8?B?MmtMWWduU21qQmt2TGRPb0UraFAvbUhSOGNsMXA0bk91dUJ3ODRYeDZ3a3ZB?=
 =?utf-8?B?Y3d4ak1kdU1qN0dMYTRMc29wZ2lwUkt4RWNyRFdSWUEvN2NIMmpEek5iTFpY?=
 =?utf-8?B?a2xVT2dIN05jMHluMnlXaFk5dEF2TzNZQTdnREtKeVBpcExJTmFtTVJYeGhp?=
 =?utf-8?B?dm5ZU1ZxUkdveGkrODM4TnRtbk0xcVVsTzNseFlrd01XaTJneThEMmtqQVpt?=
 =?utf-8?B?cG16MWt6SFZmU2VRVEdqSWI5cU5naWJDdTBBV2VVN0s5T3MxeVFld1ZxNGNr?=
 =?utf-8?B?azJpRGZ1eWhWc2ZBZ0IyZWJIeHpIRWdCQzFkcmlNaElJb0xlb0FJdXBwY2lE?=
 =?utf-8?B?cGtqMUNNb1FPc2EyVjV3NkE5T0dyVlhmZ09zNXk2WEFQMHJjRlZEOXJPcHpP?=
 =?utf-8?B?OWpZcVF6U0xkbXhPYysvSW1RL21VWVBqaVpZbjRYbnhPN09EVDJEY2RZU2l2?=
 =?utf-8?B?UGtBeUJpV1UwUWhXcTY4WEtTZ281QWtnaTdvZFAweHdlUitjQ2RpRHpUMVpJ?=
 =?utf-8?B?ZW04dVUrTG1wRnJWeURQcWNrRTlScFBSbzhBTVJhN1pvSkdKbzYyako0Nmxp?=
 =?utf-8?B?Y2Q2dTF1ZkY4ZG1xRmRJNUZPUFVOWXVQVU1udmk2SVZIQnN5TFJZTHREZmlT?=
 =?utf-8?B?bm1PbkdFVjhBb2diR0FFUndHQW5qRTJZNkpSUzg3T2IrNkVua1hVNjh0dGFn?=
 =?utf-8?B?d1hnMGZwQi9DMEV1emhPS0tnK0Zyb2xnMFdxTDR2SDRoUWFKYlhxMytnRVNa?=
 =?utf-8?B?c2FzYW1NTVRUYUpDc1l6dzFXRkJ2VFlmWktaWlptVXRMaDE3bUNRZE9LL0tS?=
 =?utf-8?B?L1pxY3daNWZBTm1DU0dORFZJREQyRnlZeTFyL3AvMkpnbjloN05IdFIwYkZU?=
 =?utf-8?B?QkFhQmxrb3Rnd2FDdncxMUQrL25IUE1GVWZvc3VOUS9CWXhuTWYwMGR5YWZO?=
 =?utf-8?B?UDBmYnNxZlYrd1Y4a3FPa1hnbDQrOTh1dDNFbUZhVUhHbG1DVWRFWnQzUDk1?=
 =?utf-8?B?QTVQR3B1ODZnaXpvRHBaMXU5cXhSRUkyc0FOSDlaRm1aQXRlNzUzeTU3bUFJ?=
 =?utf-8?B?MGpBdVpMR2R1NkkwMTFQcXpIcjNlcjNFcEQ2VFQyeVpXQU9DZ1VWS1Eya0FV?=
 =?utf-8?B?ZFphVS9lZmYreGtGNEdiYU5TNjlxOElJN3kzT0lWS3V5RFZVMXN5dy9haFk4?=
 =?utf-8?B?Yzlwb043U0ZGWXVxNWhkZkpNRzNjM3ZoZXZnT2RvWlgvSGVwYzB5SjJIQnR5?=
 =?utf-8?B?TjJrYUdyZ0F0NW9DT1BZYk9lNk8xSUxaMkoxLzUwTS9KRXFjbW1rRm9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME1hM2JVNFF2VDkzMkdZeWRsQ3lXRWZXY3lrWnJ0VmNjT040QjZrdC9yMEJS?=
 =?utf-8?B?bUF4RmZuUFZFanhjbCtKL1o2allYUm9KU3pUMjlMOTB2ZDdRdTVmYUNPVm44?=
 =?utf-8?B?T1hBWlpWMlE0Q1JJMW1uc3Q3QVcxMEM2ZGYwZm16bExmOXV2L0dPSk1mY3dY?=
 =?utf-8?B?R04rVkhsWEx1ck9EYmsyQVBURDlRcVY3RWRJNXZ4c2RxZEU3Rkxqa2x1c0xC?=
 =?utf-8?B?L3FvNUt5encwSHF2eDNCYy9nYU9zcjBqZ1lOQnRLV3R1ZUdLTXhOQlMycDgw?=
 =?utf-8?B?cjNmNDNGMEd4dkdKdDZwU2o2aHdMRVNua2QwNi8xS0JTY3ZKbTdXRTg3K3Qy?=
 =?utf-8?B?dVlQSkF2L2NkK01NbmU3TFg5MG1HNWtyV2UzdDNtTXVMaHQxbXpNVWEwcVBr?=
 =?utf-8?B?YWJGTmxzWFQ2dUJ4Z1dlWWZGU1dUQlE5cjZkQkJLdWVFL012ajltYlhwYU9l?=
 =?utf-8?B?UjhZOGN3N1dKMXdRUWZlM243czdiZzJBQ1lsRnZaK3BSbzNwaXROak5vL2Fh?=
 =?utf-8?B?S0F4ODdrTGIwSDkvelo5V2svTEJmZjJwZ1MvbUFNTC93OW1qT1dFU2FSb3h5?=
 =?utf-8?B?NWQ0dFBSdHBOenF0R3ErWGdKalpQLzJBSVBseEc0Mm5icEp1UURwU1E5aHQx?=
 =?utf-8?B?dEhsNXRURWFmU1M5aUQ1bnJzOW9WMGxFRWsyTEpQKzBwaVNDNFJIVjk2WUZl?=
 =?utf-8?B?U2lYUGV3c3VLMjlMRERIUnRvc1RMckw4d3RLNC9xeWV3WndwZXBUQ0syZXls?=
 =?utf-8?B?NkhsUlVZSyt5bDJiLzJxQjIvd1dQZW9xQ0I3Smt0L1ptbStpZnlzWWlDR1hJ?=
 =?utf-8?B?ZnBMNFoxNjVvbEVMRkR2NzUyWVJTY1pZajREK25hbjlYRExrWVJsdGV0aTdC?=
 =?utf-8?B?RUpQU0F1SHo2OFpZalA1dDNKM0xaVW9iSWtwTlUzL3NrM3ZlRGFlU2FRN0R2?=
 =?utf-8?B?SnNrS2NwZ3FmOG83UGYrcHRCZmVtWW0xcnp0OUw4WHl0YnNHVlpGYXVCMkx1?=
 =?utf-8?B?RC81ZzlvNlcvTWJoemJoTys2ZkF6NDh3ZW9IZ0R3MWFOZHhKL0IvSnp2d09U?=
 =?utf-8?B?UUtOZ09lelBaeXcxSmN3cktRenlCbGxXZE5ldWVhNlJwcUZSNjBRQjliSU9W?=
 =?utf-8?B?T0N3eDlpSzQrRUJBRElGSk5KK05HMjNCSDQzK3RrWncyNVJqWFVKUXJLSmts?=
 =?utf-8?B?SCs0dzlWS2o2NnpuMUNvdkltVUtHVmNXV2VZZTdXeEhnYkhwSGh0dEpac3Mz?=
 =?utf-8?B?Z2xJRWE5Mk93bXhVWldQb2VjVUk5d2NzOVhlbllrSFpxQXZHYUh2OEtUejBH?=
 =?utf-8?B?cjlnL2pVWFFtaDN1OG53QVRxKzJaOVFpdjdyYWhmMlliZDdyR1JOZG5qR0Qy?=
 =?utf-8?B?clpxc0U0Si80bUE1bjRBZDhtRTQxV080c1lraTU0THVQWHdaOStScFM0TWNy?=
 =?utf-8?B?UlBqOWF4VlN2TzNRTUVobVNONGlXbXU0ZWFGTFY2cEorbnM2M3lFWDliK3lz?=
 =?utf-8?B?ZFlINGFZS2NZWUtiN1IrN1lwS3A0OXY4ZnI3d3BzSGNGbmhhelAxNFROL1gv?=
 =?utf-8?B?Qm1xYkpNdEMraGtrVHhCeDlDdlFybEZKL0t1UklHY29nMGdvUkhOKzFTM2JH?=
 =?utf-8?B?SEExL0RYbVFuNE9LN0VwWjUvRkUrVEZVdVZncU4zUEw1MW9GbGd4TDk0RmdX?=
 =?utf-8?B?S1NNZVJNODZvSnVmdVR4d2VmdmZmTUMzQ282dG1abEJROGlCQW5NZFB5TWE0?=
 =?utf-8?B?QWt3Uy85UTVWTitVRmUyL3MwQTJ1TkNGRlpCZGRsM0NWeTBObVdoaXkrbjln?=
 =?utf-8?B?SHRSc2daUW1HTjNrenJpa2IvZXVwSXlza0hiMTBiMGZBa1U5MzNCSDg3OE9Z?=
 =?utf-8?B?UHg0bUJycjJDZDVqeUVuNkM5ekx0UWs5K1Z5cHFxRHVhSENNdXZOUzh3MUsv?=
 =?utf-8?B?Mys5TmVEQ2dKdEVXa0ZKdTRmMXo5NTdjK0VNeFZBSm5iZGlWaW54Uk11bTd6?=
 =?utf-8?B?RU1xNEZ5OWhST09Mck8vNzNKcW01QVZ5Mi9pZTMwSDlMRnIvL3RISXlEQXJa?=
 =?utf-8?B?UWpZNVhkL2hxalRCQ1JOd3V6czE0VXczZTlYZm5NTmZLYXNiREJudFZNNGR3?=
 =?utf-8?B?TnFYOExuK2NkTGV5UlRVVXpnc3JIZWRkNFZkR3paWHQycHN6MEdDcUxqenU4?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd9c858-cb28-4db3-56e5-08dcd7b7927a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 07:57:43.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuaf0M2uPmczcWkxdpF2IHvDeJiGh3dNAyRTjyKfKVyW6LOiPhTqM96yKYkXNjkxKkEFifeBTxK4gMmuRyt2ngx5lSoBIHQ9K89uUYsCZAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10631

Hi Krzysztof,

On 17/09/2024 20:44, Krzysztof Kozlowski wrote:
> On 13/09/2024 10:29, Andrei Stefanescu wrote:
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10430778c998..e23c4369b6e1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2689,10 +2689,12 @@ ARM/NXP S32G ARCHITECTURE
>>  R:	Chester Lin <chester62515@gmail.com>
>>  R:	Matthias Brugger <mbrugger@suse.com>
>>  R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> +R: 	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> That's another patch where NXP adds silently themself as platform
> maintainer without explanation. Although here at least existing
> maintainers are Cced.
> 
> This looks like some pattern, so maybe clarifications are needed.
> 
> You wanted to be maintainer of this driver alone, right? So separate entry.

I would actually want to become a maintainer for the platform. I have
already added changes to the pinctrl driver and the s32g2.dtsi/s32g3.dtsi files.
I intend to submit more patches to these files and I would like to review
changes to them.

However, if you or any of the existing maintainers consider that I should
only add myself as a maintainer for the SIUL2 GPIO driver, I can fix this in v3.

> 
> Best regards,
> Krzysztof
> 

Best regards,
Andrei

