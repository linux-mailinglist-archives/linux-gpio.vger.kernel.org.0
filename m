Return-Path: <linux-gpio+bounces-34181-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOJ/CXNrxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34181-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:10:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80532D47A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49F1631289D4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B4C397E89;
	Wed, 25 Mar 2026 23:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mjinq2U8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5EA2EB5B8;
	Wed, 25 Mar 2026 23:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479895; cv=fail; b=OCL0WV1uyG1Gk3se1dw31SxKoZ9WN2zPuUtbRrydt00erdn8eyLYrLNyxowBMGtUpnsOT07vK1z3e3G4cS/hgVWNzUdiKHWIFnww5GuYt7Td39AbrNsAvMIy0KqCXZsRQiHL2Bh9i2wXEtVEBF3IHT9aIwF+TU+40MNqfa9o7tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479895; c=relaxed/simple;
	bh=1UX6p1C0kT4kF5hCfTKLF4LKgaOM5Xl6++ZwO5kKYIM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aKQAQKZhwpXGsgaCn10iUINphIV1k5MjVUKpSMcj8W/AN0NIFWKmNUV0rmJTryW+6yVRHrwS7hC9VmBktzWBBxOCx8Lzjgkd2vT9ZJAoQ5q+5HEKuCJc7qh9LiXwmZ/FftUyq49ZcLl0Rvrgvj7khjyzIVkNsF+8OjMQNhMSk5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mjinq2U8; arc=fail smtp.client-ip=52.101.65.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOb13jA+u0QtyZyyDzpeqYaPYp4otMMZgqU3/OE1b1z12cA6GIGRR31cf8z59kdNChKxBo5TFS/12E1G2sFdP3kfW2F90Y+dhwFAoHmeUZezQeJqnnlukbpqOfZTEyy5ZxZzDwQ56qTi54LuRrAx1CrWKaGDS9pbrNBIkO4oidlKGaWOL7dWWeuagZLLECz8eqBr5ndYnCGv3yEQeYaB577lvF48VcbPKfbsGsml8oCwUPh9fKnLVwTQusmxgfGapXZN71ZF4602flNbAVA6p1o5Ml2gwb82RT7O9Cl75ZVwHH026M4u91OkKFdMpHP0yWD0Sk6MXVpNfWNGoXiwsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj9e6SKLGiBn4BvTY+vV7gAKxTFz16kmEmbNs2EUfZg=;
 b=Mj6ACpuN/IeVj5rGNP0jGTyi7auOLxTwH72+/aBiwAM4UtHX6FXIm23vLNhRn/35U9h5mczPBEW4zIXDbjO2MdfjJ3JONcXZ67ZTZFpW4gNoixjxD0W4z6RRGAvoQtZoBcOUiLFTxx336+8MAQ0j9DTLomjMBDXSEJogLGPqY7JmgBQtg2dq+cbqWkuL/9wQtcfKDKC73Rybca6NAN23HN33VkbVLngkqsIhKtlwv4A1tty4nssGfxAfgs35ErPD3FxD4dG/scO2+lDK0u5GSobqpW4/WXf23T6Lssbhx679ttppHo6x3plHnkwOrpBqej3/mBf2bd8ygS+wURgvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj9e6SKLGiBn4BvTY+vV7gAKxTFz16kmEmbNs2EUfZg=;
 b=Mjinq2U8wPlSohJyuEDSfcKA2R3c5O6HrRQMZxiouWTWv0SeAvXyJB+2NzgrIve89HzAnVXBRWrs+T4cY9xPGG89Den1z3/YOyQ1auVQkxfv9lMqra+rIQG7yTwpZ78M/pEQw83W6ryZEnhPdlo/j9vVmd6M1/nCYz3qN8J+m2xuAzqRNPEff2dLIREQqoeZZjx72S7S9Ojl4bZ2wZOrH4QYmL8BLIZAu/W2pUtQV1ahitwPCf/E7yo/KrSk1b2qrDT9f8QavLV0ikB5/fWbhW7Rs/7JaOvVPJKIwkUcL0/aEajvVZSyUE0YkJRx6srzUZmkqW6cOD4gA6l5wwoCFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:51 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Mar 2026 19:04:15 -0400
Subject: [PATCH v4 6/7] arm64: dts: imx8mp-evk: add board-level mux for
 CAN2 and MICFIL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-pinctrl-mux-v4-6-043c2c82e623@nxp.com>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
