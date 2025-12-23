Return-Path: <linux-gpio+bounces-29844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D462ECDA685
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 026E6301D3C7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 19:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8694234D388;
	Tue, 23 Dec 2025 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bB7BrKBL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B234CFC0;
	Tue, 23 Dec 2025 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519258; cv=fail; b=Kn0L4ekPMZ0ih1hbV065bzn4zO+L+5IYMRBfZ6m0XA7rurpmamA0JTtV8p2IimtJHPnKpS5DLn6HJw6WGrtNsxlC1w7OqE+mV0UMd0OfjofNBFRsRZV0N9gIiAH7WeDfB2dGDLL5fTw7f8892qe/qOs1KfrPvCseAdySXcIS6bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519258; c=relaxed/simple;
	bh=+A+FHIFRZIZc90VbyrQv5zI122yDa8Z063KFCDqT9tw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ic9SchtqJHH/Pc+JYlERNrqkm6kORQer9i+tCTjavJoKqn2p1pauVuhwzxLgw2l9Jn7F0gA37v9xoZ9rhDVa+dvN8O67dbF77VI9KuCgKT4/s97ElCMeFJnYzOHR6D9Gt/om/4E3RJ4V+bKWjSX569OtO7QqW4by1c+288GNXRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bB7BrKBL; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rprXhOQ/G2aGY7x3dHsUSKEc9RnbyXKCYvBheAvsIDgrq9nDGWDsJVVFoGNm2J7jkKrNyGeTU1mszFpInE2hEMVwiGH9qimsEhiFdlskyyWwlP4OJZEhf18q5MiOpP4VACLZwOIdHcGgN0Hr1Kcmdm9j42VsaW8KmIBKBFEXLaFBcyiFRwLq3QYWFO2JCHA6ssnd9j2dGe9Vs4dWFY3+CJIFwNcq2mv4cLKVLk6uhWziPuqVqIxfk299s0X7W4euQGWYt5hqpEnnia2KeYy/qPJ9w8bRNm7/9tnWdQVBK7P0B9dN0M46xBE37v+nkECXXLGOkI9pEuTFHnhc37lCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtX68TGEJkFNRfGmmOMFayRFVNQkYoqFzxzC2fqF3AA=;
 b=h8Zbbyt0leDLMnhaIrM8MUUl4izwIu10ScdyrvhdrzkD+tIPL8v8F0PPmQzw45470KnZHexj6X3Pnsw5nLXCAnd56MqfZOM2J+OszaosQD6h2pBvpUrq1mE3tkf2qEGGD99dYpt1C903UGEj3hGC2XtkxkOlV2LOdQ3m290JsFLqsoS5Ctwod9SNUygLVug01B+yTN/CxkThyIWX2YY7Tg0FE15ZvUOyb+MgkK/ZcTFDShRmDZuH+Pr81cUO3wfq/U7B4OeF755c1/b7LsFH0oPrZdxXRLQt+ZdfbP+hkeDjGocsLCArswTqPYx5K060/Un0sCvO+EiLFdp1TNtdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtX68TGEJkFNRfGmmOMFayRFVNQkYoqFzxzC2fqF3AA=;
 b=bB7BrKBL7PxqjVRVGRrlalKA1pxaTvot/EbnYOSiZmFLWSNgv483OxLVEZgT6k2JXzYdFD6cBXICYkJxhdcZfgMg1YCCMYLLsHZSjt+VXYmK2IiJKa9+ZAtIv/mGWWMg97vNYLf1OgUzMPKPprr8gij/oTjPFjamKEn2YuqYO+coIzk2yFH0e0SilU2LKeVh449f38P7CLNVkFzbkdDqrDCKm80EGxMKtiXD/w9C6Yk33+n50DQjbeFrU4WWY6+HbhgKBixoZfezPfkXZ2yEWM4PBBcBjyfMhtLjTsarERJoi7rfdqSDOjZkjjuWIL3FLMXxcp1aM1fpQ2BqM3Up+g==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB11854.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 19:47:32 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 19:47:31 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Topic: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Index: AQHcdET6fGhxnfabg0KDsjwVOs2row==
Date: Tue, 23 Dec 2025 19:47:31 +0000
Message-ID:
 <PAXPR04MB9185AF0B5225CB8DD06F774289B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-3-shenwei.wang@nxp.com>
 <3bbemd2vbsfss3sqpjpokytvvzweoqrtiqygffj5vqazqk3jyq@eobv6ruriiwb>
