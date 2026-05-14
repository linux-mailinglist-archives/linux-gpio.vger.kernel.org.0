Return-Path: <linux-gpio+bounces-36819-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA3AFpCwBWqIZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36819-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC3540F45
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DDE8303FAC4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2D437998C;
	Thu, 14 May 2026 11:12:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A123B9D98;
	Thu, 14 May 2026 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757171; cv=fail; b=iKsjYUL6SfJBUUZtDB+oCKUAQodP7DC+Nz9QQ2SaQQmA+tbTIhYUBU2mY+MIiVdKcerJhQNoR9X9kDvMe9kQ9sEkbLZYPgPeojl6MoiTFCPY8YSnA0BqMPGtfRbjeoZLJaWseVt3wKQcSvyLdSadVkMlQxbTQW4Bz+Z4FpFFJN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757171; c=relaxed/simple;
	bh=Y9+GOORsMh6cooEdyS1LHqCehXG7oBXTX82oZj7Qfko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MVKpHmtR/+GXiviLz4gy+PHA3FzDiLHOVjH8x5xS84pDrdm23oBJ+N/bixrd3GmPG+Mr2TaK5H0kbws1YH+JD8i8DOE5BqwRzoyHwEJSrNucbTLcULUWCVLEVaIq9JymToeil20pwtZjYn/Lml8mbqNeh+wKfCZ0LjJ9jfOTE+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwTD0SGMujxUY2Ua0xfY4MM+ARswO5QGH+bmG7i67fmeoAJTAFncSaLUCLNPsFQ8azwnSfpxqy/VBdYtcQ+F5bIavD7GZdqMHAy8loAkBiHRicQgCf9MttyFhH8o87GrOtQKp9BD2rU+WV5zkVfl0dc8DzkpjpKkkmD3Mg1QJTeHc5TWre0GeazVsRJLKqIlQq6JvRrVNB3Y8grFN6tqVqYUJvOIbzX/8uxMtLsCTxouJOLw3AHG9i3DYLN+WWkYxZZL6a2E2EIJ+j+SFvYnM89F0nL39wZQQbvlM96VmidiNmfUla/Qi/2uhC6BDkLV7tSESW/c2LceGu0XyMr0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS9Uf/UB6PdSA8gmV+7juzfQUdWhCJh9x0Dgw1H9wvU=;
 b=kiS7j6i/zrKgHxGa+fejyZ19xlEcHkb+Gu1pzzBYFFgGkX5SkXOceuwy+2fCLKZuVEVYpeMfnCUe7P9RVq459QmJa9F5Y7/MwN6iR7DRXBGt4GzXqOlYM7gJToTpikqiFiGVc5cCldEoqjcTt6bMf7pUHGKB8BxFq6l9j+HYVfv194kiUhWB1vMyQUPtbK63vuQiD8sTUhquKxaRzxyKtfENI4JN0ReKxnbs2YNXcHn07JNR91CNwa1aIeuhsvX7tWoADv8h50a1IbSom7DNTJiLPCll8y9hN/4w31lWoPrw8ep9XCGB8fF3eO94Dhrtm5zkChd3H+q0XTF/b/svEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:34 +0000
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
Subject: [PATCH v2 02/22] pinctrl: pinconf-generic: Add property 'input-debounce-nanoseconds'
Date: Thu, 14 May 2026 04:11:58 -0700
Message-Id: <20260514111218.94519-3-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1644fa38-eba8-4909-7fa1-08deb1a9b2c8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EzGVa5244xnekF1RkK2z1jUGuzBJ+/rWiXtVrB1YE/4Gq4jBfAOvVXICFVfhkjuK+eKtGD8JbpVsADIPYotXC+b23Xcx5ELO6XLTtzdQYOMknYAGG7kum8GccOcdo0B/j0dVYQTSbjNb6s9u0z6s0ucQ3CHd/qHh3E4N/SAZ/PfDaEhS98zE3lepK+F1crcGPqRhKw/T14hSaVYxEw0LQgDym9GPr+uPYMtOA7jGC5jHJUEGBl47E2XKQxRDAjz03c4K3wPu2F4ykfkNu9GmpCF/s+ksarbsBueHFh8ZpU9Lk67stsHMrgAQAma6IoSqYP10jsKddM4jVBlhmtPfthGSdWdPCQxYIeN5tX4VYsuSHlvhsjJzF5cEqDV4U9cgHr7rnvt/1hj8dsyEZKQiJwjdheXDOFDP9/m/7p/tmc0iKiUSTwiPeoBauc8e+fONBBc2sfvXdsdWcEV+Yx465wWWES1Zv0VtbuchH+LgKL5XOlA+IhVERMI/ndVJ/1sdBDvsLyq1sQkVUoaxKbht8McXct8YGMQJS1sacZPA8cqUsZDGEP/ouXmzWf0FSpJheiZX0RVNbc3tgR4Ddqn45g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HYtGOHeWHj9dnRGuQ4QRv3960uSa+oSqOXCqoJasavlXIl+wBnmuQ6I41U61?=
 =?us-ascii?Q?xA+SB3OlnGtymVb2FGtDY3NhD7Z0Y3foQr4t6CJHqr6+14KHZGAbIViwkGzK?=
 =?us-ascii?Q?SGs/Np7jnzoP0E8Aq/7HFzdZIY/v2b6MfGJQQWUZ1nt20QsWT/BElQ/p8xom?=
 =?us-ascii?Q?0bcTuWjFUdY5QYcO/H04MbI812yi8de97sPRFl1wVwkP3IqET2+7ZAiQk8nU?=
 =?us-ascii?Q?RcqyJ1T5x+5RaJ4rEaQC3Zg2Bm0qYxM/z1eDMTeMHar2bLqzom5QZHbwnDOI?=
 =?us-ascii?Q?947GqQZ+NcBAx3VjEt8qP5b3kFTtWK941N//Y8a4RdQumSG36jcuExoLlTNm?=
 =?us-ascii?Q?1UxGQ0zrcAAK1kYw+MIxbiuoxjmA8QjlTyFr+NIBLatkxyngc8n/tnsSYjC3?=
 =?us-ascii?Q?VjGpU6lCr+pYwfGNoFY5faJy07H/2RvfQz2YZKUNPR332lGb+K3Y3CMw8+Cs?=
 =?us-ascii?Q?+HxfmBHoXW2Mh30Mr+T8NgoIoEND6EJ+H6mAf9OaHMenU+iI0mmYifH0KQL/?=
 =?us-ascii?Q?uYswkzsBlufvNfo3+RO51Svth4HucBItDHFl8ssWEUageGx7fkTrXn2FmaJZ?=
 =?us-ascii?Q?iKYsDCdmp+b6xhpmEJdOLNMrTyx+kCjA4uEhSrijr48k9Gd8bZF6BsxpMXKM?=
 =?us-ascii?Q?orFgiGce5I/M0mlM1M3ZLLQtALh+O4vfxA7Rg3bLDpVd6k0c5f9LOcPGXKX+?=
 =?us-ascii?Q?85IL+yR3y5d6ei4RI0XzPbR0XFocQF+CWUuRVd5VTglkvXQlgDVQHo/e/eB9?=
 =?us-ascii?Q?TUdu45fAR/rZ72Z4z8BZ8STaUlkKzO2azGjadTG8A74hQkkwKXIIYFnHrVUm?=
 =?us-ascii?Q?Os4P0JwwF+cWj7faDCHejL3dndDUpmVm4ugb1sOzSUcy+KAxhBZpG/p+zTuY?=
 =?us-ascii?Q?IUxLlp4t3UFkd/ly5tqgYV6ljxbnpZsuIpEFakOswC9kmvzOM4W2XC7KcrsA?=
 =?us-ascii?Q?ArZKaK30l8xChLUhDnTBdELeyqFv9suAUgItlQLSALplL0NjHgIRgsCK1JDw?=
 =?us-ascii?Q?ZOZrB8XFFhtyPqbE7D8Mtt9frLL8/zpKC8XMT43UCV9VtYIuxMH8dgImGhBR?=
 =?us-ascii?Q?P4g6ywEvpByV45DPUFahs+P22TKGNxUDtwT6MAv2boU5iUQILULQVhQ23ZQV?=
 =?us-ascii?Q?kozw8cASnAHwMw1wMmvbiPdXHgFpKi0xKXT56N7yMRFQRS3Q9p1HCqIcmdN9?=
 =?us-ascii?Q?X/nsmFekt3IJnEMdqxULJofY+7cnd7UoB1q4HH/ABC58SJTozQRFdT8il1O7?=
 =?us-ascii?Q?5e7jJdB+N88PXv0q0HF1if+cpE6J+aO7bzxTclKHEIrrsMhA6+RfAqX8UsUO?=
 =?us-ascii?Q?FPbwhF8ObfR+zPjsUUZknfVS//qJhT8tPmuv2nIEGSxEwbX8viW3Phds1ca+?=
 =?us-ascii?Q?NX77cC8BgEI1oi8VL8JivzJMYG3+mMOUbsbuaK4oRvbPI8IHwqaQDMkRIzw2?=
 =?us-ascii?Q?h0DCrgQyCaN7bd6P2JSM0nZtm63b7o+aNfmpq1pD+HR4qVURyxtM2mEtBsQU?=
 =?us-ascii?Q?hIcqiLSZUa2lf9lxqj9iN56jWJ4UYtkp2vGx47U/v07PlQnObzr59zaddm4w?=
 =?us-ascii?Q?Zxl7sQblpeaizSCFOwfSGlTtXVCmylimtVfdRjTgqSOsptw8risnQJVnnxf5?=
 =?us-ascii?Q?egeoqMQzgrl+wpJrcCemk12r2x/wXA7wSUTVsevChxpLRcEqM06W0zN50Y1u?=
 =?us-ascii?Q?lefvdkwFVDWH5/JY5kcjzsHU/QXHgXxv8MliNtVoBVCqx5TgLejWrqopk7dY?=
 =?us-ascii?Q?w3PP5joqf5jyKWfdoiO2UJK3AGlp84m4sQRntArlQGKd/lS7cBUg?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1644fa38-eba8-4909-7fa1-08deb1a9b2c8
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:34.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHC2cBe2vTnTq968cDdXy2MC97BT/1em2/n8VHsnUhLXzVWnXDVhlkXBQ8foS4tdlgOvMcP1CtbtrPLA6WUBIiiGdEn5L2JIvewfLLHokSXs0Mk2n2DojIVV+9//V7F0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: EDFC3540F45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36819-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.905];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add 'input-debounce-nanoseconds' to the generic parameters used for
parsing DT files, along with the corresponding configuration parameter
PIN_CONFIG_INPUT_DEBOUNCE_NS. This allows debounce time to be specified
in nanoseconds as an alternative to the existing 'input-debounce'
property which uses microseconds

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 64ed28309788..02f88b2b8120 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -43,6 +43,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", true),
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE_NS, "input debounce", "nsec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_UV, "input schmitt threshold", "uV", true),
@@ -185,6 +186,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
 	{ "drive-strength-microamp", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
+	{ "input-debounce-nanoseconds", PIN_CONFIG_INPUT_DEBOUNCE_NS, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
 	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index a5d4b2d8633a..1df63c732b99 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -71,6 +71,10 @@ struct pinctrl_map;
  *	which means it will wait for signals to settle when reading inputs. The
  *	argument gives the debounce time in usecs. Setting the
  *	argument to zero turns debouncing off.
+ * @PIN_CONFIG_INPUT_DEBOUNCE_NS: this will configure the pin to debounce mode,
+ *	which means it will wait for signals to settle when reading inputs. The
+ *	argument gives the debounce time in nsecs. Setting the
+ *	argument to zero turns debouncing off.
  * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does not
  *	affect the pin's ability to drive output.  1 enables input, 0 disables
  *	input.
@@ -143,6 +147,7 @@ enum pin_config_param {
 	PIN_CONFIG_DRIVE_STRENGTH,
 	PIN_CONFIG_DRIVE_STRENGTH_UA,
 	PIN_CONFIG_INPUT_DEBOUNCE,
+	PIN_CONFIG_INPUT_DEBOUNCE_NS,
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
-- 
2.25.1


