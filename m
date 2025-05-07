Return-Path: <linux-gpio+bounces-19728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3288AADAA5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 11:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 621E94E4AEC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177832153CB;
	Wed,  7 May 2025 09:02:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazon11022104.outbound.protection.outlook.com [40.107.155.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1894B1E76;
	Wed,  7 May 2025 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.155.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608541; cv=fail; b=hD2ixv/Xi5TxMr63Zd2Z/eWr2JxwBAcvJupyEEOdiJdIssOOIovpgf4fcaFqln9a8qGzNUBmFOPjaFFY+5vHim3laUvE+zSc4bPUIKKKYM6YZiJRO6PyY+l0shfIc27Sw/X/qZLYA8pFPPNn8VdSUy01L0ezcdL1PFlS40Fz/+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608541; c=relaxed/simple;
	bh=BLL6+gjj0TdnpQChlcZRURrksV4dkOUZENy8Om7HYJc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F7kvg7fE14OsqDNV+BS0KOUZ/YZcMPNDQXLPaTr1dxaqPak5U8jazQ+/7WGeIttgzNn/z5BeUVGCW7FjpiCbMby/s4VCnMdiPftqzTpNm7j/njfGBaUUi4SxQFfDy7cq82TJWjllvzWqeCaNf6diIeGdEsRCd135YsdVg4gZ5FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.155.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+VFq4dsiD0W0OXmTEdQzy/Rf2WnysUE+xbqVqtp7zkYqDOqKJ5lil3WHOwfoxuKAXM1VaAt9dUWj9A99SWClPtid3egtrqF+8NNaaibIe2syzWCv/pR+9Id30lsiCL+HpGdivRSHbscJ5nk35wWzUuy7LnXVX8O0E6T/jeI47o+VGFEWiHt+NnoeL6cvH1OID+rL45LfyNeHDLyVHUCBYGYc0ujGuulVzlCqVhu2xUE4BKfu+IoirO/lcFYNLDonsNyvj6bCPpFVLW0xSheh988BZtIBV0XWsH0OM9oBkoN9daejcQTZjBGU1lWd3bwYV0wNPnwzBCkulq4o3tnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDvT2AgbD3My6YO6Yb581HFQheXUiSMQvYxqVTj1Nxg=;
 b=Cm0fpHAS/jDprQqelzx5ag9KDZsArhIU81r1oGwMy0V24BsUDNaMX8Hj9Tv1ldL5ylHtG7x2bkpS1VCAsyU2dviz6W+i/lQ8IiQwBM4P+6QZD/48hdstNZHs9d9ScONJ1Z8Vf2yXK6LSAKxKu0il7hlP+VzczKJOMHxol6E7aW0ia0MAmQV4N9APEUWmrlS1tXypoXzdgUHHj/nwg96IDcvfFNYSsjm1fEAAol339xZahtJ1ajqP6E5bKqipTmXfqx3van9n2oPUKmXYUpMvD6Mikaou72yZ7xt7rBnFjk3z9oRCzSQxX5d09vbW+xmavqvdsGC57JS21v7j9J0FBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA1P291MB0035.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 09:02:14 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%3]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 09:02:14 +0000
Message-ID: <3fa35ac8-1c06-4106-97fd-28ceebc6d131@videtronic.com>
Date: Wed, 7 May 2025 11:02:12 +0200
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
 <29eea52b-a512-4948-b4e0-e6d19d09ded4@videtronic.com>
 <c56d03cb-14a4-4a7f-82e7-80368c3ca4ec@gmail.com>
