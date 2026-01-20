Return-Path: <linux-gpio+bounces-30791-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHJdG1xBcGnXXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30791-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 04:00:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 166AC5024E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 04:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E167660328
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D4542981C;
	Tue, 20 Jan 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lvfVrtAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10813428839;
	Tue, 20 Jan 2026 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910398; cv=fail; b=Ng9PZQUL0Q4BfQ16fLE8ZNpIIvgvRqea6tK195C+mF/g/csp9MLAjVXIa+cja7t0JWkXic3FXNPnldXBE/5F/i4WN4WKpBUT4Y6g48qdxg1wIfXJraBk7ka/kfAXLKwJhdn5uGdDURqXm0AO/ekCLFn8SsVNI4WTJcAmSq/zuJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910398; c=relaxed/simple;
	bh=PXAeISB14BDHEbe/iYoUniBZdWYn3uGNRMdw5S9Hw9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MIad3vAoVQxevG5v8H2wyF7yVgUGmplFLAWvhnllteUP/QAslT0+V3AIF3DuphBK8toV5ecp2SWcrejk3OEafEfvOjE/0EfoyNkp/TQqWyGAUnV6Iryl3EJib8jam9My3/FcLsul4b3Xiai02Z3l5kXSXgWjZ2gENKs0HyKo968=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lvfVrtAV; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SU+POMaI1t3lu13z63JZ5g66LMibgAWVLoz2UqIfi4C4VlasN8EFQ2x1qB87AqzruPm1qlE7a9lfj5hz1fNpsL16M2o8WDdxpp9tD5nNcuQajXMrgYnAa+sDR8a9NqCCCR25ZUS8JvLJJAUuWBj8JXmXJqa7NpxprIispBh8WKCabhcfmZVjHBM9TLvHibyIQm3p0F1416nt5sxr6St7Jp9WNNAAtYpY/vwNY5PC4uyyS6uWlBrsjkmFJ6O/iRLlsOSsKx4tsf8vpUkNiotAY7+3TPR794vWSNbMt4i9rTgfuAXW97J/LeEqw/O9EbEvoBM8bffs//M5UnqDxL3sBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7XCO0/t4x3RKB15Hc4Y7NW+gM7Ic4SEb9hA02MDXBY=;
 b=URtVF0PDPsrhNQrA0O30Xt6za7jUw4uZBHzOaKcyE5w3WatWY+eK1yAf6EHY3Uo4uxVzLg1JVRwWlmuwq1nFeQ9dqxfTXHHImQoNOfuZYCsBykXeQhm8VgH10kUgNUrb72JdR/0PMxyCqscPQSwAYD1XGWGYq1rQGNVcDad9XY3c8CZC/wJgexgL1TC4l7PvEHzp+BIpxZVIsf/zXfjByYq/meuwQvxatjfCLsmkjxeBc66JdbXFmFyUXHr8bbOZNxfr8vacwZNEH/uggsy2Jns99mjzyiobbmjpnRcaf6yeYoNpMa0cEu4xzvXyF89cOaC+A5A8laF/yyIMvxaVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7XCO0/t4x3RKB15Hc4Y7NW+gM7Ic4SEb9hA02MDXBY=;
 b=lvfVrtAVHm6LeF3nvFP/sMzQewHV7d84fyH7gHjYKyMrWbi2udxwUX3jT2cEzjVFepQqv6WwPO75q5rzhWrBmxizpdLT76y0ARDlAZ1UeOdOM6TMGdASJhKVqXIhReO4VdXFbl69zm9wqT89yKvjdoVKDj4Rv/XCWlVLGx1P02PPaImwieoN5UhQ62sfsNJgJF4jvFI0AobzUOjBhhpAgAtJytV7KeQ9Ol4HMV2kD47D/vy1PU3k4HwD9m5CBDoAhq4maMQWcpImrnssJb48WOEhYJIZEN7m+sWOIlJa5P77vMFismS8DIJuLAFiELzXtotvVxt4UGVYZBswl5LBQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:50 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:50 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 10/10] pinctrl: s32cc: set num_custom_params to 0
