Return-Path: <linux-gpio+bounces-34331-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHw5Oir4xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34331-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F047C34BBF7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14DE0302FBF4
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE49839EF19;
	Fri, 27 Mar 2026 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eA39KQav"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D837A4BE;
	Fri, 27 Mar 2026 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647271; cv=fail; b=KDwH3u+WP54sNKHYZ/eOtMGtZhP4ncXnlbLZbGIgjj5STCNSa9lOrK7uTAZ0hjMrELDI6PAmnLQkygZlPSqK3pCzaJUPv5dcpKrmQHtFGQPOxEYEvfPYweoj3NNFKkqxnFfNObTWiKfhmHkXdEsoZX6rrQjyzq7tY1DmQZhpxCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647271; c=relaxed/simple;
	bh=84YFQG/s33y4aWmdQnO4NG1npAXRpP23tH3HW7BHAtc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QbEK3Kfsv1Ec+by/gyjWpwQknBwdZl9l44jV9NHUY4YHrtakWj2JBhYnMx/bhDVAK3nrYusnf8uHXpGVjORxR35KWYoYXBzfkdICHB1ygmlIUZmvGoWbLxHgyV5aKYszoQ8ZNkK5yUULxBWNX5F05k63NUTe/kiFwFsWlumxkMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eA39KQav; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVGRJQ8Dc6wXTl10RUTmYhj4sTtjq5kOmz8kr41FGP3RV4HU7SeyAB6840lAukgsWwLWPEk9Q5rEZqMylDK1hDET2zmBb0oWh/CPKzkVTxLHm5PMBKSHl8n8RXUuvQXXut7C2a97T1Ed/sMxlzW73x11QMCYORZElmfwDy1+6I8LsuwcV2yhcAYWdf9Z4M3MWhmWr1OGYFuD6BKsfDzA4WTPTktebDdbLgEvhK0EgKbF9FtHB8P/R5f2rm9WLkU9XkDaC7P7PXci4iToCjFlL9p7u9gA3BOORBC2DX+ZF+hzgIID/5KwF8X/dGYMl4QZ1qgDnR1poSRSVBta/L62Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EomKscOACz2EiMfHyFMhDh5ukwxhM8VLlPUnGrNoojg=;
 b=sVUf54qVYudwxdMf3R/vMESxqEGe5bpWdycI8fLaOdmlVo1B05khHKO5UCYivKMpwR+JiDSBlZD6wKV3Jyc2QFm4mKFVZ9hNoKq1FBq8gh76Bbzmc2Le9KAtUwBg1bZArWoBICppVZRZawowJuX0vni0dZcIo2fP79go5TnRC4eoETWsWjYSyZ+IcaWXSRQYmJg+bEMbNb/UMt7KvU8dOlZxL0ykJbmjaNAd9lrz3D7rtBkInC145OMevD2UAu4H4v/dAw3RDhx+SIm07CS0F8G8UBDqEUIBIopjpZZylNdRe4LEcyl7DlBuCKlrcu2hkjlE20wnd5VunfU264CFJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EomKscOACz2EiMfHyFMhDh5ukwxhM8VLlPUnGrNoojg=;
 b=eA39KQavVDKv0myPOlo+zIpJ2r/FDz1Fvz86XvVgQRrUnKsuTiJYs+RDeWmOhxIKZGUJ5Iq8Sh1mVpL3DPEv95U70Nsr6muQtvUv3Ay2sVhbdtZlS24j7sAjxoQ27A3YYb5SLVLyLQ/D6slFfN/QQ0UkZwoyhVmPSXbIbp+IS6lX1+1l/hfKOTmVgHpq4bILHF2auLu9i9AvN72Z0/rPXAaAl7v5Etm0H658ZRiWOu9ZGt7qmUK6Ej9KrYIWaKPgq+dPtm/sPDyUb0j/gqOnHkqazGSPVVIYhweuBAqJcF/L8nON3klxiywLaOe4I3XyUfo5irRTR3spz75f3KvrBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 27 Mar 2026 17:34:01 -0400
