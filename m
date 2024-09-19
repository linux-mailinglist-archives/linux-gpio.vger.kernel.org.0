Return-Path: <linux-gpio+bounces-10272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3765297CA74
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 15:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4D84B237CA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 13:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3587219F48B;
	Thu, 19 Sep 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Np/5Lte2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013022.outbound.protection.outlook.com [52.101.67.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FA219EEBF;
	Thu, 19 Sep 2024 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753748; cv=fail; b=YVEcw7rNQihUOzt5Cm17ZN2yXG7nGWn1CN4jvsRmnb0eQ53TPdlzFCgp7H0ba44JOMUQY8pJ6KTPi3DSMuZHbWzlSplIPwRVAKQ38rO77TAbnSTE4C+i9Pw7yaU16UeQdiekvRB2sdjXzBbZoQiignBMB2vlM8Zojat6t5RdrSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753748; c=relaxed/simple;
	bh=CIsBZiSYsnHV/NyW+qQHiLHGwpLlQ3gKSnJS8/inw4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UZXb8mnmLMDCovKpwhE7Ec/+ueTh5NL0/l2E79lO2PZ2daBheTdluJSRdq93NL+A5H9VBORJktsk/Aer0IyliuKDdJvkLLz3+0+0qgjhkPcGOg/4XT80rbWQP2L9t6D5IrVV5LTSCGP7pdMREokCwXUTTwB42FRg4UV2PZ0YGgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Np/5Lte2; arc=fail smtp.client-ip=52.101.67.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drgWBANLxOjHJVbTW3x3ihL8B5Jx/ElC3r3HoOWFWHLnMHwxZjW1D6eoShzoCDbCnQe58skpXmgLMy5ddXIhHA1tsEyAgNzWH2+rv+/tTbuDNRznHDLkVMsqAkV6qecZRe2NyaBpFBsjDS5Xy8dyqcvHTiKLgdTeZF+gcnXvn9eaNQO840AXh2JnGQajueytiB2a6N1dcabA64GBhvXpPk+B/RaQrgUoySaSk//f9pal3PNzhV67z1RwbtS9MdfEkA0HU3bjjp2QAjjzXXuCi1UYOr21mIBSn99F2bG2613K1vytUcFgiJqx9MpXUXxHmgE208rdjGEdHl9d5M9nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LRUHxrXT55ElFUST4jrMCGemrPsb/goitpTKPzmHNA=;
 b=zPP/hPGIFzQQejovB3+F1N9Oz12Htpj2y9kP+KBzqlXSKKarguYHt+wIB8tXY2p5M+DGbgwDrXgk3nDbWtZNlFu9z4PIMIJcrHD5izb8KZqL1HXJKp5+oWmfAue9KQAyFbrUUaIRN1p0SbaEk+PuzXrJTSOCA2ymH63ssaBAfy+FmlTvRxJuKsI7bMqUruuQSdOE0aWifmXnG4N1a4NT2a1yRv5zH34i0IYyEvTAf3w5SCwR6kL2MkeJeJhW5fegsHXGgSKavwSvNpmHd4USbItPVuuZvmaVwsRRlM8qkiiuhpFu5WiadvYpgocXz9W9sgCXLCokTZuXMe+sKeTLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LRUHxrXT55ElFUST4jrMCGemrPsb/goitpTKPzmHNA=;
 b=Np/5Lte2sM2z0hJy1zWhJ2WUMGAAw4+YD5eyy9jUV3y7sVW2McrUIVUx9V5vItW1IXfU/bIpmOhiT8Z6xV6gjYxYxt82YHZN8VBG974ePcdNCxKa+wSgK4bkm0ZWT1MjrH0CwlPoVOkUaZ0HJL1gsDdeSYiHs/wm/OsYxbGxLK+6XoaR7nK+hBctrv9H3RYmxSy9jZ5Va1oGg6BFtfXWMIe9h0SPMaFf17u4MFRcAdOrT8Np7sk6WO1geBHKWyawl95Hd6FUApdheMMcJd5zsG82unKJiDczUKPY5pk4QhY+9FmBXY/L96zYE+i3COsIYb8J4qYgw7HZaU3wo6YdgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI2PR04MB10267.eurprd04.prod.outlook.com (2603:10a6:800:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 13:48:52 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:48:52 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3 SoCs
Date: Thu, 19 Sep 2024 16:47:22 +0300
Message-ID: <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::26) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI2PR04MB10267:EE_
X-MS-Office365-Filtering-Correlation-Id: fef8b8ce-e709-4084-5419-08dcd8b1cc24
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFZ5anFlcHBiejRRQjVGamxNQlgrN05xNGZ0TlFaR0RnTDNtZkRRN1lKU1lZ?=
 =?utf-8?B?bTNKM2h2RW1FdDNiNFhycWdHR0RuNG9HNnM3OHk5MDVFc1ZHbVNQQ3NVeFFZ?=
 =?utf-8?B?S0hrUjhDQ2o1Nzl2eHg1d1NaZk4rZENpYkk2cUduRnI1eVFsaHRNYStZeVBq?=
 =?utf-8?B?NDJ2LzhQeWpGTi9oem5ra2VSOCtkdW85S1AxbjhaNmJhZmpIY3RnazBvN2x6?=
 =?utf-8?B?SHBYblprTGhTTXlWbDlSMEtwM1JzRllRRVJobmJHQXgvQjdlbkFnVzJULzkv?=
 =?utf-8?B?aEpKTVBUekxkdVlGbEdYaWZXaGV3SVVvYVpENWJkMmFZUlc2NnVBN3JwQnl0?=
 =?utf-8?B?Vk45Q2Z2MGRIUXB2S2FOUXNjNG5NZ1V6VDNUUnpQZ0d6N0RpODM5dERVNUZL?=
 =?utf-8?B?U1RLUUVEYVhSdUw3cEV2blBhWVB5eCszNEVGL0l1R2pGMm5WRkdrUytsc3Bx?=
 =?utf-8?B?NkgvRmVYNTJSRUNUK05qSHFEeGpGOFJ6RUdQVGlYaHYwdlRzR0x6MGlOZE1K?=
 =?utf-8?B?QWh1aWRDRVlMVjU2SUZlcFBYcVlONFhLS0J2c2U5b1liQXA3RGJxbmN4Ynp4?=
 =?utf-8?B?ODFuYkU4ak9wVU54QzhSTXg4V3pGQ1JYaG1oWWpRNUNENUloeFBjMHk4S0tL?=
 =?utf-8?B?d1g0Rit5eVJvci9Db0VRREhmVG9kQ24xSWtGM2N0MlZtNGY3N0tvMS91Z0Rh?=
 =?utf-8?B?bGI5ZWdZV0owd1VHWEdpdnZHbVNVUGJ5UHdhSXhWVEVueGJzVmIwWGdNRHVx?=
 =?utf-8?B?eS9Eb2NWRlJ6V05jbWxwK1RZNGtubUw3ckNwcmNJTTNOZFh4U1k2RzRMQ0wr?=
 =?utf-8?B?U2tZWVJOa2R5NGVKTlo2SDg3QjZFMDJzdnA3a0JaWVVOQURxODJKWHQ1dEc4?=
 =?utf-8?B?M0NnM2RoMUlGM2QxaXhXOTN4U3VGTkNkb3RJa3VXdyt0UkdpaGs2Rlo1ZlRj?=
 =?utf-8?B?bWRSMlVuNVBFbFR0eWtXMHNXK1dXTVVuSllNYWtwUUNnaU1renhYWFJkRkdx?=
 =?utf-8?B?aSt1MDRaMk9mdHdMSTYzeWJ3UmRlcUtiSFlyQ3c0cnkza3BnYk12ZmRnV0dI?=
 =?utf-8?B?TVJMVzJLdjU1T2I4Rjc2c3RCWDNFVTk4aERDRnJDSmcvRFNxazNTaTVIR0J5?=
 =?utf-8?B?OEtGZWdNMUMzZlI0aUhmUFVwNnBVcTlXaVRyQjNrWEtXU01Zbk1aMFVnV3JZ?=
 =?utf-8?B?Q01FUWV4K3pHVFJPOVdKaHIyTERiVGVramNwaUIvOFNKNEZxNGlVS0hkQjh6?=
 =?utf-8?B?SHR3QlhlSVY3VVlUNjVIR1BuZkIvdUllTzVxUmEzSCtpdkV1SysxbURoMnNE?=
 =?utf-8?B?ZGJ0aGtKRWtHNWlCcHdwQVZMWTZKaHhSMTJmN0wrazU4YUJzaGxTak43RlFL?=
 =?utf-8?B?V05UQUtNdUdzeGVqL2RtTzlZdTFoMHJRVStGeExHOEx5UVNiN0NNTlFCRGJv?=
 =?utf-8?B?eVFOcm1SN1lUVnBJTWRIYzR3djVaOGVjR2hiSzRwYnF2ZnNJNS9rc0JVNGdN?=
 =?utf-8?B?QmQ0VEhBb216RkM0VnJTMU56V20xNkVjUW13NTc1MHJ0OTFJTGVwWmdPWVo5?=
 =?utf-8?B?MVlKT0VMUGk0QXNNVU1kSnFlbit6TGFhUWg2WG9OemRrZGpQZytOREJwMjlL?=
 =?utf-8?B?alAyekVMS3dOZGU1c3NIZCtTc3dFSStyZ1BraVhaaGt3NGJxcmUvVFk5N0ta?=
 =?utf-8?B?aTFMNjl0b1d5dlo3UEJkNFVEWnZSTTJJRk1NTmlFaVRnbnpsREpwVnkyT0tX?=
 =?utf-8?B?TkZlU2FjVDg4UUFUZEp4NXVESjhXN2tDelZYY3l1dzEvdnhRUjN5TFlzeXo3?=
 =?utf-8?Q?7Gs6y8UbfYnnkSf7cK74cN5UrTaI5VbdWeLOg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUhlSHF2bUsxazZHMmxIWElpQmRjQ2RVZldYRDBCNW9OUlJKLzhSVVR2S2FP?=
 =?utf-8?B?SUk4VFZLbkRyd2NZcnYzK0lhR21yQXZmMWIyeEZSUGpJdVB2bDJRY2ZqYVVV?=
 =?utf-8?B?YjF2S2RISXgxZU9FWDZLeGZSUndET0U3cTV6ZSt4OXpibXg5VjlhVlNIMkwx?=
 =?utf-8?B?akRMVnZJSGJ2YWd3aTBDNE0zcjJpaFpONE9kVWR4SE5ESlF1TElaZHhUamNq?=
 =?utf-8?B?YzNSWkxQdXJ1MTNSeVlrU1VZQW9ZbkRLS05QM3NTTkhrYW9CWTYxSlFxMlpu?=
 =?utf-8?B?bHFxVXc1eFFHTzg4dEZaT2VCeUNaSEJ6d2pJV3J6c1BaT0VPdkpLSEJLNEp4?=
 =?utf-8?B?cjJRUGNkcUtuOWxaZmJKWjRaMmhJNndRT1QxWmtDYzNaOWp5QS9ZbnZyRVZZ?=
 =?utf-8?B?RC9LaTh2ckFqY20yRlZINFA0c1QrSEl1QVhYK043UnBmSmgxZlVhMURaM3d4?=
 =?utf-8?B?MlM2bUIranVtSFUxUXc1cSt4SStBVkIySHVFNW1RbUVFelBwVVBtU0g4RmVO?=
 =?utf-8?B?eHUyVG84dXZOQ0hyZDFEZUcySjh4NXVTQW1iQmlyYUQxakxRMjk5K2hHSmxq?=
 =?utf-8?B?T0g3TEtXc1F2YUFSS0tpdlBqWEhlbDBDWTRlZ2t2eHNaNDVhVXI3ZGVTM0dz?=
 =?utf-8?B?RDZKNTJHVHpFRGEzNVlZL3M4QUxZUUJDaTVqRkkwdlJoZmNsSGIzZ1FJdllo?=
 =?utf-8?B?YmdhWUhLZUhuZUNLeWJQTVJFTWFPQ2pYVGtUek5PVWRuUGRzVUVEVUt4ZHVz?=
 =?utf-8?B?Rkk3K2FWYXdNcGkwQTBONnhQV243aDBKYk85STVaRXBjeVdwdXlLYTIvRE81?=
 =?utf-8?B?cGp4aFQ5UkpiNXMwdm9nYWhNcW1nSDdvSFBXeEJPZTN1bGVVZ3ZkSnl5bFgx?=
 =?utf-8?B?RjhzUkNxRlNoeFVVNjlGN2V1Ukk5MTQ3ZVVnc1Q1ZEc1b3RJSXJYVFQ1YXhZ?=
 =?utf-8?B?OGcwMFFyZnhWc1lteHk5MXU0c0Q2YU8xdkw4a1ZEalBabXlaMmdCZzBDS3VY?=
 =?utf-8?B?Y1U2K1F2SCtPZm9YRlIrMEhuVmZJYmF6ZjEvbG15Qnh3Wlp0bXY3MnJtRTFz?=
 =?utf-8?B?cE5JSExNOGRMMFB0ZzZkVENZQU04V3Qzd1QwUy9DcmFyZFkzdjc1K045RjBu?=
 =?utf-8?B?TnhSU0NhL0VQTnhncUNlNGpaM2x5dzkwek5OU1lDcm4zQ2xkL3FuRDJ0NkEv?=
 =?utf-8?B?d21MRUx6K2dwUkI4RWR4OExQeExsV3puNS91MlR3aFI3a3hRYWFGanp6eDBP?=
 =?utf-8?B?VDVGeExqbVpQNVF4NWh5bDdUcnp0eGNtMVgxSXJxN2xzdUhhNEt6MDFoTm5N?=
 =?utf-8?B?Znlkcnl4UkR6R0ZzcUlSbitiNDFaQlJoQmJVdWJ4QmN1ZVNMQi8rUk9ZNUZv?=
 =?utf-8?B?bUJ3cVVtUXVOMHg1YkFxTkVSQmc0emF5NitFSXllaEtIY3NndzM5clZYTXpQ?=
 =?utf-8?B?VUxkUWxleitHT1hnNWs2YVdzcXI2UEs1TEV4Ykp6U0FJeFJTLzVqMSswRlRx?=
 =?utf-8?B?OUFLTUxOb3BqcHBYd1JQYkdxM1o3SjVkakpDVjRqR1RIVTJsOU04WXFLZHRa?=
 =?utf-8?B?WGd5V3ZhUjVla0VTZi9POWlpc3lWL3lGK2tzK2xhckRWVW9vK2FQSC9odTNm?=
 =?utf-8?B?dFo1MkdlRnlvdmhNNW1zdjhBc0Z1RmZKS1Z2L1pCcTVZSEpkeDZtNWNBcFkw?=
 =?utf-8?B?WE5WcE8vcjRFalFyV1dvRjdNZFJiTlVtaWNTajlpQzlPV0tEcUdhZU9ROW56?=
 =?utf-8?B?bGc4Ymh3RmVyNG41QjNVUnZXamxJeFB6eVRrZ1IzMFJNNnBLLzlQY0kwNUxq?=
 =?utf-8?B?ek9hNUliZGRkVFlwOHUweTMyVEdVZmNNa1ordmFxLzdCbThvTU1iT0cvR05L?=
 =?utf-8?B?TnAza21LcnJlUEFOTU5DS1BOejNIa1l1K3ZSNHhLSkxHUzUxdUZLRFpPMDhm?=
 =?utf-8?B?WnY4V01DeTA0d1pIbUZtSTRmeW9hek9oZURvbzhQYk5QZmtpM2M1dGE0ZTlo?=
 =?utf-8?B?WVlsMUFxWDRyaHplM2ZjbjNHVEVGSkVEa0RPVjB4VzRUQ2ExKzY5cS9hWVdC?=
 =?utf-8?B?dWp1Ky9NNkE2ekhueEJGdXhhSkdXUk5ER0oyVHdsNmJBSlFEYi9LbXhNYURH?=
 =?utf-8?B?ZmkrZUEwVzduM2Q3ZEtxY1J6QzFCUEphOXExa2tqVDB0cENXVVBPQzNzMXZz?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef8b8ce-e709-4084-5419-08dcd8b1cc24
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:48:52.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfKCK1e6GDlauGEQLoXoCKJ+Ko3UxbB0OTs4Q4KfG2MoUg0w6SUPSTwnSLQGCkcE/vEI9Ul2EiWMqIbnSAlBaRUPSN/Jwdh+mIZBrzRW8y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10267

Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.

Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
new file mode 100644
index 000000000000..0548028e6745
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2 SIUL2 GPIO controller
+
+maintainers:
+  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
+  - Larisa Grigore <larisa.grigore@nxp.com>
+  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+
+description:
+  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
+  chips. It includes an IRQ controller for all pins which have
+  an EIRQ associated.
+
+properties:
+  compatible:
+    items:
+      - const: nxp,s32g2-siul2-gpio
+
+  reg:
+    items:
+      - description: PGPDO (output value) registers for SIUL2_0
+      - description: PGPDO (output value) registers for SIUL2_1
+      - description: PGPDI (input value) registers for SIUL2_0
+      - description: PGPDI (input value) registers for SIUL2_1
+      - description: EIRQ (interrupt) configuration registers from SIUL2_1
+      - description: EIRQ IMCR registers for interrupt muxing between pads
+
+  reg-names:
+    items:
+      - const: opads0
+      - const: opads1
+      - const: ipads0
+      - const: ipads1
+      - const: eirqs
+      - const: eirq-imcrs
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-ranges:
+    minItems: 2
+    maxItems: 2
+
+  gpio-reserved-ranges:
+    minItems: 2
+
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - gpio-reserved-ranges
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@4009d700 {
+        compatible = "nxp,s32g2-siul2-gpio";
+        reg = <0x4009d700 0x10>,
+              <0x44011700 0x18>,
+              <0x4009d740 0x10>,
+              <0x44011740 0x18>,
+              <0x44010010 0xb4>,
+              <0x44011078 0x80>;
+        reg-names = "opads0", "opads1", "ipads0",
+                    "ipads1", "eirqs", "eirq-imcrs";
+        gpio-controller;
+        #gpio-cells = <2>;
+                      /* GPIO 0-101 */
+        gpio-ranges = <&pinctrl 0   0   102>,
+                      /* GPIO 112-190 */
+                      <&pinctrl 112 112 79>;
+        gpio-reserved-ranges = <102 10>, <123 21>;
+        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.45.2


