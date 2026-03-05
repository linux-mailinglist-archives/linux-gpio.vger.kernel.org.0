Return-Path: <linux-gpio+bounces-32592-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKEwCV6hqWnGAwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32592-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 16:29:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 691852148A2
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 16:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6A5830502B4
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DBC3BED5C;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RrUC29Zi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4F242925;
	Thu,  5 Mar 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723786; cv=fail; b=ZPb7QGG3OHAZ4NF+XJhLJEcHoIpA/daAvqx2eHs65PzTr8+yCfbsQaSxtS6C32hRV0ScuVNc+vC4RKFeWR6fZFai/B6l9uzcbZ7YLTdOQQUWBjlq+QaR4UmMJipVm2n0Xl1mcAbOF5j14BHpB/vIuSJRbsK//k3CBTInKi88Ud8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723786; c=relaxed/simple;
	bh=KxDxtDM4hdJfAtxwrDcgsOBvP1L692ehy/n1/sUrZxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tvV/bcp8J6qDDX3lpW7fMQdmKIl1sJp2saQiuYhf5xRYM9Zj7K+O8Lg6+hSIn2MMWv01K2uMPlIfNW0nOEFmPcQVQSHcfbcioFCgzlyiWaoeokYyvhQlsYNSU9S5Kk2xpi/FWswOqQOY50mFVYhS3lP5VjzrzdIv7/+AgBhVbig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RrUC29Zi; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XM91ne7DM/BgIwdP63maSwRvKOPxzbq6gy17XEIlNrb1QRxdgn+ggmVbj0x8LqUkibSbUoBymSWuxgUqQMPQ4n43He4DmDT1yDcCjeMZvSUE4h526HkDOz8vjzWsFRyEB6llhwP5GxTRylDne8WiD/FE9IUJtVjlXgq+7KEIMp5xLu5Ij9dIeHqfPn1X0CGalMYHcwuZWJleRWheB/wM6EAIP/fpr8Hp0BQB9Jnt4hfecWFIaxYZD1kBWRYdouomgPQtFQblFndEuZyhhYv7Ypnak5NI9NHYlFLF6veFSsl61O5+BIUY/80S8EWHQs4wTcehiI9+1t1t2BHjS6caTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc4qnS8GL6TG/1RA+WhZAeDw1iKcEvDUV1t9wWCPGv0=;
 b=ywqI6bxjXxSLeK62+hyWsqiMQqzEHsHFzgVRPj+0OWOtwwISbTr93YhnWZALkJhAbE94rkY9Tzlstkd93kt5N+9xB+64V4HG/fViYUFsvaRKpzoffDF6GGNPdLczoIoQM4WWKvWscNpg74IidSH2LmNLiD1xUCN2MktWhXPtMZQzG60cE7aUY8kmzVebArTB/kkc9Q8vsq2bOir4gAZj97z6xnvZfM0lGODqoxIZgC08pbJenNTjimoZ1oUE5YgsKuLlD1rKfHR/vWM/xpKSz54rYrvmlHlN7dcQW+A/5JreIPisX5T8hnBH+lU+t8/QzqnwGnB48nj9x3otIuKtTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc4qnS8GL6TG/1RA+WhZAeDw1iKcEvDUV1t9wWCPGv0=;
 b=RrUC29ZiQQ7yZPeN61DcN1xglprMoiD+jvoPus/fPH/uh71dLZf9Va//fsuewFcyc/YJdDVuQJUizfYQulkbUvjmChqXrBOph2SYM9E+JJVErCqY7DgCYHMsjjAsZ/bZRMHRS35pAKpiOIjvYUU3u3T2Q7IALUyVLs829So72j90wK9VHhY/er8uCdAfLXOsMcLY4zk1wFqhh931Do0iNoacgqM/5l9ZtMMvPQpI+Z64afkXeUha+CT0/9QMMssDVIyK6ZxdlRpuyx7Hir3NaqgSiKlSUj0Y+Tq5oZhty8Ek7OwQMxXjxbEFd9Va8+61lwCCxTHVy72MYJNTo59oiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6874.eurprd04.prod.outlook.com (2603:10a6:10:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:16:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 15:16:19 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Frank Li <frank.li@nxp.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
