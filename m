Return-Path: <linux-gpio+bounces-14521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D83EA01E2B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 04:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7768B1636FD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 03:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E647F192B94;
	Mon,  6 Jan 2025 03:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R/9d/vWh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6B18A6A8;
	Mon,  6 Jan 2025 03:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736134289; cv=fail; b=S90Zz+fjba0StNjk0rz+66600Duv4V3GXhWE0oIsuNZw/LtNper6F/FADyluPoU0/Zdeh/s/dm7mNFNHRHpLji45Ks8qZUD/pFpD8+YBSIdi05YilCGBW6of0pnAh1yHuYsTxoodCmIvhYxwJXGqTsU0B106CxBvbhK07MmNMgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736134289; c=relaxed/simple;
	bh=oX7wiJ/dV0SCQQEY1wUGJq6dWvw+ssuZp33VA6C4N0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CQ5K0SF9xlCn5GoOiShVdeTYULQsBT1Lg/pp7gFJzp18sRIyyMgT4mRzmuLU0yjSbV929Gunw9ZqQiqm4/KLuy+Z8X9WyDEmAbPxAgir44QVZzgT8a5dnkUlPQjaBx7XFJ6e7eIallZAr7WDW1cPxkcRdexMiHrEnmpaPMuockY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R/9d/vWh; arc=fail smtp.client-ip=40.107.20.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9NCvCnqi5sJAhwKAZuh1RhL6St61Ky3IInIl7gykVv0WqhB7CTmW5fuJQnB0bvNLCqi5wsVDR8EX1OZpEFO9/9FadDi8T0pGPAg4TSww9cVTk9o515Q9eKnynpzlhlcuOQd+wUX0N1tHPqc8tG4OOIRq9Ocst4ChBm/9PcxXsy+Hvw/thwmMMqzRyt99hgSM2cozZEBX+iU2OdiexXKP29cojYwPzStdjbjybkCLFRs0feQRjNVo5SAw9jQ9c/OaKEiWclaPb6YVc0OYqouExoa/UkB+IublzAOfc+fNgiGPChgnJqwdFx0rV22Tge9m0ZJb7B92WPcmQVUJZjasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evBHFeKb+wX9CVojvuJ/rakK0ThK23pC8vP6uU+EdE8=;
 b=HyMoKJ7UHL56pvD/jXyxmHK8RhjmKTbrRvRwaNICupsyustCg6KIZQhC3jXj8JzRWKTo62ExGRpg5/ZTrgfzXs0/NEdSwov3HOd0qdRAFYLULn6cXGvKf7KQN9T5aoSEObcQL2au3ZbyqBcrpvLX2Khk/vY1eSlELh7FqXcPFoEulN7FwN8nMlBCqAvdhJIiKKHfU+S4NBCG+yWar6TrPNyYPItraevS5Vq+hp6l2ZeoWg/hDB8J0D1+L+pSExtWLv7pN/PFLG84HDpLZlWCfVpMSXkj9mniq3+hQIYI6kpIyJlZj6hQQR361v4ely7SmCjo2C+44u1IkvEbVZMSxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evBHFeKb+wX9CVojvuJ/rakK0ThK23pC8vP6uU+EdE8=;
 b=R/9d/vWhFRKjvmcBRTfAxYUc8yOQ0gtV8UME1nvuMRoqs0WyLw7ev3egChwUEwglcvE2F3tuXLZzuwkkWNRlncbg9c97O6tzoNQER3GRbqwu6+c8ZwtOljYwBKYC8BY6sv1psOMoWnrb7W1wCFBf+B7ggo77Ke0hr8LY69PKtiejp9pdG6G5XghQVykBa2TQe6ZWCLTQzeaIsrLaqGBQIhz9js2sXU0RCxef2Et6iu9j29IUEsfckPP5aBu3V1/8pevCTQRF/nefh5Hh2sH+Tett93iaNBQIDMqc2g00+ngrlM8T3+ToNZ6UUD8xtfc64UeW0qiwh9mYsvdXe8cxDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7482.eurprd04.prod.outlook.com (2603:10a6:102:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 03:31:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 03:31:19 +0000
Date: Mon, 6 Jan 2025 12:37:15 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250106043715.GA14389@localhost.localdomain>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <20241227151306.jh2oabc64xd54dms@bogus>
 <Z3Qy-br-wVCLpo7Q@pluto>
 <PAXPR04MB8459AB05EEC7107D500A826688142@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z3bHsUMvajaOOhgO@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3bHsUMvajaOOhgO@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) To
 PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: d035a444-ad3e-40c5-910f-08dd2e029598
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wwFPZX3jG7eXcVhtadmRGSOmqSbwqKtc+vF4xxNdJNoRbl7HMECrgRvsMwWU?=
 =?us-ascii?Q?jwvreiKHxglbC4tjpgYOrThhpPrUYabY0E7fiF+caoSAy9YfF5mH49HsV/h4?=
 =?us-ascii?Q?BQsZLo5tMQy8HQCcbzW672xD6AjzPhGX6S7WzXGjQcshojrAZJw0QoqX6F0i?=
 =?us-ascii?Q?oveg5fvBDTWuM0U4X8LiUAheufChtacu+MbbYWAnFr4C5g6jMjwXukfuftR8?=
 =?us-ascii?Q?AG7qyQcJngHChaXq7snlUZMBQ5gtduGBE/1Awoorbcf9FAooMWi/zW5S7PGm?=
 =?us-ascii?Q?xOFBzEqr4w/qk8/gsNcaGuJuYCKVPrK1/i1e7/ezUs9sBL1CO5833d4FAM2u?=
 =?us-ascii?Q?LlqdNJEimtTyLLFqNIoFw5i2A1Yq+PSC7MLah/jXvkMCKmo0BSTex3Zceisi?=
 =?us-ascii?Q?XcGuAkPRpxkX31F4DpCoVdx9hpYoNSLc0FxAaxpO0+Jo3AV0O1ns6U4UL2no?=
 =?us-ascii?Q?iGGjpQqCvixzwxKrUre+oA9gIjjvKibfG9CNsiE5sa/A/oCi3GOtZZTuIULo?=
 =?us-ascii?Q?rtEbPG2S0Dkgn1TGNJC6e9a5OSh9mExZ/Zl9pSqQWCQKjjmxSg80AtDH1nw5?=
 =?us-ascii?Q?EVRwQDhsZzNbJdXD/62SX4XjiI6fldNqdcYBLqp9QoSvi1IfAGar4+78A56F?=
 =?us-ascii?Q?xw23K+Y6v7izoM9MbudwcWKUzwz8bKR9gndwY0MMslsm0rHpc2y9McOQ8ld7?=
 =?us-ascii?Q?2Fpx3kF5OVU8XmB+c//bxvjrYzzlMawGyeZpl2AzwAz+nmVrMkn5KoD+RZz4?=
 =?us-ascii?Q?D1P0HNSnZ8rE34EzB5XnQMx6UsZU7EcVWFeDnFppSX9mpZwA1gexRrhomzio?=
 =?us-ascii?Q?CU0roUcvjMDDIjBXS1HC4hvEIl39os5xvOq9bAAEgkLg+k+LY5FiIvB08fyp?=
 =?us-ascii?Q?tX50AIiQFy9lSJTsZSfFxok0epexRp6gi1to5lNjdcb5A7xvKxHLHY8WhpTP?=
 =?us-ascii?Q?4fIpMIDYLignlUWy4QZw2N7K5+kpgpMROlbK886BwdvwxGo2fu8GdyEjgt6N?=
 =?us-ascii?Q?CIflSOtURRBazuzDhiLLJ6VT8x9QYPDt69UFAlD3e+MhCreGu40jJ69w2kQB?=
 =?us-ascii?Q?Rt8+JLOR3Wx5crjonxP9jCILpLhv292rWegxj1ZkZyEh5ad2TRB9ymvxI55Z?=
 =?us-ascii?Q?b22GqalbMHLa2+Cr9fQPlavGL0HZ09nFQkKDLRFou+yx5oKuo1huMuwMkDdI?=
 =?us-ascii?Q?oB02eRnsr2P29YfcDcRg+Nbug0xtbju4PM4ybgJn8zJvTHomKAOe6VFynaUs?=
 =?us-ascii?Q?E42XGTWIFqZTLR40pG0WpD2ciq0TYpBa1w1PhaqOp36O4oN4AIqSkzEapz2N?=
 =?us-ascii?Q?2vHvo+YjJoj0qyloNOIXK8XYtqGUgplmwlJN8BsfdiscQKPPEdSO9u20/GZ4?=
 =?us-ascii?Q?mFyViXirtz4KzNjxMDRq+myDgxOXjq8vaOu2xnhvCXGN4LxUezEt406Bitbv?=
 =?us-ascii?Q?KZ1zfckWmYS5TBrcBt954e5mW6Cv19A6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tWdYX8CtIgUpl/2JOrn8k4hJ9lCr/sShiBlwj58bZNIoEpI/yPbsRkisvFTb?=
 =?us-ascii?Q?m0usLfiiWLDniEW8RuATkEJlVPXMmvtlwKcSxnYPqGQsbwoBrAladGCB1xkl?=
 =?us-ascii?Q?9mO6BbEcg+G8xX9lFVRXR6k1P3p6hKm0ttsNq045oexMfOkdo/zZ30/goJnJ?=
 =?us-ascii?Q?wJwnJQ0QxmOoaNNXjGU0cMiWcLyxAhD7Aw/jgc32/VSPFHCBcA5jBtWSNflU?=
 =?us-ascii?Q?qrj3miTyxuxW/60A6j5q5gSOwFal9/EOPw80+TOr9VmuXTofLjh5MjNIHWYb?=
 =?us-ascii?Q?NkSt14WeSxaIXOIlsMbmqlfNR+OfTynV1YDEuPcb5ueipWmkZGyOOf7ymorl?=
 =?us-ascii?Q?Dgfm4eF8G4LZc+W3OikMqcz3TTs1U8J6kXqoWCG16661WJAUyNY+DqeLK5Lu?=
 =?us-ascii?Q?MtWYKSXW5sYbibcmJ3u6h8NPb7jfFShZck4B4ant0y4RXbz2iOQziKrRkA4B?=
 =?us-ascii?Q?9RUgeKdYw2t6SVFAf3tuP/s2oUEJWY7/4mXiHoLKsktNXo6J25HqsHBca8Yw?=
 =?us-ascii?Q?0S+ibJ2EutHzrxE77RBmOf9ALnZorcfZQaYRllMNebRNPELuQ9cb7viuxKNt?=
 =?us-ascii?Q?VDUtLBeCJqreDaMnu4QTUSmgGXnA3B6lxAqU+FDr8P7sFarG2mTUKiPTe8al?=
 =?us-ascii?Q?pSL4pjuF9TrXL/CdkXyzi+Y7fApXF6FvPUkMRpIs4ElHcz4+UU/kLMTmALj8?=
 =?us-ascii?Q?J5nbgMOxHpzxUUAcjqjTwPT+JZ83vxv0HJTj3EgPV/Yz23XcFFU+aR1/4FrM?=
 =?us-ascii?Q?RTunGg5xAt3yNomlTVgHcjT4pSq4wyvDWqnpclqgHmVoWRrNBJ6+VRQitPFT?=
 =?us-ascii?Q?Dx2IDyQy8gQ9vXWUcnlXTmdLj29iuKIkOqVFwSynUEppXd8qvIPLuyRCDGH7?=
 =?us-ascii?Q?wFBnT+OiliDlFfVuqP9koIxxRMWMw1DKV9Z7FRgCk1W5v2BLDclNCjYACxEt?=
 =?us-ascii?Q?FhXUUEpyNXoJFLHDKnD+847AJovUdPbCN7KVDkdCxRYf0DxeBeGuGpMQAEZj?=
 =?us-ascii?Q?ryvU5Fyp+UO/earyV4jlM83BHaOnTeVvGSrT4cKPFgC9KJtfxnautYRqoSdy?=
 =?us-ascii?Q?FZVswitAfp5k65tSXzUgLMQaHMenSrshnu/R7wKpHxBo9cXV4OZBrsmfFepz?=
 =?us-ascii?Q?0dJhmw06SeZgSM0gT23J8vjBLig8rbGkSwfzJftB2Q5/rructwsNSIqA2umO?=
 =?us-ascii?Q?BXY1JxNPAAOWom58DT77bzWE3FvRfO7mcio9OEpPRQdxLYh/0cgerrzRUzvY?=
 =?us-ascii?Q?oDYB8EavYBDBxbOkz8DExlrjLITirl2iaVH1S0BOlZDXZvgaTX9vuj8U0szS?=
 =?us-ascii?Q?p370tVggiszY5iacymhK8tqk200Zu54HWZ4H+DlpmpconoJ02J84MIp7rQQR?=
 =?us-ascii?Q?qtDLuQYcXbH8yo27oxUSw230/g7MjRx0d5fhbbY2fPv3lIpdvjUxPNiXe3rN?=
 =?us-ascii?Q?o03bWgMGbZYf99I0/zterQ3IE+xWZEqul6WrwsLkv9v3Ll9u1vMMg0qjBqwD?=
 =?us-ascii?Q?5nnwOI5yFY0Lhqa+JA6/sSL/C+qMoXeTeeQ5hrKrK3bxNgbH0UGyRqimVkX+?=
 =?us-ascii?Q?75eq35vND/+6rZ5ZVGvxPMtIcINs/+Ard4V5D977?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d035a444-ad3e-40c5-910f-08dd2e029598
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 03:31:19.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZsG67zIfcSvqwWdv7hXKHbBLNBb8o1fBaIzyECtOcsfisIrAupxOUr6p4DAStVygJCsYKlxZK9YRJczed+6nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7482

