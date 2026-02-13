Return-Path: <linux-gpio+bounces-31646-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEH7CAy/jmm+EQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31646-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 07:05:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BC133230
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 07:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5D9D3013C9B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 06:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7984275870;
	Fri, 13 Feb 2026 06:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qBaxm58+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C52770A;
	Fri, 13 Feb 2026 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962692; cv=fail; b=eCA70/nl6sMvu9RbRV3dcuYFN0rKNV+bygv1Hd3H5S1Iy2hW2Hnz3yoYUOFj0qp+/QoahLUbEcJKNyzlkdZZbfnuf0jbD+85ReXgUVzlRwUStcBIdEqx7h08hUitL+QzquZRm/Rr6jTyd1q3yznMz3MJ8tE40zdkfN5VdZOcugg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962692; c=relaxed/simple;
	bh=s+g+6IyzrJPuBvgC71QjLvQce988n/6nSS8dIPgKHMc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgSNCzMNM6kQps279r8nkUFThD15ftO8Lh9sVNLK/jNK2MkWmDUwmcMWGtzzL7p+pmDdAECizzUYvRY5Yy7ZviX/D0Plve7bKlaV0QmA7d7zp6mBD6MehVZOL1qrO8ERe7ENUVC3OnO17iRfEf4WX080KSnWbIYgwCL80JQKbTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qBaxm58+; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhtPOXPTUDFmlXEskPdu5r/Gmr/vjGM+kHaq5/M8v6gTR5onWyD1Q6yEjvgo9bjwU+fn+f+mGCsDaqnNFwM1Vp9I3OBos2baD2CjXpMC1omUtMDaaNgkhmA5rXniokZ6oMr639EhbI8uXT0OpTP/cEM+va2ABWhajekPMEedChsggFuctSMRl1dTCvxXmIFGJtcYkrRv64r5Ck4UFcxwNYftG8y7dbTqW2yPI4wgD6qslnBMz8uLT+M06F0xs90Qt0fMoCvRmrhQOBnMlqsQF4YjNVu3i0Av7atyifMhWEqpC+z3ihiQm0Mrmg1n0VtD04kMs7MggLaMlHiTm+nneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3BXHg6m5DZaC+w1rVHc658atnm9fwSm8DgRSQtpDnQ=;
 b=uPp9NnJFmjM2uGZRFBnnbvJaxgbiH1zhn4R5f4Ihrw4yOeEh6Bpi6Q4ON8/OZNvQbdXsvP7ZLsHJrkK+bwLofFwRPdhL+ZOUUFOV6363n+l51UotU1d7B4gpdfONq9cr2lWEyBfMfrmsOPSZ+ZZlHm943e8Od6cReLL1vLdlxjhxmBvqn2GnyltlHiIqvKz3I2zva96uBaveT5+ctBoteryfljRTHhHubDO2Md90PzLrjcJ5HXCA9eybkqTapkkUQ8t9Cg+yVMmcftKimUechsYA1nz75tKu4i7WsTeIdJsMgz82qy1AEgjWvl3GAfGncR4yGqc0qXFEQlOw7d3H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3BXHg6m5DZaC+w1rVHc658atnm9fwSm8DgRSQtpDnQ=;
 b=qBaxm58+Zx2cF2DHdQVWIKEODA87cntx3HXWZdsp6cSGn0mkHN53+Ib0N6c4Vt9dOrLCbftrjpvPw2kmxIKqJWGt3+YbOQw4ducA4cI6VdSDqJrhY2ENZRpOR0+2vhEuyiM/wyWVUBsdGXjL6GrknbKXizKQUeHnvCp5OiUrMmE=
