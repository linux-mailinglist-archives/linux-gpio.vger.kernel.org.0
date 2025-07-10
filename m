Return-Path: <linux-gpio+bounces-23105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D531B0086A
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 18:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6B54164259
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC4727A131;
	Thu, 10 Jul 2025 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hQsyNjW6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFE27145E;
	Thu, 10 Jul 2025 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164446; cv=fail; b=KsLrgYCmwt2hJHtVBWB6kLPemPGbp3PBFp8l+lyA2bdBghfr+BwTt8hlZS8HKO/MMPCReyzvLCQMW4NMq9u4CM98P/zKs+juggtQFcmtIjc3cF118mOFTUDujsW4oVCobTWkVUqcQdNl8Vj8NrWu7LEDtZxc+LMuDTippyw0yHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164446; c=relaxed/simple;
	bh=sNMxvDmagsqyemeuy1nVcZ7VxPAfEEafoad4kAweVDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QO0kJHpptwUJpnMuGVTN1FUMd5Y4Xy5DAM7sClEw5qnI21RnB+kNmr/xF9sGJdKViIcWsP5Y8GIFyUwtNHhuIiAypWTaZOmz1u3FDFKagOtMvrm7SE2GhWSv/FJF5tLfo0a5vVpyJyjB482qmdptIiJG9w5FAkBInbZGmxinGZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hQsyNjW6; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uy/xkIl28aU80+rOxzcqC0LTPxdn1pfuWrZlxscobdWd3w1hw4WnKeBrIJfzM534spP0tfi1QNmaaWVc4yo45lgUFXt5G99RLF1wKKVpjhMHg8BGZZzF1AzuN5HuBWbx45h9wHIoWDEuhi5yT1ksVcUkPORilpAUTMwodB5qxwAoljBUAwJ/UuLYmPddThkFyHgZTYVPmv+scjs6U/rme3TzkVukplH/4FeYwlBPsStUnII5W10Wzj1Mt1lPsZf81Ischb1nXuOaWj0/M92OWFcFjkLjgW3SUjQnOGlLqB5sy9YvA18Jp4bKIXeqqlGSbPGOWY+2yBYYO7HxdynIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv6rY7fgyqRQjWObwWToC2PW+1Tddtrj1Pe5VTTOlt0=;
 b=BooVwm4m/oR41fcJi6T0CwhQGriV5/LsVLvsk4Qg/2k91e7Uf+r/X+xV/+tQzHClrvm2YtinhUQ/AVSPzElwZb8LN0WcoLTkCy1VCm+XW0ldZZzYYgZZ29afbZxp8iZG3s+8gERDmAJDVEe8TlDV3pp4c1uXr5Yses/KThBNwvx7/1oc9mcTXqOoJo3HkAj5SJydXRbeYa6hUXJubjMliocqOU95O1ZWsBY8P82WmceDuLAzcmW5aKIfXnZS+fEwk/wMkbaV8uHwDJYQPHcnp4B6suuD2tvyPgdfpd0rTKlkq8I8AYb+ApHAQ48ZMKEhKplBqK0z2jGgDLyDJtmviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv6rY7fgyqRQjWObwWToC2PW+1Tddtrj1Pe5VTTOlt0=;
 b=hQsyNjW6eu1jDtXYxbi+Azxycd4Z8/wPV1KJvrl6tM5vJAjn1d06MHBz6+NpwdqMAOCnfClcVi4pOs5k9amPaLvCCY29JtFreuDfYJ1dj+jJAAClUzpXSWZOxhTSRTlNdgV5O+AwVxKinZiU2S6pzjdfLxV77qXDxRk6vonQLwMx1OTATi6LaslaIswE9eutUlqpOSUackjQW6Zu6Y1QERj+D7GhUFFyVNETBlxYzVTLsKtddTTB2vO26LYcv4s/0/+5Lt0RNv/u7PWdNDKoIIzXwIgRcAE3Y2bczPVKQ00aE94F1x7A9zfHz36DM7v712cLa288vAD0J6B/cSagug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7943.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 16:20:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 16:20:40 +0000
