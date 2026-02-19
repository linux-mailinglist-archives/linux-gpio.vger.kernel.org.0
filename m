Return-Path: <linux-gpio+bounces-31918-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNxWI9aNl2me0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31918-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:25:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A9C1632B4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB0A3072643
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8831732C306;
	Thu, 19 Feb 2026 22:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aj1bSheZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C632B9BC;
	Thu, 19 Feb 2026 22:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771539851; cv=fail; b=QDozmdAj5UP9w92okAlERdp2xLa4tZ+wEAJkXzNzWlu0deB5QYYoOA7n55GPueLbeSRF3TLBERjO3KSfNBoLZgOvNqrRWWIILgvc8BSZUzHg2cRMxkZM0pBPKpVrFVAztQj0Fw+omJlDFsYXtg/j/sVkMXV4f3Ysg85ByRpHhHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771539851; c=relaxed/simple;
	bh=1yeNF3YkbQ5kAyezgC8EEDZnsP6YwwwvzUPHuOSQRDE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j6gjpD26p+nCtScp8dxHU9Il9J9vU+v9sFplOrL+mn93LlAMoP3d4YrZ57ZdjIQ/5Q2bgSmu9dwfYxn9vJLwHdRA9Oui08rZyQxOsA8vWzcVf8PiPU/Y4LO3EBDo23KKS5fJ58S8aQY6aubqVcULHGYOwaj2S9teZrwigRzPvD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aj1bSheZ; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw2o1yxnn6KWZmnLw9Y0uZXOM7T41Dz6MdfLwuiqYoq7/SBOhrdD1RZBn97gFuTyU1dPBvjCuHLKQIR5VI2GSHL4jvFsKhz9GkHXXTm38ZeVDo9BCv76LQS6Rd45TPKbu9zLbWo2i+ZbjCzAeWiyGasXxVhAmni0NYhCsIWeKkPe1kLj4k0MvZ464GhH44NnKz+56Tca/77T6sFZmI14bo2KweUo0j44r0V0tNs4XlaFQ+ct+yBELOam5nJEWCER4Nv2S63OLwbJbTuML/FjDT0uFP/7Ud1RshwKDaMTOP9A6OiYN0epY5ufMQ5CCBRiDWHWscqkA8dXUNdm31EiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZx+C21rBTM2di3ca6SyEDxZIIBb4WOLrmPtlFh+zpY=;
 b=fNmVGzPxtORnfsZ13sjEBKA9WBLuN0sWWLsvr9d49vCnJcnGW9fZS178du4PWDsmOuQk7bqFv4vJj4kaZTHWJCy0ZsJtQ7I0HHiuWLiKAJitbxee+6pYJcC0f+R2ja8hT7xqaXm9qgKKUok+es07ULMTGVK1SwXz3VfyPX/J66FXhPmRk3mytcS7alRUbz3cn0Bhw7mwZmI0z35yiWSWpJQrw1pvcXogo6GGvQlV9fJUMb31DdBHroYdUnmzTaBC/ptRgdc5ZnphZ+pTiJcfTLd7sG05epRIRD2Vi+ilMawzYeZkJBTfLp6lxexJbS/Owger4RQWMzYKk+wH5iGHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZx+C21rBTM2di3ca6SyEDxZIIBb4WOLrmPtlFh+zpY=;
 b=aj1bSheZjga0TgrncCKpzIWKhpa4rugXV3gMfmTuDjBuLaAAA1wu9WTt2WFDE/luG5GbXvPEUDoRpO9m4YTROOpEVGMoQ37KxLKLSMgD3aPFrE0R5myiw3Y5ivdNhWEaw9CnzM27/TxXWtx/J8857Vd00Iyk7uv8zqX6DmkShK9XZKrScOplRD0c/EGwDmSvmpvHzlhbvJzBoPSnr9Lal5BHa/41YsWAErXfAuRz25Kx7IUNHTSceMMug2THXrM+3NLXnYvemEh1LgS+E8jUcnssTkNJBIwwu8KmGQbFcjsYoo6ekzdns7JH2FUrdp3p01MnnxCKyyKuDi7mxUPt5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRWPR04MB11281.eurprd04.prod.outlook.com (2603:10a6:d10:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:24:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:24:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 19 Feb 2026 17:23:44 -0500
Subject: [PATCH 4/5] arm64: dts: imx8mp-evk: add board-level mux for CAN2
 and MICFIL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-pinctrl-mux-v1-4-678d21637788@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771539829; l=1849;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1yeNF3YkbQ5kAyezgC8EEDZnsP6YwwwvzUPHuOSQRDE=;
 b=VK0M9D4yFIlWqqoVmfmPFPTnYAfcIqgjCDRrmUM3WC4mJOgvycPqNy8nEYSyqsY9vEPxDUoV2
 QggK+U7sWjYCFHmXwcb6nWYfMym4n+jGvGJwT9q+OgshM2hTS/scs7+
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
X-MS-Office365-Filtering-Correlation-Id: cd4e6ba4-1531-4748-03b5-08de70059823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzNOOUhvbkg2VmdOSURYTVNGZ2RUR3VsYVdQajhML1pqSVB0V0JTZGlwZ1pH?=
 =?utf-8?B?a3UrNGNuNzJxRURSbnNMWSswZU1ZekU5dFNkdmJXMmJ2UkhwQVgrUkxBQS9q?=
 =?utf-8?B?MnhFYlRZS0hpdGhQclJWVFg4OFNKU3dNQzRhZ3NtNTc5VlhOcTR4NWtqOHo4?=
 =?utf-8?B?QjFodzlEZHliQXQ1bXNzWUFFOHV6QzZaRytlMzBEOHdTR2dEQmFieG1Jb0Vs?=
 =?utf-8?B?MzBmVE1EdUViYlFNdUJDZ1ZlT1N2d2VDbDRRekxFQzhZQlVrUzQ4YjZobXYw?=
 =?utf-8?B?UXRwY1p4c0pkL2FYK21QdFBGSzdQOXhiRm1IdFVyTkh4UVpiVER6Q1pZKzBk?=
 =?utf-8?B?OUw0R1RhQnh6NE12eXFPbk1iSVhZS3ZtdktBOUYyZDB6S0gyU0R4djU1YlMr?=
 =?utf-8?B?blBIU2wra2xpTmhtVjMxclRZb2k4cTlyU1RlcUlQQWJydU5VZHRteDZUQ0dx?=
 =?utf-8?B?eEpIR2RuZDhnc0FVWndoZkFtd05kdTdGUjR4dmlkakZSbjRrdTYxblZmcFVM?=
 =?utf-8?B?THhWc2JWTFl1SitJNThibWdUV1d2d1VqZXBXVzlXdmFmaWZrT1RMMHRHazNp?=
 =?utf-8?B?a1RObkxxZGZ1Mk9oSjdyYUFDMDZ2RUVsaDQ1SllZVnJtSjJ3NzJzd1VSWDNn?=
 =?utf-8?B?aUxyRFFKRHZuTGhtMFhaWldLUmdCWHE0ZjhTNGtiTmloVGhpNlN4ekxJWjJo?=
 =?utf-8?B?K0wzbTU3TjZrNVM1WkE5cDF5djFKUjNMVkJpRjNFbmt1dmVwTEpTVFVseDBp?=
 =?utf-8?B?dTVMMms2VmJyMEhLWG82cCtIbk11bEkwWjlHbUxIVXNPc3lOY2ZaNTNPOTBy?=
 =?utf-8?B?UGRpVlZITW5WajY2MVdhU3pFd1BTOFBaZXNHcUdQdnRxb0k0RkRMTW16UGg2?=
 =?utf-8?B?UHpGbzRiNTZjVW16SFFkSjhtUUt6NEM2dU95MHZ5Y0J1UUVZQ2FzSDJoMXN0?=
 =?utf-8?B?QjhLV3BIUmpTcHE2djF6Mk5hd0ZhTG9JUzNUTi8xVXVReS9wQUNGaUtodXUz?=
 =?utf-8?B?T2k4bVord0dWb21jNjJUZUcybDZQNWcrOXlDdkk3ZkxYUEhiejQ5MVZ3d3E5?=
 =?utf-8?B?Z2hhT1pWM2ZlVlpRdnFHbEpuOVpqaWFHc0wxK3lEZ2o5RDVzR1cxR29ReENu?=
 =?utf-8?B?YmhZQTdvRmM5NFdLeUpSSEFSL0VDb2FIbWdJK3c3THVScTV5dmRkWFoxMTBj?=
 =?utf-8?B?WjhMM0k3WlNFWld0QVBOUlhTL1BSdXBESmQ2U0RxTmQyNjBsbnR0NG1OWDYv?=
 =?utf-8?B?WEd0T1JBK1dmZnJWbGI3amZIS2t2czg4R1k0RE56RWhteVRDWEFMSW8vTk1G?=
 =?utf-8?B?eENOL3Fad3JQWVl5U2pYdCtHREplMndheW1TL09GWURlY2FxRkJkdWpLQmVD?=
 =?utf-8?B?bWgvV2dMTjZNdXBKdUsrUXRvTThKRmhzblRRZm5jS1N1c2g3RUFGa3FHSktV?=
 =?utf-8?B?aEdkOFFESk1FSFN4ZUhvZk5LOHo4VVl4TFNqMENpQnIxNjltZXB0c0pEeHRt?=
 =?utf-8?B?aG42WUNORDNWd3NibkhUS1dsMjFpa2JlZ1BYLzMvQ0hPZndtR3R5SGx6Vkxt?=
 =?utf-8?B?M1BuOVBXWjc0Vk5uV1hibHVVK1ZOUGJLZnJuL090UWZCMG5tY2xPRFkvTnVW?=
 =?utf-8?B?MTVDSUJjcGhZZG1CS0EycThMZFRYdmhQWlpQNlhnTXJSRDE5eERjYkNscW02?=
 =?utf-8?B?bkp3b2xKYjY0amUrNEdhY0dtNXdpUnBZakNBdTJwaXd6QUZHNnU4ZUs2L1h5?=
 =?utf-8?B?WUlMWkRLWUZBWXRaR0xDNElJMFVoQktSMUFTemhTUUMvekZkbmZHeENFQllt?=
 =?utf-8?B?b1VVUFlpQVBLdVNiU3A0d0pCZi8rRjBLSFBVbkZWTUlYYWNoNU1adVFBY1hX?=
 =?utf-8?B?WXhCSmdaSW1nK0lsRG1jMUtFd2dnbkRaYXJrTHpJdWtLOGd0V29pSkUzSFNr?=
 =?utf-8?B?cWVGVEZzRTU3MFpHSmlpU2NSUlJYS3dicmlud3d2NGNMOW4zV3VadjhSc2Nw?=
 =?utf-8?B?REFTeG15WHBzNTlGOFllQzYrR25FWDlZWEd6WnZ6UDE0cTM0OTNieUcrMy91?=
 =?utf-8?B?c2tSeHNUeldxbTRrb2EvRnJITU04Nk10NW9zQTlFVnZJc245UGJTeUNLVDNr?=
 =?utf-8?B?eVRlOVc4VkljNGlFT1hNVDFlNzhBRUI4WGdYUG5UZXZreGhBMHBWZXc0TWNI?=
 =?utf-8?Q?To7zksp3Bn5q6uVicG/97vI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHRKUzl2STRyZVYwMytYQlFqTFJXMVZlR1lSK0RFbzIvK2phemhzMkJwR1RF?=
 =?utf-8?B?R3dvSUdvOFk0bHhGY1dOK0QxaGN6Y2hJam5SdFJJMFh2YjBiUHRJWlhNSm13?=
 =?utf-8?B?OGJrWjlGMEJkKzZ4RHZ4bHlXMVZnejBGbmZkZzBFTzA5bTVlWEk4L1ltTHJS?=
 =?utf-8?B?eTNTVXdMb3NUa1dyU01UT21aMUQ3MThpRXArR2lTWUNIeDlZSHl1ZmRUd0l4?=
 =?utf-8?B?c2hKVlE5RXhvQVM2ZHpUZUNmc3FEVlJpZEkwcklLNzVkZ2twbFM4TVRqT1Nn?=
 =?utf-8?B?Nk10ZkhpWk95Y3lIWnY5KzZ2L0Vwdm8rdzUyOXpSWDE3YlVBRlh3TVl3by8y?=
 =?utf-8?B?VFMwRXBpM2pEbDNKTDh3dVlWcWpIYWRyNlVDU2Z6aXBweDZ1SWZlUHZLVkRD?=
 =?utf-8?B?dEFFZVlTczlnVXNrQThYY3VEZ2tYSEY0MDhqOWQ5MkFqWWRwaVQ2dlhNQ1BS?=
 =?utf-8?B?MmV5cnZCQy9ibHp3L09weGUvOVNxeXFSSkxrbjhoS1FqRVYxQUFLdWRENFN5?=
 =?utf-8?B?b01CVmtIWlUvWmtYcXU3VlZ3NjhsaUJ4ZjAySFdNUU1FZndDRExaQjgwVHZO?=
 =?utf-8?B?T3BWbmc3SXhnRDRoQXFZbzFvODNiZDVueVIxK1EwTmE2VmFtaW5pQi83Nng3?=
 =?utf-8?B?UjBNRTh0SkdhMmI0TG5yNXlPa1dFVlppcFM4TFM0S2lwaU9WOUt4VWFJSk1n?=
 =?utf-8?B?SkRXaFFmM2ZVNEFtdXdHaVkySnAxSU5ZNS8renJreXRnYVRwZW96UjRjMDBX?=
 =?utf-8?B?cHBLSm8xa3Y2SXJma1RwNmNYV1llQ2ZtejhwcG02YTRyR0U4NlhFYjZVcmtr?=
 =?utf-8?B?ZzlHQ1NLSUIweTYxOUpTODQ0R0ZWR29WMWtpUHM5V1c4dkNYa0pxS2pFQXZG?=
 =?utf-8?B?alR5bEZVZVEzUEhVZVFmd3FHeklLdm95TjYzUHJnYlY3aTJLdTNzY3BCdjhN?=
 =?utf-8?B?SXptdUMrYms5VVZXQkJRVVY2d01YRnc5OXZoYzgreXRnaSsxR3JMaEgvWElL?=
 =?utf-8?B?amU2ZlJNM2UyVzN6anVaTGxIM2xjYUFITEVQb0dwTXE4dXY0TnNwRkpNQWRl?=
 =?utf-8?B?c1VpWU9XYmV6dXRKTUp6bm5MVi9VZjQ4UjR5VWxUN2EydG5oV2ltRWprbG1v?=
 =?utf-8?B?Mjl1bHJnc3I1K1NDdGJaOXBUaWEva3hXQUlpdHJocUtYNlRFWjF2cXVNNzkz?=
 =?utf-8?B?R0xsRXFjL25TeGZIQUVrQmNncVN0VkxpbTZVRXRZYmJzcjVjYTVxZTZ3Z2w1?=
 =?utf-8?B?bU9JQmEwVHFjdklhc3J6TGJzZjVPYmoyczRIMFlldlNDZ2o5dFBWNllQeHhi?=
 =?utf-8?B?eit5dzQ4Z1NLYnNyYzNGSUdIU2V6cVBxT3d1UnhlRVRodTRrVXVFaGYxWUNr?=
 =?utf-8?B?RW1nVG5VZnVyRWFVbDBWZzFCSzBzdmgrZlVDL250Zno0VlNkZGk3bmhvSUZN?=
 =?utf-8?B?SVpNeUZNclZUdXlLSXNuL2JiY3lBL0lZM1c3SHBqN0lZMTh0MUZMN0NwdUor?=
 =?utf-8?B?KzYrMkFldjBiTlh6enBEem5Jc1AwZk1nTTR2VmZYY0FHaDhSd1J0TVgyMC92?=
 =?utf-8?B?enhDS2pXeEFpZk45ak5QenRYT1FWUFZaOUJGTWVaajk0ZWFyaUxiV0Z0NHFt?=
 =?utf-8?B?MEphTGhGbmpQbkNCdGc4cU5Nc3UxUWxIRlNBUFd5SzRZYmZueG1Td29RUjdm?=
 =?utf-8?B?Q3BNK0lZWVRYMGNGaWZmWWJzbWdaUSs5QnFtZEdqMWQ0YW0rSDhSb3Yxdmxu?=
 =?utf-8?B?QnBxV1hZb1o2TEhWQUM5REdQOUxpa1NoV1V6cjdhd0pUUy9vb1YxSnVYU1hN?=
 =?utf-8?B?U0QrTlhTWi9yeEZxemtXcWllRDFEVlNlR3YvZkJ2UitYUE5QMElueDZZcEhx?=
 =?utf-8?B?eTdrUnlJZG5xYVc4TWEwQWR3bjY3aGhCeS94enNlT0l2TFhnZVNSb1JsYitJ?=
 =?utf-8?B?STJjWElNY3BKUisrZXBsSURSV3huN01wck9tOER0TFdCc1V2cnRDRHNVeDE4?=
 =?utf-8?B?dGh4MHJ6bHVvajgzSllRSDV0OUI0QVlJTVhVcDl1M050R0VRMUJ3WEg5QjBF?=
 =?utf-8?B?bFgxL0g4RjcxZnZuMUtEUnNYUkgvcExZVnB5MmZKMm1Pa2VFM3gzWG5CRzk5?=
 =?utf-8?B?YzVPUDRkcFU4eXoyOG9IMmdoYnpYUFQ5RG45aE40a1lDY3NVYk45ZmlmbU9I?=
 =?utf-8?B?dkdhUXk4M0JIR1lubWVwYUNrc1lWS3RVeXg2VytoWFNodlJ6b1VUMDgyVzdC?=
 =?utf-8?B?WDB1NWRYMzFXRjRpUk9sNE1sMDZGZkR5RVp5RUExVDVSTzJCbDBpT3VsRUkz?=
 =?utf-8?Q?y2pzN3Uu7iZsh7GxOS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4e6ba4-1531-4748-03b5-08de70059823
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:24:06.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyoTCY3kkLoXUrOIk0JGOfGFrDrK16bOZmtf5lpjtOgRL0DvhzNp1Knf4BPngRPj2+GN/jjfGSYZUe6HcMbRAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-31918-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 39A9C1632B4
X-Rspamd-Action: no action

The board integrates an on-board mux to route shared signals to either
CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.

Add a pinctrl-based multiplexer node to describe this routing and ensure
proper probe ordering of the dependent devices.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
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