In-Reply-To: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=2170;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1UX6p1C0kT4kF5hCfTKLF4LKgaOM5Xl6++ZwO5kKYIM=;
 b=y+Z+dZErhpcWanrB5hb4WuZYEgAS+JoK0m7lIjD6JaR4p43YXb2byeKuVFd6gJm4Z1RNrWFU8
 sd+WN0xguCfBHLvjMh8qGXRw/pA0teWYCyQJHJ0ps5sjzauki8Aqc9f
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB12140:EE_
X-MS-Office365-Filtering-Correlation-Id: 6143b31a-c499-42ac-20a3-08de8ac2eb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	VzZMYgXRJcYKqloDFBHBWrNPvYWMcQmzxuWyGdO4QsNY52hyrivJk8uw7D8/EyQswWwz/y9E7fcQN10ZbfWFs+r9MXTKuAO2U9dYftSmfXSxC5hbfHpW/IugUBq1e9z0NGCR6QI2JB4VU7QRW9uHfyBQRimj/3IiYRicabHD0YOARh2OpMU2JMjPEljK1+xULmwK9zBnxH1T940xbvuXnkKt5XyGE4aE1A399Q2i8ubj7uXcZ2rM/urlExuN2HVr7m1EuX8uHHE8yB5j/XC9qqIQmVv5CFScGXT/ji+NkeZH8/MSwF2ONhIaCh7dzDy6XM9NpXJzK1BdhFqinouRsie52zPsTPcMh2yGU+xaNq2A5rS+aILx5EmMTnblxC1FqBaiL/UyMDbmuiLQD2Q3WS0RfeMBMRFfQsK2nyNQ0yyjJG92oIBXDuSiCUMow4JwtQPViXYu1m3MN7jx42t/xe+DSpCcUZczwcmGtcgFrvPXmRjPVcjOhBd4lnL4CNCCSRTcQnggKKqStOuHVhoXyBXKM9ZhsJu1husXRJIZU7QYkSnYNEQdMtShxQ9jcOKSE2lVO8na0QlJxTYFMaI5h8c53Gs26glVjYQdgdQevybL66FoAR25ip+7XWAVxkweACGFYMjxAgiTXklBlyb4DS4NFfetuUZEb/qmwYdbvVloCEXKJ6ouPPC5hwvMU8+xz7Ysvd2mMPRXM35B7klwvxPYaNSjFFLh4UnI80Wnbarmxwi66YLLQyymRBFUi4j8VSFdIsU408lXGV3es4E5p6cyQ2imubrsEGaVzxNU3sY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bktxWXg1T1hUOWZ3dmVWcUIzNW11bFF0MkN6WExnN3g0Q1hGV00zVTlFY3Jv?=
 =?utf-8?B?aHpEU3NMaWRYOUNhUWZPY0o3dzkzQnl6MW5zeXZwSW9iQlhtbjlkZmxKYTdF?=
 =?utf-8?B?SS9LTGJmZkJTTExFT0FwREV4OFdmY3F6eml1N2Z3bzNiSStLZmVoQiszNTNI?=
 =?utf-8?B?Q0FHdHo0ZUZyMzRFLzN0dnF2cThETTNRdXNjVjVQeXVsdWtiYjRDZjZaQzJ4?=
 =?utf-8?B?T3VUZGRkSUwzQldTNWdDMnMrS0lmU1lPVHVCR3FRQjB0dThveFF5THh0cnhR?=
 =?utf-8?B?a2VqMjY4WjhKQzRZbjFyczZpNTNVQitnamlleWlaamUrRUV2Z1BpS3FpK1h6?=
 =?utf-8?B?S2IvcXYzQjBFcFVhalR0ZjdkSFlCUkJlUk10eXc2aERDUU5saDZ5S0xGZWI5?=
 =?utf-8?B?VWpoLzZuZndXdUo0M0U2dTM3OVQ3SVpkSElaZzVUUzVBWSt4aG5KUHphYjNs?=
 =?utf-8?B?Wk4xSVZHNC9HYUh6Q2xScnorZGRoOUZCTEtwU3V6cDhwbjkwOUZmN1JucFVC?=
 =?utf-8?B?YVVvY0JabEFzVVVQb3c4cEtpRHVsVmFOYWFIdnlGNGcrdzFLSHJYTVl0TzRQ?=
 =?utf-8?B?NXVnRGxrMkE5dmE4Z0E2aHBpV25SS3ZwTmlVZDhZaVZzMXBEeEFGdER1ZzZC?=
 =?utf-8?B?S3ZWam1hMnRWbStwRy9WdXE5Mkdrem1od1FjNEpGcjJVOHExa2IzTjBoSm1o?=
 =?utf-8?B?M1ZuUlMwR2xlb1o3eHorTXU3M0YzQmJ5OGZEMDJteXBpUDVFeE5jTGdOMHJG?=
 =?utf-8?B?bnJNVlJyUExIWTFiV3REdlIyRjdxNHByalR3N3ZQampWWFhyL3l1OEwvWXpE?=
 =?utf-8?B?andRUWo5NjV4Q3YvMmJleEVJQzFxYXMxY1hFeEJxaU4xTGx3Q09QSnRTUk5E?=
 =?utf-8?B?bE1jV3dOSis1NU5FaG1KRnNiTHZlc1U5b01saGpCSTdxRWFZVDVBUXNqcWt3?=
 =?utf-8?B?RzRUaitSSmZ6a0VGQVFwTmpRblVQdFU4ZVFjY2djVHNkVTVSTDdySEQyWEJv?=
 =?utf-8?B?TWxpTjIzWUtHYUNVcktOUWU5N2dsZ1lHUU9OYTZicDRITHVwNFJ4RTd3L3o1?=
 =?utf-8?B?cWl4dGI3Z3oyOStFK1JxNXNPRng3ZDNjQ3MrSCtHUlpFYkc5Q3A3SGczQVkz?=
 =?utf-8?B?REhWUzlxWmJCV0tRckxXOVJ6eUFYZWRDUTh3RE5lUW5hMlFEQVk0N1E2QXQ4?=
 =?utf-8?B?U1UzMFBHaDFDQXRNZ04xTEJUR0ppNW0xYm40eENjaHpKSjVQRDVqZ283T0ZF?=
 =?utf-8?B?K3VCOU1lMWhteWpyUEgxSmZYVm1TTGJDUjdCWmc2akZIOUY3TW5BYk1iSVJI?=
 =?utf-8?B?TUdlY0RHdVdrZEM4OWc1dUZlcHo3YU9RanRTWWJZdWE5WE1QU3lVY2VGbko0?=
 =?utf-8?B?MEZWVWFsdUFQM2Nzb2M4amt2Qm43MDNVdTdxV05nclA1MXk0OXMvQXRYc05S?=
 =?utf-8?B?R1pWM0U3RDA4b0IxZXRLM2lIV0dYOUJmS1hCS0lOV1JnSGhONkNlUmVsbXM5?=
 =?utf-8?B?VW1SbWhid1AxZTVRdFJXbWEwNnVxY0w1M0Uzd3R6YmtCRCs4SFZ6T2xIMHNJ?=
 =?utf-8?B?R3RpSHFzdDIyenR5SHlmaEJPMmRQOTFtZ0FCSVNaall5TjRDcWRVdHpNUGZk?=
 =?utf-8?B?ZGVBYU1FVS9ZTWpiQ1gyYjZpQW5GWU1IMVcxaDF0bmhOSXR5MnVmN2RmZWY5?=
 =?utf-8?B?YWpObEU5Rld4S1g1ZWtpb0p1NjhDWi9jZk1jaUV1bitOWUp2bUQxd0VubTJV?=
 =?utf-8?B?MFNPN0J0MmJwOWNOb1JSaU5LNzNHTGZidFlWRkhIRytPeC95UmxmNitqRHc2?=
 =?utf-8?B?ak5xaytpYzQ3a0VwUHhMY2h2aktUeHA5djVGUlZZQXJjOElJSWZ5enZTbzE2?=
 =?utf-8?B?aW5XZllsRXJyNU52cDgxZWNMNWtVZS85R1oxWG1iMDZiRnQ1azh2b2VIcURv?=
 =?utf-8?B?aFpjS05jY21INUxxcHQ1MUNocGlsNGV2dTlnRE94TUtNRlBqOU5Fd0wxaFJr?=
 =?utf-8?B?RDQzVWV3SWxWamtKVzNCRmVSWkwzNE12SVltMDZONjhobWVYZmhVQXlsK3kz?=
 =?utf-8?B?UDF3NG85bklQc2EzTXEyTndKNVJJR1U3cGxqNDcrTDhBWHNYMDFmbU85K3dr?=
 =?utf-8?B?U0hyQlovSUtIVzNoczJYZFAzc1piV1JuaGswSTdKKy82M2xGQTZjSklwWUEw?=
 =?utf-8?B?cWRkbGM2Yjd5N2dQSENlanNKRVpuNExyYlV0cmQ3ekV1bjJ2Q1lWdTV2VVIr?=
 =?utf-8?B?WjZvMWdEQUZvOTgvZ21JZG9nSHZZV2RhSi9yTXExS0ExT0hYK2F5UU5YVkNw?=
 =?utf-8?Q?tjB5jFN9waZwk+j3Lv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6143b31a-c499-42ac-20a3-08de8ac2eb7a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:51.3817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiKMpmv2clIACD0YeAr/dK2ZaP3UiWaHXejpjI8F7bTd9uDauBptD2g+7D08eIBTufGtE3vV3/qF93lsHg7xLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-34181-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	DBL_PROHIBIT(0.00)[2.98.90.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 7E80532D47A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The board integrates an on-board mux to route shared signals to either
CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.

Add a pinctrl-based multiplexer node to describe this routing and ensure
proper probe ordering of the dependent devices.

Previously, MICFIL operation implicitly depended on the default level of
PCA6416 GPIO3. After adding the pinctrl-multiplexer, make the dependency
explicit.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3 - v4
- none
change in v2
- update commit message to show why need update PDM MICIFL.
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b256be710ea1281465f5cecc7a3b979f2c068e43..1341ee27239fd41a26117adc9023524ce50420a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -50,6 +50,25 @@ status {
 		};
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_mux_pinctrl: pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -446,7 +465,7 @@ &flexcan1 {
 
 &flexcan2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
 	phys = <&flexcan_phy 1>;
 	status = "disabled";/* can2 pin conflict with pdm */
 };
@@ -712,7 +731,7 @@ &lcdif3 {
 &micfil {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <196608000>;

-- 
2.43.0


