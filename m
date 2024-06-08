Return-Path: <linux-gpio+bounces-7271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9961900EFA
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 02:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1072DB23DCE
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 00:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B6A33DD;
	Sat,  8 Jun 2024 00:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="dWuBC0lO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F881E;
	Sat,  8 Jun 2024 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717807549; cv=fail; b=nB16rj/STAQ5nvW+AATUugPbc7cCOeuO+9CiUmnuCa3j/TDhukltss5YQ5kW4h3hgf/FZewJlV9rMa+AVhHHqRKUSqdfuq4x70FBv1xSeNKw3Hxzy+CJ3PcuOfaS+q20Qt6do2MX1gDponUKc/h3EXgD+vIcLtScWhG8FdVg1uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717807549; c=relaxed/simple;
	bh=/EcHNf/bdgq88Pj3ejGzfQjZPwrGhDqRqG17De+Vaow=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r0+R+pVRrNjzvNxBvxYgihArE613HwfjNp6rX984+vrvn4kOcNtQynEH7Eo6CkvZ548vE4EizFixJ86gHut3qX7qXlYBgbVc+n1vB5ten5RanPcBRsdUNIzFza9t+KDhZ8MjsmW10d8s7mkx+Ll8EPoPSBsypfItdBs698HVoP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=dWuBC0lO; arc=fail smtp.client-ip=40.107.20.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTnGNVmKWEGUFvJtsIiVsjyAwNLiWpJf0QG4ug/C+cUxZYlVgCXYDll08ohykimNRa7yS66Mlx8jeAqVpDrGGcr0mIydiBkVogUFZWTY4l4UNPOViKfbw6dxJxiVydip2nhsHB/6syNCi892zrldcfP3y/0vCc04ud7xNAtBRHQ2gmdQ8lE8N8UPl46yb5LK7RuI/64V42ECMS+/UGbpJdt9MXruZiecLiZ7xpwg8JiabXjRW//u0oFg411XH721jMSNYj9ViUwQJWp1TmPGflDH/A5onofTu5eWdqjTuOc9Kc5ouY30mXxecLHlMF1JO30xcEXhmwuF6fuR1UmRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EcHNf/bdgq88Pj3ejGzfQjZPwrGhDqRqG17De+Vaow=;
 b=XYlkWckiBqdVglEadsA+CJvgNoK4aH+hURBccOf1e6+kx5JThEczVZRZWsQ1TdP9uqqPwDFdOJj4rm1XcNqkfUJdNZ9b5rDonWDPGsg+ZDrXHbZj18McVpc+we65BtDtm1CVcxVc2GAzC78zEiMGqVtZQfoBsgd9ddMKfIqqYaYNCbDYxG3SMzkczwuzwJ3u7Kh0TRAfHilowXmmj+wUmDYtFH5RbdtcKlBbOGqbzBfRsfPYWtf0do8yamtTuqWuShoxwiUcjUDSAPeKyjTOJvN5oNVnlClbIGm4KohM401hfmvI5msfA0J3jSckthh7KmBWest6AQp5Z2tK88tBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EcHNf/bdgq88Pj3ejGzfQjZPwrGhDqRqG17De+Vaow=;
 b=dWuBC0lOnR5wIHzMd/QsFAwRLZdy2BF1b1jHohMyytrTpUDuY8lfd1cTnHQr1TWAZACGLLPNVEE1zq+210IAG6vuCFQ6QUs/P9mvJ9YTEz+eklPb1HHrRM4KyZKE+jcuqRzTDmbZsJghxVeJLu6DuaRqQ2zN9tjU1rb0pEdnPnU=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Sat, 8 Jun
 2024 00:45:44 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7633.036; Sat, 8 Jun 2024
 00:45:44 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Topic: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Index: AQHaq0Z+AFfJc9w7tEOWjM+RsEK2hrG9Ik/g
Date: Sat, 8 Jun 2024 00:45:44 +0000
Message-ID:
 <AM6PR04MB59417429BFC33261C532DC7C88C42@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|PAXPR04MB8444:EE_
