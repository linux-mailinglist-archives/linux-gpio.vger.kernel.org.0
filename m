Return-Path: <linux-gpio+bounces-19735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88260AADD90
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 316BD7AD2F1
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 11:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DB0233721;
	Wed,  7 May 2025 11:41:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazon11022125.outbound.protection.outlook.com [40.107.155.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043B1C84C0;
	Wed,  7 May 2025 11:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.155.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618095; cv=fail; b=VsJ09/rMDLs47LrcJEJTvODfodzTfOsj1h6dynjuh5+/uGdhkEnoj+KsgwBFZmcYFTH1b028Wc49yDxsCxQ9T8RJiL69/pS4hkxPOlbnX1pjDHiomtOeVUPBsEque5kFVK4rYk63q6BJTJmqVGCusCDzpdXSOGbkIQskqkVplvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618095; c=relaxed/simple;
	bh=nRr2csr1t4sjZgLyukwq7sAr96LSKGPPAwKEe330o4s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KO4hUa3MUV+4I9mIfegYxAMLNtNSVRzdmx1IA+JcTUceAIR28IZicM+TAquxevvRHDWy4aDbbwXyiKpB2i/9mleovEJblsbwoQzyBGHLVswIlqlbP1eQNCV53a3gLa0jUxfF+TBPzzWftNSdeEjJpl8uutjaUX6lx66HFDrpN5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.155.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoVIkhjNuQjMYm/trQa5nQtm1Au0XlkvrWlXhs5DCM91ZqQg6X5HBnTsmyr0lSCTLZyrUPPa4tl4n2m+pxrfxS+i3GOiKLdvKNizHfitMO5nD0cYUXvO81nq3uqMCA6+4NHn5VnMDbH4T4CNGJSKSq3ILZCrZekzteSUpxX1C1nIdEhb+AIJTK/GQEA0YgRdSsIbgKVY+aVAxWYBit0I7lzwUlvctdv6+/7qjlzea+rPm/mNTykdlc+CJuG93nakkek1EOg1c3jNKZaKaExdXtegRksKjVWIjjvd/aZFWeFcJZ/DrPoMKOcX9dKmLSUzucHT8rkMybXRGaeZhZyKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KJ0X5aV2bJQ6ELMC1hXM69FM7okKEGDAmPL2VgeofU=;
 b=Lr5KwvSy2ucfL3RkVP+Xj9jzjwG+WI5PzX4KYZVs2LLljk0eslV3i3S74bttvv2NjfXX7YnsIXiK8L2dcAezIGkFrPJYdczePGmk/FH756hc/cn4TjMZoy9TDEmP8+W4cLBVZ7719sAeBemjiolm75k7VsVYBDT3uIkwrzR3NWCYASzMr116k71Th/5fo3IjiYp+Yvjj0SzMhPpwCmK6H/48YjQXrQQnDsKb+MuBAUpqvC4ANarnKQTlNWx38MlCoBxqVvoRk/Fhtl01G5VYE3NgLISp3PIjvhP3t3aUFv5yQzns/uziJNqwvQnBEpRMwm/Jh79Wqtp/dvYMIukdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA1P291MB0203.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:10::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 11:41:29 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%3]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 11:41:28 +0000
Message-ID: <36e09fa4-928f-4388-ac91-d51a8ca199ae@videtronic.com>
Date: Wed, 7 May 2025 13:41:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
 <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