Content-Language: en-US
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <c56d03cb-14a4-4a7f-82e7-80368c3ca4ec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA1P291MB0035:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae473ae-6e47-4b6c-0ff8-08dd8d45dbea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUw4bHNBRkZDM1k0Si9FQmtLeTZWek05MENLd0FESWd1T2l0K2ZFZWVpOEE0?=
 =?utf-8?B?Y0djWUZGL21nY2R3ZWdhemMrRUN4aHVGMDl0K1MwSDFrWW5hTTZCRm42YmJL?=
 =?utf-8?B?bWRTM2tuZmNtMFRWdmRBM3V4dGdWQllVKzk4T1BKOTV2Q21UZ1V6SFZ5alBQ?=
 =?utf-8?B?RWtGUFA0TlpIU2JvVkxDOWtzbmw4d0dkZ0pVNjdGb3lJSFpnZUpmS3FCRUFi?=
 =?utf-8?B?QzJ3djZJVGRydlJsZU5kN3M2UlljVnhHczJWZ1NabGpqZE9vdDVUS2trU3B0?=
 =?utf-8?B?TWJ3VTFkL2liR0RPMjdONW1kcG9jdnBPUFhyWFNBa2pSbGxHQkRyRC9LbWVM?=
 =?utf-8?B?UEVnK3BhendweTlXSWFDbVNJcGtjcExMVkhPMytJTCtkdk1Gc1FhZnRMOGk3?=
 =?utf-8?B?VU9qTFFveVhnZFFQb0s1M2djb3hFbkYrK2drUFRuOE9MKzMydXo0bHJtczlL?=
 =?utf-8?B?WUdWTjdqaHpRYzV6N1h2bUd1eDZSTFhESmg3ZkZzZHRlbytvTkNRQll2cWNs?=
 =?utf-8?B?M2FNanZYck5QczBpalRtOExUUHlZTEpCY2ZHbHV2MEROS0E5QURwSXNSOGdC?=
 =?utf-8?B?ZThWbktNai84KzFzYVZRL0hyTGlLK0hRMkVpc0VhTTJsZmc1eU1jUnRwRkJU?=
 =?utf-8?B?Uy8zVzkvdlhVUG9NU2FpbHZNd1BlVnJ4ZFM2RnJacDNMeE94akt6MmgyWTFh?=
 =?utf-8?B?VWczNEdKN3ZSbnVlV0pReWZ3TkszN2x5VWtNM1kwMzYwMWEvUkU5L3c3MnM5?=
 =?utf-8?B?M3c2T214Z1ZMRFpXVUpxMGY3aUJQNlZzQmxHa2FvSHVoelE1Q01zNC9pc0l3?=
 =?utf-8?B?ZlcxdmNtcUYrTkM2MW5QaHltMDhyQmxMRVkrWUdJd1ByV01vQ1FCNVNJWldK?=
 =?utf-8?B?eDQ0MGthenR3bUs3bkM0ZWhtbkRiR1JEdEVNTWZQNlMvNG9pWU1WMXB0TGxT?=
 =?utf-8?B?eG1mNlVSdEhxWnNzYzBzdm9RTjRSUHdYRGVlTnlnQ0h6c0lrRDk3enlFTThT?=
 =?utf-8?B?SkNuWFRESWtrMktoTnhHV3NoRVVTeXBOSjJLQ0t3azhwTVFPR3B2VjZHdVVH?=
 =?utf-8?B?aXVTWTEwU2NCMCtxakdvMFZVcmcyd1htbkJyTTBpT01oTmRsUTRMUmlOZlhk?=
 =?utf-8?B?ajRqWkE2NHBwOGd2OVpoZTZIc0Y1OCt2d3c5Nk9kamFyd0FncHJCaDR1ODZ6?=
 =?utf-8?B?Zk1tSThwbmZuVHdTUCtiS2ttK2RwbE8vc3V5Ui9Zb2daeEUrWmVsb3gzbFRt?=
 =?utf-8?B?WkxZbE1ZcVdLcS8vM1p2aVdzN3ZNT1kwVjY1bVZmT2k2YVNXdXlsUitPRjlo?=
 =?utf-8?B?RENJZm5ETWdFdmVWN0VqRkdFdjgyQnl4bzEwVnR6MTkvM050UEFKNXd4YXdm?=
 =?utf-8?B?YUM4c1RRMVNZTkhyQmw0L1doZSt6UjBzdi9YNlVWYmtiVHBjOVhQaG13L1pZ?=
 =?utf-8?B?cUhlVTJTaEpVMjlSQldvKzJKYnIzekY4L1ZpRGRuMDEyNm84N2paRXl6cTV0?=
 =?utf-8?B?MVZhYmhhTHcxT2lDdzNNZGR0S0tuM2RvNVd5NktmTmVUSjgyYVdUV3ZLb3VC?=
 =?utf-8?B?aVI2dGV5T1NQaURKNElDRUtmakxiUnRJMkNESitvWDFLZitiNUxUU0ZEenhC?=
 =?utf-8?B?bWZaRDd2WVVwUXZZdXc0M0hpN2gvanlxUjRhSGtmU0NFWGRyV1pMY3FxNXI3?=
 =?utf-8?B?VEJvVnh6SWNMY09JRkZDTW9aN1BhTTltWTBpMjRpMHZKOExwRzBSVW1YM2t0?=
 =?utf-8?B?dnprOHNUQ28zc0ludU9wcG1FNGd3VUlwL0xXVjhRcUhWOEI2ZGt0Nyt3VlR3?=
 =?utf-8?B?TDdMQUhINXZOL1lPK1l1eFB5UjZiWGVFZENialJQVmdISzV5RGkzcWJtb1V6?=
 =?utf-8?B?eVJjNWlRQW5na1lLYjM1MGdpdnpGTFg5L3JNUGVHWkNsR0g3YTJJb3cxZnZr?=
 =?utf-8?Q?3wHGxic6GOU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDlja3VTb1NIMDZkV29BdENONTVraUtiTlhZM1N0WDFISThHYnJEcVRWSmFM?=
 =?utf-8?B?N25MMkdyZC85NnZpSHpzdnhIK3FlT2ZwUEJ5eGpMMlpYbjJTalV1VFJlUWpx?=
 =?utf-8?B?MjFpZEpnenE5WmUwam4rT09XbzRzT3pUYk40S3hjcEorUlg4K2F0aU9DcXNt?=
 =?utf-8?B?TXpMZFlRazlJdXJtd1MrbDhHT2l0YkhDMStnYlRwKzdzaDRjb2dzYkVibUt6?=
 =?utf-8?B?cDgwbkVaN1VxUmxTNkdYZWRMTEhWOU5rcUk2UHdIMjRUWGZRYkhsTGlwVDlD?=
 =?utf-8?B?elFnMXFFQ09SS3E5OFhWL0dRSkhuTmlUWENTN1J6dVFQUTRSaURheHZqeFVj?=
 =?utf-8?B?TW15QkFYT2R6cXVBMyszU2xPNjBhV2FhMkNmdXNUK3B4S28rRXJTUDZDRTdS?=
 =?utf-8?B?K0hkWDVtekpkWGcxdmJqNnlzQytrRjIxcHA3ZlhUa2ZwdkJtQ2VxcFNnNFNC?=
 =?utf-8?B?UFkwQUh5MkpuajFXaHBQODM1bFVsT1lpYWxaRmxUSWxVNy9hMm1JY09UMDFv?=
 =?utf-8?B?RjNqWnhZZDRrMEIyMmFwTTJtbkdIY09EWmJOQ3JQOUVuR3dRNG5qQVR1TFNQ?=
 =?utf-8?B?U0V5LzdSejJuOGNaTVBXLzF1b1U3elZpUENSTkVvR080TktGQ09rRVpJQ1FY?=
 =?utf-8?B?d1QvWUR0UC9aZmh5RXBQSWxEdlhZQU9sbDZpQm5kWDcvN3JLTEUyZHFlZDRR?=
 =?utf-8?B?aThSWWM0V2lpQU53YVB6NzNkZnE4L0xGZ2RVa21Oa0c4b0k2ckQ0VlRTZkN5?=
 =?utf-8?B?NVMrc0RraGlTR0lyWGtKRTRoTzF4alJ3VWVsNDlaSG81cTNiK1NmVE9HNHNP?=
 =?utf-8?B?eDE1dmlIeE5yaDhBaUFqTFJBNzh6a0FQaUhMcHB0T1drUi9UMWtHOW1EY2pO?=
 =?utf-8?B?V21XbEdPeVExSkdUT3ptZERCTFU2QnUvdGYyM3RPU2tLcXVjYys5SFRmdENt?=
 =?utf-8?B?azdVcVNSTHg1OWk3aTR6VGk3ZUFWSWNqRGt3T0x3a3M1blpNSS8zeWlSNnZB?=
 =?utf-8?B?SEYwZWtKN3BzaENmbEVlUUx4TVFiNURiNFlWZThlNmRtNVVwLzJuKzJpeUhl?=
 =?utf-8?B?RVVaRlRZUmFaSzZHQlNjWlRvZnVkTkJZZXFVZnpVT2hRa2FvK3JLbUxKWG9r?=
 =?utf-8?B?U29PSnZhV1pGQmI1VUVObi9FSUFUWGd5K2hpS0dPUTNLSTFWcElMQ1RTcEZQ?=
 =?utf-8?B?RDFiK0RjTlpIS3V4aVU0STd1NlI0TUE2ZXRGdUNGL3IvUS9lVnUrdWgybjI3?=
 =?utf-8?B?eFdJT3lWbmhmdEZrcnBERXVSRkFLZmFkTlBuYjBWWW9nU2VNVlRwMXUreTI1?=
 =?utf-8?B?b3hzYjZhRWxuY21YY0FtS2dwZFhQK3F5Y3NoSzhOOWJqR1pxakNtK3FhS1Jo?=
 =?utf-8?B?SFVGV2Uvckhjd2hOeGV2TGt6Q0RlcVMybFB1UUxMR2NpRVhGSWVXb3l4Yi9n?=
 =?utf-8?B?ZE9BOHpaUkZxeE1lNFk3aHBIMlZzOURBem1Oall6K1E5TTJXNHlIb2I0cW1V?=
 =?utf-8?B?aVRBMURhTlp3MlluejVaSjFFcVVyenBMOGdneU9DbXpDWXc4eFp2N2p3YnpY?=
 =?utf-8?B?Qm42eUkzbEVpVW5tZ2JNVTNGa1VtSkI0THVrWmR3czFtdWhFTnprbDNOTGJq?=
 =?utf-8?B?cjBDTGNUNzNqRWkwUmtsL0RJckwzaWRFcS9uZzJiTi92Uit1eEVsMnluekpt?=
 =?utf-8?B?T3VWRHc1S1BtNmtGZ2FxRnZtc0hVaVBuVksyOU5qbW5wUUIzcXNZL3lPekUv?=
 =?utf-8?B?dkwvbFJ4dGN5MjFwcitxcmFWRHdMeC9vTmxvTnFqQ0VjM2cvMDBkMEpaSHpY?=
 =?utf-8?B?VkFCS0RYUlY4NGdzVDFadHF6Uk16VnM4Mmp3UFJ4bEYxTlBEcGp2YUp3RGFu?=
 =?utf-8?B?U3ZCaHNwMDJXQ2Myemdydzc4bXFQSUQrZVpXSGdmaGpnNDdmTHBwT1VYMytZ?=
 =?utf-8?B?Ri9aNHRJaFVNRWl1U2NFTGpPMWxjbHFpaUIweEtLeFVVMHZpTWorZTJwL3Vq?=
 =?utf-8?B?bFQ5cUJhVlVGT2pQcjU0dGlCVHV6REtkc0Jic0Z1dzRXVEdKYlNqTmZlZ2ZF?=
 =?utf-8?B?YmVOU0Fvb3hXZFJqaUsrMEdiN1pvdjdQUDk4Z2Q1MDFlWlppMVpnclZVSUI0?=
 =?utf-8?B?bHZDR2JKd3h5VnRrRDRxMzdZbFRnQWNScXViekt6dEZkRlNIeG9TTTFjSU5P?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae473ae-6e47-4b6c-0ff8-08dd8d45dbea
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 09:02:13.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV8Cvzz4Hymly8q7oMgR5zq5zY6743HsFtNVjDd6K6dDRJ4BstPmdBQ6VkUFjMInfKtS/hnxb5cdupws4931lmQTAa8P2wj23Od/P9iDsoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0035

 > Can you revert your changes and try this?
 >
 > diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
b/drivers/media/i2c/maxim-serdes/max9296a.c
 > index dea0518fd790..3bb80fe42a22 100644
 > --- a/drivers/media/i2c/maxim-serdes/max9296a.c
 > +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
 > @@ -519,7 +519,7 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
 >         return ret;
 >
 >     /* Pull DPLL block out of reset. */
 > -    ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
 > +    ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
 >                   MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
 >     if (ret)
 >         return ret;

This fixes the issue, great work!

