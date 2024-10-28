Return-Path: <linux-gpio+bounces-12205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E599B2AF5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F1B1B21E0A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2596A192B94;
	Mon, 28 Oct 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="hpf7D6rf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2095.outbound.protection.outlook.com [40.107.215.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD4190676;
	Mon, 28 Oct 2024 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106445; cv=fail; b=k6l+CeNIGTSuWwnrKyozz8MVrT+4eZ7obXWiFc71Yo5wRP08pjzbdJaLfyU/RpDZawsH2a8EXGkdNGUV7hJdMDqd+D9r9cZMCWmCKOow42lvK9/ihpZnMnbZQzZe3yXfLbL0BVWnEAfRX6SswrW4pIgcBHnffCfX4H+Rv1dVHJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106445; c=relaxed/simple;
	bh=C/dFmim8oh2vbFwOfKwkWH4sc2LXvOVe8Jij1AS+6qY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tLL5ThGQALFBRKTtMocZ2n84li0NEHE80WI8AZ0RCZbJ1wFrO6o0avpO8JRC6hgotEkepIEF4riNvKWN3yduVkZpxEUlw43M6tjEg2KgD2wDE9NQlCamc6S+iu8thwPCKQgrwPq2xd6EEwYLO9HTgP0/gB62Sd2fM1EWVUMhDOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=hpf7D6rf; arc=fail smtp.client-ip=40.107.215.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giffA4RMsLDJ4OAszZeRkmoS8K9jijv8UE8oWBV+Sdvf33+OSDLMm2m1c5J7wyUHmF2nxZ5Bg555YyL4Vvqr5hUpDvVgrQBcLJ1q0iNr4RtUjEIEx5sqfmIIL8B6ow3ksDGUUo21pHhulYHDVMdU5xLycApXMRYhJJlDq1MzlgBpoNVr3y2HbtsrNxtrW+PSU0MMQqGV00f1eh2EdqKH+z08dyB1DO4xMG57IRuhl34hF7vjcTc5rMPhuVPVIxvZJL5ID4NH+Y/ljF4Bxs384B+OyY31s01F6Xble+MeaCyw5F+BE7Uo9ebMnxh23oX4OGiEbZZWf5KjK+KtPS/tHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDmqNbI71lfKRMwW13qm8TO282pwAC3Nf0llfrtq4v8=;
 b=BzWpkEK2a6eXzGlXBC5xfQhwHUavdIiAhly4su2p29yyZDtbJ5yzOCvthKg42iyOyQIzIzy434jl4t1WnzTUF88KUevz5ZDpXX9XhH7xwo++h1Qe3C6KwbvrehEWZwj+tDe/hn9+SP9Rn6xMoy/27J9uZHEyDtLDyqsamBakyy8fe+uhZp7+SIcoxvjO5yRz3VRx5r8BD9boOSI0kRcyTKeolmT2uI87siQNJ1oB1WyvCP6U2BqwPSMzQLHoTIgTwT//S7lWnuwPSlcNC5qT3bjlOBZuSuYYKD0ZPfHg7Pps8ak0feQ2Z9KxyoTWqKNNYpK2EGxxwBD0TjlxkIgqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDmqNbI71lfKRMwW13qm8TO282pwAC3Nf0llfrtq4v8=;
 b=hpf7D6rfqYNtZztp7lITyxg4b0wTIOT+4XG2E1T0r8/I7kD2+oePMKKOiYBPV+FAOu0w7sRDBAMV239aRhFdet0seXjCJUKl09E/abxT6Bhszl7pVCXPIWXbflDfjXPeurVLrfVnUGBqC85rcd/OorbjHTdpM5WI2Pj5u4xSpE9DIWiGOprIWAEDDE5pLiKKAT1pEzPmhRleTG1krn+C37u5hU9a69/Om4DK69aeIQUQ+oQCHphBGwjPwES6iNLjQTxYdpg77eFYhMWo607B7TRURcGRTByc+WQgIvfDQMT0TQmksBTpNGLpr2mvoDcj5X0d5rJaeg0T4HWjNy0YNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by SEYPR03MB8304.apcprd03.prod.outlook.com (2603:1096:101:1b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 09:07:19 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%3]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 09:07:19 +0000