In-Reply-To: <3bbemd2vbsfss3sqpjpokytvvzweoqrtiqygffj5vqazqk3jyq@eobv6ruriiwb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM0PR04MB11854:EE_
x-ms-office365-filtering-correlation-id: b4984bb8-0a94-49fe-ce58-08de425c1cb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IkNSSzYtSdLfnSkNzl+I/efFsLqFydjjkK69gj2NNYuBL1OlAPfLUIkNOGmT?=
 =?us-ascii?Q?x4I+Omm7Ak5Z5OWQABq1u0Sua1+BkFqKOU98xYlEtpNLTuWmFoC7X5ZHSgZM?=
 =?us-ascii?Q?QxVASvwhh9afz2QhOZEMXHR95WzR4UoGggyhWEwjxWCuaMpTDi7nhGKf0rXU?=
 =?us-ascii?Q?1oXtUd+nfpsiBUdd4zlnlkbLSTiJN4dylepz91gSSkA2N0K13uCj343IUfQA?=
 =?us-ascii?Q?9sMwT/jO2Dg3W8d5xs6iaLzh621AlkSbvNnmWJ0ZOvnfsgHwmiENgAluYTzj?=
 =?us-ascii?Q?Owpw6FoQBZr9fYWNicy5m1VqBR4MHAlYITPz9HPzyMP/hqLzd+AK8P26SO9b?=
 =?us-ascii?Q?b8KrZQaBEsda55E3xtC0AY3xtyhIGpiclsKLiIktptNknKUeDufiMJijE5dg?=
 =?us-ascii?Q?JAXwi8gCWB9aoNgocyE2ZeThxA5teMphquCs14mc6jE59H9wkpmRhVW6fOdD?=
 =?us-ascii?Q?mWVcAYxNpL/PyB4a0fkk4xSqeNfhJqPswKqEzCvG9ul743tAOJppEwar3nxa?=
 =?us-ascii?Q?rIi08u77+4r0s/4DxC1NCWzVALZCgQLZxB8lZNnihboITTKppZjhRXH0jVFN?=
 =?us-ascii?Q?VYL11ShyklaStyvhwJU18/Pxg8Jj46/9JHfEk742cXkSsWMVX/R01x53pnU9?=
 =?us-ascii?Q?B0giin5qJb+xdBQCwcWyo9/v6HZIsbh1qLMK/8W+uFKo3dmeo23hU5n+NYRF?=
 =?us-ascii?Q?10apy/E1x+f2L8+sQdcUqtwtRld7ugImvbPCn5usA9seOaRzz+AN0Bd7mME0?=
 =?us-ascii?Q?UmEFEnzsd8HZxB3CNf3137vPdAVupYI+5zE72N11RqKSMZbp+q58Wf1XnUjN?=
 =?us-ascii?Q?8ETzEohJ38dPL38KCYXiy3VtHbkTtX5+REqcYEag/QH8VssKVuDtqD/RVUoa?=
 =?us-ascii?Q?S4LhcM1eayNebVIyz3yq4TJsExzE83z6gZRu0puX3aMxdFIeajkEeR4XCpb9?=
 =?us-ascii?Q?g1r+tOXYiD9ji3iSq/CQD04bc091B2vo4986qGjRoRsELCSSQd6vvb7bz9Pt?=
 =?us-ascii?Q?eXuxkDMm+3Uld5mIWNgqnGDxR4gehc4gk4ksS1m+3qbZahzDHQiICFZIZvoR?=
 =?us-ascii?Q?QO2FcBIdSBBaozCXE1JtdwErhgccCU0QFl081eI2aXx5dm/vcu4gbBpTB6HX?=
 =?us-ascii?Q?mLkTME/SbpAU974xUY1QMOKoqMhMbEsWw9Tq6p8+FUNfsobEOFqjJ7Elh05Z?=
 =?us-ascii?Q?Mes+TdJ20GhVGRNrr9iqNdu+MyJUgCNlJPTcAC4qS6+YNTcv7XLBtFV7s6t5?=
 =?us-ascii?Q?zau+MHL5AEdVa4aNykhmkjOAHprECCw1rBXf/ALo0wXTSLvD0gRiWhG2Pbuk?=
 =?us-ascii?Q?DQiLhvrE071CxPuYdZTsFfw5HVxK50on3yLlwM+sOy1BQ0V+ki3j/vIWLX32?=
 =?us-ascii?Q?fKxzWlCBq2EfSWoqkwDK+3Nww28qkiz8FU865c2SC/yvQ7nIe/XsuM01xQUN?=
 =?us-ascii?Q?ij0pzMYiNPIU+rbgAzT4rPqLWbKEHE9TyInuo7AtdYLq/4eu3X9p+QhFIK8Q?=
 =?us-ascii?Q?0Awu5hrp8p3aaZGveqJ32p6JpvAIp5bNQ8QS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GFZS6hgUkQ3wXZX4BF3SFoS8s6Nv6K0X183xADQeQoqstBuLpNgdWzJBMtxU?=
 =?us-ascii?Q?SlF/+G57BvUQ3WIB1TZAhPFQIjF01FDK3L/2z4YsQLBdNxQzMxBeDae7oPSf?=
 =?us-ascii?Q?KYcG7Q/3q/b8eTKOvkl4jDEQIAF6lhfvcMrsgjbDWRq9IFnVWSci8LKz6dnO?=
 =?us-ascii?Q?8JVqr1Hr098yg9dRDxJK/g8s+PLCB8Y385fZr9azEjAYfK7y+a/Og9LNCJ6h?=
 =?us-ascii?Q?nvx+kmC/vfXZhEP0jTdbtclU1wigQesZNr78cnf9x1QdGLHS3BvoWN1YY4Sp?=
 =?us-ascii?Q?y5Qof0AWD/4lCKSSkI9xAvMdhNwB1r8vugiudup7NCU0EZ/aTfATA5l6hpzJ?=
 =?us-ascii?Q?oJB8Juz+slI8VJOW/KpQ8AMt+m692IP3j90lUELlVXhYhTjqlq1V7MtJ79Ux?=
 =?us-ascii?Q?X+2ugDgZDOAeFM/LQXLUH28NkqCjOvaC5XfdVJ4LbtCowkvt0AiRlAaE8REh?=
 =?us-ascii?Q?B+avcohqsn6LchwEB9cq+G9FMAfKnLp5dq85V+nezl+xzGIL3hmH1ZNfAWsW?=
 =?us-ascii?Q?24wNTdF68XtdgP3nJoLjAf8MQjZjLG2c4mlF7CMxoWCs0xbzcBmXytIF/wSI?=
 =?us-ascii?Q?1xS5Rj6QEn9zlkQUcOOcuUqKgWkh8mB5YzfEYqMR2Zg5JSzFsl7lu/XC7ar/?=
 =?us-ascii?Q?itt9Mzzrde/sweCVuCO9CqUHi1Y8wecPpI0XczKQOZK7Fs0gNLS1Dh+TJOjH?=
 =?us-ascii?Q?DwEF6g92PWh8ZeWVQb6QU+3dFZv19fpOI0TEGFrLYj0OlK+SeGcOQcWITZn2?=
 =?us-ascii?Q?oZ0UfAV5U7xoqdRellzwvrY8kEKHFZI9sVqP3CZMxWF5HbxDSoeBwiDTPG2A?=
 =?us-ascii?Q?ErIdSvFjRtiHJkqGpl5GTAaHuSj6NF2tu6Fgw+dPs8jul4gFc8qDHibP9ZHM?=
 =?us-ascii?Q?ADK6WK3FG8sJP5mqMv8awkvMazUZpvuy+csKdldnJVJeO0bW+ZU2LCaPnZ6g?=
 =?us-ascii?Q?269GblQxFeSZumlpQqET0y0R2YzFC+D/3hp91Lh/JH0NqPIwFQa9K/WbFtT/?=
 =?us-ascii?Q?4JBmCtcZ9BvTvebhkuEjjwkbta0QN9PFdN68ijSgfFTOz86AbL/iAtAjjwMD?=
 =?us-ascii?Q?OdYRvwN+IeoaoBGnHV6FCwlIJ2eJLXvP23DXMesHu8GnVK+mRZszfUfggEwi?=
 =?us-ascii?Q?KKjQ9F0K4mI+Ay2w3bTkroY+iP//RSc+H4uWu85DKHtCAEOcJgNAoaV8GwdM?=
 =?us-ascii?Q?9qBUIzyfNxck0RIybzaqDEkj/zTdqFvCYDgSZoUZLMhFGJtXFI/iEgI6sFIF?=
 =?us-ascii?Q?tWO5WAZ3zl09tPZnhs2qSq4SaUYg73ZkW1WpYnZK89eapQHMDmLiWjJDLEIU?=
 =?us-ascii?Q?T51R/9CKrdI1FZMFbPEBKcqBJQD+uZiFLxZBTMvtStqpg8zQL67wRkg5a8IZ?=
 =?us-ascii?Q?7e6O/A9LR27kTKF9u9L4GULJKdu16JoA/YYiPqufYVK2q/QG/nq8eEFzZpTN?=
 =?us-ascii?Q?bXNJi2WZlTdrNehYojWK3N7+tnm35vbZgVbhGqjhbC+zh7h620rcUsS/vap7?=
 =?us-ascii?Q?UOObolzgnFTIEejBeq7hQMBezWgl/tTTmIjXNHA3psBtvoJiPF5Hs2cWOgOI?=
 =?us-ascii?Q?YUp6lc76DwPJBTy4NUW+O3yg7HOhJAUwfkFEE/chbEdgw1MUmLN8G8P0jlZV?=
 =?us-ascii?Q?EEq5KUtJv+AMZO3G+Sebwxp2iCjwQEdjtF8zNIKFLCe8wWE1wA6sHfZESm/y?=
 =?us-ascii?Q?BsyoW2AhomC2oRB9pUcYojJa7Hug/Mt5hj3k4ySdb/0LNFP2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4984bb8-0a94-49fe-ce58-08de425c1cb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 19:47:31.8407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iTagWxWczxWf6gSmFCPL99K6mqwT4FMcNlqfTpZVOg6FRoQLuxXz9C6DG2H2vNB2DgfgVCxjRx+4it/F+pbUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11854



