Return-Path: <linux-gpio+bounces-36836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP0CHJuyBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:31:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB094541099
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B1D304D70E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939C13C060C;
	Thu, 14 May 2026 11:28:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73F3C0A0B;
	Thu, 14 May 2026 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758102; cv=fail; b=Wt5fjg8tUZgTxqB79qSfKjd8teKlrd5kQ8Hic8fO2v7gYp4FOZKOKVJovdKwlfQ9l+t8aJtZ9ejHBD20sHcoW6FcvUpFGT1HjReqjMB2gdQBB8T4J49PDaKmo+NehX6zVmY5tM34vdhTJZMP93mJ0m64d6W4wQF/mzARj+Yykq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758102; c=relaxed/simple;
	bh=oc3NP7wtIGgRP2JEVcMRK/gJFls4CPZA8onffm7qjw4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YpJg8udUnASOn4pv6k+0LBLcc95PsIhcqRYnyM8Y8o4hUsY7oeeS+H61zt1cS85UPR4R1YBPto1dd4CqfsFB87xxUZQhqWSKwr3Z55QyLPlimo70n65tjlp5TIySOnfdAqM0FwGa8KiuKRLGuB6iPf5tc/h6qRL00wD7y7X4o0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAzadbUyZeuUlubTOXsw+AQqbLEXcVbqUT3nm+3jAViLgGWLrvp5m9EuldpzH5ckF5mh8ar6F6jjitZibvhsyx6Tfjdgcw7d+PjAoIwQoTXs2axTk3O+i/54yG/1tFeJ7WaFo/eKYBiahSyuMmL8Ovxx/845wO78v+Vh/TGhzo5AP6qctQ/b8Q4XTPJ1yBUxW6Vv7Iy78U6wptD4G4N0Uvsc/1lrpBSI+RPQSVO5czYl6WWXsY11qrpoHgNiUtkIVH8ZmF+UtbQGXgUNbGhZyneraurtE4sHz97pFjUmWpCGWsRA9szbNgvQExt/Ky7JNvyVaytSAuY5nXD8VTpROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45FD97BgVkZj0h9C81gHiANu4LcR4thrjK+9QA6ksrM=;
 b=oA9WgMrs8NnG0jXmW77ze2XEsS3x3VZv1x/51fPiuk1vlETeBKhupB/jtroLXJ89S0b+K0mPY+Fa1r+xgb1yz3Vu3KRkh2oZORArqfFJbb8ZIOn8CEpfYCA7vynOG2fNYeAKE3qpkPJJONFx9q6kEPt96QsjDR2Hf0vJnC3h2325g7jphbyMrOpeRwRSft86fx1fXkzQqYp6Xi6vpAiW4UvUvBT9E/C4aDsIg9dG8osMfxsDK4BZ0/TwrbP5ck1w/APS5Asxg6eHour5/pUE0J7mBby4vyEDt0TVg9ol2RBY99Q/fqFeIvwpx94BAeWy8cYZJ3EME/OM2g0yQTe6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:32 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:32 +0000
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
Subject: [PATCH v2 00/22] Add basic pinctrl drivers for JHB100 SoC
Date: Thu, 14 May 2026 04:11:56 -0700
Message-Id: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 1f123ce4-66a6-4b2b-6bc9-08deb1a9b171
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HLMGabNr/oLMBtxvFv+gReQ4mVffbxo5/akPWwv+xPjvLJcp8l83mI7lUYpdjrvSkMRp1C5JqPjSfZnrruRgzz0m1RuzcbASCwHbhYlUdm2uJo0SrzPbEgMrE5kcO2l26k63D9+6F0P23wE0mpzhIhOWuBGEARudYqqCEz7v7gXc8KhU7sYNbAgeuHEF8bBTM4mQhGZ7U//zk01XB2lR4xy3KHPikIDyKAmkrZzTI1JnMIqdFuk7FShW3lMp88GmBwIzHTCwv+Gi7BeJVLOmfcMFXe/c6B+B3Am9bqrkVFNdNSYeks8hiMskN4/bYGMjwuYMqVu3x7+VO0VzDZP9zrS2BOPEwOHv59YXvgS6LUS5A/RnAyhyORWzwF9KIa9FpilqE7J71+XYgRiPIt1sGoJtm7R8VabnrhXioCPlYQetkN7awM0p47cchL3h1AS3+VZRYj4e9oL97UU4FJv7+g/NrQOAhpDS6Xk1z9+Nq9Ius/vC7nPYj72Wo9USW38ti/k5OfJyQhKf/ifilLTUIJwT56APMAV0c/hOI1GLEryTuiUmhrwcot1wYlP/uXWH3QS8/z0wQvUEt+XKA4+u/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P2+8MKE3eYY9CY2nHHsMkTXAPhHkpp4Cca3mOTOqAq+3PvoQ5PpFFRzZU+LI?=
 =?us-ascii?Q?OQjCZ04bYk8kLtDzX1Qc7vweiKCNm1rkekLSDouuWu/LiFYSYkMFWyKnsjLK?=
 =?us-ascii?Q?WMrZG/OLa1mtCwKFU/aU92bS/ezJUm6BaMwpofDb9JRWHczccgFZbqGW+2MM?=
 =?us-ascii?Q?TOVVgVKOqI4p2p9nzo8j9QQIWAo9+vMZq4AJy5gCRDcgteOufR98xeyD5TLb?=
 =?us-ascii?Q?B8CHETjgI4Mt7K/pSwjOH1CjC9qbxv/in+Z4KHx9cUPv86pMdZwOair0a/FN?=
 =?us-ascii?Q?QHtrks+9OM0u8ZVYoi+PeLyj6gGXJhIvBsGSTuB50lv5185qB24+33dhJ8nN?=
 =?us-ascii?Q?dQ/kLLOFRqHW4u/VPpQInnCmHZiP78RXJoaGorPA/84ZCmPOVbmheFfyiwac?=
 =?us-ascii?Q?QcZnYWpNl5S76xUA+R9hN7ctF5DLkalm1zl9HlLn5bJexDMKTiwYrifL16z/?=
 =?us-ascii?Q?WKD3SyB6w9EGQFloIFU/+bfw6tgwTYcyNwK84vj/9MeZmj7ReiKPZPoaPLfi?=
 =?us-ascii?Q?TnnDcmxiAclmnvTwp3Q/NUNUYCyQZBS/rKPuimOPiRZL93ioZqDSqcf7ivN+?=
 =?us-ascii?Q?VqX/fBduP+XU7RIB7D1EmLQrxqxCsCRifXlUGxKj7DOu+Xl3YneXraj94Roq?=
 =?us-ascii?Q?F9579Mb6hyKz5R4UOTxciSN3hcUWqESbEp8ckKAy0NAuJjQ0zxX7etc+K4KT?=
 =?us-ascii?Q?lx5wrkE88/V2aq8ZA6zESb3tQQ0rN77XJRHAI5u2Cg+lQ9GaJF9vhvnU/x/P?=
 =?us-ascii?Q?8BzzWOeeaayQ6rvhsausGzVEwHh69a6xqO7jPJd7Krg/P7faaBOVVgumJbao?=
 =?us-ascii?Q?qFmZiByql/TFuUtHbmE2HG1RyMQyxiWhK7gKi5dOGzJ4mV80pGH5X62xbE+2?=
 =?us-ascii?Q?ele80UIeNE1Yp18AUjF4HCz/Zp7ezL6HTBSa2JYjyVunAK8Ftxp6acn1hiEL?=
 =?us-ascii?Q?OWygAU+ClCvfa32ouRsaHCKAIG2VTzhvNSHeB/kTD2/8EXIZks8nHKtBXqDQ?=
 =?us-ascii?Q?AS5Ys/HqPB66H/nQ9MDgwzafowFv1vCmSKJbeH5pkZSPp390KbvpPXDf0MBC?=
 =?us-ascii?Q?t0y6jLQuqHyHSVu8iiWr1FTANEnrNkV2cnYX+v3Z/uPtQ94pNUBaEHpnL7FP?=
 =?us-ascii?Q?fiBx+CmiKkba76CGPuiYqSjEetYYcGDEuFxkwEaeI57GqTZR0QRf2Ccsbn0q?=
 =?us-ascii?Q?0Z3e3Jvjc8cWuk5T4yquCfdmPsDcmzNiOYbJja9j3LNp/3mJDqp8cXRAWoC5?=
 =?us-ascii?Q?Ydx5Gtg468kra5zJBC6ZFpEmxotIiIvEIIRwP+cAQyZka5Q4XqfZ6VPFZWk5?=
 =?us-ascii?Q?7u+SRbMe7XAhQ4Hk3X5WUqZyUF3GPpgwe+PkZ6DLc/T20n6QafyVGNZIMgCL?=
 =?us-ascii?Q?JAJFj55AYv1jc2eVq59vsNV+gA/gMlXmxjq1w5G+mEzGrKWnDE3DykC+LdCc?=
 =?us-ascii?Q?fGdX8jwQm5HPQz1ElSUcCQRwhPUTZWQ0NGWAqU4B7apo+eoX7p1Vvzf0aa5T?=
 =?us-ascii?Q?dodzUDdDSztIU7pK2hwDxAuJdzccYaFTVqLFckPsG14NCN5lg/t3Nud4V4ww?=
 =?us-ascii?Q?e8TCy/VdA6tf5qoRl4OL6lmnvNAhEKCQLKOjKc743hO5cV8BKBQw4fowYJPw?=
 =?us-ascii?Q?tOk3BPTFHA594OnEPAWjBYbCzRWefCjZnEY1Ei1cbXu2kyN7/X27NrGVAMAE?=
 =?us-ascii?Q?dGbD9Fytt5zcJXH3dkTZx7YcsVJUpHNWWBwTJPzglrd3X2IpXDoIrlX+QSnu?=
 =?us-ascii?Q?2RKWTmshXBoXlHU17RmNZDNY97WisD1EZQxf9AP6MXMHWTqDTLGC?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f123ce4-66a6-4b2b-6bc9-08deb1a9b171
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:31.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DLrwsih2Gr2aBQRKGb7S9s3rws1rxiG/pviyvnKD6WFydjXZWEqg1ycRH9YH9S70/egBw8N6S3VDdTEsTwyZ2BE9yNqoTI0QzNLLnqguL0nE/4wWIupixc5GKi+l4kE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: BB094541099
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
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36836-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.928];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:mid]
X-Rspamd-Action: no action

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