Message-ID: <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
Date: Mon, 28 Oct 2024 17:07:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org,
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
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|SEYPR03MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b54e63c-9e5c-4f36-2ef1-08dcf72fecd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEQvMGY5enJEd2g0empJVTNSek1KeENpckQyU0ZwTlBpaWc3ZVJ0S1pIRUdh?=
 =?utf-8?B?Um9xcnNiaHVWcmNxODVyM0RwMVYvbjRxNWh4V1ZPalV2N214STd3VXVVQmZP?=
 =?utf-8?B?cStrVy8rQjkvQ0pBWkVyanJFc2UzOEhRQXNwcmxXWElQL2QzY1JhamhJNms4?=
 =?utf-8?B?UGZVSSt2b1FBaTk3VDNwdmQyb0JFM0p3WVgwZWUyY0d3U3lrYTdYemhjb1dO?=
 =?utf-8?B?eE1PRG1GemZFK0d6Q2pLaVNtWkY4MFpnRy85Z0tydjQ2N04wTlVwQ1VMaXha?=
 =?utf-8?B?YWlnWG1FWVFYdytIOVVuakJLbjlNYXMxUkQ2SlRsTjZFNDBaVTgvVmRUT3Nr?=
 =?utf-8?B?ZTNyakF4N3hKRjdtaVl6eXhFZ3R1RGl6enNvZE0yc1R2Z0pzamdUQlppWm56?=
 =?utf-8?B?cnpYeEwyN01lMmwvMzVLSHQyK0thb1E1OC9LMWFpQm94di9CSk03b1p1a1ND?=
 =?utf-8?B?U3NlVGxrOStYWnR3NkgrWHptVUFnTW81ZEFJUm5vNVFwd2l3L2lSaUxhU3Np?=
 =?utf-8?B?Y2NPeitmTG9FazgvaHNEdnNkWFhpSjMxZDcybStuWWZTc0dGOEdOVG1zajV2?=
 =?utf-8?B?RzJiVXZaa21lZWQ2TUdPQXpmQVlUdG11K0FhY2xhUW5MTU1BeGxMNnZ1YlBk?=
 =?utf-8?B?NTIxNm96RDFlWE8wRENoNEpMVk5ITlVvTnJvY0Zia05yMmo5eHg4MjF2R3ZD?=
 =?utf-8?B?SWpJTUFHR0QrMGdmdWJMN0srbW5nbUlqQ0t5dk9BSmpiRzNUSW1BTlg4c2tp?=
 =?utf-8?B?U2ZCb2h1VnhCUms4eXdhMmR6cTB6WTA3VWZ2bDRuOWUyY1c4ZjhBb0FWVnY3?=
 =?utf-8?B?RFcvTFdqSmlqL1VpTUgwbml6MVgzdzFxaFBCRXFsK3Flazc1eFdVcEZyV1c4?=
 =?utf-8?B?a2ZzTDJ0VUxXb3JsRkhJZWdIM1NHV0dvRVRUSzVPajExcmZ4WHRDdHBwV1VV?=
 =?utf-8?B?bk9rM0MwY1VtYlRBbnRmVDlsRVdMS200bjJXeDhaM1lCY3pHUkpVUWpSaDNu?=
 =?utf-8?B?TTF0U1p3dnBKa0pqNkdnWm1tS2VqNlFUZ2NrSjk0ZWFnUDdORUVTRVgyNVBC?=
 =?utf-8?B?bUQ4RDM4TzBnRW9iVEJ5dmFlaDl0OG5TdHhKZzZzMnVVNVk1OFVaditMOEgx?=
 =?utf-8?B?bC9hbzVzTFIyVVVHcUtlRW05TmxTOGx1UDl5RUNCZTEzazZPOXBZSUNIQ3R1?=
 =?utf-8?B?bjRjc0ZFaWEzNWNqVHBZaldhZFFlOTd5TVVoSFpDcTZWQzFJK1hLc3d2cnpC?=
 =?utf-8?B?QUtlb2t2UFJOY1BFSGQ3YWNEejZMSGd4TWpCV1VNejFsU0Mydzc3QkQwVHFo?=
 =?utf-8?B?aG5qUGpJVjkrS0NzbUEyVzQ0UnBSMDJORnFRRnpKQlR4V3U0RFZRL2RwdHY1?=
 =?utf-8?B?QTFrSFkraSttRitkOUJhdkF4VHFkY0ZBMDFtRjhWNmN3RGJ2M2hDME5sbWRD?=
 =?utf-8?B?anNLTm5uWnEzeGxFTEU0WHMvdTUzQ2VlUjFDUUwrcW1kZkI4Rnd4WHdaZkRz?=
 =?utf-8?B?a1lTTXFxcW4wZjN2Um5JTldSQTVZV1U4eXp4OHU4RXlmdXFDRWtPYi9RVXow?=
 =?utf-8?B?djQ3UEhId0U4aWRMSllLelJjd1Z1VjQyRXZKZ1NRSWxPRW54RUxzUXgzUzY0?=
 =?utf-8?B?MjZvcHhDeklhQWV3eUFKNGx2WnpaMXZmb3VYaUVVTjRiRnVkZGNKTnFUaGE1?=
 =?utf-8?B?MFN5bllPNmV0aUo3dVFRcXFUT1ZOSEJWWHY1NjF5MWNqQW50WWtpdmI5Q2wy?=
 =?utf-8?Q?NIOpbTGkpJIpNe6W3dMvYfC4M4W0HVS/srwfRY+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3FBUEZDRUNZb2hQaG9NQ0VUM1cvcW1xaEEyczc5ZWxRTEQzYWI4OHNhMlpS?=
 =?utf-8?B?TzRGOUtpakM5b1FkTHZ3dGJwYnI5QnBiSWhIdGZVb3BPTXJ6eEJta1ZoMlFs?=
 =?utf-8?B?MVNDNUlROGVmcEpjZEpES0toVTRnRHpJRTdEMzZBSjdQTkloSGJhTHBuWGRu?=
 =?utf-8?B?OFJ2K28rY1FRSDdCbEFRMTIwVjdqU3pTV2JML2U1YU54cXh3c2JlczNZWVhG?=
 =?utf-8?B?V2dKc0M4eld1THNacjg5NndJWVNNTDFzWWpWS0NpUHFmbC9XZWUveXA2NnJL?=
 =?utf-8?B?MStPbERHMjdDdUxvQjZ2V1dtcUlZOXFzeW1vM09EQk5NVkI2eVFlVkVGa1Nl?=
 =?utf-8?B?WC9HTTljREx5NTlGclFDMjBiRVpLeURTb2p0a2RwMGdyOWxtdEpJWTlNVVFt?=
 =?utf-8?B?eGpKVUVNQzB2cGp0UENHbkJ4Y3JiNzZzWExqN2R3Rmx3RDlQbDE3ZzBXb1lH?=
 =?utf-8?B?cFZMTFFId0JVc1F3RjI1NXFQQkxkbWZhWEpUYlBmZkE3NkJmNlFZUTlGVFNq?=
 =?utf-8?B?YytNSDRDd05sa0FxUXRWaE5jcjNIVkU5R3dlUm1jRk9kTit1ODJPNEVPcVpo?=
 =?utf-8?B?aUdFZjQ3MnhDcUpBWDVOeEo1bDZWOUJDbHQ3RXhPOXNTMzdBRDU1WjV1TDhs?=
 =?utf-8?B?bUowVGJmMHlaRjFnSzBJVFpJWitwREh0OUIwczVXWEoramxTTWZsSVUzc3pK?=
 =?utf-8?B?aFFWWGY5aWQxakxZZDRiTWhIWWpMcTdkM0c5SlVtcC9rSDFkMnFKazFkbkdT?=
 =?utf-8?B?ZStPZTJXS3FBUVFaUW9EUDB4UmVIaHBiTGR3amdsdnBqNmU3QTJQOVVOZFll?=
 =?utf-8?B?RllSNlFHU29kUnpTbG91SGlHeFcvV3RaQUxKb2JzM25yNUZOcVc3Z1VxYkxW?=
 =?utf-8?B?dEFaL3VSalRSSWplMnJnd1Jwb1FSYnA2ZEcwVW5ETDZ3d1VMTHQrTGV6dEQx?=
 =?utf-8?B?aDBqVUg3SmVsUlg0MmxLQVdQTW5CaFJ0NXdwUkNTbDNXbG5WZGNWa3JWbDlW?=
 =?utf-8?B?c3Ewd0tFSGh1UVFaM3VBaGRtL1RrQXNwQjJWUnQzMWVWaU1PenRQZEplQVR5?=
 =?utf-8?B?cEJtNlVaYnpoL1FjMVdnbWt2MjZsZ1JJeGhBTFUzbFdyVkpVeWRHNHoyRkUw?=
 =?utf-8?B?K2FkZU9PQUQxMXdkSkNKSEkzRWdOTUl6RVhMa2FkUGgxZUZ4MVhFcmlLY2VR?=
 =?utf-8?B?UXlmNzBPRCtGa0dSTkZXTi9kNkYvcFNCdlpYdjljK3lNS1U5QU5DT3BwdFFG?=
 =?utf-8?B?TktDb1UvT0RxZG90RUI3UStXWXU4aW1oYXllUk04WUFMMmgwOE9uSXc5MWx2?=
 =?utf-8?B?a09SWTg5WlcxTHYvbUZpUitQL1ExSmxQdFRUMUZTcE1KeHlYVmxyaVduRG12?=
 =?utf-8?B?dXp3N0ZQUVFxREZWcFVCQVFwZFp5UFo3UFV6U0tuaDJBUVFOQVpLU1lGQkFU?=
 =?utf-8?B?VWFnVFEwTUlULys4RXM0ajg4NFdsQTFkTUZXSEVQeEY2YjNqUkpmcllJY1Rz?=
 =?utf-8?B?QjNIM0hwNVdoSDZsOGpEZ2d4aWk3S3o5ZjNQaEE1OE5UUmd5N0VxL2xUUG9J?=
 =?utf-8?B?OUxmL25CbXhQbW5ydkRUZHA2N1l2WUh0NlBxM2Z5VGZ4cEpDQ1V3SlVORFNM?=
 =?utf-8?B?cHR4UTM0R0FKSUtGanc5SkRVcnVLMVkwVXdKMzk2bU9JOEVwajd1OHpkNllF?=
 =?utf-8?B?YUJmMlRYQlRVcVMyWHZRc2R3RUNpK3FGckJENHJjVXlsY0ZqdlYyNytWeHRj?=
 =?utf-8?B?RTRqZ0M2bnFxaFdZb0l1VWVhcnNuaHg5TTFmR1F0b2R2Nkh1WkFyZ1NFVVZI?=
 =?utf-8?B?bXVRR2FONkRHakxYS2Z4RXk0dGtZeW80bFk5bG9iMW5tSlBIVFpLMjBLNEZX?=
 =?utf-8?B?bzVkU3dydXFhWmk2NiswM1Jhb2xhMTZkMGZaV1ZzZkZTc1lZaVl1YlVydVV4?=
 =?utf-8?B?YWh2NzJ4QUN3MGg4YkRLS3RDVHhqRHlCVmJTWE9DOGQxeU9QSUtqUnJJOWZD?=
 =?utf-8?B?NHJVZVgrSXdyYW9UTW8xQ0o4ejBUa2d3amdiRC9xSHQ5T05JYkhZVkIxRE0v?=
 =?utf-8?B?R1kzMFc1Wk00VnJObXFSSTJUaVg2U1FKMjArSFo1ci9TRHEzVzRiTnplNjk0?=
 =?utf-8?B?NHJnaDk5aUJYUG5BU0ZhNkZOWS9mMFptcEhxSXFaSWNqZ3BFWk0rNmkxLzdP?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b54e63c-9e5c-4f36-2ef1-08dcf72fecd5
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 09:07:19.0128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsJN8X/6+eEtDNP5Ob4qNu7Rgkgyc9en+zOT5YAsH3wQhBC/AP1yvNDMO9TTawNsZRt1sYnxLZCWUL3GKQF67ke9EsOxn6tYQEDXHS7NUwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8304

