Return-Path: <linux-gpio+bounces-11605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF249A394F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5F41F22AF6
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C8118E76D;
	Fri, 18 Oct 2024 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="V1os2Xb0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021090.outbound.protection.outlook.com [52.101.129.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5C717DE36;
	Fri, 18 Oct 2024 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242082; cv=fail; b=exII/qkr/mEkBuY58perAWKH+3E5BZvFfBfqwaSlnDJQ4/arPxIGUQAtJG89+eU/ySWDBcr6dkBBW90JF4NUOi4j62v1C0LUXd91Hp8DyDJD3hyvM8FXRqklIVhymcIG7g7WjeJtbF4eIjcipkGBb49NUDDTazbuLky2a/WckPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242082; c=relaxed/simple;
	bh=Q3VfvIFHDwIe05+AGCTGmiQu/SetjcxSqF3H62aTryc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LIE3VEVdUHQ8KfZiexo9ALHCarxcnYnRPDRK4si02t5OT+UMmUpJ194pOe2GJ6ZtNYwmZQpLyeDCZmoNuXpjfzBhaxM2PAZmxVuvKIV3e4z0m0CokbcXl3x+UWXKz76w5/p01qDUrSNtenUfc9HkktBlSiLD8lkkXXhxH1Io5aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=V1os2Xb0; arc=fail smtp.client-ip=52.101.129.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7UzuU/HpJlBbub8qgyMQL+zMs+ihEoW1GKS3NP0zgHhbvFVJzsrqXrx+VGY52XyDrORw+3Hz+fLL49/A0JAKh8QfGe9xJws1Rhvun7MpGwu/u7AspenEKotb5CJn5sXXPYnezHCO3EzuOqPZQq0iGPbmTGtnuYv1I3bDF0PIC6KHFQ8sG6j6SiM8EywWv68P78uZ9bBKWTyJ802q5J/hI80JrIMUMkVyhg5RHsRZJr3Inp0O/hZ7yRXBHLSBBimEYveph0GIbjn2uRjCgVDrFyvNyL1MUCNML2b6uejEb33L2OrnkuZB0l0jVkhxMs3TSb9fBxL9ifhKc1G7Z8E6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1LJVFrOqcPILCT6sjHeSxmwy/u737PreSVt87u4+zw=;
 b=xc5wlF5sAozbFkTgs6z9v4ioWp/Vjfh/zbkjJKAWgrUi0jep3lsfMDSXoAJpgiw4Gv8EALryU5WQxzwvwA+4A90QBW7SmI2ibyUuffb/7Yf6T4RlBa8AvmJGnQD2GKDR/xU4SPxcPuH0oZ7hXLhe0UOT/S17dPZr2sycLTPn1OmuPfQtHYbLJ5M9rdpxVFKQZ+K2whWBK2TC4iWiy3piW1+EJHQOma+yQIMfQY59Ng+MAvfbOSmtK8VTnRiGUwQOy6UX/LBFYmkRDHkMEshcCgRFfcU+keFeeIqildPvfbtJTFM+o76dJZ8S2+/6BjIXsQEbRF1V4B2N0+w/ZKYpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1LJVFrOqcPILCT6sjHeSxmwy/u737PreSVt87u4+zw=;
 b=V1os2Xb0gWodhc19M/CLpfGsJhXDIGXMbEHx1Ud/cvuIHbybLYsUMml6DTVpRiRgMMcdBHFBThUXRxX1EUfVmqx15yzBk/CHF4BX+Ly3u84cTdGK/YeRf3sybo8yfX7jsIcidqfJBZx5dzwvGLpJZc6GjAg36lAv8Jm0q49/ZY2I1kTQIue/sAIGprnhUEJIEB4M6rvsCybGUcS8TxpD6dYkUB0uFYC5+Sl1OoH7QMIwFZlbM4TIpaje9iZ1m7upsg2xYH92vuPkvLeJzcz/+16VN7B0bpd0Ab8DDCHZuc/yXdKAWOtF5MEDnnvoMXE2BwhkBEYU/HOwiKbujdZxZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB7283.apcprd03.prod.outlook.com (2603:1096:400:21c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 09:01:15 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 09:01:14 +0000
Message-ID: <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
Date: Fri, 18 Oct 2024 17:01:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0063.apcprd02.prod.outlook.com
 (2603:1096:4:54::27) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 69903e62-f186-447e-bdb7-08dcef536b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzlQR05IQURNc1kyTlZDcVhaVVZOVGI5Y2NaRzFPenBPQ2VsRWpiSTkzRkJX?=
 =?utf-8?B?QjkwVWtvTVNTUkFpeU1Tc3lPTnBvdDdETzJ3Ym1XSUJlVGJMUGlva05XVlRN?=
 =?utf-8?B?V1M3Y2tjdWplVHFSSGxudkFSVzhlaG9INGJmZDVHUFg5Uk9xMlk0NUxBMVVw?=
 =?utf-8?B?UmhLSUY3Wkp6YzFSZVVzbFpEVTV2Vm51YzV5VHZ6a2ZCWUNDNjlpS1dhaU9Z?=
 =?utf-8?B?U3Qrc28zdGdqYkViUUdvUjhzTnBFK0tET3RtdVdwcFVPYi9yRjZSblZ6cXlk?=
 =?utf-8?B?Y2I1REZxMXJXeTRqNkdsT0ZrejhSblAvWmRCeEgrVTcxakhLaStEVHFhZWFP?=
 =?utf-8?B?N3d5MFVucFJTMHdXTVkvczFnSno5SnFHVTBXM0hpVW1lWURCNEs3K21DZGVO?=
 =?utf-8?B?TzFLb3k3czhYYWtZWmQ3ejJjN3VTU2lKUCsySFBqVmpwS2hDaVNTUC9JWnpL?=
 =?utf-8?B?MTF3YTAzQi91cUFlUnJjQlJEMFN0MFZJN3Z0NEtkcEdOVHkxOVh6UkFLbUR3?=
 =?utf-8?B?a0dTQUtId1I0R255MkNmWlQvaG5SS3czWGJ0RTVOZ094MXVlVndveERkdmdw?=
 =?utf-8?B?bzBvTHJHYnd1VUFjL2h6SEVGb1hxa1gxblo0L2IvSU9IeVh2SkJyK2FST3lC?=
 =?utf-8?B?Rmw4MDRxY1BEWmRIVnc5d3ZoTzJ4aGpmbmdaa3h0S3lXaHFBdE0zekxZQVRv?=
 =?utf-8?B?NUxIQlE5aUU2MTV1YnNaYURJV0J5RWRiUXRJYUFLSit4cWNEZDMzUmFZRVpN?=
 =?utf-8?B?Mzh5L2NGbEN1QXVPMXdLT0ovWE5Wd3ptUkFMdVkvUmIrK1hhNFRiVlB2Y2Jy?=
 =?utf-8?B?Zyt6ZVlqWC85K2w2QmZBNEt6RW9pN3hWRTB2elJBU0VsbW8yS0tvSzg0UTdv?=
 =?utf-8?B?ZFlGU2RBRm90dEMxTERmTW5hWXdzNkg2ZnpsZWtVYUIzZDk3M0xUQ05kdC9z?=
 =?utf-8?B?TElyeDZuMFhSY3RTWUVzcnBpQ3hwTzVzWkxKV3UvU1h4aWhWODJuTkVDTTlW?=
 =?utf-8?B?akY1S2lwRm56MTdCb3ppSG5zbFVKVHVkM0dYUzBpTVNsYUgrNlo5Rkp6WW1P?=
 =?utf-8?B?SmNXWGg2OGxKZTZLcFk4UVNpY0xBcWtTK2xvelJVT3BVbTR6ZkpwR3dwd1Ev?=
 =?utf-8?B?ZjRMTVREWHEza1ZZMnNkbTcyWWFmaDdCTnN1R1NIM3dJanM2czhLbjZyVlg0?=
 =?utf-8?B?R094eFlYOVJQV3VMdTJFOWQzU01qUWt0VDZiZVpnTStoL2o1bU1hRU1yOUFT?=
 =?utf-8?B?NWE0OE5TN2pKdUg1YVNXcmFqOC90OFdQTUdVUElkc1FkRTV6M3ZJZGROV1RY?=
 =?utf-8?B?YTZuUDdRZG5nazNGSGdkMWVQOTljeUVpQ0lFL0pMVlBiZG5yU0Y1Rm50b0t6?=
 =?utf-8?B?T3NHOTl1NGpySUl4eVpOV2NGcGZhT3RaM2RFYVVBSWtQMUd3K05OWGxMcVhl?=
 =?utf-8?B?c1dDRnp0S2tZSFpkaXE2U2ZCVVcwNitydFhLL0gzSlpXYTFpalRrZUtwbFBr?=
 =?utf-8?B?QjEyeTVFWkpDR3N1RG0zZU0xV3ppcUoyTUhwdjhmckh1bVhxQWFQM3FFVUhF?=
 =?utf-8?B?Z3pmU01oRkx6NmRmUUhleUkwOG9VZTVCWkUzaWtuMG9FSU1obFVJalZqRDBU?=
 =?utf-8?B?eWZ5V0dNUG1vdVArcXl2SEZVaHZ2ZHBLbXA3aDlqdE1ZMnI2SVdFaVl1N29T?=
 =?utf-8?B?WU5qQzh3TGtubjdsdS9OeEI2TWxmcTYzMkxJMmtGa1liSTJkcWU0RDdzc05s?=
 =?utf-8?Q?fLuujbG30r2gOHHl4pPfxdET6K3VEXh/9YlamvY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enpBcmZuTXFWdDVJcFo4QmIwOHhZdk9jNjQ1ZHJwaFNFdW1lMThaSmQ2TDdV?=
 =?utf-8?B?Q2YwYkJNWlhCeHcybmpQYXE1UUxYb0c2Vlo0M21HSEdqdlRDK014OE9oU0Ex?=
 =?utf-8?B?bTRuZFdxUDhRa1REajg5MmVmdFFLOGhwTDJHcjdXWFRDenlBNFcyQjR0Y2l6?=
 =?utf-8?B?VERhRFdHbGFWcVJ2RllSWS9FU0ZydE13ZGwrdlVKNTBFR094RG85d2VEaUFI?=
 =?utf-8?B?R3FQK014QTlzUVRoait4R0ZybVVyUzlQNWVyNGlpRTE2OTRzS2RjZ1pJUEFS?=
 =?utf-8?B?MlIrUldvZ3E3MzVnVElrOHA4c0V5TjZGYXFKQWsxWEpaa3BRTlZkRVlzWVZQ?=
 =?utf-8?B?cGlxMVY2d1dQcytlVjZ6Rkx4UHFPNWZUZU8xOFVxUlBLblFPK2FEQzltZktn?=
 =?utf-8?B?LzdUVVlqMTZTUjdlUUFGU3lSL1B0Z0U4eHQveFhiY0U4WWlpRGsxV2VGUEk5?=
 =?utf-8?B?L3JBSnh1Z2RzZE41NUpnOFQraWtBb0RPaGZ2MDFTVXliQjRmS1VUR3IyeG5r?=
 =?utf-8?B?SjNrcHVxZWY4eGpBNlBWbDNBREZiR0QvdmVJSUFBMXl2Y01Ba0NVVHlNVmxq?=
 =?utf-8?B?c2Z4VEEwdEdWaFJlTVdjbGlxZ0lMRkpEQ1hDSHNkaFVIMkNnOGx1WVo2OTYx?=
 =?utf-8?B?SGdjdlFENEJuUklaZEk4dmI5N3Q4c2dLajZmNWtRQURBeVJlMjZZZWNmaDVj?=
 =?utf-8?B?a3RuZEM3UlZEN0N2WkZhcTFyMmNlK3kyMGlIZVpSUHVTWXlkUHFjMG9PQTVX?=
 =?utf-8?B?RVh4ZnlDVDhFdkVMMENVZHhYOGZKVkwrNTRFSU5oN09LZVRmaWxvR3habDBw?=
 =?utf-8?B?RXFuTmExR1FEa29EZE9NenAvRDA4NVpaNTcwUG10UmhiL29za3lQb0tjYS9t?=
 =?utf-8?B?QUd3ZVBSVHBJSHVuUFVYZURxSzFhcDNsUW8weVAyL0VMMmFza3dPRFRrbWZZ?=
 =?utf-8?B?eXd4cVdWL1o0dUpWaDBUWmo1QlNXVm11akxwNGNaemdLakpWQ1lZUVN4SmdG?=
 =?utf-8?B?eGxJKzJjeUU1NzBzMnFScEVYZFBVMEsvWVljTkNYdXlYTm1TZXVsZDhMcTdD?=
 =?utf-8?B?dHdQc1dBemRhbTM4UUV3RGNsK3JvNGVyK0hMYWkwbHRKUHRvWDYwcUJsK3Zt?=
 =?utf-8?B?eEhQTFhVMVB2RVhaTFhXeDBKTmk5bHp5WEQyR2hqdlZSY21WbTJLRFRXYU14?=
 =?utf-8?B?VEhqMWkrRXFHemZTRXp0WG1HMUh6TUoyM2NUS25kZE94eU1WWW0vTnhPL1VW?=
 =?utf-8?B?OUNIQ3lBaTkrVHBXWFptZTU4UGFwZWZuU3BQV1dKK2NQZEY1NzgxTVZTdGJy?=
 =?utf-8?B?Z0wrenFld2hNMy8vOVRVdVlmVkc5Q1dFQk5OWis1VmRxUmd2dUc4a0FtTVlt?=
 =?utf-8?B?YTdZbDFnaUVSRnBmaXBhUk8xSmVsaS9NVVNXS1hONmErc0dvdWdmNXJvaVMv?=
 =?utf-8?B?bnJZMExCd0NZK1hONXhjVCtZTU8rN1VLSE1LMHZ0YlZMZG5BbFRCcm52dU1a?=
 =?utf-8?B?K0NOYlJBN1BKOE85SlBSaWpMaHZIMGFFTjNELzl5NEM0c0l3VlcwbWJIT1Jl?=
 =?utf-8?B?R2laeXg2N3pKY0FZVEVYWk0zVWhOOEZneWl6allTYk9ncXFxNVEzTUcvMEpr?=
 =?utf-8?B?dTlVMzdhUmM3NG8rcGVhRUtVdGNaa3l0RnZ4U1BEd2VJOW9tN1R5ODNIczVo?=
 =?utf-8?B?c0ZQNlRaUGJhTXdqbnAxTzAxQWlKWUlZdG42MkxWaWpyMlF3RDhyOHFwWENr?=
 =?utf-8?B?UVFlV2YvaEtqY2grd2I5dEVvZ2FzRnlPZXJoMFNrNUR3M1QwSjMxcjZ4VlBn?=
 =?utf-8?B?SWgvMG1raTJlWXpSTk1rYzV6ajA2YVBVTC9ENnFMKzh0OGtjTWRGeEtUajZS?=
 =?utf-8?B?WVZCZjFzT0ZPRHdQV0hIaTcxT3NOaW1TQWJsWXY2c1gwUmhzVDhTRm9qUnlM?=
 =?utf-8?B?OURmZzZ2aURDR3RyT1JKa3gzZ1hWQnJBRVB6Q3ZXZG9UcWxIZ25NQ1Jacm8w?=
 =?utf-8?B?WXEzY3BxeDl6eVVzUStSNXZDSzFXMVkyVFJNNmtRNDVjTHBDb295WkNkSGZQ?=
 =?utf-8?B?ZWJ3cG9yaUR5M2VncUVtemVLZTE2b3dSYUh6ZXQ2QnZHc0tZK0l3Z0FEVTJO?=
 =?utf-8?B?NFNHb3NsRXF0QUg1MlRIbGp0dmZjT2Z5QTZqQy9ManY3WnJTS2lSQUJWOW9N?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69903e62-f186-447e-bdb7-08dcef536b75
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 09:01:14.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVi5FB4wyvplmxaQhZAi8EGU46zEJK74arK9NKpDNoTd5TTVQRZvsjuQJDaVh7ECKTxpCImkmg4IF6DOZZPG7Ha3pxvTJVYey4PENEKm5GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7283

Hi Jerome,
    Thanks for your reply.

On 2024/10/18 16:39, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>> a new dt-binding header file which document the detail pin names.
> 
> the change does not do what is described here. At least the description
> needs updating.
> 

Will do.

> So if the pin definition is now in the driver, does it mean that pins have
> to be referenced in DT directly using the made up numbers that are
> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
> 

Yes.

> If that's case, it does not look very easy a read.
> 

It does happen. The pin definition does not fall under the category of 
binding.

https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/

>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Best regards,
>> Krzysztof
> 
> --
> Jerome