> -----Original Message-----
> From: Bjorn Andersson <andersson@kernel.org>
> Sent: Thursday, December 18, 2025 8:24 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org; imx@lists.linux=
.dev;
> linux-arm-kernel@lists.infradead.org; linux-doc@vger.kernel.org; dl-linux=
-imx
> <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices
> under "rpmsg" subnode
>=20
> Caution: This is an external email. Please take care when clicking links =
or opening
> attachments. When in doubt, report the message using the 'Report this ema=
il'
> button
>=20
>=20
> On Fri, Dec 12, 2025 at 01:43:38PM -0600, Shenwei Wang wrote:
> > Register the RPMsg channel driver and populate remote devices defined
> > under the "rpmsg" subnode upon receiving their notification messages.
>=20
> Please provide a proper description of what "problem" this patch solves.
>=20
> >
> > The following illustrates the expected DTS layout structure:
> >
> >       cm33: remoteproc-cm33 {
> >               compatible =3D "fsl,imx8ulp-cm33";
> >
> >               rpmsg {
> >                       rpmsg-io-channel {
> >                               gpio@0 {
> >                                       compatible =3D "fsl,imx-rpmsg-gpi=
o";
> >                                       reg =3D <0>;
>=20
> Surely there needs to be some "gpio-controller" and "#gpio-cells" here?
> Would be useful if the example is somewhat complete, to give a picture of=
 what's
> actually going on.
>=20

Okay. Will add those in next version.

> >                               };
> >
> >                               gpio@1 {
> >                                       compatible =3D "fsl,imx-rpmsg-gpi=
o";
> >                                       reg =3D <1>;
> >                               };
> >
> >                               ...
> >                       };
> >
> >                       ...
> >               };
> >       };
> >
> > +     drvdata->rpdev =3D rpdev;
> > +     auxdata[0].compatible =3D devm_kstrdup(dev, imx_rpdrv->compat,
> GFP_KERNEL);
> > +     auxdata[0].platform_data =3D drvdata;
> > +     dev_set_drvdata(dev, drvdata);
> > +
> > +     of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
>=20
> auxiliary_bus would be a better choice, but I don't understand why you pr=
obe a
> rpmsg_device for each "gpio channel" and then from that create a
> platform_device.
>=20
> Why don't you just make the rpmsg_device register the gpio controller dir=
ectly?
>=20