Hi Neil,
     Based on the current discussion results, GPIO index macro 
definition does not belong to bindings. If so, the pinctrl driver keeps 
the existing architecture, and use numbers instead in dts file.  Or the 
pinctrl driver use bank mode acess, this may not be compatible with 
existing frameworks. This is done by adding of_xlate hook functions in 
pinctrl_chip struct.

What is your advice that I can implement in the next version. Thanks!

On 2024/10/21 23:27, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 21/10/2024 12:38, neil.armstrong@linaro.org wrote:
>>>> ====><=================
>>>> +/* Standard port */
>>>> +#define GPIOB_START        0
>>>> +#define GPIOB_NUM  14
>>>> +
>>>> +#define GPIOD_START        (GPIOB_START + GPIOB_NUM)
>>>> +#define GPIOD_NUM  16
>>>> +
>>>> +#define GPIOE_START        (GPIOD_START + GPIOD_NUM)
>>>> +#define GPIOE_NUM  2
>>>> +
>>>> +#define GPIOT_START        (GPIOE_START + GPIOE_NUM)
>>>> +#define GPIOT_NUM  23
>>>> +
>>>> +#define GPIOX_START        (GPIOT_START + GPIOT_NUM)
>>>> +#define GPIOX_NUM  18
>>>> +
>>>> +#define PERIPHS_PIN_NUM    (GPIOX_START + GPIOX_NUM)
>>>> +
>>>> +/* Aobus port */
>>>> +#define GPIOAO_START       0
>>>> +#define GPIOAO_NUM 7
>>>> +
>>>> +/* It's a special definition, put at the end, just 1 num */
>>>> +#define    GPIO_TEST_N     (GPIOAO_START +  GPIOAO_NUM)
>>>> +#define    AOBUS_PIN_NUM   (GPIO_TEST_N + 1)
>>>> +
>>>> +#define AMLOGIC_GPIO(port, offset) (port##_START + (offset))
>>>> ====><=================
>>>>
>>>> is exactly what rob asked for, and you nacked it.
>>>
>>> No, this is not what was asked, at least according to my understanding.
>>> Number of GPIOs is not an ABI. Neither is their relationship, where one
>>> starts and other ends.
>>
>> I confirm this need some work, but it moved the per-pin define to start
>> and ranges, so what did rob expect ?
>>
>>>
>>> Maybe I missed something, but I could not find any users of these in the
>>> DTS. Look:
>>>
>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/
>>
>> So you want consumers before the bindings ? strange argument
>>
>>>
>>> Where is any of above defines?
>>>
>>> Maybe they will be visible in the consumer code, but I did not imagine
>>> such use. You expect:
>>> reset-gpios = <&ctrl GPIOAO_START 1>???
>>
>> No I expect:
>> reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;
>>
>> but the macro should go along the dts like we did for the reset defines,
>> so perhaps this is the solution ?
> 
> OK, so I said it was not a binding:
> https://lore.kernel.org/all/u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq/
> 
> and you here confirm, if I understood you correctly, that it goes with
> the DTS like reset defines (I assume non-ID like defines?), so also not
> a binding?
> 
> What are we disagreeing with?
> 
> Just to recall, Jerome asked whether you have to now use arbitrary
> numbers in DTS and my answer was: not. It's still the same answer.
> 
> Best regards,
> Krzysztof
> 

