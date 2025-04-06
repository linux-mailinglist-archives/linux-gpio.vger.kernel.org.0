Return-Path: <linux-gpio+bounces-18247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA5A7CC6A
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Apr 2025 03:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619843AD9FA
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Apr 2025 01:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C34F9DA;
	Sun,  6 Apr 2025 01:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vh62ynkM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2081.outbound.protection.outlook.com [40.107.249.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458828488;
	Sun,  6 Apr 2025 01:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743901618; cv=fail; b=Je32EShnCL1FWBv/weuBVNduwf1ufGiUuam2FGbzB3vPmOJu87UgnN/tUhEUjP4oqp2ID2JU7P7O77iJfHs/YtqYLFxoIzu7tYngXaFPD/zM4I0u0R/vsH9v9mJ+k1jtGoIScBBwkClNUVSJTGfkr0HExtoleLVqNSOmVutabFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743901618; c=relaxed/simple;
	bh=qjVnW19Xv19U5hZO/8A+nZipFLcMQKK7trbXhrx0d8k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S4Y6E6X0/+H+JPSlsiw+9ShIGWPdU9gG2S4dIvggz39MZMHbxwOSxED8kfGbTqdC4J9AJ1QANVKChMf8YEVSGo0KkGBJmyFYjjToHb/POWorom8AoTcH2yBY6MGPhjJThB830OBAmtoQjuAcmejUf05JNA29El4xy0wwj3oXIDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vh62ynkM; arc=fail smtp.client-ip=40.107.249.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtTsfTV+nQtzeSCsbok0KxNZMu3jMxVrzl7otjKoRlO7GAQlKYifiUbbB6rGDkLJT9ClNPr8G9+teoJ36C/CwqKLo3RgxiyjKQCY5TPkSoe3iVuYGX0sHcW8ZLiheDwrMCjWNJksIUJ8+vSj52TUnMgPrBhhDzByHHoWpdLeZt4cwsNlkuh1NlvNrOFJleMT18Z7TarQKZZS8fQOWCwiHPSN6x1SLIOJ8iBAWq5HR3H44SIMJeF0LPm8CLz3djw9XdYo8uj06kGO3hBkhXU8hDgfPTdvDywtguJxH/PJRJAl2Nd+UZK0Yu0DFJapE8bw+LufA3zZd7K9KXj+Z8fYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSva5J88JBaDEQXsHcReZoxm0FS+XsAMvEJHmYYJI9o=;
 b=BsWF53kJixL2Rl0UZwjZXi7Ad3xT8YPgn3xlIEFzLj5Vbj1ByxupVNa4XunYNoZzHxxtHflDYE0/GLGQ4kmnKKA+I83hciyxsFGLmb9dmQNkWvrNw82yBOrhX4lXswI+Dj0nyvRMWTeDVR0LkfLGASOgm/jzGSYqmb7eJHiODLkepIGjoYF2vc5cuFyEC5yUUaq6lmxvUtY55TsBphn68kyuGQYUzdgrtQHAGpnk8uiMY+kJRRj53uctpluNYqRKITP/uRdCUpMfMF7fP5s5sZoqRagX7euK83qE+JQanZFbDtTUYonVhgUfviRPejUuub4CFvTAQowYKW4ew910Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSva5J88JBaDEQXsHcReZoxm0FS+XsAMvEJHmYYJI9o=;
 b=vh62ynkMmTq9cUk7vXL4Znlddf7SLNanFMflMv9WQaOgDF31i4QMAIauXSf1V+85y0zf6kbnlp0FEoFHB63jgH/I2ZJGsxQ5V9jBEPbT4YPfw0KPGyEfPUhUmULQC5smUhQMRZ7aLp0CHp03PX9fz9Z4M6QAXbPHMvePH5NgeVay/uBdLuRVpi9kpB6doevUnh2qa2YJukTj3b3011OnjlkiV3kUKFn81viKZ4UKPn4SNiGnZ+vHb3bmAlWnBZyez91ZboPvX65CiY83ie8pu7EgjikHDvE9NOkSnb/Cp3pBdn6ZRGrsHnYD45vAD7raYfTobp7PMtsL9uaPUlk+dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10276.eurprd04.prod.outlook.com (2603:10a6:150:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Sun, 6 Apr
 2025 01:06:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 01:06:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Peng Fan <peng.fan@nxp.com>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...),
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set))
Cc: andriy.shevchenko@intel.com
Subject: [PATCH V2] ASoC: codec: ak5386: Convert to GPIO descriptors
Date: Sun,  6 Apr 2025 09:05:23 +0800
Message-Id: <20250406010532.1212894-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:3:18::36) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10276:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a72729f-64e0-4e08-342c-08dd74a74f0b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVlKMkFzRkdCQlpKdHVuUkUzcXgrQW11YWQvMGMwcHF5VUFlazMxK1hyZGV5?=
 =?utf-8?B?M0FPNEUyZHJ3bnBERWVGbWVnLy9iNWZUTTBrcTdEZWdiTzJYemFSTFJxQ2ZX?=
 =?utf-8?B?cE5QUmlCWGMvaXJkTWI0ZGQweUU3ZFFNdTQxNjVwOHlQSmd0L0c3c0oxRkdK?=
 =?utf-8?B?bENDa1Bmek9GZ0lSdGQ0VXhrNkMzYkIxVDJZWjRCNUI3OUg5MThURnF4VWtU?=
 =?utf-8?B?ZDI4R1lhMEJUcFZBMXhOT3lFSFdIc0JBTDIwOTN3NlNMdENtT1NVcVJIcDRi?=
 =?utf-8?B?d2tnWUhuZHRyOG8vNlVCR2lsTktrUGk2UmpXRm9yQnpDOXhIbEp1Y3J1czZC?=
 =?utf-8?B?dnpNdVg0YytOL2VFMld6WmNJenl4bkNpd2crcjM5aU5aQ05NdUVjc0JPSnhX?=
 =?utf-8?B?ZU9FVDU0NlJaUmo4MFhCTmxNNEVUbjRJWk84OUNSRE5aVWxweVZobXhGT29I?=
 =?utf-8?B?SUNTd1QyUEhndnZMRFgwMFBZbVhlTWFBMlhQZGFENEVQQjFQb2hOYUZ6M1d5?=
 =?utf-8?B?bHBPc3RiTW1qa0kvMzc5cVJRK3N3VE9mQTN4WWx0VlY1SldCMFdGS2Jod2Vi?=
 =?utf-8?B?cU9YbUlsT0FYUWxxMklTUjVaUW51VGh6R2FuUTNrVXY1aWEwNm5VRmthY09F?=
 =?utf-8?B?ZXhZblVlb0NWdnY5TTNtQkFxeFMvYzRyV3liVERFQjJZZ0ZzQmMwSnp2TXZz?=
 =?utf-8?B?OEFlZS8wMEJwS1cwdkZJaTZNcHQzNTJESGpZNmEwbCtreDQ0VUtXd3NtamVH?=
 =?utf-8?B?K002d3pmaDlPNDRDSWd5VGw5aUxBQ3lsenlvaTROSk8raE1JUGFkbUtKZG91?=
 =?utf-8?B?QXlJTU9YNGF3ek9IbDZzZ3lscTB6LzEzRHEybjJaQ21wU0RGUkVJSURHM25Q?=
 =?utf-8?B?N09nakxzVlZNbEsrWTBDemtYS3ZMNkZzS3lLOEYwR3NNZjhWT2RaNjhncTFV?=
 =?utf-8?B?NklUTmxaT2t2dEd1THFCSUVGWk03U2ZjRjdXeVI1OWNNY2RJc3ptRUtVY21n?=
 =?utf-8?B?YkRSdG9XUHZidlhKT3FEa2NsRTBhSU5MRmpqWXh2VUJOYnZQcVRaaWhJUXBh?=
 =?utf-8?B?YzdxbjR6SkFaNmxCaDBpdE9HdW1RQkEweWtOdG0rQUxxbmRYL05MMCtJRW9R?=
 =?utf-8?B?YlY1QTFMY0xpcVZoOG9rVlFiZytta0hTVlVSWlNZVXpmOVZLdnBMRnlBaXZR?=
 =?utf-8?B?eWV3KzE2S21vbVNqRW9naEx5YU5NT21Bd1Q2NUZDZ0tXZFd6ODFMY1V5RGw5?=
 =?utf-8?B?NTBReE11U1I4NU13cFBmK2tMa01rczQrT2pCdHVqMHpnUzJCdmswN3VsZ1l1?=
 =?utf-8?B?cVVwMXBxclJUZkhpcmYyNVBZRExDam1xME95NWV1Tml6Sk9aLzB5dkcvNG9C?=
 =?utf-8?B?RU5HMzYrTGdtU2R2WnNqbnJnODBnSHRGeG02aDZwUGQrR1J2R1ZLN2FUb0Uz?=
 =?utf-8?B?VU9ORXJlN2VXUUp6RHNyaTBmMG5hdGZyemZSMkhaZ3d3OS94eXV1dEFrazQ5?=
 =?utf-8?B?MlhQUzR6dW5kNWJ0VFBhN1dEeXo5ZXFlVDh5WlhhaTJhSWNlU3B0TnR4eFgx?=
 =?utf-8?B?Rk16SmhMY1UrWnhaTDBqZDFIc1lLU2U5ZFRzRkNTTkZ1eDR2NFl0NjhHVW84?=
 =?utf-8?B?cHhnTjBYQ0tiMHB1NzV6bjNGTmVzZWlEVkRyRmdpbUhFZXVqMWl0M0hQOGU5?=
 =?utf-8?B?SExORUxvc0hNWitPUnorL3dGQjRwT1I5UEpYZ051SWJyaVhvL1UzazZ6TGp5?=
 =?utf-8?B?K2FZcEd2ZXhCZE16TFBNVXBHRXpLV3hxL2dZclYrT2ZvcmdXQTZjWDBkanhL?=
 =?utf-8?B?VklyNUl5aHpLak9OSGptNGFqb0ZvR1lveFAyL29pK0dkQ2UwSCtramU0OHhs?=
 =?utf-8?B?QWJjbGQ3RjJUNFNZemlIb2hBWnkrMnFPSFJBVW1WOVE2TVdoa0U1OU5YbGtq?=
 =?utf-8?Q?hK5O0MjZdEHCn1R+mp5fo8EKTYFHG/sE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEp0ZDc3eXpvb05LVGpXWDN6UjdTU0Vob1NOcnp4MjJET0VUZGZ6SmR2cWJp?=
 =?utf-8?B?dE13Q0Nna0JKTDM2cWV4cTlJRGoydGdQUVo4ZmN5Y3BtYkZJTXFqbEx1OEFZ?=
 =?utf-8?B?cFlMVGJYeCt1enMyTGZjT1c5REdYdFo5YkNhTmxsY3lBeWZ3UW8xeFo5RjZp?=
 =?utf-8?B?SS81NDk0YXFFTFlxSEFYSlZabk1rbnhHYXBsdkdQV2NTa1dJTjB1dHR2aHRr?=
 =?utf-8?B?dTFYVnZodTNock5lQmRGVmFHd1pvTjRCc2FuckswaWxoSTZUaUExdDZDYVhD?=
 =?utf-8?B?YjNxT1dBWnA2MGNjNXlsZzdIWDRVTEJvU3J5NTFOaG9MSlFWWkgwMDNQRTVR?=
 =?utf-8?B?MkZ0M1J6YzFrNEl0ZWloNVhXeG5sNVN3WnVhQWVQcENUZm9lcW1UUjNaYnNU?=
 =?utf-8?B?Z2FCMjh3cC9DMWNKOUFrWHZHUDRYU3RDV3U2VWJXSDlJQ3UyMzEwdU44QVBm?=
 =?utf-8?B?eitaVHdSWTIrS0FZTUM2OTQ2enRYQ1RSS3RzNUJiYm5pKy9ocGVkSGRHclp4?=
 =?utf-8?B?a3NlcVlGVU9IQ24xLzl1L0x0VkdpdGx4bUpaSEx1SUp1dlVsOEJ0S0xxTVRH?=
 =?utf-8?B?MDhySFJJTzBtOEgrTE9yNmxkcWdUT3NvRE1rZmtQV05qaTUzWkM4dTdoSjYv?=
 =?utf-8?B?bHVIVnRSNE9XVEY4M0tvTGtnQ3oxbjNaZStjZXRmSVBRdDRaSXNzeVhRbzZF?=
 =?utf-8?B?YlFjRytNZm96TWcyZllJK2xtSGFXeEI1OFh1UHpFUFQvaWljZkZ1Qkh5SjJ3?=
 =?utf-8?B?K2RWWlFzbW5Rbkh3MmhvcmVLR1B4dWFJdG44M2tXNVdnamhPdzBGWjRZU1hW?=
 =?utf-8?B?bWRuUGpZRFpSTEQ4R1NpMUc5K0NJam0yUGFncDgrVS9VZ3o4eXlUdnZLL1p4?=
 =?utf-8?B?K21ZTmNTM2k2N1BRN0U5MUpFSGlEQk9QK245NXZuZ3ZGemt4TlJ1bFhWejZW?=
 =?utf-8?B?TG1OdC9hSy9XbjRXUXpUcHhKK2xRQnQ5OFdqVkQvRmxCTjhTVzUxL0lTb0Zi?=
 =?utf-8?B?dzZkcmNFZzdaTnRmOFlpMmhQeUxUTzVoeVp5NEExbzF5dVRHa0I0N1hjOVNH?=
 =?utf-8?B?OE0yZzVRQXRmR1RIWVdwZmxlVlBYMVhacFJyQ3NhTTJKcFhOWDU4VzFzMzFM?=
 =?utf-8?B?Z2RNNXVEbU0vMHVKQU1ORXBWVXZZS1U5N1JlOEZUN0J3Z3kvSG9qQU9HNXQ2?=
 =?utf-8?B?aFZ0WE9UVnhMM2VVM2R1bWh1VmplclUzZFNkcXh4dHFpV3FoNEU2UXFGdTNa?=
 =?utf-8?B?c0t5cHEzTlFZSzV6UGh3aUNxaTdYZDhOWTMxUGxtUGlWMDVZQ1FoSWdGMnVV?=
 =?utf-8?B?Vi81ODliUDA1RW5IbFJ1Yyt5ZW93c1U4Q2pxcjRBK0JWSmpCRTBQb1ZYM3lh?=
 =?utf-8?B?UlAwQ1JSRjNkY2FBTFRmTWlGSjhCVzJNU0Qxay91aXl1ZVJZRnI1WDJFelV0?=
 =?utf-8?B?azdtVTNSTHZDdUpNUElvNHpvTjh2bmF1VC8rQjBCcDJhV3kxMit1ZERrWlk5?=
 =?utf-8?B?YlYzaWRLeDh4cDRBSFlUUzZlS05YMTE0eCtJbFFNbTFGbkFiLzJVNzBxKzJH?=
 =?utf-8?B?Y2l1WFJWbGhxSDd2YUZid2p5NmVpV3pFU2lKNTJja1dLcVIvbzJ2RU5vNDVk?=
 =?utf-8?B?RW82d0JnVDBCcTI0cXFLNGpuWExKTENhWVVPWEk5SXFnQ3NpYTY2T2k0Wm53?=
 =?utf-8?B?SHIxQUFHL0d5ZmhPdEo4bTEvODlDV1VxNjMvU0xNdWl1OUxwS0ZmMjVBYWhC?=
 =?utf-8?B?VndxdFdySTEvQXkxdHAxUmNKVzJ5bFdIdFRhLzBJa0NYVGRTQmRxYTBWdmlW?=
 =?utf-8?B?U3d1VkVnMFVQcVZKaStIdDZHQVZwZkF3WFU5b2dHeEt0SkQ1N204dWNDdy84?=
 =?utf-8?B?eXBkT1ZnNWtidi9oZ3ROZjRtakczL016Z25JUjNpTm9lQUhrYy9tTXkrS2pS?=
 =?utf-8?B?di8raWk5RU5zTUJvdzZoV2dwWGZBOGM1TnFzeWczYUFlRU5ha3NSSlFVd3BQ?=
 =?utf-8?B?WktJbFh5RHdKR00wdE1mdWRsRE5IQUtuSWxOVmx4SS9wa1pCM0R6Q0dnSHR4?=
 =?utf-8?B?blRDb3Z6eDJlMWJ4dSthdHR4VXpPR0VNMUJxcVEyNG1UZFV6QUJTbU9aeDhZ?=
 =?utf-8?Q?SmI2iWZzjVxqLzdIIXXiktGpy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a72729f-64e0-4e08-342c-08dd74a74f0b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 01:06:51.4597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30Ve0kjvlrYafpTeL5RgUjS8UP3Vk7qs+6VxPlLGHYZeYRhYzR9vJrJDVTIihoV0a1sinjJUdJ3IrnQdkxuTPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10276

