Return-Path: <linux-gpio+bounces-34099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEiXEGjkwmm/nAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:22:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE031B6B3
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C91B83048936
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 19:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E962E091E;
	Tue, 24 Mar 2026 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NVSu/sj5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE762DEA98;
	Tue, 24 Mar 2026 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380112; cv=fail; b=cx1cXGZQLiaZcfI888S0QKwMzl7IMAUDrUMn22ms2CZfIuteFiG2W9qwUhxTf6P1IfkM68kE1MPP9bKJI/xSZAaqiSXtb4DBk2jo+DseMLNspNgQApl3eQn2tYPzlOhAxO4nD9D0CtMCfZ6yZquYrTbdMfV9oqG0W+JVef1g32A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380112; c=relaxed/simple;
	bh=J5E6PHqdYeC1dHVYvfY2xrCvm5G/tylAlW0P4G5r4Is=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rnF2PNObmhUF4PhND6837xzjBmeO2jydgXqA76BEBzbYeBeX3+Zt7NGmOgVY5W5HDIHYVu8i51OZltcNJJxA55g+ZFL8qUyxn8gMSCo/WXLPr9Y8lSV0EMD9Ka4yUtmjd2cwa/hnmcjg4A1Lz6AgLU3ErNx9GMVNgDVrUSVaXs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NVSu/sj5; arc=fail smtp.client-ip=40.107.162.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5wgZYxbJIQCfCxub/xDvfaW/34Z4xv5E5XFX3GFpOul6PfxUYcdA4/+LIvPF/Mmxf/82EDspXebT7sdioBBh/VkvzT+Xcua5NllytsNCTRU8EtJrUUPWH6Ne2Oa2xjhRg569/BAU9+tCjbjCRlt1twDUvyDSLaVzjLHBMosropmqbIFN8DmNVHEn6lt06wKwkdcdxq0BBrpZ8uqUfONPzK6V6brGn5s5Lmk/v3W0KcazVpCzzyiTAGw4yIJ2MSG2ixR9jel4Mhua1FVyuYewR4nd39okgqaylglD3nv/eUTKjKWXa7WEsEbugQz4n4OyfdxnlD4siJi5aK358F3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncgPICka/hsIzvDlFphj2U07gKf2fO15DNOFdXnkCQk=;
 b=H4HCglR/ibGQ7dGmWtGec31Fykt7REn1yxXmqmHF11HNOFBRRoUfPcKNj5AfPVjIhRsaVxepXH+Hxfo7lWR+ZfpTLjHuF2dpY1SpZ4+yV/BUjiZZBqUCFZvGs238dZEzULELQDBr9afGhD0dLOnhtEoWyDYGanLuSS89KuBnyuxqqF7febyIwW4vm1viOs+hR2oI/D+g+t7nsZmC7zUUluhledaCeftJVxsxxUf/lbhfBJ+vysOG9O7yxBs7bJ+YJyl2htckRh66c7ofbSBQQvG93c/G9LcQ8FLyacsUapbtxi5S252GdvnbfrGzYj3sUPPI8rLUTj4bYJHTcpWWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncgPICka/hsIzvDlFphj2U07gKf2fO15DNOFdXnkCQk=;
 b=NVSu/sj52AJV8VDExQ9ye0p/O1u75Dcf1/ebRmjVAFSTT7NBcYho/ylaeu8byubq9IdFfS5UNFH0IoBRWRNLuCup6Jm+On+I0vat/XkzhTywzvRxCUvMIKyQgmDlhJgp5Wx20rKWOxyHpby8/4PLuUZFyhwsUsDlinnE2t7mvbXqrt6YNUSHQewIoZvjGS9mWTnVA//WExyZSlcj+bUOI34q8HaoK+EovkYzQPJUgB/i+OCMCU9sAgTY6D00GLO0IZNPFojuVejTqxyQMcDhOY3tcm9FXGqIziHGvKyqfCVsyKD+YqRE64p6naVjMr9LBvRyAAlUTCgwiPf0enaB0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8908.eurprd04.prod.outlook.com (2603:10a6:20b:40b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 19:21:25 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 19:21:49 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	stable@vger.kernel.org
