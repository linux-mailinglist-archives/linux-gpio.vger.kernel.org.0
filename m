Return-Path: <linux-gpio+bounces-10050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99A977B07
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 10:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D91E289182
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 08:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09481D6DD4;
	Fri, 13 Sep 2024 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ROGp2xCb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462BF1D6DC1;
	Fri, 13 Sep 2024 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216238; cv=fail; b=qdxyDLlA+LSJFxL7atBvr5p7YRI9tgMC+qdBWNtj8Pn/Kt29fU1rsUc55bKONTW8KtUEICwwB2vqwkfk+3auVvicsQqBqC+Yg0CMXg2HSz6honzgV07QstN2Nr+RD2sblsHHJlbduDWotx27GsJ4sZrS8PL2fSuiuelslhryTH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216238; c=relaxed/simple;
	bh=kSZbA7uMWBEeDulkjRznLbdriWTNsdm+9K6cjyHo6/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AtCC9KGAQmc9YRYdg1WMVvK+6BMj6JRRTaMtfJ6SlG1i41FOpt/KKWUSf3Z4WFyju1huWZ4Yy/5XZK7/zEuXgCWRwhHUxe+Atfxw7llySdqx/qRMONb1k6PhaeCVaRSl2MvomKddbI1RzXYfSBmDphqvPMC32voYyB6uIwTT31Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ROGp2xCb; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKX/A4LddseDVyIVnRMjVII3dzLb8bz5LyB0mxVUvtdkZo8E7QDAM1nfaplagtEeEADW6/tdf4dpQOO0gesh5smZPxIRsrhRqcy0jxOq+svHWCiS+ck8BcduYBxRRrCBBxzHxBumM1RtiILOudsH6AnOVKQPoQ1Ux/Q76Xa6qrxd5OQHC09SM/hE0O9J8/iNP878B5ko6D7n8MShDcoBNi1zTgMfsUs+uDSBIw9oUk7BNetGgEEWekN4GAU5TnhocyHviDFDhS2aocoNaPZ2VWI7R5B708Lr3N4FfLJIdsgYvpvXUQLEjhGugnBFhkFK9erYcH+C9dWcyYg4DmSu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5dDRoWfvkCG13zFwyXpkOObBGZ1HJIYXLS5QmuFios=;
 b=MC1TDIL4L8OtEtIL4Ugesd8G4/1D1kNM4OdBWHXGWCEfSEFg7sD+Geq3UoYaVPtSVgzZtFMLzSC38e9HcBx9k6ZjXXC3qZsKRL2ZAV45HD/0x8CASValn5TBHlpMZSCoaNWK/fV8BeIqFRjj4+U+6OuF0TFjSllNvtuhhRZ8/P2fmEJOZnoiMJSFwhNhjZnoxDkA1vvK6DzAk7KbJV49TgH2rK3ynBuryn9Xyn44KLQneRetpbjLlmnCxNC4n3vLpZEjTG+Za8ptH4AS3HrtuRC8l3aqB01SPWn5o3UP5DiGM2x+9p4vC6ZYAsPvhmaRmblkH3xBlg5f2ymqLjTyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5dDRoWfvkCG13zFwyXpkOObBGZ1HJIYXLS5QmuFios=;
 b=ROGp2xCbva8ELc3yp85evt8Ekf5Cxm9KS6blJj2ojrCF3MFUCr1pSiA2DRcmv1IuVZXeYzogfiks0W6hCTE9NhV86G6I6zgkl5zGqNzNwyzHlnaGlxDGWMkCcSpHd/eSIvMwNVCrh+a4A7CPjX+QKE15w7XJOb4ChQb1N8nkYNdNIDvEjySqw0m2ZVFKl25KPTYa4TKc456OGoi2oOCd8kan5xnX1RWIj8SU7b4/bwJeGhRlICFzhP/fu4+xFKP+sohvPHX/LP1zje850whahW9vXx9fTrstOmZ1I3Kir7zWBljfcEHbmlPdCcY8ZkfWHuJYdaz8TaBFlHz6z3NtWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 08:30:32 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 08:30:32 +0000
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
Subject: [PATCH v2 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3 SoCs
Date: Fri, 13 Sep 2024 11:29:33 +0300
Message-ID: <20240913082937.444367-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0134.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4466c5-0f8c-4d98-789c-08dcd3ce552a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVYzYzBwWEl2OTFTMW9IQ1lLVkJWeXIzdk9aaXMrdVFhQjJoTjNsU0lSY2VB?=
 =?utf-8?B?akxkQlRkOEJTYmV0bFF4MzQ1VUdDNkxEUEhnOGpVOWx1ZlpNTDhmamZaalhr?=
 =?utf-8?B?d1M1MlJMU01PM05kdnJRc0d3ZFEvYXdtYWU2TitRMmlsKzNNV0ovNEdyQjY1?=
 =?utf-8?B?UzFPVGgwYU5VRVdnTUJPc21nU3hXL1AxSk1PVnlMSUZrUWpOU0JoZ1plQTMv?=
 =?utf-8?B?RFhHSytJSFdiRzRpUXdha3pJeVZCeDJiTmtmK0daVDlWNkhSTDZ0WXRjMktK?=
 =?utf-8?B?OFhjQThWYTE0RXZzdjBvc21ab0VtZmNRY1diYWoyRFdGTU1ML3FNbmNWU0dW?=
 =?utf-8?B?WTFaNGtpa0pkSXVmOEZmTEQycVVhRmtEdngrYU82ZDMzcEpRM2ZhbnNUTmJO?=
 =?utf-8?B?cnR6Qit0ckM2YlFpZzJWT3A3SDRBYzJiNVNtTU1ueU1oN2QxdnJXak9jaDZR?=
 =?utf-8?B?Nk1zdERLNWZZU2cxR0FveDJYMWoyYlJvZ2FWL1o0UCtSRkJvSk1uQjBQR2g4?=
 =?utf-8?B?YWtueGV2OWViMjkxYmZqa3Q1RExRcmxJMmM4dEVWSUNsZHN0NGVOZFNmVDJI?=
 =?utf-8?B?MnVZT2NpSFBHcGFQcDZFWEwzWmYyN0xuSVhwNWdLd1VJNnNvUWZPRWtLNmpH?=
 =?utf-8?B?bnJiL3ZPOWZGVnFnNVlnYlBVeWtIK012U0xvVHE2bDVLUEwycFZTU09ZTE0w?=
 =?utf-8?B?TW5oSmZOZDVWTkVUakF3SmZ6czFhdUQ3clF4amY4elNkaG9ic2o4cVdQQTZv?=
 =?utf-8?B?L3JtdEtydWtweWM1ZTZlYWgxaWE0Sy95K0dQMU5JVjJzYXhxd2RjNVMrQkdl?=
 =?utf-8?B?K2s2VlgvN3lUYUNUSE40MkVrVHplR0tXUE5Lb0E1aTExMEJUR1hhci9pMGV2?=
 =?utf-8?B?cTZIVG5tZVdOenFPNkYvNFo2N0NCL3RSK2svMVZPMkNDSXFKZTAzRDBBNDlj?=
 =?utf-8?B?Mi9Qa0l3ZlB1WXFRSjltei9pZlBpRzQxa1ljQUtJM3ltbUI2ZWdncnJqWUJ2?=
 =?utf-8?B?dllGNm1YUmtNYU1RQ1c3OTVVN21udU5Vc3MvNDJWbWxGRWk4cjcvVzhCNHhU?=
 =?utf-8?B?QWpLejZESExRMFpTL2ZvaDN0WWw4QXRIV080NHdNTzN0dGVzRy9JWmhYSGtI?=
 =?utf-8?B?QmpSeDFTSkh3cVhzRmdJOWUxbVhFeUMrOEZFdWxCUGFkYk1jZ0JndGdQN24y?=
 =?utf-8?B?SDhWb1Rkc1FnY0xQWmZnUFVPT2JvMHNPVC9SdDBtWmhpdkw3WXM1bm1vb25U?=
 =?utf-8?B?Y3M1S0g3TzJ4ZExNcHBBNmxrL1RIWnBZa2dzRVZCc0FKeXRaMlhnWG1qUlRm?=
 =?utf-8?B?YUtZdGZJMlZGM0xHazUyWW1GeU14SG0yTVB5THgwbHpzYkJWRDAyaThabUZv?=
 =?utf-8?B?VFRJL0x0a1NWY3luR3ROZGg0dGM1MDRMVWZrdkFENGM1VllmeklycmNBdnp5?=
 =?utf-8?B?Q2dLNm4zT254VWNxODgwRENESkJpQVdxUDhoTGJIVkRIRDhSOFlZMEhVU1Ez?=
 =?utf-8?B?SktrZmRyV1M3OHdiWUZ4WUdoTXd5OXVUUm5ha0ZSL3U2ZFZXK1lOR3c1L1c4?=
 =?utf-8?B?alRmNUpGTEFEWTl1NUtCRmNyZklDK0xIV09KL0xmcDdWSng5a1o0cXBPanlP?=
 =?utf-8?B?SlVBbzF6azNic2lrRXVUWHl1bWNiZTNoQjRZbU9HVkhUVlhDN3JzT1BOU3Ev?=
 =?utf-8?B?dzBIUzlHUkxocDVIY281a1dkdmxpMmhEVXRrU2h4ZXMxKzQvdW55YzhMeC9v?=
 =?utf-8?B?WXpZS1JyUmlBajRXbmlmN00yNmtPVy80aHR1cnE4U3FsRFVZS09RTThBVkRH?=
 =?utf-8?Q?IpWJqUcez+AlOc0EEz2fWtdtprwa0zRGyC5h8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmhUSDVObS9nZ3E3b0RFZ1A1SklUVmlaanZieDBpNGdEcjc5YWZZZGJBVGUv?=
 =?utf-8?B?WjhQTE5EdTFrOWlWYkdLRm5wcC9hdHdQdXdZV1ZXRnFuYlEzSlhnWW1aTlA3?=
 =?utf-8?B?ZkxYUlkydmt3djVQa2tMZkJnc09xRHR2NjZISnR4N0lYZUpZWStnWlpvc0pm?=
 =?utf-8?B?ZkhodkVFaW1uUDhDVEJyLzc4VFVEa3M4T3dzejlTSDRTL3BnM2QzOW01TU8z?=
 =?utf-8?B?YnNjdXozL3V6UTFXS21VWlBBaXJ5cW1vTDZOKzVSTEpqOTZNN01EbmZpTWwy?=
 =?utf-8?B?Y1BaOVVJbDFDcUIrb3V2QmpHMC8rcENWZHVZTU04TWxqVTNMb3RnVHlicTVE?=
 =?utf-8?B?RVpnSERKQmJxMW5BRkdlcnhRajFRYWtUSGxpZDlYV3NYU215Z2I5Q1ZEYTdY?=
 =?utf-8?B?aEIwUGQwVFRjeTZwWm1LNHo2NVZJVDNxMkdCTFF6WlEwZXFkYmlJa2VtTjZK?=
 =?utf-8?B?cnorZVlLclhsdXlhVmJHMzVhRFg5Y1pzcFU0RFRlS0hrQllxNEYwUUkrVitp?=
 =?utf-8?B?VGZGSkVXWHpHQWNBRThxekxJRnZmQUlWVVFIZ3BlVVJITktKcGtvRWJGT1RZ?=
 =?utf-8?B?TWh3Q2htR1ZDdFVGTjNobFRzN3Z0MzhYSDdZSzhMRTJidkdMTHFXTGJYcFRV?=
 =?utf-8?B?L3lXNlJsM2pYMFBLV3hTYVZDbXA0NS9BemlTY0NGcWRRYlNnTy9zSDd6c3kv?=
 =?utf-8?B?NHIvUU1odDBENXE1Y2ZxRFNBT25FWjJBU0UvOFhTMHdyZU9TdlU2OE9yek1X?=
 =?utf-8?B?bEhic1AwUllraDltOXdxMjdNd1JFZHAyTmdDcmhtbFdnRVgxRGM2bUNVcHRw?=
 =?utf-8?B?dXBmN0dJSjJ6c3B6ZnNWVVRtWmhTeFEvcmVTQ3pHMDVwdW96cTBmOWUvaFY3?=
 =?utf-8?B?dHQ0blFSZ21qRU83SnNLTnIrbHZRSEZHM1lJZVpmS3B5MXhWbU96dGF4SFNu?=
 =?utf-8?B?YnlwYXRvZzJPaE56T3N1Uk1pQkZ3MXpMamdhaVJDb3FUSXQ3WTlPNlhJSWNY?=
 =?utf-8?B?Ym1nYTM1TTQ3OFNNWUZSRldjQ00zN00zMGtiNy9CWGxNeUpFYWlJWVczbXNo?=
 =?utf-8?B?SGhsQXk2ZG5iYmRkNHdSS3R2bGIxTkRBM2ZDdlI1SDBka255UzhIVkJIaXlw?=
 =?utf-8?B?WVphaXdENmdISG9ZamtwUHV2OEdOT1RYd1ZETnFabnVtbEx3aWxwbXVQdmNz?=
 =?utf-8?B?bFhRR21uaGxSaVlKdzFrWFhObDFSN09tck9teHkveDJHeVJiK2g2bFV4clBn?=
 =?utf-8?B?UVowU2dpaVpXYmFtS0dReEszb1NoOGowSjkvejg4UjYwTFM2ZFM0Y2ludzU2?=
 =?utf-8?B?OThrQmZFWE9pMUxVbFlvcGEyaFUzM1JQcVYrT1RDTkUyZDJlRVhVQjZPamhp?=
 =?utf-8?B?eFhBbnNtNTJGUGNNY1JxQUk0MTNXUnRqc0hnR3VMT1RlNUl6K1hKRFdoVml6?=
 =?utf-8?B?dWN2bm5tdGgzN0lIckROL2llZGw5NjJmcjJ3TVh3ZFBKbWVmYWVNMjZCTHlG?=
 =?utf-8?B?blYzdVBaY0Q0ZkM4bnBVUGY0eUdmc1lZYnMzUVdaUmVCVWRuK3gwdm80UDZX?=
 =?utf-8?B?eHJMMjN4Sm85Y0QzVFJMK0xQekRXSUJvbVg1eGhQY3ZNVGpYOFQrbU45aVln?=
 =?utf-8?B?RGVpQXJOdUU2WXdJbEVlcFdLMW9KdG1CVEVWekdnUDAxOW8yYVNXWmlIVXBP?=
 =?utf-8?B?NW9aS2U0bDdqNGpqbk1GS2REQ09yMmhNS0QrenJzU1NnMXNxVjhkUlV6RWMw?=
 =?utf-8?B?blBqVkh5cXNicmQwVFFZcFhsMGsxdnBzWDdHdW5MUDhYMjRNYUpSZVVraG5N?=
 =?utf-8?B?anNqK2E3MEJoTXFFOVFMOHpwTDhjQ1RNQ0F3UDkvd25yeEVLR01xU1VaMFVH?=
 =?utf-8?B?Y2Fla1hFZXEwWm4rSXNiRzdXTXRsR1Fub2tVOW44SmNxUGRCMXhoWHdHOVV5?=
 =?utf-8?B?ZmdYa2NwR1dvWmpUOFNqdVg5a3BEdEQ0QW9UNHBvSlllSFhlaUoxRkQvb0Uz?=
 =?utf-8?B?clJ3VnhqazBkdDJGK1pqSVJVekdtUFRwWHI5dWJadHdyYXVCSUU2YUpJc2Fk?=
 =?utf-8?B?N1lRWVByT0VXcHpQbTk2ZWtMMUtCQmNyb2t3OExoVEo2OXY2N0xrbGxzNTF2?=
 =?utf-8?B?WmgrbHJabENtQXNtRExFUWRDVHg2ZllZQUkwUTQybGgwREJ4bHd1anFJNnNH?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4466c5-0f8c-4d98-789c-08dcd3ce552a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 08:30:32.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCkoLu3OvC4vq9agKAjPVvwmSbrQLm4IdCw+oWMfFVkhlk6UFnCqqn3UUNjHr3sZ6KfL908nyJ0DYsS6lz1b7u0RJEtRMXVZ7Fuo5wfghXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.

Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
new file mode 100644
index 000000000000..8be8eb3a971d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,gpio-siul2-s32g2.yaml#
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
+    gpio: siul2-gpio@4009d700 {
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


