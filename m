Return-Path: <linux-gpio+bounces-35485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAEAKJdW62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:40:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C894B45DE4A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF0F33009391
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA4C3BBA0A;
	Fri, 24 Apr 2026 11:31:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F23BB9EF;
	Fri, 24 Apr 2026 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030303; cv=fail; b=FGXSI+V/Dp4G+r8ABla6Djhh62VK2k/f01Qs6yOMUSI4HvKIEAIORK49OI9FyaoRlAqt8j30ajGwpKN/lgobI308dVVqRn99TwbA3WiBr3SQwo1r7RIKT7aGDFZ/B7fECn/9K6OtO952CrNNRs0oBLDdaj0iAdTrySJzCPptcG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030303; c=relaxed/simple;
	bh=u4RxIPaD/sMwMmx6TkOhP5cFViqkljkque8/eEVoJMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A5khfnAHcbcfH6stTWUsT3NOb3uoKjHN0N6o/MShv0Gp2QKH7UWrTgDdxIQqighog2AyuPhciaWXzwEP84sno5m+5sBa48gvRZj6+kQOSKTKZbTL+zXiebSIGh1Zv95JnBynCYTQLeNQK+g3yCytRM92hy8hkkeE/wqUfgCz1Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdKUiLDUy0Lnpc5syKYEMGZLLZ9clUvBO+Glj+Ail3oFtQ9ZlWKsKRlJ+qK3dmvUgQe+v8BL89Sv7LfqAT9NLJPGC4Hbf4CieqhSvUVHlauviRyB+Ta8FqJRW08cQdE+pYapK1MoSkqsjhze2URB0lyr1ybWNYCLsfbCLNr3uBgRieD4LTrbxos111Q2IrytfLFyQskv3tIEussQPuefwU5rlkwbXxPWnr5nDgcEhPBbhCJaVddyuBIMNwolTp344teUwzdQA5+t+iXHYR1O5hiT8eGpEYi2EZBMpn7+3f+jpe49SzZVDGkC6ALoyprCL0zJexuRAZfrq13iLxjD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x62Cw3kMukZ3Zlz0GV4L4ijw4W9uKalNijYhMMSyNZI=;
 b=JSapMT1jPlRAoLJWwMva23a0EkK6odUjnkWZuMr4Zl9lwswjuqhDAbZWzsoAth75RijZsK0USks+NGx3fHPigMTY3RSwic71LuGacyGwQ6bkGJisHwivSPmiAIm5cKCWcbusYZ2O5VVyd9EAHaMuMbkOanqvdshBELJA2cPFtUc7VUwse1X9C1ctJyvfKltjsMnkiqSiW+CN+flvXNrSZCW0zP2zWcMt2FG762zoUD8JlZivco9Dg4Cy3xC2UcJs0cqCgQj3yQ3k2AkjFV9m08tT96WK3OKsi50aF8vPH8IAL4JIGmlSgU6CU/yhw8L+TGOJaZj5CBmhz8lMJgnk3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:14:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:14:05 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 20/20] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Fri, 24 Apr 2026 04:13:30 -0700
