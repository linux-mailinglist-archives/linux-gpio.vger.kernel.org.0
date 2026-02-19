Return-Path: <linux-gpio+bounces-31914-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPyVI4SNl2lv0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31914-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF328163252
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77442300846D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7794F32BF22;
	Thu, 19 Feb 2026 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c8V8KfSX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A53101DC;
	Thu, 19 Feb 2026 22:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771539840; cv=fail; b=uTaM+ddf+oMh8ecY3DlWU27HX5yxcV9Sk4C3fxmtVTca4PId+i7mEKtpkB0725/sbAy+bhtvVswCBetnBRFtHuP6eMwAUlC0P7KrBB1ptJg1KRlaxsHgO6tQEvQGwPgq32OM1oK2fu89oOB8JEyBIgM0IsL1hj7u4f3qzejeVgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771539840; c=relaxed/simple;
	bh=Y4B/o674NbSbG/Fs0Vzlugi68/xAKxCsDFn5zWJrLJ4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=F2Ic5LvQuhDCKZfl81DxoJm65G5s7Aa3U+QsH30QgoDcmdvlOpKXUkQEeiTQuwIIvqLb/Wvqg+IK7D7ztJ/IOUIxubc1dFpf9+74zB56OtkhhuAofqQ5Sdn2ydXMA9aNyUSbyMQwZCwsswfpCARZQz28JsjB5jDf7klxAn7g/5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c8V8KfSX; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xN/iQDWcetGofTjh/kAeXr8l3mTd9B+kwTRUgdvS9IRMpTCCmWf/VFNCG/XgsFYahVK3Z6KQ2g0Utq67n2FQAUofOCkV2kiTRA6FGb2Zs5tqrls3owHKmil+23ajTXo3jQkiv1yQvwgXKx6lO8uxWKy9QozAYJi2NQL/E7RoJTBupvEjDpWbQadE06wRzVkFXZ58ZI2VI6LCIdGcivs0dvH8ndMePFhPZyvBL3qtCLNBW5h7WmIBJgXCiNYVn4Um85oD6HrIeJIA0vhr9CUwzJ4bkYeFfHdjoXw+Ob1jObjMHfNRzW8k6fEV502aApZlMvq5RO770HlGVIh1ExiUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wMNfjUwVzSUlkiuoVFCZkk4d3S86vhARUhNLpnKK/0=;
 b=qVSv8Wa53wICjjGn275B7wtVjGLkxfzPpiJ7jMXfmye9WpkaHoCN9tn2o24AOoNS0xZrK7/nm5fXZ+C/ik7aN6kOUm9zKhyHE+V7IqYqRPfZpafbkd095yPZ/3hCPyaLjC064UokTiVPAJijHM5Zx8vejLh81EGKap8YQFxotR2yTrQPATsUJgb8LojdOl5JKZY4gODD17qTrNY7/AcdihOSBFxRkB0toqtNnYC++ihS9LjP9Pk2+9mr4jcuSdDVUjRy1vx1xWqjwAiQzq7Y8QGEkSHMKlT2BSG9YHhapMrUba6QDs8LTBG3NOpRCyi3D5GhPfLc0hIKnSaijUUVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wMNfjUwVzSUlkiuoVFCZkk4d3S86vhARUhNLpnKK/0=;
 b=c8V8KfSXzvumy9mMqFTN8KP0VfawdLmHqgiYWdAYR1UR9yr2NxYyTfhqE6Z7Jx9795zCwFdArji7mYkJMSHwzjJdosUvmAW15n4/+EY6hunTluXqH3dS6sFRwh3tJDm6TaoUuLAH2DeRr5QoVA1onjZKjqOUxCZsAErpz3/1Cb2Zc3rpFxWNQ2e7RHbM0nr5EMl3NUTs3wFUsS3WtK58zfu613Fb9hGo/iQFLzlr8melb5b5nBMc5TIFAoqIDOjGgyYv/NJv5qmiUjQ4w9Ea9eJGA7Ar+onoUCBHdK/IToP4DA7B5dDnYxuuS4vTux9NVvHUA64Q+dlLk40rF7Y/tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRWPR04MB11281.eurprd04.prod.outlook.com (2603:10a6:d10:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:23:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:23:53 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/5] pinctrl: Add generic pinctrl for board-level mux chips
