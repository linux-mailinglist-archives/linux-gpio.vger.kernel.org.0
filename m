Return-Path: <linux-gpio+bounces-2243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EB82DD2B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 17:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B482FB20EE5
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 16:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25865179B0;
	Mon, 15 Jan 2024 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="Nd7bCZlA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCECC17BA0
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169]) by mx-outbound47-237.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 15 Jan 2024 16:16:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogq/ByNMCyt2HNuOPb7dbXTyzESOA2aa5Kn8YB3hTMmbmDlkyZ51yhEUFLL6QOjoCzqJyT+yRj11VSJe37TddEtGchaYtguACi4h3CYu9kz9nof7nJKnUFTrxWquFAdy9Ir3RTsevJVzIWSyUtUMIYHhcJMlXrh62ooTCqMB9tsbW2SJ5vq/GcmRUXgm9T+SaswV/OqvLvgdvAs68HbJSOSMqyWuF/8umHzDJJzkgkaw0/quekxrhF1RtVSFrnjts0SFuKqLvwVpRcAjZ3s6MF1AZYIGS2wnrdcZjRgW2+zGE3nc0lD34VR4Crq7YNekej+kdvu8UHMMJwXCLFKD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynbBeumhHlsCUqbQe3XbdxRK4rRMJZdK5vdLWlGfVkg=;
 b=ctCjj1dZWM/D1DOdFO/zpS64U0Dqk+AoFcuhs5rBgwtMI1nGAmLgMGQBttczm+b0tinFn3dSwsHif2ioEY2fMUqkaHXhVdgSBAdis9Bdr0ggWIefOSSwrfjLs66K9i16Xgqt97XsvGDNKom9wCiwZijMN2uABAXepJk0hppcclHEhgL0SWKpiIIbKaxoDuR0P+UEIOEgPuG9kJNK07OrxaK0nQk0M2pv5zyBL6B6ZseZnGhrInNSDs0SNBUNZo+nnW41knmOGaahmyVIOnFN0yNlsremxHhi6Lf2+Z4466ftCNjQAQrhH+ASi3zZi9ULPnWh/kEcdK35U4I8FSYLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynbBeumhHlsCUqbQe3XbdxRK4rRMJZdK5vdLWlGfVkg=;
 b=Nd7bCZlAinPd0NCcKF/8Tt8rqmz14yNthKrNGDXVhPDjIhBdukp8URl8IkyuXRmulFU1BUbXd/6kIYnB7H7bGDrJlOf3nnoVSj3UtQ/J9EnQdo5ANjhY9jUO/G3z0+qpjltx/AZdZKgVQyummuxOjyayVq5w71Yr6H9Fou5M9/YkHodSsXM6RfWxyt6XH2CjRBJ1meFgGgdTa9O2Bh6tXahtl5GYqt9aNJPV8KKtqQVQaDHzrToEa4ZyuhIzXtujFuTSoQzE/FhASVDm3w1YOAUuK9idD1+fUtf9IEmy6ndm6nZwv5s5tZtw25RRn1lK6QaE3pKM+JIpCbD78nNkKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by DS7PR10MB5085.namprd10.prod.outlook.com (2603:10b6:5:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Mon, 15 Jan
 2024 15:41:41 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7%7]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 15:41:41 +0000
Message-ID: <3a24cb45-9fa1-424c-86c1-0c9e64eaa407@digi.com>
Date: Mon, 15 Jan 2024 16:41:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: imx93: specify available 'ngpios' per
 GPIO port
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org
Cc: stefan@agner.ch, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 peng.fan@nxp.com, haibo.chen@nxp.com
References: <20240115131605.395691-1-hector.palacios@digi.com>
 <20240115131605.395691-3-hector.palacios@digi.com>
 <2919725.e9J7NaK4W3@steina-w>