Message-Id: <20260424111330.702272-21-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1156:EE_
X-MS-Office365-Filtering-Correlation-Id: 68261140-260c-4332-6554-08dea1f298f8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	F0Q1Hlpov/A9D8OgOUfGVypugThlrKkRvjE6yHxNbZaJYNpfZomgrMeOeSJWlwaRcqndc8NdLBgnT9xQpjyLzXqBxMxMmLrdDsxDidfHRDIcMVGaG9wwCD51P5G9JzOceedVYrEc1o35avJ7X5gDQK6UgwV/RxyOFDP5C6kBifFKZMljEDb7PHJQLyhlH/lU9cwZMf8xZ+nPDtrmosuIvLWh8QgjNlv//l/NlWQhbMMu33TdG34DPJam+4Lhl9yFwIAPQOgKVZNLZ7GgJCpKYc48XzwJ4n29P38qxfx7B1WrEZs2HUvJcmb6j+J/3nklklXQsK5WdybTgNVCVGdX4bk2K/aauqtjRp6E5Ev7ehM8BYE2i+XAMEFwv4gk0yDuJ17afqdVLLGsPbUEyoe5CK8cXT3Fl4KmSOjFOsp4H2731rF0QRLe4gyua22AiVRLkipYVdMJ3eQ8Z4h5VcNvuGeJfEjcgcaAdHxbnlB1Min4yJbfJaVDVTeiWzudbkVTBimxMbZngMULQCyk6qmIXkMChOX8h5MYps7TzC0sseKuQoI7HU//nv7z3kihoUSUvqcFqcbrKB/HLQJavfNHmzX8pcOfNzWwqu/QcWy3R5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rx6yqdqas9bBjt0T61j7KnLZ+MgXQ7DkhxTzezc0kNqZSiDmtgaxpWZFxRDx?=
 =?us-ascii?Q?IWe9ySxZuysM12L0o/vI2WZ2YZx3/jwS4bn7ZfUSz4cd6rjt2dEch61abcKf?=
 =?us-ascii?Q?6z8qZSrEFAX7JQ8nFxF8ex13cF+dYBESzsrxOryJ4FlfgpIhyL4U1E+CWTYn?=
 =?us-ascii?Q?pYyqxSCpbo2XDUmgENHUoAvZMdTXcz+i848Dao3qpn6KPbaaBL6KEnIHQDTV?=
 =?us-ascii?Q?DShugJ6ZPenyXdEQAQ3FasaXFWX47dIIkQQyVB3wpSCovaF59GBZiRCunPGc?=
 =?us-ascii?Q?UOHkPs9YIGczbPrT7Sqa+MafDG6aOw4Af9nquuFMrjMlpAKGQkc6RqFHjPB7?=
 =?us-ascii?Q?0yO/uhaz1rvFNJptMRYQUcxzCWxuxVW9ylGrpFkP7cRKaBumNZVDEkUYF532?=
 =?us-ascii?Q?1EoQ+j3Lexnd1K9thXZJqajdIPoqSlmdLEEA8amsIGsu71wsCth1tmDYCU+5?=
 =?us-ascii?Q?vSWDvltG5uA9z/xI004zbbbbCNGLQwk2Z2Tj5nqttFhz5u1CchfajyqrSGfs?=
 =?us-ascii?Q?1w2lV5Q8wFJh/Z4J5rVtqFIu5wDGIyknmi41yfYuqT8Zonw5urpLRvWLffji?=
 =?us-ascii?Q?pLL1GPWyw3/xM263rJGT9RLbM2D5Cn+ED4d6Zo7Y2/s6rwxqfxF/mNnNlbF4?=
 =?us-ascii?Q?8OZ2CIkdGakJWLr9Kyhf/DmadzMcngosnHxzLHXbGQkGZkgm+c7ABMMMSen0?=
 =?us-ascii?Q?BYNRoIgUEUX9skT/15oYgWVps38E2FJ5OKhDcQpJdFStMZ00r8f/9ZDf6OVq?=
 =?us-ascii?Q?kKDz7vwibREorWG+G+eojNDvHnpn0lCt6FHmKcXCV3EDCQFhw+Kn6DHBta2m?=
 =?us-ascii?Q?bHjvxFBEB83YxkkB5N0t0/lqadLzWQwTExOIE78/uK5X0INN/ihN01cahZvw?=
 =?us-ascii?Q?uMw0fDgfsJnmXz1gTqvmYqreMiqessr82yVNclb4e5dgfNc1vOQxc6kPl06J?=
 =?us-ascii?Q?uPYta8iN3ZccMvGY7KJwj3wbDiXKB+n+iEp4duDL4j7rPcQ93rH+TOeVBqo3?=
 =?us-ascii?Q?OVB68fBfo83yRxBklUYJE5U9uYoR7tHrIHmQ/gmXwLDHeBep0z71VAbdypsm?=
 =?us-ascii?Q?wUFBOjvfjE86A86YmYCy4++zmYPQj46/HspVQaCX7p0MXvMv31OrE9BnMP8F?=
 =?us-ascii?Q?/iqtG0sDhbv+oanY8dwzaukLUhF4zghWPOIa5IvXJZpFddGECDCfByp9EWT6?=
 =?us-ascii?Q?eCkqc7GMvmlEHdu7q8Xv2qL/NOtkiBAm+MaFs2vZKbboDMxm1g7jxztxKEfv?=
 =?us-ascii?Q?sSqhDFzIis9NYRPN2jzMqH+vfadDi3C1RpoCOlnJKm6zLOVpgNa1rrGHmb8f?=
 =?us-ascii?Q?rFRy+OTjYnDXNlLElWlnQ6dp/LlT6HYqCN/qvGF5ImdIcTp/10XUINRYa5kY?=
 =?us-ascii?Q?LoUw4/DwNqv92KIVjwijp0OjePMNhxii+kxb4LrhMTke7exuTp9UdBlPh253?=
 =?us-ascii?Q?1k1Ysn/g/6FkBFnST5fdcA1IDJSvPj8am3GEdfheLvw1Ow2A8dr2QqgORbE7?=
 =?us-ascii?Q?is7svCGhx4NuzS3fzPqQoYT6HwNfqTgqRxqLnYE3m8cIoEKVD79KQ9AtIva2?=
 =?us-ascii?Q?yZCo3Ro0PBNcvsRR6NVc7uJLvCtKDRgMImDEy5UZtiA1qHDwvLxufnws8aTY?=
 =?us-ascii?Q?zySEYnyQRaOXD+lpaYwMpL4+SShnAkxyJzLWyXPvh3tfzhh1bDpmjFgTZNYF?=
 =?us-ascii?Q?M4Rg26gIDeB/xHN1kuCV/xHqCX7witaoKfAhf/94ywheZypO2AncJ4H/c0Zr?=
 =?us-ascii?Q?G9qWnazfsWPUF4JJEAPIzpgygQAS5OJxdgQfKqFoWM2vED6ojo5m?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68261140-260c-4332-6554-08dea1f298f8
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:14:05.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bPdHmzQd7Dx0sxsidd3yHfstG2SFPLf4D0JlN1zn3zTxWrXLKQtAAw1bgqLHXmKVjV3ITqhneMTjjG5rHB4KFmnh2YJ0g+4GquC12BnYfKD+3sZokmi66MFLZ6K+thV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: C894B45DE4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35485-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Add pinctrl nodes for starfive JHB100 SoC. They contain
pinctrl_per0/pinctrl_per1/pinctrl_per2/pinctrl_per2pok/pinctrl_per3/
pinctrl_sys0/pinctrl_sys0h/pinctrl_sys1/pinctrl_sys2.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../boot/dts/starfive/jhb100-evb1-eth.dts     |  27 +++++
 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |   4 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |  19 ++++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 107 ++++++++++++++++++
 4 files changed, 157 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