From: Peng Fan <peng.fan@nxp.com>

 of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor.
 - Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set GPIO value 1 to power up
AK5386, and set value 0 to power down.
Per datasheet for PDN(reset_gpio in the driver):
 Power Down & Reset Mode Pin
 “H”: Power up, “L”: Power down & Reset
 The AK5386 must be reset once upon power-up.

There is no in-tree DTS using this codec, and the bindings does not
specify polarity. Per driver and datasheet, the GPIO polarity should be
active-high which is to power up the codec. So using GPIOD_OUT_LOW
when get the GPIO descriptor matches GPIOF_OUT_INIT_LOW when using
of_gpio API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Typo fixes in commit log
 Drop uneeded gpio check before gpiod_set_value
 Include more headers

 sound/soc/codecs/ak5386.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 21a44476f48d..6525d50b7ab2 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -6,11 +6,13 @@
  * (c) 2013 Daniel Mack <zonque@gmail.com>
  */
 
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/initval.h>
@@ -20,7 +22,7 @@ static const char * const supply_names[] = {
 };
 
 struct ak5386_priv {
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
 };
 
@@ -110,8 +112,7 @@ static int ak5386_hw_params(struct snd_pcm_substream *substream,
 	 * the AK5386 in power-down mode (PDN pin = “L”).
 	 */
 
-	if (gpio_is_valid(priv->reset_gpio))
-		gpio_set_value(priv->reset_gpio, 1);
+	gpiod_set_value(priv->reset_gpio, 1);
 
 	return 0;
 }
@@ -122,8 +123,7 @@ static int ak5386_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak5386_priv *priv = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(priv->reset_gpio))
-		gpio_set_value(priv->reset_gpio, 0);
+	gpiod_set_value(priv->reset_gpio, 0);
 
 	return 0;
 }
@@ -177,14 +177,12 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	priv->reset_gpio = of_get_named_gpio(dev->of_node,
-					     "reset-gpio", 0);
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get AK5386 reset GPIO\n");
 
-	if (gpio_is_valid(priv->reset_gpio))
-		if (devm_gpio_request_one(dev, priv->reset_gpio,
-					  GPIOF_OUT_INIT_LOW,
-					  "AK5386 Reset"))
-			priv->reset_gpio = -EINVAL;
+	gpiod_set_consumer_name(priv->reset_gpio, "AK5386 Reset");
 
 	return devm_snd_soc_register_component(dev, &soc_component_ak5386,
 				      &ak5386_dai, 1);
-- 
2.37.1


