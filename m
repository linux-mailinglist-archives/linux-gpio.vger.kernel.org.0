Return-Path: <linux-gpio+bounces-14752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 606C1A100F1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 07:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6814E188795E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 06:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCDF2500BD;
	Tue, 14 Jan 2025 06:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="QRyF1Ea7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2116.outbound.protection.outlook.com [40.107.215.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBBF1FBBDE;
	Tue, 14 Jan 2025 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736837192; cv=fail; b=OFvyJ5OfXyW4bKrWnLGJpT87AFPO3d7cN+JDpAfUM9b6vct1onH+nkjSsKm/CQZ2A0dFuVxQYiHuiGQg+A+SJna2gCK6AMEBfgbLJ04mvzsmT+4RcgV2vrv8Ibx7KoDcH4zwKxLYt/2bAS71Q8C1vQRp9R083pVTiRXYYRhX8Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736837192; c=relaxed/simple;
	bh=T1YKubZHJlzIn6xfisXp6U2DrU5E/2kRD1YKU3Bbnl8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CQ+0/9jeNSnUXYGk1VGi8EXuEBiSlDrPQ0TN+I0VV4VZoUqROQ3ivhoVKLYA4Sf9tGOWIaVSdV90wGrgLmPNhO7e4r8vb2SxYQsexsU0jqKtFhLDOZrtcwTW6ISlXtcr+Ikt8Hvob0CSr5xe1qSNXuOU1Fr30QVGZkIa2wjp+a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=QRyF1Ea7; arc=fail smtp.client-ip=40.107.215.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFG38gYE6Jt3ndZjQTt23ehG/6xgZza7LE1gTA+4bQY13ji7r3zPY4eOwMjM0/cIB9ElJ5Znfqdr09UJLeBsZ70jERfMUE4FFxi/bX4rOm0OqlaPfnTfdmqRggGv+z/V7ASwtjyT3uqbHX1CahhZlXoiQS6XCZzAROyonWDJTeo/az+yKPdyh+0mEBCKIdMbRP4XU/fCak0hDcHYcq/LAKTxun20BjIfCyzP+Twt+wvEZs4QCfbfWyQaUoHAr2yc0q2amHCqm1Q5zXAjL/XNszrsKR6W0y7+6Exn1zHEgZXdxzWHypgIuIdCodQA8D9sEdZJDG4hYHqdaBiBvNWLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfnNY26gZvis41T9pzW/hAZhH2yxNMd7D/7GoQzUilQ=;
 b=sE3j70C3rdOoms8JylSNzMDm7GkIxhkpMATsWcQ1RVxabxkNkomsZDL/Aal73d1mY4TKnfF4q3UESQ3pMacRjAWvbvChU5rZ5iQJec1rzZ2+IcBIoEHZIhZkquX92hcS/1qXvcurPKqyK3KM0rX8dJfJRpNHURtrqJeqWzNyXmvhm8fBbGxjM3hLSTOvylyg2ogd+uvyeI0FdCfXBU91HTQw6qZZtoWpD+I1dtTtM3WPx1rBJFLjSsxW81ci0sIQ32VDe2afcfz6suwwbpIo9gq7EdH/rkT8J0n4uKBWzyhbYkm14VD93tPubLYZTqfTwa2HKGqKuNdbDjishKq/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfnNY26gZvis41T9pzW/hAZhH2yxNMd7D/7GoQzUilQ=;
 b=QRyF1Ea7kpmtJEHR31YDklgUoaITo7GW9t+0ieHq64xVpNPBt9x4HFvVp8MwX3tiSOMG4EXx0M6hLKQIZMHKu+uTbIBrUnqNm29NkQC3CCZyy3y61L3bh6MzcB9cuiwbgIyzdTCsuXDzeGp3Z586apN70zej/wEaSdL7eNhCKiTbKp9+EVQBHh6UbOp3iF6JBGXs+c8xaiZthxMNWQZ3/hNR7eLn6YNEbIPQ4rOBWq9gN19EyY/rSQkvTMN+b5EK3Dg9VKGn6JCUNET2FUeAf+Ym4Hoijm7CsgUUmfZq8JrZgyusCxHlFUX9WcKZYtCno8UBKZoNUkX/ur5hjzm2ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB6513.apcprd03.prod.outlook.com (2603:1096:101:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 06:46:21 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 06:46:18 +0000
Message-ID: <0798c8b8-6b0e-4e24-8d81-5cf8e06d129c@amlogic.com>
Date: Tue, 14 Jan 2025 14:46:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
 <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
 <1jed1ea7vz.fsf@starbuckisacylon.baylibre.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <1jed1ea7vz.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d3e80b-af3b-40b3-6e9d-08dd34672634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2NCT3FOR29VUU9hbENUeGtKRHlmbVBGQklkaitQY2Zjd3Y5L0tCZTNWRndU?=
 =?utf-8?B?bi9GVmlBbDhnK0hNRGNiZHF3OVZPTkNVb1k5NnEvWFhQN2V3YVFhczlSU3Fk?=
 =?utf-8?B?dkdOZDRoNUROQ0tSN1ZSYVVCVElDRW1PeFFxT2tsZEI3aVZQNExwc2piZGM3?=
 =?utf-8?B?TlJTRTZObkV3cERCK1gyYVIxOXlEb0RDVXJRTm4xT3pMWkdoSEpaejB5Ykc0?=
 =?utf-8?B?bkdMNUUxNStVOGlseXRIRldKcmhKWW55Q1JwSUY3Y2lwVndEdHlMSVJyTThi?=
 =?utf-8?B?OEtGd2dkb01tNmo2Mk1SU1dKYTJDd0ZtdndBRkc4eWtrZ0NVRXlQSEJrWmlE?=
 =?utf-8?B?ZThSWnZNRnVobVV5OCttbk9WSnpqTUZZSmEyWG5CcHFpQVNjZ1ROS2xFcnJC?=
 =?utf-8?B?L3dxTm1UZzZuMnd2bmJST3N6WjgrU3FHaUZWSVhEbWVyVEZwTjhzK1V2ME9j?=
 =?utf-8?B?Mlh2bmYxeEdTaUx0c1dzSkJEUG1oTEtqZm1CeGszNFRJQUh1STJnQTBUUmYx?=
 =?utf-8?B?aHBTR3BhMm1TUFN4WGtQTXpJQmFwd21zMUtsQmR5ckluc1lsTWRiSDBweFdR?=
 =?utf-8?B?cGYrTzJIZXZBdlp2R3dQYXNON1JUZWFtU2JnakF1dXJnQ2o4Rmlac08xNmU1?=
 =?utf-8?B?SUFwYkM5QUIzbndIOXBCSGkxOWdKSEx5U2FHeGoyV0hzL2VJaVA1RE93L0J3?=
 =?utf-8?B?SSs1b1o0QUpnZXhnWXl1ZUlhOTIrOWR6cUVoMjFvWWs2TDB1OEk3VVp5SUR2?=
 =?utf-8?B?WWFNMWY4SlRMOUNNbmIzSm9RZlBxdFdFakFCK2kyb29lWkJRL2VLekdpa1lV?=
 =?utf-8?B?dFBCZ1ZIdzlSVGRPRU5LVi9HMWlSc1dsWHFDNWhROExCcnN5SnVwVytVM2lG?=
 =?utf-8?B?UkRTc3dhOFc3N3ExcDROQ2FhWFhJajFTelNpTXFRbDZrRXVnZUFjQjZsY21Y?=
 =?utf-8?B?Sk1EQm5DbCt3RitLSWpETk1QREM4bjlhbWJ1NHpRQ3o1NkJNcmk2MTFyQjk2?=
 =?utf-8?B?YVM3VjRoMjQ0Z3V0dWFoWHNTcWdTU2FmOEwvaDdhNXB4V3c4UUFuWmtnby9p?=
 =?utf-8?B?Y3BLTlphMXlGbEdDeFF0VlcvOXpnbEZkRzlmS0N3bDE1cGRoSG9wK0tVdGdY?=
 =?utf-8?B?cHBiV0Q0R0NmMys3ZTJTZm1mVXVSL284ZWtKTFNCMENLdXU3SDlPVkdmbEJD?=
 =?utf-8?B?dzZ5cXgrZFZwNUcwOWdNZzNldUNmRG1Lajl3eXpVYVNHY3BpZ00zbCtyYTdJ?=
 =?utf-8?B?Qkt5TlJBcmM5RUpWVFFkZ0JLdFg1QVMyUXVzQ2NrbUVXOTBRRGFacU5keUR1?=
 =?utf-8?B?OVFrWXNuYmpxMVRjaGVqeW81cFpzSGRXSXladVdFQzdDYmRlVGdrVDNpUnRZ?=
 =?utf-8?B?Rzh3ZjFsTGlKSWowdW1vUGdGcDR3dTZFdmFFSmZIU1NlME1qZWZPanVpRFFs?=
 =?utf-8?B?ejdUNzRDOWdSckdIK21RM0MybU14d25LeHYvb1J0TDZMbWZRVE5aVlhXOVBy?=
 =?utf-8?B?V3N6b1k4QWIyckQ1Q1Eyb0p5UXNRM1lNTGhqK2FIQXBlY1hFR1hSVURTWnNN?=
 =?utf-8?B?QmRJSWVzK3djSmpaNERZQThQOU1ab2Y2NWVVNmREa1ZlRUNlU1NZMUJ1eG9U?=
 =?utf-8?B?S1RCOWkvcitmZlZCNjJHT29CaFhoTHAxbmh6YkpYM2NOWWd3SmJCd2g4MC9H?=
 =?utf-8?B?eVlqTHVXOWtzY3JUWFlSSXQzV0trUjlXclVNeHdZVEg5TFVxVjY4cmgydzhu?=
 =?utf-8?B?b21rWFZyTHNWQ0FZSmRrdmN6RUNSWGdLZERxOG9aY0ZUL3ZTQW9yT1ozUDZY?=
 =?utf-8?B?b2QxTjdIMXVvaDY5NzNLUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnNWeTBnVW5MMGgxY0lXQmZKbkZlTDBQR3lJZE0wSU1FeXFsanUyYnBsVzg0?=
 =?utf-8?B?NUNJY3FBakxHM1pjc0JBZmRteGNtT21Vd2NPcTg2emxsOTN1Q3l3TWNraVJr?=
 =?utf-8?B?ZnZqeVpZc2dXTDNUVVZHaW9oV3FqamJlT2FwYnVlc0RRa3hqYnliU1VIbTQ5?=
 =?utf-8?B?ek9rSTlQbnhwQkhHUjZEUGhQa3N0a09mZGVvSTRHdGtuOWswUXRKRDhKMlRW?=
 =?utf-8?B?RGN6NStYbHJWclQrVWI5OHpnbDRETWdsK1FQMFdMeDhGQmtvdFNyb2RSdHp3?=
 =?utf-8?B?aTY0SWcyOTB1ZSt2Y05zWW5JbWZaaTJHRXVuTUFXdGlSVGRWUjFEWk9MV0JE?=
 =?utf-8?B?TFBlTThsNE9yb1IxSEpBLzlzOGR3cDRKd2VTU3NmVVJmYlVFVVBnNzVqVlFY?=
 =?utf-8?B?ZktVK0hHKzRYOE1LTmRtUzZKTHpYN25pcVprdEcyRDlRUVB5c291MXFwVS94?=
 =?utf-8?B?aHYvaDhCM1dIRDFQMTVQRXNtcEFMYnA0Z3hkNk5Xd1R5RE03YnZKL0tNa2Ry?=
 =?utf-8?B?WFYxazNRSmFpbnQ4VERoblJXdHdDM2xkKzJrTGg0VWlKUzJUYzk1NEdCWHdE?=
 =?utf-8?B?OEFjSlkxZ24wWUhWbHBrYU4zTm9DRjE1QlVScm1MUVltOVNjZU5HQXU3N0VV?=
 =?utf-8?B?Si9vVHJkVjNKS21CT25pTFNYZmx4VWJqTUhYK0hqdGlCc2VNckFkUWd0c3VU?=
 =?utf-8?B?MFhwNWpyTWFibXh6UXVRajNLNHhmRHB2bkljS25KeWFvWVFzZmhrQVMyazdO?=
 =?utf-8?B?bkQzSFlXTDE1ZnRTK1dUcFQ4bndPOVg0NmZyTlJMdUM2NEZqaWNvRUF6bWVt?=
 =?utf-8?B?K0d0STFicUtzTVpnT0kxVDlVZ09oQnBPY2tTbHhsUXoxVS91eUxkbGhJSVZj?=
 =?utf-8?B?WkpKVU5vSkhHV0VjeC9OVFU5SW9SQjZZTVE4dkUveFJwcTQ1bTAybFgrS2dz?=
 =?utf-8?B?SjAzVGVWWEZiVXVEeGFtN3VmSk4vVDM1cEVzUXRHbXllTjljSit4SlhwUHJm?=
 =?utf-8?B?NjFsUjhoZ0F3MVNpUjhMUXlLanc1Nmx5amVKS3pRMllWazRjTk96L25vZGpj?=
 =?utf-8?B?MzE5d3Jua1o5QjQ5ZW51SER6aXpsN1gvMXBES2NsczhYb0gzSUtYYlh4Zlp2?=
 =?utf-8?B?czAxTGhSdlFzVU5YY2NQdjNSdTFHN0NWYUliQ2llT2JMdXFsdmo1a3NBS0V0?=
 =?utf-8?B?aDhZMjV2eHRMaFpTcWJuemtnbEp1SENuR1ZFSFpSWUR3cUpwRm1uUTBOa05z?=
 =?utf-8?B?YzRVUjJxTy91UDVndStkcjR2b20rZnhNak83cCt2a0dpYStuS0VtQmExbm1B?=
 =?utf-8?B?UU1IMUhOQXdhYmsxaHB0MkNyOW50UVFwTVgwNUQ5OTF4azRiR1Y3NjZPbUJP?=
 =?utf-8?B?MUp4dUdzVzlmSzdiMEkrV2xRVjRNc2hLTU0yZFFyZnlaeVlBdHRwZU5NM2Vq?=
 =?utf-8?B?RnExTlI0Y1NMd3RpVEJ4RGJ4ZXB4dTZhYkxEYy9JU1AzTWxGamc1aWJmdENL?=
 =?utf-8?B?L3dzRWZZc3NKbXVqTkREdEh2MUx3M2l6bWI1d3QrWnQ2T3VJSEo1M1BTeFlh?=
 =?utf-8?B?c2ZJQVVZOG52S212RlcwUWRYb1FzaTZKYjF1SE9pWGlobEVOWEV2U016MGdY?=
 =?utf-8?B?S3c2eDVKb0JtWkRtZWhQekRCZzVkTWJOMTZSM1lnTlVRODZPYzhSNTFJTm5Z?=
 =?utf-8?B?OXZuVGJETU93UFp1OUI5aGFwUW12M2VXem9UdHJ6WWZDQkZiSC8wc05VVnYx?=
 =?utf-8?B?OWJxeFBtYkpGa0o4RTVsd3U1ajNYVkFaMWc0QUs2cklkV0JndGdhM2hTR2tD?=
 =?utf-8?B?dWRtUkJiYWk4K2ZIN1pWa3JnT1p4eEdkcWEwRkE5RDc2VkZWYmdwYXY4THpN?=
 =?utf-8?B?dnBZOCtPTW1VNUZZVFEvdEhEZFhWcHB3TTVJcENrNDBzODFUZzZaQ1YyVHpZ?=
 =?utf-8?B?YjFTbGRidisybVFYNElXWHc1Y3VwVjBodTE2OUZtVDVJWFMvZnVSUTZKN0Zu?=
 =?utf-8?B?WXpFMmoxWmVNczZZQjAyQys4amRiTUlJMnpXeDNodFlwVlJsQnI4MzBaYThF?=
 =?utf-8?B?ekViZlgxMFl2YTY1dWdMY0hkaUw3TGIrd2Jucnd2QlAxVU5ZT0lpVGoxNXNS?=
 =?utf-8?B?czZ1ZlI2WG8wa2FYRlpWY2xGVmxESWxtbUR5Z3pMcWlqaVJJZmNYWTVSVjlQ?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d3e80b-af3b-40b3-6e9d-08dd34672634
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 06:46:18.6298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8o31kyMlnmeFvIY9WfvHiYnfUO1S5IzRWjHwbfM5lH15LTDvPvWTMOymgZcECM/tURIX2JsFiNvUwAwZ3wmwLaKBW241i7kAO6eeVAuxDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6513

Hi Jerome,
     Thanks for your reply.

On 2025/1/8 00:47, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu 26 Dec 2024 at 15:57, Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> 
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> When describing pin mux func through pinmux propertity,
>> a standard API is added for support. The pinmux contains pin
>> identification and mux values, which can include multiple
>> pins. And groups configuration use other word. DTS such as:
>>
>> func-name {
>>        group_alias: group-name{
>>                pinmux= <pin_id << 8 | mux_value)>,
>>                        <pin_id << 8 | mux_value)>;
> 
> This representation does not seem very generic but more tailored to
> your use-case
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml?h=next-20250113

The document above includes a description of the pinmux property. This 
is not my personal usage but rather a common practice, as other 
manufacturers' drivers also use it in a similar way. However, the 
specific definitions within pinmux may vary between manufacturers.

> 
>>                bias-pull-up;
>>                drive-strength-microamp = <4000>;
> 
> If you want to add pinmux (aka alternate function) selection as a
> pinconf prop then I think there should be a single pinmux setting per
> group, and as many groups as you need per function defined.
> 
> something like
> 
> func-foo {
>          group-a {
>                  groups = "pin_a", "pin_b";
>                  bias-pull-up;
>                  alternate-function = <2>;
>          };
> 
>          group-b {
>                  groups = "pin_c"";
>                  bias-disable;
>                  alternate-function = <5>;
>          };
> };
> 
> Something similar is already done to handle different pin bias requirement
> on single function on amlogic platforms:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-axg.dtsi?h=v6.13-rc6#n421
> 
> 
>>        };
>> };
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/pinctrl/pinconf-generic.c       | 130 ++++++++++++++++++++++++++++++++
>>   drivers/pinctrl/pinconf.h               |   4 +
>>   include/linux/pinctrl/pinconf-generic.h |   4 +
>>   3 files changed, 138 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
>> index 0b13d7f17b32..a4d3c12a80c4 100644
>> --- a/drivers/pinctrl/pinconf-generic.c
>> +++ b/drivers/pinctrl/pinconf-generic.c
>> @@ -233,6 +233,67 @@ static void parse_dt_cfg(struct device_node *np,
>>        }
>>   }
>>
>> +/**
>> + * pinconf_generic_parse_dt_pinmux()
>> + * parse the pinmux properties into generic pin mux values.
>> + * @np: node containing the pinmux properties
>> + * @pctldev: pincontrol device
>> + * @pid: array with pin identity entries
>> + * @pmux: array with pin mux value entries
>> + * @npins: number of pins
>> + *
>> + * pinmux propertity: mux value [0,7]bits and pin identity [8,31]bits.
>> + */
>> +int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
>> +                                 unsigned int **pid, unsigned int **pmux,
>> +                                 unsigned int *npins)
>> +{
>> +     unsigned int *pid_t;
>> +     unsigned int *pmux_t;
>> +     struct property *prop;
>> +     unsigned int npins_t, i;
>> +     u32 value;
>> +     int ret;
>> +
>> +     prop = of_find_property(np, "pinmux", NULL);
>> +     if (!prop) {
>> +             dev_info(dev, "Missing pinmux property\n");
>> +             return -ENOENT;
>> +     }
>> +
>> +     if (!pid || !pmux || !npins) {
>> +             dev_err(dev, "paramers error\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     npins_t = prop->length / sizeof(u32);
>> +     pid_t = devm_kcalloc(dev, npins_t, sizeof(*pid_t), GFP_KERNEL);
>> +     pmux_t = devm_kcalloc(dev, npins_t, sizeof(*pmux_t), GFP_KERNEL);
>> +     if (!pid_t || !pmux_t) {
>> +             dev_err(dev, "kalloc memory fail\n");
>> +             return -ENOMEM;
>> +     }
>> +     for (i = 0; i < npins_t; i++) {
>> +             ret = of_property_read_u32_index(np, "pinmux", i, &value);
>> +             if (ret) {
>> +                     dev_err(dev, "get pinmux value fail\n");
>> +                     goto exit;
>> +             }
>> +             pmux_t[i] = value & 0xff;
>> +             pid_t[i] = (value >> 8) & 0xffffff;
>> +     }
>> +     *pid = pid_t;
>> +     *pmux = pmux_t;
>> +     *npins = npins_t;
>> +
>> +     return 0;
>> +exit:
>> +     devm_kfree(dev, pid_t);
>> +     devm_kfree(dev, pmux_t);
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_pinmux);
>> +
>>   /**
>>    * pinconf_generic_parse_dt_config()
>>    * parse the config properties into generic pinconfig values.
>> @@ -295,6 +356,75 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>>   }
>>   EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
>>
>> +int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
>> +                                       struct device_node *np,
>> +                                       struct pinctrl_map **map,
>> +                                       unsigned int *num_maps)
>> +{
>> +     struct device *dev = pctldev->dev;
>> +     struct device_node *pnode;
>> +     unsigned long *configs = NULL;
>> +     unsigned int num_configs = 0;
>> +     struct property *prop;
>> +     unsigned int reserved_maps;
>> +     int reserve;
>> +     int ret;
>> +
>> +     prop = of_find_property(np, "pinmux", NULL);
>> +     if (!prop) {
>> +             dev_info(dev, "Missing pinmux property\n");
>> +             return -ENOENT;
>> +     }
>> +
>> +     pnode = of_get_parent(np);
>> +     if (!pnode) {
>> +             dev_info(dev, "Missing function node\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     reserved_maps = 0;
>> +     *map = NULL;
>> +     *num_maps = 0;
>> +
>> +     ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
>> +                                           &num_configs);
>> +     if (ret < 0) {
>> +             dev_err(dev, "%pOF: could not parse node property\n", np);
>> +             return ret;
>> +     }
>> +
>> +     reserve = 1;
>> +     if (num_configs)
>> +             reserve++;
>> +
>> +     ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
>> +                                     num_maps, reserve);
>> +     if (ret < 0)
>> +             goto exit;
>> +
>> +     ret = pinctrl_utils_add_map_mux(pctldev, map,
>> +                                     &reserved_maps, num_maps, np->name,
>> +                                     pnode->name);
>> +     if (ret < 0)
>> +             goto exit;
>> +
>> +     if (num_configs) {
>> +             ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
>> +                                                 num_maps, np->name, configs,
>> +                                                 num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
>> +             if (ret < 0)
>> +                     goto exit;
>> +     }
>> +
>> +exit:
>> +     kfree(configs);
>> +     if (ret)
>> +             pinctrl_utils_free_map(pctldev, *map, *num_maps);
>> +
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(pinconf_generic_dt_node_to_map_pinmux);
>> +
>>   int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>>                struct device_node *np, struct pinctrl_map **map,
>>                unsigned int *reserved_maps, unsigned int *num_maps,
>> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
>> index a14c950bc700..a171195b3615 100644
>> --- a/drivers/pinctrl/pinconf.h
>> +++ b/drivers/pinctrl/pinconf.h
>> @@ -138,4 +138,8 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>>                                    struct pinctrl_dev *pctldev,
>>                                    unsigned long **configs,
>>                                    unsigned int *nconfigs);
>> +
>> +int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
>> +                                 unsigned int **pid, unsigned int **pmux,
>> +                                 unsigned int *npins);
>>   #endif
>> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
>> index 53cfde98433d..1bcf071b860e 100644
>> --- a/include/linux/pinctrl/pinconf-generic.h
>> +++ b/include/linux/pinctrl/pinconf-generic.h
>> @@ -232,4 +232,8 @@ static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev
>>                        PIN_MAP_TYPE_INVALID);
>>   }
>>
>> +int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
>> +                                       struct device_node *np,
>> +                                       struct pinctrl_map **map,
>> +                                       unsigned int *num_maps);
>>   #endif /* __LINUX_PINCTRL_PINCONF_GENERIC_H */
> 
> --
> Jerome

