Return-Path: <linux-gpio+bounces-33777-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOlEBHovu2lmgQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33777-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 00:04:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2262C3B79
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 00:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF860303C28C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 23:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFF52F60A7;
	Wed, 18 Mar 2026 23:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dM2LXGG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AF314AD20;
	Wed, 18 Mar 2026 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773875062; cv=fail; b=e891h8zHTa0uP2ggmj643J59809bQycoJjhH9sfaV552anOjHCMi39wI5ibqJRc+0spYibufar+PVMWnWt88fBVHV5Xn98Hc0thYfNA7FPgxQGqPaNkEWvbOjCQxpSXyxomqdVhdU9xLkxvF3jVbE4Li9u4ZYDOMYZvATrRcq/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773875062; c=relaxed/simple;
	bh=DfOefK5wKm7ZM9Etcltk1NT0HaI+0zwm+NTuJQdhIKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pS8MwolR62HRWocq8Q0Kj7bvg0+q016XIk9CCUbnCrbRymMgN5fwrKrLuDZ8QgZVaE+VmWR8rD48gWJhC+S5BQoEd5luZhJCchRTJLyDbzd6OcGZZJYbopQTK4kHtjCRBjyUXVO4WApqNJCaLhwXtFXDyUs7vzjNR2ygpsTKQzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dM2LXGG0; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgUhLKwdap+gIjyQg//doplfAanPw71n/c5spBMW93nyZtrk7olzpRBDXjbQIfW6cJFvQWtMXYBCCpDhpxohvF+INSpvsvdCsfKNnhiNnEZ68y5HU5wgHOe25OXlFJtKnw57pwJz2FFvTjYVBYv3Awzri81ys5GJLpexvEzzQ7raB/++9z8nEqt6qERjPm862mtMNyMsefPu0SMsjlMr3Djw4GOTCw5v3JbUKJGdD0N7mtnc94k0O3OFgzfGKitUjrtNJpGdHySwwlbm3SvHSx+cn57vfO2mRf8j3EzrnHT7PDCl27jSDyfJvwCWRy6+blTHeOcdwGK/vzh9R9YhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfOefK5wKm7ZM9Etcltk1NT0HaI+0zwm+NTuJQdhIKM=;
 b=boMLH8rdEspf14vnYFjY5TKB9dRRzftDYuQbT7DDqLr59VYDV+AmaCB/nuk/YP2+Ws/iTwZA+W3g6UC0UujLwN5QYP/g7R0BgGnPtBTTNd1sYHYZGX0wRyOgeTsos2pC83Wsra0R0EGqREXULNYa46mlrcMhofV6EWfsIMLnD0RXzgzfHVBCbZM1A6CofO7QU5MTJ3n35ecXukh8hJocqu+Vm2zjPY7vlZi11TqPyjmdJ0bTZt0IxVjRrbhhqbgA7tYDox99LNGDm3igx2fsqRvscaYVu9Zm8G5rY3qP4+mjkz2dKrOsR8kgkK3L4KU7HwwSb0wGVJFpTSOLk+QhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfOefK5wKm7ZM9Etcltk1NT0HaI+0zwm+NTuJQdhIKM=;
 b=dM2LXGG0TSUESy2f17RbsDXHax5OFNxpkQFEPr7uSgG4R5nuPRhRUV2RGMGdxZnAJAcSqgUQY1O2KyM+43e9BAsn54udvQLx4QKZ+V8hb9slcgh8st/an4SpBHHGf4uc67u4fSyMIGAzsYiSJXJInHX8RcvPWoOwelB+t4kjNl9CiDgS0qAUH0+qBQkWZZhbwAOQZfqqSbD+eL/jfML8w9U2QzUjjA/L85eWaTVU9oen+0LUmGOryp6O7vLWVTj55cCW8sZkD0+Tqej9QCPlIuQQvEudUL+rruV+OYycXRtUfUyjhwX26YNBjf1nkFk0evYugt2CdMtMfIOE7yrQZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7354.eurprd04.prod.outlook.com (2603:10a6:102:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 23:04:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 23:04:16 +0000
Date: Wed, 18 Mar 2026 19:04:07 -0400
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
Message-ID: <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 04fd94b5-d176-4ff3-36e1-08de8542ad9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hOmva4qPDeOQ6gaY7Tb84sj/AVO9lRXUMHCvdivZ3Lohjh2+JtOsZz2JRC6fQVf6IzcpNcyR5DSOsIHgddR/jldKEeSYnN88+iqBvEjMKKuY8oY5fYAoFuH5jzU6KClRQHuMzT/a6wyP/9HVi6HczrocxPYXZn26ARkCuaKFyb4k9XVw3sicotrZYBRnq1n/oWMZ1LPy2ns0IvE6dm7YnagjbuL9203SZkW/mRJF2bQB8djRGFlAbSeu69Q2wkW+/nNKsZub+HiD58C9otnXBAF+edu3FxnvoPkia1jsoeSfeSVGWRlyFfDojmXI0+7TQr80W5Q17/okgbONyaFDZoOq3sRPdKel3ttRRuTVhn8TeTo2aJdC+wE805s+xBZXKgjLlyLuMJcVjhFcSO/lSV+TrhdM54DYAoAJxKO2UEqjvxSHbaWvSPm9UCTrnctlT42kJDiWB+FkAD3SSUTpV6l8VJ5gA1BXZ/o6ymywKwIVdUULuDcbHYtWyFLZ0h9DrnSir2IDi+IImU+RIOxrcuuWeZ9FX2aj9WuZLPu3CV5lQSDaDOqq2lOox9FD9HPDyGJi7AbTi0G20VnW2bu+CtRn71sxdFBxFkyxTi7c02aEJeOU9ykYJOh03+sw/1/Hwl9P8NIBCHWrSnBRMap2LiNYZKxcoQw9RJcYq37A3e3JF7qwg4qqdOwR/AI757XzNCuFtJ6TxXCErvme1I2bgqUI7+eevypTfVfD+PG1QgAUh5/sUhqTcqqeBLJBGe5nEmnqxzdUO6+BSnto9hOxMCgUlPLl2pwi56rLDqpMP5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJhU2dEcGVCaWpRZkRnb1JCTmszOUVZTHhhT3dzbmxNS3BvNEU3OXVpdDNR?=
 =?utf-8?B?LzhqZ0R2UTd2cnl1ZFdyejhZNkFqaGZHN1psNFloOGlmaWZOcWc1TFo5bEk3?=
 =?utf-8?B?SXdCNnlYT3FVMlNUT01ETitRWjJPdGdxSVpKOERsSXBZVUVyaXhFa01oVjdP?=
 =?utf-8?B?YUVFL0dPeld0S2hpaVB4M1VCU3NRbnNjUlBKZDVtclVRbUZucVllUEpuMXRZ?=
 =?utf-8?B?WS9WR1RPOUpVR3VGd0t0RDdvczVRSUE4M2xTT2tmU0JIWnlaSnJjL0tJZmJp?=
 =?utf-8?B?bFoyM2UxaHVOb2ljeG1JbTl0ZkFGSmtETFl3a0tsbXdrNjljZFlscktyL2xo?=
 =?utf-8?B?MnhvWk9ad3FhZ0hDbHUzTWQ1Rm41blNLQmJnMjUxaThmcGk0SnFac05XdVhV?=
 =?utf-8?B?OEZEd2dBVmRtQklBUVpNYWdnNW5wZzljdGMrZzgwRFhnZUlMV3lHVnVyRTJZ?=
 =?utf-8?B?T3VPaUxLSWw1cmNsRUJpa1lXSnh1THFIWGtxdzlRcStibEZZUm1acEJFNjQ3?=
 =?utf-8?B?MUc3VlM5T3dBTVVQaW5MMnNGRFQzNVZ6N3drNmNweFJnRDJOOGNFaktqU0R2?=
 =?utf-8?B?dWcxQ01XcDR0cDc4eDhxbFFCdlcvSzB6MUhYa2ZINS8yVDRSTFVaU1k4WEsr?=
 =?utf-8?B?Z3kwUitCeFQ1Q0tHMVptOUR6dlArVmp5bG00c1k4eHExNHdKRmszNGd0VC9l?=
 =?utf-8?B?VWxvMGQ2MCtnWEVwWU50TU1xek1HZ3lualBwVDRVa2owa0lOMTA5L2F0SExP?=
 =?utf-8?B?RWM5akJOZ0xJTU5QVTJMc2NJSFhCU05uZXJwOUpSZVVSaEI5a2Z3c012WHF5?=
 =?utf-8?B?WEFEOGlDdzNoL3c3V0MvZ0MwMjZVRGJ5SHhsVE1zR0piSERFclZyR0RIUzBy?=
 =?utf-8?B?clpxQ1lwZllsZ1Q2dS9LeFdJV2ZHZXgzcWVGN0pweCt4TnZBdkMxTWhOdTJC?=
 =?utf-8?B?d2VBalFBYU11NVh1RFVpZ3o4QzJQUUEvZklQQkNETE13eFhXL1k2ZnNFU2NB?=
 =?utf-8?B?OXhlbGhVWVJPY3YwZ1JMUjNtd2hXUFJsc2s2QTh6QWkzakV5cHJQTHM0REFx?=
 =?utf-8?B?azVUa29WM1BnZyt0VVduNWt0b2IrMmtUQWZBaCsyd01LeThzcVFSSElaRlhS?=
 =?utf-8?B?Z0xDcWx2VXZjNTVueGhOekVveGRIVDZ2QUd4WU82N3JoekU0dlEzWHpxd3Fo?=
 =?utf-8?B?d0dQODFuMnpjWiswU205blFuOVpkck1OOXRVS25XQXRmTG0wdnRpOHBMN1Qx?=
 =?utf-8?B?WW9UaE8zMXQ5WHZMd2hwTVBqYUxwNEtqYlhMS0xQS1Rjb2ppWWcyc0ZVZHNO?=
 =?utf-8?B?MStCZGdlS3dqSGdNR3VPbUVaL0FUS3lRWGRMc05KVkM4Mjh3TGc0ODRWcGJm?=
 =?utf-8?B?YkkyWUE0QmtlMjd6MGtqeG02aHdZWU9CdFVWenBUTlRuT3FETWpqVDlJTk9C?=
 =?utf-8?B?ZDQrMkUxTU1ZNGVvYmUzUXZvcGpndU5Pd29tYStGSGZHdDBIdlNDWmhNWi9G?=
 =?utf-8?B?U1pzOFFYWHlObGl0N3ZDb3VWWWhrb25wT1VHWHZDc2psUUIwOWRPUzJhQ0lI?=
 =?utf-8?B?K0lLWWg3QlRLMTRPR09QS09xakRiUlNGQWV0NEM4RGxuYzNzNmhYR3FzYVBx?=
 =?utf-8?B?cGwxdmlmdTYxeUswYlF0SDA4K2JFM3ZDQ1l2Zm9SRVR4K3VWV3k2WmJBQ3VD?=
 =?utf-8?B?ajNlTk1RdVJCNWFpR0h6WCtWK05mVWRkYmxRYXltNTBvcFJ6MkppdktkTk5Q?=
 =?utf-8?B?STg1UWJCay84OHVMR0NZdktid0V3WmEwTHdlNFBTU2NVT3E0c21UQmtxNEtx?=
 =?utf-8?B?ajZ5UDR3YW80SjRrZWMvZzZuKzJ1Y3krRnpsVDMzcVUycE9iRUN1T2tkTk1O?=
 =?utf-8?B?ZDNzbFgyNTFKb1JmS1RmR2VHa2Vja2VrRGZqZWVJR2loTldGR2FIYVQxRjhB?=
 =?utf-8?B?Zi9UblZxb0ZyVUc1OVVYbUkrSkV2ODZpdU9aMUN5bmNVSmdnN1grS1ozVnlQ?=
 =?utf-8?B?bW9XWHNERXVGVVVuNFM1YUJwSUErR0xnajN4Uzl5a2p5ODB0MTFHNHRoeGM3?=
 =?utf-8?B?UVlCajBSbTlEbHE5UXZDU1MyeWh2NDcrNDRPSTQwWkdhdkFqUDRZOHJ3NDUv?=
 =?utf-8?B?NHBmN1pZdHk4amdGVmFBMjNlU1VQT1dDZUcxeTNrWGlQckxwaW4xdzQwM0tx?=
 =?utf-8?B?SW9sZW53S0VmQUJlZkFsVmtkVEMySkhmTFRRd3IrWXgyQlB2SEwrRkRESnpq?=
 =?utf-8?B?UDI3SmJZR3NqdHNFSGV5emVDMk94ZTdUY2d4MzhmNnNldGRqRzVCWkVLSDNG?=
 =?utf-8?B?L2J3dFhDYTRFQlhQdk8xc1FpRm5uWlFGZzcvaGZMMXVnQnZ0S3Bjdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fd94b5-d176-4ff3-36e1-08de8542ad9a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 23:04:16.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuDn8giKDBAV0usoLC95jc4ZwEmVcTrrPqP45CO1Oe35bFRoMJg4jS6M6Us1ai3cvBCeNBbZq+/HPxzpy96U/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7354
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33777-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC2262C3B79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
> On Wed, Mar 11, 2026 at 8:08 PM Frank Li <Frank.Li@nxp.com> wrote:
>
> > Introduce __pinctrl_generic_pins_function_dt_node_to_map() to allow
> > passing private data and skip_npins to pinmux_generic_add_function().
> >
> > The 'skip_npins' to skip parse pins in dts because on boards MUX control
> > chip switch the whole group together, so needn't handle each pins.
> >
> > Keep pinctrl_generic_pins_function_dt_node_to_map() as a wrapper
> > calling the new helper with a NULL argument to preserve backward
> > compatibility.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Ad attested by several reviews, the pinctrl subsystem maintainer
> strongly dislikes any use of __double_underscore_function_names().
>
> The reason I dislike it is because it is ambiguous.
>
> For example there are __compiler_intrinsics such as
> __iomem and all the stuff from <linux/compiler_types.h>.
>
> Then there are __non_atomics such as __set_bit().
>
> This means __inner_function() just adds to this mess and creates
> a big confusion for the mind.
>
> That said: in this case you're just adding a parameter, just add
> the parameter and change all of the in-tree users to pass false
> or whatever you need, these is just one (1) in-tree user anyway.

pinctrl_generic_pins_function_dt_node_to_map() directly feed to
.dt_node_to_map() callback, add parameter will impact too much.

If don't like __funciton_name(), can we use
pinctrl_generic_pins_function_dt_node_to_map_ext() or other name

Frank

>
> Yours,
> Linus Walleij

