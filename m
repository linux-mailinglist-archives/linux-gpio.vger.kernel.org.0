Return-Path: <linux-gpio+bounces-40069-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DSvZB/VcVmpN4AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40069-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:59:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E3756BD8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:59:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=YpHrM9dG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40069-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40069-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADFD9319CD5D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162184968FD;
	Tue, 14 Jul 2026 15:55:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023082.outbound.protection.outlook.com [40.107.44.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B734963D9;
	Tue, 14 Jul 2026 15:55:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044531; cv=fail; b=mlJsQp5yCm/dgxKL5W/abkrcdvrgexLJefHDHlDIWWvyTFC6m2OJXlo6T23nXaABZHUne85e7xBmX1HgYIlxVTVOM1+yTrJlimbJ7Ats/CUzhVomgJrt3xHyEd2kavkQGmjTzePHBDFziL713EEVNMjX08jUhs3WMcWFsRAMImo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044531; c=relaxed/simple;
	bh=x3e7kqj2bst2UoKPib83ZPbUl4OUxQJZ3xCLzVd1xmE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=snP2l2ncPzyJZIIsJUAAc6wQdf5ZQQb2aoDZmK/05kyvN98ISes6hTYL1QzZsDfyZ7NbaEQ9kCbMVXC86tUSDfVWd79brIcK6kvCyMTazMqLSV5ynYcE0t2Bo0wS20GBvJKy/Wda6rSnHdgi7FUGahjpyeAAl+nx61Mv/+rrJaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=YpHrM9dG; arc=fail smtp.client-ip=40.107.44.82
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfgWtKqgmzKESlzgyVNaf5YLgYVQU6gjljlkBpSCWhTezA437gwO47F2aEE/qov48bltXwaHjPAObdqryC0nmsz9rz/Kj1DSJ1qqx/8lf8mLjiXUTR9aIS2VLoBWzjKQkX/LrYDGDGtPtERAKZMbGFE9smwkbfZ7MUi+ELDAOxVN0HSQXu9Zy/41pn/8GoEEm468yNF+Kp/KHXKSQzqvfnQgb/cFRedPrTfcvN9t4cd4+3I4luioG+FLczR9SW011KVJjllT0AvjWgvKY85HAEn30GFdWek6z6NgBk1bVdQZa9KxNb1TWGqaUxs0+DwrmXbqdCM8BScvoPB8IuelVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhTCLPVF1YQbZpEE0GoOdYZUCVe8GMwCq6lBLPyRr3s=;
 b=lb13d06Z8P2ulrflcpvrpvF0STGeL3fZUpBiGajxRU/zGnwfe5J6Egy7hqUIalzVEr6sLs4yEAm8DONtD/UvxhmAHg/BgAbyHgR7WBgSvQ4FqwbfHScfyKLnR7Dmwc0BObfVg4jmv2JTj3vKFeOpCXpvyUfvjXzXF7D+p/GSIqVjX79ttexgs6USQXk/oPtt+Jp7fsKMX/h4cedv4T9tddnmbzlcg2IgCOaNbzuckaRKZsTyDMxda3wneKygJNkw0I5sx/IBjUV88+/U0m7skqGcBYpifkMlnBLaGrVQ+jC1DdidPYBklzIzoMcLOrW35apCIUPAvintshSjfok6yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhTCLPVF1YQbZpEE0GoOdYZUCVe8GMwCq6lBLPyRr3s=;
 b=YpHrM9dGbz48cqw/isJfEfEFJoutmFLyysQE8EQud30W4J+rWL3Nmsr1OWtlm7sNkFDmThgxKX0YTEQoaVGCCJqnZ+lIkEck7T7rEb5fLlvNa4ydzyaalGF35GUyFI/LV75HSanfBC70o61lhUcxqArVrVUbJkBBhiy6NdxxQzRC1Er1oKWi9XcWBI+SGi04Wxk3OSEcRSq8lRlsNxWLvhlYVvoJTGM1fDi+Ed6ubzOYJBLNrGaykRKL3SHUp9JHNy6Y/2pNfniHOllq/xv7uUMsAnPlEvpkfbH0RFNRmMoaJQCGqvKHHDucEiE5PZbcowcZF9RJjTLv6Dw91Zs/Rw==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6851.apcprd02.prod.outlook.com (2603:1096:990:4d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 15:55:24 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:55:23 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Tue, 14 Jul 2026 17:54:20 +0200
Subject: [PATCH v2 6/8] Add Advantech EIO Watchdog driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-upstream-v2-v2-6-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
In-Reply-To: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17129;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=x3e7kqj2bst2UoKPib83ZPbUl4OUxQJZ3xCLzVd1xmE=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu4pBwZdrsLLbYQJfkvWXvpkRBYwGKQ+wm+v
 BKJ9Hkt2HeJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbuAAKCRDO7dCnvL2w
 CSkkC/42Vbvt2pbEwf0QLAseE7aEycQAJ5n/V4lxuY1kwCo/tNCiqOUxnppnbGyFTqBUcWtblr3
 o5kw52pMrNbZdnVJEjGFtbCJp4NUcYrd0EH3CN/Ofhknfnl+ZOhWlxP4XF7Ei0IvzENA5ogMtEt
 t1ZDxmgGxv5dkqqN+wSIaC7pF/vh4rbGodCFYA3v0ziWDyohzjhX/SYrlmlh7nbLfernVqL7w4q
 saUk8FuaBZcW9EnEjbMmnBiTZQdNAtj0mtGWfGTcAG0NyrwQQntT5a+njHy+PX9I7ZWY/67/N/E
 zWlenAPJp6vr9Th3bNYmKjN4TGzqNcMgw2X7QO6o2Mp9CkyLTGMeVRjrgnOvI1xf9BHlF0oHeQd
 dJ2YUrcMAUxoVYWy5R8CV2CHaDon8i2uc6EBLWWlsSTCh+DZSi2aApvNn3rQ1JaHWlLNOd1wch8
 5Xwq5mnKgtCb4whCOIMjjCzpHBceK/EAjXbq50c78fhJgVjWWSYo4AtIUvAZUjFCZ5BR4=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|JH0PR02MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e44ada-22b0-41d2-8ccb-08dee1c050bc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|23010399003|376014|366016|1800799024|38350700014|921020|6133799003|56012099006|11063799006|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l5gmk82cKdxLa/ou6JNA36J12wlJmlQQnaCoHIyFsT0DVA2j7MdWdidawO03x4IlTH4vz58I2Vtuh9AGYHFgkagz7jnO8ddQXNnumRSsoVkEM188cIVDEOIHcbx6eGOLbHmDDf2R4B2xWRMlKvbnyzoROWslizbN3KNkZy3hbDWLzWylaINyGvUE7lYhuCmhy0x2AjWDufQhwJ7MPXtcrOUrTvtuOprcwhvVH4FeXqLcU+bA6+ydiWam5JcBAz1aQcUcNlunnM/eWNDtzAevAoiJkixh7p+SVbD8WchCiOVV6jZyuJFVY/FOD++QyOX7BSqG3vCBYekMr7Lbq+MwoUsl1cMiqF9usRWauVwXRzBFC1sE8TRDgWTMSytmthEpxcNF1NQkp9vni0GhwEjOEh3DB3IAtdSXGypoaMBr+axgv35fqKwWBVXqGHInzC+rtXrMNoapc4rx/mAH4GTtZXsN6rWLRPOpG0IO5qLKrC7p0Lecqrj3To/OeMzA02nTVWIRe/oxqkRKzJkt+FjpbAgSnOrTyAITP4dRq3bnXsJ02xrs3wffU+JhU6bH3aHqYN7b7vWtn9FB+IU4vJT0P2wqS7OgPU5OiL9gqDLjCMN+onjFcWXESdV+fJgEfSZ8JETxdF+pIFTupd7EoZNozxIySIhFLEmcOSNl8jgoCecoLkobg2oBRTfRhKkOnBsvdQCwzrei/rKYyDcQXz96qdAdKOghboBTlElUYiIARWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(23010399003)(376014)(366016)(1800799024)(38350700014)(921020)(6133799003)(56012099006)(11063799006)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHlTN3NGMWlzdnMzT3E4ZjBIbldFUDhvc1Y5bE5lRngxWWJVaTlSVU9oOUh4?=
 =?utf-8?B?QXRVRkNwSEZRQW9YNWFrVS9za3VKQjkrS1BVdnRPdDN1ajYvbnZBbG5JK0dJ?=
 =?utf-8?B?MVhiUHdnbnJDc1VZVW1mNVJSekZBd0NtcFVHcVQzak5xeXlMTjBZU2xOd1RZ?=
 =?utf-8?B?UUY0QnhaUHFYaTF6TEt5TStVNFJRMnhqaDVzSVllOElXQ1EzbG9RWGhueHNO?=
 =?utf-8?B?K3B0SEJFTjI5UlBTU3RBUTBmeDRsNzRkT1JDOEl1MnlBM0hmSm90dnU2eGx4?=
 =?utf-8?B?aVRxQ24xMWtDODBFRDJoTW4vTjU1djkxVk1qS1BaaFhtRnAwZ3M5NXpDMzk2?=
 =?utf-8?B?MHhiTzVkZ1dRYk94STlVcXNORjduTXJFeUo5dVRpT004NGNqRWpDaHdRWk9S?=
 =?utf-8?B?UFVMQnZGTXNPS09QMlY0VnQydWIxZlNHOENrUkptamtzVTlJZXhtd3R4OVl1?=
 =?utf-8?B?b2Nsc0Q0Tm9uNFVIZnZMY2pnS0w1ZkN0NnVOcDNJSVJJdVMxWEYwRUN0dE92?=
 =?utf-8?B?aGx2YlZEcExtZzFMWkhMTDYrZDNSdkpJOWQ3TllvTTJYSFMwZEQ3WTR3VDc1?=
 =?utf-8?B?T2VITEdGdlgrSWJWZnNKL1RHREM4czdMbkc4a2NNOEt6YytlQmowcVVuWVFK?=
 =?utf-8?B?bmlKV2llODZ6U2dHQjFuQkpUK3FVYU9BRDBBQUYwdVA5bnJZSHFiU0dKM2lB?=
 =?utf-8?B?R2VpOHY3NFY2dWJJT2JTUVhidlBXTDB5eHhiNUUvbm1qalZBdGhNRUxhUHcr?=
 =?utf-8?B?MGxVTitJV0xvQkdNQlBmRGhzdHkrYkVXc05NbUcxMlRJY2txdi9pKytWMElT?=
 =?utf-8?B?cTRrcEczZTlUajkvODlRQXd1eEx4MkJJZGlxeDVtSzIzb3lpMXBQcUZXYmY2?=
 =?utf-8?B?SDQzcG5RaXdNS00zcFViTlpkTk5TNmc1Njc5Y0dPMGppUlg2SHhLZ2ZhNlNn?=
 =?utf-8?B?Q21SancvbTBGeVk0VXlzQ3o2c25BdnIvd0dZUlJ2a2JNNU1nS0ZlSnJYQWtI?=
 =?utf-8?B?YjFMdGQ3TnBQeDFnRkRMUWgwenV0MmZYdjZSTXA3Z0xmcTduWEtndE5NYk90?=
 =?utf-8?B?RnNjZzVHWk9jYmZjc3VrZWJZTCtidU4wdDVOOWZ0WDB3d0VaK2t6WGtqcEo0?=
 =?utf-8?B?MHRLODUwVlNidVV3MVRsRER0enNTOTUvMDhtcXdkdDd1b1ZpTWthNHlLcFFI?=
 =?utf-8?B?TDdGYVdhaHdYWWErNjZaaHI1czB3cDJJamlIUnZwNE5vRUNlU051QWFvWldx?=
 =?utf-8?B?WHQvZFdleDVvNmNGQlpEYU13dWhvWFhqUVIveThiejV5ME0wQ1NWazRwaTdV?=
 =?utf-8?B?aG95Q2l3NE05YTJINnI2VXZjeDYyZ1NURGVKNXd4NmhxTnNsL1lIOVdMajR6?=
 =?utf-8?B?RXp2cUVySlBsSDdCUUVTZEs1bXlNZVhTeHcyUHJHb2x6eGxpdS9mTFlveXFl?=
 =?utf-8?B?MkhZeDYySklSTjloQWQvbnc3NkpKWWhsUmNoUThDak85Y1hraUtET1lYWkRh?=
 =?utf-8?B?bHRKTWUxOUhJT0VGTDBtZFBsbEFzazNNVjMzU3hxU2JyYlZ0ZWxnaE5qOUtn?=
 =?utf-8?B?Z3AwaGYyem95eEVTRTZ2S09keUJ4UEVUODZ4Wml0WnQvaXBwZEIwMjF6RG9v?=
 =?utf-8?B?bzRZa3ZQdDdUZUF2NFQyQnZBZWQvbllSZUhSWUJCNkZYZE8xRVlJVTEwOTlG?=
 =?utf-8?B?SVd4eUZrdXpVc1plMkNTVW9MSVhpZGxUMXRoUU03L2JGR05YaStRbnorZ3lz?=
 =?utf-8?B?aVY4dGdremFBMURVWHJEeGhGemhiK1phb2dKT05HOHh1OE5xMDRXbTNEa01J?=
 =?utf-8?B?clIreGlPTTY4NTZ2dGV6b1MzV1hGQVhJQkFzWUlGSlZLWjkyOTRuMStrZTZ3?=
 =?utf-8?B?RWNRM0xRSS9kekNkd1V2RHFxeDVaVHZaWG9lM2lkZTdyOStTTDRmNEpRb2hJ?=
 =?utf-8?B?T1RVV3RvU3JYQ3crSGtNcGxUeXhjM1NmR1VsVzNvTjN5SmZBQVJvV3F1T1M4?=
 =?utf-8?B?bGt3ZEk5OHl2c3FreTJPZThONWpZSlI3cW1DS05IZHZWczlYUUpkbUNYNXdX?=
 =?utf-8?B?SnNtRFZXUXZRZ1I1cU9vMVJqVXpxMjN3T3B2SXZza1pPaW02NlNJUittTFJv?=
 =?utf-8?B?dEpIaUtnYW1Yc0JId214RVhhc0xzMXhvd2p3T0toV0x2dE1SdW1wSGVyeWFz?=
 =?utf-8?B?bmFZTXBsaTMwWTVzNmFEQW1FZDBqS1VwSjlLN0dCbytZU2JBZ1V6UUxXWWgy?=
 =?utf-8?B?YVNxMGhKdTNZL0ZsZlZ2SkRTV3c3UUsyQ2wvWXJCdHgrc29QUmQzN3JLNUJr?=
 =?utf-8?B?VnE5SlN6QS9FRkZqemVGQjlWMjRqc1d6cWtyWHVlNnFNYUZEOVI0MVNyRHA4?=
 =?utf-8?Q?Kyk6K6jf13JfUcc4=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e44ada-22b0-41d2-8ccb-08dee1c050bc
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:55:23.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLtnVWyEXE32LKQm8jdoHUkVCPcizk0QrstmGr+f8Cy5Cw9GfSEXNSY1quB5muaaAnoh/dPZpnk1lwhNIgL4JCCFjPveIswWYQ1aBQQLG88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6851
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40069-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:wim@linux-watchdog.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-kernel@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenkai.chung@advantech.com.tw,m:francisco.aragon-trivino@advantech.com,m:hongzhi.wang@advantech.com,m:mikhail.tsukerman@advantech.com,m:thomas.kastner@advantech.com,m:ramiro.oliveira@advantech.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,gmail.com,gmx.de,linux-watchdog.org,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[advantech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[advantech.com.tw:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 968E3756BD8

This commit adds the driver to control the Advantech EIO Watchdog block,
this block is included in the Advantech EIO Embedded Controller.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS                |   1 +
 drivers/watchdog/Kconfig   |   7 +
 drivers/watchdog/Makefile  |   1 +
 drivers/watchdog/eio_wdt.c | 641 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 650 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d2d7d815ed44..8d35fd7c5599 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -617,6 +617,7 @@ F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
 F:	drivers/video/backlight/eio_bl.c
+F:	drivers/watchdog/eio_wdt.c
 F:	include/linux/mfd/eio.h
 
 ADVANTECH SWBTN DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9f013d774897..bc0f13f4f79c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -265,6 +265,13 @@ config DA9062_WATCHDOG
 
 	  This driver can be built as a module. The module name is da9062_wdt.
 
+config EIO_WATCHDOG
+	tristate "Advantech EIO Watchdog"
+	depends on MFD_EIO
+	help
+	  Watchdog timer driver for the Advantech EIO.
+	  If unsure, say N.
+
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
 	depends on GPIOLIB && (ACPI || OF)
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index cb78e9932eae..eee059cfe1da 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -229,6 +229,7 @@ obj-$(CONFIG_DA9052_WATCHDOG) += da9052_wdt.o
 obj-$(CONFIG_DA9055_WATCHDOG) += da9055_wdt.o
 obj-$(CONFIG_DA9062_WATCHDOG) += da9062_wdt.o
 obj-$(CONFIG_DA9063_WATCHDOG) += da9063_wdt.o
+obj-$(CONFIG_EIO_WATCHDOG) += eio_wdt.o
 obj-$(CONFIG_GPIO_WATCHDOG)	+= gpio_wdt.o
 obj-$(CONFIG_WDAT_WDT) += wdat_wdt.o
 obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
diff --git a/drivers/watchdog/eio_wdt.c b/drivers/watchdog/eio_wdt.c
new file mode 100644
index 000000000000..b3c036a004b3
--- /dev/null
+++ b/drivers/watchdog/eio_wdt.c
@@ -0,0 +1,641 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Advantech EIO Watchdog Driver
+ *
+ * Copyright (C) 2025 Advantech Co., Ltd.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+#include <linux/uaccess.h>
+#include <linux/watchdog.h>
+
+#define WATCHDOG_TIMEOUT	60
+#define WATCHDOG_PRETIMEOUT	10
+
+/* Support Flags */
+#define SUPPORT_AVAILABLE	BIT(0)
+#define SUPPORT_PWRBTN		BIT(3)
+#define SUPPORT_IRQ		BIT(4)
+#define SUPPORT_SCI		BIT(5)
+#define SUPPORT_PIN		BIT(6)
+#define SUPPORT_RESET		BIT(7)
+
+/* PMC registers */
+#define REG_STATUS		0x00
+#define REG_CONTROL		0x02
+#define REG_EVENT		0x10
+#define REG_PWR_EVENT_TIME	0x12
+#define REG_IRQ_EVENT_TIME	0x13
+#define REG_RESET_EVENT_TIME	0x14
+#define REG_PIN_EVENT_TIME	0x15
+#define REG_SCI_EVENT_TIME	0x16
+#define REG_IRQ_NUMBER		0x17
+
+/* PMC command and control */
+#define CMD_WDT_WRITE		0x2A
+#define CMD_WDT_READ		0x2B
+#define CTRL_STOP		0x00
+#define CTRL_START		0x01
+#define CTRL_TRIGGER		0x02
+
+/* I/O register and its flags */
+#define IOREG_UNLOCK		0x87
+#define IOREG_LOCK		0xAA
+#define IOREG_LDN		0x07
+#define IOREG_LDN_PMCIO		0x0F
+#define IOREG_IRQ		0x70
+#define IOREG_WDT_STATUS	0x30
+
+/* Flags */
+#define FLAG_WDT_ENABLED	0x01
+#define FLAG_TRIGGER_IRQ	BIT(4)
+
+/* Mapping event type to supported bit */
+#define EVENT_BIT(type)	BIT(type + 2)
+
+enum event_type {
+	EVENT_NONE,
+	EVENT_PWRBTN,
+	EVENT_IRQ,
+	EVENT_SCI,
+	EVENT_PIN
+};
+
+struct eio_wdt_dev {
+	u32 event_type;
+	u32 support;
+	int irq;
+	unsigned long last_time;
+	struct regmap *iomap;
+	struct device *mfd;
+	struct device *dev;
+	struct watchdog_device wdd;
+	struct eio_dev *core;
+};
+
+static char * const type_strs[] = {
+	"NONE",
+	"PWRBTN",
+	"IRQ",
+	"SCI",
+	"PIN",
+};
+
+static u32 type_regs[] = {
+	REG_RESET_EVENT_TIME,
+	REG_PWR_EVENT_TIME,
+	REG_IRQ_EVENT_TIME,
+	REG_SCI_EVENT_TIME,
+	REG_PIN_EVENT_TIME,
+};
+
+/* Specify the pin triggered on pretimeout or timeout */
+static char *event_type = "NONE";
+module_param(event_type, charp, 0);
+MODULE_PARM_DESC(event_type, "Watchdog timeout event type (NONE, PWRBTN, IRQ, SCI, PIN)");
+
+static int pmc_write(struct device *dev, u8 ctrl, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_WDT_WRITE,
+		.control   = ctrl,
+		.payload   = data,
+		.size     = (ctrl <= REG_EVENT) ? 1 :
+			    (ctrl >= REG_IRQ_NUMBER) ? 1 : 4,
+	};
+	return eio_core_pmc_operation(dev, &op);
+}
+
+static int pmc_read(struct device *dev, u8 ctrl, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_WDT_READ,
+		.control   = ctrl,
+		.payload   = data,
+		.size     = (ctrl <= REG_EVENT) ? 1 :
+			    (ctrl >= REG_IRQ_NUMBER) ? 1 : 4,
+	};
+	return eio_core_pmc_operation(dev, &op);
+}
+
+static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	wdd->timeout = timeout;
+	return 0;
+}
+
+static int wdt_set_pretimeout(struct watchdog_device *wdd, unsigned int pretimeout)
+{
+	wdd->pretimeout = pretimeout;
+	return 0;
+}
+
+static int wdt_get_type(struct eio_wdt_dev *eio_wdt)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(type_strs); i++) {
+		if (strcasecmp(event_type, type_strs[i]) == 0) {
+			if ((eio_wdt->support & EVENT_BIT(i)) == 0) {
+				dev_err(eio_wdt->dev,
+					"This board doesn't support %s trigger type\n",
+					event_type);
+				return -EINVAL;
+			}
+			eio_wdt->event_type = i;
+			return 0;
+		}
+	}
+	return 0;
+}
+
+static int get_time(struct eio_wdt_dev *eio_wdt, u8 ctrl, u32 *val)
+{
+	int ret;
+
+	ret = pmc_read(eio_wdt->mfd, ctrl, val);
+	if (ret)
+		return ret;
+
+	/* ms to sec */
+	*val /= 1000;
+
+	return 0;
+}
+
+static int set_time(struct eio_wdt_dev *eio_wdt, u8 ctrl, u32 time)
+{
+	/* sec to ms */
+	time *= 1000;
+
+	return pmc_write(eio_wdt->mfd, ctrl, &time);
+}
+
+static int wdt_set_config(struct eio_wdt_dev *eio_wdt)
+{
+	int ret, type;
+	u32 event_time = 0;
+	u32 reset_time = 0;
+
+	if (eio_wdt->event_type > EVENT_PIN)
+		return -EFAULT;
+
+	/* Calculate event time and reset time */
+	if (eio_wdt->wdd.pretimeout && eio_wdt->wdd.timeout) {
+		if (eio_wdt->wdd.timeout < eio_wdt->wdd.pretimeout)
+			return -EINVAL;
+
+		reset_time = eio_wdt->wdd.timeout;
+		event_time = eio_wdt->wdd.timeout - eio_wdt->wdd.pretimeout;
+
+	} else if (eio_wdt->wdd.timeout) {
+		reset_time = eio_wdt->event_type ?	0 : eio_wdt->wdd.timeout;
+		event_time = eio_wdt->event_type ? eio_wdt->wdd.timeout : 0;
+	}
+
+	/* Set reset time */
+	ret = set_time(eio_wdt, REG_RESET_EVENT_TIME, reset_time);
+	if (ret)
+		return ret;
+
+	/* Set every other times */
+	for (type = 1; type < ARRAY_SIZE(type_regs); type++) {
+		ret = set_time(eio_wdt, type_regs[type],
+			       (eio_wdt->event_type == type) ? event_time : 0);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(eio_wdt->dev, "Config wdt reset time %u\n", reset_time);
+	dev_dbg(eio_wdt->dev, "Config wdt event time %u\n", event_time);
+	dev_dbg(eio_wdt->dev, "Config wdt event type %s\n",
+		type_strs[eio_wdt->event_type]);
+
+	return 0;
+}
+
+static int wdt_get_config(struct eio_wdt_dev *eio_wdt)
+{
+	int ret, type;
+	u32 event_time = 0, reset_time = 0;
+
+	/* Get Reset Time */
+	ret = get_time(eio_wdt, REG_RESET_EVENT_TIME, &reset_time);
+	if (ret)
+		return ret;
+
+	dev_dbg(eio_wdt->dev, "Timeout H/W default timeout: %u secs\n", reset_time);
+
+	/* Get every other times */
+	for (type = 1; type < ARRAY_SIZE(type_regs); type++) {
+		if ((eio_wdt->support & EVENT_BIT(type)) == 0)
+			continue;
+
+		ret = get_time(eio_wdt, type_regs[type], &event_time);
+		if (ret)
+			return ret;
+
+		if (event_time == 0)
+			continue;
+
+		if (reset_time) {
+			if (reset_time < event_time)
+				continue;
+
+			eio_wdt->wdd.timeout    = reset_time;
+			eio_wdt->wdd.pretimeout = reset_time - event_time;
+
+			dev_dbg(eio_wdt->dev,
+				"Pretimeout H/W enabled with event %s of %u secs\n",
+				type_strs[type], eio_wdt->wdd.pretimeout);
+		} else {
+			eio_wdt->wdd.timeout    = event_time;
+			eio_wdt->wdd.pretimeout = 0;
+		}
+
+		eio_wdt->event_type = type;
+
+		dev_dbg(eio_wdt->dev, "Timeout H/W enabled of %u secs\n",
+			eio_wdt->wdd.timeout);
+		return 0;
+	}
+
+	eio_wdt->event_type         = EVENT_NONE;
+	eio_wdt->wdd.pretimeout     = reset_time ? 0 : WATCHDOG_PRETIMEOUT;
+	eio_wdt->wdd.timeout        = reset_time ? reset_time : WATCHDOG_TIMEOUT;
+
+	return 0;
+}
+
+static int set_ctrl(struct eio_wdt_dev *eio_wdt, u8 ctrl)
+{
+	return pmc_write(eio_wdt->mfd, REG_CONTROL, &ctrl);
+}
+
+static int wdt_start(struct watchdog_device *wdd)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	ret = wdt_set_config(eio_wdt);
+	if (ret)
+		return ret;
+
+	ret = set_ctrl(eio_wdt, CTRL_START);
+	if (!ret) {
+		eio_wdt->last_time = jiffies;
+		dev_dbg(eio_wdt->dev, "Watchdog started\n");
+	}
+
+	return ret;
+}
+
+static int wdt_stop(struct watchdog_device *wdd)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	dev_dbg(eio_wdt->dev, "Watchdog stopped\n");
+	eio_wdt->last_time = 0;
+
+	ret = set_ctrl(eio_wdt, CTRL_STOP);
+	return ret;
+}
+
+static int wdt_ping(struct watchdog_device *wdd)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	dev_dbg(eio_wdt->dev, "Watchdog ping\n");
+
+	ret = set_ctrl(eio_wdt, CTRL_TRIGGER);
+	if (!ret)
+		eio_wdt->last_time = jiffies;
+
+	return ret;
+}
+
+static int wdt_support(struct eio_wdt_dev *eio_wdt)
+{
+	u8 support;
+
+	if (pmc_read(eio_wdt->mfd, REG_STATUS, &support))
+		return -EIO;
+
+	if (!(support & SUPPORT_AVAILABLE))
+		return -ENODEV;
+
+	if ((support & SUPPORT_RESET) != SUPPORT_RESET)
+		return -ENODEV;
+
+	eio_wdt->support = support;
+
+	return 0;
+}
+
+static int wdt_get_irq_io(struct eio_wdt_dev *eio_wdt)
+{
+	int ret  = 0;
+	int idx  = EIO_PNP_INDEX;
+	int data = EIO_PNP_DATA;
+	struct regmap *map = eio_wdt->iomap;
+
+	mutex_lock(&eio_wdt->core->mutex);
+
+	/* Unlock EC IO port */
+	ret |= regmap_write(map, idx, IOREG_UNLOCK);
+	ret |= regmap_write(map, idx, IOREG_UNLOCK);
+
+	/* Select logical device to PMC */
+	ret |= regmap_write(map, idx,  IOREG_LDN);
+	ret |= regmap_write(map, data, IOREG_LDN_PMCIO);
+
+	/* Get IRQ number */
+	ret |= regmap_write(map, idx,  IOREG_IRQ);
+	ret |= regmap_read(map, data, &eio_wdt->irq);
+
+	/* Lock back */
+	ret |= regmap_write(map, idx, IOREG_LOCK);
+
+	mutex_unlock(&eio_wdt->core->mutex);
+
+	return ret ? -EIO : 0;
+}
+
+static int wdt_get_irq_pmc(struct eio_wdt_dev *eio_wdt)
+{
+	return pmc_read(eio_wdt->mfd, REG_IRQ_NUMBER, &eio_wdt->irq);
+}
+
+static int wdt_get_irq(struct eio_wdt_dev *eio_wdt)
+{
+	int ret;
+
+	if (!(eio_wdt->support & BIT(EVENT_IRQ)))
+		return -ENODEV;
+
+	ret = wdt_get_irq_pmc(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error get irq by pmc\n");
+		return ret;
+	}
+
+	if (eio_wdt->irq)
+		return 0;
+
+	/* Fallback: get IRQ number from EC IO space */
+	ret = wdt_get_irq_io(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error get irq by io\n");
+		return ret;
+	}
+
+	if (!eio_wdt->irq) {
+		dev_err(eio_wdt->dev, "Error IRQ number = 0\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int wdt_set_irq_io(struct eio_wdt_dev *eio_wdt)
+{
+	int ret  = 0;
+	int idx  = EIO_PNP_INDEX;
+	int data = EIO_PNP_DATA;
+	struct regmap *map = eio_wdt->iomap;
+
+	mutex_lock(&eio_wdt->core->mutex);
+
+	/* Unlock EC IO port */
+	ret = regmap_write(map, idx, IOREG_UNLOCK);
+	if (ret)
+		goto unlock;
+	ret = regmap_write(map, idx, IOREG_UNLOCK);
+	if (ret)
+		goto unlock;
+
+	/* Select logical device to PMC */
+	ret = regmap_write(map, idx, IOREG_LDN);
+	if (ret)
+		goto unlock;
+	ret = regmap_write(map, data, IOREG_LDN_PMCIO);
+	if (ret)
+		goto unlock;
+
+	/* Enable WDT */
+	ret = regmap_write(map, idx, IOREG_WDT_STATUS);
+	if (ret)
+		goto unlock;
+	ret = regmap_write(map, data, FLAG_WDT_ENABLED);
+	if (ret)
+		goto unlock;
+
+	/* Set IRQ number */
+	ret = regmap_write(map, idx, IOREG_IRQ);
+	if (ret)
+		goto unlock;
+	ret = regmap_write(map, data, eio_wdt->irq);
+	if (ret)
+		goto unlock;
+
+	/* Lock back */
+	ret = regmap_write(map, idx, IOREG_LOCK);
+
+unlock:
+	mutex_unlock(&eio_wdt->core->mutex);
+	return ret;
+}
+
+static int wdt_set_irq_pmc(struct eio_wdt_dev *eio_wdt)
+{
+	return pmc_write(eio_wdt->mfd, REG_IRQ_NUMBER, &eio_wdt->irq);
+}
+
+static int wdt_set_irq(struct eio_wdt_dev *eio_wdt)
+{
+	int ret;
+
+	if (!(eio_wdt->support & BIT(EVENT_IRQ)))
+		return -ENODEV;
+
+	ret = wdt_set_irq_io(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error set irq by io\n");
+		return ret;
+	}
+
+	ret = wdt_set_irq_pmc(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error set irq by pmc\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wdt_get_irq_event(struct eio_wdt_dev *eio_wdt)
+{
+	u8 status;
+
+	if (pmc_read(eio_wdt->mfd, REG_EVENT, &status))
+		return 0;
+
+	return status;
+}
+
+static irqreturn_t wdt_isr(int irq, void *arg)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t wdt_threaded_isr(int irq, void *arg)
+{
+	struct eio_wdt_dev *eio_wdt = arg;
+	u8 status = wdt_get_irq_event(eio_wdt) & FLAG_TRIGGER_IRQ;
+
+	if (!status)
+		return IRQ_NONE;
+
+	if (eio_wdt->wdd.pretimeout) {
+		watchdog_notify_pretimeout(&eio_wdt->wdd);
+	} else {
+		dev_crit(eio_wdt->dev, "Watchdog expired, rebooting\n");
+		emergency_restart();
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int query_irq(struct eio_wdt_dev *eio_wdt)
+{
+	int ret = 0;
+
+	ret = wdt_get_irq(eio_wdt);
+	if (ret)
+		return ret;
+
+	dev_dbg(eio_wdt->dev, "IRQ = %d\n", eio_wdt->irq);
+
+	return wdt_set_irq(eio_wdt);
+}
+
+static int wdt_init(struct eio_wdt_dev *eio_wdt)
+{
+	int ret;
+
+	ret = wdt_support(eio_wdt);
+	if (ret)
+		return ret;
+
+	ret = wdt_get_config(eio_wdt);
+	if (ret)
+		return ret;
+
+	ret = wdt_get_type(eio_wdt);
+	if (ret)
+		return ret;
+
+	if (eio_wdt->event_type == EVENT_IRQ)
+		ret = query_irq(eio_wdt);
+
+	return ret;
+}
+
+static const struct watchdog_ops wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= wdt_start,
+	.stop		= wdt_stop,
+	.ping		= wdt_ping,
+	.set_timeout	= wdt_set_timeout,
+	.set_pretimeout = wdt_set_pretimeout,
+};
+
+static struct watchdog_info wdinfo = {
+	.identity = KBUILD_MODNAME,
+	.options  = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
+		    WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
+};
+
+static int eio_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct eio_wdt_dev *eio_wdt;
+	struct watchdog_device *wdd;
+	int ret = 0;
+
+	eio_wdt = devm_kzalloc(dev, sizeof(*eio_wdt), GFP_KERNEL);
+	if (!eio_wdt)
+		return -ENOMEM;
+
+	eio_wdt->dev = dev;
+	eio_wdt->mfd = dev->parent;
+	eio_wdt->iomap = dev_get_regmap(dev->parent, NULL);
+	if (!eio_wdt->iomap)
+		return dev_err_probe(dev, -ENODEV, "parent regmap missing\n");
+
+	eio_wdt->core = dev_get_drvdata(dev->parent);
+	if (!eio_wdt->core)
+		return dev_err_probe(dev, -ENODEV, "eio_core not present\n");
+
+	ret = wdt_init(eio_wdt);
+	if (ret) {
+		dev_err(dev, "wdt_init fail\n");
+		return -EIO;
+	}
+
+	if (eio_wdt->event_type == EVENT_IRQ) {
+		ret = devm_request_threaded_irq(dev, eio_wdt->irq,
+						wdt_isr, wdt_threaded_isr,
+						IRQF_SHARED | IRQF_ONESHOT, pdev->name,
+						eio_wdt);
+		if (ret) {
+			dev_err_probe(dev, ret, "IRQ %u request fail: Disabled.\n",
+				eio_wdt->irq);
+			return ret;
+		}
+	}
+
+	wdd = &eio_wdt->wdd;
+	wdd->info        = &wdinfo;
+	wdd->ops         = &wdt_ops;
+	wdd->parent      = dev;
+	wdd->min_timeout = 1;
+	wdd->max_timeout = 0x7FFF;
+
+	if (ret) {
+		dev_err(dev, "Init timeout fail\n");
+		return ret;
+	}
+
+	watchdog_stop_on_reboot(&eio_wdt->wdd);
+	watchdog_stop_on_unregister(&eio_wdt->wdd);
+
+	watchdog_set_drvdata(&eio_wdt->wdd, eio_wdt);
+	platform_set_drvdata(pdev, eio_wdt);
+
+	ret = devm_watchdog_register_device(dev, &eio_wdt->wdd);
+	if (ret)
+		dev_err(dev, "Cannot register watchdog device (err: %d)\n", ret);
+
+	return ret;
+}
+
+static struct platform_driver eio_wdt_driver = {
+	.probe  = eio_wdt_probe,
+	.driver = {
+		.name = "eio_wdt",
+	},
+};
+module_platform_driver(eio_wdt_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Watchdog interface for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


