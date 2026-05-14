Return-Path: <linux-gpio+bounces-36842-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MU1Cb/DBWpMbAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36842-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:44:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE18541D91
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA7EF30117F8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33B83C81B8;
	Thu, 14 May 2026 12:44:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2102.outbound.protection.partner.outlook.cn [139.219.146.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B733C2782;
	Thu, 14 May 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762684; cv=fail; b=KoDxpBNP+KKd1/idg/Iz58gAJotNW+g946q0D/TrWFeIxzze7EGcnG3uMJuaXN2q3JrTr8AnxzCqvOHVO84WjV3p/Kaxe7/7wVWInyooQS+nrX8IYdHUFrtmd3qaU0865WCauPQJti+YOmb7LPvQtpccrqq11HQRCK8AqRR0pXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762684; c=relaxed/simple;
	bh=Qn0ZQGlJgREFd5W4tWGo76T1raRXkDUXgxpetApS5Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZoA5r/1haPPOAU33apE30j7b3eBMpx6779OynQPa2oa3lEfiCGNR6w76I5NKLLnAPv9ic8eu5vKxxRXJc9AB4Jd1+XFc+gua1pjzVUgMLv74i3Bvbt63dy2IVEDkrmu9xINGf8sTgwk/nGz+r5KuDvKoTAAixdfxM2LQbknZ4CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKQvfG7fYYbpYupgs9LLd0zG9HX/lPrm+vuUuz8i7dtddKJ9hUC49QrBaIi7LyAf6vwXELgplI1jSYrp3i/925xNGz6BMdVMxSH5X+Tc5vKXvtyrOeoON4cqdY7i+rLi7G/s3l3DthLToZUJq6xPlMZqzouBLfuFXX3SaQmje3p629y7rR5W+b6VRHWN+C9blJqZ3rirReppakv6ynq6aHW/hU7Ao0usuiBFn/lgWNMM/q7rksIonxdnq6obntOQqyEtkI7AbqksuC1Ytl3b125NBlJob+G1h+hZ9ebtbEppT7/Y+NRZoCc3N1dqF9cEAfDWVte4b90BTBRmEEc0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJp7C+4xUdxX/qRbm9G2JNGxkNWVctGqsWIx+5YvXDA=;
 b=PbLB+4fd1G4oV0cccFr6F8xwYkKXqSJhB5CIPQFFG4K4OJE8bQilXYxaEg4Hill0g1eI8+ceipo3zIFfMGeQ9I699otjFo91UjJqhSLhOqPB8AawVWwy3nnSFx+vIxlg2vd9xBPEj4fYgOJ6Uy0F8ZSs5JBXqZ3JWin0t34EqiCeb9CwnKhXtUyRAo16TaZVryUrv6+ksGezzttJ2f0NGOFVqBZnQibylbE9GIuHvJ6eeSzhRh2UfDSoxNIYJxdCuhHryfvZikpKtAQCG44lED7hPunyWYn77mLYJ4ZfSf+YHJ2vLrcPNMK+OPVOhFld9NlO+/sayqtd0Kd25CbZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:49 +0000
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
Subject: [PATCH v2 15/22] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Thu, 14 May 2026 04:12:11 -0700
Message-Id: <20260514111218.94519-16-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1139:EE_
X-MS-Office365-Filtering-Correlation-Id: f48b731b-351b-4a59-5088-08deb1a9bbbc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dBy7+H8hMc9ZHdK3gfF3e001qctFV1jC/S7yGYOK02lDotY5PwomM+aVvQApAKK9dvQFRWcwv68FYyvFV96hi16qZKnqfT1B6ofcilbUzWMR+pduV9lKZK/HBdvKJIRuWhYfRSDdgiJ+3n9tu4yQ/WNuxpE9JVOsFMIaZEiz4diu9n4kqLxEY+7SWJaq5Yh+2Cc27vruAr1e4I/xuMF4FzOChwpcTKrX+lacPMjBhrymy15ah6yAlKpao+mxsRZUw9fPOAlqGNLYWYTtOjZGkNzb++ap0GXhZkduV/wbWaLw/gNaEGT1EHEt33pa/6/WWUREn1jACRqlohnPWLLfeQm59YnfUVjElg8f8i/nxl1CHG5g6ObziR5HF+XEJywaIXH+atfXdl5WhvI7HuL+nUr0mBPUNG0MrbIbsERjDpgx36NDFw2mdSFoFX4pnYi/rNXj/zFhELHYyOwavTg3jcYPtzRR/mf1hM9m+6i5MsNZPwf5ZsHC2XSQ0s+YviOx/Lux97YwPrITTgQ+YnA7zT5HhwKUW534HqPTZAJc8vPo9EW+oIZFwY+3poYVn9L4dv9dn7h2PDl81R4IZjGLVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L9hRUtwzi52G7HQEaTr1dJ/hoL84uwwfVTLZnLQfrp2hyfwK+50pnaTz5yM4?=
 =?us-ascii?Q?3xj2dGbSpbaDYf85MAQzSN05b5ifzIa/xa1/hY1n8TNUC6R78Uep6ThFrEnL?=
 =?us-ascii?Q?SgCdTOxG/0sdynjH5mt/E3+dUXl7oYGzagEk64cGbNNmlzLUtxhabFlaY4J4?=
 =?us-ascii?Q?3kcw00zl7lURUA5rcSRjfyB4CM79biycc/PVO2L+u6Cqj6tA5UhFTpQYI5oN?=
 =?us-ascii?Q?lY0hN/1146aJ9eZxZod6x2/0MJA/wnRLa2wREWlXs1HrRDGrrNlV4v86ttAW?=
 =?us-ascii?Q?LHUKSaS/mMrBJ3wadGq32YPoyElmLouxgRlyYUJYanvr/hYS1RlObasSCu7K?=
 =?us-ascii?Q?iNgRRqgJqhHfjqZUe5y3xedEDbYR2h2Y3Pu9XYWxxz0yFk2pdtQt7/W4xfuM?=
 =?us-ascii?Q?t/h7f2018SlJi526kCs30qGeqAVzRuBz1f97LNxyGL8DTCGU4KaQ8BGbCfyx?=
 =?us-ascii?Q?TsVkMtwz53j4p79lxE6IHREFnIxtawSrjtJPruIHXw/FtaimxeJQtkojgep5?=
 =?us-ascii?Q?OO8uEcZyG/Z61VPqneGIjHuAaGMcKktErerqBUQnHTpUYtgKo4unSPdGsOCh?=
 =?us-ascii?Q?qRxRHzIez9iRhZIhIQc5MiKf7Ubbei4ILfu/vvR61CfGJDN6X4dhytVPmsIN?=
 =?us-ascii?Q?P4ndxcnrw78fdRIIETcRl7Tr+Cn2f6+YO0pRrzba6LQx4fZE6mH19PaWCwGf?=
 =?us-ascii?Q?gKVyI58hhU+GptfEzNnUGVsqdz9dCuWUmS/I6JfJz3XQha3GvoGKhui9wxHj?=
 =?us-ascii?Q?S/o0FeKOAyLbraYRRw8Y0fTdlwk46oDNHpAiUn7Im/fiT2nCPOwO4cC+78y1?=
 =?us-ascii?Q?cqRoodBJbZhNI+DdotvCcbQ6nbhyJwzXLZjuSPnNkuYoDv5bvOneoo0iNmqs?=
 =?us-ascii?Q?gaeu9XBihK/8wSQWk+4gf4O7rVQeo3bunrcHU+VAHZJbOdIQoeNnv9Efa8dB?=
 =?us-ascii?Q?0wJb/J8d8FFKaRoNHQhG+89xlWz+bgLMn7gg5m9EzAWFK5YOgX6qxcddyV2R?=
 =?us-ascii?Q?tY2+IDmHZfibTLh9TIuhIRuKSt6MveMpQbnMObTvPrmTbJ8XNmpRjKUbvsVG?=
 =?us-ascii?Q?t/4t7X8D/zveHlLCmbTXs/69IwkpmRvvVtLAT8P2oXzAH66jpKruHDH0DT3G?=
 =?us-ascii?Q?+c4ieWvNJoyrLOF8YXF37owxp7imMfxAkqv69DtsF2Ei3RVO8gAFoJomSANJ?=
 =?us-ascii?Q?ZgNSg3Vv5QXZtkBhQ+2oQBlY06eEbpe+F4toYC7tkLuBFt8Q8OOpTnUkp68d?=
 =?us-ascii?Q?/ZMGoLNP3snUH/N/LKR9sgnneDeCZ0EJ51J6yukUFkm7TxSWz5/AqYz4Qsgk?=
 =?us-ascii?Q?ov4dS7qQgbtv00pLDGuB69/swGg+KOwtWz5ohTJd+eRhPHRSmHWHmhAsVwXG?=
 =?us-ascii?Q?VAR1xLeEELR7iFRTmho9fFotSyKoqGs2GpAqRg44SSjvqWCRyTJ2ZNnIPpbr?=
 =?us-ascii?Q?Q6nnjG0rZGCjKDNL4hf8vnEJJZgyEoNte/bsi8aeSEU+rc2UbssrgCg8EwRs?=
 =?us-ascii?Q?kVZ2igxLsCJlCxxtx/F44BijWP8ffYe3hIIAxE7u5NJq+LnGE3KOhGE7raWQ?=
 =?us-ascii?Q?ihRDikyxORUkRRdtgnnLa2uOh2WbGBpQNVmY/8Imkejc2t9ekbT2EmzI6JOB?=
 =?us-ascii?Q?MQuy84Gg2Mdt6CKfHQ6NL2AGa0nYyGUvHAhA9OX6xsluRYhUxvOnQMjDYBw+?=
 =?us-ascii?Q?l7NkqfEfQTFieVNfP7hPT6lZuY/tKUo3aHnL8peY3y4UF4rLEDo2ese35LoH?=
 =?us-ascii?Q?pUpCXJYTiFxbdwpmSOSNp2fmw8YydaBqNRm7u45REXGfBG3oTLSq?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48b731b-351b-4a59-5088-08deb1a9bbbc
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:49.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuGh0CscS/0hl181TfrmfNLa4DMVVysRFeZA3xGT8kuN9oxiiDY0tFSdYHHMICtRO6nv8Oyl2MkiJ2p6MdfzfZxy0RSjWyekqE8Yr8dIw6YM2MOuncyCEvQREMFWNYvO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 7DE18541D91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,starfivetech.com:server fail];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36842-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.908];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   | 165 ++++++++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1e1bfdf87c31..c3889a152f6c 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -67,6 +67,18 @@ config PINCTRL_STARFIVE_JHB100_PER0
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER1
+	tristate "StarFive JHB100 SoC Peripheral-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index f2bb0c35a2a0..6beef7e313ef 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
new file mode 100644
index 000000000000..91dfa113ca06
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-1 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_per1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 36, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per1_pinctr_rldesc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 32,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start			= 32,
+		.pin_cnt			= 4,
+		.input_enable			= { .shift = 0, .width = 1 },
+		.mode_select			= { .shift = 1, .width = 2 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.open_drain_pull_up_sel		= { .shift = 5, .width = 2 },
+		.schmitt_trigger_select		= { .shift = 7, .width = 1 },
+		.reserved			= { .shift = 8, .width = 7 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per1[] = {
+	{
+		.name = "gpioe-spi",
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C0,
+			PADNUM_PER1_GPIO_C1,
+			PADNUM_PER1_GPIO_C2,
+			PADNUM_PER1_GPIO_C3,
+			PADNUM_PER1_GPIO_C4
+		},
+		.num_pins = 5,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-qspi0",
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C5,
+			PADNUM_PER1_GPIO_C6,
+			PADNUM_PER1_GPIO_C7,
+			PADNUM_PER1_GPIO_C8,
+			PADNUM_PER1_GPIO_C9,
+			PADNUM_PER1_GPIO_C10,
+			PADNUM_PER1_GPIO_C11
+		},
+		.num_pins = 7,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-qspi1",
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C12,
+			PADNUM_PER1_GPIO_C13,
+			PADNUM_PER1_GPIO_C14,
+			PADNUM_PER1_GPIO_C15,
+			PADNUM_PER1_GPIO_C16,
+			PADNUM_PER1_GPIO_C17,
+			PADNUM_PER1_GPIO_C18,
+			PADNUM_PER1_GPIO_C19
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-qspi2",
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C20,
+			PADNUM_PER1_GPIO_C21,
+			PADNUM_PER1_GPIO_C22,
+			PADNUM_PER1_GPIO_C23,
+			PADNUM_PER1_GPIO_C24,
+			PADNUM_PER1_GPIO_C25,
+			PADNUM_PER1_GPIO_C26,
+			PADNUM_PER1_GPIO_C27
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per1_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per1 },
+	.func_sel		= { .reg = 0xbc, .width_per_pin = 2 },
+	.config			= 0x14,
+	.output			= 0xa4,
+	.output_en		= 0xac,
+	.gpio_status		= 0xb4,
+	.irq_en			= 0xc8,
+	.irq_status		= 0xd0,
+	.irq_clr		= 0xd8,
+	.irq_trigger		= 0xe0,
+	.irq_level		= 0xe8,
+	.irq_both_edge		= 0xf0,
+	.irq_edge		= 0xf8,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per1[] = {
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "sfc",		.val = 1 },
+	{ .func = "sgpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C31) },
+	{ .func = "sgpio",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C35) },
+	{ .func = "spi",		.val = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per1_pinctrl_info = {
+	.name			= "jhb100-per1",
+	.pl_desc		= jhb100_per1_pl_desc,
+	.crl_desc		= jhb100_per1_pinctr_rldesc,
+	.regs			= &jhb100_per1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per1),
+};
+
+static const struct of_device_id jhb100_per1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per1-pinctrl",
+		.data = &jhb100_per1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per1_pinctrl_of_match);
+
+static struct platform_driver jhb100_per1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per1-pinctrl",
+		.of_match_table = jhb100_per1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


