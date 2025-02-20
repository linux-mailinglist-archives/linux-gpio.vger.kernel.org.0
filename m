Return-Path: <linux-gpio+bounces-16250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB58A3CE52
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 01:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B52EE1752DA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 00:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3F9135A53;
	Thu, 20 Feb 2025 00:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xZCfXyld"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090905FEE6;
	Thu, 20 Feb 2025 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740013189; cv=fail; b=GEDS6ohQSj6ldWhMCLsV4DQWx2ipbfgfuu4BJPngQJ/cnA+PWgAx22Ujq5ugvvyMt7n5DANdCKueWWaE1Kdu9vLAuEaJ9YPlDefi0ePFcXYJ0W/GBA6mJe/WvZt9gI2MWhCpc1MEefH/y5CcbfpB+QxVkyiHjyoGpxGhBmBRow4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740013189; c=relaxed/simple;
	bh=9DTnlE3GcjNxqc0XzivYGdg6672ajpkslqYkUX3sVJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ICgl4rtfCkCcaOzQWvaZ4lo4C64GzoNw14K6nLG/7zDIY4EXebncxCDYFwoEBEFF4c9B4CVhlxapiVjN2vuzf0ZyOHEdrNPZ4BWANxnCSl5N5nS/x3sh7ekn8oZZTCDpSs0jCXRZk0wePTamDoIQYqppg7GKnCoXZyiK0FUZWk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xZCfXyld; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5fRYy1u7ZT0+TSNZaRc0bhkbxjsgZWaJPKss/navfLWzqrlffL8qTkuk72pG1HL7et32ClrCH5rvnR3Zml6fNgYrQhFu6dg1wpN8mZAhvAae0/II/+hMAN4BEX2o+MIn22OhwElttyDnBsig0KN9BhDZDUl0Ya04jU0I/NmNefgkfhiyoMzhYEea0kEPTRodXXDM9plKOceACaCLCMbjuAj56aJcyrs3S8EtMfv0dMGiJayJg/CbFT4kWhyn/tSbm1NLBhUSa/x3v1Z1xNXLA0YgquHaY7b35z6dPpp0EQ6XcsbamYEwd9+19htgmR6rOHhoMsVfZkS8SxbrkX79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gct0kmPrU+UWlM4IDLLCxTXYidc5DgWzOsFobbguWFc=;
 b=UJYE3pw5qPMrTiH8xSA+94HKNlvJsDwGee1+58PrmFXVRrRM4Vdvs6omcf/X4TrO92NASVUvw6Fb63zH4vXXqEdKZEalw3a9GB0h62NIrqOFvr6Ntc3lvws5LLpJK4AmEsoCC2wE4Rab+2UQUj6fr+p2pKVyNIGg3ZbnheUzzdulA3vw54PvFZu58/9n4MDPQd1RA0LpfMyO+62WkkLaewUyzeEyMZP2gpOlucB3gtBGmQo2nAIF9/Io2+W1vT+MWij6KZwWcIavAvrp71JaYo3/dcMgPImKjsE4eCTQPjVktOs5Zs0nBjdJ872owbqgTOZG+eVQeTXGFLal6YedAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gct0kmPrU+UWlM4IDLLCxTXYidc5DgWzOsFobbguWFc=;
 b=xZCfXyldsnBOisR7OnlaA0TyiLD0CwASRgWAIYidyj0OYuh7jWpL5wsVBw08DNwmNk9itjD0DOFMbnNUcPlOT7Eq3pwuEtQkDPw9Nhe7eU3w/8xwaslFG1ZPjKYV50m4cxy+zCz44viIYP2Ry1gpG822URbBE+Gy2j/6EN9o7RgvMmmewQF20FAlMxtcSK4tg9scIP2Mb5tcGZm/+Eym8P3yXMtBx3DdxhEs35ByQdmH315r4EDn6Y7/cwh28193cliQuO7DSnbKMawEXqHE78oydaK2wv5ef8n3egj2xb4fiFLqKwdcG4ydlUbJG/MugHnNPMQWRaxytSABbP7UCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10553.eurprd04.prod.outlook.com (2603:10a6:102:485::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 00:59:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 00:59:38 +0000
Date: Thu, 20 Feb 2025 08:59:18 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
References: <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Wvyn1QJQMVigf9@bogus>
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10553:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d41735-b612-4568-56b8-08dd5149d928
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zeqpzmxQIgncLrQfiC+5WnLTxYPAHnOQe9Rxd/GEMqzzSVv9jWWuAGUMfptl?=
 =?us-ascii?Q?H1ymVOeQoBEIzh+H1pmBM7Ex2x+HS2V9F432cAo4sP0Eh/TC7W4qXYEEGYc6?=
 =?us-ascii?Q?ydS1IV0T82/q2dN6eiZr+lf1ABQ3UWs+rO9sh2KwjW3tNRkNt7e4KrsoM9Jj?=
 =?us-ascii?Q?08esMnBYyDYDxgDpLWefRBF0qF2LjwuvLUM6EfdadpVqns2NLKIPUxn0Eh36?=
 =?us-ascii?Q?5MDpe3fNUXw7n9zMvntM5AGlKRs8/nJ0CB0ZCxt8BMIofDoPoZqOzo+iDe5o?=
 =?us-ascii?Q?NbHtNNYKa9j5tf/037wNCAWQKjjDtGc5PXXEAC43Swjy+AYzs7AiWYaVQJlg?=
 =?us-ascii?Q?JvvjMZombW3xQcVJBlkdYV8x5bIYdpR0HO4d+EqSSQdHo1AurWONpGbjEe4M?=
 =?us-ascii?Q?T79UAnhyW6YoJ2CZeXsiRG6PSakHa79Bbcp3lJ4afaRT2LVsrcvkCnhr82Wq?=
 =?us-ascii?Q?XNWLB56ljnFPmHn2rm6IPBCxwc1G0Dk3xXZ7mYSg1rFEwzYqYaHP+ptR+LUF?=
 =?us-ascii?Q?IMwbHY6N3BFfb69av2vafxP7gqBDu75HZantESVtG+Jka5crqKPLYJw6NJyK?=
 =?us-ascii?Q?NTMan79tXKY9NoHChLDcj83x0LpW3pErSs1B2OUPI0WsVWnxjj8khwgg430P?=
 =?us-ascii?Q?Sd49l2/y/hypQW+coQt+YuUtvmpu2IEDf+vJMFHp02SIIIWPcB0qw3s5dONs?=
 =?us-ascii?Q?S66NLjzG60sVIkBfI8WASRJE7y687SUXU9yw4/iSD8VrP5GSlS5zaTxTJ5BJ?=
 =?us-ascii?Q?eJRGRAlUjbLyBGPYCd5OvbnVX8KdyiE/gUFFsysz6UbiMYHJALKGohk47sd5?=
 =?us-ascii?Q?o8wm033RQ29x3k8XSG57QfW9diuTRI6mnrF0pgFpAMmJFNv8Qfol9iLzf+Wv?=
 =?us-ascii?Q?CtSXNQtSs7/1g4Gt8XYcClW3rs7FBDoUcwRuAV1mq7Y31HwoBVSan2Y2jBZg?=
 =?us-ascii?Q?cBbOtYMjZBvzGJ6qHLQpPFmX1g6izQ5HqAtI2Ppet1wWxogycQMWM4Dr5M1n?=
 =?us-ascii?Q?Qr/c62npk5i7GPWIpvkO/CTPoOUVM6qLEjzQQJ/AZMn3NfAZeFcPZaWtYWyi?=
 =?us-ascii?Q?LcI+fEp74xySvAadpj15eYAZMSZIoZBsfa78vxq+J3V1d8kgaVp8BqBcnqBk?=
 =?us-ascii?Q?cGaUrLESWcgUCMYC3SRk+Ce7Oj75k6lGJVwwnQaoDbl4F3cUnqMOAN+LxmQf?=
 =?us-ascii?Q?kRNaOH9IQXNTbKJ6tmoLbJXybacrkc7G1oVOmLomFPQubtc7NBu92Sw3XL9i?=
 =?us-ascii?Q?Z18ZCaaVOScxKezHNbO9o4V2x+t6oTTMNtAeCJOlq1q8deSDOuEVi0+x93Bs?=
 =?us-ascii?Q?qVJjkFhiUDeII4hu2VsyIn6P8BZwKAWfazRgVImdJENrse+oSF4u6Js2BOff?=
 =?us-ascii?Q?y7HWrXxOyGBJEQD0XCJuTx6SNcnUGlEaanCni0062Bri+OlJ+vrwTH5rOsfS?=
 =?us-ascii?Q?bf8ZyimcaHaE163DIdqrkLJl6Vxa6y5K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qBolPfuDj0KeyDgG5pMTPN0rnYeZbe/6VkgThYtThfDvzG4zloUtmEAK+US2?=
 =?us-ascii?Q?mZJC31jHF6s9SX578GSZQGbVRGboRv5CtImJOEqWFfTZsGfqLuOWPKqXx36C?=
 =?us-ascii?Q?3wR/15D5RD2GVaLNtt+iYefT+p8K+8tl5Sz29UHxdkE1iBOQ7QWHlGxNjpKN?=
 =?us-ascii?Q?4oK7XujTAZPTknQmfIPCvHd81fWYnqhQ4e5p/f3tc02oVi/5hMyFuu9BtUYS?=
 =?us-ascii?Q?ExN+lQy2PvgqBtaWQ8xAT6RikorDqYTafpYhETPDq2rt88ORUU/xxp/I6kgs?=
 =?us-ascii?Q?H0HynDwsI8hrJMRs2JHyS3wmyo61S3BFHNg0n8gGRXt2JWLlp9Sy6P+rbfBJ?=
 =?us-ascii?Q?yjfA/2x8ZXTvxoi3PwyCohuJ8mp5JwTdY7x6cLMEw0JKtc/IarE1AqMBg7nN?=
 =?us-ascii?Q?DD0Kc6J4WAc0kqwpNgC6RiyOwzwcDMqvQYwHIOCz8nDb9hE6wqFVKdnbb0s0?=
 =?us-ascii?Q?+a/+MF6c1UYDred7mAPUTm8ygaRitDSrMY97mioZnRrzDixkXVSCdNjWTR7d?=
 =?us-ascii?Q?63LW7vKpciRA7OA5ucHsT+uww4+KWNhd333grD7RN3osV3rXzbNWhLoO/6hr?=
 =?us-ascii?Q?FC0xcp6s0jn+LBQpW3FS/Z3LtjyWnSsXXYL1gvIGpX7AZnKqLdfA1mMj4J9H?=
 =?us-ascii?Q?oeCD+Ig0WHbHkGQBPbyOLmBpRpjrAwet11Vla0E1gFCaKLKD8eD7udHsAzIo?=
 =?us-ascii?Q?otZ/L5H/ZKTtGbw9v1m5bAVrqy5d+NfLpdaJyguzuAeYKkt+YP/GRf1fQjzi?=
 =?us-ascii?Q?z/ybrhu+ygegSWBK6zpW83tIKY4yK03T0cyQPw65P5Cpumrnm2TLZh6J1oA/?=
 =?us-ascii?Q?ZYgvjs8GZMZRZ+sakIOCJpNN4D8yjV5hEvKS2T7F1YJ7appn93oEjt/vFWLx?=
 =?us-ascii?Q?cKrsDz+SM6kc64SrWu8d6/zXCoSCg/zqdMHS99zWX6MNeRVfpTi7AY/oybiv?=
 =?us-ascii?Q?axPzC2AAqNcjZUNOo+g69kJCTAt8o7PogMzeBm1RHsOFJCR+QAWo1m+gvnX1?=
 =?us-ascii?Q?QwOV2tdml5dvMIPv3OVcWUWhhaweMHfV2uGHa0XHPLcm/k3RYnWJEW/yjJ32?=
 =?us-ascii?Q?Y5GOMWZLavxUgNe3wdo+Rdtppe8Tuvjzw6nuR/4dMtSnMUAPyBaKpMR1hqju?=
 =?us-ascii?Q?grj3H6V+h8WLTc7DvM67SRMEg1ic+GMIaQsJnECW/ccN5itLhoILpG/oDFrd?=
 =?us-ascii?Q?0TcArAE/MYr4o58kMi3/ftLkS2Dhd+w2T5Gw01amsX5MWNPse8BDuN0xd9e7?=
 =?us-ascii?Q?dcGuFw/9XBi7YBpr0bzC/M4fxudLvd8kaw+YjHO7XJCDaMjC79fqn9dRTCWl?=
 =?us-ascii?Q?kf4VGgJXa2/BIsEvnI35iXo6G0oVi4BfKkTufPBaLTpIfbWUdtKVlCh8wr/U?=
 =?us-ascii?Q?V6PUPm7y5zLJm5i1oyKX7ZXQGORhiCnjrs+NQIdLJhH5aF/DuqAjUhNj+j2C?=
 =?us-ascii?Q?snMR169Ve3qISiBXRrIYJrhG88mQS5WAqRBS5FPYa8111i+lgJPTC6HJENzS?=
 =?us-ascii?Q?mw0mC2C1sZW+XLYSthea3IwpFRgsmEJcxQirWkLtv3fJxfvnu3IvHiDRzvEj?=
 =?us-ascii?Q?i21E4kj8+tNuRTWiJYzrL+k2YgY2PlGqWedO1kEN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d41735-b612-4568-56b8-08dd5149d928
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 00:59:37.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KDAIzI+43tA6YQpZynSDX9V864pHwryXFm3tc78gsNezszrxmmxlgmcr4xpYxy1j2D5nVDxeVHST0UqrS7z9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10553

On Wed, Feb 19, 2025 at 10:17:46AM +0000, Sudeep Holla wrote:
>On Tue, Feb 18, 2025 at 09:36:19PM +0800, Peng Fan wrote:
>> On Tue, Feb 18, 2025 at 10:24:52AM +0000, Sudeep Holla wrote:
>> >On Tue, Feb 18, 2025 at 09:09:49AM +0800, Peng Fan wrote:
>> >> A potential solution is not using reg in the protocol nodes. Define nodes
>> >> as below:
>> >> devperf {
>> >> 	compatible ="arm,scmi-devperf";
>> >> }
>> >>
>> >> cpuperf {
>> >> 	compatible ="arm,scmi-cpuperf";
>> >> }
>> >>
>> >> pinctrl {
>> >> 	compatible ="arm,scmi-pinctrl";
>> >> }
>> >>
>> >> The reg is coded in driver.
>> >>
>> >> But the upper requires restruction of scmi framework.
>> >>
>> >> Put the above away, could we first purse a simple way first to address
>> >> the current bug in kernel? Just as I prototyped here:
>> >> https://github.com/MrVan/linux/tree/b4/scmi-fwdevlink-v2
>> >>
>> >
>> >Good luck getting these bindings merged. I don't like it as it is pushing
>> >software policy or issues into to the devicetree. What we have as SCMI
>> >binding is more than required for a firmware interface IMO. So, you are
>>
>> Would you mind share more info on other cases that SCMI not as firmware
>> interface?
>>
>> >on your own to get these bindings approved as I am not on board with
>> >these but if you convince DT maintainers, I will have a look at it then
>> >to see if we can make that work really.
>>
>> The issues are common to SCMI, not i.MX specific.
>> I just propose potential solutions. You are the SCMI maintainer, there
>> is no chance to get bindings approved without you.
>>
>
>I am not blocking you. What I mentioned is I don't agree that DT can be used
>to resolve this issue, but I don't have time or alternate solution ATM. So
>if you propose DT based solution and the maintainers agree for the proposed
>bindings I will take a look and help you to make that work. But I will raise
>any objections I may have if the proposal has issues mainly around the
>compatibility and ease of maintenance.

Sorry, if I misunderstood.

I will give a look on this and propose a RFC.

DT maintainers may ask for a patchset including binding change and
driver changes to get a whole view on the compatible stuff.

BTW, Cristian, Saravana if you have any objections/ideas or would take on this
effort, please let me know.

Thanks,
Peng

>
>> No more ideas from me. Leave this to you in case you have better solution.
>>
>
>Unfortunately no, I don't have one. I haven't had time to sit and explore
>the issue and think of any solution yet.
>
>--
>Regards,
>Sudeep

