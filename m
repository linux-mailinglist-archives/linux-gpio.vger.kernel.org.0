Return-Path: <linux-gpio+bounces-36822-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB6CGoewBWqIZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36822-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE7A540F0D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6793094ACA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC303B2FC2;
	Thu, 14 May 2026 11:13:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9C53B5F59;
	Thu, 14 May 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757181; cv=fail; b=VlgzPEF5iBm9GV4mhxbhRwbFR9hKRJqxgjPxJjpGQXyaVIX3kdk9Q1Wmxl8gC0KHMgXW0r45t+oHyqmzGiCnnDgH2Oh48ZurHFXpdV8dFx/f3hz0RMjZ9YaUN4hbmMz1udNlFmcPLoG4lwa82Qm7dmh8pVSsJNIdw5Ef4+emQz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757181; c=relaxed/simple;
	bh=VmywJN2wldiO7LZeSSU7RSY8Z4eIUzTHODNbSOZGfI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QBxml7mmlqYJ7deS2ijdFJSYHa4ILyYYkdkXxCY3BYEmOKP6b4Js3pU1u0fghgeu2YpZtxZbjeklg1iVC2Im7YvKGM2o61R08gz46O/IuaydVKsWP7yrJCtv00p+4hCeLfhERbUTzDPR+TpkuR4vxRUFN2KmAqUxUPRNSeznc+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Va9M2lrsOaveF77PTtA3A9iZYQM+aneHlQRDvd/WswWpxNu1hjAl1WqVI3XCrAUC+dCKg7lMUpQeIM42H0rM6j6pApuzlwfrSmdDSyOeI71mF8I+f83pi1Q5wQLAViSaSRUdf886PTRMUJJw4LZnIcBHCYgGdmqHJaslicuQTvz07/bNO49elDtMhhU3dg7CB8yTCpvPVoyOgJt5bAWDwBdv0JvGwpvjv39arPR9bT69Nh2l+9eIAeZXDaENsWsiyrN+s4mdIGrkFuMEXd2GGh/QdOWjDSi+8lw+NPv/N4EDs0S9zwR2LiCvjA/4sZHxf0ztHxn1ZS/hg+RSM7ON2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qm8lAXKmRIo4j43PA66w3oSdXDbQeqmjEFJw4hdmaU=;
 b=WNJYSLnDbOIm2/4V27KMgxwEw76YPMunFKchMorNQaOOlpT6DU70bBLggBwt1JTsFIxQaszA2dK88xbAnwMi5CBFF8eHIiUiPuhi0gtqYwjhibh6VLeAxOYjMtWXtDvw5voszqOGYPYKknJozIEwnNdFmNH8dAfaatxmQuzNyrgt6pjIagB+4xCuRyv6c2LVsIugOgqbRbT0YKR5F9WzIl9TebvxTj+46SYYxrAxcOBz+mC1raRPQRsmhckk8Q60UqJLhCudD83HP1lWoxxDdiB9Z+FywE1yMJGwLWk+eQxRxB7tknmO7sZNBEBS4FuBxzFZ32znjA+MBnPb7Bw+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:35 +0000
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
Subject: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function" property optional
Date: Thu, 14 May 2026 04:11:59 -0700
Message-Id: <20260514111218.94519-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: e9939af0-b592-4ad2-1eb8-08deb1a9b388
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	99/hZ9e4YDGqPeeZk4lyHSArYZcOoRembS95ieazLaeSUXPBxtUAsfpGCBrjiwPGcFf+yEfG4f3dP9q8KgCIXXUfCG1lDLDhdtL6FKRRHBIm7bAWm468nv6LsVGSBxaWM8Iobz3Q0eZj2HnFGt4d70A+Yh1073dUb060wPQ4Zhfl45XLPJ8MoM/5MM3N6U6vE1r/X+X/czU3IG157msVFO+ZLz8Ejl8oZpaWguNaVFm9Y8qjL3NnYsaEs/LRhEOk/anNKBbQr6kM2F7dBLLLOqwWwapWOm+T0iveOYUmbyolwoeWfvuQS6D4vKz//mFE9hVq0omXqcSyBEbh5aMw/BKJpOkdTUAN+teLcG0bMHXMuc0YOJC71ub2MyDLycIJTRE9nOrKZ4KL9s43ddDrgLdUrq3IJwbg4/8HaSaH1QPDiT4rbgL9wNeJrZMAXeAeLrg52f9OtVpRiG9VjHPAvGPuquSxrxTUm1dEyboow7KvoDVLt7RsDICGvIIyjHSj569/ILCrG/bi+WfGnqYojhNiiWML3AI1VKSp43j1VCO/0CsglfaN26V84U7yPbnoTy0zX6aetF529b6+IGq7Vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0PR0t38zbOtRzBN9wxc6PgXP54y059vEb5yEINk34hJ4DYdF92hRq1U60mv?=
 =?us-ascii?Q?5qlHGDI6pv4uNp2q3OfXGQyf9XVhz+5BtS69MzMRNW8DP5N/Lfg8nRAvL7yD?=
 =?us-ascii?Q?vQXZDDQ0rjLWtS5SH48VQ8rIowhtGkNyAZsazLMcot9MMPzDJ+ZiZYJkiDMH?=
 =?us-ascii?Q?LZFRHapMJ056za7hpkW6m8lHY41i5mgZ+C+CG97ep4B4HSUHMCm5Mgtwi7ii?=
 =?us-ascii?Q?7vs2u5biU3EaSBESm0S2FvjRlY/f3VrMljvyf04ryUdh6ByAj3I925HT6YQq?=
 =?us-ascii?Q?xbFUpqOEAWdTCbX4pGbrOLB1/7EiROp9+xILj8BBDCz3/3KEo5WPqps0ipQc?=
 =?us-ascii?Q?oamsyO7Rp5SbxzP3U0ZtHjZfvfhRHIitkDn5hMA13Jl8IRNBNiV1RX7US8F0?=
 =?us-ascii?Q?Y0QV5wC62ssRTahnDBI/Q077a1DgIGFmcs90gg8Ebzwf/uCUeYuRUztIF7g2?=
 =?us-ascii?Q?+hsE6FM73JP0Leu7JbFqPTfOu6LAAmoPqps4cpmltLrn0dP7GOSretugoad/?=
 =?us-ascii?Q?cIbwhc7dAk3Oh4mXiqcBcW+szoJLFT+drqXt/Ne7z4SSYBEUmGr+gbn9G8w4?=
 =?us-ascii?Q?28vXVxfSwa02IQmmlR6w6WDXQ3iM27A5wGeKkuFCnW2N6qk+XvCObVAgySV2?=
 =?us-ascii?Q?qiH1fPPLnP+B9lDAgIqWW0TWs13Iliq9iS+yzJ+iZByx3Y26UxR0GFR4ycuL?=
 =?us-ascii?Q?zqrtWvTGL47DhLkmWP/K0WV7oy2jM/gAhejEC3SlxCyeJMqZSdtaOZj4whFI?=
 =?us-ascii?Q?YssAS33PzXE7aySRzWsUyEathZ/6tZIy0ZiQ9MUTvqqdwqBgIMlaehROECjd?=
 =?us-ascii?Q?0RFoPc9XGVmGJkqLH9f3Ya0BOz+oN6OSq+XpuyxxhJdfwFNs8EFEIe+7QWEy?=
 =?us-ascii?Q?Q4Q8MNmnbrwUNCwcslgyH1Wg7qEp/jzB7rRajn7ZxkJpDNRGjJuwS+L8P964?=
 =?us-ascii?Q?VQpSN8jBBoZ4ikoPhiwc0jgMa+pqawhk3a+xVKQLeMojuvgOU/9OvykkUFDR?=
 =?us-ascii?Q?Uxq+sF0vBjPgUgBZea33GUWWTleyEzr2STj2A8x2aO8mVIFBDYyxkxZsOnkI?=
 =?us-ascii?Q?J+MydLT3WMOBorU1gzkqNMYgFWEZSrg5mB+IphsjjRSmn3XHHMiq2WcKID8T?=
 =?us-ascii?Q?xmqfyadT3w4OwLxPgE7QuwwZ++R6VaUZvDik1LNoVfAEbaM+NdJ9FuIW4MQm?=
 =?us-ascii?Q?CTwCJaJn4GbVkRYZKKCOqmQjQcV67M2vV0jdwg5QNeI9YoqdXjamcSg/RPp3?=
 =?us-ascii?Q?ltJD8vycqz5LmhNr6JAXy25yiNmIsmPxbTBKUSHm4Dy3+2QzwSiuT9Qmk4NI?=
 =?us-ascii?Q?WBdARix0Qg9VTglV6oBYvPnXIpYMtMTdcHFX5Uw9OICzdA81u+VfScXpJ+FL?=
 =?us-ascii?Q?u2DJ0pZkDgw93xmueFFYwHPLF1KJOUMw+5LwCFkpoVbyOC2LpEf8a+3xg5ez?=
 =?us-ascii?Q?FY1+IoqmWub8lL5nKG39vOYVFF1k2SPDQpHe1FulT5akGoHKOH4v0QeqNwHa?=
 =?us-ascii?Q?vHrS+jiIB5E0CJdNpmZlnSQKWmcn7dkQM5ETPzst/QPFjgfjwxwUxjrUneyZ?=
 =?us-ascii?Q?D6tvAwONqJciB4GJgTcIXVPbuBNg+l66OpuWqKBN0ZL8prYqSXIC4PUh1vjq?=
 =?us-ascii?Q?PLtvqZf1PM2PeDgChmO1KV7cRXgj2FpbY79UNfbnMQxBfo2Whq03qqC6+oTi?=
 =?us-ascii?Q?zsajHuouUtWQumtIS7EWILF5s+DzccYRKFBmHhCca+4cLu2c6aL+nh2t8Yj0?=
 =?us-ascii?Q?ZctvfOvcFB6Lmakg7xTvhjtDIK/ShNum3YBsPSUGDZ9dcPVC+HK2?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9939af0-b592-4ad2-1eb8-08deb1a9b388
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:35.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FC0fp9Z/fJO9/OB/PjrK3W5bnWbKfQnVeIV2QW3M8ijzzTuoAbzT2JD/sYceaJadaIQvKN3ohieqb0hmRFAZF5xa5Sj7WYT85FBAzIr8YXgJSaYwRX2MCAHrdEyJ2Tse
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 0FE7A540F0D
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
	TAGGED_FROM(0.00)[bounces-36822-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.869];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Some pinctrl subnodes only need to configure pin properties (e.g.,
power-source, bias, drive strength) without assigning any mux function.