Date: Thu, 10 Jul 2025 12:20:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	ping.bai@nxp.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	srini@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
	echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 02/12] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <aG/oUTQAyRwc3/ia@lizhi-Precision-Tower-5810>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-3-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-3-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: AS4P192CA0045.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 030eda1e-f339-45ba-8d82-08ddbfcdb631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vlOYVQuPpJ8oIDe8qghuWxAxZ/xRjvvlOD17uP8iDMubD2HdwDbm678u6XY?=
 =?us-ascii?Q?AGu2MLFTUmjwmPu0PB4joBV74v1yUJikCfgEyl8wotHwlXKAPCM1Kk9/2vDh?=
 =?us-ascii?Q?diWUJUJRW5L6jzGXRVmu8RFnJNeoPZnhCRcxDSIAd5LCtMYqd/yUXixoZ3c3?=
 =?us-ascii?Q?Y2+QeqaXXVShrLfc9exgqDFZuEyi1mzkJ3a+Eny+exmgPHBnqm0wBm3Mk9Ee?=
 =?us-ascii?Q?SYv85EPuYuO9RZ0CI509J4s5BRWsrAjSoJFNOXcs79bKx84P90dxHQX0lAFE?=
 =?us-ascii?Q?dYkcFEmS+gc+Z5s+aVLCC2eiz+cBeTiWLKmzJ9XtRutZe1yBicgcNQ3oD4OO?=
 =?us-ascii?Q?9dSwaJh8oka16l3ia1Xj5txSbtzTWec3OJ14js0QZQLp6Ln0eecGgkm4cFSn?=
 =?us-ascii?Q?tocmA6laRwNBHNz4fj9tZpCDDrUhhi9Bl404sD7AolB4/EvK8wmFZzhtpDWI?=
 =?us-ascii?Q?XgP0PV9mj1ih28SdZtE+j99wvYKLdwAxwdUDiCtdFDFuLgyHsrL4arboI/Mm?=
 =?us-ascii?Q?N+uW+u9utr2UFbE1SeYyo46VSqU5L80bzdL3oVorfoaQZesdjGcJAWSOAAo1?=
 =?us-ascii?Q?PiX+ZjC0U0Xhz5aPNwfMfMn0Bpyow4OxzQQXEczE6k229UvO8AWLNrWfQF5S?=
 =?us-ascii?Q?kvYD/0aMaAJnAwhwg5Y45Fptklr6Uc+09I4g34YkQvR6vcJeT9UfKRfj6Gb8?=
 =?us-ascii?Q?kXRKGZG9sLiKDMYHmk4Gocxrr0xUMtoP2/6BHC3dhv80mLKRRRZMDYKktKwp?=
 =?us-ascii?Q?HG0fqF7agAVAC6b+IMqtoX0TdY55KiQAFQmtl6vBTX20fCBxYtReKGRyRkCm?=
 =?us-ascii?Q?eT+R3VRQnRRX7W9VdP0j5lTjCnJTpuU+l+HfNbGvTnbNdxAdNxbl0WSR00Ws?=
 =?us-ascii?Q?xt6m+N/wyN5WA4wCuhVmQbkFwj5Hs0HXEJz/i5is/rrBhYi6JsQeqXCxRNlq?=
 =?us-ascii?Q?K2+TAGYCvDL5+eZUjUqqsHuFaMaNMeIzRzUBOSu7FrkHuLhVQvSB8ssO+qV5?=
 =?us-ascii?Q?a6uHUvi6qlptv0rQs26TAi9mELFmcVxuv3pWKvl0zHGy355fvS8qhacyq3kh?=
 =?us-ascii?Q?soRASvi+jIkrETYCjod0zF+q5ogmVpwjxyoiSGQ/diaapnBIdqeW7Gt8z/Oz?=
 =?us-ascii?Q?ml4mPmp7XHbZmUlu+JJGkpQP00JV9atMzSRvnjJRkPU1R6zVf41d8Anjy/f5?=
 =?us-ascii?Q?FSEaj4g0I9gB7hkaPBZukTgu0nVqnoN9KMcVK3z/VfuqhF7TxuqXtnfuEJAR?=
 =?us-ascii?Q?gdmvbEdq7q4ubvJegWGbUc06RIwSKWMfo0dUh1g7dmE+0B98uokzU/JeMUcE?=
 =?us-ascii?Q?lIKRiMsCYVkCkne0ukwnaXngWtXGttIdA7cGGGGhFYUVNE1sCGbg2kFej3Tx?=
 =?us-ascii?Q?U2SpXU7CSCt5GJCCzuD+877lpPawuiynOiAkSZWV6lszpSDTcEbnpxIBXa/u?=
 =?us-ascii?Q?+yLkpeLC5joKLCWaZVo/sGV/4p97P13ZvHMaE9ZfmfxEwZfH4qnjZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lg3WARU9zhUBtbk/ATfBDNNxoXiq/SjOUJrpxCZSVv7pBcP+MjY+Og68gqDY?=
 =?us-ascii?Q?diNL070iZ7YGXyETzbvR05s9yeXpusqIflbw4SrbWUeBD4oR7s+WX2Y4ZLRx?=
 =?us-ascii?Q?wQsOCIqWA1vkNnELJKwP65H6OYFE272FT1wVgU0QHZ48MnKNmIIRZkSfSqqc?=
 =?us-ascii?Q?EQZmGjE8BPwm2LXdQyRrhR76oCF8032MXWjJrmKY5TfyYAVSy2Yq23Fj2WDt?=
 =?us-ascii?Q?dtDrH9htRL8z4mbfm0PIPrMjGJsmGycOuPVAGtH8XZaCdSbTqhSDbnpjSKor?=
 =?us-ascii?Q?/rYIDn5rPUsHQEY9fnxXgrcMzBhlcDeLR7ELkqe+sR1+iHtjZQL0gm5Ou27j?=
 =?us-ascii?Q?pndW6IpNJCNpYlBy6LdYDKVMVCJEn+FMIq9VhYKnEb6l8GcocqPfdwikpik8?=
 =?us-ascii?Q?iNoZbISzrcqeEYrjWqx4elU9wTWdcFxO0bb4QKeosch0WONm5JcgvbVqsbYp?=
 =?us-ascii?Q?Drxiy3yqLLNbfLF/Qqb0Um1ZW8CnjS/LfnBkWal4ncc1matjO4Gu0aHnJ6zt?=
 =?us-ascii?Q?b0ezeMdl+0Ym1ytyjupwVpH/Avk+mcsuTD2CKRmdDkSWm6XbznMx0qSZeuc4?=
 =?us-ascii?Q?59WTpph6dNyXHRNQpb+MdypGqzYqlBU78iWO1NYkKAF8CzqGWJuKjUCrhwYH?=
 =?us-ascii?Q?TuZlsXa4QyCf4sd4vnnA/n6s+zqAX5fI/crv3OyNioJjFuIxCSsMIleAAqXM?=
 =?us-ascii?Q?69SUcFv/eq3GZXUaYbKYrmpxQjfcfshLF+XHafpnB4WM/2893GUPcGyPFnq3?=
 =?us-ascii?Q?QzuQnV0POTlCk3Gxv3QO3DkwXl9FoXyysYCJWsml9Ch2RFItiEHSj7T8aPWz?=
 =?us-ascii?Q?4pMXgZfKCEsUIZft7Rmyuv81h8/rEuex6Bk2f+0mrA6d/4DGw1JIUktFXwQQ?=
 =?us-ascii?Q?U1MdJZfgweRrBuhmxlALGC9qbvMbFNB2/gUDQRlCEn98wWYKNS8IwR7hzH7l?=
 =?us-ascii?Q?blbGHLAmlXvRPJwHXdTlxUvj9hWUoMdEvqBZJb3/XUvRxlAZs8mmQIo7r9gq?=
 =?us-ascii?Q?HA9qFZFunDHDzU2YbRf3T86UgOCPeOLXtRrJOYO1GYP5M5x9J/knCqxhuFff?=
 =?us-ascii?Q?Hkfx61oAR4owzmUjEh/oj/QbMoBLIzV2uq478W5n/klP4tKkvcaiHpd5rPkm?=
 =?us-ascii?Q?Ens2L9+FCnD/DQXcTDW69Svphuc3ye1ErzFKw9+BpgN1KtEZxPcQ6w/u4yEH?=
 =?us-ascii?Q?zTN1T9bqsKsXssIHQtwRrxiWgWf0LRuNyBmg5Ti/T9PPOR7d4ic+Cohkd4kw?=
 =?us-ascii?Q?CZbNf69cnX7xFjgFQ9r8nwgo5gxL1EAGOz5R0mYC9hIIyv44aRPEXqLyVqSw?=
 =?us-ascii?Q?+jQHNYDOO/ajm6KMipq79pDVSAu/+NhNn782e+zv8TatbaseTCPQUAlNdLFn?=
 =?us-ascii?Q?YFDMQ0gn6zrBug+NWWaCmg2xBtHXvaQVLbXETeqSeVAtzitWxvrUgdgLmGZ0?=
 =?us-ascii?Q?XpzCjUMCFt/1EUMsHwJoUbj1oH/Etb66+F99GVNS13a7M6clCHHWMh/7/+hk?=
 =?us-ascii?Q?HjQDOgzxvCQYULMASwwvg2l4qGhMJeesZXp4nUQKNuu8mDoVn4zZC7Eeh1RJ?=
 =?us-ascii?Q?E/8d8JjdAaK+cWNoruC6atsQkrkj8XjAFcLWNrkN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030eda1e-f339-45ba-8d82-08ddbfcdb631
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:20:40.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmluExrU/9RKhnckWS/C0XBzX3CdIkUorcZgGz7+CHsM/JCLSGfvNIYhixKu0qLG/f7K6k6ahE6EMwkKOhPBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7943

