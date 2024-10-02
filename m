Return-Path: <linux-gpio+bounces-10726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2A598DEE5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A679C284295
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8881D096F;
	Wed,  2 Oct 2024 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sF7OrHU2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F51D0434;
	Wed,  2 Oct 2024 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882738; cv=fail; b=QijhogxizHzDSd9a7dHliZ+gFTBKAD+4BYzW5IFesugBbIKGtZiLdTSTXWBY1wQHRaolAFtKfilyaFFNRrwcomC6QrOXsyh+j36bWU8ccJ+uQjT91yoMsWZ+xe9HRPE6PcPZ4GftDDI1ONfkyQgV1jAP1fWDcpaQzzBv07CRaf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882738; c=relaxed/simple;
	bh=Walb4wHgdXwNZQctKmCXLxOrPbRzTRXaHrLFE4VTawQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j6o1QKYFFv3nzkbsm1zCS1aH0CsvQHyVOPZ4HUr+3ZzkKcFVohTXVfrIf6+KcPblq+Vh+sjli29PITom35OZfeMBMN1Fqewznp4+I/DUQP0+ji4ajeWrXGm+2WVHtVSkgeecZhAM/QCH697UE271DJjRRGltS/ypstDtqAbiutw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sF7OrHU2; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNJfKAsIE1Vmsy/45+A4FVxaJLDiFEmmxMvyNUNL7nV4YFreHMKbHNKoGYVFSp+gaN4SM5TbLLVzmN4/FBql3pNQ3P3mq9KiDk8rsA6kyhrbfE1cDPi4f4Q2m2XhvE5cpx/E9b9bttRBN9CzOzXiIXfxb54VxYueHMZitlFUIUUb90IIk6AzPYF+Q9ugo4mJ7UAI2iC6gw87Zs4OiZQfVO4aC139buM3C/YMYKVtZB+v325nMFep7bdzykeQu3xuNrJhROHZTSp49XDygw7OVbg9HE5HWKDEWp+foCJnyl7XtsNJEBRrGl6k+LnmcSPWFO0Li4FoOw6gAzIrsRbGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFYHurOGiXiDM8r5pjJzqhv8h2YBhXHFj2iRLAw8Rvc=;
 b=pLnAqNHHT4G/BKRrFB8yla3U/LG9DRtur2pkR3K9ON4a8aN0/gkgL30nJH6qfMNK5ArXkuvNPmiSzGE1trjS3Kz/c2pr1TBvdgsyiCjoT9i7M/RvYyPg3yAvuluUm+IIuYcQ/CtTuT+f/3v3gdGu1TYHquLIkWgyal77iniZH+qWTzhP3ujw6MeMUBwb1mXxRgfjqXRr+/m2pv7LUtfWNiVRzbTAb/cRaSV+fiJVdWCaZtt5GoClNu+n9Mmwx88wBZwoOPQlqcJXl6MYYQDfE38isWcbnRadM5KdKPp1hkd0ZPPru/hIDEGBIflhpf59uKYB99f8N7jA1oTVNG0Ygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFYHurOGiXiDM8r5pjJzqhv8h2YBhXHFj2iRLAw8Rvc=;
 b=sF7OrHU2OSQSBKthjNMeWlSSgoUxMs82sRw7YKWeOORmrXytBgzZXxv05j64RovJR/2gc/XEJK48HvMBzEu0JFcf9ucRymM0f+u7Fz8WwWpX1iv2/CzSlnPpt+7zX+uKEoZepLmGkRzH/kokj8xLpbgUpfdt+qlaf4nP5hzntf5ZNIH7TEoMvtESB4ke8PT5io3g7iuvy5kK6L1d1h2PC1tjNUNVj4Ww0Kpx4sIZ/oYtLHGo5Vv3upWNxM1GMzPAyGoi0OloKbFuGKNb68bgWls52r1VRRLLV1QBNcyRe+gYcfnZwb8fYrC3qeWncpCL3HdkrNVeh7XhqalWT43XBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI1PR04MB10075.eurprd04.prod.outlook.com (2603:10a6:800:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 15:25:32 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 2 Oct 2024
 15:25:32 +0000
Message-ID: <a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com>
Date: Wed, 2 Oct 2024 18:25:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: add S32G3 compatible for the
 SIUL2 driver
To: Conor Dooley <conor@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ghennadi Procopciuc
 <Ghennadi.Procopciuc@oss.nxp.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
 <20241002135920.3647322-3-andrei.stefanescu@oss.nxp.com>
 <20241002-finer-huddling-d02b451a7c16@spud>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241002-finer-huddling-d02b451a7c16@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:208:55::33) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI1PR04MB10075:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf775df-bfb9-484f-c903-08dce2f67442
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHRGTnJGVURvWVBCall0SGp6czMyamQ1TDB3ZlF5S3MxZ05UdlZRRHF5R0Jy?=
 =?utf-8?B?cXBzZlUra1I0ZHEyZVl5UXVpK0VjcG5SYnRyQUNWUDlEUFNwUzAySzRRSHlI?=
 =?utf-8?B?VFE1TmJTbU1BdjNibDg2cjRlZWZkU2JtUDZaamZDYUVYSXVieDJ5SHI0cGQr?=
 =?utf-8?B?R2tTUFhBdFRVdExzREJZMDI5REQyTHY5SlBUcFl3cUtuV0JFN3daUm1iUGVy?=
 =?utf-8?B?R2xBVGpYU3ljZ3U3amNSLzJxY2pLTWExN3c3TG40Y2dFL2VVV3VGQWdUNk9P?=
 =?utf-8?B?MGNhcHJqTE5mcURuL0ZjbHdRM0Y5anFoU3RUT3YycHRIbDVzdFAwTys3YW9R?=
 =?utf-8?B?dDFycnJUS2t3eUpjSnczS1ZCK2lVWXRZK3pYakliUGtsRWxURW15U0U4T2p5?=
 =?utf-8?B?WGFpekVvV0NpVHdrVFk2aVYzcC9nK3dUYlZkdmdDZTNjcnlPVTFxT0FtcHo3?=
 =?utf-8?B?bmNmV0FHR0x3RTNxSU5tc3hKTHgyYkJEM1JzZmpabmg1Nk9jMFJNVlM4NUpq?=
 =?utf-8?B?T3JndFFicEkrbEh1cUtNdWhyVUVKWEJmRTNOck9nSVdtUW1VSWFwRitESWk0?=
 =?utf-8?B?dlN5Y2QyU3I1aGUrQXNwV1pibUphUWQ5SVNUZCs3bzlRSEhmblBiKzdIMjU0?=
 =?utf-8?B?cUdnZVViS1VjMFJnVFI1NXNpMGpwNm42VTEwWlE2UEhTbUg3SkFKbklVZldt?=
 =?utf-8?B?ODhWS1lyUEwvbUNtM1h6U29INmV2dzNyOFlFOWJXUUlxdWdoMk1NbGxaMW44?=
 =?utf-8?B?dHNlbnl2UkZnOGlrL1FWVGM3SEt2MUZIZkVRc2d0OW0wMnFFUDNHY0hEQnYr?=
 =?utf-8?B?TWlPdUtkRlpES3RIUDVOcTlzTDVKaytUOHpuYmJtU3lLRERIaHhwK1hjQTI3?=
 =?utf-8?B?SWJ4UFM4S2tyaFdnNzlsU1YwbFR5UFBObnVrdnFZOW1oSGZzazlaUVhFdWdy?=
 =?utf-8?B?SXNiT3VJMHdzeTlWUU4vQ3RMekJidGFiNmNlTkxLYTB5SGNLV0VSWk9yQjM1?=
 =?utf-8?B?T1lPRWh3TGRQblloSzJHeE50T3dSeHBBeTI5TWxESEtoeG1ySUdwa1dJNWhO?=
 =?utf-8?B?YWpyVnR2aEYwd2NmUU5ob1hxSCtTZGRGeWdTN0s5ZUxTKzFTTDJkcU85QTl5?=
 =?utf-8?B?YzhXWmd4TEpmUjNiOE5Tem1WZ09tVGdZS29PMHZlUnhMdHNmSkRRNXFJWG0v?=
 =?utf-8?B?SDdVdXd6b0VCTWhIaFVLd0cvZGlka2FHMmdRR015SndoSk9IODBTcWRlYlJS?=
 =?utf-8?B?aVBZOEhsLzlqMktqZGRNYU1iK3hRaDF1UExza29wKzlNWFE3WHVRdVpIbmlU?=
 =?utf-8?B?aVF1ak0zd0diNGNQREhlR3EyL21CazBQdWNNMXJaYU1iRG1iZGwzeWFyWDZo?=
 =?utf-8?B?RURJUGNGQmdSdjlvZlJLeWZBZEN2RHhpdk5wY0piZlZ0d1QyKzNSK2lyakpQ?=
 =?utf-8?B?ZThlU3IvZXgrVjZzbE1nRkdaNTk0QkpHRzYzdEU5WEt1T09hQkFmRnJtRlE2?=
 =?utf-8?B?WU9JRVBSaDR4aEFqQXdod0dqWjBWcjFidXZZZWYxZHVzZWdoYWNkY1Q3a1Iv?=
 =?utf-8?B?UmZ5aHdYQTlUY01tVGxMQjV2OTBOUHdialVhQ0VyOFlTQkwrN2dlR1VudmRm?=
 =?utf-8?B?dTBocHN6Y1NSQ1FYU0dqaEtHZTVaaDhEVm1UT1QxY0ZrWkhvKzQrZXhBWU1R?=
 =?utf-8?B?VTJKSjN2N0kwZ2h4UFBmRGpiRTNPNVlvaE1BMFZIUnZ0SjJPS2dMTnZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckY2azRoMFlsdUxuNFNoc1lVQXNGei9PZ0x4eVpRYXplR24zc2FCWUp0Szlm?=
 =?utf-8?B?UGJWSHdhczlKUE1sY1lWOWNENVZjNVBmWW9Db2FVa0xxYy95RDFBd3lyMkMx?=
 =?utf-8?B?VllydFFjb0NzcG1Bbit5SlUvU1NybWlHWG9VbW12dlA3VG1vS1ViMG5nY0VK?=
 =?utf-8?B?dzRsU0R2UUpQdWF4cWhzL2tkT09hZFp1SUJFRTF5bjVsVWRhMmM3cElxRU9W?=
 =?utf-8?B?RllPRWZLdTZIWmVzUitMY0ljZnZzYkZxZDRMb3NGRnZ5Mk42MWw4TGxFMlJV?=
 =?utf-8?B?bVpvcHVpb0REME5PSUlNZVM0aXVxT3JXU0hlZUJhN0p4NmlQVHNtbWpUeEFE?=
 =?utf-8?B?NThvZUxCNjVjckp4LzhxWTFhaFovdThiWkpTdVVBbmdzYjNhcTEwb2poOGVR?=
 =?utf-8?B?RmxQaFBPd0dhWEVha3lrOE1SZVJNa2RNQy83NldnUXcyQVVhUXBycEFvOUp0?=
 =?utf-8?B?M0NPaHhtc2F3azZrWURGWitXenpEQkNWcDFJNytIeEE3dFVoTm1pTEJHaGpI?=
 =?utf-8?B?VzkwQ0ltN2ZXYlJrY0pvZnpUWlRVVnhKUk5GMjh4SUxOUGFWRGpqanpTRzVO?=
 =?utf-8?B?QWRaSGlUMXpJT0xmUDZkY1FmYWw1TVRxcU52aWFGajBWSWhxTmNYNmZSQ0w1?=
 =?utf-8?B?aFZ2OHBaNngxUXZwVTZhMkdGOHNkWkR3ckpMeDdUcitEUWhudGpDbzJxTTVW?=
 =?utf-8?B?Umk2ZnFieVluRGRXOXRSZlRhSDUyS254RkhTOER2a1lyYW1XVG51WWFLcVUw?=
 =?utf-8?B?UTJqWmpRSHREaTJCVkNzVW9HY05MWGthRzFlYjlDOWg1alpkSUJPS3kxa252?=
 =?utf-8?B?SENlaGJCQ2dDR1VnUVA5akFYR3ZuemFTR0JFTnl0YXRBNm9CMjQ2K0ltakZz?=
 =?utf-8?B?enlTUnlBTEM2TjJXcGxUNGtKQVpobCtWNXdyYzNHT3R5TjBla3kvRmpkQWdi?=
 =?utf-8?B?dFQxd1ErMEE0MDZWZnI5Wjl2Szd4V2ZzblpxdGNsbmpHb043dWxSSnN1WS85?=
 =?utf-8?B?T3B5WERLNnQ1RWVIVzlIdFJkUy9FMml4M1FHdHV1UTdnZXkwL05maEU4VTVF?=
 =?utf-8?B?RTNzdjdZTCtnVVE5THo0T2xOMzRIUGNwNzRISk5XMHRPZVd3eWdoUlo2U09m?=
 =?utf-8?B?OSttay9VZVNpQzdkWGhKM1NwTE5TQWwxemo2RkYva0lYbzhTOGp1RnFpa0pr?=
 =?utf-8?B?cHZaUmxoOXJtTXNDWEJ4SytsNVNlbGVEeXFOL0wrd3JzNjkwYVNMenZ2ODVE?=
 =?utf-8?B?VDNMQWFnUmxDemFRaC8zWTN1Q2NzWUZUeGkxVWcrWmV0VzVocW4rTDltY01O?=
 =?utf-8?B?Tzkza0FkVG1Yd2VLbytrWjlwM3pYQzZhY0FwTGwwYUVkUDczL0pxYWg0SXh0?=
 =?utf-8?B?aXpyV3JZZWNIb0lJbjYxeHF1NDcrTk4vbkc4aHBXSlJwL1psU1FSWTB3RHlI?=
 =?utf-8?B?bkxDcExBd0RHZUJyaCtzS01UNm5wN0RETVlkbmxZZE1pSDZiam5peGF1Z1FK?=
 =?utf-8?B?TUV2NjNHOFhlUXZaS08yK3RtcnNkZE1aMzRQUFFDbEc3UFJ4bENxTEtVSTNS?=
 =?utf-8?B?Yk01NTI5U1kwaTFRRjdueVVzV3NDb2ZLMzV1VFRxcXlVUVNNVzZMdGM1Mmww?=
 =?utf-8?B?MWFXUWI3N0dxblpyYnYxRXNud3BaQ3JJSkZCUko1S05DOXFSeFY1SFhGQ041?=
 =?utf-8?B?Q0szd092d290bDJWL2hVK0g3QmhDK1EzL3FTZ2tUKzJkcXRSZGpWRnBZQWlQ?=
 =?utf-8?B?TWNvRzQ1Um1UTDlpMmVHL3U0bW1BWk9Iais4ZnY4d1VKMG1DUlVFOURuMHFF?=
 =?utf-8?B?V0JxMkNoMldvS2NaSkxJSWlWTGlIQ3pkOXNreGs4R1lvZHBwUG5NTlJUZEVQ?=
 =?utf-8?B?SERSNy8vMzRiYThuMG1jLzJMcEpLdkRmOFpSMTVIQmNubWl6ZWxZZjQ3Y1Nr?=
 =?utf-8?B?ZTZWR2kyMitEdkVJOGlHSEdMMDMxMTF1WEJZZTNLV0ViL2tyUmgxWFJsM1J5?=
 =?utf-8?B?U21NOUR1ellSeGxLdFE1Q2Vid1hOQThJQVdmMU9zdU5BY2xnQnBrUUVGeG9w?=
 =?utf-8?B?MGhQSGo1Szd4QlZhbW80QTk1azRSTWNaVDdVcm1XVVhtTkZSc3EvbDlkTHp4?=
 =?utf-8?B?WVBmYXJJbEpmcDY0aklEVURwOVhBOThqcXJjbmFJMzB2TFl3TGlKWndXa1Q5?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf775df-bfb9-484f-c903-08dce2f67442
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:25:32.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9ZsP4JBZkU1O0yLi94hMZS3JYaSgbk5i0Dtaua/Ob1hQUNAQg6nRcquGJ9dzq9iQgrwuyBWACYD5U5tOKTqFuSd52FwA69gRXjNfXr/Fvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10075