Currently, the driver requires a valid "function" property for all
pinctrl subnodes. This forces the addition of dummy or redundant
"function" entries when only pin configuration is needed.

Example use case:
gpios-configs {
    config {
        pins = <0 1 2 3>;
        power-source = <0>;
    };
};

Make the "function" property optional. If it is missing, skip adding
the mux map and only process the pin configuration.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/pinctrl-generic.c | 37 ++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index efb39c6a6703..c7dd0924aa0e 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -62,19 +62,36 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 
 		pins[i] = pin;
 
-		ret = of_property_read_string(np, "function", &functions[i]);
-		if (ret)
-			return ret;
+		if (functions) {
+			ret = of_property_read_string(np, "function", &functions[i]);
+			if (ret < 0) {
+				/* EINVAL = missing, which is fine since it's optional */
+				if (ret != -EINVAL) {
+					dev_err(dev, "%pOF: could not parse property function\n",
+						np);
+					return ret;
+				}
+
+				devm_kfree(dev, functions);
+				functions = NULL;
+
+				/* Continue parsing all pins */
+				continue;
+			}
+		}
 	}
 
-	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
-	if (ret)
-		return ret;
+	if (functions) {
+		ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps,
+						num_maps, reserve);
+		if (ret)
+			return ret;
 
-	ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num_maps, group_name,
-					parent->name);
-	if (ret < 0)
-		return ret;
+		ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps,
+						num_maps, group_name, parent->name);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, functions);
 	if (ret < 0)
-- 
2.25.1