Content-Language: en-US
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA1P291MB0203:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d4a3cb-93fd-4125-16cb-08dd8d5c1afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU9xdnZoSkZJcW52MXBiZlhsMW11MFBGUGhVUGpwWDI2SDhyYmIzalFMc2x1?=
 =?utf-8?B?TDZ6dnU5UHhXdUo0L0VmVVNmcVNFbnRES2pwS2JUVXJTWGs2OWFJcjNrWGR0?=
 =?utf-8?B?Vjk2eW1zMlpXVjRTSDJzNnZTSGUvRXA0VTQwRHcrSzZvMW1Xd0Y4N21zcFVm?=
 =?utf-8?B?UlNwVUovcVBxZmNhUUNwTTNVRDhQbmVHaXJ1QmQ3eWVHWFZjNnR3b3g3ZUln?=
 =?utf-8?B?ckJWMTlHWExRZThQZTVPMytQdXE2MExGRUd0VDhWOUErWmVqN0dIQVdjc0ph?=
 =?utf-8?B?WTBzSlJieFIrMFI3ZXE5Y2FvU3EzbW9NUkc2YTdMSVhvcXFCZ21iTmtDSHJp?=
 =?utf-8?B?YU1aUkVmUTN5QXN2SXJEMkZ4SzN0bkwrY0l3eHg3RmJDNXNybEFhSGNwN1hp?=
 =?utf-8?B?ekxtdHhTSnZpSGtvQnU4Tk9kWHpIeGxrTUdDcEtlRzFDbU1FSTI5K1dONksr?=
 =?utf-8?B?WUV3YkRFRjF4ZEtXRFpudU9hR0lpb3Y5NXRmVnhxZVBOelhnVyttOExXTDBr?=
 =?utf-8?B?aXJLd3U2VzRHNEhTdlVkdmxjcjVHcjNVWnBlMDZLTVpXZEJrZHlBallKN2Z2?=
 =?utf-8?B?TGI1N1RnQXZaUXh6anJRdDdQNEUxdUg4SmZiUTlVek9rRGY5YXoyb0VBRTN1?=
 =?utf-8?B?TWN0Nk1kSUpRdy9WUm5wMUlxMER1dXdRWXlpWWZmdEVmYWh1MUhIVHRybWVm?=
 =?utf-8?B?Sk95L0hmTEJoUFdIN2x4Mi9sQWwxa01EMGRPK04yQ2dpclpjRm4wejE2Y1Uv?=
 =?utf-8?B?UHNEa0JZSDFIUk9JUGJVUzMxZEF2OGNTTUJLMlNjYkFMVlZrTGNaemdCd2V1?=
 =?utf-8?B?Rjlhd1RYOW5sa3hEU1krejBkQmYwa0ZQYVdUSW4yczFYWFBrRDVHVU92RVV0?=
 =?utf-8?B?a3ZCRmkwdHRta2lRbnFQZ00vdlZ6b1VzS0Nyd2IvcHVqVkhORjVSbkl2N3RV?=
 =?utf-8?B?UFlraXVoYVlwcHRMZEJ2OTIvcGh0S2VuWlJ3dFM1UU5YOFpveWo3NGlra1Ru?=
 =?utf-8?B?Y1BOWmdqRFhYbHZlT0FFMHBZRHZUZU44VFBFdjlHeU9JaVMyOFhqc0xFRVRa?=
 =?utf-8?B?Qi85SUZxVGhuRUIyU3RoczV3NmJyZFo3aDI2eWJON3c5Y25VZnRWeWJuRGlv?=
 =?utf-8?B?V1NDU0VJRk51ZFdlRnprYzBFVVZnV1lCK2s4YVl0RVRoWHVDeDBFakVqNjFk?=
 =?utf-8?B?R2xMYUlpQlU2NlByVGdxbWJNWDVORG42MHVHNHllZ2FUTmIzSEVNYmtmL3Qr?=
 =?utf-8?B?TXFhMjNmUHNrWHZrZWJlR1Z4ZEJ6WnJLWWlOR3JIVER0NXd4Q2VmV2FUQkEr?=
 =?utf-8?B?bFE5dnN5LzgyQ3JIQWtiV2RSeUJKNlRhOUZvQ2g2eHF1NFNOUFc4UDFoY0tM?=
 =?utf-8?B?R09lZjM5VVBscHJUdnhEU2QrRFpVWWkzbzY2djZ3bzBYdkRUSm9PdXhLeERu?=
 =?utf-8?B?ckQ2SVZwUENKQUxRcXNWbDZRS0tDMS9ybHhINEV2WXpzMld6VUdPYmpmMkgr?=
 =?utf-8?B?aE15Z3pYUHZsT1F5TEhLZlRpd0JKTjZOUVM5b2h1MGFTRisxUzJKanFlaW41?=
 =?utf-8?B?NHNEWFp6cVd1dU80Rkd6TG5OYWppTTdzU240T1cra1JzUnpVbUkweTE3ejhO?=
 =?utf-8?B?NGd0Z1dBNHFicHFycjlJMlJscndpNjlZWFhSenpFOW90MHdsS1ZrUFJuM2VR?=
 =?utf-8?B?UWprbUFmNjFIZ3dGaStkcXRNOHduTUErZ21xUWdoNDdvNWQ4ZVcyTjFpOGtH?=
 =?utf-8?B?bnVKNWtZZ29SUDFBYm5POHBZTldtc21HU3UwelN5bDI2NFlCT3hacVdQMjll?=
 =?utf-8?B?SFI1d1RvTDJGRXpsZnp4aVVvZDgxNXVQMDZCNVdJTFNaN1dzS25PU00ydFhQ?=
 =?utf-8?B?UE8rZ1VudEhDeUNEUzF1Lzg0OGJxVStwZGhWdStFdHlqYjg1V2hnSVpid1NI?=
 =?utf-8?Q?iDK/fDgCxDA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBaVGdvUGlWMVpybW1vQko3SngrOUxTTENDdzNJL2UyREJPVmdLTWdLZFFL?=
 =?utf-8?B?UWZFWFkxWjNQSzlwK0t3cStUVmQxZGRtY1BKa1pwbEhJUVpiZ0ZpOVNNcGRh?=
 =?utf-8?B?VlZNNDR2akZMUEFlY2dYUzVoVDh3bFlLQnBNWkZpOENPbG5aZ2p0cFVGUE1S?=
 =?utf-8?B?anhOWWN2TGFlOHEvTDI2M2s0WlZ3eEdZY1NPb1NXKy9jc0RwLzkxbVJkTWky?=
 =?utf-8?B?Z2o5VEhXd29SemVEQXlSQjBuczlsS0VsR0hnY0FrQW56ajdlZGJNMFV4UjZu?=
 =?utf-8?B?K1Y3VVdNUWlWT1dEV3Flc21IeURIUWU5T0lsR3ZzL3p3Smp1M0E2ZDVLYm9k?=
 =?utf-8?B?a0lYS1gvTlQ2UFhSSEo2c1lLVjliZXBiYkRkb292djR4YndEeGtmTU5yU205?=
 =?utf-8?B?T2VoeSt0RzBWQUNUZnBFQjNqcHNqdWJ1a25kYlJkZ3htVHJ6cEtyaDdid3E4?=
 =?utf-8?B?aHZsa1o0dmJTMjVVMTB6aWhvSEM0OC9Gc0hzeHRlZVoxK1RrY2FpRXdTMExU?=
 =?utf-8?B?a0cxanRTT09aS21jNXc2RHExdFZoUEVublRNOTZQS0tubCt4ME02L0hyS3Jt?=
 =?utf-8?B?OU1PUVJWM01LK2t5dWw1ZmIyUUhuNDJpY0xIV3lyOUY5cFZQSlhnNDVLQi9T?=
 =?utf-8?B?TmF1WWFURGc5Y1JoM2t2ZzVidUZsQ0xvNEdsa2x4TmtuOEJxdzVsKytMVUpE?=
 =?utf-8?B?aG8yNnF4dU11QXljMlMvUUNMTFpQVXVHNFJweGtDZ0YvanFlaHc5T1FBQ1BY?=
 =?utf-8?B?QkIrQ21kWlBIYWNPTGRVRjJ5OUo0V1pLYWMrbnlBVWw0SEgyL3NMdlhRQWhy?=
 =?utf-8?B?b1pjcHMwU0h6MEJZSUJsaGNyL2puRGlKOVRXVmtPSjBoMTY0M1FtbVJ2bkVy?=
 =?utf-8?B?WmdCYlZZcEtPK0lDb2F4eFJhRHRZMEUweVRHWDBwdGd6K0lCWEdGZkQrYUln?=
 =?utf-8?B?bjJEZmRzRVdON1ZDVWdKVHFreER3U25id2ZpQUtEQVduRlBjN2RwVDZ2WjAz?=
 =?utf-8?B?dG8vdmwycDhsMVU4bUxTcDYyWlFwSGlIRndRRjQ4VnFubS9pbHpoeWk5MGlm?=
 =?utf-8?B?VUU5QzFFNDY3eWV5K04yb2U2SERvczRDL2J3WElzUlV4Tld5a2xJTWFvS2Jq?=
 =?utf-8?B?aDZISDA5RjlVK0h2VEdEK2hNRC91OCs0SFVSRWlQVE1RVkJKc2Jtb1Fid2gr?=
 =?utf-8?B?YUh5OXdCZHpCK2d5N3hBbCtha1U5ZWRoSlNvY004UU5jckZOTzZKelNmeDBl?=
 =?utf-8?B?OXdDL0cvUkFrRXJ5blg2M201R05kcXc3NjFrWDJ1ZlhXUDkwY3ljMjlxdWND?=
 =?utf-8?B?Vy83UW9Ib1MzSkI3REZDODVSaG5YVXNGQVJ2MjVEd3BoYnI3b1ZiMjVKN3lm?=
 =?utf-8?B?QUF5K2pTMDBpT25vTEVXaFVPZC83RmVCV01xRHpGRE1sN2REV2w1K0JxNlpx?=
 =?utf-8?B?M2c4SE1KMEpzSytmNGRtYURhaWFjMmFSNndYOE9DNW1mUGxheitnZVFiT0Va?=
 =?utf-8?B?Vlp2TTNpVXdtRDR6N2x2ZDVvcHFFMWdKOTRybEx5OUJuVkN2NWxEM3djU3kv?=
 =?utf-8?B?VnVSemdEcElHdzBScFVLc3N6K05qaHB4K0FtNXh0QjRqa2F3T3B1MzFRK0Y3?=
 =?utf-8?B?V2FPNVhObzZGdGx6S0JlZUY2STRDZ0NrZ0IyRldzK1NxUHpmMDZVWXVSRVdR?=
 =?utf-8?B?cGoxUlg2VGRWNFZwUUZBNUh5dFhaSC9iNFY4UzFZcEVUamV2anJZYTJBWGRk?=
 =?utf-8?B?ejlaaE56OWRlR1BWRFJHdXQ0SzNYblpYakltQWJYd0tVSFhzU0NEM1hZOTdF?=
 =?utf-8?B?Ykl4TzN2YzhSMkNNZzZTZ21ZSG9LdHlRRHVJcW1jc0VYSy9DQlJDTDRHd2Yx?=
 =?utf-8?B?VkdnT3g0OXlLM25QNm54YlhYTVhNaUZHTHlmTWk1dHZOQXBERVpacENScVU4?=
 =?utf-8?B?WFZxMWFPNmswdFl5SVAzUUxwYTZ6R1I2WnpBWmxBcWFkZlErZ3JLZFQvclN0?=
 =?utf-8?B?b0RhS2g4bHprR0VaNTUyOTB3MWhFS2k3RzNWaDg1NHIvTDNaTDBOVjhieHNB?=
 =?utf-8?B?aHlCVjBGd1JWcUZkQ0c2V1FpcnZ6U29HY1RzMGdFbThkb3VKcnM5dHYyR0F0?=
 =?utf-8?B?clJsckxzUzY5MlRjcGdSa1VBRGtFOEFWSS92TnA0L2MvOEx4NWh2cENvSzF0?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d4a3cb-93fd-4125-16cb-08dd8d5c1afe
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 11:41:28.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3GfZObXJ/TdqCV3B9Ll6oH06r6ef8ChLZUTc8GrPd61q1Th+O9JFxwQUyPWUE6LCd40MbZv7M26M8z08dCrIzZbd8sevg8ito7bPSnicP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0203