index 62cd046e1224..f7e82f9d0ff1 100644
--- a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
@@ -4,3 +4,30 @@
  */
 
 #include "jhb100-evb1.dtsi"
+
+&pinctrl_per0 {
+	gpioe-i3c0-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOB8-11, 32-33 */
+	gpioe-i3c1-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOB12-15, 34-35 */
+	gpioe-i3c2-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOB16-23 */
+	gpioe-i3c4-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOB36-43 */
+};
+
+&pinctrl_per1 {
+	gpioe-spi-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOC0-4 */
+	gpioe-qspi0-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOC5-11 */
+	gpioe-qspi1-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOC12-19 */
+	gpioe-qspi2-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOC20-27 */
+};
+
+&pinctrl_per2 {
+	gpionw-vref = <JHB100_PINVREF_1_8V>; /* VREF for GPIOD19-30 */
+};
+
+&pinctrl_per3 {
+	gpios-vref = <JHB100_PINVREF_1_8V>; /* VREF for GPIOE0-10 */
+};
+
+&pinctrl_sys2 {
+	gpiow-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOA36-39 */
+	gpiow-inner-vref = <JHB100_PINVREF_3_3V>; /* VREF for GPIOA40-43 */
+};
diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
index 462b6fb7953b..acd5949bcfdb 100644
--- a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
@@ -3,7 +3,9 @@
  * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
  */
 
+#include "jhb100-pinfunc.h"
 #include "jhb100.dtsi"