From: Hector Palacios <hector.palacios@digi.com>
Organization: Digi
In-Reply-To: <2919725.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0105.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::34) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|DS7PR10MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1e1147-9e2a-4414-9a74-08dc15e077ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fWI5/K0h8gbQNwAP0OSrj5n3uY2ruvisofPxvSkr864SS7rAwSywoQ9M6U7Ej7tklMvFkc4SIPAoCPzQxfNERIz4JREZ24hSvC65WcihE33u+jWQMCpj/tdC2bM82CledH7qJT5wZ6dXRuYLJ69nA2CytMtWTL7qiWeTAF1rThbLuTq3vEvegMQDoZo4ee48ycCGAGxE4/F48Y66Z9iOz80lK1w2nUYRu6kg6suCwFNuY19Zhi9eV3eaELmt5O8bddkxvmHVW7sJw/21nWVABBaNjhubXUrHO3M0vey11hIqBhuxEe5TPbx/91HTbyB092PJCNb4UkJUVL+iSFKPXE2HAbd+QVblDlkeyW7EtlFURM8AkW5of4UQpSjxgCwztbTVtodIS804Ra3Ov9hcIwOXSjZWqPuzc/XFrWsQVtZkh/Rdqw6UtJFj9FRE0STvQo8XQ3g7ysVdTvNOdedzSJSTUuCPz/g4uNGCHXgL+fVQ6HP8PbnwcYgSb0t/V+OihxevZmkcQpHiUptf1eaYHKXmBuGiC2SjdjDfdCo+TFeHEF98mOzuk6LTJRYcljeHpktYndrX1M3B3ML1BXD51KrW9XnJNCW0o9bmi4I7nTe1CdKTP1SNdL7pTdJkwoqZIeyuLsXSxFtUybjyyl86FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39850400004)(396003)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(36756003)(31686004)(86362001)(31696002)(66574015)(26005)(2616005)(83380400001)(6512007)(66476007)(6486002)(66946007)(36916002)(8936002)(8676002)(478600001)(6666004)(6506007)(53546011)(66556008)(316002)(41300700001)(44832011)(5660300002)(4326008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnhQVC8wQUYzaXF4UTJ6bzdMV28yQmR6cVh2cnBQVWdqWnBRTFVPN0gvTkxx?=
 =?utf-8?B?bzhrcnJURW9RNEFWcGNJd2dMYjhJWUJ0aWxOVmtCdkowUjZYV0NIMUlkd1U4?=
 =?utf-8?B?M0VFa3FhWjBPeVpkMkhicm1VNzh5eXNYY1J2UW55MWNlZmdWVW9GU2puYktN?=
 =?utf-8?B?OXh4ZGJuQzlWM2ppbzlhMnJhbERMb0pPYU9Nd2U2WGx0S3Qva05KeUtCTGV6?=
 =?utf-8?B?dXZCYjUvMlRiRXBVcGlNYVZvZ3JWTklJV0g1VFROYk5qYm5zb0Z4ZjY1OGpM?=
 =?utf-8?B?a1dzejJ4MDJCZXNOTlU4cHBOUVpaWTRJTzhVLzZlVVdWSy9HYWYyOVVLSytW?=
 =?utf-8?B?bklpNnF2Z3h5cFRnRFhVT2J4S053QXBwSW1GbXVIbkR3Z1MwOU1MUS84WENE?=
 =?utf-8?B?NTlaU2E0aDIwMjZLQ25YTUZaQzA5T1B3a2pDYVdoazc5dU1xMnpabjA4ODE3?=
 =?utf-8?B?R01vSEdvaFBETG9ucStsTUFNOEs1QUhHTFd0SzJMc01SK1NFOVFobTNmMWND?=
 =?utf-8?B?L2tGdDE2K1pUemF5TEdhUXZxU2hLMGdvWDZCS2hHVC9mQllVOUlHbmNiUGJK?=
 =?utf-8?B?MWZwZ0tkb2svb0pwSThVZFdqcWlNVy9odEdEdXN4WjJmdDRGak8rY1Y3bGhJ?=
 =?utf-8?B?WWhOZ1hwSHBzMVM1Q0ZGUTNGTE52Kys2a1lyZThaRS9IU2FBVlZndUtncGFy?=
 =?utf-8?B?VEl5TStkQ1p4N1EvZnVGRmEvMUdBNEVpUUNUM1d6NDRSQ0I4Smw0Lzk5V0xm?=
 =?utf-8?B?R1UyRHVoZGd3eXI0WmpFeG1ITDJaT08zeG5qaVpPVEhZS0JSWkxzZ2FCVGU5?=
 =?utf-8?B?enp5aVRZZXhva2pTR2VDRENTWStUTTgyWVUzWmdyM2Vpd0FMODJ0WXJnTUdE?=
 =?utf-8?B?aXFxUWkwcFoyVnNoN2ZudG5XNmUvS1lMcFN5R3hIZ04yQ0M5R0V2cUJsWFR1?=
 =?utf-8?B?U0k5OXV3MDdmZFN6VGVjQ3V3c1IrWFpmYjRCMTdGaGptblBzQSt3OTczcmM2?=
 =?utf-8?B?R1pWVWs5dllpQnRZL1E4NEpIU3hvUVZLemRjb1JubFFLUWl4YmxoUEJjQ0JJ?=
 =?utf-8?B?WEo3UmRLWmpiOXdtTjNDTTNhREMrUTB4aElXSEVFTFM1TVpnWmQ2dExCVkkw?=
 =?utf-8?B?ZlJ6V1IwcmNBbGJrTmFxLzJyOVJRc2dZdjFIK1I2akRXUkdlekw2WG1tUXVu?=
 =?utf-8?B?Y1EwS1h2c0V4SXlTZy9rbG1BMjFuT2lobDBjckNPQWsxT3B6YW4xajg2QmFo?=
 =?utf-8?B?SE5nOXRKR0JEZmhXcnp3NWQwZTRSbnEvOW1TeWhlNGdLdWxJUXJua05DSWY0?=
 =?utf-8?B?cTlUVDBHNDNGTmMzRTRuY0grSzZoTFpwa0IzSkVISVd4WVcwaWN3aGM1SUxQ?=
 =?utf-8?B?RXpZZGcyZk4zdERrMmdzY2pZZE9IRWFEbzA4WmZ2TElOU09QWU42YVNONXk4?=
 =?utf-8?B?NkNrYUU0Y0hCRndVcEFuNFZnR3o1ZWs3VzJQdFBneUxvNlNGc0NVWXlBbFVm?=
 =?utf-8?B?c0ppdUZrRjVyS3lDa2RVcWU2U1RBNGxrQXZYbkJSNjI5SmZENnFvWDBiczNp?=
 =?utf-8?B?em9WK1hKWTFyMEgyY2E0RDVpUXVrVENRNVlaNGo4QldMZTFiSmdGUTVUTHBo?=
 =?utf-8?B?K0NkbEcrQVBPd2JVaWczUkhzRjV1OFEzV0VPczZaK1U5SnNFQm54TkhWSHJq?=
 =?utf-8?B?WHVDK0lKK1Q4RkoybTJWMnYzWHdaZFVVSW96dGlrcHR4czgzbjEwcVNtUW5j?=
 =?utf-8?B?Q05MU2hpMmFxN0VOdnFJTDlaT2JuZ2dDYjNmOS96WVk1bUtsWllUR1V0V0JS?=
 =?utf-8?B?ckdxYnJGTnduN1VQWXhZbkF5VkgyUlQ3VnhYWmMrZmlGNUlpR3RmbG82ZHhB?=
 =?utf-8?B?aTFPZTRubE9pbXhVSGkzcElNQS9ycExtNHpadXpSZXZRZkZTQXZ6RUduVGhY?=
 =?utf-8?B?azdPOUx3MmlpZjVGcEpnMmFYM2V1bDk0N2t1RG8zUXVDa2NOczJXZkZOS0Vv?=
 =?utf-8?B?aUF5MUIrVzZkOFh0YVZlY1pHZjVwc1p6UDluWmQ2SEJyTW1UL3FhUS9MQXIr?=
 =?utf-8?B?c0ludzNOcDloeC8zRy9oWWg3bFVOdVo0MjVHT3cxM2ZtUkV4eFVBTmZ5bUdK?=
 =?utf-8?Q?KHwFVCeSVVoqZbPLd9dzIvDz2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1e1147-9e2a-4414-9a74-08dc15e077ec
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 15:41:41.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwuLkm9Jp9tbDFLIHXCGYV/uc0Q8koEiQPtws96k/xsrU8kyvJHaz33BlpbMCALvcKhx+goJwumd3bbETBSpkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5085
X-OriginatorOrg: digi.com
X-BESS-ID: 1705335368-112269-9934-2867-1
X-BESS-VER: 2019.1_20240103.1634
X-BESS-Apparent-Source-IP: 104.47.57.169
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVkaWRhZAVgZQMM3ILC3RyDAlMS
	kl1SI12SAtzcTEwtIs2TTR2CglzcxYqTYWAI9RpwhBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253537 [from 
	cloudscan20-131.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

Hi Alexander,

On 1/15/24 14:30, Alexander Stein wrote:
> Hi Hector,
> 
> thanks for the patch.
> 
> Am Montag, 15. Januar 2024, 14:16:05 CET schrieb Hector Palacios:
>> According to NXP HRM for i.MX93, the following GPIO pins are available:
>> - GPIO1: 16 pins (0..15)
> 
> Mh, RM Rev4 (12/2023) says:
>>   Bit[31:17] should be Reserved for GPIO1
> 
> So GPIO1 has the range 0..16
> 
>> - GPIO2: 30 pins (0..29)
>> - GPIO3: 32 pins (0..31)
>> - GPIO4: 30 pins (0..29)
> 
> RM Rev4 (12/2023) says:
>> Bit[31:28] should be Reserved for GPIO4
> 
> So GPIO4 would be the range 0..27
> 
> Where did you get your numbers from?

I also saw what you point out about the HRM but when cross-checking with 
the IOMUXC topic (Chapter 27) to verify what pads can work as GPIO for 
each of the ports, I found you can configure pads for
- GPIO1_IO00..GPIO1_IO15
- GPIO2_IO00..GPIO2_IO29
- GPIO3_IO00..GPIO3_IO31
- GPIO4_IO00..GPIO4_IO29

which doesn't exactly match the note about the reserved bits.
I consider the IOMUXC topic more reliable but it would definitely be 
better if someone from NXP could clarify.

Regards
-- 
Héctor Palacios

> 
>>
>> Signed-off-by: Hector Palacios <hector.palacios@digi.com>
>> ---
>>   arch/arm64/boot/dts/freescale/imx93.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
>> b/arch/arm64/boot/dts/freescale/imx93.dtsi index 34c0540276d1..7eb2cab7c749
>> 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
>> @@ -970,6 +970,7 @@ gpio2: gpio@43810000 {
>>                                 <&clk IMX93_CLK_GPIO2_GATE>;
>>                        clock-names = "gpio", "port";
>>                        gpio-ranges = <&iomuxc 0 4 30>;
>> +                     ngpios = <30>;
>>                };
>>
>>                gpio3: gpio@43820000 {
>> @@ -986,6 +987,7 @@ gpio3: gpio@43820000 {
>>                        clock-names = "gpio", "port";
>>                        gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66
> 18>,
>>                                      <&iomuxc 26 34 2>, <&iomuxc 28 0
> 4>;
>> +                     ngpios = <32>;
>>                };
>>
>>                gpio4: gpio@43830000 {
>> @@ -1001,6 +1003,7 @@ gpio4: gpio@43830000 {
>>                                 <&clk IMX93_CLK_GPIO4_GATE>;
>>                        clock-names = "gpio", "port";
>>                        gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36
> 2>;
>> +                     ngpios = <30>;
>>                };
>>
>>                gpio1: gpio@47400000 {
>> @@ -1016,6 +1019,7 @@ gpio1: gpio@47400000 {
>>                                 <&clk IMX93_CLK_GPIO1_GATE>;
>>                        clock-names = "gpio", "port";
>>                        gpio-ranges = <&iomuxc 0 92 16>;
>> +                     ngpios = <16>;
>>                };
>>
>>                ocotp: efuse@47510000 {
> 


