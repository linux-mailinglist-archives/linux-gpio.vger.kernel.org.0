Return-Path: <linux-gpio+bounces-19723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FBAAD82F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 09:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E7ED9A044B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 07:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D92621A952;
	Wed,  7 May 2025 07:28:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA1P291CU004.outbound.protection.outlook.com (mail-polandcentralazon11020084.outbound.protection.outlook.com [52.101.182.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF8214A6C;
	Wed,  7 May 2025 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.182.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602905; cv=fail; b=hzO2mchYY7LHAyRDxRmspVKrKP0sSI0Nk3690ubRh1Jv69xa3XgAuVOLg31lHbe+aAtc53OdbcpUqlyBxYiyg2FEW08twmAwqUGKjWyDmkoMUI+Tmo/4vLFsb5v7b7FMNf40gLdD/BHUmzVWy95vOn+WUpz0zJBs4cg8NtKn9LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602905; c=relaxed/simple;
	bh=XW7hZifP8q4m3+s/9/oR/u2u5SYIc3tq5g/wuRA7lD0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cViRfC9xiIfyRomRPmDEvHkhC2Mc8g3vI8/zOtbVpMuUq1ph5rgyHTQKfrYd631oppUMGZw4TkDIgyuu/0CJgcL8huRfAr4pohIEhseGmpvpdO9sQZDXAo8wDm3Dse3OgYfU318xgBEkiEvAQvN5CcvLF0j/13EVtA90V7CjrGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=52.101.182.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoAQuCg9ExKhNmpDfA1elICB8mHpB1KZMq28m5Zp+D9e6rb5pZwU95wpKuFLVU4vgP0kRto5zC8opxHbzZgaudlhNwMumayPh07kcqM3hqJqDfnEgb58KxhrSukyvWgwvr1f28xA4Dec97nB0NXEzj1yJ2Cc7iUeqfIQVG7iwdFUvEdrbjxuvcnvoVGUGr7PnfJQ6PavGHiFr9/qWbUE9zFfXTNxcHnqUv9YO3wu+rbq4x5wX+cJx9R0dQogaPvHJcEpzc40S5S64GdL18YmbcJOnKyR3oxOa7/588M5mxAm3q7SGPJUdpdjs5S2m5Re9FoxiaKajd3JXjpSLEky9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRDpIsjFLfPPQjTvjbwoiSNAp8AqPUagfYIAbDDI56g=;
 b=BHVqmz8bsHiZ3KxpFGFnxWNvyClIAst1EdQVSjVnYUby+6oYbRy6UGC9KDiM+jLWD8aAtKSz3xVNdMgojKwlkqG+WPSMHLsOGq7Qx3ROhOS7VzNZtlPtmT8bGBLeo2UgMIPEUdxBUFs2/4HHAqy/OmSXqLjuH9wS8b6k17cx+nwn4sez8BkJzzo+/oADzG5mpORrASJvlQiJVdS8opSx5fC2Uzjs/x+efJUvM37xh/zU2BC7MqgPV8ye6mGAjNY4n+/bfmZJj95iOX5ddVcNLaS+KZg6XK1qJySBvYR2NiFx1StBpfTnfDkR25lnn7JmjbZ74eb/iSwJE+5GkQbveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA2P291MB0282.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:27::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 07:28:15 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%3]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 07:28:15 +0000
Message-ID: <29eea52b-a512-4948-b4e0-e6d19d09ded4@videtronic.com>
Date: Wed, 7 May 2025 09:28:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
 <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
 <eb2f0337-9261-4867-b6e2-dd6ca2fd25fa@gmail.com>
Content-Language: en-US
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <eb2f0337-9261-4867-b6e2-dd6ca2fd25fa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA2P291MB0282:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f29506-acab-479d-16a8-08dd8d38bae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blVuNm84QXB2cnRvbjNHdit2L0FVcXZ6ekxRQ2h3bmRBcFRLb2ZYVmZ6bFZ0?=
 =?utf-8?B?ekZ2MS9FRGIyOHYwYllTcytJTW1oMXM4cXNsZmRORlVwZmp5aW42QXVjbldR?=
 =?utf-8?B?a1pUcXNZWUNJNnJwY3dTTmRvTWtXd25EaVhTT0UrZkl2QktkaDBQSTFjY3dn?=
 =?utf-8?B?Zy9Wc2RvVkhYYit2cVRaSHNpZW5WV1pRUGM1T2oxQ3JQeWJhUkZOQXdPRmFk?=
 =?utf-8?B?WkxMeDhXck11TEE3TXIxTXlialQzWTZkTkhiL2lTQnRaVmE4dUUyUm51aUJP?=
 =?utf-8?B?OElRWFQ3T2dtRzlKclVqbW9BWTFrL3d1M3IyY1dmejRmLzZ4ZG5SaUNicVFU?=
 =?utf-8?B?M0s5U2JMa044RktEMktCTUVqNzdkRElCS3ZLRDlBVHhCYjlLM2ZTQ3NKOXc2?=
 =?utf-8?B?NGYrSHRpVkIzbUxHK1hvYzFqYk5TWlAxL00reUdBTTQ5aUhBU216YUhqWjFE?=
 =?utf-8?B?TXBDek8rck9YRlY3QVZ0dkk5bWpDRXlVTW5EeUw5QXBub1M5eFdQeEFjMEZj?=
 =?utf-8?B?cy9pbXU2ZTNyT2twVWEwVWYyeTE4YmJKR3pOVExQZE5uVkRXMVBlWEN5bGx6?=
 =?utf-8?B?SS9wdVFZMFUvekRxODdUbktpaGUrTFRMTlhaWVBvelhMK2RJWjQ5TDRCODZC?=
 =?utf-8?B?V0Jjb0o5QjlLYmFsYnNCdGJUdzhwaXJ0VzBsdGJETUsyWkVWVUE0Z2JTTURI?=
 =?utf-8?B?Um4vSEFGVG5JZHUvNEo3NzVaZDEzVHJlQklWSDN6b3VHaFp0THlYRVpxZTJm?=
 =?utf-8?B?MXk2YWNyM1VISG5iY2doOE4vdHpsb0diWHRZWG5neUlQRWh5SytMSnN6SG1F?=
 =?utf-8?B?SFM1d3YvcVphMEVSemFOVlhjWktCSnNBeWcyb1krdWRSSlRmSGkrQVpuRlQr?=
 =?utf-8?B?Y0htSkx2cnBTWEpGVUpQL2x5SWVtdkE1bmVtRXo4dlA0ODFnSDhGYjI5TE1w?=
 =?utf-8?B?c3BhWUROTXNnSysvMTI1K0V4aWV2Z1J3M1RiUFd5Q0N5RFUvTVZtVWpsaktG?=
 =?utf-8?B?SGVPbWFXUFp5SkpoS2hod01QZ2dOUUNKRjd4MnNtY0NaZ0VjWUJXdVF4MzV4?=
 =?utf-8?B?VkdFWU1JNGE3aCtsTHJtR0g5VGJQMStTa0FBaWxmaXpubFdKKzNXQXBmQlNT?=
 =?utf-8?B?Uk03enY4NndWYWZnVFFVUHBPNEc1bkFoL2pzR2g1UktERThiWXNOaVhzcEtI?=
 =?utf-8?B?MnhJVmV2WWc4dEs2M1NBUFJDYWtLSnp1ckNGNDd0Yk90V3dYVnFKOVRMcmFK?=
 =?utf-8?B?UUYxc2hvN3d6cGN4S2pTb2JIK0dUL0VKWkRoeWxoL2xTQmZXTWJ6ajdiTWVW?=
 =?utf-8?B?T093VnBqZnkzUUNKMHBwUlFQUGNndWozV0ZvVndZaUVqaE5WQlNicTR4U2l0?=
 =?utf-8?B?YUlNeHNaYjVtYVFFRG1xcWJKWDBBSHZTK2dVU0ZnWUpBV1pKVkVaaFVta1Bv?=
 =?utf-8?B?K3dXd3F0bCt0a2V6My9oSGlNOWI0RG5XWUwvcTBKMEFvR2JNTVYwaUdKc1Iw?=
 =?utf-8?B?Skg5YlJMWDluVDJQYkFOOTYzeHgvL2EyU2IrQU5DVllqbzNxOGdqZnVCcVAy?=
 =?utf-8?B?bzJUL0VKMFNsWUU3a1lBYzdkLzBhclhLaDJySDg2ZTlkZVF1UHo5WFJVbWln?=
 =?utf-8?B?SkZnZ0xBcFBQclVTSWkwaURZb2tWcTRzSHVSNjArUkFEM0hiUXhLdEt1MlBS?=
 =?utf-8?B?WjBMMUcrb21tNHRCVDA3eitRdXlmcEF0K3IyY1pvQWk5TWtRZHBxZXJQaFdq?=
 =?utf-8?B?WUE3Q045YTR3TVlaZlhSOEkyR1FyTVZVNmRla3FaaGRkUUhWWWFrMUZDRUFD?=
 =?utf-8?B?bS9LRS9sbG1remhWbFNIMHNrM2FCNHNKTWlhMUNxZEpmbUF2ZUl4ZHdLWXFk?=
 =?utf-8?B?TjFjRWNYd0JmdVJ5a1hrQk9XSXEzVUtTdFphSWRoVlJ3NzZxNWRSS3dLaHlM?=
 =?utf-8?Q?gPhLmKrbKNc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU1BN1FpWXJqT3ZUandCN1dWbVVreDhzcHg0LytXNkZjL2poVXBJTzJhMXha?=
 =?utf-8?B?UFh0SkpyUDZXWG9acTRqUVpkbEpMR3hkSDNMcStsVnIzMVhXSmZaSFA4OTRm?=
 =?utf-8?B?RGRsMWhYM1FvMTFLQW1JZUVFeXBZZ2svL3lLSC9Cc0NaQjczLzdOSE5JYXQ4?=
 =?utf-8?B?VlQxb0xYeVk0Z3RwTnc5dUJZQ2VsSElwa2w2WmNPbGQrOHhGSFZBSVp4YWVI?=
 =?utf-8?B?SklRZWpEV2d5TExRbTNTUUhMdWZzTFVpRzVqamo2MW81a0hRbWRXSXBrVEd2?=
 =?utf-8?B?MDVkK2FnTHVFcTlyRW9hSnVFbkcrMzRkOEs3UlB4R0NzVU5KejhwUWhmdnJj?=
 =?utf-8?B?dWFCMUplRnM1WHk0TURISy90bXhqOGg1alQ3TGVmc3djYlowczNxOHBYYTlK?=
 =?utf-8?B?Y1BTOWZEbk5zS05ldU45VitKbUlEa0JENmhHZ2thVzk5SDlUWndVUVAvQnp4?=
 =?utf-8?B?Uis4SVZYSkRMajl2NktkaWhLZklZclFrMFhPM1VrYnhSdFBkVVZReERudGRk?=
 =?utf-8?B?MGpJc1hWeEQ2R1ovN21WcEdqRS96OVVsSVN5dWZvc2I2WHhkU05MVE83aEVX?=
 =?utf-8?B?ZEk0TTd2bWtRN1ZsVS8rZTNITW9yRkhMN0U1d0lnMFlueVlYWlI1eEordmJ0?=
 =?utf-8?B?R1lySVlYWi9GMWZnTXNyRHFjV2k5VDVxZmFtWGtJUzE4UnRpM29KVzhHM0lw?=
 =?utf-8?B?QTRnTVV1RzY5c3pJNDRkeUhEUW1vZ25WZHR3REgvcVZFODBnSW1LYlN1N2hj?=
 =?utf-8?B?TjdGQTVlOWl0Nk9FMHpoS2JML3VBbmh2SmlEd3JqdUtnVVBvQ2hZQWorNyti?=
 =?utf-8?B?K0VYRFMxOW1qVTJ3SWRsZ0R5RXBUbjkrc2htcDd6d0RxcU9QZHg5VkJvdHhs?=
 =?utf-8?B?dTVhK2o5VHhSVVgyR0JUem1xcFdyRUFvUi9uTnpKQ2ZCZEZ4bDR5YjkreGhF?=
 =?utf-8?B?N2xvOUw4aTdUTFdIaERRMkdWQjZKWjRBM2hZanRYTlpYRSs3a1FoOGFFd0Rx?=
 =?utf-8?B?NlRHRk82STFyZFo4RmJ6OG1ERVZJUFZEM1F3LzRpbWl4OHZRWjdtT2FKRXhG?=
 =?utf-8?B?bXp2ejQ5TmZsZWZTci8zSHVHYytwOFZhNExHZnFHaENCNnhLMytxc25pdC9v?=
 =?utf-8?B?bUNqdS90aVhhb081WU5IY1FCZEhIUDJrc0Y4SEcyb0QzcGM1eHFZaDNMRVpl?=
 =?utf-8?B?RG1Rd3hOYitoTm02NnFlNE42clNEaUJpcHRGc2laZllETW8xUzdhazRJQTR6?=
 =?utf-8?B?SzhrS2hCN0tSZWpTYkxXWVZOR0pnVWpGaUpiTnRqV0l4TVlrT0hJMzJ3M3Jr?=
 =?utf-8?B?YTFHZFJEaDVRUHU1QzVNcUgyZDNvT0FvR2x6Sk5LR2d6VEVPbnhhNmhzeEw5?=
 =?utf-8?B?elAvWStWUHlkOTFOUWg1ZXJsZlpON3lYYkV2QkNGdXljeU5sQTdwbXBjWjFk?=
 =?utf-8?B?aWliQUhoWXBQQXh3aG5lcFpIcUQzU2Z4SS95clg2QTZJdmh6ZjZRZGE0WXdZ?=
 =?utf-8?B?ZlZ5RURkYllLamwwTllCQ0RrWCt6bGZwNFZKaE1IM1F5ME9PTGdFRlE5SGZX?=
 =?utf-8?B?aitDZ0pDaGluVjcxQkVtQkFQN1N2QTJvK09yREhleXJwVW4vOXNjVCtHUHBC?=
 =?utf-8?B?bUxGajRNNzJFUzJVZFN0eWdyNmg1a1FBRXA5SmMzSkdCaERDU052Y2hVV09k?=
 =?utf-8?B?YWtqekFBWUZlRWJIa2VyNlhFNlJvdEpVUFdXYTRwYWpMZ2xkS0JEV293TFhr?=
 =?utf-8?B?NVZheWttcWV0WWtlQ2MyYkdNU2hwR1NIdE5GTURDd1FBMERkaUsvMllzTDNw?=
 =?utf-8?B?ck1SRW0zK09KZ1BCTGk0OXpoRGJJVmYrYytDblllYVdrQ3V1K1U5ZDl6Qkdx?=
 =?utf-8?B?bFllZEFHRGlTTmI1UndCSVFQd3BoMllyOFZZZER0VzNobXl0dVQyMHBNaWNR?=
 =?utf-8?B?aWJ5OUI2Ty9oNEk5SkdMbnpKSDRPcXQrSEJWT0JYb04yRVZOTG94WnRlM0lh?=
 =?utf-8?B?cEErYTFEK1UreHFGVDlkdzZCUE1UNHpTcWNXcTlSWHZjREtaWjRMTlNUSGQ0?=
 =?utf-8?B?TnI1VlU2ZFNjOG1UT2cxUzhZdjM0UTN1eFJFWTJITzQ1SGRBQTVEYXhSRlFL?=
 =?utf-8?B?MVhCSUZlak5jVXJVeWRJaTVWQWdOZDFZem1yRmFjdWhJV3BySWRZZEExN295?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f29506-acab-479d-16a8-08dd8d38bae0
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 07:28:15.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XbJxPMrDt8509oKIs4LnwgFaCPm3zh9Kgmdo+ZJhjpwK8wGH0rIEU/MbVGlhUk5vW1bDKyxBjC7Ga7XikqRg3Sey/BfnBgGc8GH036gkgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA2P291MB0282

> Can you revert the change you made to polarity_on_physical_lanes, and
> try the following?
>
> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
> b/drivers/media/i2c/maxim-serdes/max9296a.c
> index f48f5b68a750..dea0518fd790 100644
> --- a/drivers/media/i2c/maxim-serdes/max9296a.c
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
> @@ -474,7 +474,7 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>                  */
>
>                 if (priv->info->polarity_on_physical_lanes)
> -                       map = phy->mipi.data_lanes[i];
> +                       map = phy->mipi.data_lanes[i] - 1;
>                 else
>                         map = i;
>
> data_lanes is 1-based (since 0 is the clock lane), but the bits
> in register 0x335 start from 0. That means we should adjust the
> values in data_lanes to be 0-based. 

I have applied your patch and polarity settings seems to be correct now 
(based on register contents).
However, I have came across another issue.
When I was debugging the driver for MAX96714, before I found out that 
the issue was with polarity settings, I have commented out calls to 
MAX9296A_DPLL_0. Probably because I thought it was there by mistake. I 
totally forgot about that change.
Before applying your patch I reverted any changes to the driver, so 
MAX9296A_DPLL_0 writes were back again. Sadly, video stream did not 
work. So I began to wonder, and just for sake of testing, commented 
these calls again (added some logs for quick tracing purposes):

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
b/drivers/media/i2c/maxim-serdes/max9296a.c
index f48f5b68a..b24a8e2d6 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -391,6 +391,8 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
          * PHY1 Lane 1 = D3
          */

+       dev_info(priv->dev, "Using  %d lanes", num_data_lanes);
+
         /* Configure a lane count. */
         ret = regmap_update_bits(priv->regmap, 
MAX9296A_MIPI_TX10(hw_index),
                                  MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
@@ -474,7 +476,7 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
                  */

                 if (priv->info->polarity_on_physical_lanes)
-                       map = phy->mipi.data_lanes[i];
+                       map = phy->mipi.data_lanes[i] - 1;
                 else
                         map = i;

@@ -484,6 +486,9 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
         if (phy->index == 0 && priv->info->phy0_lanes_0_1_on_second_phy)
                 val = ((val & 0x3) << 2) | ((val >> 2) & 0x3);

+       dev_info(priv->dev, "Val for MIPI_PHY5 (0_1): %lx", 
FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1, val));
+       dev_info(priv->dev, "Val for MIPI_PHY5 (2_3): %lx", 
FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3, val >> 2));
+
         ret = regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1 |
MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3,
@@ -499,10 +504,10 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
                 return ret;

         /* Put DPLL block into reset. */
-       ret = regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
- MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
-       if (ret)
-               return ret;
+       //ret = regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
+       // MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
+       //if (ret)
+       //      return ret;

         /* Set DPLL frequency. */
         ret = regmap_update_bits(priv->regmap, MAX9296A_BACKTOP22(index),
@@ -519,10 +524,10 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
                 return ret;

         /* Pull DPLL block out of reset. */
-       ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
-                             MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
-       if (ret)
-               return ret;
+       //ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
+       //                    MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
+       //if (ret)
+       //      return ret;

         if (dpll_freq > 1500000000ull) {
                 /* Enable initial deskew with 2 x 32k UI. */

To my surprise it works this way. I tested this 2 times back and forth. 
Can these calls really cause some issues?