Received: from PH7P221CA0074.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::16)
 by SJ0PR10MB5833.namprd10.prod.outlook.com (2603:10b6:a03:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 06:04:48 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::bf) by PH7P221CA0074.outlook.office365.com
 (2603:10b6:510:328::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 06:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Fri, 13 Feb 2026 06:04:47 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 00:04:31 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 00:04:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 00:04:31 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D64TGF655599;
	Fri, 13 Feb 2026 00:04:30 -0600
Date: Fri, 13 Feb 2026 11:34:29 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>, <bb@ti.com>,
	<vishalm@ti.com>, <vigneshr@ti.com>, <sebin.francis@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: pinctrl-single: add ti,am62l-padconf compatible
 string
Message-ID: <20260213060429.upnlpbz4q5pvwp3e@lcpd911>
References: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SJ0PR10MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 08159a5d-eb5d-48a8-9953-08de6ac5ca88
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+uK6VJj3kLNFCbaHMJER1zuoogSXLWVN9udbdSYUf+Mo+/rjX1FRR8SrAwcI?=
 =?us-ascii?Q?XRwtlsX7yUAti/Zl0+q2/sYAUtyPhM0fEi3921bqZf7fmoSQp6rj/H9cR8ft?=
 =?us-ascii?Q?6+sbpAVte63fCefNsCT3geq+BJKkvPQ2itrcn735cS8ALF8Tc9RFJvo1r/Ak?=
 =?us-ascii?Q?n1aujry+H4Hn5TcLWBsQSQPn3gZui+Om/p1lC3Nwe8w2rJXvxQMQ3Sr7dcsE?=
 =?us-ascii?Q?dpBLFITqYMtwBTw72UjDe2WvAMziUcSbNHDaWWPnwFGasEhjqWtrYKbQhFMQ?=
 =?us-ascii?Q?hk23KbDnmiN9OkWSunoHQEqDwaeFQmARPa3PSfFfUa1QGuNJmVGr+kzQhTCO?=
 =?us-ascii?Q?rv5XHA8e+Gt8nTylYcVVdvmoBiPONV32mC9w7WKj0zQQLvsH9SNwsq20IckD?=
 =?us-ascii?Q?eajml2Wp6CmtOL/HIOPA4fG3Htu3kKnRDcVzMwTFJcVKVJA9Zdp5J1gpZDDm?=
 =?us-ascii?Q?W6XpvYGr3cweKegBMahWOyS7ai7ysT1+AngZuNEqqQ/j2B3yPR+lLAff7QVt?=
 =?us-ascii?Q?nc2/WYzgh+8aYJIHjt3QHw5rNghMMCcf21ieG3Y9FOiglFgOUofvxqeNoYNY?=
 =?us-ascii?Q?z/CyHbVN18dBOLjpq+GPDVH7HJzpz+FDZs9rQwS1H8oMLsiqsQ1VUTndWzy1?=
 =?us-ascii?Q?87QkHA6/J6coS1a8vV9Houz+JfY9qH7xcMk8NqbJHPpXTaxF9IzibW8iwV0W?=
 =?us-ascii?Q?IS/jrUSpcWsO6OldGUe6wWZsoyS35EmqWVwxAg8dYIC3rliCETPpVJ7L73uV?=
 =?us-ascii?Q?lqk8/s8Ev9p7FX83duDP/XX6FUtWkAK4GdOWe5jECg1VR89ZqLUANvMMHwbQ?=
 =?us-ascii?Q?VV4/YEsPuV7ZGxayCY6wtyqx8OMgfYgvxIRyIcTxUkM1xDmllfLsXYykIZdc?=
 =?us-ascii?Q?kO/Uo8kPvJxhby83dqppp8j1DOI1kPmL8xwlo7/2j+UNMBUYFgc598Iwuj7a?=
 =?us-ascii?Q?9oPotZUJB1A7ds3vTlCZ9DTQJCFH3F/paAmpCLXV7PhWoGy3MnehTLI5BzeJ?=
 =?us-ascii?Q?UzOzl2wrUhoGMXi/XH38jPepnH4iGTueuAWPGOacb5Ya585EW7eUIe26y+Ky?=
 =?us-ascii?Q?fC9aWuIQHTEpCu1/KlcUd+owXEl1/2KAOVefqSJChZi+5k4bUiMn4dPkgOX6?=
 =?us-ascii?Q?ntfojP3ggRZSVkc+ywUR0vszPYnWvhugn2Jr9CmfaP34f60IZiv5AxXegYFl?=
 =?us-ascii?Q?yrFQVxGndVtV5boftKWFaw3LHE132lInjrXByMmv1s+Uwl+SiVg+oJgJnp7Y?=
 =?us-ascii?Q?xf9AggthMd02wZfw725L5yUR+nKR1eYfyo3mvjkv2XTHx2UWDZW3Du2Naqw8?=
 =?us-ascii?Q?++YTyI9grwOrW8xFpvfAU7ltq0MjscoK5oHwnCpFCu9ET11vUujxRiBHUJxo?=
 =?us-ascii?Q?3B+3q9uFKNVXPlXuYn8IGY6/8ohMSYloeISpBHxQZSy/nwsXMYO5J3PQmPRp?=
 =?us-ascii?Q?vONrsJAMUlYMtEW9Zz/OdoYeEVe4UNO1JZ3bzaEivLo3lqBKzTadTxVFsDVc?=
 =?us-ascii?Q?9GjdSfD9bCez0pBMRJ5qeZXcN5iAwK25gYGmywEklHbUnp+gRsXiTLBLDbrL?=
 =?us-ascii?Q?45NjxU3NwGtmbAcNEL/ScZPsmOjGMDgJN5Oh1ePM02Yrd4sp0e4XeDt2fNpn?=
 =?us-ascii?Q?KuAypuchFUyRcaRS2jWYap4Vp4O7DGm4OnwxbxYU0+F9mDsPPGIKwAYgpCU7?=
 =?us-ascii?Q?ZZsBYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hdNVSeuo8VowyP3HCmr73uJ+thEC0yPswinYwwv2TJarMaxLjCep7Yf7Z9i+N1COk3f8yEGo7+2+BnVz6mdqrtJGZpR0R+h4BR7kTynixm3vj5iT489iK002yQIuyl0Uy7KdA66DCU+pxK9trWgGmCfyBBUxoqpaD00hEcw1zyOAjSlVpwHKPRnosTQcNhL/XeNGsFeN5MRq2tWnTkJbIoODzVFbjY1Lo9zpHQY7e/O1R27g+FAPm7Joc4+CeiGZcuX0T1WFmizWmRq3xY0XbirB5m9s5OwIlHiq8cFGPrnhuYBnBQUBWTc+HJvb86r++NiwqhhG6YwfgVFRx4q9y2hURXir5MWiqt+wh9ECGuPcyx/PuO2Xv58KC8cLowG3WRjcLX7DnOnWpkvcWNnNkyarUPIdRuVoEfj0XoMjNfCxDzUUKkLlTXveynv4cqVQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 06:04:47.0915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08159a5d-eb5d-48a8-9953-08de6ac5ca88
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5833
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31646-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d-gole@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 167BC133230
X-Rspamd-Action: no action

On Feb 12, 2026 at 15:38:09 -0600, Kendall Willis wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add "ti,am62l-padconf" compatible string for the AM62L SoC, which
> requires register configurations to be restored during system resume
> after suspend to RAM (RTC only + DDR mode). This reuses the j7200
> configuration which includes the PCS_CONTEXT_LOSS_OFF flag needed for
> proper restoration.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> RTC Only + DDR is a low power mode on the AM62L SoC where most of the
> SoC is off except for RTC, which is used as a wakeup source, and DDR
> which is in self-refresh.
> ---
>  drivers/pinctrl/pinctrl-single.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index d85e6c1f632186b36e95b0b1338a7644ae751f99..288c9c9bce9a5b1cdfa96f69e6a104152439789f 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1980,6 +1980,7 @@ static const struct of_device_id pcs_of_match[] = {
>  	{ .compatible = "ti,omap4-padconf", .data = &pinctrl_single_omap_wkup },
>  	{ .compatible = "ti,omap5-padconf", .data = &pinctrl_single_omap_wkup },
>  	{ .compatible = "ti,j7200-padconf", .data = &pinctrl_single_j7200 },
> +	{ .compatible = "ti,am62l-padconf", .data = &pinctrl_single_j7200 },

Reviewed-by: Dhruva Gole <d-gole@ti.com>

>  	{ .compatible = "pinctrl-single", .data = &pinctrl_single },
>  	{ .compatible = "pinconf-single", .data = &pinconf_single },
>  	{ },
> 
> ---
> base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
> change-id: 20260212-am62l-padconf-ff5f6050107a
> 
> Best regards,
> -- 
> Kendall Willis <k-willis@ti.com>
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