Subject: [PATCH v3] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Tue, 24 Mar 2026 14:21:29 -0500
Message-ID: <20260324192129.2797237-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0087.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::35) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM9PR04MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: cc286008-e2c3-48bc-a122-08de89da98b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	re+hW3roJbRXdKecy/VCoZnrOdy4O2KPBU5K1PI9GL8BhhMLzIUS3n/tU0aEnBuH76MD3ZaFiW/ivVIkksR+MUUz9Uzx9bPGz8CNZ1TCbouROE57Cs9fntODCT8+Y4I1Go0++Ceof3LnBDtMwf/aN+Ohb/bMGYjiJ2ofmCzai7yPpNzzCCQNYFw7Ptu1SZEhF1njOJ0UfKjgHGgZye+Ajx90Lt0brai1ZBxPS0zCEcECt98qrErgBNCbB+s3lWPtQTWgqjTxaMvP5+dW049BsaIpFnnnPb/4DFSgsATpvuvYvF7DxX56blUnJOUaGUEacrEXTLhlRfD206re8h/pM+rBGOs+oqXyHzFqBppR4kPIE2a0rPRGrTcGzd9hKgIa14MGIpzJ+INQdYwUrKzeltBor3Tt9M4IjGnvasUah1N3xm6V9GS/3Y0U4zxaFNRJcJm94KIa8Ous9jllDAv3I0YGIG2nFTvQLq8GNrM3K0dCRl5a4I4Ae22eBWuRWBoBnZOg1wSXPEQow0vSIeFiOasmmtaMSAffso5izo4lgELY8oexL6qb1PrxRQjImRaUnRys1BeMlymTNuuAnu+dKM+F4Fw8Rj9pJJovu8hQ2KFiCSS4NYGqKqodtd8jMH1f7L9oSMlpnIuVkAkoC9VyDMZP/DyoGDqMBb61whyaf7dZD3poDSUtmkFSlg5v/WH92EI5b1optT9taMlazs7tZVq5KXFN0v8q7ZD6jmKYgDSYuO/hJJU4sKHT72A1Oo5inLw2MgpozgGB99yF9ZTsXBJoCL/dcjgu4m9kG8eibGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QMW+RN01qX98JrkxG7ZyQpbI6+7lgbI7N6VRiUgJIqQ9TB5dGN5yizM03XD5?=
 =?us-ascii?Q?+fiGBdiHaazhgmx39CDrAbbl6l2RVTE6abMDup8+jqEva2REUCSjojGv0HP0?=
 =?us-ascii?Q?rkrRJpcOy4ReflkVNjibUX5+vALciGGY1QAXmu8WLJ7zD/WhazhjFnTYWMYw?=
 =?us-ascii?Q?IFsG3wY93NkmODqdmz5Mnkss98vjqQ82WJRJ5wN39Dc1x4eJrHBNVS6DdSN9?=
 =?us-ascii?Q?GGKoe7yizlm07h8vfb/+MmWq9MebBjksQAP7xLFp6nqDVLtCl5q4Lw3IBbL/?=
 =?us-ascii?Q?TlwpyUsg37jZYmoQOzPrdrjxluHwbKz59LjbWXiIucA4WX6twpG5ZI98vFZN?=
 =?us-ascii?Q?rIV+srcGb75m6nea9DH7oYQo2UD6fIFR8tj830BPXxT8rYx4blnnkaKKUHwq?=
 =?us-ascii?Q?31SpQ/tcfjMKPQOxCv9DtKnoM/UgbrfXrWmbE5HR2nxQD0SvLZjSxydhpl0V?=
 =?us-ascii?Q?OWdM8NgWNTNF3Q9Ht8yEhtonAx0HHhTISrycO3cwDXml+IfDo0fzOa/uTWYq?=
 =?us-ascii?Q?+NSK40ljWURSQgVB8c8EoRm2TSOEKBZCx47i6pJvsNSK3muPHbDxQ0dT60Ir?=
 =?us-ascii?Q?CRQfkHC22CQ3oj680JpHigprw74ibbza9pnWWHzoaZJlRBsW7FqBIWYSihig?=
 =?us-ascii?Q?a1Fuz3CB8o1HCpyqs3YrWB0btWWFYDqPM0HwzFNlXG6XvqDr1uf1Fuh8mDVa?=
 =?us-ascii?Q?WmiHOfD4WNZHq6mVlQazNFc/VwZLP9tnHXnR3FqRTyyoeMDRNJV+6vDkKTz3?=
 =?us-ascii?Q?J9cAejiboyA4YBgPbYhduHvrjZMckhNR4wkZTgH32VtEsSHq6cTxkJPgs/wu?=
 =?us-ascii?Q?3tvbsHlevGQ1CnLQazMZRkdeOK6zHKcRgin8ktuPyFTGAuBEQAwHSjZEwH0m?=
 =?us-ascii?Q?u+HDagQmVLWrFQ1P/ZV+duz5XF6Kz7MWCKly+WoCkwMNKbX/bz/tGG+kIZcp?=
 =?us-ascii?Q?QtQMnHguzl/5fHvKVxX02+mF+34WyFU/632+4WlCa9jREVpNzs+I9EamVJ3o?=
 =?us-ascii?Q?4bpzwz2Gj1XXkSNscLLFj0fE7ab2/JlFLGqku5I0ZZpbLmVTOwOP+jAkMqxF?=
 =?us-ascii?Q?1faN/w08RUYXBAERgz2AQ8IalMQPFT1G5JhaMk/+KQfcWNdmfT1x7/1qqWXt?=
 =?us-ascii?Q?VKyhgZ4adrUpdBOGzbwvM+vAQM9/bVik5u7Y5s9w3g9ghhPIlc67qJG4spYA?=
 =?us-ascii?Q?X9BOWN4yfT4142M8cLg9VETP+FTVKUWvjZ2aIJjQzX3fXRWnqihT16H6oWil?=
 =?us-ascii?Q?ECKMDB6TT69YpgnDquQIKwpxVkO/cMutl6kab6TYqx3j3D0xMGon10LASqFr?=
 =?us-ascii?Q?MU/KT2tcCOsCr3+UKLTYlkAjcYLF3ACwr+ym96jkxfBQQSbc1VE3XsjCGrKA?=
 =?us-ascii?Q?Hp7DfKXU57QmLhgrVXQVfNBPe9Cm+kZUmxS8dADXxlTEjTzuKy0ObUg30Jyd?=
 =?us-ascii?Q?Fd0u9CYLLKu7iOKWwXSA+8IE6KIdbM11soWlMIEDUzg+SoQt5Vs3xw8WGNC9?=
 =?us-ascii?Q?UuxgRFJirJkmXlnzYPXV+NvLdp5i/JP63xI5SqJsmNfMy+h331Ru+qA/XjRC?=
 =?us-ascii?Q?uqLjbT/Rsz6+ozbImiCTP8BFH212RV6GvjZ43QO6FJRQe1w7yAqUebB1XjJM?=
 =?us-ascii?Q?QmdtgU/ljW8hUUjJOkWT28K+smPvPXucbVpat3TCALz8DcwAjh2rfjsNRXZY?=
 =?us-ascii?Q?9qlDnCzOO7HtkyOfWJzSi0NGfs/qSwCjAyEwbBkUz9cv3nRR3cQRBz0tG38X?=
 =?us-ascii?Q?HLOZrTjqTg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc286008-e2c3-48bc-a122-08de89da98b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:21:49.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMX2U/voD9AinS13BgHiYAGE4BqrjVbVgTqeObRzvDeSpBi0fnslg+2s4VuCZhn4tRf35PhqYwmCp/GC3zStLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8908
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34099-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: D6BE031B6B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
trigger due to a hardware bug in the detection logic. Since the hardware
does not support Both Edge wakeup, remap requests for Both Edge to Rising
Edge by default to avoid hitting this issue.

A warning is emitted when Falling Edge is selected on i.MX8QM.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
cc: stable@vger.kernel.org
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Changes in V3:
  - improve the warning message per Alexander's feedback.

 Changes in V2:
  - add a check for i.mx8qm and emit a warning when Falling Edge is
    selected.

 drivers/gpio/gpio-mxc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index d7666fe9dbf8..647b6f4861b7 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -584,12 +584,13 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
+	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");

 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
 		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
 		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
-		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
+		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
 		IMX_SCU_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
 		IMX_SCU_WAKEUP_OFF,		/* 5 */
 		IMX_SCU_WAKEUP_OFF,		/* 6 */
@@ -604,6 +605,13 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 				config = pad_type_map[type];
 			else
 				config = IMX_SCU_WAKEUP_OFF;
+
+			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+				dev_warn_once(port->dev,
+					      "No falling-edge support for wakeup on i.MX8QM\n");
+				config = IMX_SCU_WAKEUP_OFF;
+			}
+
 			ret |= mxc_gpio_generic_config(port, i, config);
 		}
 	}
--
2.43.0