Subject: [PATCH v5 4/7] pinctrl: add optional .release_mux() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-pinctrl-mux-v5-4-d4aec9d62c62@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=3409;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=84YFQG/s33y4aWmdQnO4NG1npAXRpP23tH3HW7BHAtc=;
 b=Roh+eHNTlsPrdeEK2+/2kyviVZZq+emGZ9IVm07GP7UQGqkFFV4pRsoJqfTsRyNUjh9zexlv+
 9K5OIPt0gMNCjIL8uBZWFpxysX3SXz7MQYVaSDTdYqp7Q/2OD1tlGkT
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
X-MS-Office365-Filtering-Correlation-Id: 3f730001-f66e-4794-c424-08de8c489fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zuzcG4ZxFz2pYcsgc1QQQxsI9gXMhUwquTYl9GkMl/usyYfgWt/vpYFBG+CwiaTUMMoKaxa+iEzne2w6prVkAHHJAll1G5cE6Hp+h4YKe6kCkpv3JnLmv/mSK5mEeSyVdpuAoepcQoc6Jgq83babVWKbzbVSPtu0qDBigdtUeFyTHwHsCKjCWmUDIDodIpbzYcSzCvstjCztk3J/tSVRdPSSUipmVvF0w26bGsaeAdhsN62zLb9fUrHaLqIdlKMPbss7GdvOE9KOwK7TJjhAX3sVvrN/+otpq0kUARy2hfOnlhaYgu1TPJ+c8SQwNOuZ5TKdVvIakoGazI9aWQENbc0BXa1VA0mg9oNFn8kNDwYBXqnFiHfkHzFvrpfx8Pr8JBHICODaBfgdwhweduUQKG2BFSIknp15V9xVAmsegJu25/tqc/43gtqa0bJ1ekekScQJtCuQClhXPakzkX7rKbhdvVfVvEvMndjWcaL8PU83ceH3uI3vS52zONZyrco1N1A8nzKDN+zYCdeaVJpdnBsixQEFt4ATxFclSfHeEkqXEb7AA/Vlcm9k6X+dgDHa7o1UHJ4tTnmCAn1X/KKrVpNWWz3DuDT7VnKee6t6aRMBtx3BMJaG1eZ7ikVTwkcSgLxNjyy4tV3VgYX9fi3Xsg9ZC1qOHlSIQACqGi2XcaBN+sRESU19Xtagc7AadZ+cwnuvfA7OsZVtOMzHQfizCi/WG1vn0waNWvlJg7KDjHtdrjlmiVdSljZrPXP/G7I9dC2KHHhUX1mXeylFcx6QFRRKi5qy+6oqbpwgSpYNnHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjkrRHBpYmE5WkpJajRhcjV0NklJdS9NcWUyWkFqQitEUWdrTGRqcDhXRmM0?=
 =?utf-8?B?VGJWNkdaQk9IY0RoTnpmc2ZMVzBCTXI2RitRM2c3TFVETXdKMytMWTFmaWYz?=
 =?utf-8?B?RDh6QUpIUm5DUFVoQlc0Y3RCbS9NUXNLNkN1ZVc3d0lRQW55MEh1QlA0UVh1?=
 =?utf-8?B?aU9WMkRFcHhKb1NzK050SXU2eEtmTUxjaW1uRWZKeWRwNkgvZEUvdnE1Wkps?=
 =?utf-8?B?cXBUZU9XWE1sWXgvejNjeEtXL3FHTGhIZjgvQXpTeUFvNW0xYlFHY1dPbG9n?=
 =?utf-8?B?bFAyTjVVZldFY0QrUmVrYTE0Y1N4a2dtS1dLY3RtRU1yOStvNzVLY0ptZjRk?=
 =?utf-8?B?YVFNSWRDRHVtci9XK2h5Vk9xbGZyN0ZIeHMrSkRYelFNZDFYaTF5YUd4eEIr?=
 =?utf-8?B?STN0UExNK3JCQkluR2k4bFB0TEUyTFRTY2ZZZzg2YWp1SGVEOWo4TFdwWjdQ?=
 =?utf-8?B?TUVlZXhCbWpjSUtXZHRLNEhTTk1QUXloZnREOUlPa1BSRmQyRXRNVWdsTWpE?=
 =?utf-8?B?WGcxWnMzVHRJcnB5eDF1NGljNUY5N3I1Z1hld3ZJd1Y4VE50Q3g1VzBRaFVF?=
 =?utf-8?B?ZVdvSERjS0hLQ2JpVE9NeWtFcUVJbEdJdjFRZ2Q4YnRjQXd0MUdJS3paMXE3?=
 =?utf-8?B?VU8wU3hsa0hYVTg1U3A4OGtIWFNYdE1CRkJEZmFWU1dHNmVUOVVDVzZWZlRr?=
 =?utf-8?B?QkltQk15M0dFMHY5aWFlZUwrUFVhWTA3WElleTQ1Rm9tV2lCNGhCSk95Vjgx?=
 =?utf-8?B?NG9GU21FdFc1K2l0Yi9kUkhpbUNxcSttM1VkaTBMaGZjckFydEJjZVFYczJl?=
 =?utf-8?B?UFl4QWwrRmVIWnVYdHo5M05kWVpQSVdWMUhYU0pZL294UHlIbW1Jb200ZjRO?=
 =?utf-8?B?QXRKZ2QwcVpVazJKbGdjQTgyOGVOTk1FWTVnYzV4VTVORUJlblkvdHBUUUgz?=
 =?utf-8?B?VGtmckRCR0NkdzVmWTh6d2VodnlOZjZYY1RHcFIwQkJzZUV5UEpJSVZVbWhB?=
 =?utf-8?B?UEEzdi90OXppUDFEM3lZdG51QXlsTTdtOUovbmJBNVhRMTZjcVNLc3lpcWRi?=
 =?utf-8?B?Q3dQZUVQWTMyMEh0Qk1GWHphTllOWnJ0ejJ5T29RWFlUeUEvZmF6WkZIT0lO?=
 =?utf-8?B?SnUyZS82V1lNTmlOYzZtSWNYcG5qUktrVWgrd0xNWUN2dnpGU3hHYzQrNWhy?=
 =?utf-8?B?c3NEOEF6Ym1ucFc1Sm13ZmV3OHgzSkZTWnJYenN3MXllYWtMbnQwUDQrSkpl?=
 =?utf-8?B?SkY4Q21YdEk4M0lQejhyL0FCMmthV3ZWc1h1S0JjZ2dWRGFCTHlUb2x6UGdW?=
 =?utf-8?B?QXBudUNBWWU4NGxIQmFqTFBUZzZMc3duNjZMVnR5WStIdWNNVytiWlZkSTM4?=
 =?utf-8?B?cGtCcUVPcllwVnVKek5rT2VCcXR6eklCUWtuMHFIaHlsYkJrTnRtYmZocURw?=
 =?utf-8?B?eVlGcUc0VWJhL3hXVnhZc0Qrd1pPZVpaZ1dIUVRaOWZWTG1aeitkYm1EMG5G?=
 =?utf-8?B?UGdsYTRrTDVSOCtxNHpMZG9CSlplZ0RXUXQxdmx1alM4alJrd0JvTFI5UFhC?=
 =?utf-8?B?NkhrdTMzaDlnY2FpdU4zSFloLzN1OGx0RkpGMWFqTWlDaVhXOTVndHFETTBt?=
 =?utf-8?B?MmhJVmdFanlmQ08zVnBtZkVCalQzcFczc0lXUVVFYWpGL0tudFZBQ2NaK1FP?=
 =?utf-8?B?QVhCWWRkeTltbEJPb0VTTFp5aTZWbHg4OUtYWEVmZllQTkpBMDk4d0Y5aUFi?=
 =?utf-8?B?UGdYdWJhazJDTWlMQzNYZlN1cGxPZUtWa0tUaG9BQjZ3YjRiWGpQc1dqZ1pX?=
 =?utf-8?B?ajVUaU1EOEhYU3MzOUVDS3o1d1l4MnZycHNxa1NQSHQzY0xzT3k0YXR6VUl3?=
 =?utf-8?B?VnpoQW9Ic2xXVHBLU3BLVXlZanZURnJDdUtCcFM4bzVhTFhETk5wS0JLL2pW?=
 =?utf-8?B?cnhmTVJuUWFTemJ2ZXBFbkVjWEl3RGptclZubHVWSmNsUXdnQXpqNHZyV2l4?=
 =?utf-8?B?d2pDTzFIQ3h3SUdUTUp0YnEzMDJDem9PQ3g3dGlrbHBKY2QyNy8za24yWnVy?=
 =?utf-8?B?amhUMjQ5d1BrUE5FWGZqRDVzRTZLc01wK05weWszTGJGcGNtWEw5dTM2Tld2?=
 =?utf-8?B?aDRacGJ5bi9qYUcwdythS3ZxQ0dxTFdMYTZ5bVRkOHRPazFyb0x1TFpFUnpC?=
 =?utf-8?B?Y0NCVDhYOEpqcHpGVUdmYjNlaWJMS1pxMUFnbHBDZlZ0S1JRMS8za0JicllX?=
 =?utf-8?B?ZW1xV2t1SVk4dU1ZdVZMNzRld2pIbzBLKy9UTFFPNGNxbnJSWXdEcFVBSzZW?=
 =?utf-8?Q?3b5JfFdB518a2aNXi8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f730001-f66e-4794-c424-08de8c489fe5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:28.2674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb1mVz2c0qQgGs7kzn/CKn+3MKQRZYwwYr/Xn68EqbDVhSBVw+oYeiCtjj7kPuQGMN7B2TQst8uXEFiN6THkZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34331-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F047C34BBF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an optional .release_mux() callback to struct pinmux_ops.

