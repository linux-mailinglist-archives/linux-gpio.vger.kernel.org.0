Return-Path: <linux-gpio+bounces-13314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3313F9DA57C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 11:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C79CB165A47
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40F8194ACF;
	Wed, 27 Nov 2024 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="NVJmllR9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34C194A7C;
	Wed, 27 Nov 2024 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702427; cv=fail; b=PE/XbzA+Ik4QSjLW5XYaIhTM9PwzCyHYPjyUb3Dr0jCP75sdTntaKkKSuQT4IDpTUVDXahqvpdIcvf4iqhtktl4QmUKKTnAjPA2ycxb+CxAAEpuzslu/7WDYSAKkEFRxnUt2/XM/WmHBtq6QPvWJliVSW7F0MMtDjbw/kH6qI3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702427; c=relaxed/simple;
	bh=Aa/03jRNwsKBieUNslFd0sIPFMzBSiKzg+Hvo1xLj58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=n4pJdicdYHFD9gBk1oQf4LQJg8lTn4qfhFnFsQWod0YvD0kLBOJ1DkwQdZdYv2yRx1fmtnNZ9vbMdk20zL7w0YyPa2KcF4w7uqt1W0P23Bp0lKBeHU3uHZhYUj0s3576Dqn3jvQgrt/XpfPR+ZAwRl9ovyfdKvBXLGaeSCI0x+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk; spf=pass smtp.mailfrom=prevas.dk; dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b=NVJmllR9; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prevas.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bt8Z6aMvWiSSJ35NDAy5NxrTBTHSpz8KiR/PMB+1OVtZx9aIm9pMnnXRF0zgUlFtcJrLQIy9PMYqgaaHW7kv0DtbEQfpnePAhND/5OwVbu8CvDGFO7Mge9MBAtcrPIwbAkUv9bcxm5Uj94sVYeTaRJ99UpOGCdWdqQVGQNuUIvE0ERoNeQSUbxrLPk4PRerWc5aKTc26djgLJB7SQg3O9lwsuzZWfskpNQ56oJBw4xmbVaNaWCYC6INsaAathAayHo5HCAWRu3NEtpXD2kxk5J0rPWohgqDAHsmosREuwc4mvqxgANvBohoCHeurSPLjX+DCcIvqiva1rxZ4KK5wMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tztDcfR8B0ZNDexCzyn44eXMbu9970EM8oIFTUtMOAI=;
 b=ZW2RMaMpzdgo/Ec0jEJBX+SzNX/XEKJOfW3KonPfo1S1nqIa9+fVn+kuiie1HufQ9m7T/SZjui5UxgHyfGYKuYR0+Z4lo+03relX+mGRW8DFn/8E4uu3EOR8yrY9aocY2IGayeQ0blJU/l+ZeqSAMwaNuuWShiM6/vRgeYSVSZnGdrL1quis2ii0qxNwqHjdzskB2Uo6i5ukR9d31Tmq7tAjYkQjsWK7zWLQVkUo/He10veom/qZAhuJs28d/oaGHMd4apEnBCM+eeEqHC9ge4cCA/w4nLLUcTfxlrXrGxaVjwtr4HZJINns9FG9bfQjXlt0EzMUAs1mhMnNU/9IUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tztDcfR8B0ZNDexCzyn44eXMbu9970EM8oIFTUtMOAI=;
 b=NVJmllR975eHnUz9eeBX/JiBzo1xunuYtNMByme+aLcBcrnlxVGj75FydwMQRVw0ZhH8jsEvxKUF5uGbYvHpjrP10eHvRztd+0n1vL5LoVTh7t3wF5JnXHJWp0SjRMkYCrzjnPLGmLBF2PtIgkzgWBjF0xg/lvpb2PcNakB0u2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by PA2PR10MB8772.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Wed, 27 Nov
 2024 10:13:41 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 10:13:41 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Fabio Estevam" <festevam@gmail.com>,  "Guenter Roeck"
 <linux@roeck-us.net>,  "Linus Walleij" <linus.walleij@linaro.org>,  "Esben
 Haabendal" <esben@geanix.com>,  "Russell King" <linux@armlinux.org.uk>,
  "Shawn Guo" <shawnguo@kernel.org>,  "Sascha Hauer"
 <s.hauer@pengutronix.de>,  "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,  "Dong Aisheng" <aisheng.dong@nxp.com>,  "Jacky
 Bai" <ping.bai@nxp.com>,  linux-arm-kernel@lists.infradead.org,
  imx@lists.linux.dev,  linux-kernel@vger.kernel.org,  "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>,  "Fabio Estevam"
 <festevam@denx.de>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
