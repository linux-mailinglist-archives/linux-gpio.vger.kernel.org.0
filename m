Return-Path: <linux-gpio+bounces-9207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A8C96034D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 09:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AEB31C2196D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 07:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABAF155C97;
	Tue, 27 Aug 2024 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="BqY+cBBz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2139.outbound.protection.outlook.com [40.107.20.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6BF1386C6;
	Tue, 27 Aug 2024 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744318; cv=fail; b=Z1HR6NegNf+5u6mcIFGLRWbxcj0KfbJXh6GWU/pjMLKpBVSnwEnavXmEPQflcf+U16b4oDeJ2ld0GRkZC0y8Ctctb7fe6qfgjeFFzQRx8oeCKryM5WX/IWfqIvzAVHn0Lu/vA9XsGIGrNdbM8VXC12V+7D/TUOcdGVHdAnUpisQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744318; c=relaxed/simple;
	bh=jIcFufa1hdWYbf9LU1unqMijXn/z38uK5mgV+LMQwqE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sUgXpH2DxNPy5zWH+6D/Qw/7TGsKChWoFaZjwLPFY08lvFX/rO1QpYmxHcRb+9+NZ/VdyS2obBJOyDf2o9C8dPKbLhK/1xCi+digcydix0Ij87FQj8I3qTLaeMemBkYHVtC+OtPjdw6ocVjO21Ua1yaUpoTE16Q5hfyPTppt7oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=BqY+cBBz; arc=fail smtp.client-ip=40.107.20.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFbIdrkkUp67XfypHQRFB5ZiGtKrPw9TIygUxDdo6DoM3nDICcSRkOjvYtVn3lSPNzj5l1iaU4yXP7aU2aQD/uUdiVEvMKU9GNxygcNMfmz8E/rYMzvgOw65DeDKGT//DolROYEhRU/JZKE4yig45bVvfbPASxARx7qVyFEG+Y9nTq4BvcR3jN8Zq6HnQJEia5qf/rXWGKnEXz8GWhhPGFHx3i8s9mRjcCD8rOUhz6TGXQ7ElLir785u/phkn15F9R0DpjanITv37JVe6T1dLjkrkvOnh3N7atwk2CXpCuzUGGdhrPu8Jww2wIencU96pQDQSOl9L+ATdcNb1ik7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRg08mbyMKNWqwz9M3WI6sAHJsF9WQNP3r2q+QHvS6I=;
 b=CC6rqZX5O3hKrmhkdr9252yqApV8/wuZGko3FdIQ1cjJlKi8NufcX1pxMZ+IGGjbBLcfQLddShTn+yGqDr/Ku3LzSPj/AZJ1+vh5BqqJ7z5ZASlAiJC5vK1Wp0ZiLm1M7BiRpPmOWDyPV2peHZcJMlGcr/L+GT5QwxhIZI7CHv27gzCUjvstzYuzbYL4TO+3Ihz102/1FCuyFDoqHc8ScIiaaZkybJbFs/+sf6T3tUwSugb5U63VTGmnH5FB1sEfqIduB8e2Z332Upjrpav2sEtRxzogsmz4SHODWNHYDjx5b42rJ28u6itRvEvXuBTJ4Q+U00TfL5TQ/21vrqBfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRg08mbyMKNWqwz9M3WI6sAHJsF9WQNP3r2q+QHvS6I=;
 b=BqY+cBBzbqEfhKC7O5/RSsEbozeNU3lLB4qlm8q425lp/MrGi1PpFIl5DM3aS8r1WJ/DIc6enonLGZa8HnG4418NeayExkR1qP7qV6SoK22TEv6MwEsCQ9cICGbys4aibzCDY1buE/werCoeKPIs9nzxtKlXrXBnDpy5c6x4JIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by GVXPR08MB7797.eurprd08.prod.outlook.com (2603:10a6:150:5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Tue, 27 Aug
 2024 07:38:27 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%5]) with mapi id 15.20.7918.012; Tue, 27 Aug 2024
 07:38:27 +0000
