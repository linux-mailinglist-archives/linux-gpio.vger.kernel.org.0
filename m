Return-Path: <linux-gpio+bounces-34106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG/KNFjxwmkdnQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 21:17:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471631C383
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 21:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A24D730547CE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128C7347BD7;
	Tue, 24 Mar 2026 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e1Iyf0Hn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D4347516;
	Tue, 24 Mar 2026 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383381; cv=fail; b=rRqLwtfs5TtRNW86FX0ZStTWohe51LiLZMnmwiPl48cW97Gdap2Zt8IJYm6TzVVN+wyn07fEtHRol68R19n6B8mJVd1I3h3REkZ2BzkJVLh2idKltkRqlR0jF3kI5iLtvR2YJYtrCdvBevDCc6sLIYW6h2E5YXv8CO5QUwFYTZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383381; c=relaxed/simple;
	bh=b8LAQLZeIH7YguUqGr413z3UgnQRE69d7gbY97/2sV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PEIwv2N8zIrHfg9/nMLZBcJ90JDAjJaQwrAIQRswCluOfbMOzJjsNd/Ib9bZj7B9bC+/x1T77bTfFUjv3wpIpzy2zVdW9Rj0+C4ra0bdUMPSh0wJleoqpWRawrO+eoViNo5VLgRG9//yvkhH+csIBpy+nsKwD0mRh/CVjG3+q7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e1Iyf0Hn; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAEQ3bK9n+vVNBgv8Xo2rusFchFsbU5b8lah53AmiOKvdzRttU5DwYurdyUyCoixZFDcUUL75NNFDqb+gY4w6eoaeB0wOrEgM7z5hRtbs1OAAwU5kYeyeEGdayDM7CSnmIaGaSqihiDM23drokeH1m8FAIX8zWDQg/0yRrSXZ0I2YFDG0FaK9bXPDmaP0LwdgVgMcWQKwYtUSrJuhSgg5KDizzLmBYaK1561RSZAhuoB8bj3nGMRjp8mYC3K12pDAhUKA1UQgasNWPvhBEuO1oZheekMSeKqCoyzCbINwDEAdMXBQNooP7CXZ6tlCsanG8xaSfelSy6yMrWzUcTv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6Ym9+ou8Lwc6zPePoiOfqTHMyCBcSn7z7BgbT9PNvw=;
 b=qtlSYpA1FnhX7UXEuL/N/rzTKCcdtg8eVNuLgxMmV2OHnBClnxq58mpTDT+4gdwDTrL4AY6JqIXKnBazYi0JLnQHCzZBFI3AKTwZVP0AqRlWwBQXRwhEM/fyfXIEE3QZHpwCYKEH9T+S2aHhs8xwl1HfCtfbuPywpZWg9ewmysYyk4iGtVUN2TqxmSpU9QkRIpNG+7QzKo3zZFEIwaoynWc4oG7Zz+f6uGLR4Sfzt4/k1RZ6PWYJ55IBi1QPvKjmovCVszM8Es5iFbeJMIygcCOZCK5euSDHRdOlgLkPUK08XQjCoOy6mkwbwpkn1AdM+LkUd47j8RzAow3RPnGWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6Ym9+ou8Lwc6zPePoiOfqTHMyCBcSn7z7BgbT9PNvw=;
 b=e1Iyf0HnOCHQc4stH4Zwkqax3wxDq7iY1klhyJjRgd62UnNK2RTEXwSwFvUuWwciUE+H59pNQFxNOqC90OhiHFWQohgcJK1HvqtZ9WS9pqGr0Pr+3cAxGclYcMMfIG+ARWsaz5+b3+WHUZRrpzAN0QTkGOJ7p1eoe56UJUyHndirLpJw12zI/NXsnQbQIZ1ixubwVhAD2zOTz1syypepJr+WG3s5LGWQFUPwV6YOqjnC8EfTSX3DwJ2NvzBAJFxZ696UzUmG/dTFuhZ5vQ3E/CI4SxAHsSJ4wKcntU50Afl5RoJmYS/jcCungAog/HN/VHkPCLdmQ5ppjQlk2nu9GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8327.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 20:16:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 20:16:09 +0000