In-Reply-To: <5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 27 Nov 2024 10:18:22 +0100")
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
	<20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
	<49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
	<CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
	<1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
	<CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
	<87ttbthwdu.fsf@prevas.dk>
	<5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
Date: Wed, 27 Nov 2024 11:13:40 +0100
Message-ID: <87ldx5htm3.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0113.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::19) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|PA2PR10MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 805b4496-70b8-4ea6-ab60-08dd0ecc2add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RUJqRsmUUbf9MD7FavB/UEtlr1rdtHMUsbQbDCd9eJVdg4MsgGfXlx7CX4G5?=
 =?us-ascii?Q?iq/fMUnhzRpNsMWwadu3EiJ2vYI4ViW8xvI8GQ1JaSJ29MS5+ScqKEfbgOU/?=
 =?us-ascii?Q?A8lIf3dmIdEFKyjGDV5Xed9Wr/sgmxGD7GUnjPDZ5PIfXH1IThODgQTIkvxW?=
 =?us-ascii?Q?A0/jy0FVrqkgG+j21iR/e20MYZaYxq7uZUX5TufZTzYt4LqTKdVj+OJX4UVS?=
 =?us-ascii?Q?Bbz3kGRq1VJW0TJQ0iIWj54lzi8/tUD5fpTMx6StaQl6FdzqTTR37/lm0b9w?=
 =?us-ascii?Q?rnYW0mgPpb3xa8+ui0k+lLSHIV9iNqvN+4CpNCcsmWgBw2Gh3vstoVRle8oO?=
 =?us-ascii?Q?s/190+KAwOynIkxIsqUmTJs/4JjAYnbS3QkhD0YlXjODlAwCVCgMxViD8qgd?=
 =?us-ascii?Q?JyUf/Qcjyig0HZzndwLIFjQnfkA9+SP/A7IY6dqz1ITt0+m+kMet44xUTjSD?=
 =?us-ascii?Q?OZDcGxXdz/P798zhD55ZSUX5EO4jqh27VHxnNY5BSPoHN45rWEJzXdefqPX5?=
 =?us-ascii?Q?3EdWWDXC5Ya5+aIOzV8p5PHQ1SmBD2ztayq7JIzKUsHCOerv4eadAfW1RUO+?=
 =?us-ascii?Q?ONcIHVFhAE7jPOnrYWHeSCsPlOTx9lwS0K6c0L5fw8Xkaw/sUVpgIbAd6lL4?=
 =?us-ascii?Q?RRKgTomQdOPswWGi2/qkFF1RVPu1Ox5eZmAntGBRYiZ+F5VHApu5DiDhQqqC?=
 =?us-ascii?Q?XSnTi8PsC8DTdCuJk52pJxWBlEQD5VJPXQy4aXcdfdgKddVDnUAXbHttvBFT?=
 =?us-ascii?Q?CoBqKk/v9Sy3ZZ66+edHa899G/2fB5kjfyBEs19rPK9NfjecIYxLWIIEHfQS?=
 =?us-ascii?Q?pdg/mJxWvZB7GCSzTUMLHdZzEMT0GSaT+z7oFLccU/rFiee50tHfL/tCk6lA?=
 =?us-ascii?Q?MqNG/JYqF5Ipw4G3MfI/lJRmgzLT1kyTcZ7VmwuYKs9Slnsttm2Qp6b/FDS4?=
 =?us-ascii?Q?+CeZtVhB4OSsO4eRir9vgI8k1GpKWNAfiQOerbXvJZ7qSiwjEkMnlF3RG521?=
 =?us-ascii?Q?moNSFJl24Z06a2qv3ugDmqm/6N52EwbFHMZPdvIsn2hfp+Dtfd0a4TtW62qF?=
 =?us-ascii?Q?o8AjbpLCRR4WrlSPbVZUza0MTOYCF4E+MwWZy6nnk4VklwFono4cdzDqCdi8?=
 =?us-ascii?Q?QfPLtpdnuRajr5xMWWSM77aPXD8zWrWyTObMZWNtlzLFY6r1f+Rp3FuTAH3C?=
 =?us-ascii?Q?flGIgNxepT/dLfwuyCo3TJx9yfcKW3ltYC1FjlFrQm5jgVB63ffH465Y2XBY?=
 =?us-ascii?Q?0FtSg/Hlu2Dom/72LgMDQivHSjCG1pDWghHR7waLcqC0e4ZJs0bS6bwc2FjN?=
 =?us-ascii?Q?09fvbP4tLoOBwqtcm7nMo8dcSgX9Zp5xtvnMF5ZXcES5eIMPhsGynog31429?=
 =?us-ascii?Q?FGkg8vM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jBLCVJo4PfAGf1ru9SbfwL4BTc34yufP/+R8aMGFPwUlM6sCFJnPu2tbFMeC?=
 =?us-ascii?Q?c/lrJubGi4NQaCnIWYeAziDqR9KY9arcO367z7PrsUSV9tJzZoofFEqYKPAD?=
 =?us-ascii?Q?l5v+v0waDftk3ZvFMrVa7JgjxQTqkQJobndYjQKQm7uPfvRaCNGqx4mdGUPi?=
 =?us-ascii?Q?JkxQ7raSp8VI2onVge5KFg/pEdtOFih/F/LavaxBp3B9b9CFotbiW+jlXwgu?=
 =?us-ascii?Q?YoHaAVJvt12RAEvpe6HMd+WQtt23Ywn2Fr4xg1jXYXqOs5iDsrjH1lqujse2?=
 =?us-ascii?Q?2y5EMZ7+xbnAEIkQcfjpDKQ86nBq6eSPJSd9uPv/9ZPSLP9AXDeX2JFemAfQ?=
 =?us-ascii?Q?Fz56mOSyr/n6/gRjz+vbKo08xSGOMmxZJXCqWONdAOlclxqjgLr9968zHGMe?=
 =?us-ascii?Q?8SzWvZq0YyJX949UHt/DeGqEB8nSmwEFG9hTerQTCJzWa31xO+Qku99LYod9?=
 =?us-ascii?Q?LM6HY//Pfk86U1bX17sWZf0utp1afYYqbAPSi+3NMZb/4/NPeTFP79X3AunV?=
 =?us-ascii?Q?RBm3gb7sLIiS8016mxig5HipKbckCE6k5S2nydiRhW1mMmhHvax2kdaNK6We?=
 =?us-ascii?Q?jfu2CHOhFRi++Gz/G01kd3fxY0SVVPSJOfsH/WtFqD4BihbsZgpiBnY0yPBC?=
 =?us-ascii?Q?ahutJijoA8fXxkxJsmaQcb6Jx7YmGqsFX4El5vNYPB7u2ltTNL8t5Av1Yjuk?=
 =?us-ascii?Q?bGeVZdqM+k08ifA9UYDZ1fiNKz8FYg0/4oZ0LGPFYopZytiuPAGkS+kVqR+v?=
 =?us-ascii?Q?rM6W5BWWyYvstCq7NMJRmS0vt2FkExlO72WCYv4HzIcCXlRvFYgtNvMU7Ybr?=
 =?us-ascii?Q?SF8vJ1NJcvnzgu1Fzh9Kczk7Na95YcnBtUymnhWxaxg0PD52XZpf/GpCn7Pp?=
 =?us-ascii?Q?TCeyVzJDYG6kNexikq4AiJQza8XAViEk2jYCW3vhyfneiFI4sl2fUqkPuBMt?=
 =?us-ascii?Q?1wIDfyUCuITXmxkGKyyR8HaWH7h+P+Ynd+1cPEuQW5ZpW6CmBZesEC1dJMB4?=
 =?us-ascii?Q?h2E3bT2chg/iAjQSuEcSdVAUuTdxV9h+2M2fL48BTnsDJNm/SZAigEyKtz4N?=
 =?us-ascii?Q?wka5N4Th//2T72pW6mQObiaYZB19CY/oeLwmiZR5sv8O0v6U8EfIL3F2kgTF?=
 =?us-ascii?Q?n+DinSw3h7C13Y8o0W59OCUmJeRGzEcmE7MU1LKtqQOGQm96mZyS2Bt00oWS?=
 =?us-ascii?Q?LnrgJ7ZmrGWuyf87r1CRVR+y78iLKCmV6MDuAc+vrwLyxvHrhej7eIeIg+jz?=
 =?us-ascii?Q?6uY5XcpShSs6MpMP69pD/Ns3FFKLnzEvYu/ndNRetdPL5tPLIHUACehfI3JG?=
 =?us-ascii?Q?SOIEOxNcZcyWwwAalVyOUcn6gt1ZH9qC9QMW1f3cjbnxu0qgoamgFv7GCrrZ?=
 =?us-ascii?Q?Fj/br8MNb8RrtzsxUpVXCXL3ta+1aAlc9UfsCPO6zc6fKVyPmgkOo7x/i5zA?=
 =?us-ascii?Q?QcFSjPAy7gBNOncrQRvRWA3EJknj8ecQyhZyUit6vnEEHLUgGEWfN482qw2x?=
 =?us-ascii?Q?51sdjgSNyH2lgtTreMoCFLyY6aWHtp96t8iCoH6dmoxRjw1NO9/UXge/bSiR?=
 =?us-ascii?Q?thgkJUugO08MdPR8cGOiC62aYTCEntamibiXJ1ABoyxY6RgJ1OO1cd2j9rsb?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 805b4496-70b8-4ea6-ab60-08dd0ecc2add
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 10:13:41.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKpLKqQieWFWDb89ep1fiz/kvMkMzbgfGK6c5Ue2CQmnYfQGcBA4H7MQrHwPqg5cn6+za/r7nxpK4bk0Pouf0yCti+B7mxgWoVkvDsO9PJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8772