On Thu, Jan 02, 2025 at 05:06:57PM +0000, Cristian Marussi wrote:
>On Thu, Jan 02, 2025 at 07:38:06AM +0000, Peng Fan wrote:
>> > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
>> > fwnode for scmi cpufreq
>> > 
>> > On Fri, Dec 27, 2024 at 03:13:06PM +0000, Sudeep Holla wrote:
>> > > On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
>> > > > From: Peng Fan <peng.fan@nxp.com>
>> > > >
>> > > > Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
>> > > > SCMI_PROTCOL_PERF protocol, but with different name, so two
>> > scmi
>> > > > devices will be created. But the fwnode->dev could only point to
>> > one device.
>> > > >
>> > > > If scmi cpufreq device created earlier, the fwnode->dev will point
>> > > > to the scmi cpufreq device. Then the fw_devlink will link
>> > > > performance domain user device(consumer) to the scmi cpufreq
>> > device(supplier).
>> > > > But actually the performance domain user device, such as GPU,
>> > should
>> > > > use the scmi perf device as supplier. Also if 'cpufreq.off=1' in
>> > > > bootargs, the GPU driver will defer probe always, because of the
>> > > > scmi cpufreq device not ready.
>> > > >
>> > > > Because for cpufreq, no need use fw_devlink. So bypass setting
>> > > > fwnode for scmi cpufreq device.
>> > > >
>> > 
>> > Hi,
>> > 
>> > > > Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the
>> > > > scmi_device")
>> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> > > > ---
>> > > >  drivers/firmware/arm_scmi/bus.c | 15 ++++++++++++++-
>> > > >  1 file changed, 14 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/firmware/arm_scmi/bus.c
>> > > > b/drivers/firmware/arm_scmi/bus.c index
>> > > >
>> > 157172a5f2b577ce4f04425f967f548230c1ebed..12190d4dabb654845
>> > 43044b442
>> > > > 4fbe3b67245466 100644
>> > > > --- a/drivers/firmware/arm_scmi/bus.c
>> > > > +++ b/drivers/firmware/arm_scmi/bus.c
>> > > > @@ -345,6 +345,19 @@ static void __scmi_device_destroy(struct
>> > scmi_device *scmi_dev)
>> > > >  	device_unregister(&scmi_dev->dev);
>> > > >  }
>> > > >
>> > > > +static int
>> > > > +__scmi_device_set_node(struct scmi_device *scmi_dev, struct
>> > device_node *np,
>> > > > +		       int protocol, const char *name) {
>> > > > +	/* cpufreq device does not need to be supplier from devlink
>> > perspective */
>> > > > +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name,
>> > "cpufreq"))
>> > > > +		return 0;
>> > > >
>> > >
>> > > This is just a assumption based on current implementation. What
>> > > happens if this is needed. Infact, it is used in the current
>> > > implementation to create a dummy clock provider, so for sure with
>> > this
>> > > change that will break IMO.
>> > 
>> > I agree with Sudeep on this: if you want to exclude some SCMI device
>> > from the fw_devlink handling to address the issues with multiple SCMI
>> > devices created on the same protocol nodes, cant we just flag this
>> > requirement here and avoid to call device_link_add in
>> > driver:scmi_set_handle(), instead of killing completely any possibility of
>> > referencing phandles (and having device_link_add failing as a
>> > consequence of having a NULL supplier)
>> > 
>> > i.e. something like:
>> > 
>> > @bus.c
>> > ------
>> > static int
>> > __scmi_device_set_node(struct scmi_device *scmi_dev, struct
>> > device_node *np,
>> > 		       int protocol, const char *name) {
>> > 	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name,
>> > "cpufreq"))
>> > 		scmi_dev->avoid_devlink = true;
>> > 
>> > 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
>> > 	....
>> > 
>> > 
>> > and @driver.c
>> > -------------
>> > 
>> > static void scmi_set_handle(struct scmi_device *scmi_dev) {
>> > 	scmi_dev->handle = scmi_handle_get(&scmi_dev->dev);
>> > 	if (scmi_dev->handle && !scmi_dev->avoid_devlink)
>> > 		scmi_device_link_add(&scmi_dev->dev, scmi_dev-
>> > >handle->dev); }
>> > 
>> > .... so that you can avoid fw_devlink BUT keep the device_node NON-
>> > null for the device.
>> > 
>> > This would mean also restoring the pre-existing explicit blacklisting in
>> > pinctrl-imx to avoid issues when pinctrl subsystem searches by
>> > device_node...
>> > 
>> > ..or I am missing something ?
>> 
>> link_ret = device_links_check_suppliers(dev); to check fw_devlink
>> is before "ret = driver_sysfs_add(dev);" which
>> issue bus notify.
>> 
>> The link is fw_devlink, the devlink is created in 'device_add'
>>         if (dev->fwnode && !dev->fwnode->dev) {                                                     
>>                 dev->fwnode->dev = dev;                                                             
>>                 fw_devlink_link_device(dev);                                                        
>>         }
>> The check condition is fwnode.
>> 
>> I think scmi_dev->avoid_devlink not help here.
>> 
>
>Ah right...my bad, the issue comes from the device_links created by
>fw_devlink indirectly while walking the phandles backrefs...still...
>...cant we keep the device_node reference while keep on dropping the
>fw_node as you did:
>
> 	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
>		scmi_dev->dev.of_node = np;
> 		return 0;
>	}
> 
> 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> 	....
>
>...so that the fw_devlink machinery is disabled but still we create a
>device with an underlying related device_node that can be referred in a
>phandle.

ok, I will add "scmi_dev->dev.of_node = np" for cpufreq device.

>
>I wonder also if it was not even more clean to DO initialize fw_devlink
>instead, BUT add some of the existent fw_devlink/devlink flags to inhibit
>all the checks...but I am not familiar with fw_devlink so much and I
>have not experimented in these regards...so I may have just said
>something unfeasible.

fw_devlink is based on device tree node, so there is no way, unless
add subnodes for a protocol node, but this is not welcomed.

Thanks,
Peng

>
>Thanks,
>Cristian
>

