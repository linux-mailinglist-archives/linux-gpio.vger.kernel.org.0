Return-Path: <linux-gpio+bounces-35451-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JlzCWfK6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35451-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:41:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22466458DA1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63DA5300D56A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363AA299A87;
	Fri, 24 Apr 2026 01:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BcKTN8z+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA629D28F;
	Fri, 24 Apr 2026 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994813; cv=fail; b=h4NSG2OpzxEPjdotKtCgtqGp8rO5rqwa8fMmsEtZ9icHNpMTd8P+493lTLyCh/aFpvQ1alhfFif5ke6hfgMq0mhGA8CgBhd2Rsy5ftjFkDSC0b2BcG6CW+gcPM0tl1tnVFDsNUMKOO08lP3KifvJcL+pjodDp4sG+qNl40r7tpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994813; c=relaxed/simple;
	bh=cLTIfnGAzIjEnDLYcdNOv8VjdnMkTIVDwIhgt3FnDhM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hqoqJzmdzOcfh5gCsH9YBJTqVxqAj2THShbZ8lch6aaAOeM8G4b6CPp6CSA2Q6x0/sAGatsrr8y8dJUepflr8D/IweAmAZAkVyOTkc3ljiTnE0KAdXh0Fcx9CXAjefIOkYwguSL4hQ5pF9nJ2ELfFjSrkNKq/3bMNnLjRLsFil8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BcKTN8z+; arc=fail smtp.client-ip=52.101.72.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9Crvm+qnuRXqgzxEF8xLIF3kkuVzAZI60ZXVxdoSVGYQkejye3Dx5ntSoENGDMciCycg193PNkvl/VavJu4aKTzAebFp8TSga4HOaPFhVCPtgyRwctvk7YFAbvNrK27oxZOGAtjAJR6xNajlIBNIWzuHAhLGzhhEpo6wQTqP9MMphrd0VIw3qI75inaIZ/gL3/gsLW9WYn/DO5hB8PydmIbe8Lp/BOEF93wCALz9vtwf2o+dsLjM1X1XMTD9umJzeZVtpSz1t3g6RlgmRBLJyUnA53SiCaFK7PHPDaFIPoStID5sgKDH+PttaSlf8Sv9VpXs6XCTkBgUaVupVh/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdtLwQJLtDVIBENIs3xfWkzAlnCbUk0cunj+tIuwIz0=;
 b=gZog3TNIO0IadhNS7YSX3HFvsMbORbKqgAqV3FfCeb5h0COQhp0vaLI0zTSsSQVcISfwmuFE8Gctc5v1MnK1G6I6pcK4+BfY/ixOUPjM2Zsl3prHVaxffaCNbCsXB7lPNaYzowNpDG05h3B7tyk1mGgtXH3gi+geoH192ocbhoVSfhZKNDi2kV3oF2eTAxgurnHKV9IZSNF8Jsi8jBVMLWKQr9stajiQyhsZbnY24DUpRQYQTuAQgwZ5lrNBaop7K/PJv3obnXrwGB3+mg/Kx0hpZk26MFJVLmocXNF1Ozc7fec5SO0zPzm0TGC88FnDmtKgZKwhrWOXhRrV11WB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdtLwQJLtDVIBENIs3xfWkzAlnCbUk0cunj+tIuwIz0=;
 b=BcKTN8z+q2aa37FUK7DvtUb1tI94sZMifwsDxkHVya1G5s6wYp0Q/R/sM7q5TmfUmkkcfqjfo8PkeJE0hRYA9Ln/XYx2EknqOv+tG3ilZGaMVOd4x+NW3bvgYGqwEaNP5ivlFVaoCAIR+KceoIer1TdLdkxxOiQGHtrp/W0ZZa4pV/ynxjngLRRAMLUmPsikw3A37WeXXdeYml/QdGDJ/MqKsEy5WFOcQOBqqoD7Ud52sJAt+ZCxtXTYddA2Vu6aJS4mL6EIqO8mrb+maE6YQzdVZTamk0pHJ6ifWf5tjgNo7LP+u585wonyVSBPF5r/chPPi98acvgjiDdkPkPJ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:40:08 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:40:07 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Apr 2026 09:42:26 +0800
