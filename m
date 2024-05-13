Return-Path: <linux-gpio+bounces-6332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43D8C3FEC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 13:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 815F7B23EF3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BEE14EC5A;
	Mon, 13 May 2024 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K+Tljxw8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660D14D2A7;
	Mon, 13 May 2024 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600260; cv=fail; b=nzI1rjvXChnflt//ucmKTipmgI7cDdE1l2f9mI2qd1zZgoYCWuvbY377+qR15Zv2L2UJJMNnfDSQVK7IOGipDwoVB7ePMYB11phsmJbCeVcVK8rKOX/s/q4tUv8aVKbSWBd18h2TpE4tSA11vGlk3WuEac9VdE8Sd+MkobAZKFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600260; c=relaxed/simple;
	bh=3CqWMhvFpASbqlazBVq2IMTIRAb/f4zX/5EjBGg5KI4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M4UoOggacTSbDs/DN6IzIc3AxMnBRw5wmxP1kxH1tiqkAqLCNkNAu+nec8a+cndx7swGPxEBmONSUlDi5O+t76Rk8WiVY+FbaYnOq3LdyJWyVz1rma0VTxiTtvbo3xzhPAAgepJjpHDVbyc3tNmBhp4mIs0e6PE9/3hyB2iMlQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K+Tljxw8; arc=fail smtp.client-ip=40.107.22.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WncK/5Ub+NAvyZc8bZkzOXRO1+6thHigxtZNv2l3xIjhU5HKx6+uCjFJhS3tT2JU0QgQ17ygSmNtuUTivFYHfHtpZhuKoC8OhHa2qF4DVk9dcdtQ6nx1ztnYWpCr2auEuKsp08Gfjcpmv2YVkbxRH9Hjozw/XtYGxaepZxBvfFXngLz+AKnV0ZdLfSYGfVJ5XVwAKSUVUnBg5k01tzs3WZ4u9+KMHfP7HTqnCQiGAI7hLUTaBZ7O3qm3JtZi07pACpfuPt6+oNvhpp2+cSzNNozQetoRt00ibuepM9wD0qu0r+BiVU5c+T0avJ3/RaU+AyrceDbxO2RJutldYdGVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hv1H59MTfHnDnpyVMtMvGxlbEW3yCywOD7f/6rVTBQ=;
 b=hcEAK086tIoDh1vFnKG3SEjQO39rm/rnNyBx5/R6IYOnZwa1TYg4spsnstrdcZ/2suZLBAeiipyn5Wvb8V3aAXv7v7kgU1qbPA79hXuj8jfsToADjVTbpwJudwJ5At9MLhVOYzXxakfKvrXScHxc3Ct6X1LIP3iSegb/FD49sZG+4m8W9A9gcOu45B6oZG2eqIz5fSUoWDcVEqzwIZUOyd1+fV7qZhUQDid0QrPKR/JO45O28t7Gyhrz0jpn6CCSOYYgvMja5i3XwTKzClxr7vtRp6B62Dn6G/G4oZya0p5rJgON4Nl3aXlIqCu6NjNgGkWAwiw5ji6Qh2w8+v4yZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hv1H59MTfHnDnpyVMtMvGxlbEW3yCywOD7f/6rVTBQ=;
 b=K+Tljxw8GlJpWTJbSELvdFBuhTvEwdn0garioJDthgYe6ElXOJy9ncCg1gp2O6QZnqLLPu7b/Zn4MiKd3NS6pgPer43ZQ9sclF6Gm+HCXWTmSmrqq+rGead+GQhl4Y1LN8er0ARI0C2wCLyBaBAdK/kLR2BqBy92uDd4yG3Co+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 11:37:35 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 11:37:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 May 2024 19:45:24 +0800
Subject: [PATCH v6 1/3] dt-bindings: firmware: arm,scmi: Add properties for
 i.MX95 Pinctrl OEM extensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-pinctrl-scmi-oem-v3-v6-1-904975c99cc4@nxp.com>
