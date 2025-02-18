Return-Path: <linux-gpio+bounces-16192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94451A39C31
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 13:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01CC71894056
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 12:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB949243955;
	Tue, 18 Feb 2025 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ujl1KXG7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E21ACEBD;
	Tue, 18 Feb 2025 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739881840; cv=fail; b=VhP93FFDF5mOBstBJ/8jfSRUppsHmZLp6Yt+McA2KeiLd5Tt2Mj9Ap4YJTnK0QSzGqjHGd4D4jUVp9Wk5Y4AOzBXtIWAowI10XU5vxVtW34JPUEDD52h/BmrS5AUR6kWwWFOqi5NtibKRFdSMai98uqphffK3boU5/EcNXGY5eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739881840; c=relaxed/simple;
	bh=QtavOwLKQCzYYcnerNpEwO0V7+5eZCBrpSY7welBMGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FaQtwu/0jDiAlo7fbyJKnKPc1XVBopVvDayg1rBce7kvEc0XpP6MUkoQVg3SD19XfbukGNrbzEOYZmF95cqZE8nDScnTXkxtmyrXGO5Qvu5Nvsz/sZV39Rn6x0pCkBetNqBiWxjli7riyJ73+sB49X5cHOX59qgXbQkJY9iBZds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ujl1KXG7; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5dFntXsxgy4vVpvjl+vqn19LyW0fjnek4sWn3dMDUxEzkHWlijUx2RoeoQC8+cOBEoPUlPCN/6RaCV44EtmAmphwGQyvq7/R4cvShg49pjjITik5f2XrmrYK47j8dE2u/ff2P2K+h7ATxcxLga8aqhZ7guN6GX6AMI46qj31JTF5sHnqW3wcacFj0XNWDgbTSJYSCSFnNsKLAQ9yn+YGhXL86KJ0sHkpbB3l73b362Wl3TN3n/8dLyEUkIM8WgXOwkK9Rz39dPZabu58lPOO6VXCSpFn652mXdyXTewg8DK5ZutY5bwdGujSxbQFWnxpbDDccCWpMHrmEjfpNez+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDFWjztJPs3yr5RlsWnRgZPhq8US6m82jcPiU46DXh8=;
 b=FaphcHja7L4LrFExBkx9C7QJ0emh864htw0j4ZnKyGgj9MrUJYdx6Oimy0ZgDvlqriP9+LLi76uymAhMSEmCFyLpDhiRLH+D+wT36KwtcnS+5YmRLLerIVslwrXZUxyjisyNFisjno562zzgFIXLhNWmKarPsvUfvaF9XpYqjPYUhSSGYAAPprykBx83+qz1Nxod0z2xzYogdpIV0OvKqaIjvUAFmzYB00U2/0b2Ux3h9ZdfM75LHoCEPao8r9Lioo8IB3UnY3XBECaC72uTPP7ySAgUef4l8UaEJARqlB4fpdKk5OZhb+moIyVB+T6NA4xCgorllI3kNRQS2Ssl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDFWjztJPs3yr5RlsWnRgZPhq8US6m82jcPiU46DXh8=;
 b=ujl1KXG7T70puyRKMlP2wG41noZbQk50wcOJIvA2CJ4PjNPCzIlJT7OwZi2ReApCdBNr9NQFBvH8jT1og8VsOIzq94M9PEmCD9zwj/hU/156/B1X+RbBTx3kIpEH0dpx8BLBA8dgh/aLejhz+8sFnuwJgHakDAAhF2feiyygohvq4LlLWRv3WQhfNNtq2Ly8/4z4wehkWUPWfrK0ZG/oPqL9QSWm6JJzXBgkK3h+wxApjfNgF7FLop0MoAhe3JYa+rxG0NYwhJkkRrGY3Q+64nS1n4sclxH82dUXITdC6FpK8zkg5QZx9mk5JaeLBLlQFHL2ClEWo5SMnbjF7wflCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by VI1PR04MB6831.eurprd04.prod.outlook.com (2603:10a6:803:135::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 12:30:33 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 12:30:33 +0000
Date: Tue, 18 Feb 2025 21:36:19 +0800
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
Message-ID: <20250218133619.GA22647@nxa18884-linux>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Rf9GPdO2atP89Z@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|VI1PR04MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cf1356-cce1-4f2a-f1aa-08dd501809d0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lx2bMOMcuV1wSTXtsmFCtNuusY7SHvE1lWARkKbdtV4kHMKQow2s+W402dVK?=
 =?us-ascii?Q?217B3jWYSXPcwRF+RIji0ninZDcrqLKh8NOyfGXffJXJajdrEJQfxC6vHrUQ?=
 =?us-ascii?Q?7gwVuHWznMy9FX+OObd0Jw+ZF2dFh+wWLKep6WKmVpC4qRLe6t2e06cLL9ep?=
 =?us-ascii?Q?eY7Qyi5CHp9jsMX+r7jpvOJDrT+c6jw1zB6etVkOUo3KCa8iGjacsfAcQRo6?=
 =?us-ascii?Q?qiYb5wSqJ56mQ7Fn56rmYrnh8431qGNCrtEEtpp42mxUdG5M24qbGqpB9U9c?=
 =?us-ascii?Q?6NRozIORy4TN7uvitdOtf03VF/ZPkrBlpEzeJhoFhWtN0nIbjHVrC/zdsfkc?=
 =?us-ascii?Q?tu9G0TAJvKjB8qu2reJfTgkKP5dGV2Se8BVd9y3buKJmw0sdOM/f8TS24S0t?=
 =?us-ascii?Q?rqpzGMk5gXOmvQbb5MSkHigWNw+dLdiQzlLJthFGrrX4tqvsk+Ykb3GbzMSa?=
 =?us-ascii?Q?rUTan+E0BBVt+pr9PKz7Edmu3nLabPPRFW+41T32gTPAadRsR9pmklGfaDrK?=
 =?us-ascii?Q?NU4URKy/J5aw2gU2PWIvw/RgzlPHDq9yGd6vrz03cRWiyI30cjYiLQRr5ZS/?=
 =?us-ascii?Q?ZWWG6rTc79E3KIy7gYK4Cq/uaBXLxFv3tpFgKIjkI1c4H0GdrDtn6cs1ZG5K?=
 =?us-ascii?Q?NrhIaxz3oiL3lmbSJWESR9VQDHz+LyEvZcFI1et746EEUoke03xe1HuHzr3J?=
 =?us-ascii?Q?EoZa9FnUB8jvGrL6oOX1MhY3wo1S5tNSpL8L6zj4rzHj3MkAhcLOe9egMTkn?=
 =?us-ascii?Q?86FPGEAMH7g23J+RtvPCJs7hL1EcHSBc0pBLwAkw0ohFKQ9BfziWWxPZXtPI?=
 =?us-ascii?Q?KTKhroGS3x4bQFCOyoRLn3E3DzcwQXz+1gY28Om0c6/f3AdMO4RmVVK1Lqxl?=
 =?us-ascii?Q?bds0mecD802Zs7UcEmD1rv9d9iTD8F1yV/yoiahKCU9B1BnCvzXeTvF8nM1E?=
 =?us-ascii?Q?jkmfeYVVfkPKmOh9Mdg2guneNiS3p6s8Vw6Jx2OBwHjp6z4oxcajRtfSKj8C?=
 =?us-ascii?Q?WkV1q9yUdi765riGV+t2WtD/4P6F90Bf1UoW4rYPfjIowuo1vhmVbk7AKyl3?=
 =?us-ascii?Q?YpUX6AijgyAf7cedQV6wPmC06jo/UifNXoj/31w4oHsyz3C4xiUPN6GozDym?=
 =?us-ascii?Q?64tVWSTMROffgywAkN6KJbvVqNOpmT/0TLNNl+N7PzDqDFhTxzhlEQ/Wr42K?=
 =?us-ascii?Q?eZ5VhopgxVVGc15lXVs0cz9HCHZ48vlx1f+ozhCQyQmNnNsBOc0Cm+j+ujmB?=
 =?us-ascii?Q?2VVDdZigmqwENqjzODB2+bUm5kpMTVGKSVBJq5Gr+R7r1Jpi8JbusVWAxFh1?=
 =?us-ascii?Q?p3C7cWFyoftgqkDNIlP3pmQfQuOwEvXVxe7ccxVIfxErF7gPPY+LyQbcekG1?=
 =?us-ascii?Q?0UnxJaWuaCHaDcbcd2PKLFhTvp6EADAyYaTHuyRrPpGLugJcybhkCToowXTF?=
 =?us-ascii?Q?TmguMeN+OIPVCGA8d1B2qF+5LnPryHrb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lQiZ6DNCR71/bnbMqZ+GjpBuoibi1oaBCykQ86CRhnuW8SX9u6ohojwe0sZ7?=
 =?us-ascii?Q?ij5qALjrl4sKzW/yADdcBYVPkKTqd2dXliaNNFnwePxafNxy4BcNfca8S4G0?=
 =?us-ascii?Q?zCVGpy42A0qNNaLaZQ2WorPwEqLCb+AWkRAgCzbHzrwQuToBFN0ErQsPzV0m?=
 =?us-ascii?Q?55AJYWBS9Uww7xf/aOXlWW6R9tQXJ1LPI1mpgUQfF3ZoG9jgqD899Cei9Xpv?=
 =?us-ascii?Q?jrnyhUcy24VvNTBHr+wZt1t6/IZwsjZZBvMXNzXDdcJUlnC/w0DKikTx/Pmr?=
 =?us-ascii?Q?TYVFQy7I+s3lXcP+Yx+JCW5vluh5Ooh72yxnZ0ZM9QxGt6bx/wKTpfWxhU77?=
 =?us-ascii?Q?rGkUCxBBbyaXn17it0IItNphbioYNUD96i4IYw1hpm9mojkENnxcSSE1eNWA?=
 =?us-ascii?Q?E6CNRktAUA/evi6yAMCe9qSy709ijutGL7PqoOEEpzKM+Cv7nKTlTqNiYSQI?=
 =?us-ascii?Q?UPbGyfNm0CITVqzN0iO8PKjlreJgGbTulkAEWeq4LT2U6+UBs/eTsWKFLFEK?=
 =?us-ascii?Q?u+R509vp7LStoldvDl9SFz7ahzbiDVJjPUloVQTwMj19QjVUYS5vm/i/iPsr?=
 =?us-ascii?Q?E5Q4B/VcuX78oJXBxfxvW91tUUY7PwTdMiwsi0UyNvzdEr0MT5MhOJPBJU9G?=
 =?us-ascii?Q?pA6qtOi4vVDPccnzQwBe1JYo+XchoovsSgXfp7nhZnGp2JVaoH/XXNTPFSBn?=
 =?us-ascii?Q?KI7js8SaCJagk2u//LHfL/Z+KRnlM1BdZjheNkJThQowXPrKQ8U7Ua6uWHhv?=
 =?us-ascii?Q?tiBZC1frlM1Gpq9SHem1fviiTWo0yQVm17l5KcqTnoeU5ObNQ3VSNoQuDEPb?=
 =?us-ascii?Q?d1nbOWb9RjTBqGo6YLzVOppM0qi54LEfvDkMeFxNtPeBsAOq/7ApNwHBVv6x?=
 =?us-ascii?Q?NcA+OC7IbA/LI6V5TGzL9sfC+kQAMxCeMxcpY2cuzC2TwBFHyDLVbEzP1tjF?=
 =?us-ascii?Q?BCTqU2+elUWgVYn9/yXNaJgn3GUkAu7AOPtsqb4UEWcYEtjVFW3LCi0S3cb+?=
 =?us-ascii?Q?OzGAXLb6VtgHiBkJGnbsncbcnrTQyvZ+o+H0c/wq+TAVBro5/SmUAIfMFsSF?=
 =?us-ascii?Q?H4w/hrfkzcfQZM0mF9F2EAMl4Zrr6kD0BdQXzooo1DSAwt8/1O+cnGDNsR++?=
 =?us-ascii?Q?GMgh6YXmZ89pFY1HI6L8Cfa5ssPfGc0LVhGkt+7q2ekmJORr/ax4DX2pAYgD?=
 =?us-ascii?Q?MfcSi4QRMTlh/FLFedax6LUT0vtCq0Qc4qMQZR2Ii8UFnSX68HVzkwOUaaol?=
 =?us-ascii?Q?ebMMwQhwXhKbEfl1zSz+02yeXFoVTmrd6bXaBhBdww23BjEH37B2CynAEN3f?=
 =?us-ascii?Q?AJRZC3uWEcNYsb3xHcSYt14LK7dwWqeN8kNYXeBt2R+2EqxAjIGQgKS8z21o?=
 =?us-ascii?Q?8cFgiI14i3eLU7+m2RtIhz1N6ZrHFcFvKbrA4BJDavcKQCU8Ug3SmOvwQWRz?=
 =?us-ascii?Q?q+v3Zq7/ptC5iVJPUVNfADPjPaAWiEKDYVOr8kV6oysK/rmW+YMvJjKIMS60?=
 =?us-ascii?Q?Juo4qDqUFz0wwjtObcA5MqZu4Fv69Q3RTABt5pUziMGi0qE5oMWl2nyRokrW?=
 =?us-ascii?Q?4VmlPsCNvOK9bI3azP3VPaXSC2OhF8ViXM+Z1Au1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cf1356-cce1-4f2a-f1aa-08dd501809d0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:30:33.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvuGywE/UF7kBivmnp0I+rcZebs+t7hNyHaGDr1AXWV+xtv7EjaqNYaKAg1RkTCMj/zK7HKG/gWr+0FaRpy+qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6831

On Tue, Feb 18, 2025 at 10:24:52AM +0000, Sudeep Holla wrote:
>On Tue, Feb 18, 2025 at 09:09:49AM +0800, Peng Fan wrote:
>> A potential solution is not using reg in the protocol nodes. Define nodes
>> as below:
>> devperf {
>> 	compatible ="arm,scmi-devperf";
>> }
>> 
>> cpuperf {
>> 	compatible ="arm,scmi-cpuperf";
>> }
>> 
>> pinctrl {
>> 	compatible ="arm,scmi-pinctrl";
>> }
>> 
>> The reg is coded in driver.
>> 
>> But the upper requires restruction of scmi framework.
>> 
>> Put the above away, could we first purse a simple way first to address
>> the current bug in kernel? Just as I prototyped here:
>> https://github.com/MrVan/linux/tree/b4/scmi-fwdevlink-v2
>> 
>
>Good luck getting these bindings merged. I don't like it as it is pushing
>software policy or issues into to the devicetree. What we have as SCMI
>binding is more than required for a firmware interface IMO. So, you are

Would you mind share more info on other cases that SCMI not as firmware
interface?

>on your own to get these bindings approved as I am not on board with
>these but if you convince DT maintainers, I will have a look at it then
>to see if we can make that work really.

The issues are common to SCMI, not i.MX specific.
I just propose potential solutions. You are the SCMI maintainer, there
is no chance to get bindings approved without you.

No more ideas from me. Leave this to you in case you have better solution.

Regards,
Peng

>
>-- 
>Regards,
>Sudeep
>