Some drivers acquire additional resources in .set_mux(), such as software
locks. These resources may need to be released when the mux function is no
longer active. Introducing a dedicated .release_mux() callback allows
drivers to clean up such resources.

The callback is optional and does not affect existing drivers.

Commit 2243a87d90b42 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin") removed the .disable() callback
to resolve two issues:

  1. desc->mux_usecount increasing monotonically
  2. Hardware glitches caused by repeated .disable()/.enable() calls

Adding .release_mux() does not reintroduce those problems. The callback is
intended only for releasing driver-side resources (e.g. locks) and must not
modify hardware registers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4
- none

change in v3
- Add judgement about 2243a87d90b42 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin") in commit message.
---
 drivers/pinctrl/pinmux.c       | 5 +++++
 include/linux/pinctrl/pinmux.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 3a8dd184ba3d670e01a890427e19af59b65eb813..c705bc182266c596c4e6c820f5e3ffcadbbb2838 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -517,6 +517,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 	int ret = 0;
 	const unsigned int *pins = NULL;
 	unsigned int num_pins = 0;
@@ -563,6 +564,10 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 				 pins[i], desc->name, gname);
 		}
 	}
+
+	if (ops->release_mux)
+		ops->release_mux(pctldev, setting->data.mux.func,
+				 setting->data.mux.group);
 }
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 094bbe2fd6fd5ea3c5fdf5b6d6d9a7639700b50b..77664937eeb273eef440988c4cf833dbc6f10758 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -51,6 +51,8 @@ struct pinctrl_gpio_range;
  *	are handled by the pinmux subsystem. The @func_selector selects a
  *	certain function whereas @group_selector selects a certain set of pins
  *	to be used. On simple controllers the latter argument may be ignored
+ * @release_mux: Release software resources acquired by @set_mux. This callback
+ *	must not change hardware state to avoid glitches when switching mux.
  * @gpio_request_enable: requests and enables GPIO on a certain pin.
  *	Implement this only if you can mux every pin individually as GPIO. The
  *	affected GPIO range is passed along with an offset(pin number) into that
@@ -80,6 +82,9 @@ struct pinmux_ops {
 				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
+	void (*release_mux) (struct pinctrl_dev *pctldev,
+			     unsigned int func_selector,
+			     unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
 				    struct pinctrl_gpio_range *range,
 				    unsigned int offset);

-- 
2.43.0