Subject: [PATCH v6 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ds90ub953-v6-3-7a84efbab316@oss.nxp.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776994953; l=2757;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=3/WEgG1NNImg/h3VAcPVEQFyPY2QkmrMkCtpoug71jo=;
 b=OwpCwb4CaNaTWfiVeTvL1xK92BneX9OVG+JpMI12NCkR91wwnDWLxqBe/eUWiEe0/idi+zCYU
 BrePqsM5oDBBo7MT0jO5hkIwhOEmatxHw3805Gx/BSdxXHCE9iWq9a0
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: daca719e-e7c2-49f2-5eb5-08dea1a26a9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	UV/rrH+UCYcfHZtHtdyl/HvdCuaoYUikP+1KG7EyQ1gBPGq+HslQKvSMLS1VpdpUVsh6QRzKWAQkHUkck8HFKKeBo0oxhJLuL2wRLZQSRbqrvoCtn008+0kXWwKlpaawB/hf6xH844mc2gl/YYiVnUuBaVTb00edCqtBbJ6YxkoLBkVufUJKZAjx+QqqGFTEtJyaErshaS0Eihy7L54tD1vrCm3rNaxOsZCTS6o1/QFzCAvHvxGA1k0h7TNHA0AR9KofaXGjavUhr597+zoSpZ2OOYtQZuM8PD5BPtzFb+XlzIBhBV3h7S/gMXyNLrNjukEtwtYs31hZUTyddUO3W1MEWCvkca31Fmw2Qc/0amCSsq+E/0eMVBiwANhB66wUAnMoOBljLmpirl7dNamXguceMTYv61vFvOYAfGjsTB5WicNwgpTNcIlNWLJmpH1zb6NB45PEBFDxHrRper2LYwP3Nw+f9XpEogFsOgjN3z5e2u3wkuW8olQwly7i0figa6gaDO6SJkbzj3L8G8T1VfOWUC3DAyS4f3OqKf7tcc6iH9QFVqNWYx2Kz8bcR4cqe2qt5ip+1fYdEG1f9/bSM0/6YJNCOISpq9YezqwyWAMNqfZsH9/MjlQTOXnSjFNZu440aWSrNj4RbTw4q9sEP8PNVi3OxQqxpBeXcuH/MJROawSudCucQVw/ZrqfhLfG0XiOAmHtVJs63W8wnT+cr+StjcnNsvcH+B0CWhFf15wnP+4NP5jthj2SQH+TLWymE9aJqFq+3uFSPl8NpTPZHP5bWQGl5nusx4mGd26mhqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFUrRE9EbDgydC81T0dlSjg3Y2hVR1F3RHBkQ1ZWT29uQW14SWx0TndkV2U4?=
 =?utf-8?B?RGV1SkNPSnQ4d3NpSXMyREpqeWV6TmVsdU1MSXpySHhmTVViUC9hOEJtbEVV?=
 =?utf-8?B?Q1RuYkdJcG9nUTFZQXFCZHVLcGhyT25TYXRQeVVxNk9lTEo5L2k0WFJxaFc3?=
 =?utf-8?B?cVNGZVJnUStQSE5sSlMyMlJLeXlROVhPUGljU3F4ZVlmZ2pNS3hNc09COHd0?=
 =?utf-8?B?RUljSVBnUEorWWhZcnRyTmgxYmJBWVQvdmpwTWZvaHZYVWF2dURmcUdIQjRC?=
 =?utf-8?B?MnhhVnZ6Q0J4bnhVaEZDdnNYeUM4ZTVHb1crVXpYNUN5RHpxQ1VmNUJTSHpr?=
 =?utf-8?B?VWtFc1NQSUp0ZkRUZEQ4OFR5ZHRBM3JUcVNCcjZBNjBSRGlxM2dlWkx1Q3JI?=
 =?utf-8?B?QjJJdmw0alc0ZHBIRmtLbHUyUWlLZ3VBdGRTamQ3d2ljVngwVm1ZNHJjYkVP?=
 =?utf-8?B?SXpET21YK0piQy95S3UvV1AydWxCL2xlV0xpWjQ5cXVTeUt6Y0N6M1R5eVdp?=
 =?utf-8?B?d0FRRXcyRFNFOHVYbTlHVHVqc1FpQjIxTnJFWkxsNU5GNmZuUWFlZEQ5N0Fm?=
 =?utf-8?B?L2duUmNtV3BwdXp3QTZjQXBYOWdoeFVaenV6aTJIQlYxWnZEazJkQnNzNjRh?=
 =?utf-8?B?eVl2K3VqaFNpTm1jL2FhdmhMOTNISGFDUUEyQmYwMVRHcndlWmc2Y1Q1WVlR?=
 =?utf-8?B?VEZMV2NrN2Q5eE1pbVRnTUpSZWRkTVRZeFV2MDhLSmN1UGVxdUhsVytSd0JZ?=
 =?utf-8?B?R3ZrYUZ2VDlacU9PTkFuQ2p0dytpTVgxMGlTcUU5REU3UVpScjdiZ2FNeC9T?=
 =?utf-8?B?aE9pemJEWnlXendHL3g3SXlLbVE3aVlISWl3Um9NU051bkEvT1lreFBUM0VF?=
 =?utf-8?B?blNaVGxHZERhUEd1VXhQNHJVbUJlZnpxRFFwbCtoQjRMV1JwY1pHTTVQV2Jx?=
 =?utf-8?B?ZlFQTGh6L2lKeHdtcXFJV1BnOGdCSHZlTnpCeFk2RmdrZ1VTRGJVWUhDUXdO?=
 =?utf-8?B?b1cySXVwdHVtdjlOVDJ2eEJucHp6T2ZHTmZKSk5IOEw5OE05NW5vMDhBc1pO?=
 =?utf-8?B?WGFOZ0RiYmVIbWVGNnJGS2xBZ2syU0xwSU56TVdHU1JQT09ZSDJWNThOTDBL?=
 =?utf-8?B?dkhPZVVnTlhaN24rRVdHc3pmTWFyWDA3dXpIRkQzcG1KNWhNeExPeG5JSWty?=
 =?utf-8?B?L1UwVGRINzRYbWdTR0kxUWNtTlRQYTZpd3dWZk81dTc2ZFFjMmRndkNidnV0?=
 =?utf-8?B?ckx2b1dZOHpRcjdzWlZEQUVlTENlb0poQy9YSEZyVlc1TkdrN0tkVkpjcGgz?=
 =?utf-8?B?MXBOc1NFR3R5N1hPV2duMGhmZUluUGpnL1lrbHRYbDlnSUw2WjJ2SjJxYWs1?=
 =?utf-8?B?MXNSSHFhQmZrK2VibHgzYmYyaXN0bVVYMk02eUNYWTVSMFpCR3M3b0VpWldV?=
 =?utf-8?B?OTBpKys0TDRTcTQwR3pVOVJGRjJKSXdrUGpJUk9EaTBoMDhYV2RMdHBYV0VJ?=
 =?utf-8?B?SDFoR2w1OVdNd0Rqa0lLSXN3V0VoclkzN2VNeUZ6KzVJaFJrcmJzOGdqZ25B?=
 =?utf-8?B?ZDRaSzJ2aUlWZXMzTW13dkwvdWNGMVRqTXpFbTcwd1p6MkNlKzd1RmlJS2dn?=
 =?utf-8?B?NE93WTYxRjVhOHdtNzgycmxROSt1TUNYZisvWFdsOUtJVnZjeVphREg5anpN?=
 =?utf-8?B?WkI1eGJxVnkxZVdiaU4wbmk5N0laMGZrSlExMzhYUy9peU0xblY3andkR1V4?=
 =?utf-8?B?OHJ3cXlCOWVZdFBaM1k2b293bkw1cjExYk5PUFJCVkM1SlB0cjl6SDcybFZL?=
 =?utf-8?B?c3laa2pGWmwrTWx1SzN4cUFDalBpbUZOMnM2b0FWK3RkbUFtTVpjUWkrRitD?=
 =?utf-8?B?WkRiMjdlajlLWUpsTXZRNGlkM1ltNm9IMVZpeW03eDNOWjRWWjQwc28xMCtL?=
 =?utf-8?B?UXE0KzJxTkxVdG5WMmlBL040M1RqeHFkVHphaEp3aXdUaDkreVorZkhrU29j?=
 =?utf-8?B?Nm1oY3B2aDM3OHhoaytwNi90QUV1YWc4MFo2OG5rcGVoUVNURzFWaE8vSW15?=
 =?utf-8?B?YkRSVzNSZUxKNmlFUGJYVkhLdEluUW9CcjIvZGdXemZGbGZhODVPNGduM1dY?=
 =?utf-8?B?THYrZTBhdUFEU0tvS1QzY2hmUC8waHpZeVNxMVh2cDM5YjFDOUQybDRjZWRV?=
 =?utf-8?B?NTliY210U3d6OGtrZ290WCtMVVlhNmVMYjl4QlVTOUc4czlHWUpKZHozMkNE?=
 =?utf-8?B?aXdLbzR2eDl2VWxIK21Ycy9VZGpMWG8vRGJFWEFnS1Z1b3NnN1hyeS91VEE4?=
 =?utf-8?B?VGZYY1BNb3RDa25ZM3k0ZHVQakVwRDcrSUttYk1CYzhWSFpnMU9jdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daca719e-e7c2-49f2-5eb5-08dea1a26a9e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:40:07.9607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wwev+GKX7SpusEHlU19j/+IPbpVHNohHruLo5gH1jOp+J+0HgXmOqPMl7CQjnmOh8V1yJKd3cj1FTFp7PPrfjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
X-Rspamd-Queue-Id: 22466458DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35451-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_mutex_init() to simplify the code. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v6:
- Added Reviewed-by tag from Tomi Valkeinen

Changes in v2:
- Move PTR_ERR() in dev_err_probe();
---
 drivers/media/i2c/ds90ub953.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index da63dcfbbbc3..c37d9cbe88b9 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1299,7 +1299,9 @@ static int ub953_probe(struct i2c_client *client)
 	if (!priv->plat_data)
 		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
 
-	mutex_init(&priv->reg_lock);
+	ret = devm_mutex_init(dev, &priv->reg_lock);
+	if (ret)
+		return ret;
 
 	/*
 	 * Initialize to invalid values so that the first reg writes will
@@ -1308,32 +1310,26 @@ static int ub953_probe(struct i2c_client *client)
 	priv->current_indirect_target = 0xff;
 
 	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		ret = PTR_ERR(priv->regmap);
-		dev_err_probe(dev, ret, "Failed to init regmap\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to init regmap\n");
 
 	priv->clkin = devm_clk_get_optional(dev, "clkin");
-	if (IS_ERR(priv->clkin)) {
-		ret = PTR_ERR(priv->clkin);
-		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->clkin))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin),
+				     "Failed to parse 'clkin'\n");
 
 	ret = ub953_parse_dt(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_hw_init(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_gpiochip_probe(priv);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
 
 	ret = ub953_register_clkout(priv);
 	if (ret) {
@@ -1357,8 +1353,6 @@ static int ub953_probe(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub953_gpiochip_remove(priv);
-err_mutex_destroy:
-	mutex_destroy(&priv->reg_lock);
 
 	return ret;
 }
@@ -1373,7 +1367,6 @@ static void ub953_remove(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 
 	ub953_gpiochip_remove(priv);
-	mutex_destroy(&priv->reg_lock);
 }
 
 static const struct ub953_hw_data ds90ub953_hw = {

-- 
2.34.1