Date: Thu,  5 Mar 2026 10:16:01 -0500
Message-ID: <20260305151602.3913147-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304211808.1437846-5-shenwei.wang@nxp.com>
References: <20260304211808.1437846-5-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0038.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd5a581-e788-4e90-e56d-08de7aca2704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	jgm2gCL58E9yliLyRQaS4z+QdBi0CVSQNWkcoZHw/x/rsS1u97O2+JZVHm7Cxhvd4Ayv9PdaO4qS+qjIKD7di8o/By5rI+Y+YuBD1+9Z9rmqPP25nZ94U+Ul/G0CDO9/9TGVcI5ao5GHNIoCsD7teqamFSL8QXabVElUZqukWf+bsyAlvchuT/je8OR39hKJ3mR/LJZs2EKd5iQSRLPVNn3xAtiW6+dgMoUzgdmSWoyON5Wm20XcSPboXIQ2k2/XpSyDaO+eK7I2pPpZs5y83Jpdudng9/MAOMU/Bzgldk+Dude0wnCXDVVTyzpqQsB+ocmtFo4ndWQvPq2QLnGRkZAjQth9StxrElGJm6+Oy6ifkst+Ijp8xTwKRjOlurJR/3qvqBUPJ3eF1WO4OkKwMZlVarNWzm0yxMfsEBFi/PmURutHg+gMpw0e/bu+Z0XPqJbDXg/cyW1g4HwGludP9bOaKeixOKLx6pYeM/KUc8TWfIXN3SdO11be9+iDRN/Z5nq5QOPcmDZIwisOCVhvBn11eVIs6Fx88hfdKLUodbRVDKzvsqzjw70Z8n5mpMg9nLWqWyNk+AEr5fenvgZ5ZapN7jTunHoFCUoGBWJzd2JDv4VFcc03mCnW7aOYgbjr1M9w7h7jmtMkEMyfSlQC95cfDxOVa1cXgZLfyx+wb0xP/TQxopfWm3KtzwnpGlvldqK28ZrhHqijWuQhgE+S4kilkmyh4U+DXNCCi36uA+Xiuzimf+xg1iR3OdU3jpVu/dc1WsmMEoxHfFGsfih6IWv6pzi+QrhB8EoV35IZi/87gsHLJKyJhNHhQZgO7T3/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?87G0f9buCU3N0m3mQ3Y62mChxxQOLKL/52zKogUPO8O+w9oyp9FqZXcw5LC/?=
 =?us-ascii?Q?dc4UQJBzXDgC4xAtVa4+BntvHwWbsKfca3+vFc3mEp+kIFq6UFx3VoWhUF2L?=
 =?us-ascii?Q?QoKPP+waRBH1jLLOPzJViyU8pR5gdamY1q6z6PGKNITy8oF47vL9cD+/pyGp?=
 =?us-ascii?Q?MPbW3gJ3u13rH+Z1Cpmx863Q3E3i5fKYe6IyRYk4Li6WW7uo4cXQLV20P4SK?=
 =?us-ascii?Q?XUV6e0BFz3D9rrPSGH7wFVEC0EijJkbTDW256Dg/IBF4VSE9s8Iv/GP8ktlU?=
 =?us-ascii?Q?bXLK5w8aIk2C/1CWwWYk5Kc2cMSoklQ9qA/0nilCFz2jAw3jxwCxJpobBZPZ?=
 =?us-ascii?Q?1YpOGObgpc16OngQWX4AzpLD9fdLEQBUAI8oBecssw6H/+gGsMk3eK9XXQKA?=
 =?us-ascii?Q?S12zDMp2SYUVnxzWmf6HU27+vjkQrd2s4OCoh6KmmWsoAD2b1ipzIz5Oa7Xc?=
 =?us-ascii?Q?m/oHZvzhlBIJXz4GgDAlvVGmCGd/AB70E4AoegpIk8ZWfBjSC+wjb4+BU9s/?=
 =?us-ascii?Q?ESnS4TApEPGD0Ugelhaxx8sATH63KYYBQdWNRrP4WFJlbq6kEQJ6BZTqqc3p?=
 =?us-ascii?Q?hWLJaYfiUHyrgJIvJJDtvJIk969lz8EDKrSSECe3+iN7gDoeNmOVHt9ZpkLn?=
 =?us-ascii?Q?HkOqRy6kwteKGSJQBIa4Vo5c6iLuRAWjPB/psVCguoOKY4BVF/1pnlIpS4nm?=
 =?us-ascii?Q?s4HqA3V93YKRuG7Rd6aSxuk65Cb6hm5I2TLt6WUUwX+Fvgg/26GRTmSPuSqZ?=
 =?us-ascii?Q?c1isDxXWoGaqCsJUc1NtF4cpQPoyR7kY7PWSFcF/5S3kAoKAzu9EJx8MLEsv?=
 =?us-ascii?Q?52HOpeHKgtDTm7CFPiXCbkgnX07TyDeHZwEhqhbumVa/X8WHO3BpzWJLiOGv?=
 =?us-ascii?Q?UCYuXN+38tTq1dxkUTs8dTfEpwL/jU38tlpuZ2/IVNS8r0OD0jG28ePpsYPC?=
 =?us-ascii?Q?N+qLzWBNVMegpkRtiutalcRVcivOVYQ+N53RbtlQjuYkOG/NEkLM1MZifLEo?=
 =?us-ascii?Q?rKsna/adQXQH2yd+f/YP1Uz9URNeV2FnrH4GixqdPgtPdI7y+8oLVwaSnNk/?=
 =?us-ascii?Q?iR7OXV190YqH577pGSgP62xf1H1+0JLDRFVS1w/HVnk3/o4OkcTJ8RUqX1S5?=
 =?us-ascii?Q?6LHAga7vLJNhFz2KzkTQpA5q4jkAozfRl6Fq59mI8aTaxNgz5JV8UixJCHRZ?=
 =?us-ascii?Q?3qrACYslSOkXTY2UAqOaQjy3bKk8nYTriF3i23x0wefpsnc9+4pQDpHysvT+?=
 =?us-ascii?Q?G7HTg5uxnmZg6RkSQNyqtylajgaHWV0SScf9YR+VyzQU64ynCtggmu2gVITJ?=
 =?us-ascii?Q?H/Ka+BMxJO6F2GWEDjA10vWbew++kykyYhgRy2FnhI7Zqhd7Aj2+ktz4SfK2?=
 =?us-ascii?Q?596TsBzQ6743wT8VeFC5oHmzIw2ZPcaTAzZ09+sLPfBVZyLRGuTb7gXFEkGP?=
 =?us-ascii?Q?LALv3cKoQi6+GC1TrFOvj6agj6skJ6YEJtz90GhGRU3V66HXQfFbrxdF63Ib?=
 =?us-ascii?Q?2itS7bjXfOmERCIE8rQUHk1/YKVZAwBKGBu2J35WIpXoKEXPP/LzG6RbBqMr?=
 =?us-ascii?Q?B4Qa1YniZBf9j+iaNwyHMSHHNTym0K5sZbdzF0RxK3Mj62HU1mKQCU7t5+4C?=
 =?us-ascii?Q?M7aXL2BBbZriFWORc6d9UsIh+6oCDz6KzfpANiqMsj19v4SRxS7B6NjoWpGm?=
 =?us-ascii?Q?W52qXfq/8qXc4Vxx27PU/TjMiiqWLNoffIYEF9B9+TIHqPPFyF1STzF0VeuR?=
 =?us-ascii?Q?5s7VBelgww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd5a581-e788-4e90-e56d-08de7aca2704
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:16:19.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ0LAxkzFmpUZr8d+pLSHnvHywCAj+ecoAVGjSzT8Ip+b4MThI+sNxh1WGt5DuIxA5+ZgqTNY0H7VednynsrjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6874
X-Rspamd-Queue-Id: 691852148A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32592-lists,linux-gpio=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[nxp.com:server fail,sin.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>


> +static int imx_std_cmd_map[] = {

AI: Should be 'static const int' since this is a read-only lookup table.

> +	if (msg->cmd >= sizeof(imx_std_cmd_map))

AI: Use ARRAY_SIZE(imx_std_cmd_map) instead of sizeof() for clarity.

because imx_std_cmd_map is array, AI most likely is correct.

Frank