> Feel free to shout if you want help on the Pi side.
>
> Pi5 should be able to extract multiple virtual channels to support
> several sensors simultaneously (up to 4 VC/DT combinations). It does
> need a rework so the CFE runs from memory rather than being fed data
> directly from the CSI-2 receiver, but I believe that is pencilled in
> as future work with libcamera already.
>
> Unless things have regressed, libcamera should report all connected
> sensors to SerDes setups, and set up Media Controller appropriately to
> use them one at a time. I know I've had that working with simple CSI-2
> multiplexers and thought I'd had it working with TI FPD-Link III
> SerDes (Arducam's IMX219 V3Link kit, modded to remove their MCU). I
> don't have any GMSL hardware to test with.
>
> We're also fairly open to merging drivers and overlays for 3rd party
> hardware into the downstream Pi kernel. If they've been reviewed and
> merged upstream then that is the ideal, but if you're prepared to
> support them, then it saves the user the headache of having to build
> out-of-tree modules.
Hi Dave

Great to hear. Our initial test were made on a hardware that was 
designed for other platform (Toradex) so our test options are limited. 
However, after evaluating Cosmins drivers we designed a proper hardware 
for Raspberry Pi platform. We are now in a process of review and will 
soon manufacture it.  We should have them in our offices in upcoming weeks.

It would be great to work with you to setup everything properly. We can 
send samples to you if you wish.