On Thu, Jul 10, 2025 at 05:20:25PM +0300, Andrei Stefanescu wrote:
> This commit will add support for the NXP SIUL2 module as an MFD device.

Needn't "this commit", just

Add support ....

>
> SIUL2 (System Integration Unit Lite) is a hardware module which
> implements various functionalities:
> - reading SoC information
> - pinctrl
> - GPIO (including interrupts)
>
> This commit only adds support for pinctrl&GPIO(one cell). Further

Add support ...

> commits will add nvmem functionality(a second cell).
>
> There are multiple register types in the SIUL2 module:
> - MIDR (MCU ID Register)
> 	* contains information about the SoC.
> - Interrupt related registers
> 	* There are 32 interrupts named EIRQ. An EIRQ
> 	  may be routed to one or more GPIOs. Not all
> 	  GPIOs have EIRQs associated with them
> - MSCR (Multiplexed Signal Configuration Register)
> 	* handle pinmuxing and pinconf
> - IMCR (Input Multiplexed Signal Configuration Register)
> 	* are part of pinmuxing
> - PGPDO/PGPDI (Parallel GPIO Pad Data Out/In Register)
> 	* Write/Read the GPIO value
>
> There are two SIUL2 modules in the S32G SoC. This driver handles
> both because functionality is shared between them. For example:
> some GPIOs in SIUL2_0 have interrupt capability but the registers
> configuring this are in SIUL2_1.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/mfd/Kconfig           |  12 +
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/nxp-siul2.c       | 410 ++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nxp-siul2.h |  55 +++++
>  4 files changed, 478 insertions(+)
>  create mode 100644 drivers/mfd/nxp-siul2.c
>  create mode 100644 include/linux/mfd/nxp-siul2.h
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6fb3768e3d71..e6634e05091e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1143,6 +1143,18 @@ config MFD_NTXEC
>  	  certain e-book readers designed by the original design manufacturer
>  	  Netronix.
>
> +config MFD_NXP_SIUL2
> +	tristate "NXP SIUL2 MFD driver"
> +	select MFD_CORE
> +	select REGMAP_MMIO
> +	depends on ARCH_S32 || COMPILE_TEST
> +	help
> +	  Select this to get support for the NXP SIUL2 (System Integration
> +	  Unit Lite) module. This hardware block contains registers for
> +	  SoC information, pinctrl and GPIO functionality. This will
> +	  probe a MFD driver which will contain cells for a combined
> +	  pinctrl&GPIO driver and nvmem drivers for the SoC information.
> +
>  config MFD_RETU
>  	tristate "Nokia Retu and Tahvo multi-function device"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 79495f9f3457..02e3cc0a2303 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -224,6 +224,7 @@ obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
>  obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
>  obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>  obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
> +obj-$(CONFIG_MFD_NXP_SIUL2) 	+= nxp-siul2.o
>  obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
>  obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
>  obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
> diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
> new file mode 100644
> index 000000000000..904f41b3c61b
> --- /dev/null
> +++ b/drivers/mfd/nxp-siul2.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * SIUL2(System Integration Unit Lite) MFD driver
> + *
> + * Copyright 2025 NXP
> + */
> +#include <linux/init.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nxp-siul2.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#define S32G_NUM_SIUL2 2
> +
> +#define S32_REG_RANGE(start, end, name, access)		\
> +	{						\
> +		.reg_name = (name),			\
> +		.reg_start_offset = (start),		\
> +		.reg_end_offset = (end),		\
> +		.reg_access = (access),			\
> +		.valid = true,				\
> +	}
> +
> +#define S32_INVALID_REG_RANGE		\
> +	{				\
> +		.reg_name = NULL,	\
> +		.reg_access = NULL,	\
> +		.valid = false,		\
> +	}
> +
> +static const struct mfd_cell nxp_siul2_devs[] = {
> +	{
> +		.name = "s32g-siul2-pinctrl",

I think you can add full list here.

> +	}
> +};
> +
> +/**
> + * struct nxp_siul2_reg_range_info: a register range in SIUL2
> + * @reg_name: the name for the register range
> + * @reg_access: the read/write access tables if not NULL
> + * @reg_start_offset: the first valid register offset
> + * @reg_end_offset: the last valid register offset
> + * @valid: whether the register range is valid or not
> + */
> +struct nxp_siul2_reg_range_info {
> +	const char *reg_name;
> +	const struct regmap_access_table *reg_access;
> +	unsigned int reg_start_offset;
> +	unsigned int reg_end_offset;
> +	bool valid;
> +};
> +
> +static const struct regmap_range s32g2_siul2_0_imcr_reg_ranges[] = {
> +	/* IMCR0 - IMCR1 */
> +	regmap_reg_range(0, 4),
> +	/* IMCR3 - IMCR61 */
> +	regmap_reg_range(0xC, 0xF4),
> +	/* IMCR68 - IMCR83 */
> +	regmap_reg_range(0x110, 0x14C)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_0_imcr = {
> +	.yes_ranges = s32g2_siul2_0_imcr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_imcr_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_0_pgpd_reg_ranges[] = {
> +	/* PGPD*0 - PGPD*5 */
> +	regmap_reg_range(0, 0xA),
> +	/* PGPD*6 - PGPD*6 */
> +	regmap_reg_range(0xE, 0xE),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_0_pgpd = {
> +	.yes_ranges = s32g2_siul2_0_pgpd_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_pgpd_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_irq_reg_ranges[] = {
> +	/* DISR0 */
> +	regmap_reg_range(0x10, 0x10),
> +	/* DIRER0 */
> +	regmap_reg_range(0x18, 0x18),
> +	/* DIRSR0 */
> +	regmap_reg_range(0x20, 0x20),
> +	/* IREER0 */
> +	regmap_reg_range(0x28, 0x28),
> +	/* IFEER0 */
> +	regmap_reg_range(0x30, 0x30),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_irq = {
> +	.yes_ranges = s32g2_siul2_1_irq_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_reg_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_irq_volatile_reg_range[] = {
> +	/* DISR0 */
> +	regmap_reg_range(0x10, 0x10)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_irq_volatile = {
> +	.yes_ranges = s32g2_siul2_1_irq_volatile_reg_range,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_volatile_reg_range),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_mscr_reg_ranges[] = {
> +	/* MSCR112 - MSCR122 */
> +	regmap_reg_range(0, 0x28),
> +	/* MSCR144 - MSCR190 */
> +	regmap_reg_range(0x80, 0x138)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_mscr = {
> +	.yes_ranges = s32g2_siul2_1_mscr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_mscr_reg_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_imcr_reg_ranges[] = {
> +	/* IMCR119 - IMCR121 */
> +	regmap_reg_range(0, 8),
> +	/* IMCR128 - IMCR129 */
> +	regmap_reg_range(0x24, 0x28),
> +	/* IMCR143 - IMCR151 */
> +	regmap_reg_range(0x60, 0x80),
> +	/* IMCR153 - IMCR161 */
> +	regmap_reg_range(0x88, 0xA8),
> +	/* IMCR205 - IMCR212 */
> +	regmap_reg_range(0x158, 0x174),
> +	/* IMCR224 - IMCR225 */
> +	regmap_reg_range(0x1A4, 0x1A8),
> +	/* IMCR233 - IMCR248 */
> +	regmap_reg_range(0x1C8, 0x204),
> +	/* IMCR273 - IMCR274 */
> +	regmap_reg_range(0x268, 0x26C),
> +	/* IMCR278 - IMCR281 */
> +	regmap_reg_range(0x27C, 0x288),
> +	/* IMCR283 - IMCR286 */
> +	regmap_reg_range(0x290, 0x29C),
> +	/* IMCR288 - IMCR294 */
> +	regmap_reg_range(0x2A4, 0x2BC),
> +	/* IMCR296 - IMCR302 */
> +	regmap_reg_range(0x2C4, 0x2DC),
> +	/* IMCR304 - IMCR310 */
> +	regmap_reg_range(0x2E4, 0x2FC),
> +	/* IMCR312 - IMCR314 */
> +	regmap_reg_range(0x304, 0x30C),
> +	/* IMCR316 */
> +	regmap_reg_range(0x314, 0x314),
> +	/* IMCR 318 */
> +	regmap_reg_range(0x31C, 0x31C),
> +	/* IMCR322 - IMCR340 */
> +	regmap_reg_range(0x32C, 0x374),
> +	/* IMCR343 - IMCR360 */
> +	regmap_reg_range(0x380, 0x3C4),
> +	/* IMCR363 - IMCR380 */
> +	regmap_reg_range(0x3D0, 0x414),
> +	/* IMCR383 - IMCR393 */
> +	regmap_reg_range(0x420, 0x448),
> +	/* IMCR398 - IMCR433 */
> +	regmap_reg_range(0x45C, 0x4E8),
> +	/* IMCR467 - IMCR470 */
> +	regmap_reg_range(0x570, 0x57C),
> +	/* IMCR473 - IMCR475 */
> +	regmap_reg_range(0x588, 0x590),
> +	/* IMCR478 - IMCR480*/
> +	regmap_reg_range(0x59C, 0x5A4),
> +	/* IMCR483 - IMCR485 */
> +	regmap_reg_range(0x5B0, 0x5B8),
> +	/* IMCR488 - IMCR490 */
> +	regmap_reg_range(0x5C4, 0x5CC),
> +	/* IMCR493 - IMCR495 */
> +	regmap_reg_range(0x5D8, 0x5E0),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_imcr = {
> +	.yes_ranges = s32g2_siul2_1_imcr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_imcr_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_pgpd_reg_ranges[] = {
> +	/* PGPD*7 */
> +	regmap_reg_range(0xC, 0xC),
> +	/* PGPD*9 */
> +	regmap_reg_range(0x10, 0x10),
> +	/* PDPG*10 - PGPD*11 */
> +	regmap_reg_range(0x14, 0x16),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_pgpd = {
> +	.yes_ranges = s32g2_siul2_1_pgpd_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_pgpd_reg_ranges)
> +};
> +
> +static const struct nxp_siul2_reg_range_info
> +s32g2_reg_ranges[S32G_NUM_SIUL2][SIUL2_NUM_REG_TYPES] = {
> +	/* SIUL2_0 */
> +	{
> +		[SIUL2_MIDR] = S32_REG_RANGE(4, 8, "SIUL2_0_MIDR", NULL),
> +		/* Interrupts are to be controlled from SIUL2_1 */
> +		[SIUL2_IRQ] = S32_INVALID_REG_RANGE,
> +		[SIUL2_MSCR] = S32_REG_RANGE(0x240, 0x3D4, "SIUL2_0_MSCR",
> +					     NULL),
> +		[SIUL2_IMCR] = S32_REG_RANGE(0xA40, 0xB8C, "SIUL2_0_IMCR",
> +					     &s32g2_siul2_0_imcr),
> +		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x170E,
> +					      "SIUL2_0_PGPDO",
> +					      &s32g2_siul2_0_pgpd),
> +		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x174E,
> +					      "SIUL2_0_PGPDI",
> +					      &s32g2_siul2_0_pgpd),
> +	},
> +	/* SIUL2_1 */
> +	{
> +		[SIUL2_MIDR] = S32_REG_RANGE(4, 8, "SIUL2_1_MIDR", NULL),
> +		[SIUL2_IRQ] = S32_REG_RANGE(0x10, 0xC0, "SIUL2_1_IRQ",
> +					    &s32g2_siul2_1_irq),
> +		[SIUL2_MSCR] = S32_REG_RANGE(0x400, 0x538, "SIUL2_1_MSCR",
> +					     &s32g2_siul2_1_mscr),
> +		[SIUL2_IMCR] = S32_REG_RANGE(0xC1C, 0x11FC, "SIUL2_1_IMCR",
> +					     &s32g2_siul2_1_imcr),
> +		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x1716,
> +					      "SIUL2_1_PGPDO",
> +					      &s32g2_siul2_1_pgpd),
> +		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x1756,
> +					      "SIUL2_1_PGPDI",
> +					      &s32g2_siul2_1_pgpd),
> +	},
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_irq_conf = {
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +	.volatile_table = &s32g2_siul2_1_irq_volatile,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_generic_conf = {
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_pgpdo_conf = {
> +	.val_bits = 16,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 2,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_pgpdi_conf = {
> +	.val_bits = 16,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 2,
> +	.cache_type = REGCACHE_NONE,
> +	.use_raw_spinlock = true,
> +};
> +
> +static int nxp_siul2_init_regmap(struct platform_device *pdev,
> +				 void __iomem *base, unsigned int siul)
> +{
> +	const struct regmap_config *regmap_configs[SIUL2_NUM_REG_TYPES] = {
> +		[SIUL2_MIDR]	= &nxp_siul2_regmap_generic_conf,
> +		[SIUL2_IRQ]	= &nxp_siul2_regmap_irq_conf,
> +		[SIUL2_MSCR]	= &nxp_siul2_regmap_generic_conf,
> +		[SIUL2_IMCR]	= &nxp_siul2_regmap_generic_conf,
> +		[SIUL2_PGPDO]	= &nxp_siul2_regmap_pgpdo_conf,
> +		[SIUL2_PGPDI]	= &nxp_siul2_regmap_pgpdi_conf,
> +	};
> +	const struct nxp_siul2_reg_range_info *tmp_range;
> +	struct regmap_config tmp_conf;
> +	struct nxp_siul2_info *info;
> +	struct nxp_siul2_mfd *priv;
> +	void __iomem *reg_start;
> +	int i;
> +
> +	priv = platform_get_drvdata(pdev);
> +	info = &priv->siul2[siul];
> +
> +	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
> +		if (!s32g2_reg_ranges[siul][i].valid)
> +			continue;
> +
> +		tmp_range = &s32g2_reg_ranges[siul][i];
> +		tmp_conf = *regmap_configs[i];
> +		tmp_conf.name = tmp_range->reg_name;
> +		tmp_conf.max_register =
> +			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
> +
> +		if (tmp_conf.cache_type != REGCACHE_NONE)
> +			tmp_conf.num_reg_defaults_raw =
> +				1 + tmp_conf.max_register / tmp_conf.reg_stride;
> +
> +		if (tmp_range->reg_access) {
> +			tmp_conf.wr_table = tmp_range->reg_access;
> +			tmp_conf.rd_table = tmp_range->reg_access;
> +		}
> +
> +		reg_start = base + tmp_range->reg_start_offset;
> +		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
> +							 &tmp_conf);
> +		if (IS_ERR(info->regmaps[i]))
> +			return dev_err_probe(&pdev->dev,
> +					     PTR_ERR(info->regmaps[i]),
> +					     "regmap %d init failed: %ld\n", i,
> +					     PTR_ERR(info->regmaps[i]));
> +	}
> +
> +	return 0;
> +}
> +
> +static int nxp_siul2_parse_dtb(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct of_phandle_args pinspec;
> +	struct nxp_siul2_mfd *priv;
> +	void __iomem *base;
> +	char reg_name[16];
> +	int i, ret;
> +
> +	priv = platform_get_drvdata(pdev);
> +
> +	for (i = 0; i < priv->num_siul2; i++) {
> +		ret = snprintf(reg_name, ARRAY_SIZE(reg_name), "siul2%d", i);
> +		if (ret < 0 || ret >= ARRAY_SIZE(reg_name))
> +			return ret;
> +
> +		base = devm_platform_ioremap_resource_byname(pdev, reg_name);
> +		if (IS_ERR(base))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(base),
> +					     "Failed to get MEM resource: %s\n",
> +					     reg_name);
> +
> +		ret = nxp_siul2_init_regmap(pdev, base, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +						       i, &pinspec);
> +		if (ret)
> +			return ret;
> +
> +		of_node_put(pinspec.np);
> +
> +		if (pinspec.args_count != 3)
> +			return dev_err_probe(&pdev->dev, -EINVAL,
> +					     "Invalid pinspec count: %d\n",
> +					     pinspec.args_count);
> +
> +		priv->siul2[i].gpio_base = pinspec.args[1];
> +		priv->siul2[i].gpio_num = pinspec.args[2];
> +	}
> +
> +	return 0;
> +}
> +
> +static int nxp_siul2_probe(struct platform_device *pdev)
> +{
> +	struct nxp_siul2_mfd *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num_siul2 = S32G_NUM_SIUL2;
> +	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
> +				   sizeof(*priv->siul2), GFP_KERNEL);
> +	if (!priv->siul2)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	ret = nxp_siul2_parse_dtb(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id nxp_siul2_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-siul2" },
> +	{ .compatible = "nxp,s32g3-siul2" },

in binding doc "nxp,s32g3-siul2" fallback to "nxp,s32g2-siul2".

needn't nxp,s32g3-siul2 here.

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
> +
> +static struct platform_driver nxp_siul2_mfd_driver = {
> +	.driver = {
> +		.name		= "nxp-siul2-mfd",
> +		.of_match_table	= nxp_siul2_dt_ids,
> +	},
> +	.probe = nxp_siul2_probe,
> +};
> +
> +module_platform_driver(nxp_siul2_mfd_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("NXP SIUL2 MFD driver");
> +MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>");
> diff --git a/include/linux/mfd/nxp-siul2.h b/include/linux/mfd/nxp-siul2.h
> new file mode 100644
> index 000000000000..4603a97e40e4
> --- /dev/null
> +++ b/include/linux/mfd/nxp-siul2.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * S32 SIUL2 core definitions
> + *
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __DRIVERS_MFD_NXP_SIUL2_H
> +#define __DRIVERS_MFD_NXP_SIUL2_H
> +
> +#include <linux/regmap.h>
> +
> +/**
> + * enum nxp_siul2_reg_type - an enum for SIUL2 reg types
> + * @SIUL2_MIDR - SoC info
> + * @SIUL2_IRQ - IRQ related registers, only valid in SIUL2_1
> + * @SIUL2_MSCR - used for pinmuxing and pinconf
> + * @SIUL2_IMCR - used for pinmuxing
> + * @SIUL2_PGPDO - writing the GPIO value
> + * @SIUL2_PGPDI - reading the GPIO value
> + */
> +enum nxp_siul2_reg_type {
> +	SIUL2_MIDR,
> +	SIUL2_IRQ,
> +	SIUL2_MSCR,
> +	SIUL2_IMCR,
> +	SIUL2_PGPDO,
> +	SIUL2_PGPDI,
> +
> +	SIUL2_NUM_REG_TYPES
> +};
> +
> +/**
> + * struct nxp_siul2_info - details about one SIUL2 hardware instance
> + * @regmaps: the regmaps for each register type for a SIUL2 hardware instance
> + * @gpio_base: the first GPIO in this SIUL2 module
> + * @gpio_num: the number of GPIOs in this SIUL2 module
> + */
> +struct nxp_siul2_info {
> +	struct regmap *regmaps[SIUL2_NUM_REG_TYPES];
> +	u32 gpio_base;
> +	u32 gpio_num;
> +};
> +
> +/**
> + * struct nxp_siul2_mfd - driver data
> + * @siul2: info about the SIUL2 modules present
> + * @num_siul2: number of siul2 modules
> + */
> +struct nxp_siul2_mfd {
> +	struct nxp_siul2_info *siul2;
> +	u8 num_siul2;
> +};
> +
> +#endif /* __DRIVERS_MFD_NXP_SIUL2_H */
> --
> 2.45.2
>