References: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
In-Reply-To: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715600734; l=2848;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=epIDuWzCH6J3807f/r6dNqln7UX230N7xRikk4P3jFk=;
 b=ldsJ0UPA65Kr7UDkmBU9d3YrS7DlWBIg0hTqd+Qk96NMtF05LFTG52p0TyFaxWJI3uORJETiN
 4bT+6yU3KffCiNgmgBmXnr/HXR6WuWJ++6YDB3zZYrOcz2S9JGdPBqg
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PR3PR04MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb47028-418c-4760-a4bf-08dc73411585
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|7416005|52116005|1800799015|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cW1BTjU3VlFKMlVGUGVGd3VkSEV2S0JtdlRlZXIzaDFENmJKR2NhUWxnQlhN?=
 =?utf-8?B?K09Rczd2ZnozazczamVUT3NwWFRzR2ppbTFYdWdxUWZES2J0RCs5T2FwV0ds?=
 =?utf-8?B?Q0xaWUVoS0hPM3BqbEtSNWlPdE9JcEN4ME5jdkZIKzBZdDhTTVdHZTlReWIz?=
 =?utf-8?B?anZ4QkloVzNRaVpqSlowMXc5TTgwRGE4UVZ3R0l0T1MvSXhGMXVxNE96cER0?=
 =?utf-8?B?ZTRMbk1VK3o1VkFuSVhrWm91VUw3SzJxSzdDalFlU2pncldpMzMzM1EzSGI3?=
 =?utf-8?B?Zmg2RER2aW8yWlJXd21qV0ZDRVluTlpORlBodDNzNjBHYmRob01udDZieW50?=
 =?utf-8?B?QWwxaDlyaTB0MU0wK1IxQ2NNWWd0RjMwQ3RJdFoxLzhBRmJrbllyYldoMlVU?=
 =?utf-8?B?NGdkU3JPYnNCcUcwcWEyenFVdkZ6eVpaWHJlZjFDU01YU09za0RCWXdENkJh?=
 =?utf-8?B?bmxMcDFKUXRjWEJnVUhQMW91bzdLeGFoQ21jQi9RZGRCN1JzVE94RU5HZy91?=
 =?utf-8?B?Rmk5Q1VnNjBpUERKY2xjTEc3aVZMblJ1WnZRTVp5MEpWOHZrODVNL29saXJU?=
 =?utf-8?B?bHR3a01jRUozWm9ySkJpVVZoQmdzZzBmK2szZ3lScHlUSk9aTGwrRW1PbUtk?=
 =?utf-8?B?NlZQakhvSm0rMktwNk9aeXlUbCtpbW1rbFNodk9XWWlWdk5aakVFTC85bFJu?=
 =?utf-8?B?K3JtQklWZVpsTVRxbUVIRDVGdEFsVE1VVDR1eGVoNzV0aW9jdnV1STFncE1D?=
 =?utf-8?B?RVlySUc4c1dDcS9TbzNRQ2xONmZXbm9ZbGw1cjZzZzdOOHlENGNqczN5YTBY?=
 =?utf-8?B?OTRxUGZ6THl0cUtnUEJVYkJMYUkraFpoM1p5SGh1RE03VW85Z3JuOXhGQUpz?=
 =?utf-8?B?L1hLVG91M20rYlFvaUkrMjBpNUFabUJZMWlDN3psWWNCMmRXNVBydTFTUkJj?=
 =?utf-8?B?ZHJjM2dpL0Q0SHdrK0VOTVhscElHcjIyWjlYVzhGd0Z1a2NJRVdsNWZsdkNY?=
 =?utf-8?B?Qm54SWQwd2RvaFFpcnFhOGlBMW8wS21RdUhpbVBnTCtOcGhMVzNPQmxhNytR?=
 =?utf-8?B?d0Y4Tk9PMi9WTmpESVloaG04dlpMREg0cjJRRnNXZHRFS2g5ck1GcktOeERk?=
 =?utf-8?B?OEl1bjNsTFlRQktsMW11WW1qM2UxblVKd3ZFcTMyQzlrMlgrMUl0TDJRbU1P?=
 =?utf-8?B?NExjbWp3UVNVK09Ga0RUc2lTcE1YUG1yOXFrWEJsZ1BBL3lCb3IvcUVkYVJ2?=
 =?utf-8?B?dFI4c3lYMUN1RE94Vmgyd3N5bnhkajNWL3RKejNsNWhIMFNabFg5TzRmeHNi?=
 =?utf-8?B?ZEcxVnlCWEJTSHoveXVMVUlQbk96MkNVbStUMldVVHBIU29OOU16bUVxUzZU?=
 =?utf-8?B?R0ttRXBzY0c5UFI1Sml5TFpEUmVFQSs5UlljVFNqU1dJMzlIdVBhbGJTOURK?=
 =?utf-8?B?QUlldUxNZzFSc3pNSFFkV3I4dXk3blNZcXFrNHBFdDlIbjVhMFNySXN1VktV?=
 =?utf-8?B?NHowdlEzQ0l4bitkYXpMbkdTdEt2VGJsU0JuK05SMFBKOXM4M3ltTDMwdDZv?=
 =?utf-8?B?NDRTWUJWektpTGVuYzh5Z3Nobk8zdG8wL0VBWVhENmhsWVF5UWRRMFAyTmc1?=
 =?utf-8?B?Qks0eUNmQ2xOSjFINnhnOVpiVXE1Ri85cTQreDdxc1EyTEhVSlM2MVhCT2g3?=
 =?utf-8?B?cE1mZTV6THBTQmM0V3RiVVRxajFJOUxqdTBUbHVNS0lGWWovTmFrUXZidVI4?=
 =?utf-8?Q?vAP7fjd9bexvqfSTQg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHdYa25JOFZHaG1kblBqemFmcVJjeXdKT1FOMnFBMmNoa2NyMDQ2clVFWUhn?=
 =?utf-8?B?SXo2aE82VjJzclNmK3BLZFp0S21TKytXYUFtTzVmazZaTFArK3V6WUJBOGlE?=
 =?utf-8?B?ZkM5UXprcW1mbmtRNFpOV2F3ZUJjVnFmaWMrVjYwb2NqVmFPODc2aU9FK2do?=
 =?utf-8?B?WkZvSWJZNytiYTJWNlFrSlgwQnZaSmVlcnlmMlVnRlNHYXBWWFQ4UFJLdk16?=
 =?utf-8?B?eG5RVzV4dTV2cnhvY0x2bEFQL1o5S2RCS2NzQUZPeGVkRE12UDJUUitHOUtK?=
 =?utf-8?B?cEFGSnBrcTFzd0twUzh1OFJTVlM2dTJTSEVNTU5pNEhxNEwwaUUzQTNkTmJ4?=
 =?utf-8?B?NXM4azdmd2ZQMU9zYzJxUVUwSzhDTGhTSFBaSkFsSWptMTZudnIzdG9QTzBF?=
 =?utf-8?B?clRNc3hha0taQzM2dXZWbUlJa1VlV2l4dC9rellCL1VkZHlhZkJ4am9YRXI2?=
 =?utf-8?B?bkEwQ2RJWEw4dFpidStzZXFqSFFXdkNId1JPQlNkS1BCU1hIZlNYVmx4Y0RG?=
 =?utf-8?B?bHdtSlJmVk1mS2VMK0ZhQi9STEk0L3JINVdpejRyd3FjbGg3QldpVGtsUFRj?=
 =?utf-8?B?R1gvd0hCVlowSmcwYWIrTG5xcjN0SENCNUlxRVVvWHJxVGRBR3dnZnZsSmhu?=
 =?utf-8?B?TUg0b2d6VWdsdk9qQjQ0S1lvL3VhVzJ0UXpSajkvQXRhM2EvY1VzOVF0SnZR?=
 =?utf-8?B?ajBGdEx0bVJLSWtoU3VVQURMWTBHVEdRaUx1Z3ZTdTFUQ0s1V0wvcEVwYmcx?=
 =?utf-8?B?TG9LZ3ZLU1F4dG42TXladXJBaW9QaEdjdTNDTEkwU2dVSHVIb3AyRGVScG0r?=
 =?utf-8?B?dnZsT25jWVd3WktIVlRyak4zVEdlajFaYU1QWUlTVFZTOFdJL083WFBiTFBp?=
 =?utf-8?B?USs3YS9RK3Rod2ptSG90R2tQVzlUaGFJYnZCNkNuTXQxMDM2bVlvMlZJbHhu?=
 =?utf-8?B?ZHhvdEVPN0luK252eHBsdkphREpCNWZsU0NEMUl5Z3pRNjJvNTAwWVkxT2N4?=
 =?utf-8?B?UXp5MWt6WlZIZklEa0hYTnJ3eEZrWjFvUlRyY2FjdE1lTmYvTEZXS09zS01k?=
 =?utf-8?B?N0FXdlZ0ekQ4WkpZU2VveG1HWkdjbVU5dUR2SUlsaGwrN2o3QkJuZWZLeEla?=
 =?utf-8?B?bEZHN0NMRGNVSVkzTXo4dE82bVcxMFZFWG8xdTBLbFloNThUaFhMUU51Z2JO?=
 =?utf-8?B?WTd3UE5FSGJZd1pEc09vcE9meDh6QWZBblUxNklnNXJEU3EzOGJ3OXpnL2Jh?=
 =?utf-8?B?VHBIbnVGQ1Z6V3FZNHV2dEEyZFlHbHd0cEFCK3o3MUlkY3g5c2RRR2VEZFdy?=
 =?utf-8?B?YTdlU2RSVmMwUHBuaTAvSitBZnREbzY1a010UWlWL29BVEh6TzNmYTl0OU1h?=
 =?utf-8?B?R1ErMlM4cVRUdEpQTkw2U0dHcTBxZFYvZU9CQVVPOHh1SklrbXEyaXJ2OUlk?=
 =?utf-8?B?Yk5nb2lnOXRqQ3E0b25tVjFHWWM5RmVscnF0STU0VS9Oc3dlWU1BeDlIYXhW?=
 =?utf-8?B?L2xRN1c3TjBYSUFMcVZIU0JZYlByNkxOS21wZkVmUFh0ZmVteHVDZU9NY2ts?=
 =?utf-8?B?VGFGcWJmUE9KQWRmZGFxQUlBYXFEUDAxaHFVb2I3Y01WSDRVQTVzQk5NL0FU?=
 =?utf-8?B?VjFoVFZtUUpZZExQTXArTlR0T2ZQVXhFUTNtbU9DR1dJSExGRmNrTno5TzVu?=
 =?utf-8?B?Qld6SHdodC82dXNmeWdhUGdMYVJleFhiUnptNmRWVFZPVUJQbU1YMXpOLzJz?=
 =?utf-8?B?R1JIK3lONTdCMkhkMGxTc283MWlXNUhUaGJIOXBLRFdGMnJ2TklhdzdGQ25F?=
 =?utf-8?B?SmJiMGRsSVhpWGlwcm12UzFIWDZTaEhPUStLNUtlelovcUM2Z2RCQklwdHZ5?=
 =?utf-8?B?bWpFNlFGeHRPa0JMa1p4WUk0Qy9uMzBPRlBRNVBabytSSVN6UVY0TStrK0Jh?=
 =?utf-8?B?SlMvWjBiK1d0a0ZreTJXazlvak14N2Y0SE04MlU5azE4VDFXdlBYOE5JQzhE?=
 =?utf-8?B?bFFwOFp0SmI5aWRBRGJhVXVHZDZ2K2EyVGxrd2hPS2xBcWJ4aFV1S1ArT2pF?=
 =?utf-8?B?bUo2WkxoNHpBRmIxWURkNEVNZUVHaThISForSUJDeENsSGcraWJhMUk0eFU0?=
 =?utf-8?Q?I7vkSnvNN/LaQ2zGLYyUakBAO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb47028-418c-4760-a4bf-08dc73411585
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 11:37:35.2798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0cCwezElGnKF7dkN9Iv3tU3ngRVPeweWqGgwEpEuKoWoi1xlxy5/ffTASMqchSoQslrF0cdU1Pi6LMbk2ueAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

