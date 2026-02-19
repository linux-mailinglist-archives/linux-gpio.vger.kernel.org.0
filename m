Return-Path: <linux-gpio+bounces-31917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JzXDJKNl2lv0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCBC163262
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EA63301DEC7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4554D32C302;
	Thu, 19 Feb 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JtnG1QhK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0732BF2F;
	Thu, 19 Feb 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771539847; cv=fail; b=C/iBvlw3iy47xbzxUsp5iQKUBMg7kpGCIkITKCArH6j8lnKG3IHd6ktPxiujHGw+UN63w79pUZjZsbL4ajEkj85iRlmJmo2NUzDtQ3BiAvbzdQM+qmEIE+qkLV89YgWIlfW6lmdwQCyn55KoMGhsZxu63lfPCpVP0jaJbglFQEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771539847; c=relaxed/simple;
	bh=TiB2IM53CX9+LHV20atkxy9VBdVbc5izvWLpnwEd0vQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=loK3unLJlLHgGsUh7P044FbVuHCRemNelT6oGotw816+IRbAjsY6hlLLx72TODEKiL/4/W839MG8kS/kwtGxtE1RF/+2mBPcUhp2ht0/vigv0dkMaHsGRnlcYOBJB3OP3EyPXzOsPZlqP0vV9gmG1DS7jgmzPKX50pZXqEvYi9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JtnG1QhK; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iakUL359Ovrlgq3Gl02GPusPVMyEePD0TdaNh5J7VazFaF5b6zyITTcoGAAXG0vzelbrsTlYgIBoNSLrDMxvWAqKga5GIiSwpRTFXf3ny63Rzjy3clv+jrI8cBd1G7/An9+ARKvRweh2uCf+IlPkytKQzDQZZrHrks2BMQOJQMQJ0ideD6XMOAUf+KvofRhIbQWq4cn4FCIzFNzFv4LaQYqGXcX7i1gyCNVJDPyHyoQW6ozW0vtZfGGphRKLKuGyPx7zTinkip1lSnSzqxnSo+/qARlMc+kmS+g2qxd0T0sQtHjkj6zw6GKsCQ9B+k6V5f54jBLl5Y4XHXpm6jTJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnMeViOCrTMbPLpYSVWD9aL264//DNh+id7xvmX9rsM=;
 b=udjJtMQPOfXJbgNxoaD8tzxY19IeFGORLLVKKTAetwFpiCVhz0cHMqLOpGUUwBJgff+wj2iLCOHZLogsWZtfsIx7XHkcTAaB+4R6LN9wZI2+1X97jHRLZhYkTRUyZc8ZQrv16jBSeF3M0LuDA1HCurzj/rBgGau8zpiRPuVca2C8ECzmWeKpXcdYo7d0ZuxzXUtg1pe+sVjTCfETCw8CFx5dyOgRrBsuGD9zRjDx2c4TyVO+4pPcb80wWfOoJLiczTLJrtf8TMXZx2Ge1DAc/hceaMxulviPOsIRuM78ik4CCVmLhnyrJfaxvv6WMpS4a5r5jTRRaECurB9n6C89Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnMeViOCrTMbPLpYSVWD9aL264//DNh+id7xvmX9rsM=;
 b=JtnG1QhKP3ocIGRaxbmV3aU0dyBWyJex5EAaZyNmfuJiVcgQJuCfs9XbLuMyIqjX6ZfIccZkNneipxsOtPMwCfpX3AwBrkscax7Nw/ssVNN/mghT5ASU+5KOVi9LjX37j39YBUaMMGbQshvO65QXYaH3fwb+jo4hETBvGuqDZz/2ka9PdHL/+i00Ky7poh+wawgWgT7d2p+6bfNLYKpwpiGqATZBYDjlh3+dicX47ddAmaHQET/Hcbl9R6alyEj6AmQeTssYacOKlbY5WuAjrEsEj+xwsCev90TGGNWl3K9iC5t5QTw5m3yQ1aRpPBdoeWAEZAg7yDGSI9khnuy2lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRWPR04MB11281.eurprd04.prod.outlook.com (2603:10a6:d10:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:24:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:24:03 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 19 Feb 2026 17:23:43 -0500
Subject: [PATCH 3/5] pinctrl: add generic board-level pinctrl driver using
 mux framework
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-pinctrl-mux-v1-3-678d21637788@nxp.com>
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
In-Reply-To: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771539829; l=8074;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TiB2IM53CX9+LHV20atkxy9VBdVbc5izvWLpnwEd0vQ=;
 b=Zoe0nu6ADpXQbtLI5d8rCs3cwzwXHjJp/Q79hB/nw3xkU/pDZdSyE+S2wwcmIckM7acHpBqgh
 gEGUzwJ8hRvCxFBhHo7rYjME72vk61Y7kk1tZxbZmLRXAUXaDqwc8gp
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
X-MS-Office365-Filtering-Correlation-Id: 941ec195-e730-4716-5642-08de70059635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzhLc3NHSzA1N25mMFVUc1Q3OEtiUXkyM2dvaSt2TE8zNFcyU2d6a21NMG9W?=
 =?utf-8?B?b21neVJJb1E0bE83QzUxcy9qTmtWVEdNU2E0dTcyTk9rMXNQTWxGcmV5aUtE?=
 =?utf-8?B?NHpLdVRRM1l2N2l1Qk82cXNZK3MwOFJmV0hTeGhldjRiZzJnbnFGbi9hWXVv?=
 =?utf-8?B?bDQ2UktHcjcrSU1samluT0c0cmRBWEpFempITkxxRTdMWm9GQ3N3WTYrNEd4?=
 =?utf-8?B?S2s1WmdQZFR1NXYxVUI3NllJYlgzVWNYNjRMVG5zMmFrb210cE11TmI0ME5j?=
 =?utf-8?B?SjVBTkNYMkRWTmZ2ZURGaXRjQlU4dHgwWEk1d1RGR09VbVVENnI1bERsaFZV?=
 =?utf-8?B?UHVPRlJ6VUVsUnlFYlcvZ3ZPdXZ1TVA2cHlLNUsxZFBVUHZwV0c1bjhhQ0dH?=
 =?utf-8?B?LzhxU1lLMVJLVzlqYVhWSExZT1FYK1YwWm5SRkUwb1NzMDl6R3lldnlMYW1R?=
 =?utf-8?B?ZDZ3N3c0QVpzVTFTY2NNbFh3cWQxK2tKR016dEFhR0hEU3ViNEJNYkIxdmR5?=
 =?utf-8?B?VXpsNUc5SXRlcm0vS1l2SU9vNHNDb1kvK3hqS1k4YmxjMmxlckFrMkJtS3dE?=
 =?utf-8?B?UnppUGRWY25pM1BlUHFGYXJiUDNUTk5nYTZweXg2aU9qSEE2Y0pSSEl4NXVi?=
 =?utf-8?B?STVNaVVXMjd6N0pub2xxdGJaRGd4OU5mdGtFZzNyNUIwVW9oT0phRzh3Q1Z0?=
 =?utf-8?B?T0E3MklpVUFrTEVaOGUvNnlxKzNMYi9QUG00bGZrUUppc3NDamowek1FVzVa?=
 =?utf-8?B?OU5VenJ6a0swYmgvdkJOQWtRajQwYVlOSUhRNTlZTHE5VHN1YTM5Tm1STTNO?=
 =?utf-8?B?QzhEZUdzZkRML29vZDdDWGVwNW80VW1SZ2s2cXI2QkpZN0tVdUZWR1I5WGJ5?=
 =?utf-8?B?bGZydmoyemFYbkVtRWdBM1BSYW5YdTJWNmMrbC9yd3A0TVk2eUpBN2tmOVN1?=
 =?utf-8?B?Rm9CdDNDVUMySDYxVzlMaFJVUjJSUnBrYmxLWjBxYVNnU1JSSUt0dW1tTEpx?=
 =?utf-8?B?OWxhRzMrcE5Lb2FMTnQ5U0RiY3pmRWNlYTJySy9rcFc1WXJMRk5kUk1nNzRo?=
 =?utf-8?B?THh2MWtuN2EyMlcvdk1SVUxJeEVSeXJvN2RpS1IxcE4zQUFUTmNveTNsRnp4?=
 =?utf-8?B?dHVVTkNNeXc0aEIrdFpmN2dRZHpmSmJreUJDVGFXTlhFRFlITFZ3VHhYdzYz?=
 =?utf-8?B?dmxraVByUDRjNmxZY3RVQlBqVFZTOGk1TCsrRWpMTTdvQUNYbzlRbUFGTkZa?=
 =?utf-8?B?SGV5UjVqalJuaEJGWTZxQkFubitYQ3Fyd2l3cWdzVHZtTmtOME9QTVZSTjAz?=
 =?utf-8?B?eTAvZlVjMUo5MkZyUEtuWjJYOWZHa3phdlJwR0JNZms3dGI4VFNna2oxOUdj?=
 =?utf-8?B?blZySStzazhDMnRHRS92cFpvWUxmU3ZQRVRsM1RveXlvTzNtS00xOU5HTjRm?=
 =?utf-8?B?YkRaZC9uQ0Q3KzdIQVZnakhiczBGZjdDMFZNQk9jVnBDcFBZYjlzSjAvWE9S?=
 =?utf-8?B?YVd5OHc0MEIxR2VCN2VqZ2J6elNrVjg5eWZZTWFlUTBWckJMRUNjUUsvTGEw?=
 =?utf-8?B?cFNjd2hZMittdENSM0xKTkhjVEwvYzdYemZzY1Ftcmkwc1BCQkY5d2pQaVlC?=
 =?utf-8?B?eDQwV2RPVFUzRnBlaHFQcTF3VllBOEIyOEdpS3oya0tnS01rUUNLUkI5T2hm?=
 =?utf-8?B?blVzSDNqcUxMM0pEbWpDQ0Foanhxam1FS3NEd1hWTEhKTzJKc2MvZ2tmb0Rs?=
 =?utf-8?B?MGdCb3B4QW94VFNUMDlQcmM2SDJlaERCUjcwbWptRE9CM3RMVUQzUzVXTG1M?=
 =?utf-8?B?UUdUSm5EWU9CNHlHN205QS9VMUlvWDlTSXd5aWFUVEgrQmpjVkJuMDE1KzR5?=
 =?utf-8?B?dlVJa09RWlVWSHZWZkN6cmJ2ZTduZVRMU3VJOE14U3gxRnprQUh2VG9qY0hK?=
 =?utf-8?B?am5ob21nTGpCYmxaeFUyUWJJbVdGbFNzc1pEWFZDZmRvWVR1NnRoQkxtU09t?=
 =?utf-8?B?R2VnVkh4Smt4NXRYaUVEeTF2NFlMZnN4SkY1ZHhnbjZvSy8ybndaMXhsSnJM?=
 =?utf-8?B?WUhrZWY5MmxKTStXK0lvNVNiS1l6a1h1OWk5aHI4MHVNS1F0aHo4OEZSQ3lC?=
 =?utf-8?B?ek9kSW44UWduQ2Z2Q0lZZTZSN085MGhEcHNkNHc0QUlFeFYzWWVQMitiMUds?=
 =?utf-8?Q?NugLTPJRoEfdGpGggkwJpOg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTQrRnY3SHFDOXpZWFdIaGE3bFNJVTVXZ25QeHIwNjF2bUhFWXRURnZiOTkx?=
 =?utf-8?B?R2tDbHFGbHBaS3pjV2JneTkybi81QU5vTkJwSEhjZ2J6N0wySWorbkhwVmZW?=
 =?utf-8?B?QW9GZHdpRDRYRjZ4cWNJbzB3TjlwZ0tHU043WitEcEE5TEkyb2RBYlUxS1Qr?=
 =?utf-8?B?ai9Xc1IxRVl2Vytldi9BeTE4VWJ3UFlyVFV0eGNTdmtybThIa2tTMit1eEo5?=
 =?utf-8?B?ZnN1WnllNjhaN1pWa2JPWUtXNEU1WUJRWFZOOSt6eVBnQXVEc3R2S2J3a1k4?=
 =?utf-8?B?YVJQL3N4b0tFV0R2eXdPTUJ6UVBkU0c2Z0MxREdzbkV2M01DZ1hGeVhUK3By?=
 =?utf-8?B?d2RrUzVyd2s5VW5ReHp2a1JOWmkvcGJHSlBHS0NZU2EwUWZZYmlPU3BZTUdu?=
 =?utf-8?B?NmNyanJiNFR0RkdrcWNIdC9QQWJKZ0FvWnJXeU9IMGl2Q1Z5ZnFSYi9DR21s?=
 =?utf-8?B?RCtHWUtLQ0hQaFE1WS96bnZ5aDVUN3dkRnkxYzNORlNjZ0d2SUVSOEdIR0xr?=
 =?utf-8?B?THlCSm50N2JoUndGK2QrREFzUWRmYVJNTGRDckJLQTNoc1ZYWW8ySDNCLytO?=
 =?utf-8?B?M0FrRnJlWVRacktmdHE1dXZxZ25CVVRxcERkNDlzaTd0OC9VSXVvL0p4Z2d0?=
 =?utf-8?B?YVhnamIxL3RmNkNrR1JVQXhFWnNMVU1YY25jVm1pUnNjSVdTaXVZdVJTY0pC?=
 =?utf-8?B?Vnp1S1ZVTTlPc25wRXhQaVRYZC81M3JwZGZjU3RjL2RRdDd1Mzg3K05nVHNG?=
 =?utf-8?B?QW5rYk92eTRyZUdBVTZIV1Z2cElmb2plTWQ0cFZHSDBxQ0ZVcWp4L3RDeTBO?=
 =?utf-8?B?MFoxZWFnalJUekdDUWprV2lGYUViVDdzOTRDYnc5aW1oRmJsVVNQMG9ob1Np?=
 =?utf-8?B?QjR6Z2w2RFd0K3JPY3I0SUE3NU1NM3VCMFVPaitwbW8vRGZyNnlRQkdTMVgz?=
 =?utf-8?B?b0Y0a1BHeDBBRjNxeGlDVDNleVRGK2dQRm1iMi9xVXk1MXJ0MWo1L0xoZWM2?=
 =?utf-8?B?d0xPQUg4WnlEaEhmemI1Z0VoWW51bVJ3ckdwL0toTUNHRFkwSVpPeml3VFk0?=
 =?utf-8?B?WFc0OG95TGh1L0xrOWk4ZHZNYWtWbEVJT0g1d1g4MklEUFgvQUlZdkxUa2Zp?=
 =?utf-8?B?T2hrVSt1MFZtU3pCeWk1d1RQNVVuTC9EQTM2U3VtTm9zRUllL2JndGhtdVVp?=
 =?utf-8?B?dEpFaWszaDAvb3hJOXdMZWdYMms0ajU3NkhBUUhwN2dpVUlER3RjamtKa29M?=
 =?utf-8?B?QWhUNG1mYzlNcVJZVWhHeDBkejNNZkdEejAyRHhhdHA5a0lIYnZtQ1RNMlB5?=
 =?utf-8?B?QWZPZ3IxdFg1YktIbEo5RUEvSjNQVTFuZFZ3MFYraTRablpGTGZkTmdYZmZ0?=
 =?utf-8?B?Y24xWlRRRFhwNFVsaG1JTWROYWJyTzRBbTZQZjZhSi9temhHMm92dDdSdm8w?=
 =?utf-8?B?M0diMEliOFM4OFB3RTVrZ3NrbjZWT0NxOEtKc1NXU3ROYUZLRXdGZ2QrK1Z4?=
 =?utf-8?B?NzZ4clhQMXpBazRwVTJwOVZENXFnUTN3eFMyZksxK3Y4cHBrU0JUc3R0akdK?=
 =?utf-8?B?S0NwbTIwWDZJRjg1cFlkY2ptYm0vQklWVEhOM3VZdEFCNStBRlR3SnBrREw4?=
 =?utf-8?B?WUZUL1hIMHVOMTViakFtT21xVEYxMDB5b255bTBXMXpzMUh3RDJZSDVua3Zh?=
 =?utf-8?B?RmJjdUNiN3lLZmpkZHNKL3FVQ1hzRHJXbG9ZanZybkkyVnlrSStZalVkYmYy?=
 =?utf-8?B?N0dhNXlMV0dveW9LSms3d2g1enU3RHFoejNheE85Q3BGZE43Q2lmUHBISVFl?=
 =?utf-8?B?VGw1MFk5a0ZnUGhKVithd3BwQVNDZnh1d3VYOTExMFovcnl2S0hJQWUrY2pJ?=
 =?utf-8?B?cXAxWC8rdi9yQ0ZmdjA2eW5vUFYxd2FQazV0dFV6Y0t6N1JLMWRQVGRRY09L?=
 =?utf-8?B?a2ZXOEVsb3FadERMczBWUmxJbElWZjAzNTZtbW1iYXpad0hreUFsTERwc3R3?=
 =?utf-8?B?UzN1Lzd1Z0FuQnJVdm9RMnBzclhJQjN1UFkrUTJpejU1d2d5K3RaTDNzcWZO?=
 =?utf-8?B?ZzR6bG1XQk55enoySGlNeW0xR1pjMDJqaEpNVUNhaWFoYjcwSW5YVk5xZFhZ?=
 =?utf-8?B?M2hMT2dGbXJHOVBiZVJ3Nm80V1JDV1F4cytnS1MwZ0FzcTlEazYyRnBRd1Ez?=
 =?utf-8?B?QVJ3ZERkV293TmNXSjdtTHhsM3ljamN6YndMZFhQc2Y0c2w2a1RnN1Y2MVRE?=
 =?utf-8?B?bHdnT3FCSVg0b2VibEpBcjVwYWMxOUszMnBGb2R0NmhOR1hLR1RZUjdvV2lQ?=
 =?utf-8?Q?z+W71y8SquDGqAroo+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941ec195-e730-4716-5642-08de70059635
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:24:03.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2S2tVyM7NXvvEn7X7x9MkKN5f5sXNGZluLuqZ5gmTUvzTFh8zbK0EkAH14kISektOCimVKb6LjSKye9xD6HG5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31917-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 9FCBC163262
X-Rspamd-Action: no action

Many boards use on-board mux chips (often controlled by GPIOs from an I2C
expander) to switch shared signals between peripherals.

Add a generic pinctrl driver built on top of the mux framework to
centralize mux handling and avoid probe ordering issues. Keep board-level
routing out of individual drivers and supports boot-time only mux
selection.

Ensure correct probe ordering, especially when the GPIO expander is probed
later.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pinctrl/Kconfig               |   9 ++
 drivers/pinctrl/Makefile              |   1 +
 drivers/pinctrl/pinctrl-generic-mux.c | 222 ++++++++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f5354f5b92223f8cd80d2f7a08f8e7d..0657eeeeb587fa5e68dc3c1e00be35608e243b80 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -274,6 +274,15 @@ config PINCTRL_GEMINI
 	select GENERIC_PINCONF
 	select MFD_SYSCON
 
+config PINCTRL_GENERIC_MUX
+	tristate "Generic Pinctrl driver by using multiplexer"
+	depends on MULTIPLEXER
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+          Generic pinctrl driver by MULTIPLEXER framework to control on
+          board pin selection.
+
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
 	default MACH_INGENIC
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c8becc0aa1d77c68b6ced924ea264..fcd1703440d24579636e8ddb6cbd83a0a982dfb7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 obj-$(CONFIG_PINCTRL_EP93XX)	+= pinctrl-ep93xx.o
 obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
 obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
+obj-$(CONFIG_PINCTRL_GENERIC_MUX) += pinctrl-generic-mux.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
 obj-$(CONFIG_PINCTRL_K230)	+= pinctrl-k230.o
diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
new file mode 100644
index 0000000000000000000000000000000000000000..555dd2966e205e7f90a8bf8df3e46ed51d29d562
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic Pin Control Driver for Board-Level Mux Chips
+ * Copyright (C) 2026
+ */
+
+#include <linux/cleanup.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/mutex.h>
+#include <linux/mux/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/slab.h>
+
+#include "core.h"
+#include "pinmux.h"
+
+struct mux_pin_function {
+	struct mux_state *mux_state;
+};
+
+struct mux_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+
+	/* mutex protecting the lists */
+	struct mutex lock;
+	int cur_select;
+};
+
+static int
+mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+			  struct device_node *np_config,
+			  struct pinctrl_map **map, unsigned int *num_maps)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	struct mux_pin_function *function;
+	struct device *dev = mpctl->dev;
+	const char **pgnames;
+	int selector;
+	int group;
+	int ret;
+
+	*map = devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	*num_maps = 0;
+
+	function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
+	if (!function) {
+		ret = -ENOMEM;
+		goto err_func;
+	}
+
+	pgnames = devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
+	if (!pgnames) {
+		ret = -ENOMEM;
+		goto err_pgnames;
+	}
+
+	pgnames[0] = np_config->name;
+
+	guard(mutex)(&mpctl->lock);
+
+	selector = pinmux_generic_add_function(mpctl->pctl, np_config->name,
+					       pgnames, 1, function);
+	if (selector < 0) {
+		ret = selector;
+		goto err_add_func;
+	}
+
+	group = pinctrl_generic_add_group(mpctl->pctl, np_config->name, NULL, 0, mpctl);
+	if (group < 0) {
+		ret = group;
+		goto err_add_group;
+	}
+
+	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
+	if (IS_ERR(function->mux_state)) {
+		ret = PTR_ERR(function->mux_state);
+		goto err_mux_state_get;
+	}
+
+	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
+	(*map)->data.mux.group = np_config->name;
+	(*map)->data.mux.function = np_config->name;
+
+	*num_maps = 1;
+
+	return 0;
+
+err_mux_state_get:
+	pinctrl_generic_remove_group(mpctl->pctl, group);
+err_add_group:
+	pinmux_generic_remove_function(mpctl->pctl, selector);
+err_add_func:
+	devm_kfree(dev, pgnames);
+err_pgnames:
+	devm_kfree(dev, function);
+err_func:
+	devm_kfree(dev, *map);
+
+	return ret;
+}
+
+static void
+mux_pinmux_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
+		       unsigned int num_maps)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+
+	devm_kfree(mpctl->dev, map);
+}
+
+static const struct pinctrl_ops mux_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = mux_pinmux_dt_node_to_map,
+	.dt_free_map = mux_pinmux_dt_free_map,
+};
+
+static int mux_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			      unsigned int func_selector,
+			      unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+	int ret;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	if (mpctl->cur_select == func_selector)
+		return 0;
+
+	if (mpctl->cur_select >= 0 && mpctl->cur_select != func_selector)
+		return -EINVAL;
+
+	ret = mux_state_select(func->mux_state);
+	if (ret)
+		return ret;
+
+	mpctl->cur_select = func_selector;
+
+	return 0;
+}
+
+static const struct pinmux_ops mux_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = mux_pinmux_set_mux,
+};
+
+static int mux_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mux_pinctrl *mpctl;
+	struct pinctrl_desc *pctl_desc;
+	int ret;
+
+	mpctl = devm_kzalloc(dev, sizeof(*mpctl), GFP_KERNEL);
+	if (!mpctl)
+		return -ENOMEM;
+
+	mpctl->dev = dev;
+	mpctl->cur_select = -1;
+
+	platform_set_drvdata(pdev, mpctl);
+
+	pctl_desc = devm_kzalloc(dev, sizeof(*pctl_desc), GFP_KERNEL);
+	if (!pctl_desc)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &mpctl->lock);
+	if (ret)
+		return ret;
+
+	pctl_desc->name = dev_name(dev);
+	pctl_desc->owner = THIS_MODULE;
+	pctl_desc->pctlops = &mux_pinctrl_ops;
+	pctl_desc->pmxops = &mux_pinmux_ops;
+
+	ret = devm_pinctrl_register_and_init(dev, pctl_desc, mpctl,
+					     &mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
+
+	ret = pinctrl_enable(mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
+
+	return 0;
+}
+
+static const struct of_device_id mux_pinctrl_of_match[] = {
+	{ .compatible = "pinctrl-multiplexer" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mux_pinctrl_of_match);
+
+static struct platform_driver mux_pinctrl_driver = {
+	.driver = {
+		.name = "generic-pinctrl-mux",
+		.of_match_table = mux_pinctrl_of_match,
+	},
+	.probe = mux_pinctrl_probe,
+};
+module_platform_driver(mux_pinctrl_driver);
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("Generic Pin Control Driver for Board-Level Mux Chips");
+MODULE_LICENSE("GPL");
+

-- 
2.43.0