Hi Conor,

Thank you for reviewing this!

On 02/10/2024 18:02, Conor Dooley wrote:
> On Wed, Oct 02, 2024 at 04:59:19PM +0300, Andrei Stefanescu wrote:
>> The SIUL2 hardware module is also integrated into the S32G3 SoC. Add
>> another compatible for it.
>>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> I'm not convinced that the representation here is correct for the
> GPIO on these devices. See:
> https://lore.kernel.org/all/20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com/
> Since GPIO and pinctrl share the same regions, that lack of conviction
> extends to the pinctrl. I don't think adding another compatible here is
> right, when I am already of the opinion that the binding is wrong for
> the existing one.

I will convert the SIUL2 GPIO driver from my other patch series(the one
you mentioned) and merge it with the existing SIUL2 pinctrl driver.
Therefore, the unified pinctrl&GPIO will use the existing pinctrl
compatible.

I also considered the syscon&simple-mfd approach but it is harder
to implement because:
- the memory regions for the two SIUL2 modules are not next to each other
  and cannot be grouped together
- some registers in SIUL2 are 32bit wide and some are 16bit wide

The combined GPIO&pinctrl driver will have 4 memory resources:
- SIUL2_0 32 bit registers (used for pinmux&pinconf)
- SIUL2_0 16 bit registers (used for setting/getting the GPIO
			    output/input value)
- SIUL2_1 32 bit registers (same as SIUL2_0 + interrupt related registers)
- SIUL2_1 16 bit registers (same as SIUL2_0)

Would that be ok?

Best regards,
Andrei

> 
>> ---
>>  .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml         | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> index a24286e4def6..cff766c2f03b 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> @@ -25,8 +25,12 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - nxp,s32g2-siul2-pinctrl
>> +    oneOf:
>> +      - enum:
>> +          - nxp,s32g2-siul2-pinctrl
>> +      - items:
>> +          - const: nxp,s32g3-siul2-pinctrl
>> +          - const: nxp,s32g2-siul2-pinctrl
>>  
>>    reg:
>>      description: |
>> -- 
>> 2.45.2
>>


