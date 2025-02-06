Return-Path: <linux-gpio+bounces-15433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B126BA2A55E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 11:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2B5188315B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF9222688D;
	Thu,  6 Feb 2025 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nXhcYHv2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1B226878;
	Thu,  6 Feb 2025 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835912; cv=fail; b=GisCeHIMz2eGjA0U4ypqsitp2AgHv5pSBXeJbnfqFs0qDoRn0oV+t4cLJ1LeZTHxt9yjs6707iBamzgcfS9cG1q+gXoa31goE/5Fq5dlz/UUBn/d+eaDBMNTebWBhf+BwDueY9iN+jrzA0Ftsa9ydBKTObxYzU6WggiND/z92WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835912; c=relaxed/simple;
	bh=kChjqutRUGYkUumpw/h8fmOLmNepB90p/LT2eSdR+KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d33ktiyyMUYmIJY8GLRV6c7rYqOME4tJcpu8x/22RIpOfYvcjKZ2xTqRe4L0RgtcYdtCUoLTd9M18N/OJ21ukqKZXMWjrab2C5GO6aEDClbn40vUzPIcza81XUMYXp3m+zx1KJZGLdd6CxGhv1aPpDQ+sDjV5ihKmOvS7ICiYJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nXhcYHv2; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzGInBwl2JMHUAvr6E7SbENibqXvJZt9h9z4iJdlLBarSM9Eig5T71Tv+1cb0PDNOxcfaSKn+kX1Ainjxs5MciSQtW+nJPF6Y0q4fvSPMHSdzv4S8panU4QCHkMhLOf4oBCXBa1HZCvtzsAM7Tpn5QvJxr+zLyym9SAVB180FLlhAxMcO36HW3S+ADF4ORqFZIeVfBHGfOXC7BW+WfUZwbGXxT8dDTldz+UHnEmZ9M+B+9BHRsD0vX+whQ6eMsy67OE+suRxqSGZ3+Y3FE8klwIEgcTarhFu6KVLprOEtKAY/+8T4KJ5eTDi0c5yZwaT9lgK7cs2gE1P3jsn0aI/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=herqS5ZpOiKkJmYeUbFdkDpklIp4T+4NTCWbPrKQh8k=;
 b=Eo/psEZv9eKMweviDfHRKcWYmATJXYZa8vFdfKlqDpuCCmxHQCtPObL6URPRuRbQ1+mA0ptce3AJRER3pNYbuPRRtPrDifxOEZtLj4yRh0lVvWG5ZSLPY8RtdSNflk7+v+WsWCZaJUXSeJ4yuivDt1B0qOXoKBqltD+sYih2Ymc3xdpESp8NICIAtWS5qLrjAiVWJDehuru9KmSyPf3WDNkSmsSVJ5PNyRPtjr5scJjm8rp+lmm2aiz7PF041B3MJzqVPVaRap9uKzikoSN0pXFWdotAwAf3QqtT6xU2XuZhth+skUOE4oKDIyTgrVr6QIWooNnyqYYbvGYUxxCglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=herqS5ZpOiKkJmYeUbFdkDpklIp4T+4NTCWbPrKQh8k=;
 b=nXhcYHv2FipSaOGy+mYYFrORqXogXe7MqAgoDPQczMJBb6ZH5eL9v18+vKI9gR/avJrPG5mljB41lE54seTntLsNzPkpI2LrVs/vnGtlPs1ZuO5VI35FEyK5dp+JDJ6L9Va4gOKgC5RHNY6XTpRiNoggq/PvJfzkvzDe1T3N4+FpIFmrqCPFtv347zFvI6oF87VtCRn4wupcTnx7SGYFHneI7YtiAEvkrBEP4HphsEWlJL2eXPbY8eBF2x9FbEh9Y8sztgRi4DBD8RpdWFEpTIOKy60HWzm7ilCPdhuzRFZxntXoupluE1uQWACMwuQrlHCAqZ9aYXesHi71FXyZQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6777.eurprd04.prod.outlook.com (2603:10a6:10:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 09:58:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 09:58:27 +0000
Date: Thu, 6 Feb 2025 19:05:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <20250206110508.GB22527@localhost.localdomain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f384dc7-2371-402f-2dac-08dd4694cd24
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vvMLdK2ksPEYOI038QvHViHvdnIJL2taMuw4o24n5PWReTZ3XiMK6UXhNQOO?=
 =?us-ascii?Q?1HoAoaUohfdCrWNpAaezxof4uX/PZHXzk74zprT/ie4NHXirIDtwsoFb97X0?=
 =?us-ascii?Q?OcQN+Xms1efm1NlJBJl6J4TUHxlEwmqgv9TL2vrqe41MIzeEagwlwv2iJV0+?=
 =?us-ascii?Q?7wjtpIAaowRBFq3wqMd4lzaCbXkrONcHCyyT9Jl2g43arSlYwWtTGZF1mg7l?=
 =?us-ascii?Q?hU9Mn/XRnlV6vcjKYW/Hp7jxqhvuYdQLsrZJ4kHv9jwLgAraLW2LRGR7rgur?=
 =?us-ascii?Q?7BrcYtIQ70w94pMozRD9+tMKQq9XjDwd+xmiCHFNxEpZPBkEXdDMfXtZ07h4?=
 =?us-ascii?Q?cea5C7Z6PNUf3O0ExWuIManoU1N85kQP0g6nUVNVTwXiFhpsEPhEKqO6LUnl?=
 =?us-ascii?Q?dC6TNK3cOHvKpFsSS3H+DLwAhsknJ0ijFmfFMZZPg4dbbwvsqwMy8Cb4h7Hs?=
 =?us-ascii?Q?U/JSHN0qGXpHAOXTc7GBnWNnTzLm8k/1yZRnEjn/FkTVb+Oamiz9/vMRkDYF?=
 =?us-ascii?Q?cwtF+o+xvqcmbI3lXeNV9CtHadneoKRdi3EWdpKj1THHf/+MHT22/llobsgM?=
 =?us-ascii?Q?IzlqKVrQ3nyKg3I2kh6i8K7cSbGbg4umlhalQ+yTbWHS9eZJ8B0CvRJYUr5Z?=
 =?us-ascii?Q?lTK+O3Myk11R6dO9JWbKC9WTs6STzNDoRDp/o2ro5X9U25QyXL/Yx+/kfhlp?=
 =?us-ascii?Q?777RoyPceYZLGDEzhFgpOIJZNx0Hil/rg3tRbSbs7hHDcgFAdHChUaS8BOrI?=
 =?us-ascii?Q?FyJ0kFZ86ylv7dVwc+9DlV6KVoKUIskyhJhd/lyO/5OBvPgRm7CR7uKYVihF?=
 =?us-ascii?Q?SUD82hB/rs1PNAWXgt8FKa1KEbt7ZsXc9VetAFWFfe6/zkpmbjimLNGqdkuX?=
 =?us-ascii?Q?raGMScX9H+a7VCbQezUyXV20+eZNkiaQrwWWGU/dPMoiJENGhMKQ4eV+bKs3?=
 =?us-ascii?Q?gZnSOHq2wGMgmJOYvWcXrWzHFLOlxGTLHRCALgF+MzNCzP+wcJmrFUYtYOpa?=
 =?us-ascii?Q?Pz+2FZl+hjKixXN8sDdSuzg2JUwzjnmPIp6S4zzBKPLJX9oZzPvyx6W68Q8w?=
 =?us-ascii?Q?son/w8YNAnl8sylux5VwqxhXWSafU/pEOegPStQ6dVmDrmgiCainWMl8F42V?=
 =?us-ascii?Q?P7vqbWawfudxWyfw3nYG/KDGydi8DZc5bBl3wePU0xNQdNpPjpZZqarRaUU5?=
 =?us-ascii?Q?1rhX8d0NfseaSk9hMIBqsaCVd5E8vqhO6Di0B71acbBgs1K78Iq8QybCBi0C?=
 =?us-ascii?Q?Lv3JOpgkcbUva2STA8eatNXdO+Shx1Nf19ucd9fLukFGmJ+XAmv6EjCVJVp1?=
 =?us-ascii?Q?0M6o1RYJhC87rJoUmNZt12Y4b8kf3/k9vEmW0uH9E+dLrvWqh0tLirjB9Rao?=
 =?us-ascii?Q?3aevdmYQdTwuHXM1f4WqeZnHbjnqqCkbGnHGGxmx5YTy+cYCSBGB/jM82MzC?=
 =?us-ascii?Q?4331cME5Dx0gHVUAXv3ozpiU2lt9TOJ7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oPKxJw1lCaE552ZKn070oLsKiT0iWXfBKNQ+DuWj4Raq/IZK5PG6NWQ32igr?=
 =?us-ascii?Q?vhA21ZZzG6RYrs74FOfhzjfkkj1r3dVd61hnJ4JO7cDHtLk0iWZgHx0JHF9H?=
 =?us-ascii?Q?0gyiCe6zePwzCfnzWsI3Ui2+waVDcWz6/CREF82DCFJtQ+yH6M6bpOWjTXjW?=
 =?us-ascii?Q?idpfjEYw4GoGZaGTYVGsxRS9Pz2EsZe8qRELdCsLwZ8DZ74JY0B1TXVkxHBc?=
 =?us-ascii?Q?A2Z7a5KExUBUR9eRHRl56ITEl5PtbGpV+gndB55oU63dOi8b3UWNCEvpsuSM?=
 =?us-ascii?Q?FtujiCGF2DOFJ4Hl5GQ0kiv+6nNTbkdqcUUmfcdVt52FLzYokxywIVsaYiS1?=
 =?us-ascii?Q?kfzvIwLOzS+2BDoNr3IzIBDw2OXrQ7RQ8JRscWfNBwoAXdT/YJYNWTPWCn52?=
 =?us-ascii?Q?QRF3jHjaDniU02rh7LGojzKvYSr/yW+dHglow9ElFNW3urQ8Uho3j16wUjAb?=
 =?us-ascii?Q?R27N8yjU6Z9KM11Tgb2xL99TQdHhEDdnLLFmW77VsFppoH7lDjUbL0C1TudB?=
 =?us-ascii?Q?9bdIAaFq7yhX1fEs78ldV3YoC59nq6UC+XmaspehRQcWmzt8wZ1J8dg7W+nu?=
 =?us-ascii?Q?2cCizEzbKMlxwvhwxMBaLzAwogxlyAXbeD90OWBsJa84redwZS0klkw7jMYe?=
 =?us-ascii?Q?gO4nRz19dD5Wad9aHn1opVUrPmVhd65x1k6kSELLj0SP0ptNJmoxIdtedklJ?=
 =?us-ascii?Q?mX3zPRN2C8YZVGgSRrhv1ka1cvfZjryWPww8lHcUS+R6+OfTHNiu0vB+wI/f?=
 =?us-ascii?Q?31+9EN63mtQmSOG2cNRgYQ7HOOnmL4YnPrFEI8R3MggoLUmKQlsgIhnx1ytr?=
 =?us-ascii?Q?bufrCtHAuwsOc/NUQnQ5Uh81Mj2YIKWPDVrIQbA1u+J7Ndlhrl4938yecnrd?=
 =?us-ascii?Q?SidLlNY9uuwLtd3Il6MwgQAQVBvetZinf/Kwd8CLhWZfAuqon44CB4DtJEO3?=
 =?us-ascii?Q?jZHSIbWzJsTW16B5LWVSoNOpjZVtbTV5IRZSS8ASo5BriWB4YdyoxG1HreXK?=
 =?us-ascii?Q?dXN0C9vfQu9RCa+QFkKYqgKYoEJVB2seqwNhBGF6ZZOxmBHbXfKdbFVZl/gK?=
 =?us-ascii?Q?srxy1liIngPL1sDz3NZ+sFvQ5dDraWEli+OtYkhckHn6GF2vkR6yyb6Df6Fl?=
 =?us-ascii?Q?f/TOdRixufu/oTtTU907OOcv41MCpXE+4kUXP34iDgKQZSwSQJkQ52TY6UfH?=
 =?us-ascii?Q?NEO2OQTTBCZEhO0AkDw0G2mr3jEovCyDshDw9rJxs2pshuyyaDFBbLmv6paB?=
 =?us-ascii?Q?geixu2BhbaqUOlsW91fgulx0WVuchIcHdlRH4Dai65atg1GBVl2vAFWq0APj?=
 =?us-ascii?Q?39NWdnVHOc/TazC9fzqjVfGwGLYAbXzHHFJhzBn1wsrGgLLYm6S1rYTAcSeJ?=
 =?us-ascii?Q?PR7kRHHs3wZ5x5czo6uqTsK95OhMcP2k3kvF+WuJ5o6hKk9Lj4P3yrDfrJuU?=
 =?us-ascii?Q?Ia2DSo5AgoO36tvKjCZ3FTX22zdyrWLQ4wR3mEuRTDMXi/me9dFICa6zPEmP?=
 =?us-ascii?Q?ALRLiPWkYvRvSXiEVec9s4tul3TJ3+hx69QwqpLKtV/o5TExvizz2aLsxgsx?=
 =?us-ascii?Q?p/BBP/3DgRja3H1EELi6b3fKO04fJhCl/OmqsgTA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f384dc7-2371-402f-2dac-08dd4694cd24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:58:26.9673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MhiYNAre/btuvl+pn94b+mE400h4+Qw0W1u+z0XoEN+Sr81XTLtfTaUPGBcGlDryTtA8FDqaGX7ryOoBXfS0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6777

Hi Dan,

On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
>On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> There are two cases:
>> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
>> If both drivers are built in, and the scmi device with name "pinctrl-imx"
>> is created earlier, and the fwnode device points to the scmi device,
>> non-i.MX platforms will never have the pinctrl supplier ready.
>> 
>> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
>> With both drivers built in, two scmi devices will be created, and both
>> drivers will be probed. On A's patform, feature Y probe may fail, vice
>> verus.
>> 
>> Introduce machine_allowlist and machine_blocklist to allow or block
>> the creation of scmi devices to address above issues.
>> 
>> machine_blocklist is non-vendor protocols, but vendor has its own
>> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
>> machine_allowlist is for vendor protocols. Saying vendor A drivers only
>> allow vendor A machine, vendor B machines only allow vendor B machine.
>> 
>
>I think patches 2-4 should be combined into one patch.  This commit

They are in different subsystems, so I separate them.

>message is a bit confusing.  I don't really understand how the
>"fwnode device points to the scmi device".  I understand vaguely
>what that means but in terms of code, I couldn't point to it.

Sorry for not being clear.

The devlink framework will take i.MX as pinctrl provider, because the
fwnode is occupied by i.MX pinctrl scmi device which is created earlier
than generic pinctrl scmi device.

>
>> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
>> With both drivers built in, two scmi devices will be created, and both
>> drivers will be probed. On A's patform, feature Y probe may fail, vice
>> verus.
>
>You're describing the code before.  Is it a problem that only one driver
>is probed successfully?  I thought that would be fine.  What's the
>problem?

VendorA 0x80
VendorB 0x80

If both drivers runs into probe, VenderB 0x80 driver may crash VendorA firmware
if the firmware not designed well.

Not big issue. I just think we should block the probe.

For pure device tree compatible, if compatible not match, the driver will not
runs into probe. I think scmi driver is also good to follow.

>
>It should have a Fixes tag.
>Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")

The issue only exists when devlink is forced.
I would like to wait Suddeep and Cristian's comments on merge 2-4 into one
and add Fixes tag.

>
>Here is my suggestion for a commit message:
>
>  We have two drivers, pinctrl-scmi.c which is generic and
>  pinctrl-imx-scmi.c which is for IMX hardware.  They do the same
>  thing.  Both provide support for the SCMI_PROTOCOL_PINCTRL protocol.
>
>  If you have a kernel with both modules built in then they way it
>  was designed to work is that the probe() functions would only
>  allow the appropriate driver to probe.  Unfortunately, what happens
>  is that <vague>there is an issue earlier in the process so the
>  fwnode device points to the wrong driver.</vague>  This means that
>  even though the correct driver is probed it still wants to use
>  whichever driver was loaded first so if the driver you want came
>  second then it won't work.
>
>  To fix this, move the checking for which driver to use into the
>  scmi_protocol_device_request() function.

Thanks for your patient on reviewing the patchset.

>
>  Now both drivers will be probed but only one will be used?

No. with block/allow list, only one driver will be probed.

Thanks,
Peng.

>
>regards,
>dan carpenter
>

