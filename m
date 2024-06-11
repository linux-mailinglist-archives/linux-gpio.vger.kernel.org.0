Return-Path: <linux-gpio+bounces-7342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19C9033B2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B593228F737
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 07:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9196172BB2;
	Tue, 11 Jun 2024 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mEkR7rMN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E589172BAF;
	Tue, 11 Jun 2024 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091061; cv=fail; b=unQvqErJlw713EhBtlSKbaaX7dXK8mZBkX/aJsSV4Fmq2b2xBd8fxrYmqr3xq19EcDnsmBm3gnIK5krbt7Ltvf8PodzVkegaY4TPkB5Dhtnbk9KGEmxcMlS0H+EB751WeN52o8v+931zbj2PexNddL8NUSVpoNqXcn5odkUPRMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091061; c=relaxed/simple;
	bh=R6sjNI26weJDqe5cKPaJkEYexBRB6dWgzNS+vc/4Jcc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CIvw4d+nMfr/LIsZz3Ewi7hJinPctNT4CeLKx09e8geworA33vhqbKzrmyGcqdsCA5+1due/BB2mssNcAljzUp0MgVZLFCeIXKRJr4ghkihbFdlugvlliKmmWTphDlAArdxCP47kTZFleghly60dEyLrekezpKPuL/iYBxGuO00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mEkR7rMN; arc=fail smtp.client-ip=40.107.220.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZN75OIeNDYCQ+Q7flba0SPenS2N1augvJTB+j3cZnfHZ6eaotviH1FmZs3BYsbvhdznBSpIBCPODYPXttXr1rlRWbfm8xNLkYMhcjWhXsUnSz588yP91Id0x6VZOvtIxE+3UK3tLCISEGBbcQxPCIWie/R0kS+u25bCC4qmM+CwZSFokGQcI/UUMOKVejyZXEuba7UXhGF/9kzSknkENfCMqp8BkYn9SklEjhBdFKmm/ZvSB3smjOYwL8rqCcrIR6806lx6MGcwqPgpERDwrpVEp2CViSZab9ZYGatk/u9TkM6pDZJqt2YSatRHRmA1gkuFpE5EZ7leKy6xK2FXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pjUcWOV1ndNKzB7EXmqJPecM32yzhK4Dw9v7EMm+pQ=;
 b=OWuKP66poMSn7/5KnL2hvjot0P6aBsK6zzl7ebOLnvJL00ND7bW3039rBazjd6L7Rx2cR/3kd0Iom/oJGu7vuHg3MFoXg5PT7/Tl+5ry2QCN+Q9jHpV1dS+kkoCVJC6VgDgDOUO+ittKelmAlbQCAK+cxwScFNUwQzCfWkuCLKDWSu0HIsh0L8TDl2c9DlfT1HX4UQ6bFyTU2DGrqkaVWaYSNwuqQ3TMvtY9h0S8MB21H1jWHa03Rr525u6v7TxWC8i4KpIRK6nrvb2iGArm7/ZLNQs8UTrFgPrcb7SwD6eyQ2x+uU3kGmwzxTjIaonoLX9L6TxtWehZ1zCYPUfMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pjUcWOV1ndNKzB7EXmqJPecM32yzhK4Dw9v7EMm+pQ=;
 b=mEkR7rMNmqhwLtm9pnvOK/YwzGeqH1+nFW8jXkRN8f3sDTQJl6pqSn2Xr+INP6lFmaPxMhxs01sup/n+JWCdnCE9nOVAIe+cKeJIV/cqym0ut3KLUiUSGDRi5p2hquxVZ1JAQ5T31mWwheDX+vmB5deZylP00b8FKoZUMlXWsZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 07:30:58 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 07:30:58 +0000
