Return-Path: <linux-gpio+bounces-29659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D7CC5CA9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 03:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B1AD3035A6F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 02:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EAC2777E0;
	Wed, 17 Dec 2025 02:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wVGUX7TO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971C27602C;
	Wed, 17 Dec 2025 02:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939279; cv=fail; b=I78fRV2XMefRIh7n+YIlLJ7Mpn/BVjGi77GBXg0CtBUN3xm8rnOiPRMqY8Jsi2l3A7MRgjWMUynjBiZH327OTnN58fZKye9sTIAdy5wQ5RL92WN+rDtNliTpg6TKI6eV2pdylhzVKhTL57PTwTX4EaL9YzoKqrjL0EHH2TgpOow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939279; c=relaxed/simple;
	bh=CWWPebRkVjP+9f5L1ut+THeKiO/oxpCVnA8AmmeC0Lo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=goCn2Tt6iri9TfZbBeWERs8A2v6cYTXIWEsWRbjQIkxWDROUgixJGAoElCnzGISZHYcvqMs739kHL80z9ueoLqIOAWYGqShYMScqgDAP0h4Huu3yraQ6XYQhfz99qGWZXHtcdisGhyW35A5UL+OyWgfvcz8wFjboCGEm7ckTXo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wVGUX7TO; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCnztxNQm0H1S52qC6RXfNUfLWApTRjgKQFCEXe2Zgo8qYmmbKhBrzojHhgVszZqIo2gVm4gL8tKzxVBfsCARbO1Ya1TEOMgQP5y7MoMzcYguIKt/Dgl+HgI4vH5d8ikzI31QNvuUdqaracetpWkh90URF//wVLrPYvi9vBeT5+lO/9hhxAzJnmG/klDcdHC142bUJou5EbqFbvvZi5YppXgypJtS8MHrxpFyWCbriwdHNjynj8kcXquIUpf5wiTGMEPW3p0Osypqtf9xZl+2unzkFFMknLWyea0fdvaHLgXIR/lawCYM7F8JlhmjaPAIiSUflhEyJQTFH+nSI9mtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9yeQJBGWjmo4BYLuQQtbHNipT1LC4GLsADK2Jln6Qg=;
 b=xti+LomTFgK2cWBOi+Sr1U56EAOKnErpa2tM437OBHGM2YOnIRmbJCeWoUauLxmy2hTtT7t8fzmL+Or0iQSz5NhIDEuTBPz9Z3U6qH3XNyc/f5ad1HfYfMqqpFZbo9r5eI/omP5Sp+jmqLd7UeyW1eDisgKROYz0bcxLVZlSGiAwQk9ObxKvaIjdtbHu+n8DFsaDkdv6uUbCCD2tIMgY30+B1e6KX6VOJMR3t22M6kGx0IDpodhdFw/WRNyrcjFp5ZULITsVVQHyDAVqrFaZ1Vk74sLc26gDsohNF+ajH/cob92xQntT20PA2MSPP4QZkVV8UEI0mavJq4I1LM5W7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9yeQJBGWjmo4BYLuQQtbHNipT1LC4GLsADK2Jln6Qg=;
 b=wVGUX7TOLffqIhmjN1UpR/bWFT8hQnEStE01vUgJBz3I68SJzBK+V45geul9i+QAMWKtdcUqlbrE+rmzM0j8Mh3zxyTYdLeD4tgxypAadTe2hPTsmxpEtIps+g9k1HNOXk4P/AxGehQNNgufQjupZDUmv6/hGVVX4hYCm2+fPBq4zlWHKrGJdDCFfSgk3GlWwmO4n/u41qNcxs+RqgDKMli7+MSMNMTeiI3zPS/+qMIAmdJcDHksXIx+0+1KOapDYdQbDf6JkhT9m/QPkVqlEHkJODWccFVg4Vv7o8OrL9U4Ondtk3sgsSk+wodRmPcyoc+gJjoTP4nBY0uZngysig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:41:15 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 02:41:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 17 Dec 2025 10:40:45 +0800