Message-ID: <762294f5-73e8-4c48-b740-a163f15562f5@genexis.eu>
Date: Tue, 27 Aug 2024 09:38:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Conor Dooley <conor@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com> <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20240826-kinsman-crunching-e3b75297088c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002BA7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:19) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|GVXPR08MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: b853f8a3-993b-49f5-e4e0-08dcc66b3ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUR2dEhFY3dwbGFFdFZUN2MraWwzN1pkTUZyeDhPVENsQWVsZWYveHQ3V0d2?=
 =?utf-8?B?cGpLK1hNeFdQU2hOZjFQdmtYaU03Ri91SUw3L05iMHJCM1ZhQTkxSUhUdnF3?=
 =?utf-8?B?ejF0bHBLWE9sQ2lvN3VWb0tjWGxUdjFxVzNJemJROHVPTTZRZ0lHUGJlWXpO?=
 =?utf-8?B?QURIeVpIWm5ScWdSR1dkeGcyL2RpQkxvQU8rb3RZVURjOEVxMUd6b21BM05J?=
 =?utf-8?B?cnJ6dVBjZ1hqSnVpUm5hRWo5WXg2dTJTMnZEUlM5MnJOR0w2MllmMUhFbXBX?=
 =?utf-8?B?U1E0QXFXT3dUTGhMRUNsbEhLTkdqb3BnUXltK3N4RGNMcFYwRzJSTkNjL2pN?=
 =?utf-8?B?aWpGckFaaFBVM1JqbEFJcHF4TkdxNzYySlZ0M0pWeWhGekRMSHNwWFNvTXp6?=
 =?utf-8?B?dDQ2SnM3SlVBREltWXc1NzNXeGVhZkFNQmJuRmYwUG8xNFFMbmdqSlI5VnZF?=
 =?utf-8?B?VzRFVEpFS0Fja3MxT1ZhdHZhQTliVm55SVR0QU9kdkpIcjZ5MU41NFM4bXFN?=
 =?utf-8?B?a2JWbVNWaTVvSTNmVTZsZVhGYWdJZ2FZV1Vtblllb0FHQm9NWmdabFZ1U05x?=
 =?utf-8?B?V3ZQQ1cxalNEN1hHaXdhN3JuckF0R0lMeEhseW1VUFJrN2RzbnB2RnFTc1lZ?=
 =?utf-8?B?YTBjZm9vZG1weS9hUEVLM3UzM1NDTld6SEFtQWFVcWZ6VTFHOTlONlJtblk5?=
 =?utf-8?B?MzBRUFdhZWxGSURnZzlkT1FaWFFtYTA5TnZPVEdJWFpUQjlSblpscE53Ly9i?=
 =?utf-8?B?VDVmSHA1KytqTU1OeHgydk5ROFlnMEVxVjRDSm44Zy9yYXZudHpsSEtVKytB?=
 =?utf-8?B?cEwzbGVMc1J0UVg2RHFwbXBBWXF4S1cwUnl6ZjZrQlBNMnhaNnhHNzE1anBC?=
 =?utf-8?B?SFFZRkhJdWEyVWRISENDZTB4aHVoZlpjMkhkMjhMa3Y0M2dBR2MybTVqVnRP?=
 =?utf-8?B?N3VwRFZjYm5jZi9sdEl0eGNSYk1VbjgyaktFU2locmR1QytZV1hHRlJPanBo?=
 =?utf-8?B?N3lmM0JTQmgwb1o4TWNrekQ4d2JmR0tWRWd4TVZjekQ3WFF5eUpERmo4NGIy?=
 =?utf-8?B?V3pJQm9NU21YWUcyZ0prY0U2V1V6VU83eGdxdEdjM3pCdFFmK2pIS1ZZTlBz?=
 =?utf-8?B?NHo0OHNEcDhWV3RsQlYzazNMdXdVVnB4aDJlMnBVVDZDeHpWZ1FVVzZmOUxs?=
 =?utf-8?B?TnJqUWR3VGpmU1F4SzZZdlFZKzE2NFZOTm8xMjdrMU5qQUo2WGZweTF6QWpu?=
 =?utf-8?B?c3FJTUdLR1BZSWNZN2FwWEJUc3JwU3RBQlNxc3hYMXRpWHFyTTNpaEZvOE9i?=
 =?utf-8?B?TjBkNFh6eG9idU1xY2JTS201VllqSktqWEhlcytNdDJjK0d1alJmTUFlNkRK?=
 =?utf-8?B?TUZWaGY1c1ZJNHg4TXNSNDBMdExDaTY1Kzc1L2JCS001UndCY2RRL3dDKzhi?=
 =?utf-8?B?Q1F4UjQwRlJ1bFBwNGJqTGpRSjBLdGFyWjZBMFJSYlEva0pqVXFvcXRXa1RQ?=
 =?utf-8?B?VExEYTlGdHFCSnNzUDRoVUJBSnpkSWFsUURiR1BxZ0IwQkxTZ1JOVlR1bVh6?=
 =?utf-8?B?RGkxZ09FV2FqTHd2TmNZYk5KSDZOSXB4dFFJS3pDcXg0c1JyYUdkMFBCbVk0?=
 =?utf-8?B?bFEyNExmUnhJT1NOTHpiU1dBdEFkQTZUcFQ2eTh6YzMyYm9nSzIzb3U4WXQ1?=
 =?utf-8?B?cEJhUHNRWDM4aUZJVXY0Z1hyTDdVeXVoTEozNXB6WG5Jb0N5UGg1VjIwcHRS?=
 =?utf-8?Q?x+jdO+h2w5fn0u9xcg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmM0dXd3QUlJMVBBeXVXU203bnh5T0pUKzZaTHFwOXEvSDBFLzh6dk9mSzhq?=
 =?utf-8?B?SnNUeDFmdkpMM2YyaWsvVlltdG9jZ21CTGNxRHh5dzVlQUN6N3R1NUMwd1I5?=
 =?utf-8?B?Y2pOUnlMLzJzVE9SODF4T3dkeERnemo1SkRvWmw3bWJpTHRBajhxcCt2NExy?=
 =?utf-8?B?RElmLzRkcVYvUy9GZ1RKZXI3T2tJb09WV0JTVkRCV0dBc0tDSU5Qcm5td3pl?=
 =?utf-8?B?NHh1TFhFeVBPcStYQ0xROE1idWZsb2Q2OFVBSnBlMC9lRTVEbXFSNDlEaFpE?=
 =?utf-8?B?M1NNUlJhOGF1dThHSG16TUExRGtZSXBiR3hNbUF5U2J6L0VMRnRNaGt5eWUv?=
 =?utf-8?B?blFWOTdxa3pYcktpa2JEQU5lY0JlRlU3aDREb2tTMTIvQ1oxdDNNcmRMa0sx?=
 =?utf-8?B?TXVDYUc1aDNBS2lwTnphSW5venBUR2xwLzdrNlh2alF6d204UWx1OHk4bzRM?=
 =?utf-8?B?dkhpTTUyZlhIRzVKa1R5WkpXb2t0cytJNWcwSld0OUtza0FMT25ONk13d2cx?=
 =?utf-8?B?TzRlOTIyZksydnRJanVYTzdEeUYyTmJ4ekNOVEVPRW13WWJDRVRnS091Nmtn?=
 =?utf-8?B?QmFBb1ZQeEJOVGlhemJZeU5zRFA4QldiS2hrUXNCeXJDeEYxVDZwZ0w1MVhp?=
 =?utf-8?B?aHZzNTVTRGFSYy81c1JzWG4zaFFyM3F1NXBIbGcvZmk2OHYveVJmSlU1WDBz?=
 =?utf-8?B?Q0dkb1E5TjQ5dmNzeW56cXV0eWN1MnlmYWNPZ0grWG5JMGV5U2xrc1ROMHpj?=
 =?utf-8?B?WXE5S0pwOU5SZnRtZVhoYmMvcDEzY3dubEEyNHdjN2JOMFhOR2Y3bU81WkFD?=
 =?utf-8?B?bm1zRFhPUVBoZjcrY3ZMR0hGdFVZWHluUTlPRk5UbEpiWjI5L1c3TFM5OW9T?=
 =?utf-8?B?eXlhOURwbFZrMHdCUy9zVlRHdXhKQUdNLy9nL0ROZll0UjRkZjd1UGVNVzdG?=
 =?utf-8?B?cWtqMjBpMFZQZlFOVTR5dVozZ29YVVpiZWtIaWVSaUwxUVBzT2U4UkIvOFM5?=
 =?utf-8?B?K2l4anlWa0E0UDcyVGY1VXNhWC80enNKemQxR3BhNm1nOFVlNGU1VXV1Zkdq?=
 =?utf-8?B?dVNZMjdTRWlqZXNYU1B0dm1pbWJBeGJhVUJGVkZ0aHdmbElLNFBOQjQxeVBt?=
 =?utf-8?B?dVVTRUQ4UXhmS2F1VlVndVdnRWEvS0M2ejV1UHI4LzF4ZVFBbGM3UnVyOG9K?=
 =?utf-8?B?UnVRK0IzUVIvZE5zV0JYbk9hV2UwbmpUOGp3Q1dOQVdYbTJqUk1RMS9YR0kz?=
 =?utf-8?B?Q1JkK1ZnS3c5aytiVHo1ZFpBcmptR2ZSTGJGUENBS1JsSXhtVnlLQXAvYzZh?=
 =?utf-8?B?bnZERitkQWt0Z1k0QmNKV24rU2prdFlKYkt5L21NSU5EbUd0V1V3b3hyWXlQ?=
 =?utf-8?B?NytqbFNpckI2THRuQmpRN2FtQ0RjWDNIRlA0ZlZHMGNRS0ltNGJuOHRGcjg4?=
 =?utf-8?B?cXJVdEI1M09nbGNrNGlYZ0FPWW8rZlZnMEVwNDZBYUlnZzdNeEtieEpWaGk5?=
 =?utf-8?B?U0t0bTcxdUhVUWdzekxIY2hoZ3ltT3UwWnp2K3lCTXYzcExjOWJtbjA4NmY1?=
 =?utf-8?B?OTFBSWlsTjZpMVNQWGxYbUc2cEZ5dnJtOHpnYkp4TGdhZWF6QTJoSURoeEIx?=
 =?utf-8?B?dUxxVGhUaGhweEUxT3BBaGEvbDBsL2VnQ2VGTS8xSkI3d2dMZG5Uc1dtRW9Y?=
 =?utf-8?B?bklHSng2QXlFenovK3ZJR1N5U0RiSUhaVW9ra2h3VjIydmxLd1RKSmVySHN2?=
 =?utf-8?B?dzExK3J5OFJLOTIxRmJ0WXE5a2dyK1RaaExTOVJTUDVwYm5OTjB0OEFvbEo0?=
 =?utf-8?B?QzlIa1RId2luSWV0a0ZNSnJWM2o2MWdlWklLdW9ySzNlMzE3b0pNUmd0QVRD?=
 =?utf-8?B?azN5L2V0aE1RZm1sVkI1aDVybG5KYit3UG1rNUZuMmRZcU1rd1p4aGNvMXFC?=
 =?utf-8?B?akhwWFM2VDBZbGJLWHhvKzJYZm1aREVMMk8vaHMrbWpSTUg1eFJGN29iNXA4?=
 =?utf-8?B?SkxhakFYVk1FWnAwbHVVeVFRcTZxdGpxYWtPejJCUGdxTjl6a25Ca2g3Nmla?=
 =?utf-8?B?S1NUZUNQc3d4VTZhbGJncnlnWE5EUkRzYXFhQU44a0xTam4vSnpubHl1dnNl?=
 =?utf-8?B?bi9rd3FKTDhmQlVaSzB6ZTZHbm8vQXZ0SDZ3MjU4dllEOHhjLzlrcm5IemEy?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b853f8a3-993b-49f5-e4e0-08dcc66b3ce1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 07:38:27.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSepTR1VcQoL1bh9I5wMlaEvCQgW8+niOk2grddDzY4BHW2IyR8DtIGqgmQa9SLCCytDnh0low0ysgPKKdXZfsv2uuu0d5IIq+FytbHmlNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7797

