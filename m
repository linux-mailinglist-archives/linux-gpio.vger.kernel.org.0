Return-Path: <linux-gpio+bounces-12692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 507849C166B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 07:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4AE21F23CD0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 06:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85D314A4D4;
	Fri,  8 Nov 2024 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="XfGB/g5n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2107.outbound.protection.outlook.com [40.107.215.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98E28F5;
	Fri,  8 Nov 2024 06:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731046727; cv=fail; b=lUq/G7hgD+HrwTDI/Cnn/3MwwIcvkIjxpbTnuRuXdFQesOxtael9B8j3zlK+PuQIadaBqqSXu3ZRueWE0rJAqeDN1LvpjsAgSuhS7xg4EP3bfIQqKdMZ9WZ1h2Lx26q923qoCC8OclUp3U+VaDwVsAYlaqdwDSyNQnvQ1Zx1DtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731046727; c=relaxed/simple;
	bh=627mQILk6kBoYgDMqEBmzQsk8lbPPyjldjrvSgW0WpM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SOIVrXnImddi3VCzO32G75opEUgZxPa+xkZQ3/IwsBJlV+yiMf0cZqxLFgsWHHiN5Wg9X2B8SbhvphDYHOf85Rr4tBkUfQ0jt/hyhEEv5NlHifn45a0vVfYjf5mdJnmKGCxslQ3gTYAefcL8mMVFssbKGWlfBNcNEhhbKylmaAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=XfGB/g5n; arc=fail smtp.client-ip=40.107.215.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqp7NefFiV4rTDBhAtuvudCwqCpu09RrpbYObm+UXhnUNOVRBi7SrrOwdUV+B79/rDjxo8LhDd75yGdbN/1fEAWXG7G6q8jxJc8zg7SF3dPi3FpM69/kgKuk1jJOekw2RBH97stIYJ9Dmunp3NvIniqh6eUz7dkbDZHQpNA5PIJmspVkAdgnNAa/EEn1sLp7InCRx1v7c7hYKCueRk5w0CQp5wiiF2M78LmoWuUEWz4G8b5JeYxv5wfUYYY9HMxRjIoasmi+YnaLckHnrxLF34KbcFtsDYCGZBMul+tQ9UxhZBHZD4BcicRflVRJV3a3TNEWEo1dUgASWkIgCi759A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQpv0T2SEpAqkIE4AhF2AVC4LDtXueXYpPFptIoFlh4=;
 b=tvcpHK+numX7TnjegWz0nviUd3DlIuDbfLqwK5KTnK8w2CF96FA6ZS693YFcZ45/mVZT+NTTqG6cBpCEFpWdov2VXwrbranlYO1kfJTrqRL9L5lwNd7C4EjTRicWwGGZ7Gfz0rzqiomKRPPK2toHYJeu2HcYuiy265WCmNorToiIp57J4oVUZSTZREdClU7kb088CImq6KgxKyWMU4c0RVRv4Ho7D3+ErlT2E9lXe1ubMydDrpU8BtzozllDQ3QpU1VRTt+TkgmDm5Rr4MmzlPnDuZRvezDc2HkuccFdzQTrvTe34UXGBheKqEBZnes2K0nFINMCd9q+qIN1LUvzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQpv0T2SEpAqkIE4AhF2AVC4LDtXueXYpPFptIoFlh4=;
 b=XfGB/g5n7t3D2GbHNIX4oIvsroEe2flGpH8DD+iwJkJY6ausvMOfXp4DJRtEvV6+jtJJPEHT+VyyyAtVDhH/P8hJqHIc4wB0yrWr3K/lG02GqZQ7Gd5d+rkW7L6WUSzEmxdf5MfbfkWmqi3nUuB0e4r3Wq0HK3U7PgmtWOm+Oaum3l+jKBuar7pBgRw/dSWRHGXALYOgf+LiYqltjeEwQm8CbANQpGKHyJQ4uNCLmY71rR1nWjKaFGraQ7oEcuw0HZpU79YHPWQjKCknxQ7MK44t5VJaJeRdEhrp+J0ypMEtUyZinP1d54zR54WGij5GF4S6+8lArOS3uQjy+tYk8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7019.apcprd03.prod.outlook.com (2603:1096:820:b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 06:18:41 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 06:18:41 +0000
Message-ID: <820705e4-d8bf-403a-9017-d20a028616ae@amlogic.com>
Date: Fri, 8 Nov 2024 14:18:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Content-Language: en-US
To: neil.armstrong@linaro.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
 <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
 <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
 <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
 <7c069b82-c31b-45cc-8cf3-a2181a56c2f5@amlogic.com>
 <3b712cc6-3f3d-4786-b2f8-d66e40cf5008@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <3b712cc6-3f3d-4786-b2f8-d66e40cf5008@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b557d9-1832-45aa-964a-08dcffbd30ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enYzeXFmZld0UER4Q3hjaG9VUW5tVFpDbjNtQzg4TkJSYmxIYS9Pd2VHMU1L?=
 =?utf-8?B?MnNFNFhweEJYazdqcEd6MEN2U2EydU5tZkc5YkZpa21Zc1FLQlo1U0Y1NGdo?=
 =?utf-8?B?aDRDU3VxOTByYzE5NWtvbkpjVEY4OGJIS25xeWVwTHZrRnlnSVdkT2s0c3Ft?=
 =?utf-8?B?eFF4ZVVpZGIxeUUyUSt2OHlNMzNRWWJ2V2F3dE9HT1dJR2xNanJReFdVdkdV?=
 =?utf-8?B?TUthdXRMNVpNT3VWaWNsb1NLWTlUYzQzRXdNSlFxY09vZTZIZ1lpY2NCQzEz?=
 =?utf-8?B?SE9wa0k0QmN5RUhLdWJzL1JFZW5qWnlMMWtBUWw3Yys2eWNtWkMzRzREa0NX?=
 =?utf-8?B?d1QreHgvWi92Vnd6UytNUVdNQ1JMQ1ppVFF0ZElka2xmQ1NYdWtCb3preDJW?=
 =?utf-8?B?UWxaMGc4SHFCQTlBWTgrNGx6T0x1Ti9IaS9MSmlmZkI1MU5DYXRxblVTYTVD?=
 =?utf-8?B?YWdJZzIwRXdqQSsrKzUzcGZKcjhZREFvd081TXQxWjlnV3hWNUtnQVNReHl6?=
 =?utf-8?B?b3d3eWwyQ3JqNkVjeE5KY3RqUlExRmVwWkV2QlBGMmIvVkcvVHRTZFRPdXNB?=
 =?utf-8?B?bHJMZXJSellDRFRhMnQrcFdxQ0hrYnBFVjRGZXhxaUhpNEZyMXV2UXlXdkp2?=
 =?utf-8?B?OGxIYmY4Z3BFb0hPUGh1Q0RwVmRDcUQ5YUthbXNxd29KUGozZXo0a3MvVHVo?=
 =?utf-8?B?VUkzc3J5V1B4THpzU251QVlXeW5kNm5XUEl0UERVblgxNExDKzBUWVptTmhz?=
 =?utf-8?B?OWE5WkRVTnBmcVFwdTVCZVN4RWc2SElhYjNSbDFpVEZNSjVmNFNNTEhzU1ZU?=
 =?utf-8?B?ZHNVRHJrYWtzeVZuYXZHZ1I5NHFrdnpydmF2ZFdQS0RyM3Z4ZVcwQ2JEVHlv?=
 =?utf-8?B?VmNRMEpaSHpPNGlwN3NZTk1TdENFZ0lGZ3UwRjYweDJVZnBOdDlCamVVVW95?=
 =?utf-8?B?QnMyUnNWM09RWlViQnZvRWRINHRKM2NHYzdJSjgxWlA3bGZUQkxVVUw0SWs0?=
 =?utf-8?B?d1RLaStDSnp1Qjd2ZlpqbHFabzNTejVTRXZJaFdSTTFZUERHU0NtbDRRRzkz?=
 =?utf-8?B?T1JpR1BFWWZSaXF3MEtkSkw2Wk1JK2NwdlhYZkRxZTVUOHZvclJEN0NvVUwz?=
 =?utf-8?B?NlFaMS83ZzNaa1VxYmRES0FYazRiQmljbVA2OWpua00rT2VybjJxOEs2Y01i?=
 =?utf-8?B?WnBVZ241dFpJTUpaVDFMNXZjZlhJeWRyUzkyMWoyWHM1b2RudEtEbHExQkJP?=
 =?utf-8?B?M09KVzh0ZDQ3U1RGc200Ujg0d0NVZHBxL3gyVVgyZlY4VFNudUlncWsxbTJi?=
 =?utf-8?B?UUt4TWhEbThTQ00yY0twQnVRSGlyOU5zSE9HdmJwMHZmODlsRHVYUW9Bamd2?=
 =?utf-8?B?UkxEZCttck0xK2o3OFMwY1NTV0pjUVhtRnhSdktObWk0WTV4ZzA3UHJWaTJn?=
 =?utf-8?B?Tk9ETWVKTEpMMUY5d3ZObEQ3bnA1dTVQbzIzNUlFN0FaK1VnSjJQcXplSmhl?=
 =?utf-8?B?MUh4bzI3dEdCaXVVY0MySVRVQTVCQndrd3J6dktiendPdEZYK2piQThFaC8y?=
 =?utf-8?B?dkdUeks4UHo4N01WclM0QkxOZXdNSVpFUjV5aC9BcGdNRXBid0JyeDYwZjdt?=
 =?utf-8?B?ZVFPWmZ4ZnFyNWh4SnQxdWNUOWUyQ0lYUHNLQkVadXNIL1h1TXVJYTFubndI?=
 =?utf-8?B?czhBbWx1NzE0cDUzcHRBNWRieFI4RDgwSGd0MHhLSUFNWFdNbm9SdG1uV1lw?=
 =?utf-8?Q?Kiv2dziV3ojAsP764QhhKuFEW85L/yq5ss+rInK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFRlV3RUWnNxRm80cnJPa3BzTFY5QkNnSEFZcldTSW5kRWVwVHJqVGV4RTlM?=
 =?utf-8?B?RXljQmtNTDZ6M2o4YWR2T1JjNFNvOGwwZmtweXdJSENOMFk4ZWtMUmVYUHVo?=
 =?utf-8?B?NGNZYllLRnR3dWVXV0t4SVVkZC80S3NwaEdEK1FTcjlGU2RkWmNxRjJ5eCtX?=
 =?utf-8?B?bjRWa2hEeDVYZG1Hb1VwU2Nja21YcnZweFZndGtvS3o3RnpiaXBuLzhIdWpN?=
 =?utf-8?B?alEvZUlQLzZ2ZWtXcmlMbkgwKzZZMk1STnZyZVR6dXQ5aEQvR2JKQlI5U3Rx?=
 =?utf-8?B?cnZQM1NPeDZoK3RrV2h2SFlvUVlSMEQ0MTE3NnpBeVFvTmxVQXMrTG9XU0VL?=
 =?utf-8?B?eGVDNnpRSVM5UVlranhhd2J3bXVqWXRGNjJ6dWYwa1ZWYkFkZmh6akgvdE00?=
 =?utf-8?B?QXBXdlh6RlBLS3M3RGRDY2ZmcVUxTzM3ZzQ2UjF3QkwwT3U5S1BFRStGTnpK?=
 =?utf-8?B?bFZDcGhBVDlmT0ptVWpZOStHbnR4SUxMNUVxVzU2djNHaUYzOUpueWhqdk51?=
 =?utf-8?B?N0RUSTVLeGEwSnkwcGtZVFNza1RKNGNiN0g1U0MydzhTbHAzL3lpQzJOZjdw?=
 =?utf-8?B?U1ltWjR4UnRrc2hiYzJNQi9GSHA4NmRDZzV5S0tsanFxZ25Gc25sdlZHdmVt?=
 =?utf-8?B?bnYvWEpKb3diRHJsYnBpVi9wVWQ1Y1c1NGkxUHlWMzR6Zk9iV3VxdEdBL3VU?=
 =?utf-8?B?ZVJrTGIzL08zZmkraWxTZVlrcUtqTlVFNWh2REoxY1pHcmp1ZjYwYTh0UVVl?=
 =?utf-8?B?RXZ0UDhjdWNKQUFrZDk4WTVTdmY4MG5rYnlLaGMvRFJiN1pld2ZENDdseW5r?=
 =?utf-8?B?ZjJTS3FkYS9WQ0xJUGgzN0wwdit2RzNYRi94WVgwSWhkUXRYaHZWdVlscGY0?=
 =?utf-8?B?MFBpekVGTmFNUTVHTlJQNHJkMzNkVStYc2dtTlBnYS9kVmo2LzhZYWNndlcr?=
 =?utf-8?B?b3JvTmNzWXpwU05mTmFldEJZRkNUeU5ta2lRMmxEVVh0ZS9TS1NhQ1A4RmZr?=
 =?utf-8?B?VWVnaUxlWG10WWVFRDEzVWtDdzF5dk5Nb3NqVFRyUWlIei93ZzRGZFNPNjFQ?=
 =?utf-8?B?cFFNcVM4VnBVcWRPbmlkV2R4OVl0WFpvaWw3VUFhRllaQlJMVlFwR3ZiQTZz?=
 =?utf-8?B?TXZhRzRRNzFCcURzc0xJM2RFWGd3dW43TjRKYnhjWEhheCtxNG1VR3cxb2g3?=
 =?utf-8?B?c0w3S3hJdUZFdm9tcWRId2E5LzVWTmlHYk1JbmRpM29jczhsUGFERkVZTlBD?=
 =?utf-8?B?Q2prME1ad3pIN0tnZjlRRzBzRm1lTlJTQTk0eSs2Q3g4SVYvWVphd0dIY2pP?=
 =?utf-8?B?V2c0di9KOWxlZTN0ZGZ5TWZRZ3JRL3BaWnBMSWJDajJjeEVxbFI5NUVOcTNl?=
 =?utf-8?B?bXc5SlB4QlB1V0JMVmFIenNsUVIxVC9DbXdybWh3a0xoeUczRm5sMmI2N29u?=
 =?utf-8?B?T0lEc20yUzhKaW9NM0UwZ2JpU3AwM2ZHakN5U3E3d0Y4T0daRm91ZE1FVFh6?=
 =?utf-8?B?SnB5RENmU2hpalpKTTl0RjdrWFVpaTFjNTRDdndkWDQ0VWxrakkyTy9hQ3Rm?=
 =?utf-8?B?RjB2ZSt4MCtmc0hVVFJKYlg5djhHblJpRFZMQlpUamYvaHorMytyc21MMlNV?=
 =?utf-8?B?aEV1bXVoa0tIOXREVmh4dXkyTlBNVTM4TmZQTTMrWE9wMnJPTk9OcTE2MDBo?=
 =?utf-8?B?RkgyQkVzK01KeklZZlkxdVA1S1BKb21jdFhjNWp1SXN0dElEM0lVS2sxYklI?=
 =?utf-8?B?blFYNWZ2dGhUV1BaQkVmMGFiRFZramNSbUs0WFlhbW12YlI5THZFMW9hdk1i?=
 =?utf-8?B?eFIyQk1kbjZtV3NCMG1tTzlhMitLVGdhVnVHcGd2TUxkMm9wMUg3SEpLZ05k?=
 =?utf-8?B?L1lOSnJMQWtnbHd2anBmSmY5OWRkUHR6Tm5VNFRzSlF6dkgxYmRhbW1UM3Nk?=
 =?utf-8?B?UG8vcU5DMmZrbmdRVGROL0IzNXlrOVZQaGp1c1Iwc3JYd2F4bjJ0enVlYnhm?=
 =?utf-8?B?MjVPNE1teXhZWkdtT1BpK1JnZGhxNnM2R0Yxa1RpYUlueWV0Unc0UmJFVFNM?=
 =?utf-8?B?aTQ2bEJPeVdvcFJtbmVrNlB0MlNNTWFsd1c0a0cvRGFBbWh6YW1icW9URFVV?=
 =?utf-8?B?dlhIZXRiNVcvNXlVVFY5SGFCQUg5TzJsSnZmRCthekJzTkxPY09RamgyTi9R?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b557d9-1832-45aa-964a-08dcffbd30ca
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 06:18:41.3462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DyuNqbO+9vob/q+wAlZNciKRgY2hUWHFnqtaJPylfjkZD8Gkn+Y/K7nIm7dhi4yQJ44vlEAQ3xL+lJgXikt7IaAzh4Z/Nf6v2WdkqiBvGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7019

Hi Neil,
    Thanks for your reply.

    I've already sent RFC v4 version to discuss the feasibility. 
https://lore.kernel.org/all/20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com/

    The driver maintains the original framework, and is compatible with 
the previous, but adds a hook function(of_xlate), and each SoC driver 
implements its own of_xlate function.

    In this way, the binding header file needs to be increased once, and 
the subsequent chip driver no longer adds the header file, this way has 
acked by Rob.

    what do you think of the changes to the driver?

On 2024/10/28 18:44, neil.armstrong@linaro.org wrote:
> [ EXTERNAL EMAIL ]
> 
> On 28/10/2024 10:59, Xianwei Zhao wrote:
>>
>>
>> On 2024/10/28 17:46, neil.armstrong@linaro.org wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 28/10/2024 10:36, Xianwei Zhao wrote:
>>>> Hi Neil,
>>>>     Thanks for your advice.
>>>>
>>>> On 2024/10/28 17:09, neil.armstrong@linaro.org wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On 28/10/2024 10:07, Xianwei Zhao wrote:
>>>>>> Hi Neil,
>>>>>>      Based on the current discussion results, GPIO index macro 
>>>>>> definition does not belong to bindings. If so, the pinctrl driver 
>>>>>> keeps the existing architecture, and use numbers instead in dts 
>>>>>> file. Or the pinctrl driver use bank mode acess, this may not be 
>>>>>> compatible with existing frameworks. This is done by adding 
>>>>>> of_xlate hook functions in pinctrl_chip struct.
>>>>>>
>>>>>> What is your advice that I can implement in the next version. Thanks!
>>>>>
>>>>> Keep the driver as-is, but move the header file into 
>>>>> arch/arm64/boot/dts/amlogic like it was done for the last reset 
>>>>> controller support:
>>>>> arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h
>>>>>
>>>>
>>>> I don't see examples C file applies dts header file.
>>>> C file need to be defined once, and this needs to be defined again 
>>>> in dts header file.
>>>
>>> Sorry could you rephrase, the sentence isn't clear.
>>>
>>
>> I'm sorry I didn't describe it clearly.
>>
>> The pin index definition is used in driver C file and in DTS files.
>> It's not like reset definition only used in DTS files.
>> If the pin definition header file place arch/arm64/boot/dts/amlogic, 
>> so the driver C file needs to be defined again. I don't see examples 
>> of how a C file applies a DTS header file.
> 
> Good question, I still don't understand why the model we used so far is 
> suddenly bad.
> 
> Rob simply pointed for AOBUS:
> ==========><=====================
> I find defines with the value of the define in the name pretty
> pointless.
> ==========><=====================
> 
> Right but those are an exception because GPIO_TEST_N is the exception,
> 
> And of the periphs:
> ==========><=====================
> I'm not really much of a fan of using defines for GPIOs, but if you do,
> wouldn't be better to split banks and lines up rather than a global
> number space. See ASPEED_GPIO() or tegra header.
> ==========><=====================
> 
> This is exactly what was provided in v2, and mapped what was in 
> aspeed-gpio.h
> 
> I repeat:
> The GPIO names are not linear to a number, pointing to the first AOBUS 
> first is a nonsense since GPIO_TEST_N is the exception.
> 
> And the driver needs those numbers since they are bindings.
> 
> Neil
> 
>>
>>> Neil
>>>
>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>>> On 2024/10/21 23:27, Krzysztof Kozlowski wrote:
>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>>
>>>>>>> On 21/10/2024 12:38, neil.armstrong@linaro.org wrote:
>>>>>>>>>> ====><=================
>>>>>>>>>> +/* Standard port */
>>>>>>>>>> +#define GPIOB_START        0
>>>>>>>>>> +#define GPIOB_NUM  14
>>>>>>>>>> +
>>>>>>>>>> +#define GPIOD_START        (GPIOB_START + GPIOB_NUM)
>>>>>>>>>> +#define GPIOD_NUM  16
>>>>>>>>>> +
>>>>>>>>>> +#define GPIOE_START        (GPIOD_START + GPIOD_NUM)
>>>>>>>>>> +#define GPIOE_NUM  2
>>>>>>>>>> +
>>>>>>>>>> +#define GPIOT_START        (GPIOE_START + GPIOE_NUM)
>>>>>>>>>> +#define GPIOT_NUM  23
>>>>>>>>>> +
>>>>>>>>>> +#define GPIOX_START        (GPIOT_START + GPIOT_NUM)
>>>>>>>>>> +#define GPIOX_NUM  18
>>>>>>>>>> +
>>>>>>>>>> +#define PERIPHS_PIN_NUM    (GPIOX_START + GPIOX_NUM)
>>>>>>>>>> +
>>>>>>>>>> +/* Aobus port */
>>>>>>>>>> +#define GPIOAO_START       0
>>>>>>>>>> +#define GPIOAO_NUM 7
>>>>>>>>>> +
>>>>>>>>>> +/* It's a special definition, put at the end, just 1 num */
>>>>>>>>>> +#define    GPIO_TEST_N     (GPIOAO_START +  GPIOAO_NUM)
>>>>>>>>>> +#define    AOBUS_PIN_NUM   (GPIO_TEST_N + 1)
>>>>>>>>>> +
>>>>>>>>>> +#define AMLOGIC_GPIO(port, offset) (port##_START + (offset))
>>>>>>>>>> ====><=================
>>>>>>>>>>
>>>>>>>>>> is exactly what rob asked for, and you nacked it.
>>>>>>>>>
>>>>>>>>> No, this is not what was asked, at least according to my 
>>>>>>>>> understanding.
>>>>>>>>> Number of GPIOs is not an ABI. Neither is their relationship, 
>>>>>>>>> where one
>>>>>>>>> starts and other ends.
>>>>>>>>
>>>>>>>> I confirm this need some work, but it moved the per-pin define 
>>>>>>>> to start
>>>>>>>> and ranges, so what did rob expect ?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Maybe I missed something, but I could not find any users of 
>>>>>>>>> these in the
>>>>>>>>> DTS. Look:
>>>>>>>>>
>>>>>>>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/
>>>>>>>>
>>>>>>>> So you want consumers before the bindings ? strange argument
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Where is any of above defines?
>>>>>>>>>
>>>>>>>>> Maybe they will be visible in the consumer code, but I did not 
>>>>>>>>> imagine
>>>>>>>>> such use. You expect:
>>>>>>>>> reset-gpios = <&ctrl GPIOAO_START 1>???
>>>>>>>>
>>>>>>>> No I expect:
>>>>>>>> reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;
>>>>>>>>
>>>>>>>> but the macro should go along the dts like we did for the reset 
>>>>>>>> defines,
>>>>>>>> so perhaps this is the solution ?
>>>>>>>
>>>>>>> OK, so I said it was not a binding:
>>>>>>> https://lore.kernel.org/all/u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq/
>>>>>>>
>>>>>>> and you here confirm, if I understood you correctly, that it goes 
>>>>>>> with
>>>>>>> the DTS like reset defines (I assume non-ID like defines?), so 
>>>>>>> also not
>>>>>>> a binding?
>>>>>>>
>>>>>>> What are we disagreeing with?
>>>>>>>
>>>>>>> Just to recall, Jerome asked whether you have to now use arbitrary
>>>>>>> numbers in DTS and my answer was: not. It's still the same answer.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>>>
>>>>>
>>>
> 

