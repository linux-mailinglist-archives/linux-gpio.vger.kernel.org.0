Return-Path: <linux-gpio+bounces-33988-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KleUAMekwGlRJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-33988-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 03:26:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA12EBE9E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 03:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56DAD3007648
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 02:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568BC223DFB;
	Mon, 23 Mar 2026 02:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a+kuJRWg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E325D35979;
	Mon, 23 Mar 2026 02:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774232772; cv=fail; b=bUOWYQ5ubVgCCQO0Mz5qkb/p7nSkUc9n1EXa2ISl31AlnhJ4+vwG1bwr7UP76/b8sHcwlGueyaCOFnldJ1LN3rAn3yx8ok3Leb6YEDpTW8BR56SJw+uD76yVuLxETeHcqhsDI/bTLXWsEjon/LpNcWZEqNQiBkez3h+jwqzrkJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774232772; c=relaxed/simple;
	bh=IA1YgxIlW22KRZ0OaQ+2guywBkD5BZmRUDxf4z2/5Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LphRp0eE/ZQg2B6mfiv8TVg0obQJdnMoViBiIlxC8RsJfmM7V0MrvXC/cqz2ZkstY0TDWoHiOe5jsiWuSOxAwak0VpCfdsN6Y2oEh0z/UUwN/H7+zXNCi6eyvmaK7UF8cj+bpgWjV/AHaiYK/NxgR43yAUwb4DkeWL75DvtnwPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a+kuJRWg; arc=fail smtp.client-ip=52.101.84.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnlEzCgb24wrHtXbcXMeeX4hg/rqDKdJEKTyHbZ/ZRO9BKHmnj5oDN9/aavMGbFCqrZHlXXKUUWuIK2p4tKWzAVjLtzzSlboI5xxUQ3GCbU+Uj/PU4hQcXfEt2mWMQMzVB8GluB5V0I3ggwUcnAbSdcgOYkIqAQ3izK6a4o24lls70YtYXOGTSmGC2q2uQCp87P6CyXi6h3UzptnfoDCm5sWFEWTsUNTmnRfioPYn42pKIQRohi4QOjGFz01TwK4EdMaRNTz7ZiEjK+MHB4gO5fHSAI5C2tRuNdK4so5epYFS/KkcjhHfE84/XnnGu3qL6hxepiWdEVWNFMSDCsAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWY8BF6Y/02769wV6mOaUw0igxtwTL/AHaGguHKDGE0=;
 b=S2JBePasaGKCATApfvlCRI2E8kbFaS3G/qQ6FzI7wHUSbJ6uuW5xNB1sT/wa+Sb3ZwfKd1uHxMRz8bQEQyXeSGZy5rq8xfb+VDQqZAa8OF1OS1ZBEDD1zdg5nz9yTgZOz/dYQNJJ2tlNUtuUXJeV1YiJMk2nmWzXq3l8lLCS7jEVoj+MSsZiAmYNsVBwFZZT7onhT89fKubLCeNrswINZ9NTuLGqYfgQChYLgbpdwwCatN05w4NEVBeAFfXqFze1RcOMdI3svs6tohAMWOsGA52UBQCzURLQ+A/Q0RSIIAZ/rCEd6b1D+4K+5HwFJRPw65rZj3zJ965Oqdx5IIu/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWY8BF6Y/02769wV6mOaUw0igxtwTL/AHaGguHKDGE0=;
 b=a+kuJRWg1ljTcOXDESnULnZ3ASZwOID30ngAOTR70/mAIML12xix5UuficVcpsLBzyG0A/ohmOLCTA1mFagwcilzHDDODWUtSky9YA+fjp+xVV+RszmQe/mfY1cTtN01uRXYpE24CRPr581CH4/ybeWW0eOyqQrJoUacWxaS6L7w5PYwni7maUAOQFq0jLko4RKrTcU0RH8Pe+SWU0ueN2gwcKAkYMbTHXWHCSQnJPVa3CQOwyS4DbwGVKzxY4VR29B55YxMulhj1hWesEouW6CF805KPeLbXYQozMS5pxSEr3MQjrbvlyeMdtd6119JLgqEOV644o+UKAumSDxuFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB12299.eurprd04.prod.outlook.com (2603:10a6:10:62b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Mon, 23 Mar
 2026 02:26:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 02:25:49 +0000
Date: Mon, 23 Mar 2026 11:41:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Greg Malysa <malysagreg@gmail.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	u-boot@lists.denx.de, Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <acC2fSdjDmj5Wp1a@nxa18884-linux.ap.freescale.net>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: MA5P287CA0279.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB12299:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bc0132-ee30-4add-c09d-08de88837e88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kf+Uufo7Y6lbHg97pNZHCIKC34S2qDFnruw04K6nOQfaG/xBwvjI6HwMAU3RLViGOu6W58codRpHExDZSp7WO8F70kESAXGFqxa4GyNdib/e0FwRUSSR2dlJR8Axau9TO2JcdoZKhCI4B6DiVUf4senl2C2RtCRqDOfxMLxlmU1ls2I36lVGL0VizHqdkI/gHnmZ2y4TdkL8TWr+Gbv09u4O3/tar+kuN12CgwBjWcpkEwsm7/UKuAM6lrnlfz/HNAKCrXlENFmICM0ZHhTE67myfrtbH90R0IMvjkPC6nu3cr2gPbDbOQ7kPuxLcV+jmceRVPus0uEr8GdK3JjW8XMhgwkLhJdFK6J+JMBoshAFCa6WjrHp4TqeBr67+lkHI+GfKtSgtkP7LZTjgVItT5gT3k52qxms1WQgi5El1MWLlCuhjxKb3sn+rCrMEm2vAFpeUWruUbpOWoAW4f1d1qrIWKI91/bbHoCLMTT5sZ1YTzGc7dxXGk/48LeLqZPNo2Jbi+qdXSXYi3fpin6H6a/N6C9jDZxvFTDyCnJVAQe9NsO3q40Vzin1CJMP4wtQITwWnPkUo/WQBbLRIFKseEGQUffhYpuWl+odwJ/znZ41UaEEO9ltuSGQdufe8eFiw5jtagF8dLOeW1uBkYY157yoziLAuRElNxaa4oX6VWlefsn9vcqptIzUW2D+tgTKSabFfI6YzWdKua9anmthWArWIsj9N7XVHgclpTbC1rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sFQI2+6FHQMLtm4Q5QaM59wO9U8GVcG4xv1jVo3SARsmyAtb3Twl0AN6g+GD?=
 =?us-ascii?Q?OyUAFOzkbMSJDZ6jr+JQTMuqJtxrpdKENlXAtJdM1O9d3yLyqc6ZvZHTnLZE?=
 =?us-ascii?Q?ks0MCWYsxBP4nVVOl+rA1j+sVPWTnrFJfeyWh8G5+djnb5+X4o+yoIBUOw9L?=
 =?us-ascii?Q?TwBm1LKL12j683ahxgsju3qyJB85Az3yjbUYpEMWs8vBwEmJaETral9R8Z3L?=
 =?us-ascii?Q?0XQUH68QIUEwBdndRrt/KIEU8ivrSK5Xxt0V+BDTmOhrS8gt6FUC04bEoFMt?=
 =?us-ascii?Q?geBulnJWriTQty/v7h8NRLPG7j3Amf9lWGVUftxYFCoBEt1t0Dm7M/04xnid?=
 =?us-ascii?Q?6WocKtZeRUWcZ1/qKS7Mn2o3gFi0DT/iDM2iLnaH0Cfl1cpluI/7wE0HGOe2?=
 =?us-ascii?Q?d0T5CaPz5C+1pMlYo65rUw90vtRMBPq2B84bUTSVIj7Ih3KzEpJE6wxQ9fZx?=
 =?us-ascii?Q?p7lV+ENdxZt04ES6VeB2wmwEeq4grcp7Ez/x/d+PY45OddSFXy2jxGT0CrZI?=
 =?us-ascii?Q?3XHVGYhkKrx35Bv1mKzjhYxqDHHVvvJWA+gIhO34UOnCYOnx3DJ2L5v8SIzA?=
 =?us-ascii?Q?0xaBh1fTlIj4IFuQQeeRTdFVX3DclXaU41J5obJzKkSIm0QY9qqRovA0ioYN?=
 =?us-ascii?Q?khEypRRR2n+jGQg3Vo3jJ+HEnRlK0RtBYYA3sR2A3bl8R4uGVzF6IMV2fnBj?=
 =?us-ascii?Q?dy+oTYa7y+O+C+Doh5DWIRWrb1z3+eH/+UwYWNU0X2e7ZvAKslid4gVg11hI?=
 =?us-ascii?Q?Nv75fJ51+brpoBzCIItHtoJJVMgJNOOKjnTX1qEqi7FBHGEC8xOUP51Rl9mh?=
 =?us-ascii?Q?AcDAO9UQ4w7g6IZa5pKnjLj2akRZjdeNCgFVXF5yhN3GcGODOxTqVnpNtkzo?=
 =?us-ascii?Q?QObWlk0btswKBTRhUhxgWq6tOjQMQXOiq0/7n8n4KEg80DdHF+dXWL0WWJo9?=
 =?us-ascii?Q?O+JS0lI1sfJ+A9tMaL1h0ZPf/2d7YcUt5XcigaaNrHTw4O2WkZ/J9JuxbJ8w?=
 =?us-ascii?Q?QsSiadsqQ76lKuwgyRFDMMv4S2AtG/5dUYEe9aoeqMN/y0ndTplwNSY3rb/R?=
 =?us-ascii?Q?knqXfglX+aKy6tYdCINVXER/2P67g8M3e1gVqO7valmNF4K7JogdXENTQfZh?=
 =?us-ascii?Q?IX/LRZwZZYY9kABSL4zUilYbcraJWIOqKmjXNi5/XEEuU4p6pKwszML+uYe9?=
 =?us-ascii?Q?2Mm3+QjUlEP3rmlqcnYequWWGwC3W6PbbetoMuNaryiOBBaXhWghbN3NqrmK?=
 =?us-ascii?Q?39FOdxUvTRFxUND4oA3j7B/z3EeYmU5PkJ1WulqDoesJ4GLRZaGUrfLs8lKB?=
 =?us-ascii?Q?OiWgs4Cl9QD1TNf+Rv3zczEv62IiLQphXC7LJsc84Xl402srtODSwyqrl4LH?=
 =?us-ascii?Q?42O76OfjIjqvKBpzS68CbL3jmvYQuWqiQWDV8NNXzLdpbY1aBHCPRes13Aaj?=
 =?us-ascii?Q?vBZ0f7j/dZVOtcXqFSvR+1pFKtYblUasZ+Dc7gJoIHZr+zWK5Hk1LB/i5Ocb?=
 =?us-ascii?Q?Gqn/vmHxcVZIENw5F6yN3KclGugzSHldQ+lnqnUPd7ygZ6YCk6KROBxmqPow?=
 =?us-ascii?Q?vDkbdDt/tk3bY61Cv0eW8OpIAPzqM/HDcJIoP2vU4E0mq3FNoF257Xr7lb4b?=
 =?us-ascii?Q?lzywvRw6HWhG/yh2LNZbGCnqkeecd1df3AZlZpxX43MTaoYIFAzsOpCiQzAN?=
 =?us-ascii?Q?qVrwqWr351g/pmzCx58661chQLONAhqVZh4kVzUaU4XryzRjMhM52N+INnq0?=
 =?us-ascii?Q?WEv3QQTLaQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bc0132-ee30-4add-c09d-08de88837e88
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 02:25:49.1880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaQLbHCxJdsGd3ExRyIaOF1fKSqsJ0LLu2MJb7fhDq/IRMHx6Ng7yk6RY3XuTe4NHPEITeoIVN0qDCNNgWb96w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12299
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33988-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com,nxp.com,analog.com,timesys.com,googlemail.com,microchip.com,linaro.org,altera.com,lists.denx.de,intel.com,kernel.org,oss.qualcomm.com,vger.kernel.org,arm.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 69DA12EBE9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

On Wed, Mar 11, 2026 at 10:41:36PM +0300, Dan Carpenter wrote:
>This provides GPIO support over SCMI.  It is built on top of the
>pinctrl-scmi driver.  The device tree entry would work the same as
>in linux.  Perhaps something like this.
>+

[....]

>+	ret = snprintf(NULL, 0, "gpio_scmi%d_", bank_cnt);
>+	uc_priv->bank_name = devm_kzalloc(dev, ret + 1, GFP_KERNEL);
>+	if (!uc_priv->bank_name)
>+		return -ENOMEM;
>+	snprintf(uc_priv->bank_name, ret + 1, "gpio_scmi%d_", bank_cnt);

build fail in CI [1]:

drivers/gpio/gpio_scmi.c: In function 'scmi_gpio_probe':
drivers/gpio/gpio_scmi.c:227:25: error: passing argument 1 of 'snprintf' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
  227 |         snprintf(uc_priv->bank_name, ret + 1, "gpio_scmi%d_", bank_cnt);
      |                  ~~~~~~~^~~~~~~~~~~
In file included from include/log.h:12,
                 from include/linux/printk.h:4,
                 from include/linux/kernel.h:5,
                 from include/linux/libfdt_env.h:13,
                 from include/linux/libfdt.h:6,
                 from include/fdtdec.h:17,
                 from include/dm/ofnode.h:11,
                 from include/asm-generic/gpio.h:10,
                 from ./arch/sandbox/include/asm/gpio.h:24,
                 from drivers/gpio/gpio_scmi.c:6:
include/stdio.h:60:20: note: expected 'char *' but argument is of type 'const char *'
   60 | int snprintf(char *buf, size_t size, const char *fmt, ...)
      |              ~~~~~~^~~
  CC      drivers/net/phy/broadcom.o

[1] https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq/-/jobs/1408382

Thanks,
Peng

>+	bank_cnt++;
>+
>+	uc_priv->gpio_count = priv->num_pins;
>+
>+	return 0;
>+}
>+
>+static const struct udevice_id scmi_gpio_match[] = {
>+	{ .compatible = "scmi-pinctrl-gpio" },
>+	{ }
>+};
>+
>+U_BOOT_DRIVER(scmi_pinctrl_gpio) = {
>+	.name	= "scmi_pinctrl_gpio",
>+	.id	= UCLASS_GPIO,
>+	.of_match = scmi_gpio_match,
>+	.probe	= scmi_gpio_probe,
>+	.priv_auto = sizeof(struct scmi_gpio_priv),
>+	.ops	= &scmi_gpio_ops,
>+};
>+
>-- 
>2.51.0
>
>