Subject: [PATCH 1/2] pinctrl: imx: Support NXP scmi extended mux config
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-imx952-pin-v1-1-2747f09144dd@nxp.com>
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
In-Reply-To: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 8027ed62-9a57-4b72-4b22-08de3d15bfcd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3FhbzJNSFo5Rk4rVUlDZXhwQVY5a25Va0NEYjBrSUdBUkp6RUs2azVadmVZ?=
 =?utf-8?B?eXlkVXlSVCt6TmdoTmxYNE5wRmUreEdoN0FmRjk4VzRLcEVESnNpaDc4ME9q?=
 =?utf-8?B?dGpidmJUZUxvSVdsR2lBWEpVTUZ6cWs1SjlORVFHSlRwYnV3alNDdWNBOXZT?=
 =?utf-8?B?U2NvV3d5aEtuS0NrZ1pBS3JGMzVUV3U1VTdCRmtDQU5MM0llWWJnQXk1MjNR?=
 =?utf-8?B?MFpzbkF6L0VEVmhsem9qbml3NDhXZms5TmphT1pUWVF1MzA5NFNxeDdHNktt?=
 =?utf-8?B?VVJrekpESVJNT0N1T2swZklTaHRYVmVvcWMxZ0dST240dHBLZzE2WWo1QzBS?=
 =?utf-8?B?Qkh6MVlDNlBVTGdMdGNxZmJiWkdhQm54VStnbFR0M09paE81U0s3ZXVadVhu?=
 =?utf-8?B?a3djYURRNFVyNjE3SXk5cjM5Z3Vnall4ZWJ4R2pKU25ZV2VUQWttZ0JyUDJl?=
 =?utf-8?B?UzdScms4OERQOTlob28zNWRXWE1kK1J0WHR3QWFqQnlPK1pmTzUyZk9adXVB?=
 =?utf-8?B?V2ZydXlST3plTXo5NE5xQ29IL0lNTVFJVGxHQTQ4aFA4b0lmVkJjYW9Lai96?=
 =?utf-8?B?cE8xQkNYVTJnS3ZuVHRnb0gydTBRUkJqS1g3eVkvNDdNUWpyMnhlOC9xaUFp?=
 =?utf-8?B?ODg3ZTZHZldKVGR2UGhhRkNDOFNpL00vR3FKekJUZi83ZHZWSmpXQlh4WEEy?=
 =?utf-8?B?dFhSSnl4T3YvRFRpVjlmSkhoenkyYldBTkZFSnJneGdhVVp2MjF0OW9FUkF1?=
 =?utf-8?B?TXNrQU8vSXJtOEpOblg2YVVYMzZzVVhTVmdmZEFOYzQ3UE04NjFBeGEzZ1RL?=
 =?utf-8?B?YnlIK2t0MU1CTTFyY3VMSHl2MFM2RnhtVmc0ZERiRW5KSWYwc0dnQkFLUFpq?=
 =?utf-8?B?L0E2a2tVMkFMQTFLdGhPOFY4a25PYTlNOXFLd1BuUUVDdjdPbENXWm5MQ3V6?=
 =?utf-8?B?UlI0YzEwdy9LVWIyY2w1aHZuaGZydkRBU3Q3UWZWTkNHQ3NCaWU2UGhWUTlE?=
 =?utf-8?B?VDB0T2NKR2ZWRXpvNFAwcHUxZHdGSFh5UzIvQlh6am9CUHVRandBSDNBUkFv?=
 =?utf-8?B?TDZwc3loMUVhdGJRclMxRDB1MEdPL2VVcmpPR05uSDE0OXZlMkxKTVE0M3dm?=
 =?utf-8?B?S25OdmVwWTZFaGV2VC9Jekw0b1BTc3hvdjR0V1dTSHpYVHlnRHdOTDZPckVo?=
 =?utf-8?B?RGZKeTJFTVgxbGlVQ0lyS25HbzFqbzRpbjZ0dThXVnFMdW1KNXZ4czJEbUlX?=
 =?utf-8?B?dDFoNVJQd2xnSjR6MmtJaWo4V05NTzA0KzB4T2V1TTEyUG5KeDNXTHZRY0I1?=
 =?utf-8?B?Rk5IbDRteWZkdWN1bDNraWhjc0dCRnJWRktobmtreklHaktnWDBOUFlZZzBr?=
 =?utf-8?B?d2hhN21DTHNzVno5N1lWclN2Rm5Vd0FJL3R2OER5RFo3S2pjb2xzMkhISUJE?=
 =?utf-8?B?SjVOVWhLRldCc3BvSkh2cFl3QVI2cncrcUtnU0VIN0FqUWdCTWJNczVzUmRT?=
 =?utf-8?B?bGlNU0RISTlLRnN3NnBWaFp2NUd1bEx5akpDOWk2bWVCZWJYZVdGMEtDNWVI?=
 =?utf-8?B?VGpKK05tRTRWbmFtdmkyVXcxSC82WDY3bTNCUGp3WnFVK1FnU3Y2Q3ZRa0Rn?=
 =?utf-8?B?LzEyNEIzbFFyN3JtMEZTSm1iOUFYSjVFZ3U5cVJpS25nRHEwVnAvQXhzZnZv?=
 =?utf-8?B?Q0QxcmU3Q0hRTng4czgreGlCVm9YNjhkenZOOEh4WkhONCtmNThJWmdWcHRY?=
 =?utf-8?B?T3J1Z0dHK3NkbnVDeVZTRlFOTEZXNE82YTFzaUJCT3JwVmVxYnBUSEhXNVlO?=
 =?utf-8?B?a2FTa05iN0N2cStUS3FWM3ZQdmljSmtaYlhCdmxna2N4WVNrWGhSQ1FRVjZo?=
 =?utf-8?B?MDJwVjJsVk5HbVZoc1V4WGVFQTFDZmtBSlB1OGtpUk8vSlNvdlhzTnViQy9r?=
 =?utf-8?B?NzExQ0lBaEVDci8vdHo2U01tYTVMeW8rL1VCdE0zMUJZRWZ5RW1wZDc1WENX?=
 =?utf-8?B?Q3FtcmtZMlQzeXNoTUZsR1pCa3ZvWE55VURQTFZudExINEdFNlRmL1ZkS2I1?=
 =?utf-8?B?eDdOSXl4THE1aUdSWkxwYXBtVVhWQ3Z3UWlMUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVo3c2taY041Mkg4dmhUY1FMQnZ2MCsyMDM0eUFNU1NJWjBXemRHa0Y4cnQ5?=
 =?utf-8?B?U3Vlamt1Ny9ORXV0NjZMZ2hPMnBaelNnT200TTFWbHVSOFJoZkJrN0NQWmlW?=
 =?utf-8?B?WHpXOXRVRTJFZXJwc2xnOC9Ja2VoYmpNYzlSV2g2NHJUUHVUZXp4Wlc0eUNt?=
 =?utf-8?B?NC90aktIb2Z2c2IxN1puaU9rWTkrQytTNDBhK1o0UkV6N09Vc0dRMnNtRkIz?=
 =?utf-8?B?dzArdkZWSG1kaUE1WkJKbWdHSEJNOCs4RnkxSVkyaUY1NXd2YVNoS21IOUxF?=
 =?utf-8?B?UjYyK2IwYzBpMThJdjdtNUZFYTUzdkJBSTNxMWl2STJCeWFpdk02Ny9OaDI5?=
 =?utf-8?B?N0tVQmI3ZTFqbi9WbGpqcEhwUTBUdTA2ZlBieGpUdVI4dDQwdWxuUjBEdi9G?=
 =?utf-8?B?U1BueEpaa0prYWtBN2I5WlhVaStycHZnV2h2VzRCRDVMN3ZaVk1CVnZ4UnZs?=
 =?utf-8?B?T2VRRkZlekdFZkxiODJaby9pOXRWR3JYZ0tLZWVMTDE1K1l5L2pheFN1bGxB?=
 =?utf-8?B?TDlyZHI1bFJ2R1dtSGk2VjFHRkp4UmJsOHlkd3dMVzRyMWljNlpQcmVxTE1J?=
 =?utf-8?B?aUdSenBFYWxnQWlENFE5Wlhrb0NKMmR0VE80VS9aTjVhV0JpSHE2MUdGQjJC?=
 =?utf-8?B?eGR1QndOYkx6NEozOGNQTGlFbkwyTTRENnhxNk12Rjc4eVR2aGRFMmp3YVBR?=
 =?utf-8?B?VE9HTkxTWCtEWWgySjJyWjZJeW84RkJMMVYvZFFMT05GeUVwV2tmL0V0bFd4?=
 =?utf-8?B?L0pkZXFITlp2NzRhYU0yQ0NlT2FxM2dLVEdPYmRJTHArRUhJWExXdVFoYU5H?=
 =?utf-8?B?ZklBVFJvNHhrL2tEWlZSY2tablI2M09iZFFqa2JRZksyRjFMbjJPR3VDL3ZS?=
 =?utf-8?B?NmNXRFpKREJralM5QVRlTmowNmtQYWRrYzNON2hEd0RPSW4zNFhpWjBIYS8v?=
 =?utf-8?B?QmZJOGFYOHVqZlF3aTY3ekJ6c1l4eks0Wmphd1pnZW9TVHA2ajAraXVzZy9S?=
 =?utf-8?B?cG50NCsxbmQzWUdMNmdvcU8vay83R1FRMWlMTmRuUHVReUJxMWFaT3ozSWtF?=
 =?utf-8?B?cG1uT1IyRXhlS3RkOEJHUlZwQVYzVER4K1hRMTNxUWxuM0pLYVpvek9vYklL?=
 =?utf-8?B?NG5wY1o5ZXByRGNyZndNdzk4c0t2VCtXdU8raEQvQW9URXdhb0FGeEdGTktK?=
 =?utf-8?B?ei9TU0NETkRHWmFkK1RhVGNkMUxjaFlWMXRoR2l1M1YwZ21kSFBiY0FqbnpT?=
 =?utf-8?B?MndsQmxySkVJQWJqV21Kam1NM2xJTzZSd2lpaU1XWTIvek81RFhyTFpWWDJm?=
 =?utf-8?B?UjZYNHh5SllhY2ZXNEVuSVBIcVNWVXJrNVMyeGZLanAyQ1V4UVVXa3BiS0N1?=
 =?utf-8?B?RkFjbGhudUxtOWZOV3ZsanpFRUVMK0M2NDVrM0J6enFXaXVZcTgwbTBoYkg2?=
 =?utf-8?B?S2QwMzNzbjhZOW1BZ3RQbzZDS2R4dzRLQzhnUEdRN2ZwOCtHeGVIU2tuS0VD?=
 =?utf-8?B?bmQ1TlFWaFZjYWpIWkNTdnZYRjZRYnlGaFV0dUVSbXh1c0NqOC8wb3l5RWxT?=
 =?utf-8?B?QlFtRWtOQUpFaUFGMEM5RFBvRUdsL291d01tVE1FMUpscExKMytMcERnUkl6?=
 =?utf-8?B?RUZ6RFBJeDZ4SWp5VzIxbzhtNVNkYXlQNThSRUtaYkhOWjZkdGVLQW5JTWlH?=
 =?utf-8?B?SjlYSjRQTmNVQ2Q3M1VGcjc4MEgvd3RDUWlSdjVZdkFDYnEwUUtqQWFNaTNp?=
 =?utf-8?B?RmZxamtVODlGUlNxbHhZYXQwRm9kV2ZRQXFUYy8zTXhLbjRPU3FnbG13RlNn?=
 =?utf-8?B?VVlUeWZxV2sxbDhyZkczMG5rb1c0aDhWVjlIUlRMclVIZXo1S2ZpbFNpU0lq?=
 =?utf-8?B?WnR4b3lkKzNmc1c2SlpCd054clZTNXp6Nm9tNE5XcVBmWHF5d3FiYldzZmk4?=
 =?utf-8?B?czhuWmJRRVNQekhSRW1zeXoxeTlEaEpDYkwwa3Ard1B2dHIzWUtQc1I0Q0p1?=
 =?utf-8?B?TzV5M0Rjb2NhZXlzL1ZLMDM4a0Rqci80Q0FoSjZlUFNBYjY0anI5ZEcxMFFm?=
 =?utf-8?B?NG5wanFpYWNQTzBqbmpVa09KTnVNU2FkaU5uemZTSnI2SCtGUnZqYmJOSHhS?=
 =?utf-8?Q?Ozz9QskbTxX9swnZALX0uytJq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8027ed62-9a57-4b72-4b22-08de3d15bfcd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:41:15.6471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0NmixOVL3NXIDo9G/sa2bBRmRnPnPfX6A1X7aAHs19qh8C9vQjVfjv65doUnus2uePNr67ABQbLvF3c38d5UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446