Date: Tue, 24 Mar 2026 16:16:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <acLxCnz3qYfAC3iB@lizhi-Precision-Tower-5810>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
 <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
 <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SA9PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:806:28::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d13fb12-40a5-4aba-f865-08de89e22f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pqgb5WNFk4dd7xsiTimc8odBwAZPcLiJRfnmRCKvAxLf/9nGdAgQNnp2eM7jz+7lgScL6l0Xi5+QovzROaP8cphBroaEudHBke67v9fmUNHaJzVzpqKE4YqhjyL6GmhG+Sq1FRJ1b++Zfbwp7W1OBJU8lJPPJQavvYUryQfKP44PS8mHy8TRUKMx2fPEjQiG9Cqa4TIFBHtNfriNc+oPUpQzW3mqfU80/4pOYLpI5BDy75rdetEjJpdeTAP7YQUC8LdRfEV6Mj80Gu3dAJ4/8qe+iiWKjgn0A5dtgH0BBYVv3XXnkhZGtNtEnLtDbjbHB6DYKs9Sok1eU9rNianWUmgQbiwXdcDnMiZO1xJZXe/ohMAUxtTnUzyb0Qk1IPSUlxUtqwStImhzGRq8OfbKftzRQSJ4X5bS5IDK0ktWWdfDi0eWMongvrabw6wrLhfs+A9or+qpI0BTZlC/m6OLbD0VV07w8UMeFB/rt7Gqy9v7l0HMJptXmIJzRPOo+SlpgLKmzNhai9sDf7Hs8ofQYRJyheT7SyWCdqh3HIpsY9pq5yHnLL5IYQDF56awHqUJZlZNXs4Bxu59xQq3IK/eo2onKjGdNBpBEflHv7CC5I2NucobR8N1ktYnyDPP6irCFMchcpuUxo2QAYIj9N5xIGkaFziCDX97kzPJ9iXByYUiobiNofmh1El95YP4AXcKHa34BtwkLbn9tuwkwxnQfVN3z3uRJc97WNbMr4x2CxRew7xSEBjBeTsRW9pCTysESQzNfRzbsMTzwelLHgvocnMfljpa+R1Zo/Jg/lTpSBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjBrdmF4aElJNDhKemxuVjYyTHFwNklzMVFVMGgwc3owOUNkZndpR3V1enBy?=
 =?utf-8?B?Y0lKTnZuK2duSjZMeVR3QW1DQU1sQkVSR0FTYVpId2d6RUdTRE5mY3hjZWpJ?=
 =?utf-8?B?S0dsa09yT0VtOHdNM2xuay9iaTBUb3RaSS91SUtiYnpCck5wbER4TXhRa1pM?=
 =?utf-8?B?RGs0Q2t5a1dqUkttVHhvRFI1QnNqaVlJOTlxZFpCdkowTndIUnY5KzU5RzVj?=
 =?utf-8?B?L0VjWENFRUl2UEVrMS9DWFpNVHM1cDBEU25nRmMwaVVEWGptS1pxQkxDclpy?=
 =?utf-8?B?dEgveWhTU1grUkY5WmhEbUpZU0JJOUZuSXhnaFZ0Y1ZaZWFIZjBkU2ZTZWxW?=
 =?utf-8?B?V3F4WHE1M05WN0FxWEdJcE52ZWcxUWZaRzVhNklGRnNHdTNibkdUajVEcUhs?=
 =?utf-8?B?cGx1aTZuRVk0cnJvck5ESERzYUZ0djIxTG9GOTlGaGQ5VnVHNlhrbzF1NUxE?=
 =?utf-8?B?UXVNTi91V1JtSis3aWQ2a1ZIbW90M1ZSOEpEMWpqV0VEKzlEaElRVjl1OWlD?=
 =?utf-8?B?QTRwSGxsdjhOQkRnS1IvM08rOTBSWVhwUUdFeHp3ekNQejBPVEI4TGs3V3c2?=
 =?utf-8?B?dkZ5c0l0NFQ5U2c2ZXMvL3YzNmxQVXQ0VnpaWWw3VWZqcHRhZkhJd3lNY2M1?=
 =?utf-8?B?cTM1TWdlVjlnUlVBa1ZxSzM5YnRwR2R5WEc2WTI1T3BHeUVPZ2hUVjc5ZzBR?=
 =?utf-8?B?anJNUTZFV1JlWTF3MC81NU9WcUlSbmtSdldRaFJVMEtMTHY0U0Z4dHc3c2Q5?=
 =?utf-8?B?eUszZ3liaE5PeGhvcG9hbEhENXRHbVVJVi9waGh4OFUyMWp1U2pUME1DRm9G?=
 =?utf-8?B?RnkrK3Q3UmhrcVlRN3FoRXRwRE5PSTQ5aGNxaC9XbXVFc09KNkxSOEJkK1RL?=
 =?utf-8?B?QmFrckFnL3hMQ0hnRklVUFpSWlNTNUJ5UHBGU0szdXp0NEhjdG1RNVpYaVVH?=
 =?utf-8?B?aW9OdEZwVmd4L2ZuakVONWtjc3VMTEpJcUQvQ2lnZkVyb3VQU3lNUW1yaEd2?=
 =?utf-8?B?VFNvVnZJbXc3aDJvbEZ1bDdwdlNiZ0F2Skh0Vi9CNDV3TDlJWWRjVWNUTUI4?=
 =?utf-8?B?RFVvTktzSzZWTmpkNVlYL0xhNm9aSXhPVURnNEYzSzR6YlVTTWNlUGFnenVY?=
 =?utf-8?B?T0VZN0FHdE55VWJzNFMyRGpKWGZhSkZ4blQxTEMvTENQNmNlaWdSMk5JMjB4?=
 =?utf-8?B?OW0vU0F6a2ZZSm01aWVJQ0U2NzlSZWtiUW1iUDdsTUExRyt5eUh1K09nNkYv?=
 =?utf-8?B?bVk0UUlUaHpJOWhLVzFHb25RUnA2ZFFQOVdoaWFiMGlaRWxyWStRWmF5a1BM?=
 =?utf-8?B?cTRvNTlzbDZrSTBaakZMV1N4bk02d0dobHdkb1JxcjNweXAxSlExV2V4RDd4?=
 =?utf-8?B?SnFUNFYwQ3ljYlc3cGR5YzF0YTVKVEx1RXNzUlo5NGovWGU3R2pSc0I0bzJO?=
 =?utf-8?B?akR4WDFHOXJIRmNmamJaWWJ2TEF2RzhVMy9tMVRhYncvUjlKdVRKQzlOeHBR?=
 =?utf-8?B?SWNnTnRLTjRWMlhBcldSM0g5OTdpNlA2aDRHWTlFV2pERElvTStIa1VyakpU?=
 =?utf-8?B?eEpyTVhNTFVFWEN6Tk54S0MyZG9wVDJnekJMOU9WbzNkQVJJNE04bjhYMTU5?=
 =?utf-8?B?aXMxekZrNEJjaDBsMnFYcHlkZ1NQaTJPN1dPU2FnNE90allpY2lTTWoyOGVI?=
 =?utf-8?B?em8vT1YxYXUvQktVOXlKVEV2ODMvaXNUZHkvNHBjY0RuL0NyT1g4RkFueEZr?=
 =?utf-8?B?aHRKUzkxdUg4Y2FpaGJxT2o3Wm1LYytLb2JBaEZBT01sV1VPVGVjMTJNWTRU?=
 =?utf-8?B?SUNKL2I0cElacXM1K1FpWWFsK2hmSUdsSllycjZrNDVMTW1MS2ZTclkyNUhT?=
 =?utf-8?B?dFdBZG5xdldxQUxLdHdmUWIwTW9CRFc2MlE1TFVwdW9mSEZjbWFEOXJtKzhG?=
 =?utf-8?B?UzB0TWZzMnQ0MjBUSTQ1eXl1TlhXcnBhVm5LYzQzVlBpMHBvaGo0WlFzazRD?=
 =?utf-8?B?OERvWFhXaCt6bCtQRDNPaTZpaWNudzk0c3FhTm5zaHQwbkdwQklnUEVJN2RH?=
 =?utf-8?B?Sk81ek1pK1ZzRm9QN20xcXdFWlVCdlR0SVVJUzNuMDhPN1c2VDZDaWhhNW1x?=
 =?utf-8?B?bVh3MkVCU2MzcFJLSWVhOE80b1E1SVNJWm5OWllJaFVTNnZQVXUzSWRJZ3lT?=
 =?utf-8?B?UmNoR3dtQ25RcnVsdkhCUndGNy95b29NaWNNYzltQ2hRR1JXME44aUJybjAy?=
 =?utf-8?B?di9tdDFwU003aU4xc1RjbmRZNWhMYkxiMHlEcUhncE95bFhuaC96dUhPSC91?=
 =?utf-8?Q?N0VoYJPsC1ef0xKUmp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d13fb12-40a5-4aba-f865-08de89e22f95
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:16:08.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTHnmLJEqs60ndxeQO4InIT5yABbhTNWwe95x6I722TqUmN2i/ad5/SmCwflwyjPLuqewnpAhb3YicyP6Up2Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8327
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34106-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7471631C383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 09:54:45AM -0400, Frank Li wrote:
> On Fri, Mar 20, 2026 at 02:27:21PM +0100, Linus Walleij wrote:
> > On Thu, Mar 19, 2026 at 12:04 AM Frank Li <Frank.li@nxp.com> wrote:
> > > On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
> >
> > > > That said: in this case you're just adding a parameter, just add
> > > > the parameter and change all of the in-tree users to pass false
> > > > or whatever you need, these is just one (1) in-tree user anyway.
> > >
> > > pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> > > .dt_node_to_map() callback, add parameter will impact too much.
> >
> > Why do you say that. It already has many parameters, one more
> > or less doesn't matter. It's not like this call is performance-critical.
> > Just change the users.
>
> In only user drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c,
> 	.dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map;
>
> pinctrl_generic_pins_function_dt_node_to_map() need match .dt_node_to_map()'s
> declear.
>
> So it can't direct add two parameters in pinctrl_generic_pins_function_dt_node_to_map()
> Need simple wrap function, which other in pinctrl-mpfs-mssio.c or in
> pinconf.h.
>
> If add two parameter in .dt_node_to_map(), need change all functions, which
> .dt_node_to_map = xxx_to_map(). and OF core part.

Linus Walleij:
	Is my explain clear enough? I am preparing respin it?

	is okay use wrap function
	pinctrl_generic_pins_function_dt_node_to_map_ext()?

Frank
>
> Frank
>
> >
> > Yours,
> > Linus Walleij