Date: Thu, 19 Feb 2026 17:23:40 -0500
Message-Id: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGyNl2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nj3YLMvOSSohzd3NIK3ZQ0y2TTJDMzQ1MTAyWgjoKi1LTMCrBp0bG
 1tQB9EfZaXQAAAA==
X-Change-ID: 20260213-pinctrl-mux-df9c5b661540
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771539829; l=3145;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Y4B/o674NbSbG/Fs0Vzlugi68/xAKxCsDFn5zWJrLJ4=;
 b=npIEY0Q7TBxd/jMKLql/jmD3k3b+MCJNHwcvfhqnPoqpq3A+MgdwCLYg0thz0K0sMyRFQPMZJ
 71HGq26HsF7AbGbc7aMtf6XAmg/UrNETMZVU8YWf4ageUM/nerIEPf6
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH3PEPF0000409D.namprd05.prod.outlook.com
 (2603:10b6:518:1::50) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|FRWPR04MB11281:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dab3827-ed8f-4d48-2cb3-08de7005901b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFNTV0pKTmRRTmpGTEluNmxHWUdZWFRReTlHdW5yY2paZFVEYklVejF6bktU?=
 =?utf-8?B?anZScVhyMG1vRDBLVEFBNUVucFJ5REZDZVdGNEk3K1NUa2p2Wk1QNm8ydDBO?=
 =?utf-8?B?UHAwZEJ5RXNOcnhEUVE3YVJaYXNTVmlEc2FXMjlBMEtvSEl1Q0ErZmtrYXll?=
 =?utf-8?B?dGx5aVVRUUM1anFnR3NkeGlGeW85Z3E1anVkWXdSOGFOeG5NMEVxTFRBNUp4?=
 =?utf-8?B?VUY1SnRzRTZKYUNYdXVZaFFhNTdkK3h4RytjZ3RJUHNjZi9iMUJIb3RuNm83?=
 =?utf-8?B?Z2w3NDE1NVhMOXVmUHVsbGFnb29pM2c4bDNBaURUdndQa3VCS2Qwb3U5L2VJ?=
 =?utf-8?B?K28xRTRqdC9RTjNYVmpsNkI2UzAxTExRbGZ4Q2VMN3VZRUxaTmVDTkhjSGNy?=
 =?utf-8?B?S2MvaXpQWkJjWlpVZzc3UlZvOHVhazI5OGNTcFFGbS9MNzVVdHFBb0Qvc2pn?=
 =?utf-8?B?TGZ5V1pMZnorb2haekMwVlBjTWhMRHpVa1ZNcHRTSURmTGlkdUNWTzJlajFS?=
 =?utf-8?B?WHBwZXIrbTdoalRmRE1NdlJia0RBS0VMQ1BrbWxYQ0NCUnFXS3hIVXdqM0g0?=
 =?utf-8?B?ajdzRHBzMXdzNEpSOTlieXcyc0gybjhYTlpOVGdBL2Y2b2xQN0RQQ2MxdW1X?=
 =?utf-8?B?Q3BmeUFkZHZCSG9VUlYvZVk0K29LOXg2U25HZnladHFnL1l5YXc4UE41UC9m?=
 =?utf-8?B?elFzTzhYYm96enZNOTdlVXppM0FjMFdueE5Nc0Fpdmg5WGxTK215bGU4ZVY3?=
 =?utf-8?B?eUk0ZUFiSlpuVnlNRHdwemZJcjMxYTcyRXYzMUdNUS9HZ1ZIWEFVRlBFSUh0?=
 =?utf-8?B?eVJiL2xac3FRQXJJTFIyYUtBTmJIZVlELzVONVZiaEQwcGhqWWdCcUtoYmcv?=
 =?utf-8?B?eGxTYlZXZEx4a2xHb3ExZklPZG9ZMldiVG1SbU9kNjB1Q0pqdU83RmJySnNZ?=
 =?utf-8?B?WTlIcXo2SHlRM2dUTm5DMHB1bno0Tkw0VWs1YXlxaHNmZVlUSkk5ZTVtNTBU?=
 =?utf-8?B?a0U5THMyc3BqS0tPcXhSRTFDMEF3M2dkRlFKN2NpYmtCNms0MUlsVVdHNGRE?=
 =?utf-8?B?MU8rRGQ4TG1BSWwzblRPK3RTRjdZUXkxS1dtc05pMkFyMWphSmFMOEt2WTRo?=
 =?utf-8?B?N2V1L1h3blVrVURSMk93dXgzSUlWUXBQZktIUHo3VVpkUUpEVXMwWVF5RVNJ?=
 =?utf-8?B?Vy9SdXVkQmo4Ty9XV0RyVnFhaTFZKzRIcVQ3ZUdTczVSRy81eW5BRElhaWhG?=
 =?utf-8?B?TFRmcnBwTXBHQzM0NDBiRnJaVUFidHRmVXYzZjIyMEMvY0syV0I4ckdOeHZu?=
 =?utf-8?B?Y2RIQzBiQ05vZ1ZiY3k1WFBsbk1GWDVod2RGZHF0L0lRYWZJTXFvVDgwKzNE?=
 =?utf-8?B?V2VRMy9YNm5ib2U3bEk4RzM1ZUEweCtkbmtHYmp4RFZvajI0Q2h3MWZhbHRD?=
 =?utf-8?B?U0FEUVh6MXpJQUQ1NC8raE9TSzYxYlVzUUQ3M1FEWWtXbzd4RlpNZkhxYjlL?=
 =?utf-8?B?dDluVmd3Mjcyc21tT00wcmVpTXpYT2x3V0swRUpCYWZMczdMQ1FjMVJmMGRu?=
 =?utf-8?B?S3h6VkhxQVA5enFka0NDZGRoSGRZQ1FKQm1KYUN0a3drOFVYZEZXbFdsV2Jj?=
 =?utf-8?B?RkgzQmEwbXB0WXdyMGFaWDdIZkdHUVVOMGZhQ0t4R0taVnRrSjVUSHVGRWx5?=
 =?utf-8?B?NWIxczVCNUFOdEZnZkVraDZWWTh4VGZKY1BYRHQzOTVOcmdOaW50SWRVb2xa?=
 =?utf-8?B?bCtRNXFSVHl5QzBxQnpTK0xkVDk1SkY5NWxYTG5QRW5VYmJxdkRKTnpRK0hk?=
 =?utf-8?B?M2JTcGVKNHdZeVFqM3B0RjBjVXN1MlRQaTVJc0dpSG1XV2V2R1JPMUtvMVhV?=
 =?utf-8?B?NS9DcXY5RG4va2o2WFgwNG1DQW5pWnphYUR1aThBak5RenNJYTVSbTltZzdk?=
 =?utf-8?B?Q3NEY1lZcXFObjFHVVhCQmoxc3N6ZFZRMnAvVDg1cXQ3ZTJlUDNJM3h3NkVq?=
 =?utf-8?B?NXRZbHBmbHdvbjQyMHZGYlZYTlF1bTF0SEJIaVpnRUxNSC9ZdGFEcWM1dFdr?=
 =?utf-8?B?VXdKSVBnUHBXaTR6N2E2bnJGVnBoQnNxY3V5K2hCYXp3YktYZzE1bENWTzd4?=
 =?utf-8?B?dndjRGozTi94YVBZTiswZ3p2Z0p1WkNRc1pGRXBacjhUNDlUM3BOOElsTlpE?=
 =?utf-8?Q?z2Tv8svIlq6HY07hIJTBKNk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3BkNE9McnZBQUZHblM3Q2NUYTZPYTVTOFpHdGNYdE9yaTlyb3JsMTRoOWN0?=
 =?utf-8?B?d2ZFM3lMSHRSR3MwZ3JObXRTZ0dHSGtIaTRGVFJYaFlmU2h0TGVsN1IvRzhI?=
 =?utf-8?B?NGFqbU9OR2c0T2s3U0NQbHV0YXFiL2ZvK0dEa1gvMkJESllPOUFnWUtyK2N4?=
 =?utf-8?B?eGI0cmlsMEZLQ2hiS2dBbW1qMHFnSXlwcVlsNk9lbVpod0RBN0xTZk41MWJQ?=
 =?utf-8?B?VXBTSkg3KzZzS2hkdkw2VlIrMU1lZXdzUGF0dGFaTW9vanFWY0Naenc4bTIx?=
 =?utf-8?B?VXg1ajRHTnViN0kyaVY0TmwyNWNXNlY0TXhzTmJFb2prbmR2cTRnWE9jZXIw?=
 =?utf-8?B?amVJMTZRZFV5ZUkrbjF1NXNqQ1NjNSt5dDllWTBtcms5YWxvS2pGTVJNYlM2?=
 =?utf-8?B?eWdxM05CR21zUmJwTEtIczhnUURvNXBaVEhXcVUwOFVCUWZ3WXJHakhScWla?=
 =?utf-8?B?MEtIek1Bb25PRDJkU2g4eDhsQlp4WUNTNkNkS0swU0FzM21reTNvTmVtMGJJ?=
 =?utf-8?B?cjhwWFo0b1lhWTlMb3g5dnd5VzJRMWNaNktlNmpKV1JxRm4rMS8vL2M1djZm?=
 =?utf-8?B?ZEw3K3lMY0I1ckxpc2dyNlcwR1pNcmUwRGJNRXFEVXY2ZFZ3eHZGTWVmQ3Fv?=
 =?utf-8?B?WStTcHBtT3krUXN3a1J0K0NGVGtoU2R3SFNqZTVYS0MxbGJ6bzNEZDBRbEpK?=
 =?utf-8?B?TkNmOFBaNFA1d1Q3VDlBWnVYK2RFdThQNFFDSmZIVXlWWUpIK2ZiSVVnczhr?=
 =?utf-8?B?S0lvb2RoNDdtbCtJTnV0UHc1OGhLNERPbld1WFlFajVHZkJnRlVMWmIwUUFQ?=
 =?utf-8?B?OW0waE8wc2E3WVBCaXhxZldOSDFOeGQweWIxcmNhS2VjUG1GUkJ4bnMySHZ5?=
 =?utf-8?B?cC9kT2dZMlRQeUorK3ZmZHdnNzA4UmRoUnRLZkhoSmVLdmtCb2hBZFg2Q0ti?=
 =?utf-8?B?REJ6em5BUU1XdldkT1RxSmdUMXBramxlQmh0SHNIZENablhlRW12amlPOFlv?=
 =?utf-8?B?c3VkQnpZQThOQ2p2dFZXbXNOSTNzTXJaVGgzYmRYd1BoL21RZFd1ZEZHd2lm?=
 =?utf-8?B?RW1qczFHQ3Q4TEhnOG93R0J6S0xwUHZ0dldQZzRXY2NsdXJiVVpsUEY1d1kr?=
 =?utf-8?B?MTFNVjZOK0dXcjZBWDFSRUFGUStJVVRVVmk2RFMrRTRDMmlONXU2Q0FvaDdD?=
 =?utf-8?B?M05kU2x3SnFrU3VuYUJoZ3hUR3VPdWRrVkZDbU0rY3d4RlVHZ3R1YWI3TTMw?=
 =?utf-8?B?YzA1VUdtWnJJR1Bzck9JUDBJR3FLVGJUQXRZNForN2VCeDY4QktJdlB1NGtO?=
 =?utf-8?B?WDRKbDJmSk9QUTJXN0ZvQ0M4ZjNsN1d2djR6YWxZcVVFVnFnMVExMU1Wd2t6?=
 =?utf-8?B?OGYvbkVjLzlDa2hHUVFOSkJISlVScjY1ZWhYZTgwSUlUOS9qeEc4dm1kVVht?=
 =?utf-8?B?dGZwZ3lTZzRBdmNCRnZqZEZOd1JjQjJDQkVVS2xKOTRnQlArQ01mZFEvTW5i?=
 =?utf-8?B?TFRORm44QWhERk05RFJzdC9ZRWVTcVIrTXcrbk5oTHk3b3hvbFZoU2NYSDht?=
 =?utf-8?B?RmtuWFBrekJNSE16SVNGYVRaZDk1TDBmS0lLcCtsTGd4bDFXQTJtS1JIU2Vh?=
 =?utf-8?B?UGF2Q2ZsZ3h4V2Y5QS9hRlpNQUJWelJ2MnA3dHZYWDUwMmxWcHlqbitBT2Qz?=
 =?utf-8?B?amszcnE1bEtTMDkzM1hUNlI2cThsbm9oMm1WZXVLZ1ErZ3B6WTJiTzE5Zm80?=
 =?utf-8?B?YUc2L2xzQ2Q0UTYreTJwTjJoVmM5Wm80YUs0d0h4aHRGWmFMa0hHcGVYck5v?=
 =?utf-8?B?V3ZPRjVzSGJkT25NN3dDRHhBZjVhOFNuZzhmNTMwOTltVFA1UlY0eFNmKzhk?=
 =?utf-8?B?N2FHTVhVYUlXTVNOY2Vqd3cwR3p4a3hQWS9EZS9Kd2dwcVlsSjBTdmk5UjNv?=
 =?utf-8?B?dXkrQTQ0ZlVMMnZ1UzNzTlB2aWxEOHNjRVRQbHRwdElpMDdDREJ5VTdOY2h6?=
 =?utf-8?B?WmhPV2tIUmRqWHp5Q3Z4d1FMUEd0WnlyaEpRdm1LWldTT0htYnk3cEJ1a2RM?=
 =?utf-8?B?ZFRqTEh2STlBVXlRd0JGS0l6OGpqVWFnSW1TWlhSS0ZLL2JHZy95MUNqcEU4?=
 =?utf-8?B?OEt4cXNsWnNqVXNYVzlsZFJPQ0ovUi9ZbEF3K0NYME1EMzNXTjJhMWxTZmtE?=
 =?utf-8?B?N3p1blREM3FHcFF5cjR4NkI0cTdlSTAzZlUyMm5kSHhaL2NQL2x3UHJ0cGdj?=
 =?utf-8?B?STVreVJQUHVNWXVpd3o5S0xFTGRHNGJla2VORGpOajJPSXlMR1VWS0w4RVFZ?=
 =?utf-8?Q?UPusbdaHO9ZCaIAOzK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dab3827-ed8f-4d48-2cb3-08de7005901b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:23:53.0540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8ny2A2qIjkbK2LD7U4OI6NotxBJL1PNY4nbOadIvJwWwSUZexB2Ncq9KimzVCtljoWXWyCbCpDbNiDLKFfAzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31914-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF328163252
X-Rspamd-Action: no action

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

        ┌──────┐      ┌─────┐
        │ SOC  │      │     │    ┌───────┐
        │      │      │     │───►│ MMC   │
        │      │      │ MUX │    └───────┘
        │      ├─────►│     │    ┌───────┐
        │      │      │     │───►│ UART  │
        │      │      └─────┘    └───────┘
        │      │         ▲
        │      │    ┌────┴──────────────┐
        │ I2C  ├───►│ GPIO Expander     │
        └──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (5):
      mux: add devm_mux_control_get_from_np() to get mux from child node
      dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
      pinctrl: add generic board-level pinctrl driver using mux framework
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file

 .../bindings/pinctrl/pinctrl-multiplexer.yaml      |  54 +++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |   2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |  15 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  23 ++-
 drivers/mux/core.c                                 |  40 ++--
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-generic-mux.c              | 222 +++++++++++++++++++++
 include/linux/mux/consumer.h                       |  16 +-
 10 files changed, 363 insertions(+), 23 deletions(-)
---
base-commit: ff76d257e86235eb07ef33db8644a517c48d1c3f
change-id: 20260213-pinctrl-mux-df9c5b661540

Best regards,
--
Frank Li <Frank.Li@nxp.com>