From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>

i.MX94 has special muxing options for certain pins. Their mux settings
are not in IOMUXC module. i.MX System Manager Firmware includes new vendor
defined pinctrl type to SCMI pinctrl driver to handle these pins. The MUX
value field in the IOMUX table is extended to 16 bits where the lower 8
bits represent the current IOMUX value and the upper 8 bits represent the
new extended mux added in i.MX94.

Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 4e8ab919b334a11e3e716c4580e18bb0e65a6c02..04728ad807d38367a19e6e774d4ccc985549ecfe 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -38,11 +38,12 @@ struct scmi_pinctrl_imx {
 };
 
 /* SCMI pin control types, aligned with SCMI firmware */
-#define IMX_SCMI_NUM_CFG	4
+#define IMX_SCMI_NUM_CFG	5
 #define IMX_SCMI_PIN_MUX	192
 #define IMX_SCMI_PIN_CONFIG	193
 #define IMX_SCMI_PIN_DAISY_ID	194
 #define IMX_SCMI_PIN_DAISY_CFG	195
+#define IMX_SCMI_PIN_EXT	196
 
 #define IMX_SCMI_NO_PAD_CTL		BIT(31)
 #define IMX_SCMI_PAD_SION		BIT(30)
@@ -118,7 +119,14 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 		pin_id = mux_reg / 4;
 
-		cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_MUX, mux_val);
+		cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_MUX, (mux_val & 0xFF));
+
+		if (mux_val & 0xFF00) {
+			int ext_val = (mux_val & 0xFF00) >> 8;
+
+			cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_EXT, ext_val);
+		} else
+			ncfg--;
 
 		if (!conf_reg || (conf_val & IMX_SCMI_NO_PAD_CTL))
 			ncfg--;

-- 
2.37.1