x-ms-office365-filtering-correlation-id: 71c8d8ca-6144-4466-1621-08dc8754545c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|921011|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?bFEyUjRDdytmeHMwSnRjVmZrdjQ0Z1crdVRmQ0pBQjNJNzl0Z3BkODRnSjlE?=
 =?utf-8?B?U0E2QllwN25lMm0wdTRWMStYQ2FZYWttOU9zbEM0Z1JvMGk4U05yRkNGR2U0?=
 =?utf-8?B?OTdIMkM5MVB1UUN5dm5qc0UvbzhiOUx5VDNDWjF1RFVWWmYvL2V1ckpiNDUr?=
 =?utf-8?B?SGlYTC9wLzlpMlZ4blgxZnhUcUtHRzNxVEg4WVNjaHk1SXJkV3RHUlNPRzhV?=
 =?utf-8?B?MDJVZ204M0doV0hmTW9DK3lncWFKdlFVQ3QwV1FiZGphOE5SeUR6SGNpWXJ6?=
 =?utf-8?B?b2ZMRHVjM1lTYlNoREwweURuUVlQRmZzQWhQNlVGa3dXd1laRG1tdmo3Y2pW?=
 =?utf-8?B?dmtjRCthUEVUSzZVL0pVZkFZRVpySjJ5V3FWS0V6a1VwSytYUHdkRnowM0l3?=
 =?utf-8?B?aEZsRzVkVERiVkw5ZVlkWTJrMk1xRTFxNE9obDJJR2ZEZGIvSThvbXN2b1R3?=
 =?utf-8?B?Umw5Z0RrdXBvUi9Zd2RmNXU5SWoyZzlab3NZQ2s4NENGTTVTVk02bFhaSjFz?=
 =?utf-8?B?Yk5nVi9DVnRxR3N3WndlWlU4L1N5eHo4dWliMHZ6U0tWZWpmaG1hQlFLMW8x?=
 =?utf-8?B?cU96Z0pMWlhUQll5NjIyWkkvWlg3dks1Wk5XdTQ5M1gwT1prUkhZUENRV240?=
 =?utf-8?B?L1VleVd2M2Z3M3drNnU1QzBvUzgxOXlQV3JBbzB2TUYya0RBaEVtamlrSzJF?=
 =?utf-8?B?MTRna21KV0R4cklsQ3RPOGZqZ2QvVzNReEtyVWxVQ1F1ZDlPUWxEYVBleTVF?=
 =?utf-8?B?eEg1emRhVUNRVm44WXQvWE5adm9hc1JDcFh1VnVCRWQvaVRpWXptaFI0bklE?=
 =?utf-8?B?aWNhQ0p4RDAyVHdSTjVDc2lGdGdWTkdlejRwbTkwdGxGWmFRcktiZFFjeVFN?=
 =?utf-8?B?Qm5OWHZOVFd2cHc1c1pzRkI4NTQ0enM1dkpRenJnU3BSczZmdG93YXRYQk5I?=
 =?utf-8?B?dHBYUWhzdGFLbmxXS2ZWS2dZM2puU2NyNVhIYzQ3S2RNeUlKdm9QRmVKbndK?=
 =?utf-8?B?aHljb3dmRjNuS3k3Z0FSM0R6REZVUWNIdXdMcFVPaEtGemRWK2h4eWEyN29V?=
 =?utf-8?B?U2ZYK1FUb1Z6NWNKQXA4ekFNRm5keUt1Rk5RU3QrbWtWREIxeVJiUmJjSUtQ?=
 =?utf-8?B?dGZ1L0hMTmdoMHYzZWx4L1dFbVk0QkZ4Yk1jc2lOYTZqeWI4RS9MV0tiZlNx?=
 =?utf-8?B?alYvYTg3aUFqQlBpdW4xM2VOY0tudGpFT215NkFkZE1nOXRHRUhwdmt1NGVR?=
 =?utf-8?B?WDVuTjN0bmtTK09NRmZNSk5OMHRPZlBCK0wzUjVCcTF3SjlpUCtpSnU4SU1N?=
 =?utf-8?B?M3E2Q3dpdzE0L1NlcDM2SkVmWmkyalRFcGFDYXJGVjBkV3I0MERPSE5XcUl6?=
 =?utf-8?B?UzZycHZvTGJBRHRPWGJJeHE5aUpaNUVhN2EycStwL1V1aTF0UU5aSVdRTi9I?=
 =?utf-8?B?ckt5ZmliVlN1NnhuckZNelRuOWxFUDBrU1U3K29HTlgxOVIvS2p5VC9BTklz?=
 =?utf-8?B?VzFmU2VHSkltZHlwRkpUam1NWmRvRjhDYm5jR0pLaEloSUVnZkpIckRZaHpW?=
 =?utf-8?B?dFkrcFJlazlrU09wOWRYQlpyNEoyVWxKcGlERjBaVndzL3AxNFAwVkFYeVU4?=
 =?utf-8?B?Qi9LdTNxSk9nOCtTV1M2a3VsT3ljcTJsYkVpdXZubm1CWTJRVFFmWDQ0Tjh1?=
 =?utf-8?B?TWpxMWg4eHM2bFZmMmlGYlo0dWRzL0lFN1BlSVR6eWdFd0I5bERSSTNyQmZF?=
 =?utf-8?B?cE9RNXZYaGVzSE51NmtFY0ZMdmhqQTk2TllKWVBaaXJhdGxWNTQ0TU5JYWZE?=
 =?utf-8?B?YU1STzVBUDhoS29Ea29YS1NuTkxlUFE5ZS9IZXhuckc2bEdTUkNaQ084QVB1?=
 =?utf-8?Q?TCx46fz3Awxmh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(921011)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXR2OUpIYndUaXhxWW12dlhCUFVocExGcHNWVnEzeVhSaGVWZWxiaTh6VDF5?=
 =?utf-8?B?SUM2WlMvZGEyMXZqRXNycUwzcC95TWxuOHZ5Wjc1RStGa2VXNVF1bTk2WXZi?=
 =?utf-8?B?eERWeUVEdjhFR3Fud0lFTVVwQU03YlpEeHFEbkRSeHhzWWdzWGIzaDZvaVBD?=
 =?utf-8?B?ZUxpdmtCVnZGL1luSnpWVDVmZ3FuU2g5SmlmU05GTEYwTXEwR0M3eDZrNkhV?=
 =?utf-8?B?K0tYKzg0TTJGcEowTmdJcVM4TGMvNmdCcDRSMEV0ZEpMa3FaalpnNmJDS3J4?=
 =?utf-8?B?OU9YbHYzamVuSFdnOENQVkhDanVmcjN5MXN5S01ST0xiVnYwQ1JUekF3aVRO?=
 =?utf-8?B?MUxpQmVMYTFDME04dXdWbGlrV1IwRzVxTE1RdnU2bEh4R042UHY0Qm45bzdX?=
 =?utf-8?B?T3JnT0J6YjkrOE5uRllYb0xzMkhjQlJUMmhndVZxVzQyMHFoYmZSU0VzUk9F?=
 =?utf-8?B?NXJtZWZDQWllV0RIVTdMTU9GYXVQTXhvTzFRQ0RUYUtwa24wTUxiMWNSZzU3?=
 =?utf-8?B?bkhxNFFrNDJaamd0WjJueE1wbmZYb3FLKzF6cStxWitrT1F5bGMvSXZKMG4x?=
 =?utf-8?B?UFhWeHpldjNQaU1FeFl1TW42QmIrRnl3SUFpYVdzdUFWWHNnY2RYRXRab1U3?=
 =?utf-8?B?cExlVUdtT3F2OFBKc0VRQ0Q4YkZsUWhmQ09JUEwrZHBFQzlnQzA2TkpNUG1q?=
 =?utf-8?B?VUdjK29HbEJhTDh5YnhvVUY0Mm54aGIwTFVJWWhEd1B3Szk0YUp0Nm55STJG?=
 =?utf-8?B?MUtYMk1JQ3AwYnhhejhIdmsyUU9BMlcxWHRDcXhkQ3NjVWdSTFZTUGEyWlcw?=
 =?utf-8?B?RlN0MlpPdURBWU1jcmNXbVB1ckU4c3pRaFBzVXErTGFxS25VeTY4dTNpS2lJ?=
 =?utf-8?B?NG9JRjFrWEFSa2taY1ZOUUR2Z0JrR2RPM2kreVltM1ErT2hQMjJLM0l3VHdz?=
 =?utf-8?B?T0Y1M3FxZElDRWQ0TmJnZTB2SkFKUUFBN3ovd3c4blZZWUExcjZ2U3pObzBI?=
 =?utf-8?B?M2pVVW5HVmVzeGtHdjVzZU9yb29GdDd3a3o5VEZZT05WaHUzQkFuM3Jrc3dw?=
 =?utf-8?B?SnV0VUY1RzByV0R0c21TUFI0Y0JnK0lsYmVkYXB3MEVlaUd6UzZkWEFra1Zs?=
 =?utf-8?B?bEpQUmVxRzZUZVFFQm1FTjZxZDJrNFAybVpSaEl2UEw2Rnc4SDdPOHJDcWxU?=
 =?utf-8?B?Y0FSUlZqaVQvU09weGUzTytRaTRUQUhUSERpQW5xRHR4aU5QQUpETEoyWDNU?=
 =?utf-8?B?ZmYrN1RpT2pkaUN5b3ZWeXYxc0IvQ1ZkdkJremg1WThXYU5RTXhGQmU4YTA3?=
 =?utf-8?B?UWZGRWdvWjFCemJ2dDRvK2YxNHVFQVQxYlRHNytEajhJYUEvbFJ4ZnJVai9G?=
 =?utf-8?B?c1psSWxyaXovWnpCa0g3cVg2WXB5TDE0cEhzMjd4U3F6ejF3Tk1KMW95bEdx?=
 =?utf-8?B?bm9oNnd1dDZ4amt2RzVSWHVZQU9uaXNzUjc5NytwOGVCUEN1T3U1RjhKajZs?=
 =?utf-8?B?SndSTjcybkN3NTVSaXBudmx3c0VmTjBtUlpGYWNtdzlPOS80SXBBMTBQUnFE?=
 =?utf-8?B?dzE0akx3dDZJb25UM292N1lSd205MkZlWTdCRlZFRzJsa2p5dkJ2NFVlUlRN?=
 =?utf-8?B?SytWcDUvWER2aithcnFULzVrQW4rVnBrS3hkdlhKN3Vad0xiaHEvMjF6R1Zr?=
 =?utf-8?B?OEtWdWhOaW1Oem1sME8zVmpFYVZzTzJpU01NdEVSeUxVU1MvWVNLV0laMFRV?=
 =?utf-8?B?ZFlRUndNNUZ2M1JrUkxocXlHRHJUc2pTaWNpNTFTQ3ZrS3ppbDlEMTB5SURJ?=
 =?utf-8?B?MlYzaTROckt0Y3FFcldIWkwyaUxKcUNyNWVTUUNVOEZEVW92RHJoZUtPZmJU?=
 =?utf-8?B?RDRlVjRTKzQxWnl6TW9lQTB1TERqQVhmUUJySDBpdFBLQWRiYkJTYm9tUzVV?=
 =?utf-8?B?dWsxNW10TVZHcDNSTHBqalVkekxWWDdYNUoyTVR2WUJSR25TcHRQa2Q1NUp0?=
 =?utf-8?B?T210SlhYcUloc3RRTUlrdmtwMzc5aEl6QlNDWWNXN2F0Wm1hQ2MxVUdmeVdy?=
 =?utf-8?B?cktGR0FzR3NrVmNNWlduVXJBUWRnODlGZStZYlVlNnA4cXJ6SW03MDRmRzJx?=
 =?utf-8?Q?9kOo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c8d8ca-6144-4466-1621-08dc8754545c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2024 00:45:44.1472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SUz8UoCG1zUgQnVroNjTkITUg5hILg2ld1nVhG+qlvo39m8DUaC/dEe1YtYnPRjJFrJSGHz7D3p2itxq+Is9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444

SGkgTGludXMsDQoNCj4gU3ViamVjdDogW1BBVENIIDAvM10gcGluY3RybDogc2NtaTogc3VwcG9y
dCBpLk1YOTUgT0VNIGV4dGVuc2lvbnMgd2l0aA0KPiBmc2wscGlucyBwcm9wZXJ0eQ0KPiANCg0K
SXMgdGhpcyBwYXRjaHNldCBnb29kIGZvciB5b3UgdG8gcGljayB1cD8NCg0KU0NNSSBhbmQgaS5N
WCBtYWludGFpbmVycyBoYXMgZ2F2ZSBBLWIgYW5kIFItYiBhIGZldyBkYXlzIGFnby4NCg0KVGhh
bmtzLA0KUGVuZy4NCg==

