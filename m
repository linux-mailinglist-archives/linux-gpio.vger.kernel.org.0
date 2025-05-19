Return-Path: <linux-gpio+bounces-20303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB3ABC828
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 22:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7406C162645
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 20:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE98211A27;
	Mon, 19 May 2025 20:08:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazon11022101.outbound.protection.outlook.com [40.107.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC94B1E7F;
	Mon, 19 May 2025 20:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.155.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685337; cv=fail; b=D2L7ki4e9W/cHdxMzI4HPUyPrzshqZsYx9n2s4zV/66ififUEh9edkgpgkMdxLJwznvfijZonA69zXN/kwyQIrizGrbY3N/OGF/lkCIBgpN/pEdVpB++Gl7h27rVFr42MMXRp6kzwdjE43P7aolXvuLS4WIUWJTAdm4kVpqpDng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685337; c=relaxed/simple;
	bh=/Hy98YUn6cOHZFSaLoIOOUxold4W96GV8gq5iwLs744=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i21NHMmQvErUfBEv8QN7e3rM2Vbr6H3oRMw1k5pap1UOQQ+lRbEb2ES2qZ3nBzL+QiQrM2kYltH5vMvnfJFrcZicvAL4LB7D6POaoJOWSm8Xv7YUzfAlwhCTO+U8ec3uGAjkJoJr4EWLyetfetXh5yMOXejXbcqMDo+0ihuhyow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOVEOx+9gYd3Hw8foYd+zF1CY7F+TZiOWFMQ7Nv6mNs/oBEO06lZvZiOho5DTWqLJLYtyUCCh7VBcRLPby7rnmZy6vO6x1UFBVB16gabcI4o8Gvty0UST7tilCcS0R8PMEyDI08UDFBI+fBjVnOvPZOYLWRpnJbgb1xkbrSz4z34exKZSWW5bGCUXVc8PyQ7X0nqX1d1WrVBCnF5wEy3ToyMfA478oZnVrVU7L5gLcOpIf1+6/njHO3neQsK6WyuqfQAzty0VC9lGp0XYXAmvWXzzqpbSJdAPgGe+fDOrZqc+Y30wTcEbcFuzednIPDqRGLAdK76m2x8vecJS9KNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idW86/lsH6tH7jDwNpot0QqhDkFW+c0ngaG+NkUbZyg=;
 b=TL1MaHVZgUPrH3gM3/sdcDQQCftysDMSG6flTTRgSxSJ96y2nQGC++c6PR3NnQZ0TpfH+vUO59p9oScMQ903T5zzoainpR/tzYJXnxiFfMvxQOhLWqqqqGXo/+4CZ0hAXAOs0qTu1QAe9t2QffzML8FCKThQ5zyxAjOxYf/sTPPaTsqqS/QS/KBJe6WK+7c5Wg428IijzmOx33lIuGCc3Js2+LNQhTh5S/B39pdqhoD4ULuoEZeNUUWMk5wtGpBleInOdYlOIgooukUHFXHbzdgIodMd0NOZZD/aBkhqB/IgnwSy5gTV/1T5FIP8Kfnd1efEFOMxC7hQjl3GiSBy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA1P291MB0250.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:13::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 20:08:53 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 20:08:53 +0000
Message-ID: <d2cf93d4-76d6-4a47-aa9a-6460394a62ab@videtronic.com>
Date: Mon, 19 May 2025 22:08:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/19] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Taniya Das <quic_tdas@quicinc.com>, Liu Ying <victor.liu@nxp.com>,
 Ross Burton <ross.burton@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Eric Biggers <ebiggers@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhi Mao <zhi.mao@mediatek.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-16-demonsingur@gmail.com>