Message-ID: <0c244236-8bfb-4349-828e-0774091eda99@amd.com>
Date: Tue, 11 Jun 2024 09:30:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] pinctrl: zynqmp: Support muxing individual pins
To: Sean Anderson <sean.anderson@linux.dev>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20240610223550.2449230-1-sean.anderson@linux.dev>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240610223550.2449230-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0093.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::46) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8f06d1-cc33-4e01-d0d0-08dc89e86f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnQ1RXJsbUR2UDY4a2gwbzRlT3dXWEtVS0MzNmREU1JyOGJvS3p2eXFFSGVY?=
 =?utf-8?B?NGVlVGtlSDJLNlhYQUxvazNvSVd3Zk5oakhTK1lVTXNrRjVHaENUaTlyeWM5?=
 =?utf-8?B?MTBQVEExWktlK0UwNUw3RUZhbDU0M245alJpUGl5Y0N5bW5CQkFKN05jem41?=
 =?utf-8?B?c1R3SSsrNVVJcUtWTlZlWWgwN01HM2hDd1FYekZCbU90STRsQzk2M2s1cWVZ?=
 =?utf-8?B?TlVVUlZnWUYzRlZBcEJQb2U0MVVuL2V6dHpxUXA0eFRFWTBmSDhONGh0Mit3?=
 =?utf-8?B?VlpoaDhnNzRaTjdXTkRFaXhNajRrYWlkYkJYSnJuODUrYW54dDcwZitEdlVI?=
 =?utf-8?B?MXl0ODc3Tzdlc1ZiQWFGY2xJaU5kaDNtSDNiNVUvRVZhQjRjaGUvRlMxSER1?=
 =?utf-8?B?SmxiaUswZW5BdFNJbStxYXJpNmJzcDd4YnR1YkpSM0VrZVRlK2h5K0tSb2FQ?=
 =?utf-8?B?R0FrRDcvb3NwVExDTnBxRkh5MkF0MVlkT2xJTEFKVlBCN1YraVFaNUNibmUy?=
 =?utf-8?B?bWdBQlZ5ZHJETk9CU0owaEFxN0tPaUdjWEVxMTBaODNUSzhVY1NZUmZ0dFB6?=
 =?utf-8?B?YjEzTWVRR2dhMFV1UERKNnByQUdLbjhpNGM2S3FiTnljR0gwYUxOV3VjVXp3?=
 =?utf-8?B?Ykc1LzM3MHBTYjRXYnE1aUl5NlFiSXdCVEJaeHhCTldvSmh6WS9ITFQ2Z1lF?=
 =?utf-8?B?V1gydzloSUxlNGRIbU1jbHFlelZSbjVqRzE5UEhqWlFDRFhQeno0b2dOV3oy?=
 =?utf-8?B?NTNWUDBFdFRQZVE0bXF2WXVTTDVpUUxjaEUzWGpUOUFpeEVpalNSazdibUYw?=
 =?utf-8?B?U09jMkF0djUraHcxNWg5MUhMaGZjSU4vSHJjNUZTZmlob3I4VVJ0MlJJNGJo?=
 =?utf-8?B?aEZYWUNKNjZOcS9FelhrWGY0OHhqNmVRcXg3dnhBaWtTejhxNkhPNFVFL2FR?=
 =?utf-8?B?WWprbHJwU0loeXJLZVpFanBNMkh0emlXN2J0WVd4M3dNTjNxN1Q2eHd3TEEy?=
 =?utf-8?B?WnBlRFgyVlNSVWc1bFluaFVuQitpRDNFdTVTUkdYa1VDVHQwQmFUYU9GY0ZY?=
 =?utf-8?B?cytXZFIyOEcyVm5JTUZDbG5Ea2UyTGNLc29sR3pWSUR1TklaUGNPakJobnFu?=
 =?utf-8?B?dUp5VnhOVjlNWlpXZWxheHFrdThmTnp5VE1vTFRLSjFHU1A3MUdFL0RLSTVB?=
 =?utf-8?B?cDBSTFZZbHp4VlV6MGFoc2hhcEVMdm85bHN6NUVmSjhIRGhWaVF0ajlpUWFQ?=
 =?utf-8?B?OWJPdGFQSEs0Tk51MVBDb1QvbUFhNndGeGx4a2laZVF0ZE9pbi9waWx6YVFW?=
 =?utf-8?B?S3RTUkk3TkNRZUZpb1ZaYnlJeTJta1NXTnlSODZxS1VBQlpLQ3N2ZW1PdkJU?=
 =?utf-8?B?QlRpV0VwYUd5VmFiOHg5U0M5dDdqcUROVHNkeHA1M3ptbWFVK1dqOFk4Nk1n?=
 =?utf-8?B?NWwxeGxsb2VDMXArQ0ZHTXc5TEFLcWwxL3pORHoxQkZMQWwyYVVUZytmT2sw?=
 =?utf-8?B?T2IrRlQrMHNCUHAzaFpETGdtVXg3clpwSk9lbTRkMTFDM3g3ZUM4YU9FbDVR?=
 =?utf-8?B?UDdPclBKSnk3M2V3aTRLajd2YWs0K1ZaUVczNGZ4aFVLV05QNzg2TzFtT3ky?=
 =?utf-8?B?NFNKWlJJdEFTekZNZnpzMEtnTE42NVNtQk1TMGI2aHB3eForRVdSNEMvbjZB?=
 =?utf-8?B?OWRtTWROZno1eEM0MkdZcHQ5OGgvVDBDWnJsU0FyNm0wL0dFRUZhSlkrTmNU?=
 =?utf-8?Q?tMhhDr9MCwjBCZRvogpM6rF+4ejrymb9k4btf/W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWtHU1JiSi9IRCtlVVovR09LVXdBR3ZBM01HckVIRldIRGI4Y1FtWW9oV2JP?=
 =?utf-8?B?Z3I2WDJYZXZuekppbDhlbS9JUDdXMUpSQXpDM0k4Qjc5WTFYaHZBb21udktk?=
 =?utf-8?B?NVIvQ0NFaStoWHBkenV5U0pXMkpjTk5LOXZJNkNxaGIvVDFvQ1ZTZmtYR1ZX?=
 =?utf-8?B?eGFlOC95ZG5zMGFwMjlIaVQ1Zm5rUVI2dEVUUzhkZjZUdThYbityWlFpNnhj?=
 =?utf-8?B?SlA5Nms1UTI3bGU0SXdhcmp5QTdBdFp1WFhtY0tjMVE0QjZVUEI2VTAzU0lW?=
 =?utf-8?B?d2tNMDZjR3IxVjBYZWVva2lHTWJjY0VpcTFqa0o0ZDNhZDdJNkRZVXUvenk2?=
 =?utf-8?B?MFZKWms2MU40dVJkV2dZeElnbm9YQVFZcjlnVVZyd1RkZ2xjd0lFM082Zkc1?=
 =?utf-8?B?ZHJIZW9VeFhWa2hueERycys0TDBnOWc2UkVhN0lheW0xcjdxcjZHWW00bGZI?=
 =?utf-8?B?OXlhQnVLVVBzamdyVnpLV3MwcXg0Mmw1N2ZBMnFPMUdBMFFrVVhvT1ZmWnpT?=
 =?utf-8?B?VlI3U0oyaGhHTDF2UjJmaUVaZ2owdUc1dVdKb0JlYll1eXdhdEFJVTBQOFJ2?=
 =?utf-8?B?eGc0bjNZaHlXbmQ3WW9wNzJoVWpneGNHcjFiZGkzb1YrOTZ6QldrM3VJRFB2?=
 =?utf-8?B?S2xpR2EzVjNjVkZWeURDNUVXMlJiWGFTNy8zemZQcWZ1QXpvcnpEVTFDVTZE?=
 =?utf-8?B?UTY5SzYwb1VsWXRsdk5YREhaM1B2K3BhYXdZQWVJcGUvZ2dDS1o0NkRMbGt6?=
 =?utf-8?B?QkpVay9leTVFODk1UG9vdGNkUXo2aW5KWUlXNnpIaHg2N1pYZG8yUmJPWUdB?=
 =?utf-8?B?YWNNRDdJbDJ6M3FrdVVnY2pqS3luc3JKZ3Y3eDFzY3hkdkpnYmtZOVhuL0FL?=
 =?utf-8?B?M0lzcURhYmt5bHhyZDczVWk0OFpMblFQbFRxV1MreWRtaHJNd3orVjN4azZR?=
 =?utf-8?B?YVM5WEZoY3ZuZGRGWWdJQUNGamFieHlPNCtuSDc1ckF0eDJscFFvZnczWWFj?=
 =?utf-8?B?Q1V1ZGZLZC9leFpGbXh0d0tseURUZ29zNzE1YXRBZHZXb2N4YkhMYnZGWkl3?=
 =?utf-8?B?VzhlS1FWcDhiaUlPaS9LdDBObG9UQmVZZEwzbVRhZElQaFJINkxLaXREV3hi?=
 =?utf-8?B?ZXE2Ym9SZUtEQjlBZE9wWTVTMXdSb2lqeHRKWFV0cjZFcExqSjJNVzVyU1dD?=
 =?utf-8?B?Mjh3MU56V1AwRUJ1WFVnaU8xVWNXMVRodmJXWlhUWlNORDZlQ1NqWHVyckdQ?=
 =?utf-8?B?dS9jbmFqQVJxQmxBN2x0ZVFwVWhqYmhRQis3TjZxem1YNU1ZWThWS2JFTFUr?=
 =?utf-8?B?K1NURXJqUUZSZU1tNXVTL25Mc0F6alFreWNwRk5IYXZFemd0VUUyVlZtTUtz?=
 =?utf-8?B?bzRKR1N2Y0JNVG5nQVhVeHV3MmFidEtjeG9Yc3hpNTdvcTVsTSt2bGtaZHFG?=
 =?utf-8?B?WWRyT3dBbkJDekxhN2RDci9hbHQvQW5EbjB1T08yRVp3WTFFN2p2NlRNNTVM?=
 =?utf-8?B?NHhoUlZXTTJXdCtCVkN0WnFIU3BZOUY0b2lvY2JzUWhpTzRCdk1WRyt0R2I5?=
 =?utf-8?B?WU9KeDErSDIyRi8wSHhCd2s1MUpRaGhjWXFHWG1rTlprRUhHTS9RNFF2VGta?=
 =?utf-8?B?RHBZZ1NJYUtyVisvVG9laWhRVkw1ZmJySU5zT1Fwa2F5dDI3bjd2ZzNlVjdt?=
 =?utf-8?B?bUNmNWo2RjVHUlF5RHNNZkcvbGNwdHl1UW1FMW5TWmFCMEtSUVBLTXJLK0dh?=
 =?utf-8?B?cTVBUDlPV0V6bnNteHFIKzZ2RHNTM01Yc1pBU2I1MUlUdWRCd0RBUWtaQS96?=
 =?utf-8?B?Ukg5WUVzaUJnVDNpNHJubGprdUx4RHlVNlFsUzR2R1NQMFRLQXlVWHpxTDFW?=
 =?utf-8?B?MnNsK0VkZmVQbklIQUd2U0NyNHFUVGJQM0Z0VVRkREE0TGVjdFUwS2pXYW4v?=
 =?utf-8?B?YWVtRjRwanFmZHFWU0w5SVIyZWplL2tXZUV1WTJmTGlDRkcwY0FPZ0JtZTVz?=
 =?utf-8?B?dlkvQ2luTjREZFBvTTYxU2tBYWVQRjRYYUg4L3FUYWN1aTVOS0F5MGxKU0Zn?=
 =?utf-8?B?VjBGUlF4N3cxMkpDOXJZWVRpOXRRL0NUVVNzMll5MllNNnVrS1NhbytaVy9r?=
 =?utf-8?Q?BUS9UJr4M8xnPfcpOZvpdp0au?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8f06d1-cc33-4e01-d0d0-08dc89e86f9d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:30:58.0165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqhSLfWO2gskfm2RDrgDLW1otkWCQkWpcyVo5lxU7Gr0oXXftpVBxRvqmQ4ggH+q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051



On 6/11/24 00:35, Sean Anderson wrote:
> This series adds support for muxing individual pins, instead of
> requiring groups to be muxed together. See [1] for additional
> discussion.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/5bb0dc7e-4c89-4f3d-abc6-41ae9ded5ae9@linux.dev/
> 
> Changes in v3:
> - Express groups/pins exclusivity using oneOf
> - Fix zynqmp_pinmux_set_mux and zynqmp_pinconf_group_set not handling
>    "pin" groups (thanks Sai Krishna).
> 
> Changes in v2:
> - Use __set_bit instead of set_bit
> - Use size_add when calculating the number of kcalloc members
> - Expand commit message with some more motivation
> 
> Sean Anderson (2):
>    dt-bindings: pinctrl: xilinx: Add support for function with pins
>    pinctrl: zynqmp: Support muxing individual pins
> 
>   .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 349 +++++++++---------
>   drivers/pinctrl/pinctrl-zynqmp.c              |  83 +++--
>   2 files changed, 234 insertions(+), 198 deletions(-)
> 

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