The "GPIO channel" is just one example-there are also "PWM channel", "I2C c=
hannel", and other channels.=20
The goal is to manage all these channels under a common logic, which helps =
avoid redundant code and keeps=20
the implementation consistent.

> > +
> > +     return 0;
> > +}
> > +
> > +     rp_driver->rpdrv.drv.name =3D name;
> > +     rp_driver->rpdrv.id_table =3D rpdev_id;
> > +     rp_driver->rpdrv.probe =3D imx_rpmsg_endpoint_probe;
> > +     rp_driver->rpdrv.remove =3D imx_rpmsg_endpoint_remove;
> > +     rp_driver->rpdrv.callback =3D imx_rpmsg_endpoint_cb;
> > +     rp_driver->driver_data =3D driver_data;
> > +     rp_driver->compat =3D compat;
> > +
> > +     register_rpmsg_driver(&rp_driver->rpdrv);
>=20
> This would then also imply that it's the gpio driver that registers the
> rpmsg_driver.
>=20
> > +
> > +     return 0;
> > +}
> > +
> > +static int rproc_of_rpmsg_node_init(struct platform_device *pdev) {
> > +     struct device *dev =3D &pdev->dev;
> > +     const char *compat;
> > +     int ret;
> > +
> > +     struct device_node *np __free(device_node) =3D of_get_child_by_na=
me(dev-
> >of_node, "rpmsg");
> > +     if (!np)
> > +             return 0;
> > +
> > +     for_each_child_of_node_scoped(np, child) {
> > +             compat =3D imx_of_rpmsg_is_in_map(child->name);
> > +             if (!compat)
> > +                     ret =3D of_platform_default_populate(child, NULL,
> > + dev);
>=20
> So if you don't recognize the child device node name you just register
> platform_devices for each of the children?
>=20

Yes. That would register platform_devices without the platform_data.

> > +             else
> > +                     ret =3D imx_of_rpmsg_register_rpdriver(child, dev=
,
> > + child->name, compat);
> > +
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int imx_rproc_probe(struct platform_device *pdev)  {
> >       struct device *dev =3D &pdev->dev; @@ -1114,6 +1253,10 @@ static
> > int imx_rproc_probe(struct platform_device *pdev)
> >               goto err_put_pm;
> >       }
> >
> > +     ret =3D rproc_of_rpmsg_node_init(pdev);
> > +     if (ret < 0)
> > +             dev_info(dev, "populating 'rpmsg' node failed\n");
> > +
> >       return 0;
> >
> >  err_put_pm:
> > diff --git a/include/linux/rpmsg/rpdev_info.h
> > b/include/linux/rpmsg/rpdev_info.h
> > new file mode 100644
> > index 000000000000..13e020cd028b
> > --- /dev/null
> > +++ b/include/linux/rpmsg/rpdev_info.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright 2025 NXP */
> > +
> > +/*
> > + * @file linux/rpdev_info.h
> > + *
> > + * @brief Global header file for RPDEV Info
> > + *
> > + * @ingroup RPMSG
> > + */
> > +#ifndef __LINUX_RPDEV_INFO_H__
> > +#define __LINUX_RPDEV_INFO_H__
> > +
> > +#define MAX_DEV_PER_CHANNEL    10
> > +
> > +/**
> > + * rpdev_platform_info - store the platform information of rpdev
> > + * @rproc_name: the name of the remote proc.
> > + * @rpdev: rpmsg channel device
> > + * @device_node: pointer to the device node of the rpdev.
> > + * @rx_callback: rx callback handler of the rpdev.
> > + * @channel_devices: an array of the devices related to the rpdev.
> > + */
> > +struct rpdev_platform_info {
>=20
> I don't understand what this structure represents. Why is this glue betwe=
en the
> rpmsg_device and a made up platform_device needed?
>=20

The purpose is to have a shared array that can be accessed by all devices w=
ithin=20
the same channel.

> > +     const char *rproc_name;
>=20
> You don't need this, because you can rproc_get_by_child(&self) and then g=
et the
> remoteproc name from that.
>=20

Good to know. Will try it in the next version.

> > +     struct rpmsg_device *rpdev;
> > +     struct device_node *channel_node;
> > +     int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> > +                        int len, void *priv, u32 src);
> > +     void *channel_devices[MAX_DEV_PER_CHANNEL];
>=20
> Why 10? What does it mean?
>=20

This is based on practical experience. For example, on the i.MX platform, w=
e typically don't have=20
more than eight same devices on the remote system.

> I think this becomes the list of the 10 grandchildren of the remoteproc (=
per child
> node). So what happens if those matches against two different drivers, wh=
at will
> rx_callback point to?
>=20

This is the limitation. That's why I used the map to populate the known chi=
ld device for one specific channel.

Thanks,
Shenwei

> > +};
>=20
> Regards,
> Bjorn
>=20
> > +
> > +#endif /* __LINUX_RPDEV_INFO_H__ */
> > --
> > 2.43.0
> >