From: Peng Fan <peng.fan@nxp.com>

i.MX95 Pinctrl is managed by System Control Management Interface(SCMI)
firmware using OEM extensions. No functions, no groups are provided by
the firmware. To reuse generic properties, add the binding to enable
pinmux, slew-rate, bias-pull-up and etc, under a subnode of '-pins'.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  9 +++--
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  | 41 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 7de2c29606e5..bd4dfd7a85cd 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -262,9 +262,12 @@ properties:
     patternProperties:
       '-pins$':
         type: object
-        allOf:
-          - $ref: /schemas/pinctrl/pincfg-node.yaml#
-          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+        anyOf:
+          - $ref: /schemas/firmware/nxp,imx95-scmi-pinctrl.yaml
+          - allOf:
+              - $ref: /schemas/pinctrl/pincfg-node.yaml#
+              - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
         unevaluatedProperties: false
 
         description:
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
new file mode 100644
index 000000000000..3ca2b0cc484e
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX System Control and Management Interface (SCMI) Pinctrl Protocol
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+patternProperties:
+  'grp[0-9a-f]$':
+    type: object
+    unevaluatedProperties: false
+
+    properties:
+      pinmux:
+        description: |
+          An integer array for representing pinmux configurations of
+          a device. Each integer has the format,
+          pinid[31:21]
+          mux[20:16]
+          daisy_value[15:12]
+          daisy_valid[11:11]
+          daisy_id[10:0]
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      drive-strength:
+        enum: [ 0, 1, 3, 7, 15, 31, 63 ]
+
+      slew-rate:
+        enum: [2, 3]
+
+      input-schmitt-enable: true
+      drive-open-drain: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+additionalProperties: true

-- 
2.37.1


