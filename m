Return-Path: <linux-gpio+bounces-7878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671E9248F1
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 22:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD2D2819FE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 20:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66E91CE0B0;
	Tue,  2 Jul 2024 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BNxoVtqi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F7282E1;
	Tue,  2 Jul 2024 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719951467; cv=fail; b=MhViKQg0DNRACnqjfiGyj7WASIiLgaS9h+QuvnP8oNb1SFSBRSjz3HeAH3c5MWtA5b3R1wE8tMbqdw5VAEx16TfnQUl78kgQ+Duc4i+rNcYG8qoVuZFSQbKMGavixgYOeyzV4oCFBw+/3bOMnQ0UjML50VIK+i+ZP+oVf78VU9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719951467; c=relaxed/simple;
	bh=7Ky4M1c3rQ8JYbTlvMMaH5nZ/opDyrN+NOjp5VuDIEE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NyVPSgXkUd4OAm/duv1PS0F3HKqAelNrWrzvYd0kcfTX6k6/wT0xo/GcpSNu/1WAMaFzHv+Pt/hQdEc77J25a2MeQS1UU4J576FRRnm84DUwqv1bVK4095Mtga60HMQNm5zW+UYmdccIGeu56U/T0EdAkCf4W/EnAIB0NthlIQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=BNxoVtqi; arc=fail smtp.client-ip=52.101.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOauuoJyknkc+aYjBHlmpKlbS9AKdUmdRes9epxIQgj2BZ7qqFyZmCYB+euZGhlM3R1bLaI6ljoU5JhkvK+1j1UZncrqOmLIP3VTy8MZTSwt5kn8A0cE+du7lbKZxlNs6YZUksg1Hx7x1ibQnYVtcCiXmhcVgbOpW04bjLLYTcd4D360XX/XS0W4ajM7g0DFg3Xj3Pf0fBSqPcYkWNzoPq9JSyCZPLuLjKoE/jWr7fKjghfLhiS9H2cHEaLgBfPH1RlMk+7PtCgR27nvoQEjNv6AXU09n2w2MSXdw5YHNj1qg8EQHafbIapwO0Jr5XVjasHqmzzlsqZ3wGYMTQi/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFgAzfBFbQ/BPIIV9rrQCit8jFoAhjuExsaf6Dwl328=;
 b=TRl7ndl9ZNt3j4mEwRCwyy7VbIscajBhsxRfTOs/1jjyw2rz6O/nfdjZ3gWm4zZHU3ozVovcPJNcoMyGyij+dReZLdet+DUauscGJCkDFdeJvWZz9LIHR6aGGwAboNrMxIo1ZuAyFuEW+xA/nm80vRHha2YjsO/6xP+ReP9lw9g5agE2nTNLjXyzUlQIHCAE6fsS91HMxlE2uuUDzZRXoEYvsHg9rvg19tfpujsk26tvXRr3rHqDyJpc67f/dqEIGJHAr75GBVY8j9iQ4aLrDULUkZZZKa5xjWLljPHxwekjJ+t/vByO3hJbYtJcNLHXpBaOuddRwTvlptW3U0YOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFgAzfBFbQ/BPIIV9rrQCit8jFoAhjuExsaf6Dwl328=;
 b=BNxoVtqiJx67Rr18fEYg41ZgIX1Zf7MRrIeurEouPtuKYq1K0WEcer6MxiWRIQFkjRUeDIIdNIDQO4u96OCauvOiqdzWWokQAubmATHnBKSUToe9ofr2562/3dqtiMR/I8nU8UwA2z4dj1gp00udGgJbIc9WK+hJWdPQGmUA1rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Tue, 2 Jul
 2024 20:17:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 20:17:41 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,ls1046a-gpio