Content-Language: en-US
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <20250512212832.3674722-16-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA1P291MB0250:EE_
X-MS-Office365-Filtering-Correlation-Id: 326c88e9-d699-4d57-a92d-08dd9710fa1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGVVUnY3UWNwSW16ZGQxZEsyditEdkM5Sys2MDVub05ndzc1bkk2T0Q4a1Fz?=
 =?utf-8?B?ZzI5Uk9SbW1CRkU5Nzd2dHY4YU0ycTlGN0ZyK0prclZWQlJLWnZha2M3ZFQ0?=
 =?utf-8?B?WHBrWUNUanNMNGtiNTI1RUZxcCtUSC82ck81QVVxTjhCTGIzbUF0TGVtcnFF?=
 =?utf-8?B?emxvckVDYkwyRnpIaHo3eFVad1A1Um5MNHd5Zk15Yk9oNmdvOXlOYnBlRkQv?=
 =?utf-8?B?UEtKRXpzVkRBWlljamVqdFgvSVZoaUtuemJuekJrZUJ0SFdXeEI2RmY2TVRF?=
 =?utf-8?B?OHowb1JQVTZHaDJwcGlxVzJwWHg4b2hiR2tGQW9YSkZXRmRvcnIrVEppS21h?=
 =?utf-8?B?aFNaWEV3K3JsOFJGNVU3aFZRT0lHbExHd1lDWThNaEhpUkliQ1RGOHd6NjFu?=
 =?utf-8?B?d2xEamZuSDVuUmJkTnNXUFFrWlFsVUtVZ3h4eWVwdGpaeTVKa0xkMktvVk9M?=
 =?utf-8?B?aUE1aEwyS3Jqc1gvNW0vaC9sR21iUnQ2d0Q0SmVZd3JXc0VCNWI1K0tjL29t?=
 =?utf-8?B?L2NSYmZwQ0JwTXpYWFhKTWxYM1YwUHpqamxRYjFwL01VSHFyMTdGYk5KWHN1?=
 =?utf-8?B?aTRSZ3ZHZFhPandPWGZ3Yno1c0YrT1U0Rm8xTmhlL1NqTTlyUWRURjZ3amFX?=
 =?utf-8?B?VUpaaEZWVzVCb3JjVTF1MUtIYlhJWitHUSs0d0Q1M0dNTTdZN1AyUzMrdm13?=
 =?utf-8?B?Vk1lTGtwM2krR1FxNHUzcTRIMVhtZlBDV2hjWTRGRjhZY3Fud3R0R0pkZFQz?=
 =?utf-8?B?R2dBMytNc2kzYVRxNWE4aW9UdEhJeE1tRmpoSno3R29rR2VKalZzclRpYzlv?=
 =?utf-8?B?SHIvV3F4UkFNSmNEMERPTFhDeVpQYkJHRW42R2NnWHdXVklxQ3RxSmlrVzFL?=
 =?utf-8?B?VGhqWklqaHJSa2FBMjdRMGh6NHNCZjdGU293ak90NFlMTmsxUWh2S1pFZzA3?=
 =?utf-8?B?d1JZaGxmQUVMUERwbDdiVUFZTEk0KzBSbWxjbzJLb0E0Q0s2MG1BUmN4YTdH?=
 =?utf-8?B?OFhra2lXWjZkeEZsOHd0dzZVMllRZjQ4NURMMHplN25DNjFld1hKWGNBbmNs?=
 =?utf-8?B?aXRVMi9PYTIvYy9KN3RVT0VFeUxMV1dKMnJOdEtibFF1NGtzUU9vRm9Oc0c5?=
 =?utf-8?B?N3UyNUQ3aGkwSUY4TnFkR2RBeEduV2w1bzcveThXQ0lDbC9Pbi9uR3pISDhQ?=
 =?utf-8?B?aVBwcUhmdmJpYUNEMHVSS09CY1F6T0xyVFFsSFZtUGNnNVIvUFlRT1hSWGRo?=
 =?utf-8?B?eEFqd2RUVSsyNVRhdFFNQUJic1BWeEFsQVkyS2tvRDRpZFJKeGRtaSsvNlgr?=
 =?utf-8?B?N2x1K092ZjNvSVkvdkFudDdyaHQ4b1ZWbEJTT0JPamMwWU5CMXZUQXJ4ZjhF?=
 =?utf-8?B?L2d6NE5sRVFEbEkyUVNkdU1MRTY0c1AzYmhUbEZWelVUYysyUlMyWnQwaXE5?=
 =?utf-8?B?dVBNbmI2c1dPTUlyOEF3UWp5WHhjcEVxNFNMR3gyZXYvY3FVQlFvdHd1S2s5?=
 =?utf-8?B?TG52Y2QvTmcwN2RlUkJkTFpFbWZOUVZzOHljNHc4TmRDenZqeGVUb0xQR2lq?=
 =?utf-8?B?RUZqWTlFMUhMSExGSExPRUxVclVoNG0wNXZjZHNKNnB4UXlyLzB2czlQVmZ3?=
 =?utf-8?B?b0o0THg2WGhBVCttVUdpK00rZ0hrVUd5TkpsYzlRTVNIS1hOS212dHV0TXRk?=
 =?utf-8?B?OUpPNVYrUnhPa3NXQUNSNnBVM2x5c1E4RjNYME02UFNyZE1qWHNtU2x0MHFr?=
 =?utf-8?B?UG9iT2txRmoyckFYNlpRekNCdG5tblFZVGo5VUZpRDEvSUk0VFE4NDhZaW5C?=
 =?utf-8?B?UEh3NGoxU3lzbmNIbmZqbUgxRTdCZE9sYkdCc2s1NGdzL2R3b1lkUjY1eVdn?=
 =?utf-8?B?cDZVQXhPSDVJMlJQZncyT1dzZ2gvRHZUVEtQbUZ1YjM1c05zNE95YXdwUktX?=
 =?utf-8?Q?hz41Nr7QX7Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VrdyttbWhhRjY5NE82Z2dEYkFXeHdUYmVjaUFXZ2IzQ0UyQXJLdGhQUEpW?=
 =?utf-8?B?S1JXb1ZqdWdKaGlHTEUyZEMxT2pVdXNPSFI4Y3J3d3Y3UDFxWGRSZys1Smw2?=
 =?utf-8?B?R0VuR3FCS2dmekNlZmlsQzhmcFFTYmRzYm5lMGZ3NEpQMDFLTDZxeVJyZ083?=
 =?utf-8?B?MEVLWnU3NmhrdXFLQ01sT3MvMDE0cmk2OVhjeTJWWERITVFEQisramNzYjRz?=
 =?utf-8?B?NzB3UlFoOWt0c083SWN1NnV1REIvVTNYdVZTWXd1UTFiamV2R0w0L0hMNDFW?=
 =?utf-8?B?TEI3RGFwSTdPRFZ2LzcyZWQ5aUFDUWV4eVBRTWlQd2U5YWFGd2VWSitTMUdn?=
 =?utf-8?B?S0hEQVg4UFB3RGhzcXVtU0RETHRjMGM4VTZrd29JQUFZWE1DYkRtOE0reS9M?=
 =?utf-8?B?MlhYd2VaKzRDZzhRZWdhRnVGb3h0U1FOZU0yWmNUek1nQU5PMVN0S1lzcUtI?=
 =?utf-8?B?QTVxRVpMQkR1R2tKMVVZL2VLV3lUa0paejBTc2VHSzJmV3UreEF0NWkreHRI?=
 =?utf-8?B?Ly94MTd0b29VQ0pEWWgvb1Q4ejZ5YkxFbzBhQ1V3SEtxNm9FM0dpMFZyNGlV?=
 =?utf-8?B?QWZPOVRwZUw5YTFqT2Q0SHNVc0ZTN1hIdlF2cGl1S3VadUdRYmdXMzlmeTU0?=
 =?utf-8?B?T0VBL21LN1g0TzFTNWtWelNRQTZDN2d5MTFlMjJGTTFTL3k0dE1Xd0VCS2RO?=
 =?utf-8?B?OVpkS0V2Y2F4Wk1CTzUwQzRnUnc3cTA5Tm9KL3Via3hLMHFONE9QWnM4enBi?=
 =?utf-8?B?Q21TN1hvMFJ4VUNUK29SZWI0MlczaTBITDBjN2FSd0NqL3V0YUg2WTJHRlpO?=
 =?utf-8?B?SjhubWx1eE9jQ3RJeVUwTnRSZWpNbU45RkQ1c2ptU1hTbFJhK0p4TlFSM0hr?=
 =?utf-8?B?a2RJRis0VUk1V056S2Q2VlB3bkVtSWw5cThCejU3RGl3dXdMQVprNTRnWjJt?=
 =?utf-8?B?NDc1L21LTjlxdEloNDB6Yk1CTDZvaWFua3lKL2NPVlFMTWxIZFpMU3puSHhJ?=
 =?utf-8?B?dmlJa1dWRjcrSzZRdEJnVCtvY05hS24xdGY3RHo5OG9FL2FGMFRyTFVFMXh1?=
 =?utf-8?B?Z3cwUTY2QWMwTXdnVnh3c2lSVExOM0NyZTlya0hZYjlaSjgrZVFnaWtVajRm?=
 =?utf-8?B?Z1BCbUx3blBFUUtXT0d3TFZzQjhFbWg2bkFxaFArTWFWRFJoaExZV2hrVzFu?=
 =?utf-8?B?OUJQNFlPNWJXM0VXQWtMRHQyRCtwK3RKU2lESEVYczM4T2wxNEEvZmJsdUhK?=
 =?utf-8?B?MXMxS3JSNm5lcTNXZXlkckIxQk5OeDdCTDR5ejh0aWVQUjNZTjBpTWt5Mkcw?=
 =?utf-8?B?ZEIzMHp2ZFFiWVF6S1Y3L0FMcllUZ21IbkJtVjBZRlJ4UHJiL0Rqa0g0Um94?=
 =?utf-8?B?emFHOTcyUXV6MUhoQzR4S2lpMmVnOG9nQ0ZVWGRFbDdtdkpYZml4b09jbzVH?=
 =?utf-8?B?aVc1bzZySE1QTXdob2VpL2VHR0lic1kyMG80NTA4eFhhUkZwUENyWFhtN2RW?=
 =?utf-8?B?SDNGYlRFSCtKTHdYaEwwMUg2eWttSHdmbEgyRFBzQWI0dy8zdHkrY3J6ZWph?=
 =?utf-8?B?V3cwb1djNU1vZStVRENLUUdVOEs0eVllRmdTTWtVYm1uZ1FQSjhhanF2Tkta?=
 =?utf-8?B?Z3JveXhVYUx4alRabnhtMmN6SitxbXVKSUdzWTk3ems3c1dDZGxTOFU2VWFB?=
 =?utf-8?B?ZGx0TGlVWWdjME5DMXhSazdzYktTTWVLWnU2eTdzaElra2FScVNvbW5jRWlp?=
 =?utf-8?B?R2dGQjFUQ21JQjU1N3F6dXF2NWQyeUhIN3k1dm4yWDVkTFRoRmJwUXBWeUJm?=
 =?utf-8?B?RU1EdXQxOEhqZjJpUlorZllCWVorL1k2YnBYOTNWM3FRSXM0ZEZLTHlSWm5j?=
 =?utf-8?B?N1J5SUU4dUtLalgraEZQTHdDZ2dpZ1pNT2hKRU1KNzRid3NVbjdkZTlCaDJC?=
 =?utf-8?B?WlZWRVRkdVpKV2RzaEJOWWtEelhHR3VaZ3NXSmFkR282TUtPeTBlZUpBSk0y?=
 =?utf-8?B?SjJGU3V6aktQUDBhRVlQL1BFVkhYRWRFS2h0azlFQ2hhUTRQdERyQ3dCTUxq?=
 =?utf-8?B?WlVuWnhDQXU4ZWtwdjVNMjAzakNZNXBCaXRoNTJVL1dYSG9aTlRWaXpQVE1M?=
 =?utf-8?B?SUpXai9lelZGUy9PQndBcGlpc2R5d0pjcHVZU1lFT1ROY0h1eTFRWnFOZ0Vw?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326c88e9-d699-4d57-a92d-08dd9710fa1d
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 20:08:53.0987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuJCRC4fK0OUyJO32u2coM72KiWIqcQY/BqGaUib1/PeRgC/AwYRxk+luoJL7NVNmwedZ2Ujs6/Dx32JrQAYE8SIvVvXkgmUXAypFYzNvRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0250

Hi Cosmin,

Resending my feedback as I accidently replied to wrong thread.

I have tested this patch using following hardware setup:
* Raspberry Pi 5 + MAX96724 + MAX96717 + IMX219
* Raspberry Pi 5 + MAX96714 + MAX96717 + IMX219

It worked as expected without issues.

Great work!

-- 
Cheers
Jakub Kostiw