On Wed, Nov 27 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, Nov 27, 2024, at 10:13, Rasmus Villemoes wrote:
>> On Tue, Nov 26 2024, Fabio Estevam <festevam@gmail.com> wrote:
>>>> Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
>>>> imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
>>>> problem for good - I see CONFIG_ARCH_MXC in other configurations as
>>>> well.
>>>
>>> Good point. I can send a v2 adding CONFIG_PINCTRL=y to the other defconfigs.
>>>
>>
>> Instead of doing that, isn't this exactly what the 'imply' keyword is
>> for?
>>
>> - weak reverse dependencies: "imply" <symbol> ["if" <expr>]
>>
>>   This is similar to "select" as it enforces a lower limit on another
>>   symbol except that the "implied" symbol's value may still be set to n
>>   from a direct dependency or with a visible prompt.
>>
>>
>> So how about adding 'imply PINCTRL' in lieu of the previous 'select
>> PINCTRL'? And that would also better match the intention of the patch in
>> question (namely that the user needs to take explicit action to disable
>> PINCTRL).
>
> Please never use imply. Even if you think it's the right
> thing in a particular case, it will come back to bite you
> later.

Could you elaborate?

> See also https://en.wikipedia.org/wiki/COMEFROM ;-)

Yes yes, we've probably all seen that at some point and chuckled, but I
fail to see why imply would be worse than select.

> I would prefer we completely kill off that keyword from the Kconfig
> language and replace it with the reverse 'default'. In this
> particular case, having 'default ARCH_IMX' in 'PINCTRL'
> would of course not be a great idea,

Just to be clear, it would be 'default y if ARCH_MXC', not 'default
ARCH_IMX', right? Yes, given that the PINCTRL entry doesn't currently
have a list of "default y if ...", it would seem inappropriate.

> but for the exact same reason, the 'imply' is wrong here.

I don't follow, sorry.

Rasmus

