Return-Path: <linux-gpio+bounces-36337-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DulNOVI/Gk0NwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36337-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:10:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 397F14E48B5
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 046FB307B65D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7455D33509B;
	Thu,  7 May 2026 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="lVxli9ud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021084.outbound.protection.outlook.com [40.107.208.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6A6328B7B;
	Thu,  7 May 2026 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141164; cv=fail; b=ktPQRE0LPIx0yR6Io+9WY9g/Ub39vETSeYuwCd6mA66SsNyVjXRz+t+HRBhVcsfBon9wpyWS46q/spaSWpwWlyTx5sK9cwwk1YJlqOK4l3Pw94OwKrnfJXGdCEvXjiEc3y5Ngl7xr2jDqJ6ux4O2K8g88tDzjGY6u/BfinHBY84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141164; c=relaxed/simple;
	bh=1ZTTVyhWL3Q8qZ4kzZxIfDO7Nvp0jwDDZ8ESDDHU+nQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZCF+e5P8VYYptXkvJPcftHVKjL3jKp8V7JkS/86LZYAfoDhuQqlQ2aIYGGv7vQp7opkvOPGyf119qpfMwvdMCbtgXd6W4DSjM5MBc+zJAkJHqTBHgNWYI3y8M0g9GhCdWwtYln3gYZALO6Q4crp9X8Mtksl5X3lhcjK7+0ca8Cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=lVxli9ud; arc=fail smtp.client-ip=40.107.208.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgXCRKVrbHCOvHWth32YXQIB2D3MmY4wBBPnODKFHM8NSEWJ/ttg5JB7q5J+gyPQ4pS72a3+5T0KKCt8gakSIrhn12OLcjaHnBItVuVe7TQ/BAZJFYLDKFqTX5UvuLIdx/gDPuVE5Wc/zSV+3pCdSVdlOE8U6lg5re5Bk4awzsugHYuZQbXVTdViXy1kdgl046Lu1B7gfmsagD9HLlEvRDpQ7bVimCRsuNa034ZFjjJLjxEGjcm7lJxxpy/aoy8jiVwsfDT39gsjSHkAAfqLP9i9E8I3C80WllkA19JZ46LCsg9OHoj2CSDsLWhjHZYd648FSiQSfm5XLEYJmJtC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nezvdZlNtUk2r4AGj/zNJdh9sF59HPHJLVWa/htujP8=;
 b=enPXG8gXb/eBKRYEck15OodHLjZo65tO4yX1x5K0y5zMoyug4ZIhtoZU9dKr3vRpxybJOKJZect0ae2b89nRdn6K3ZeFcSU42tU0BdWzi8zSN9D2oilf5I7YZCtBHahRpb4/yHbDWMIrqLKX4MZtTPrXR6Qx6Ghv0deBpLsx0VsUa1jp6PYXa4jk5umPiceqI9pUpcmmUV/5z7enTzPG+ofuzLm/jih20uNlT2R2Y9cxK4GZgW0qQZutcHQ6ktPfakOCJG3x2n5hSkGoIy7cLMk8YWJrS1/uilc//QvNHBlMFlnZ6oMRm+i7B2odkZ9/SaO46GnS9q6UNxRm90eKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nezvdZlNtUk2r4AGj/zNJdh9sF59HPHJLVWa/htujP8=;
 b=lVxli9udNY2Q4txjojETFD29FP37LsR8RgJQopRCGVvZRsy81Q+wivZI/hgogwfNsb4sKJjxsLRnaT8urr/wXZKl0gaRaz4q0WntM++U4XH6Tkqch+5G0p4ypgIAbQl8oi9ERofPtOK2Gz4pIXa62LwqCH5dq+s8LUm1wB1Xo3+NBHz/bOWUxxuwfHr2BlK0jXQaWERqwLPqMbHQTHucZ4C3JYLC2fvWCjVKowNDvRqG8UKI2debannQaisDQcpOmAntsjRTkhNwLGJeHEpnpA6rTLoV39AOVA8bPNePvkKErEEQILjfJv+qPzaWS/0srAvc5/WUg904KlW00xfDHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 PH5PR18MB927674.namprd18.prod.outlook.com (2603:10b6:510:39d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 08:06:00 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 08:06:00 +0000
Message-ID: <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com>
Date: Thu, 7 May 2026 10:05:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
Content-Language: en-GB
To: Linus Walleij <linusw@kernel.org>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::12) To BL1PR18MB4133.namprd18.prod.outlook.com
 (2603:10b6:208:310::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|PH5PR18MB927674:EE_
X-MS-Office365-Filtering-Correlation-Id: 986fef4a-24af-42da-7757-08deac0f71fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|8126099003|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Q3QuoRqK/w9oUic4F8SSW2VQnSkQS904ozxv87ubaObtXmzsf1c4khIesl+vEpkxTu9Ybw79Tv+cbSdpdW+0o44jdyvGlxspscKKB4cvKomQptDAb8NfTOG2i2oott92JpDHQG2fvdvp1ibJgJpKfvan4vNbIoV6NPdNafcDnkwotBWMZEudN2tVPS/qvW/Kj77Afx1xBmnJsHekI0sKylN7BUjFPidZWPq2LEC1T9YfqO4KDYKu6oftLKq+mJd/wSOaiKqd/+H52yb3O3Alf9DWknzV5TF9BIZ66GeRr5o2bo/q84ggJS39gmXzjqwNh40V2f/JFK0QcE2U5YbV4Mb1g9sUHCQWNDGYhny5QZhhFhZNNsVzK648ARF2J7PUpjramKpSmmLSC4U/G8HSonbnYMAtcmcDrXyl019wuykKHOWsSIogui4zOdZxsk65TmzUkH/XhWQG0+ctnJsZdPBYAOxIx1KuOw/3hZwbiZCFUy+A27zGvWU9ry4hc0wym6x4bjra6i4VHR6nOGUTWuP3UWUbiHZWQUoM0YZWL2ghiD2/ex5Z5PZJuj6ZBE1D3Rx9ruwajdJhsZEbrJD4w2+vSLlVoZHFmOprBaMnk2F4x9wFcPU/mQrHarG302/4bvjSUFIiFEjINyy1YZPVYit0GrlRIWmdHjonRxOjHfMIOg3HNFTicwEYJRyP7KPI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8126099003)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzZzRHlGbEhwcG9QMnZZbEk5bGlnaXVydmdjNEQ0VFppUW4wVGRjb28zN0lT?=
 =?utf-8?B?RnUyS0NXOTFma1djZmxCdmIvSTdJME9RWlpSZHZZQ2t6OUFIWUF6dGVDTDBp?=
 =?utf-8?B?alhRVURaUEVnamJ0V0VZS2lZalcrVzhZc2hyNGpsM3Q5dHNrVVd1M0NBVGhO?=
 =?utf-8?B?bmVrM2tuV05HeUZFc2p1UjRLTkdONUQ4bDRYS1ljOXVCdllveTdlb3BVVkYz?=
 =?utf-8?B?d3FTMWxNbUttbWFVUS9oS1VzZFY1cW9qTDQwS2s3ZUNjRGtBRkY3QThFakxz?=
 =?utf-8?B?MTI1ZFI0U0hhNmxmQmtZSzBCaE4xbnNUc0o5Mk5YR1M5d3V2NWh4NGNkd2pJ?=
 =?utf-8?B?RzI4cWxmRmsxOFlMTWlyY3lGMWI1SlVMWlVRQmRjaDdKQXBYTTFoMzVrVW9u?=
 =?utf-8?B?NWtsNVNJZXpmWmZ3OE9lLzJGNUN4ZlpQM2l0UUJpcEJWUU9kTkNKYzFicjEz?=
 =?utf-8?B?KzNFekVOUk9uY1lCbno3VlJ1T01va0NyWmVXQ3EvRDdIY0tubkwrS2MvU29V?=
 =?utf-8?B?cWNEOVgwK25vbnNCT1I0RzFFV2ZGWk4yMExUa2JuR1gzUjY0NG1qVHBYRlBZ?=
 =?utf-8?B?dEoyZ1BaRkJrQXVONEx2ekpyOHFiajl4NWY3NWE5NjlJclVTYlJUM1ZYWGQv?=
 =?utf-8?B?Y2ZrV3VMSEVMdHM2eTQvSWdOei91K1NRakhDRGlaK2lmWnJWZEpzRHMvR2xM?=
 =?utf-8?B?WFlqTHFhMHR2MGNEU1UrSnZZdWVIeUptME5OZ1krQWh5ZVNnbUprc25HMytp?=
 =?utf-8?B?d0UyaGxHV2JqUXVjUDRiSFRWUWpHeStFUmg1anl5dElhTTZWOXRMT0tpOXVi?=
 =?utf-8?B?Vk1RY29yR0FtMyszVEtKR2hUVHlKWTdZWU1TWmFlNHd2aEQwQ0VSVlFqNWZ5?=
 =?utf-8?B?NnFVZ0RmQU5BT1lCakZRU05SMVpjQ1o3R2VPRVRBM3pSenBLUzhFNkJNNUN2?=
 =?utf-8?B?dWpaelJvYXhJemdCbFNIbVRJQS95bXRmbldJblNzMWJDTDlqRExqL0dkQ21a?=
 =?utf-8?B?Nm9YSHM2SHU3QTJhUWEvWHJnb0ZVcW5FdlFkTWxVUDNQQ1ZNa1dBZVN5NVp2?=
 =?utf-8?B?WDk0M0dNbytPbTVjcytEdjdNNlE3K1ZoVXlZM2NKT21uemZTMVhQcHZPcjcr?=
 =?utf-8?B?SENoSUFkMnowaE1SeUsrOUQyc3hydk9QN2FVRDRSOG92dEpDM05HcUF3TFJp?=
 =?utf-8?B?RE52WW5DK3o3RFJTMHNVWnpDdGs2cWk3VUd4Z0FCelpLU05USjRDZzA3L00v?=
 =?utf-8?B?czB6M0YxcnBDMzg2R2ZDeTMyZWpQRDg5dFJYcnZDUHJtdlVISER1TStYeWpB?=
 =?utf-8?B?Z09lYzdNT2t2L1ZvWFRJR3JweXlJUDliR3pSMW9BSnIyV1VmTHc1TkRNRzVJ?=
 =?utf-8?B?ajFkUG14ZVFRY05MdTAvRDR0dEZiTXczVXBGbkNqUWFrWlRwTk0wUXdvK2J6?=
 =?utf-8?B?OXo0UXUyUlJYMTZjZVlKZTllZ0xheVBFSWs1ZnBLaVFpUEo2enFXSzBYWkpm?=
 =?utf-8?B?ZktKZ2xsVlRHR0dMRmFEM0dHRzNoOUcvS2VDY0tpeVlkMGM5Z0tQY2doSjFn?=
 =?utf-8?B?cnFWWnpQTGNYZlh1cFNubDNaRGc3TTB3WmloK1ZjdTdab2gvemRTaHNGeXo1?=
 =?utf-8?B?T0hSTGJZVEZJb21Wem00WG9oMUIyTTR3WWI2bmIrOEhoZjZMc1R5REtndU84?=
 =?utf-8?B?RHVINTFtYXlwRXFkWmJOemx2dVcxWmxidTQycXl6S3JOV21WZ1pCRnVXakhI?=
 =?utf-8?B?MVhqS1lmM2JydkxkR1M4MmhtSGpjd0VOVVlIZWwzQzBHbEtEWVQ4M3AxTGdu?=
 =?utf-8?B?eWx4emNINDhjUjJTa2FucmNxRkpDZDE4NmxxT2xpUk1NSktPRml2ODdiQ1Jr?=
 =?utf-8?B?Z3gwaUFndTZSbHRYQUp5MFNETnJCRTAwZmk3TFQyb3oxWVhXOVFFTThKN210?=
 =?utf-8?B?Z0FoajhSaGl6N2llcVpXSENtbW0rM1pjRnB0L0lFblR6SUIwdzhCczNLUTdn?=
 =?utf-8?B?K1ljcW5UcEt5ekhKR0s3MVltUXBTN3BpRU91aitpRStGb2RiYllRWGdtM1Zw?=
 =?utf-8?B?b2pLYzNNOEMrMGl4QVVjbzRCTEtZU1ZhM1FsRDRPam1BZ0JPRFRuc2RQdGV1?=
 =?utf-8?B?NHVpbkszcDBVT3AzbVl1ZDJsK05mN3dNMEEwM0VnZmdiK2xpMS82UENxNFk2?=
 =?utf-8?B?TWF3WHNJZTh1b252aTJOWG16TzdFNGxrMUxiUitVdi9Ba0Y4ekFhRnNpd3pX?=
 =?utf-8?B?RzI3UGluYUd1S3M5ZVlmc0NkekxWMWFINW5ObWVzbE80a1dYc0ZoS0JHRGtN?=
 =?utf-8?B?T3MxU2tGdHFKTG1mdWRVZHcydlZWT2IzM2dSd0prSmw0eHJUcmFUdz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986fef4a-24af-42da-7757-08deac0f71fe
