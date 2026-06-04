Return-Path: <linux-gpio+bounces-37917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oJIuO/MMIWqe+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-37917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 07:28:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10E63CF6E
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 07:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vaisala.com header.s=selector1 header.b=xQLFqTHR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37917-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37917-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=vaisala.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D470230427E6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 05:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7714D3BE65F;
	Thu,  4 Jun 2026 05:25:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020075.outbound.protection.outlook.com [52.101.69.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057143AFAE1;
	Thu,  4 Jun 2026 05:25:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550750; cv=fail; b=U5xevq4P1Miihf21jbceJ2miyt/YCGUz5sInRiOSFcgSqcR4GdS+2lgmilDXNZkccDkEkNQJFe0mvwhzg53BP+rWqROa1YAVMtW+g5FUkIGPM93vhGXMeEuVe4BNNV3Ca9qhlD5j0WJcg/KfTHu40knDTP05uGZlpqsBH23Y0aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550750; c=relaxed/simple;
	bh=8sxGNaMp0SwL7IefLixBL2Lj1IH1UI7Clwa4UWxzN0o=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=SjnBm9MAG05LRrvnRuESHT9dQXceKBcEcn1H0CjYJWSWMXXqYKvdBVhbvlh1vJbC5JRZJM4tc5f8y0d3F23gvbd3ZtI66lLkMib9G9TL/Tj6OkqygFrKq1wLPy3RjRRGtl4XK5xOL/5OB/pGL6oGBfveShxlYYksxzrYcUhtR2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=xQLFqTHR; arc=fail smtp.client-ip=52.101.69.75
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg7kr2PKd5BQzzz7R7v3dGUCAgfHVunjb9vBbd76LYyiyDQBc9pCZalz5t+m9Zd9vj7d1xFfGhvRvO87MIQ21onNjHZYBJ7fRr5p3RJap7M7LGBUvhS+EYc27C0KCLoKNI8hgNeV02y+ZEQsSolBBbNwyAVoJyRnESIL+2atjG8wu/iRcIN20ccablizOHf1qQXWywQmxhKNmKtfkkUvz+1hJTVN4hzgivAxIV28ekuhe2JVhjamxz+vArqsVu0N2ujJ7SKpang6MXIo9rzLZNQedOvjyVDQ7sgxlu8cwsWvU2/MrGjLKvLrRzYwE3lXDRTdlih3p9VXZrXicdaxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AQNo0AlHMApQNCfzu7/9/OaO9qt3iRAbKUuBjfE9r0=;
 b=Rx1ZYtbJsAh9bEbJvqluh0doOl59Lw/GmrFIoPZACy29/JljllA+1tOuRyWcvgvpHvqyMCrb6hPY58WAYJKi15wxvAHdvXA70bT2R1P/nY4SuiRFPqLnATWt8bzZH74lKGhKoGwF9+LU5xwNTo0T0nje3ldeJpLjqEA2xzuw0enGO9V0t8dJd9pwD8UobRB4HuhdjrBkS8zB/xPyCKgkXaw6sEpA2NIXaZ4AMoSybAV0G7ieYajm3th/U68FFXDYWUOPbunlht3GmQCHhicHHAxTkdlozRzaK8xCDLFAJyIgHQfj9qJkfTXSWjnl9oydhprHKJ8iU71eccYoZUltSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AQNo0AlHMApQNCfzu7/9/OaO9qt3iRAbKUuBjfE9r0=;
 b=xQLFqTHRsye+eU03GSJTP448UbOCrUdXVBHGWl9KtZLaBf4q5bK6cEHTkazqGgP5D2XLSkpBI4/urfGwQa3rwGjwev2UKiRXfZvi+30tol3tkYcTp96ptbUgNmMZGzH1qtoJORoT735W1fcilNMks4Fo1WxgdsYysMQ5Jz5MNRQ8GvRhRl1Vi5phuGoFs/FHfvM2yXHIiUUNpd19fyGZTrzmEORwCfzhnqS1twebZdgn2SUtY4iUF/OIfV1JwvBYEvRwWYeA4cHHyY+Br2U0rCBLQ1quPx0OaDI2wdsPCWGrJKveTYXThAc2TswEv6jiBfa2Whe6XiWmtnkNJUh8GQ==
Received: from AS5PR06MB9040.eurprd06.prod.outlook.com (2603:10a6:20b:676::22)
 by DB9PR06MB7772.eurprd06.prod.outlook.com (2603:10a6:10:255::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 05:25:39 +0000
Received: from AS5PR06MB9040.eurprd06.prod.outlook.com
 ([fe80::923e:d30b:98c0:c69]) by AS5PR06MB9040.eurprd06.prod.outlook.com
 ([fe80::923e:d30b:98c0:c69%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:25:39 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Thu, 04 Jun 2026 05:25:31 +0000
Subject: [PATCH] gpio: pcf857x: implement get_direction()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-b4-gpio-pcf857x-get-direction-v1-1-d9b13a7b4478@vaisala.com>
X-B4-Tracking: v=1; b=H4sIAEoMIWoC/x3MQQqAIBBA0avErBswrSm6SrQoG202JRohRHdPW
 r7F/w8kjsIJxuqByLckOY+Cpq7A7svhGWUrBq00KVIG1xZ9kBODdUPXZ/R84SaR7VVKJEeGFrY
 tDQ7KI0R2kv//NL/vBzLy08RvAAAA
X-Change-ID: 20260603-b4-gpio-pcf857x-get-direction-6f636aec468f
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780550738; l=4025;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=8sxGNaMp0SwL7IefLixBL2Lj1IH1UI7Clwa4UWxzN0o=;
 b=hbQUiTFie03JWKVrjrZgpCAbKP1eqBIkGHZl76xSfaHprtoPKu8Sgy0GQ1GkEJE1uRpn9fR+H
 QGAMWVUwhAgDdCbdmNIfXv+v1H/dRkKX1EIo6mzzp2D/jUgVMIcc8Fx
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVX0EPF0005F6AE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::292) To AS5PR06MB9040.eurprd06.prod.outlook.com
 (2603:10a6:20b:676::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR06MB9040:EE_|DB9PR06MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a15949-cdbf-4202-a99e-08dec1f9b6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|6133799003|38350700014|11063799006|5023799004|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WFq1dLpSeeGfYHariwcy2gAypY6ZttGKGFo/DAKMT9c57XwqS9zXbtFdvIL+WJNnODwPXCdhqA+i+Wesj4vIVE+cLwYmN4e/ZlAMr8qFvi9/dMJuQjk7kiEGQ3iCo/0NTL54V/3SqLbSTeI9Izz2VQ2EbilAx+eVKhLALtkOde8Ze83bbAcXXtDkbDyxM3ig1MkyRy4w678QS5pYTOZRHlscb+ERKcZB6gMbjiBuEyZ2kR48fdQALZnQ88Odb7BPpIrnHy4Ddlerulu/QJ9bTYHPd3g237Akltsz9+WaLtmPXTknLbVBjTUXPeWIjyFU4MoFPNF0Hg1fIS7OpSFRwh5W6+RA2fuvXt7Rpk0FBC+b1rdKDZeYV7zrztf+GAIBt6zyb1F0Y2tBXmNlay7EXI1riFbomPxrP5qNUqu4pjKAnt1hHxLYkYPqiqGx2auEieFbAjMYi8qB9FTf+ozyJdcqBxZ4GJaSchks44TLngnVliIx42LTKRR/KkP3KqjVyUefi6ltn0fojSGr2lZIkAiHdShYPdBDyKwkUyyjDNuaVfP4ZpzBcApSX8vwotTJ/6zjThJzc2e4snO/YBWNIi13m30lv1dndxmbVGxleClJCRCXmxZ2oYhkamys/1/RNzILMV4DycfvZBP7GvNFFA00YdeSGrQverEJvEvNSELxU0T94mH5SGmkSERuOokqIfdz4rBhtr3H2kQ1xC+IL7CxO00vjWOi6akAzskT4ebVZPeuyDhrN2mmHCyllVbU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR06MB9040.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(6133799003)(38350700014)(11063799006)(5023799004)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlhteVJrVUhwOXRtekIwWTRiSFl2UWdrNmZMaEFEdzFkZWZuQjdYMksybGw1?=
 =?utf-8?B?VEpPNHhTYjFaQXIwYmFjQVczcmRRdTRMTUh4M3ltcWcyLytnSFc5UExFc2hp?=
 =?utf-8?B?elhMMXRnWU9rTjUxV0dGU2hrMldQTVkzdDBXV2JoeE1vUWwzVHIwQ0g1Njhr?=
 =?utf-8?B?NDJGN0p5QlpBcFpWZUp3OHpHcml0QVJOb1J5T2gwQzVXUzFwd3F1cHJGWUFS?=
 =?utf-8?B?eHM5WVdOMEJYTnc4RVlFMmZMRlR3L2xjYk52WHF3aXhGekphSXpURG9FNUZD?=
 =?utf-8?B?OXBaVmlGeG13MEozOEczakRFd29aeFNrN0ZqV1JXQzhVa2pvblI0LzIvUFJW?=
 =?utf-8?B?SlNBeW9aajFNdG5BU3M1YUFIcmtxU0JnVjdwR3FkTHd1a3MvYjhTV3k5MEhJ?=
 =?utf-8?B?VHduQkZqb2ozRWMzcTg1dm5NQ1NwaEdlR0hjUnRuYU5KSlZnMjExeW9oczNo?=
 =?utf-8?B?RU1OeDErR3RaZVpDaXM2a2kzWHhJMnU2K2R1b3gzOStzU3VFN3VUUFRxVkN0?=
 =?utf-8?B?WW1vdEI4eEg5VWR4Y2Q4T2cyU3ZzVGhxYy9jNE8xTmpMTC9kZVFhTk1sTGo4?=
 =?utf-8?B?ZllDNi9rSFpoU3pMUS9oaDVoeWkxZjJNeUdtSFU0RWYyY2pjOTVlM2QrNTZX?=
 =?utf-8?B?MFpoVHBuRnRqakVWYVE2YnZXNEF3cmhkT0wwM2VIUEl3M1Z3dGx3cE9nMWw0?=
 =?utf-8?B?dUg3R2FRMDFpZWpoMlRpQ3h6ZXpPeTFNYzY1bUVMYnF3QXFVUVlzaEY2Wm8v?=
 =?utf-8?B?MU1XSWE0V0Y4TkxVRm5FSit4ZUFHR3BJaU0zdHJMVDdacHhyMVhpTGowcFBR?=
 =?utf-8?B?U0VuNkcyQnBHSkt6Ky8yaXUzSTZ2TnVzaGtmZUlITThiTC9OVUNERlFUZnpy?=
 =?utf-8?B?NkNxVkNwMEo2ektxTlZNSnJteFArbmdJMDdVNytqL1BTallIUWQzZUtZclZu?=
 =?utf-8?B?S2RMNGM3MUl6bUpPZHlhMEo1MGNBNmZVcFVXd20wVmxITGNaMm42cE41QVRm?=
 =?utf-8?B?Vk84S3RiL0Q1Nlp0Znk0VzUrb3VsTyt0SVBPN0N3OWUrdDZSU2NvVE9VRmRq?=
 =?utf-8?B?cE9ra3B1NGt5dzJKTkE1SmFKdjJTTDFmeW0yZlAyVVRqcENKbGlpeHpuS3pq?=
 =?utf-8?B?MjVPcnJwYWJjR01LcnpMQ3dFTFhIU1p2ZXlTZldLZ0c1RE9LelpkSkpvUGNE?=
 =?utf-8?B?bXVmamI3RnlxaFVidXVWY3ZuY2dCcjZnSlgzd0JRZlg4YVcwM0J2MEJuT3NG?=
 =?utf-8?B?cmVWZWQ0Y29yaStKUmRPblp4YU1NYUpIbDQwTkp5VFZRWDVYOTFZSDkyMWNj?=
 =?utf-8?B?MHhHRnFIWDRFWkE4NXR4eWpNamFkY29pTFFzVUw0ZDArb1ROSXpHeFFEQk1K?=
 =?utf-8?B?dTR6MkZWb3pTdVh3c2ErYWdkQ202T3NOQXBnVi9VV2IwYTdyNVNhMTAzSk84?=
 =?utf-8?B?UXlmc0lGZTVVZFlQNFp0ZHhrVUUrY3l4dUZjR2pORVJKUk41YXdkaXNOTmFi?=
 =?utf-8?B?OFd0Rzh6VVpCYXFMNmJHdjV5ekEreDBlWTZ2UklCaU5ZeDZPUzlGYUFZL25X?=
 =?utf-8?B?NkYrd3RQSmJqNFUwU0pXdmR2dkNlZ3hFdjUvbVNlelZFSURDUjJSZ3puKzFB?=
 =?utf-8?B?NVpLYTdSSEZ4eVBmY0ZMenJ6ajNhTFJTQ1NnaHpFVTc0aTJ0WGU0Z1NLUEhN?=
 =?utf-8?B?WkJ1c0d6RHd5Y244TkNSVTVNbE1FaDVYd1VYYnNRYUgvRHB5KzBDZnRsdHRO?=
 =?utf-8?B?LzRMN1ZEVTVXRmtyemFqR0hJT0xuWGlDbFR2OHE1RzM4bTM4VXhZZGkyc1BN?=
 =?utf-8?B?YVBpeEM4WUI0a3lJNU1nR0F5TXF0ckthMlFJZFRrUk9jTTgzTkhIZm1pSWlX?=
 =?utf-8?B?dWd1Q09YUU81RDhNRElCY3UwdWVHclN1RlkyQTZxQkZtT0I3TFpqZ3FwcHBu?=
 =?utf-8?B?RmZ6TzFUMW0vbUU0aGxicDVpWjJCbVpNK1NPdzN2SWtONkkvTGZYM0Y1M2FL?=
 =?utf-8?B?Q0Y1NjJKb2xJK2N3NzdnOXVOZjN1OGsrWU9TS2ZwN0FlUkp1c2JaSFRtQkcw?=
 =?utf-8?B?MHhBVmNaWDhzNWc2cWg4K3hyY0c0MUovMlEyL1FwSGdBWW5Cc0s1RmNmbGNT?=
 =?utf-8?B?bVJVYzFXRkxUanBWR0pjdm10U1BUQzZkazJTeTRJUW8wOGROM3BnVVZwMFRO?=
 =?utf-8?B?RWtDVEVPSnQ1YkhTTHAvVUpEMjIwQUptdE1kOGZlZzJCL3dlYWgzeSticlR5?=
 =?utf-8?B?WVg0cUorTlR2emtVL3hGcDR1TUpqV1dFL0ZBMmdvZnlwU2xlbDNNc0JBK25L?=
 =?utf-8?B?cEliUE1wY0o0WUxJYWFrTjV6WkQrSTJhSHlTYzZYaWtCQnlqN21IMk5BWTRj?=
 =?utf-8?Q?gnQ/gEwpYhIDtNtc=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a15949-cdbf-4202-a99e-08dec1f9b6b1
X-MS-Exchange-CrossTenant-AuthSource: AS5PR06MB9040.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:25:39.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbKYpwcbopD3UGOnauhTT84L3Xf/gpfv0vMj8ylz4PU9KHu/6O8XdtRUTCNft2liNYwO8f1/Ga9BK3KF44PNmvIBcV3buHIgeer0/JJJthM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7772
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[vaisala.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37917-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:akpm@linux-foundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tapio.reijonen@vaisala.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tapio.reijonen@vaisala.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tapio.reijonen@vaisala.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[vaisala.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C10E63CF6E

The GPIO core warns (and taints the kernel) when a gpiochip lacks
.get_direction() and a consumer queries a line's direction, for example
via /sys/kernel/debug/gpio. pcf857x provided direction_input/output but
no get_direction.

These quasi-bidirectional expanders cannot report direction in hardware,
and the 'out' software latch alone is ambiguous - a released (input)
line and an output driven high both read back as a set bit. Track the
direction explicitly in a 'dir' latch updated by the direction_input(),
direction_output() and set_multiple() paths, and return it from
get_direction(). Initialise it from the same reset state as 'out':
released lines are inputs, lines flagged in the power-on latch are
driven-low outputs.

Fixes: 15fae37d9f5f ("gpiolib: pcf857x i2c gpio expander support")
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Found and HW-tested on an i.MX6 SoloX board with a pcf8574 I2C expander:
without this, "cat /sys/kernel/debug/gpio" triggers the gpiolib.c:429
WARNING on each requested line; with it the lines report their in/out
direction and the WARNING is gone.
---
 drivers/gpio/gpio-pcf857x.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 3b9de8c3d924c62da5fff4db6e613b98eed235be..026bae735a577eeedc96dd3b494b55d2d85bc66e 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -70,8 +70,9 @@ MODULE_DEVICE_TABLE(of, pcf857x_of_table);
 struct pcf857x {
 	struct gpio_chip	chip;
 	struct i2c_client	*client;
-	struct mutex		lock;		/* protect 'out' */
+	struct mutex		lock;		/* protect 'out' and 'dir' */
 	unsigned int		out;		/* software latch */
+	unsigned int		dir;		/* direction latch (1 = input) */
 	unsigned int		status;		/* current status */
 	unsigned int		irq_enabled;	/* enabled irqs */
 
@@ -124,12 +125,21 @@ static int pcf857x_input(struct gpio_chip *chip, unsigned int offset)
 
 	mutex_lock(&gpio->lock);
 	gpio->out |= (1 << offset);
+	gpio->dir |= (1 << offset);
 	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
 
 	return status;
 }
 
+static int pcf857x_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct pcf857x *gpio = gpiochip_get_data(chip);
+
+	return (gpio->dir & (1 << offset)) ? GPIO_LINE_DIRECTION_IN
+					   : GPIO_LINE_DIRECTION_OUT;
+}
+
 static int pcf857x_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pcf857x *gpio = gpiochip_get_data(chip);
@@ -165,6 +175,7 @@ static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value
 		gpio->out |= bit;
 	else
 		gpio->out &= ~bit;
+	gpio->dir &= ~bit;
 	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
 
@@ -185,6 +196,7 @@ static int pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	mutex_lock(&gpio->lock);
 	gpio->out &= ~*mask;
 	gpio->out |= *bits & *mask;
+	gpio->dir &= ~*mask;
 	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
 
@@ -299,6 +311,7 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.set_multiple		= pcf857x_set_multiple;
 	gpio->chip.direction_input	= pcf857x_input;
 	gpio->chip.direction_output	= pcf857x_output;
+	gpio->chip.get_direction	= pcf857x_get_direction;
 	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);
 
 	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
@@ -394,6 +407,7 @@ static int pcf857x_probe(struct i2c_client *client)
 	 * reset state.  Otherwise it flags pins to be driven low.
 	 */
 	gpio->out = ~n_latch;
+	gpio->dir = ~n_latch;
 	gpio->status = gpio->read(gpio->client);
 
 	/* Enable irqchip if we have an interrupt */

---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260603-b4-gpio-pcf857x-get-direction-6f636aec468f

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>