Date: Tue,  2 Jul 2024 16:17:24 -0400
Message-Id: <20240702201724.96681-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1c5d1a-b6bc-409b-99c6-08dc9ad40686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JymYb+kg2TBg1W/tP8ZUhLvFadzIC2mIDMOdmCjhojsjf7vy/0gMGd9RNH3c?=
 =?us-ascii?Q?5aVwfjt96FRApI59xYbVo4vE6Ti0l9oby4SYhZ16jeDFU+i9Wvneuyl94guW?=
 =?us-ascii?Q?GmjXiTIQoIPBXV7oitBP9wp4dVr9MYwMAvWtwYsKw4LsbyDq4FbCrw/wHXu7?=
 =?us-ascii?Q?ulmbodjJNzwj0SE7bxmvBeQ213AG+hX4WMxjCsUH+p7k/KZ5VrKR0Gk+zOGK?=
 =?us-ascii?Q?gzWhDbUFIJdC4l85jKyq95wRJGAOd/4FRn2Xfc2AnNXWLP7FkiHJUOsVKAZC?=
 =?us-ascii?Q?HglC0t+32y86iUVF4/b5d+77wF+wKb9MxWc8vhDFAmG/3j6gxcYhVikd5VgP?=
 =?us-ascii?Q?/HRLi0cUsWi+ReqGwQtgjp86DuxEAxkAblcEMfzmpZWWyBGNUvodArBdyhqN?=
 =?us-ascii?Q?vfEi9FrULr34FA27ngdUxxOHWDFZgKK0zQ7KXkElpdQAorFJS+nqbbXYjdG9?=
 =?us-ascii?Q?seAbg4Fz8i+nYfzDNvXSED0vtV/b8h6ONVTX+fHh7QpZ3zDPNgD3iq/c0n+E?=
 =?us-ascii?Q?EfN6dyiYpR6ZsgppxZirhVtyZFZ0v9jdrzse3SyZnJvSGTzavLS00MqNGB4I?=
 =?us-ascii?Q?gpnaXbxrdVHlRNjWJDKn7NVjzOs0SVMQmXRIA+uyaOAY0EQI6Og6XUb2iPGY?=
 =?us-ascii?Q?sdbMA0vLQErkl9GV2IOCnpB74jgrGidVhB3Q0gcDP7ny8S+mC97n0tmhXF4c?=
 =?us-ascii?Q?Q/yyJih6KI//gOPLhCd6ZebQImqtc55zNeOn3zG4pDlXRUyA/JDEn3FiJZQH?=
 =?us-ascii?Q?xYE9frz0Q9Z1RAczFbuqXEqfvKFJ93pLXQM+gmAVP09fjpCbQZe8iubJr/f8?=
 =?us-ascii?Q?L2q821sI6INTRnwICkN65sCHEudagzz4Orih2beNdMee77VIpydR9EmCBs8A?=
 =?us-ascii?Q?tWPu26wIdKWqDaUZQK34BIt4ZqfamB1p1kPB7dkXQyJPgefFNNy3IN4s7CNS?=
 =?us-ascii?Q?qJuhy6mZ1HeS0Oi3vmCSM16T4hBJonWlbwPLQYGDza8rJhJsoGNOIOqTDKN6?=
 =?us-ascii?Q?Vq/7foLXeCvi6HQYWel7dWCv/PW0vrOq10g2hsKiECdp4pLY9ptQm/rHzr73?=
 =?us-ascii?Q?cOpk7Ix0HXCCrhqb7U7Om01jrHUMQWjXZmZD00vUv0uP75h4Mk6Rg2JAs848?=
 =?us-ascii?Q?HRjZqKbCVxDYz6NKneofezwG999QPrxnCH5FQVjeTyOAZ3kWyGFwLEC2Yq2Q?=
 =?us-ascii?Q?jlEdVREMh4+lj3U/mvD3eufRO1plO1u8I3zqkFaVTon6K9Fo2pDKOPzUydSQ?=
 =?us-ascii?Q?gvOywGfgBc50KBuALFXrip71AWTWcR5pRo3iE8yDf7jpZf9wEDxlQ+Qln9Tc?=
 =?us-ascii?Q?WdDWJ/PQvBUDxGDZssE7bHmM3YaZ0840K0GWcx/javXZANcAX4ZRFOEUsgiu?=
 =?us-ascii?Q?vDOwIWrf74KyJeNxBrsw9zXkF16w0To9hdZ8ckDE7deC6IwsBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PCb9d8MGZQ0pqbe2veqN0bQKa0+9nJtDXWy+BoThtgJAq8Z89pxkYeT7Vyd4?=
 =?us-ascii?Q?3PfVUJ6BFhWEls/Br3+By4zEI6QiWMygMF/WMWkJPGzkNCvuVI3E8wjetpwt?=
 =?us-ascii?Q?piUW8uS4GwZAe8fB1KO4k5mo69QHCtUSwjaCsDiC78hzNBiJ+IbkeczXgJWn?=
 =?us-ascii?Q?+Es1CZaF1HiemEMp+U9AmyqijIVQ9YHSO6I6iWxGbmuqtFDt/tTbtMwwXW+P?=
 =?us-ascii?Q?MnSJCgL6xXHfL+MqtsxQMFrNDfZQa48xoMmtxIDTumz73snxk9rAquaqoI8b?=
 =?us-ascii?Q?68t9veoMsa7dNlNVHM9XcY9iMNiviZpFkguboBx+HHfhQDTn0Lc7rSTODAYn?=
 =?us-ascii?Q?qgSu15UF/fXkagc7XizngDOHfOWxiNumfNLFsJAkznC3OkWapxlWq7NGk2/+?=
 =?us-ascii?Q?Pk8T/PifEa2A+VlKUoMnKtPWGIUGfBBR3vg1Gz2wWhdNfe37+gDYP9CuD9rD?=
 =?us-ascii?Q?gBqf2lNQ/ymX63X631KfeZ6p3vAv+Z9JwSEGpftOCWfUOw1oIj2qI2tm7y19?=
 =?us-ascii?Q?/JRPaItkAY6SKur6rNLYiRuPDX4Mh8lTuSTppLcugX+XWaKOMNqgeXtFrvKA?=
 =?us-ascii?Q?1OjT1MOH5VPBgsi3pBTB3JK78AuLpjcbQMAHmQ3nNHGGDxJbIx6qjgRts4VC?=
 =?us-ascii?Q?Xqx7QqBNCtngaVy2B5r0t4iQbs9YpsXgaS8ipquZ74hrogY+D7s0vkZ4EeKy?=
 =?us-ascii?Q?BMMx1tVy4VnuaOU9CqX5p43fCSWYU7N2njOCmuFyrbTeuPCrxqoAyyMlV7kn?=
 =?us-ascii?Q?a1PLVo3fWhFo7n39/Nhsw50dwCOiWkGJG1e66efeHOwwMwVh/TCmhg0y8UZ2?=
 =?us-ascii?Q?biZzwNbo6T0WNsNhbN0STBbyow4OS8Kyuhy3jJ5IZXnbBiyfYNu9y00GjzDI?=
 =?us-ascii?Q?F6TYK8WLrLOiJCiQFjbIGjIfAfNB/YBvd0LKBZtNkXLJqaAi5vDbH1qmKguE?=
 =?us-ascii?Q?OjO1V55E9Ntw/1ZP/BFRvoI6GCRjXaJ2UiykDSQuUz9JWn5rs97krXV8TqYg?=
 =?us-ascii?Q?FilEayWLvN9KesXodh05EpCJgQfcwk4ewd10WzPmNufSnbEyd7U0RsvR2u0h?=
 =?us-ascii?Q?Wtqy/sgbyZFaFtqOuROAI19KLh9dY7T3LVST+WXHPiK+QLG4RFwkL1WH9uo+?=
 =?us-ascii?Q?wAsKM69lIVF0pbmDmP9izKutZ0muInte+ly6qXMm7G3ayxXJD4X0f236lgbR?=
 =?us-ascii?Q?DdKZ90H1hCkNz7twWNmgCvB98RLw4CymxQPJy9zsMoqKVmyhzbeXON9LdCKS?=
 =?us-ascii?Q?9jlBCrN82pOM4xBiesfLqd2KkwJnp8YxFeffCvfOfUKuo80PLT53Z1E91PO8?=
 =?us-ascii?Q?y29bOvBDsx9tXXN5t1LxyY4/itfP9rp+yVhT+KY9TyYwi15h3kZDnkn1r9+0?=
 =?us-ascii?Q?QvaGkR0xOpyklFwl31ItsVgRknZ8jDxRd7b2pnK6rMOgEvTIL2oZdJXJbD2D?=
 =?us-ascii?Q?8zH2bZkbZchfcQ6SHwzZpq497MZkOdINMGH5ceVyQME0oLWitrXRTcLwpbLL?=
 =?us-ascii?Q?S6c954qkRVYxZB1rMuXp/zWU7llj/4474WoPpEjCB5mpMhg6zhiYgaFfl6nr?=
 =?us-ascii?Q?8zeoYTmkQ27hUUh6uNU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1c5d1a-b6bc-409b-99c6-08dc9ad40686
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 20:17:41.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qsQBbKhPSEAv4eKt6xXTwJuyE3tQ5ot+bO+4J00QewKP3lHBzRqbBOD4K1+Aa1Fc6RvoB4ueXVJas5eymP5/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864

Add compatible string for chip ls1046 to fix below warning.
arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
index f386ff3df6a8b..84fd82291ee40 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -24,6 +24,7 @@ properties:
               - fsl,ls1021a-gpio
               - fsl,ls1028a-gpio
               - fsl,ls1043a-gpio
+              - fsl,ls1046a-gpio
               - fsl,ls1088a-gpio
               - fsl,ls2080a-gpio
           - const: fsl,qoriq-gpio
-- 
2.34.1