X-MS-Exchange-CrossTenant-AuthSource: BL1PR18MB4133.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:06:00.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WCMPocwRv4y5S6oun0ow/zvanW+XGNzcNB7k8L6mDqy8c21Fxyk6tGbWWd7NB9VPqDDMlV+0hK325WjHBG9BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR18MB927674
X-Rspamd-Queue-Id: 397F14E48B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[axiado.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pstepanovic@axiado.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36337-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[axiado.com:+]
X-Rspamd-Action: no action

Hi Linus,

thank you for the detailed review. I will go through the comments step by step.
Replies inline below.

On 4/24/2026 9:26 AM, Linus Walleij wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> Hi Petar,
>
> thanks for your patch!
>
> On Tue, Apr 14, 2026 at 3:49 PM Petar Stepanovic <pstepanovic@axiado.com> wrote:
>
>> Add device tree binding for the Axiado SGPIO controller.
>>
>> The SGPIO controller provides a serialized interface for
>> controlling multiple GPIO signals over a limited number of
>> physical lines. It supports configurable data direction and
>> interrupt handling.
>>
>> The binding describes the properties required to instantiate
>> the controller and register it as a GPIO provider.
>>
>> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> (...)
>
>> +description: |
>> +  The SGPIO controller provides a serialized interface for controlling
>> +  multiple GPIO signals over a limited number of physical lines.
>> +  It supports configurable data direction and interrupt handling.
> This is pretty generic, can you write some details on how this happens?

Yes, I will improve the description and add details about the SGPIO
operation and data flow.

>
>> +  '#gpio-cells':
>> +    const: 2
> Are you sure you don't want to use 3 here instead and split the 128
> GPIOs into 4 "banks" second cell being the bank number?
> <&gpio 2 4>; ?
>
> Maybe this also solves the 512 GPIO by grouping the GPIOs into
> 8 banks...?

Thank you for the suggestion. We would prefer to keep #gpio-cells = <2> to stay aligned with existing SGPIO drivers and current DTS usage.
A single linear offset is sufficient to identify each GPIO, so introducing a bank cell would add additional complexity without a clear benefit.
Any internal bank handling can remain within the driver if needed.

>> +  '#interrupt-cells':
>> +    const: 2
> Same there.
>
>> +  design-variant:
>> +    description: SGPIO design variant size in bits (e.g. 128 or 512).
>> +    enum: [128, 512]
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> Just use two different compatible strings and infer the variant from
> that string instead.
>
>> +  ngpios:
>> +    description: The number of gpios this controller has.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> Same here, certainly the 128 variant has 128 gpios and
> the 512 has 512 GPIOs? Just use the compatible string
> to infer this.

This seems to be platform-specific rather than strictly hardware-dependent.
We were considering keeping it as a separate property (possibly renamed to |axiado,sgpio-ngpios|).
Would you prefer that, or deriving it from the compatible string?

>> +  bus-frequency:
>> +    description: The SGPIO shift clock frequency in Hz.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> Don't you want to use the clock bindings and a clk property
> for this?

Yes, I will rework this to use the standard clock binding instead of a custom
bus-frequency propert

>> +  apb-frequency:
>> +    description: The APB bus frequency in Hz.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> Dito.
>
>> +  dout-init:
>> +    description: Initial values for the dout registers.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 4
>> +    maxItems: 4
> In:
> Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
>
> you find:
>
>   lines-initial-states:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description:
>       Bitmask that specifies the initial state of each line.
>       When a bit is set to zero, the corresponding line will be initialized to
>       the input (pulled-up) state.
>       When the  bit is set to one, the line will be initialized to the
>       low-level output state.
>       If the property is not specified all lines will be initialized to the
>       input state.
>
> If this is what you want, use this standard binding instead.

In our case, the hardware provides dedicated DOUT registers where
each bit directly controls the output level (0 = low, 1 = high).

The lines-initial-states property also encodes input state semantics,
so it does not map directly to this hardware.

Would you prefer adapting to lines-initial-states despite this,
or using a separate property for output initialization?

>
> Yours,
> Linus Walleij

Thanks again for the guidance.

Best regards,
Petar Stepanovic