Date: Tue, 20 Jan 2026 13:59:22 +0200
Message-ID: <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::18) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PAWPR04MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 1232e983-692f-480f-8ba9-08de581b69f2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f8fQNYN8wN16cKQluign85HqYG7iTrL+R5kRn/+LTm3RY/RsAaauN1dPptIx?=
 =?us-ascii?Q?pXJ+McUKTNRt4ItdkX5Uvq10It+lS2IJJOX1pT9WK8r2VphQmcB5y+kIXAg9?=
 =?us-ascii?Q?hpc7ECeTRiWGiz2lvTe12KpOmW76sRzXwTfV/G4NJdqtbylIApHBJeYlv1gT?=
 =?us-ascii?Q?lxTYNPsRM7BIwALZqjf+vR4QTFsDPQwk60462bxX7X5/GkT93TQ0hEtAJDTn?=
 =?us-ascii?Q?hYqPHygVLpSMp1IK6UqcDqbfTZqNQ2RNT14bbPeZ/1ju4J25PWV0fXtaiYPD?=
 =?us-ascii?Q?fZOukwOhAE1GocK1nqz/SgnLLZEebNzN9Zuvs35+ssfQ2FmVOtEWqEiVNYRD?=
 =?us-ascii?Q?G34onPdvzv+Cb+Mdynm81vcgmbqhAoBUVG5OmseJzMfNk+tIzMVX6fbNvH6/?=
 =?us-ascii?Q?OtfDhbY8mk16ORrixmxU8KQtf1J5Zc6X56zBiFkptnH5ifyF+T7aU/9OHpG5?=
 =?us-ascii?Q?TRDC4g4avLeRr+XPaAJHR1LCJR1ctcYZN5PHq65ej7PSfJ5bj293EuBRODmw?=
 =?us-ascii?Q?y6ukM6Mn+gGWbtl/scxWALJcDceDDz2rHPohlgL6awe1whFwFZCb28tHILlR?=
 =?us-ascii?Q?fqJEu7FrYVQfLhBMnGKp5ztDSThrbrsgQNxOQsA5WZSmjnr/HUxwW2fhL/vS?=
 =?us-ascii?Q?PFm4D5sQc8r8tkRtXgG6KHzrG9etzxh1LQg2zgZU+leoE2rrNf7458jYcvFB?=
 =?us-ascii?Q?PQ5I+yxM6QilWS1HBR9GdRexoY4S8TKnmd74Q3bRdexbSj0nvfVFLZrAk/AI?=
 =?us-ascii?Q?mQZ+AQGZB+d7m+H7tXOaao7SuAzKrqr4XgGkIYAvdKcDo+0HZs5rMQ88WSJs?=
 =?us-ascii?Q?eDwQGm02s9ScPHIW3pGuR0MXN2j7VxCWFwqCISVV34evdzJVrl4WHnqcA3UE?=
 =?us-ascii?Q?rxibG7CVgDydOyWOSjoaKizXzh4Wpp+MY53SBpumjww/aLt/z7kI1OgmDWJ3?=
 =?us-ascii?Q?DYlJ1ThTFgBJsE2gk4QL/ho8idW7uO2k9E213dFsu11WR5h1wqpSxMXy0QXG?=
 =?us-ascii?Q?+48gYWvEKObrsPKex2ivCmlbYMjmagKz+xHq7uDXhuQ8kHo7/voqGiWsW0pZ?=
 =?us-ascii?Q?9kENBqyAgFm1hmOprs/bm+vRfOxciopqq5PD3XBnD/rdyy5gbUxVk1TeOAlq?=
 =?us-ascii?Q?bWpYsU2lU3vNvwXQbnrotqBQVcXwWUgu7fgjIMCIoZ3t2K99k3vPCJX0/kHu?=
 =?us-ascii?Q?R/D5Lwc5l9YAWAZ/4NtY7cSYxAQ0atJPi7s+/NELDE6tKkvuoCu9eOg4U6EP?=
 =?us-ascii?Q?Zz/MWin5Khzx43yB3xMl9XKJo2/Of4YGGwWsgMj1ARkjbPQM9w5E0bfM33Gt?=
 =?us-ascii?Q?HdmVZYr+iGOa11+KH1/3eNG6N4hr/+TTs4KIgPuXEkC2FRxc7VPn1F0HuGU9?=
 =?us-ascii?Q?0PQp63hdaNMCWw/gcBLl8xtfEeQR8SwNmFWvOVioTukm97/+p3tqNrPp5H51?=
 =?us-ascii?Q?ym5pLIo1Q0FxJMq9MF6or5obLBGJWhMUKrQxWLgLniP6Vc9Km33zoGmrgCda?=
 =?us-ascii?Q?KqwnvZxdCJuatYwCbKOfGfbzJtcR7ICn8xPXhiDCyzLq8BTg+AIdGbgeYU+0?=
 =?us-ascii?Q?vGM5wREEXkGEE0TUtm3fiUydHt4NH3MrPmI+mPbxLaBxDDeOeumsbIuDM8rQ?=
 =?us-ascii?Q?pg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qoPWVkGcYmWbRw+epyLXE2RrAEHneqe0HTLAKcKUwBet9ErJARqswenC3Ubl?=
 =?us-ascii?Q?p0r0HDJUM2/4mHkzuyj9Y5JrqskweRkPKGBUKVKlSJnguvmjFPzTh/zum7hW?=
 =?us-ascii?Q?kT+rOcfWiT05dNQ+K9Qbi0lbOO3Wvy8+EQH04CXSN3WDcHfoIFVgTQbdJGhA?=
 =?us-ascii?Q?gEOiKBIcD5WZJRX6eUErZBPMpBk9ZmtxHF4Hb1j0eOdwfhKrcvBRxKoUeURr?=
 =?us-ascii?Q?35g71kdpdnBfOyTYnuOi9jCjfVmc6kqhQIZWhvW8ujttB8cPIbzDMlrugse7?=
 =?us-ascii?Q?G6MAw7OB5pF9KrABicslXFnNCE9Qz8slVtCBJoAtjdgxXIoqtrmvSfV6uqzu?=
 =?us-ascii?Q?m3Gx37sRTTBGANIfUSkkX84RM1VkSSijqP3FnshmIgv1MYutjM+HNLAdY+b7?=
 =?us-ascii?Q?dxmjjuAEJ0luLhWLTLWamhNQPxt4z+OlyEni+1O42cKrsj0hGw2yZJGayI6A?=
 =?us-ascii?Q?zTEDycCfcwNHqO0QfpGLAZb/labIL+8OhFboXOu6I9mSxH7C60RCoawp87NM?=
 =?us-ascii?Q?rLjyYiLcdLcbzvVseL3kszxAoAZDZrero1NF0pr0L+j1MbCw6+wYdQHDR+CP?=
 =?us-ascii?Q?1+0ZIMsWC3/YhywocECfOFSQNbGwlT7zdyZRm9BD6fQ8fmyfOJeRuM+jVbvl?=
 =?us-ascii?Q?5ifB74vIZVgQKDd5R7YKSSmk3yrYH4WnME1gqHAbpE3tkNBzqMwO85Zvaz6H?=
 =?us-ascii?Q?erIBYpAzsx5CngCmWKmNGAQK8PYsBcuG39pAHrQ8hgY7r0kU6/ZqSJ2QeOiT?=
 =?us-ascii?Q?rQwxV6Ju8S1JFHxmyQs+f9zaM5kuJ16rJKn9I2sYGiftZ6xFw5lvsUDdBx+I?=
 =?us-ascii?Q?zsQMcYrEknhBd6ySg/fCFYhWQnLXgavnCnItjF871tYY0jK2IDQPq1FkJDoS?=
 =?us-ascii?Q?XZRHWofZxdHgIEszjKTmIOeiMjCIYmpGSnALdsF5sk1uSwC6LRI/C9gFtFyS?=
 =?us-ascii?Q?voG9l3Jp3EaS8TW8IbGArPctM3AR04nr535Qh11ugQZDTOCbiivTZQp7Ov00?=
 =?us-ascii?Q?JCbYn0Mzl1T/iSJrX5a2O0O6uxeKhNR3mIwCWQanqYIJe/AWS82MAzdYTsKc?=
 =?us-ascii?Q?25ppB2PtsU4uBHlK911G3G510eUjZA3f9dgDl67c7KVUpbTdBZ61ojFUC8/0?=
 =?us-ascii?Q?dGKambjrcCnZJDBJweo7y3ImFry9Ov3s+8ZGv5R9IbPouX8+9CBrxjP+HR7S?=
 =?us-ascii?Q?o92zHRGTZ4MkLEFAqYAm7BQOPTm11/rI12jc98fLzGOJWJwMvBfEFSq1cJXZ?=
 =?us-ascii?Q?uOJ+xjvKKyH5YnURfrYHQ6rRKo+PyO0wsKVCiCPIMZDBs5zBbzHY0ywwLrGE?=
 =?us-ascii?Q?FTtEY7BX2JJTkWq+/EwEnr6Y1Jj835lmRN3Y56AuUVYjhdGtewrJ8ce3z+fZ?=
 =?us-ascii?Q?Fw6ZDKeIkX73cujoeYU8fVFrQfQfBpO78EeGyjhcnAuFrbbR7INp9Qa55aIw?=
 =?us-ascii?Q?OnCLA/h3kZXz4WfOwstzoPsDXQ9yFCJHKFiMBNTKVCjgyUEODSX9uuEn/pO4?=
 =?us-ascii?Q?evlW9demg0VkrXgwWQ4WDYEkh2Qx7s+9UG3zqPdJAtnnCBAn6wK1nUyfxsWj?=
 =?us-ascii?Q?fPkhBIErs7AbdFpHgUrEYBweRRL6TrQ9LugXiQfiX1jr2apIYJmAe8ZXpbKI?=
 =?us-ascii?Q?kin+z2wLN6wvl/wSBMMfK/sfclhHrynYT7bQ9wk5NmdMQ1t0j/WdZy7Z7mZQ?=
 =?us-ascii?Q?TchWsXRNs+zlIqWBYgj1dZEItgtQ8klFYgtCpTRUmUil0ak9RZfz47EYey98?=
 =?us-ascii?Q?1xEMqV7/5ERLYmduMJCYKWpR8sXjjZMTduOg6HczwfZe5zME3iJI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1232e983-692f-480f-8ba9-08de581b69f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:49.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV9nj7fbliPVGXa62KIUw+46cIav4bZ6yGW6Ctc5Isj+rb0YIiWzUCpdLNzKs6CyzhozZ4/aDbttJc+90HvACDSsFVFmywjc9rYhZXipegWveelYkTg5qgNyDOfReazO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30791-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 166AC5024E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

The `num_custom_params` was not set to 0 and the pinctrl_desc structure
was not initialized with 0. This would result in errors when parsing
pinconf properties from the device tree.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 3e0c48068f08..27ea0b44a7aa 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -1272,6 +1272,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->pctlops = &s32_pctrl_ops;
 	s32_pinctrl_desc->pmxops = &s32_pmx_ops;
 	s32_pinctrl_desc->confops = &s32_pinconf_ops;
+	s32_pinctrl_desc->num_custom_params = 0;
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
 	ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
-- 
2.50.1