Hi.

On 26/08/2024 19:07, Conor Dooley wrote:
> To clarify the hw architecture we are discussing about 3 memory regions:
>> - chip_scu: <0x1fa20000 0x384>
>> - scu: <0x1fb00020 0x94c>
>                    ^
> I'm highly suspicious of a register region that begins at 0x20. What is
> at 0x1fb00000?

Unknown, no documentation of those registers.


>
>> - gpio: <0x1fbf0200 0xbc>
> Do you have a link to the register map documentation for this hardware?

There is no public documentation, what is available is the current 
driver source and this (less useful) partial map here:

https://github.com/gchmiel/en7512_kernel5/blob/master/linux-5-new/arch/mips/include/asm/tc3162/tc3162.h#L860

Registers with FMAP and FLAP are parts of the PWM functionality.

>
>> The memory regions above are used by the following IC blocks:
>> - clock: chip_scu and scu
> What is the differentiation between these two different regions? Do they
> provide different clocks? Are registers from both of them required in
> order to provide particular clocks?

chip-scu contains the registers the clock driver handles. But scu has 
registers with the word clock in the description but both regions does 
not seem to be needed for a specific clock.

chip-scu contains pinctrl, iomux and clocks

scu contains random bits and functional muxes for serdes

>
>> - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
> Ditto here. Are these actually two different sets of iomuxes, or are
> registers from both required to mux a particular pin?

io-muxes for pins are done in chip-scu, pwm muxing is done in the gpio 
register range together with chip-scu (ensure there are no conflicts).

MvH

Benjamin Larsson


