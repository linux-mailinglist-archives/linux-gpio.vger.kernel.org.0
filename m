Return-Path: <linux-gpio+bounces-34332-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFUqDAf4xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34332-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E12334BBD9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96503305CDC8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3BF39F175;
	Fri, 27 Mar 2026 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NBBXavqa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013001.outbound.protection.outlook.com [40.107.162.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD9739E16B;
	Fri, 27 Mar 2026 21:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647275; cv=fail; b=mG1KJZv99ysg8r0g3BOQWRPsA0evgrtt37SXZy51YTmXLpIsZjOLVyKM4DqF/6YaulOJSXjsopVbqFJPRqfMsuEE7PhFTX5DZV7gIBh0748CpNzJy7BWAAjCKUDgKfdKag9Kg4qQRfWv6mTQ+LGQRXexn+SwYjTRiv8w6crzb94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647275; c=relaxed/simple;
	bh=cOYL5rr9PN45WbVPaLo4QNDVlTWljc2zsDVwsNh0YIw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sRT0epbw56WfqsBhXNMI4zoBG/a2DBvK0PQVzxBcpqB5RUJAeisyAgHTGwcOqEQyNLJRnDEvsjdF9FFpPbXfRF1peCMCBNISf/fDW758Aa2XmJXAPf7WJyI0v44ed+u1czkdqrb++FFm+5yiBXygaQ6Xv1DGk03oQnFehHDiWnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NBBXavqa; arc=fail smtp.client-ip=40.107.162.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh76CgVp9zVyZ6fc6JH+ch6jSAWzhqXjdVvoFXYcqQCJhevs0E7+rtSBnS0GXTfOp+lTNiSoRJqUdNPPTdPCtujoabOYYsgtvw1HBTn75j63F9E4Ktjm/6RgKSMje8uJ8/TPoUwa3+Zcff4NY+xsjOboTobwz9Tw9iYR8GR6hRjX8iiZkEABYklY+GqLRmlZbiONzzaJe0DhU6qx6IFTOkBjZVYPURN0ouTkv+2NiHJPf3QZtEs3nwzujqNfM1oYSaeYqoeU+fH5zrHW8uEdBaNWNaZBcOPEFf5o+vUUt0oGwDwFztVT4zJgosGL+w63boshqmjF0DURs2EXy7pZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiWQsY3gAJMTO2/Nk33kRMMppd78eVFxT8bjQxj5TI0=;
 b=nMvSrTw2ILH73w8hrzRMqftcW4huTyzoW7ASSQteuDVXv9CYCtGjBjLxDI4XO452wEV2wRUEZ/5XHyatNIuYIPKoqNARCSbCMrn3u3YnLE849DZGgG+dhKSTb4JU0jwbZR3vDnGWqH6i+SFRd7up5swQ9I9toMHhqMncw3s0FDXVDxppSnrfadfnTtQ3zPfUiHyP/AvqrjXGQNWg8UX79KgXHTiSM3dEw0Cxd9s4bubMh8zmA/Mj3qtMu/eq1+2i90Z6MIsLcWuTczjYuPVgDh+2s4+E3g7/JHUItZjxhau4Gyk2fMP20+o4Mnm7APf1hlbu8TJ5BumfhxUYmkTnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiWQsY3gAJMTO2/Nk33kRMMppd78eVFxT8bjQxj5TI0=;
 b=NBBXavqaS8K1Gn6YVzMJsdXlPoxzgSbZdg6OGWTYNOQN++epepo/i8uApnZDH7mO2bGQEDE+ISGCcpBLSNwUL3BdVDjGeiCzcGoTsMfeTalpZwusPQzNEh2EibBu4FIBC0S0ZFD4rpkx8Cy5R14T6zBc9qY6tLs2IO3U7knNjH9Hta4dVA2Lc5p9hHksxK+kGAXQjfEFymzZ6SmZ2jF39rKRcdrot9Ix2eDud7wo4hz+wzFLMQPI74l/7DLWJfan3jcgAYgE7YQXijBITBfKRzdt+YnVjPc7bRpuOinhBhcjs02uOaij/CdrnEhT89M+DpMBf4adwHN+Sy1ny/ZMxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 27 Mar 2026 17:34:02 -0400
Subject: [PATCH v5 5/7] pinctrl: add generic board-level pinctrl driver
 using mux framework
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-pinctrl-mux-v5-5-d4aec9d62c62@nxp.com>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=8001;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cOYL5rr9PN45WbVPaLo4QNDVlTWljc2zsDVwsNh0YIw=;
 b=vXuOWe6OQcPJX1BKl4jQDvOLIdcl02GDDMnkyrG8hgOVGTIlNzHoEEfWXItnlQymtCo+N4t7G
 fEa5nWQSIfCAnZHlTDYf9j2Xfox6JOFKVIAw18LYeGmFxh05yNZkI7a
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dda89b-7f6a-42ae-7d79-08de8c48a180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RAOY11yvmTR0NcmczxEoHuODOVq4Jr8Nm/6Fh1LUqIzjI/9D1nwyZMjUXMhsrQ+EaExF9vBFVoYkK/OY4wGJuVmgMsHA1GG3QA+6AuND9ciABgyUdOICkrColbKz64f511Rcd6K/4DzTmCpEInnuDz9g3O3Gi8SYzlq8YzOk/FHtjDkoofHBMqkmAcAPrDjcy6gQFEDXafTWtPDuxhy6JHfEsnKX1QJib2HjeJ5zAjh/L7EOmFhGNkDqK7XcRYmtd2ExGoPK4Pdft9k9FXzQCgPzOwQklLDs6rk+crrLOQhZBlBT2pm3pJHoRTOhkNISV73wrbs4EGaa6txc1NrHKhcIOIC/eGXDu4L5f6g3Dq1lgClYxaJmTKod97tEOqRiZtjBKd151u1VWl+zr4YlLcLDrozE5ol352JxjVh+UNlEYJA4j+RmBmw9vrzSO52GhSG8fyDfRiqhzDmibS7nJUwJ3UEBuZcBaLsq09V1aApAvViSUVcfDHlXkhx5ChS7UyJXGe+bV2TS/7dsahwEaRXyDrj2eMQjQeGTPDqw+b2kGn9oMfEDMF/SkavGT23GPbtmjSsFedlaRih4QR8LmaxBISqN5New86COYBaG0ClCPltFHCxkWDdTlz5QanACgG3YhtTrTH77egzZlWW835Edde8lHF0IvNMI/IohOEwcsS36CtmZbWbtFjzmLn6ReFuwVJzHnfNXerhuvCzok2ZJqA60wfQMWtFeCqQrFLkG+7CGL5j8tV8MK4aCWVDYiFw1EkjPJLSOywGqw0MDfH3SxoZeRjk0e0t9V8lxEnU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3NTTzZkMDFhc01CamxlZ3pWcUxCM0RsajdtZ2RxRFJyRUpwdmdHUWpwVXl1?=
 =?utf-8?B?cytvV1gvUkJoVzlUWnBPN1ZpRVJOWm9UZWw4UXJYZGJ2c2hzVFBqZ1Ria1ZE?=
 =?utf-8?B?S3VtcitCY1hjcnVKNFRFeVZKeFY4aUpNbStGUE1XSUVpU0dYd0RqMWErRWM0?=
 =?utf-8?B?UEJudkRPNUtubEFCL3ZLcEpuQVg0RnVsajgvTjBYb3h2T2FrMEVDaWJsRnhQ?=
 =?utf-8?B?b29GQVNBcGQwcGlOK1E2OWpnNGZDRWEzTTBWMnhSQXRYZXhVYWxjM283MmRG?=
 =?utf-8?B?c1Z0SkFzaHc4SVBCSm9wVnF1aFhxeHJKZVNIY1Q3Mm9EVmQ3aGRtYjhxS1pW?=
 =?utf-8?B?OEduT01PNTM0UmxqdnQyUVBzSzZnTEN5SG9ka1JuYjZwWVAyclFNeTJsaEJB?=
 =?utf-8?B?MVNqMU05ZkVldU1JbTVuWEU2NXp1T29IaXRlcTE4dm4vMnFLNkFyeDk0ajRW?=
 =?utf-8?B?NE5wN202OGVkc2F6N0MwTE81aDZlNXF6TkFZelJtek9KNE4zMlozVmR5ZGtD?=
 =?utf-8?B?K3ZIR0tZZnlxVXVLbVpyZjlDWlRyVGhvcXpycUNDOWhld0loWDU5aGhWTm1N?=
 =?utf-8?B?ajczMVhndEpCSXE5RDNuZ29wVkpOVkJyV0Rtajc2QkJiOGkvY3JtNVg1U3hY?=
 =?utf-8?B?UHdNblRXclhYZ0NRa2FkYktHd3hhWkpZRVlldlZzbGF0eVhxbjc5eFE0RTBo?=
 =?utf-8?B?a3gyTHMrZ3c0NjloNG02UFV1N2w4NUVNalA3aTNwUjkyVUJDVDdaZ3VEMFhy?=
 =?utf-8?B?UUducW9SZnl4Y3ZjeHVYQXRFT1hnMXBkblZXL1orWWM0bHdjOHNOR2g0cDBr?=
 =?utf-8?B?V3NaZDBSRmpsNkJ1UUdidDhZSGc0Z3F3QnhvL0l5VUJaQzRpUWttb3UzK0xi?=
 =?utf-8?B?L3dSMzgyZUFmNjZ2dE5Hd2hzZ0xqd0ZBNTJvK1BjUFo4cWFSeGVsVXhvejhH?=
 =?utf-8?B?UzBBM1Q1ZEhEcTR5V09mMDlYWERJRDBNWlZ5NEVNci9JTGF3a0VJT21QWXF3?=
 =?utf-8?B?QnJPUU1USFFVbUJzVFgwOWRsU0NYWk9rZk5UM1hYaTJpb0taV3lHS1llQnlE?=
 =?utf-8?B?dk1IM2t6TmJyUURLOUFqNk1DTUhPTmZvMlR4T2lsalRBbWhUZ2pLMjZVN0wy?=
 =?utf-8?B?VHdvNnpjaEFvL2U3WEJ2eEQrTnU3VU8wcUF0dXZSdWVrNitFR1lsdUZrSHpj?=
 =?utf-8?B?VUtxRlEreGY2RkFhWDdjbmpleHRmMzJaQkc1TllPRHVUU2RUSU83OHdzWnR1?=
 =?utf-8?B?STJuRjQybnFJUWw3aDg3MTZKdDVHdCtpZ2h6YU9XbFBjZzBQOXVSb21zZXVm?=
 =?utf-8?B?a2Y1SmFCZUNzdm4xU2dXdFQvL25oZTk5ZkZLVnk4QkhFTnFPWXZCODFSMVAr?=
 =?utf-8?B?aXRnTnc2ZHBzMlF3Q2ZJL2s1VU9rOTNDQmtvREhsMGhwcDZuSHc3OFZVK2xT?=
 =?utf-8?B?L0NwNDFOTEVZQjlKN1ZVSzBZdXlwSSttQWd2YjNFOGVObmorZmpnd1VWYlRO?=
 =?utf-8?B?SmFHSldCNUhleU11S2Rpa2VtVkhMVCtUV2pjdWVETzUxay9tb2hJWXdaWHpK?=
 =?utf-8?B?S3JTNE11VGY3VC8wNVl5WVlIUldwQ0ZiQVJOVTFTU0V4STdOSFFzb085VVhl?=
 =?utf-8?B?MXVGaytUeDZnRHE0RWhLTVg4ckFwSmpzNWFia0luUGtJWlJuWTZDNHZRNE1O?=
 =?utf-8?B?dDJDUGlUU1NFeGFWUWZybEhoRXZoMm55QWdFVytiK1VsT1ZJbVZqd2RGK3Jm?=
 =?utf-8?B?ZTVPZVFSMExkL0NteWVYbVRtM3IyTEJCdWpMQWJsTkZkZzNNWUJUcmtrdEJ2?=
 =?utf-8?B?bU44bkg2SkdIcmNMYTRBcUdDY0pKNVRvLzQzTXpoQ21vaUo0STcxUVpWbk5o?=
 =?utf-8?B?ZnhENU9qYTkwYnplSW9CaFpQMXB2bGRaa0xGT0RhSkhHbHBLTkpRYWtQNEVS?=
 =?utf-8?B?cmFINGpBUER1Q0JKcloxNFk5WWdhMExRaDRtbnZ4ZDVUR2JqSTNNK1c2VVpQ?=
 =?utf-8?B?Vi80Vmc1NHJDVEtUTE80QjJkbzFyNTJqOE5iQmRuRVI0bkhUVytHNHBjaFUy?=
 =?utf-8?B?SFlZcURvVk5OcC9BSXZOb0psMWtESmZweEUrV3V3ek9LVzhkdjN0dU9TUzZu?=
 =?utf-8?B?MlVxdlMwSHg1a2tOejU5SmkyVmpDN0VVVVJaSWo4bFkrUk9nZDdqRDZlRnhS?=
 =?utf-8?B?SVpJbEpUWDE3cXpDeW9aVUthNjVHbjR5M0hKWGJ1T1BQSXo5bTcvRlJxSmxo?=
 =?utf-8?B?OU9PWTQ2NnhxZUdhWmFJK2daSXNaQzNHdjU2L3VJcXRkelIwMFRXNitXcDFX?=
 =?utf-8?Q?urOOxFsWdZaZyoTFw6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dda89b-7f6a-42ae-7d79-08de8c48a180
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:31.0166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv5LBkwgZ3o92L9amCt+ONPDGHjRh+ELWNHlvBnQ/KM7mxdnsNUTmspkvwYGQMxUdddc2/g/pgknzWFXJSb3OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34332-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 0E12334BBD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
chagne in v4:
- use new pinctrl_generic_pins_to_map()

change in v3:
- use pinctrl_generic_pins_function_dt_node_to_map() and
pinctrl_utils_free_map().

change in v2:
- fix copywrite by add nxp
- fix if (!*map) check
- add release_mux to call mux_state_deselect()
---
 drivers/pinctrl/Kconfig               |   9 ++
 drivers/pinctrl/Makefile              |   1 +
 drivers/pinctrl/pinctrl-generic-mux.c | 197 ++++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f5354f5b92223f8cd80d2f7a08f8e7d..b6d4755e67510786c34f890c5e7a3fcf0adf45e4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -274,6 +274,15 @@ config PINCTRL_GEMINI
 	select GENERIC_PINCONF
 	select MFD_SYSCON
 
+config PINCTRL_GENERIC_MUX
+	tristate "Generic Pinctrl driver by using multiplexer"
+	depends on MULTIPLEXER
+	select PINMUX
+	select GENERIC_PINCTRL
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
index 0000000000000000000000000000000000000000..add3179f40a65d16e71b63442d62504ab1013540
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic Pin Control Driver for Board-Level Mux Chips
+ * Copyright 2026 NXP
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
+#include "pinconf.h"
+#include "pinmux.h"
+#include "pinctrl-utils.h"
+
+struct mux_pin_function {
+	struct mux_state *mux_state;
+};
+
+struct mux_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+
+	/* mutex protect [pinctrl|pinmux]_generic functions */
+	struct mutex lock;
+	int cur_select;
+};
+
+static int
+mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+			  struct device_node *np_config,
+			  struct pinctrl_map **maps, unsigned int *num_maps)
+{
+	unsigned int num_reserved_maps = 0;
+	struct mux_pin_function *function;
+	const char **group_names;
+	int ret;
+
+	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
+	if (!function)
+		return -ENOMEM;
+
+	group_names = devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
+	if (IS_ERR(function->mux_state))
+		return PTR_ERR(function->mux_state);
+
+	ret = pinctrl_generic_to_map(pctldev, np_config, np_config, maps,
+				     num_maps, &num_reserved_maps, group_names,
+				     0, &np_config->name, NULL, 0);
+
+	if (ret)
+		return ret;
+
+	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
+					  1, function);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_ops mux_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = mux_pinmux_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
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
+static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
+				   unsigned int func_selector,
+				   unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	mux_state_deselect(func->mux_state);
+
+	mpctl->cur_select = -1;
+}
+
+static const struct pinmux_ops mux_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = mux_pinmux_set_mux,
+	.release_mux = mux_pinmux_release_mux,
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