Change since v1:
- Add new patch 1/2/3
- Remove v1 PATCH 19

PATCH 5:
- Use the generic interface pinctrl_generic_pins_function_dt_node_to_map()
- Use the 3-cell GPIO framework
- Replace custom pinconf with generic pinconf
- Share a single interrupt number across multiple GPIO banks within the
  same domain

PATCH 4/6/8/10/12/14/16/18/20:
- Move pin definitions into the include directory

PATCH 5/7/9/11/13/15/17/19/21:
- Add a "function" mapping table

PATCH 22:
- Use the 3-cell GPIO framework
- Use pinctrl hog to initialize the pin group voltage.

v1: https://lore.kernel.org/all/20260424111330.702272-1-changhuang.liang@starfivetech.com/

Changhuang Liang (22):
  dt-bindings: pincfg-node: Add property 'input-debounce-nanoseconds'
  pinctrl: pinconf-generic: Add property 'input-debounce-nanoseconds'
  pinctrl: pinctrl-generic: Make the "function" property optional
  dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per3 controller driver
  riscv: dts: starfive: jhb100: Add pinctrl nodes

 .../bindings/pinctrl/pincfg-node.yaml         |   12 +
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  176 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  175 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  175 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  173 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  173 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  175 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  174 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  175 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  173 ++
 MAINTAINERS                                   |    9 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |   35 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |  188 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  110 ++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/pinctrl-generic.c             |   37 +-
 drivers/pinctrl/starfive/Kconfig              |  115 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  154 ++
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  165 ++
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  126 ++
 .../pinctrl-starfive-jhb100-per2pok.c         |   97 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  121 ++
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  123 ++
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   97 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   93 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  134 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1579 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  152 ++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  252 +++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 31 files changed, 5176 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

--
2.25.1