+#include "jhb100-pinctrl.dtsi"
 
 / {
 	model = "StarFive JHB100 EVB-1";
@@ -29,4 +31,6 @@ memory@40000000 {
 
 &uart6 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart6_pins>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
new file mode 100644
index 000000000000..d12b79376521
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2025-2026 StarFive Technology Co., Ltd.
+ */
+
+&pinctrl_sys2 {
+	uart6_pins: uart6-grp {
+		uart6-tx-pins {
+			pinmux = <PINMUX(PADNUM_SYS2_GPIO_A38,
+					 FUNC_SYS2_UART6_TX)>;
+		};
+
+		uart6-rx-pins {
+			pinmux = <PINMUX(PADNUM_SYS2_GPIO_A39,
+					 FUNC_SYS2_UART6_RX)>;
+			input-enable;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 700d00f800bc..74d427d7f2df 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -425,6 +425,18 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per0: pinctrl@11a0a000 {
+				compatible = "starfive,jhb100-per0-pinctrl";
+				reg = <0x0 0x11a0a000 0x0 0x1000>;
+				resets = <&per0crg JHB100_PER0RST_GPIO_IOMUX_PRESETN>;
+				interrupts = <60>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per0 0 0 60>;
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
@@ -440,6 +452,18 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per1: pinctrl@11b42000 {
+				compatible = "starfive,jhb100-per1-pinctrl";
+				reg = <0x0 0x11b42000 0x0 0x800>;
+				resets = <&per1crg JHB100_PER1RST_IOMUX_PRESETN>;
+				interrupts = <61>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per1 0 0 36>;
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -461,6 +485,30 @@ per2crg: clock-controller@11bc0000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per2: pinctrl@11bc2000 {
+				compatible = "starfive,jhb100-per2-pinctrl";
+				reg = <0x0 0x11bc2000 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_IOMUX_PRESETN>;
+				interrupts = <62>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per2 0 0 31>;
+			};
+
+			pinctrl_per2pok: pinctrl@11bc2400 {
+				compatible = "starfive,jhb100-per2pok-pinctrl";
+				reg = <0x0 0x11bc2400 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_POK_IOMUX_PRESETN>;
+				interrupts = <63>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per2pok 0 0 18>;
+			};
+
 			per3crg: clock-controller@11c40000 {
 				compatible = "starfive,jhb100-per3crg";
 				reg = <0x0 0x11c40000 0x0 0x1000>;
@@ -480,6 +528,18 @@ per3crg: clock-controller@11c40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per3: pinctrl@11c42000 {
+				compatible = "starfive,jhb100-per3-pinctrl";
+				reg = <0x0 0x11c42000 0x0 0x1000>;
+				resets = <&per3crg JHB100_PER3RST_IOMUX_PRESETN>;
+				interrupts = <64>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per3 0 0 11>;
+			};
+
 			sys0crg: clock-controller@13000000 {
 				compatible = "starfive,jhb100-sys0crg";
 				reg = <0x0 0x13000000 0x0 0x4000>;
@@ -513,6 +573,53 @@ sys2crg: clock-controller@13008000 {
 				#clock-cells = <1>;
 				#reset-cells = <1>;
 			};
+
+			pinctrl_sys0: pinctrl@13080000 {
+				compatible = "starfive,jhb100-sys0-pinctrl";
+				reg = <0x0 0x13080000 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0_IOMUX_PRESETN>;
+				interrupts = <56>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys0 0 0 4>;
+			};
+
+			pinctrl_sys0h: pinctrl@13080800 {
+				compatible = "starfive,jhb100-sys0h-pinctrl";
+				reg = <0x0 0x13080800 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0H_IOMUX_PRESETN>;
+				interrupts = <57>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys0h 0 0 12>;
+			};
+
+			pinctrl_sys1: pinctrl@13081000 {
+				compatible = "starfive,jhb100-sys1-pinctrl";
+				reg = <0x0 0x13081000 0x0 0x1000>;
+				resets = <&sys1crg JHB100_SYS1RST_SYS1_IOMUX_PRESETN>;
+				interrupts = <58>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys1 0 0 8>;
+			};
+
+			pinctrl_sys2: pinctrl@13082000 {
+				compatible = "starfive,jhb100-sys2-pinctrl";
+				reg = <0x0 0x13082000 0x0 0x1000>;
+				interrupts = <59>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys2 0 0 37>;
+			};
 		};
 	};
 };
-- 
2.25.1


