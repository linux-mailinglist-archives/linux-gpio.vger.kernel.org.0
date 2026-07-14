Return-Path: <linux-gpio+bounces-40070-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VBW4LhBdVmpY4AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40070-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:00:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B964756BEC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:00:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=RmERSHVn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40070-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40070-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B235831AC9D8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0346849690E;
	Tue, 14 Jul 2026 15:55:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023091.outbound.protection.outlook.com [52.101.127.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52ED4968F1;
	Tue, 14 Jul 2026 15:55:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044536; cv=fail; b=UJ9YS5jWqziSrxinN6yS+dZNZziIi7afZLowJ/VPRixGa9Wkrd76hMXcH1xUtPwOIHiqCDtjuD3pMDeAzwpOl5WDgrVu/wk3KyZ7mam1r8a4UsYqZt9Vfsc3TvrRCcq6q5FnrI8x4u/13zAO16Z0o4lBIhCIU+iq2Kkx9BFTyns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044536; c=relaxed/simple;
	bh=E4EmkEsZE4kTq05Eku5hg4KYVeZg9aGS6i3QVJguwOs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fXrRq6y4lJti5Zn/PLz7SW0PeoUvMQmorwB2yKkKnZNaj+LoR+SoYYCTupLKSsw3THcXHtfT2AFYqVQF91oQLrl9IROojM2XKA+/9syj5WJI2bbwLoNIEnVsAL6Brg5ZTeeyfmTsTTKzBdiaeGBz1EW1CjSPm1auhk/W/VNHBd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=RmERSHVn; arc=fail smtp.client-ip=52.101.127.91
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJhOOhdsbgll77mL5NEgA+8sYHIo/5QjgWWg7t+pzoufF+C0W5TvpflcSD7mHzEhxqzHp+YNJ3bA0jTEECkxz/veMIAqGdHoF3rTLb6BnPGr51rUEI0l86oZYw02MS7THLdgCdpujCBzwbTcUbcQCT/nEvfVyxKYROBGsfuiv5nNHjCOkcuMFDVwZ9JYgs+k8Z5Ag0kL+6LZbT3tQfA4FyFypcwGRb9tYLuRxb/F8xU8wldWK575kEadyaNTl2H7uFqUU6TDDpv9OrSGRkiLhjCgGijgSIvNKa69QGgcm5o271Zcggi4UYeQ5KJ8iTMkQws358eF8vgej2tfasNsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vUn9VKO4UJ2AzlpSWYT/A34d39+Edlti6ZneHbq5Rs=;
 b=uj2K7wNtffJudnO+2kjAK5JHOmFXv/LpKUhkN5WoL9ncHimiMxaxjgyORMkWuCibtsDn3Hf1iG4aYePN1eu0yYT+dGDqlB+3bplKaI6F8e/yMVv7zAGs/lner4CDNrgOa+/sLjMbVp7xkkDGYiGT2CL4i0NNR12fuXc0yZuL59qZscikt4MFffFD8jATUY9gyHHWrQ3SnVDcPLeQWCjhX94+z+3nAcsktYxyhRSLXPYw5ys3OxFV4S3VQdRWpVmc8f5KbiqcWWg0HiRJYnuYOmbg3Ma5VIK6zq/UPFQRybAMlb1HStPqViJ1zAhvP2dBChcRdX29RadZaolU1xxACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vUn9VKO4UJ2AzlpSWYT/A34d39+Edlti6ZneHbq5Rs=;
 b=RmERSHVnH3mzkYUZuR4N26z3I0l1sR0abiPLSxpc0Y8XxNlSHQZkmlupxGPo7uumJMXLxVKI9bJtKDi8ZQxAE/mXWVRchOoOwmH3NBhqIH/Mwci20Uo+wVhe4BNfvdDLvjEcuG4iY9trec1EG9OQPhZIzR7tND+SsI0TqQfTv1pIffEnbjsnQG8JPH1TUyyuRz+o1wjWrkDbNIbLFbsC7kZtQ05US+cfgXGYqhNogLEY1TPegtGI/oU1A4GScrvh9ZcLGVP8lB/HG3rHHqKx661V3+t71bpLksYRtxxoH6OrNQxci+RdL6mrlcEPWbPzit8kJOOwWIcy0zwTvKya2w==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6851.apcprd02.prod.outlook.com (2603:1096:990:4d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 15:55:31 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:55:31 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Tue, 14 Jul 2026 17:54:21 +0200
Subject: [PATCH v2 7/8] Add Advantech EIO Thermal driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-upstream-v2-v2-7-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
In-Reply-To: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12827;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=E4EmkEsZE4kTq05Eku5hg4KYVeZg9aGS6i3QVJguwOs=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu5f5zFnZurUQ8uTfs7XqSwFp2jDeFc1tIby
 jkU3kYfMtaJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbuQAKCRDO7dCnvL2w
 CeBzC/wPQC8ximyzVmfb9FqIPbb4XOovGYq4zYzBVuLgqKf+K/GjlI3Fo3VGGpowsoJEmP8nChs
 tTx4F6btPUSKbejrS6cPIknB8dSuJLtJnu0ynXJYY5jsnl6m758GulSn/M48eK5+4XBS+YInd5u
 neODw2uUV6/QipK30md1i65Lh5p0m6ZFkqjFlE/flAwfFD972HN0GtKSZjCGXNiJEf0PFv2lOUx
 LumWnmQFFeQadJkTTnbB9ayI9DVVfFW/tB9cO9OjQJt8KzUTLHSCDA/cz38KbLp5G8lQHuFaufj
 +s6fQPXOmeB3IqT+ba82BflcCQjvT3rQ5IqnVtk3KOgNA/Ku2dvcKlU4ynQB3P+61KfHTg4i0E9
 H7TzoP2uTr4FVhNRBjt+btN3JUlocivS+4+fOy90YW6x5yhIVqEFNRghIRancHuwdmbAZBnPuBv
 ozPdt8WDfoiHgFOs8ibeAPQU42VnqmpyexLReH1ag06h68aMO+6WR9ihu/UWPXgXsfYgM=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|JH0PR02MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2877f9-c763-4d03-98d1-08dee1c05507
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|23010399003|376014|366016|1800799024|38350700014|921020|6133799003|56012099006|11063799006|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sMjxokiSuYFtaGPCfHzeXQZPwjF3nQ4rCRhXdI5tYStQBDaHyr0WHleycAFo16CNEnOJieHAUBScmNMMzJZ5FjWIy2gJ542YoHWgRz4S4xKgnXYq0r1+WxAJ4UQYJqykmil2Z/OIBrW3M1zbASyfyjIyYpy1V2yvIhl1uLuOV0cVxJeH+ZP0MRuGTmYYlJqrP8qhHlht7F8AgxQp2pZp2ONHSBS/rDmjuUNYZJaH1YBUHmlRLPlSXZZrG1zXhRL7N7hW30pupc6tBc/VD57ia8y2SzrLYrnWnTOT8krJQNM7XImb8C10VtSJ+cumpQqf2VHSjLlvUh0yaTxA4OUSLhbIpwg7hCL0KUkaGBmbrCUiNT1jwAc3KhsJVmcdgdOdu2gvOiAzUA0HsGb6YPVRWSaAO4upB0hOBq9tHE5SmwqqDDs4BuzJ15HqFWA85qeOXLXoKhb/qCMblriL+ct3nySwfgIZnM7ZewhlItyywUaQYpTfpyifiK4chGyV91Kl9XX9Z03/7O2gcyFNHlNjCYkSsgRd7fXShya+2ShBlvxIYxNDorleGzdcGgfkj3SuHCmKqZMvouM4640JlZhGpTHsiwCGDS2ZRdgHW6CSHtYSF8lFE2/pnJ3aradTqJF6EZjprUPpFqq0r2lSA7Qf1iTH/mIHNxth7RcEKlgAeugpjh4+yios034lU1rQxo8ZK7sLhRbBbZDxbTwaXClXG0g2CGRqpGrt5ayIKFtJPerDqoKpfhjFprwX8aF7Z36T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(23010399003)(376014)(366016)(1800799024)(38350700014)(921020)(6133799003)(56012099006)(11063799006)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVRUcUpaSS9Cbis0dUpKYW9QaFZKUVBKemF2Y0UyVlhaaDdSdXl5ZWNlVmY1?=
 =?utf-8?B?UGp3OFR4YXJ5ajBPcjZzZlVwMnJJamdxNVZXUkZzZ2VZL0dNbVpGNlkxSE4v?=
 =?utf-8?B?ZDdHam1Hb0NEdXQ1R0lINnhremhVbTJvTkprVk9nZWdCaFpHbTRrbVJ2dmF1?=
 =?utf-8?B?NG1ENWg5NzREMHJtYXlwekJNeEhidGlKVVdiVnJGTm81SHlQVUJrSTFQdHR2?=
 =?utf-8?B?dmNhZWtuSXllRStVajNDSzJYNWU2bldLek53cklvdEpwUjM0aHhFOHhqRWhK?=
 =?utf-8?B?NXFreGhBV1A4aTJyWlI1djdaWWl3TDNjS3lQTzlxbnIzWlpFcGtxVkpkd0dV?=
 =?utf-8?B?Z1FPQkJobmhXMGZteFBNRWpteXVsendQK2xuOE1PcnVrSzdIZXZQWDQ1WGhj?=
 =?utf-8?B?aWNQc2FQVk4zVmRPem5sdmlyd1FxRHIxYkpLUjg2Nmo4RTE4bzNZL0plVFMv?=
 =?utf-8?B?UERqVTZkSEZyRzU5NFBJTDhyK3h0S3FMWmN1M3ByYXBVN1JhSG9rMFluZzYw?=
 =?utf-8?B?cTRKY0NVMWFMT3Azdlk0b3ZSQkJ6REFTL2pLTnpJZUxZa1JpQWd4VXV3S083?=
 =?utf-8?B?ZzcxNHlIOXRERm0reTRpUVlGL2hhcFRncGw0NnFUbkNmYS9rellqOTdCVFVs?=
 =?utf-8?B?dml5L0VnVGljWHdFamVpamxpWlhSMDZCZzFRSlJxU1VrajRJSmdMSGJwOFlB?=
 =?utf-8?B?blJSRkppbjhQSzI0Q3Z3KzRhRFF6b3haSTdnR1l5ckFoWkxGRzlnSU5mWlBR?=
 =?utf-8?B?Nlh6d2JyMHRYU09ud0JqYVA4UjVJU2VjbXJtTTJGTDZaclBzcGh3S3dubWV5?=
 =?utf-8?B?c1FkMHpHeUNZSVNreVBzRWh5VVkrSGdGL3VueEEvOVZxeTJuN1hjdG1GNERv?=
 =?utf-8?B?OEtPL00vR2VCVjBlTnlPUmNRd05YNWk3aXZZalhNenZHRHArZWZQTjd3M0Fy?=
 =?utf-8?B?dDlkL2phaXZXSTJVM2FNY2lVRGJlZFd3QnRaQTJaNkdUWTNRZkxGK0M4UFMw?=
 =?utf-8?B?SGUweEZKQzJMVFZMRVFHZkJ5NUN1cnVqTDFLU0NYK2lJMUhLZEQvZERPVEhX?=
 =?utf-8?B?SDg3QjBKS1BRK0NoZ3VNdEEyV3ZteUtRZG4zcXpjZXRUNjhVcUVXcEhCUDRH?=
 =?utf-8?B?bGxzMmF2NndSa3RBQmxRQnJ3SUdsMmdJSmpCZnFaNUNjSnY1eUJrbXFxSk9H?=
 =?utf-8?B?c1MwZG9XbmJKLzV6SEw0ZDZGcGVKcE41c1Z5VTNXUFNTWE53NklDTUpSdkhG?=
 =?utf-8?B?dWFmOUxDbVYrVk1LWGdBTXc3MnlqUGFLSXNPekNwNHJhdkxJOC84dHNIdkFI?=
 =?utf-8?B?dGhvTFl2alIvR3BpT2U0eUhGVDNqTVo0U21aZklHNHRPT1VsdC82NlFsekRD?=
 =?utf-8?B?a1J3NmtlbE95MmZLeEs0bVZ1ZUU2VVUxN1A0eUxqVyttR0REMDcrU3hNWTZI?=
 =?utf-8?B?Yzc2SG5MbHNhc2cwTm9QSUFEdXR6enpJUERDRkc4Q2JUdnVaOFlxTm9nSEZq?=
 =?utf-8?B?ck80QTY5Q253dUtxaUhDNkk0bVNhbzRRZVJCVk9pQjJmakZXa0V0L2NoN2tZ?=
 =?utf-8?B?eG9wbnNucTg5S0JXeWE3cHhUUDJlaTlYZUNObE1xODlOTWhjNk1zdjJhdm8x?=
 =?utf-8?B?SDVKVDhBcndWSWNtMlhSZG1GcCs3UHk3K20xMFM2dTN1dU51TEI4eWl5WU1q?=
 =?utf-8?B?c2dTYUxpZ016SmZsbFM4K0lrWkttOGljOTB4cHp4NHZyQmZrcGxGRzJlK0p2?=
 =?utf-8?B?a09JM25xbEVEdGdwRnpqWHV1QmtPTTBzMHNvL0NDNWFUaTJrNTdUQzBsaUho?=
 =?utf-8?B?Y2xUTGRUZnFORE9lYW1QN3ZNOWptTFRoMlF2TXZTQzdmWTlmRjRRMnVYZUVZ?=
 =?utf-8?B?YjNYQUhGYmVOWXpwKzMycDdGcVZWNWlJUUlkMW11OHI4ZldWaERGQWFhRjY4?=
 =?utf-8?B?ZldURm9xMHIvcEVNaHFUWURGdERjbXVobDRQNzNOMUlkbVZLdGRtWHgzZm5w?=
 =?utf-8?B?UWFqY2xITTdVWWtZdHU0dUc5Tk1pV2tYbUt2NFZobmlzbG5iZllxSEhjMzhE?=
 =?utf-8?B?OUFIeGFFVjdrOTVsMDlWak40UTVoQjdkWWRTSG9VMUF3cXZxMjJVT3kraFhT?=
 =?utf-8?B?WFRxQ2pRT2ZrSk5FWmZwNTM5K1dhRFFZb3NROHVrWUE5amxHaERIZU5LKzZz?=
 =?utf-8?B?akE4TlJqSFlVbmliUk1wNWpUQzh6MFV1OW8vZTc1YVhnQnNNblBENzgycUhV?=
 =?utf-8?B?dWNrSnVzTWhpaWswdmFxODBqRk9GNE8rMERXSDJUU0xTekRBT3ltNjR0QzM0?=
 =?utf-8?B?a1QzeThZUnVyRHVFV0UxL0JITHZxQVBtMk1USUw2aEljTUxpVkVGdUh5bHgr?=
 =?utf-8?Q?gfaBoiabp/CMYlMY=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2877f9-c763-4d03-98d1-08dee1c05507
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:55:31.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2o1cvVon5Xva5Or2AMY+idvpgoGjscU6tbZ9esSH5RznotOiLfeQcolQ7WbQwpEVJhjXqGobCu73xSO0Dx7No1oRart0E9MM7H6VTNdJJcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6851
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40070-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:wim@linux-watchdog.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-kernel@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenkai.chung@advantech.com.tw,m:francisco.aragon-trivino@advantech.com,m:hongzhi.wang@advantech.com,m:mikhail.tsukerman@advantech.com,m:thomas.kastner@advantech.com,m:ramiro.oliveira@advantech.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,gmail.com,gmx.de,linux-watchdog.org,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[advantech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[advantech.com.tw:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B964756BEC

This commit adds the driver to control the Advantech EIO Thermal block,
this block is included in the Advantech EIO Embedded Controller.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS                   |   1 +
 drivers/thermal/Kconfig       |   9 ++
 drivers/thermal/Makefile      |   1 +
 drivers/thermal/eio_thermal.c | 346 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 357 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d35fd7c5599..ded89e70d6cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -616,6 +616,7 @@ F:	drivers/gpio/gpio-eio.c
 F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
+F:	drivers/thermal/eio_thermal.c
 F:	drivers/video/backlight/eio_bl.c
 F:	drivers/watchdog/eio_wdt.c
 F:	include/linux/mfd/eio.h
diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 810eeccedfba..fc078012a989 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -427,6 +427,15 @@ config DA9062_THERMAL
 	  zone.
 	  Compatible with the DA9062 and DA9061 PMICs.
 
+config EIO_THERMAL
+	tristate "Advantech EIO Thermal zone"
+	depends on MFD_EIO && THERMAL
+	help
+	  Thermal zone support for the Advantech EIO. This driver exposes
+	  temperature readings, trip points and protection enable/disable via
+	  the Linux thermal framework. It communicates with the EC through the
+	  EIO MFD core.
+
 menu "Mediatek thermal drivers"
 depends on ARCH_MEDIATEK || COMPILE_TEST
 source "drivers/thermal/mediatek/Kconfig"
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 3b249195c088..6abce8933e34 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
 obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
 obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
 obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
+obj-$(CONFIG_EIO_THERMAL)	+= eio_thermal.o
 obj-y				+= intel/
 obj-$(CONFIG_TI_SOC_THERMAL)	+= ti-soc-thermal/
 obj-y				+= st/
diff --git a/drivers/thermal/eio_thermal.c b/drivers/thermal/eio_thermal.c
new file mode 100644
index 000000000000..ad923acaf138
--- /dev/null
+++ b/drivers/thermal/eio_thermal.c
@@ -0,0 +1,346 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * eio_thermal
+ * ================
+ * Thermal zone driver for Advantech EIO embedded controller's thermal
+ * protect mechanism.
+ *
+ * In EIO chip. The smart fan has 3 trips. While the temperature:
+ * - Touch Trip0: Shutdown --> Cut off the power.
+ * - Touch Trip1: Poweroff --> Send the power button signal.
+ * - between Trip2 and Trip1: Throttle --> Intermittently hold the CPU.
+ *
+ *			  PowerOff    Shutdown
+ *			      ^	         ^
+ *	      Throttle	      |		 |
+ *		 |	      |	         |
+ *	+--------+------------+----------+---------
+ *	0       trip2	     trip1      trip0  (Temp)
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/thermal.h>
+
+#define CMD_THERM_WRITE		 0x10
+#define CMD_THERM_READ		 0x11
+#define THERM_NUM		 0x04
+#define UNIT_PER_TEMP		 100
+
+#define CTRL_STATE		 0x00
+#define CTRL_TYPE		 0x01
+#define CTRL_ERROR		 0x04
+#define CTRL_VALUE		 0x10
+#define CTRL_MAX		 0x11
+#define CTRL_MIN		 0x12
+#define CTRL_THROTTLE		 0x20
+#define CTRL_THROTTLE_HI	 0x21
+#define CTRL_THROTTLE_LO	 0x22
+#define CTRL_THROTTLE_DEFAULT	 0x28
+#define CTRL_THROTTLE_HI_DEFAULT 0x29
+#define CTRL_THROTTLE_LO_DEFAULT 0x2A
+#define CTRL_POWEROFF		 0x30
+#define CTRL_POWEROFF_HI	 0x31
+#define CTRL_POWEROFF_LO	 0x32
+#define CTRL_POWEROFF_DEFAULT	 0x38
+#define CTRL_POWEROFF_HI_DEFAULT 0x39
+#define CTRL_POWEROFF_LO_DEFAULT 0x3A
+#define CTRL_SHUTDOWN		 0x40
+#define CTRL_SHUTDOWN_HI	 0x41
+#define CTRL_SHUTDOWN_LO	 0x42
+#define CTRL_SHUTDOWN_DEFAULT	 0x48
+#define CTRL_SHUTDOWN_HI_DEFAULT 0x49
+#define CTRL_SHUTDOWN_LO_DEFAULT 0x4A
+#define CTRL_SB_TSI_STATUS	 0x80
+#define CTRL_SB_TSI_ACCESS	 0x81
+#define CTRL_WARN_STATUS	 0x90
+#define CTRL_WARN_BEEP		 0x91
+#define CTRL_WARN_TEMP		 0x92
+
+#define THERM_ERR_NO		 0x00
+#define THERM_ERR_CHANNEL	 0x01
+#define THERM_ERR_HI		 0x02
+#define THERM_ERR_LO		 0x03
+
+#define NAME_SIZE		 5
+
+#define TRIP_NUM		 3
+#define TRIP_SHUTDOWN		 0
+#define TRIP_POWEROFF		 1
+#define TRIP_THROTTLE		 2
+/* Beep mechanism no stable. Not supported, yet. */
+#define TRIP_BEEP		 3
+
+#define THERMAL_POLLING_DELAY		2000 /* millisecond */
+#define THERMAL_PASSIVE_DELAY		1000
+
+#define DECI_KELVIN_TO_MILLI_CELSIUS(t) (((t) - 2731) * 100)
+#define MILLI_CELSIUS_TO_DECI_KELVIN(t) (((t) / 100) + 2731)
+
+#define THERM_STS_AVAIL           BIT(0)
+#define THERM_STS_THROTTLE_AVAIL  BIT(1)
+#define THERM_STS_POWEROFF_AVAIL  BIT(2)
+#define THERM_STS_SHUTDOWN_AVAIL  BIT(3)
+#define THERM_STS_THROTTLE_EVT    BIT(4)
+#define THERM_STS_POWEROFF_EVT    BIT(5)
+#define THERM_STS_SHUTDOWN_EVT    BIT(6)
+/* BIT(7) reserved */
+#define THERM_STS_THROTTLE_ON     BIT(8)
+#define THERM_STS_POWEROFF_ON     BIT(9)
+#define THERM_STS_SHUTDOWN_ON     BIT(10)
+/* BIT(11) reserved */
+#define THERM_STS_THROTTLE_LOG    BIT(12)
+#define THERM_STS_POWEROFF_LOG    BIT(13)
+#define THERM_STS_SHUTDOWN_LOG    BIT(14)
+
+static u8 pmc_len[] = {
+/*      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, c, d, e, f */
+/* 0 */	2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 1 */	2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 2 */	1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 3 */	1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 4 */	1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 5 */	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 6 */	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 7 */	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 8 */	1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 9 */	2, 1, 2,
+};
+
+static char therm_name[0x20][NAME_SIZE + 1] = {
+	"CPU0", "CPU1", "CPU2", "CPU3", "SYS0", "SYS1", "SYS2", "SYS3",
+	"AUX0", "AUX1", "AUX2", "AUX3", "DIMM0", "DIMM1", "DIMM2", "DIMM3",
+	"PCH", "VGA", "", "", "", "", "", "",
+	"", "", "", "", "OEM0", "OEM1", "OEM2", "OEM3",
+};
+
+static const u8 ctrl_map[] = {
+	CTRL_SHUTDOWN, CTRL_POWEROFF, CTRL_THROTTLE
+};
+
+struct eio_thermal_dev {
+	struct device *mfd;
+	struct device *dev;
+	u8 ch;
+	u8 name;
+};
+
+struct eio_trip_dev {
+	struct device *mfd;
+	u8 ch;
+	u8 idx;
+};
+
+static int pmc_write(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	if (ctrl >= ARRAY_SIZE(pmc_len))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		.cmd       = CMD_THERM_WRITE,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = pmc_len[ctrl],
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	if (ctrl >= ARRAY_SIZE(pmc_len))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		.cmd       = CMD_THERM_READ,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = pmc_len[ctrl],
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int eio_tz_get_temp(struct thermal_zone_device *tzd, int *temp)
+{
+	struct eio_thermal_dev *eio_thermal = thermal_zone_device_priv(tzd);
+	u16 val = 0;
+	int ret;
+
+	ret = pmc_read(eio_thermal->mfd, CTRL_VALUE, eio_thermal->ch, &val);
+	if (ret)
+		return ret;
+
+	*temp = DECI_KELVIN_TO_MILLI_CELSIUS(val);
+	return 0;
+}
+
+static int eio_tz_set_trip_temp(struct thermal_zone_device *tzd,
+				const struct thermal_trip *trip, int temp)
+{
+	struct eio_thermal_dev *eio_thermal = thermal_zone_device_priv(tzd);
+	const u8 ctl = (uintptr_t)trip->priv;
+	u16 val;
+
+	if (temp < 1000)
+		return -EINVAL;
+
+	val = MILLI_CELSIUS_TO_DECI_KELVIN(temp);
+	return pmc_write(eio_thermal->mfd, ctl, eio_thermal->ch, &val);
+}
+
+static int eio_tz_change_mode(struct thermal_zone_device *tzd,
+			      enum thermal_device_mode mode)
+{
+	struct eio_thermal_dev *eio_thermal = thermal_zone_device_priv(tzd);
+	int trip;
+	int ret = 0;
+
+	for (trip = 0; trip < TRIP_NUM; trip++) {
+		ret = pmc_write(eio_thermal->mfd, ctrl_map[trip], eio_thermal->ch, &mode);
+		if (ret)
+			dev_err(eio_thermal->dev, "Error when %s trip num %d\n",
+				mode == THERMAL_DEVICE_ENABLED ? "enabling" : "disabling",
+				trip);
+	}
+
+	return ret;
+}
+
+static struct thermal_zone_device_ops zone_ops = {
+	.get_temp = eio_tz_get_temp,
+	.set_trip_temp = eio_tz_set_trip_temp,
+	.change_mode   = eio_tz_change_mode,
+};
+
+static struct thermal_zone_params zone_params = {
+	.no_hwmon      = true,
+};
+
+static int eio_thermal_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ch;
+
+	if (!dev_get_drvdata(dev->parent)) {
+		dev_err(dev, "eio_core not present\n");
+		return -ENODEV;
+	}
+
+	for (ch = 0; ch < THERM_NUM; ch++) {
+		u16 state = 0;
+		u8  name  = 0;
+		u16 hi_shutdown = 0, hi_poweroff = 0, hi_throttle = 0;
+		int t_shutdown = 0, t_poweroff = 0, t_throttle = 0;
+		struct thermal_trip trips[TRIP_NUM];
+		int ntrips = 0;
+		struct eio_thermal_dev *eio_th;
+		struct thermal_zone_device *tzd;
+
+		if (pmc_read(dev->parent, CTRL_STATE, (u8)ch, &state) ||
+		    pmc_read(dev->parent, CTRL_TYPE,  (u8)ch, &name)) {
+			dev_info(dev, "thermal%d: PMC read error\n", ch);
+			continue;
+		}
+
+		if (!(state & THERM_STS_AVAIL) ||
+		    !((state & THERM_STS_THROTTLE_AVAIL) ||
+		      (state & THERM_STS_POWEROFF_AVAIL) ||
+		      (state & THERM_STS_SHUTDOWN_AVAIL))) {
+			dev_info(dev, "thermal%d: firmware not activated\n", ch);
+			continue;
+		}
+
+		if (name >= ARRAY_SIZE(therm_name) || !therm_name[name][0]) {
+			dev_info(dev, "thermal%d: unknown sensor name idx=%u\n", ch, name);
+			continue;
+		}
+
+		/* Throttle starts a 1C increase it */
+		int throttle_temp = MILLI_CELSIUS_TO_DECI_KELVIN(60000);
+
+		pmc_write(dev->parent, CTRL_THROTTLE_HI, (u8)ch, &throttle_temp);
+
+		pmc_read(dev->parent, CTRL_SHUTDOWN_HI, (u8)ch, &hi_shutdown);
+		pmc_read(dev->parent, CTRL_POWEROFF_HI, (u8)ch, &hi_poweroff);
+		pmc_read(dev->parent, CTRL_THROTTLE_HI, (u8)ch, &hi_throttle);
+
+		t_shutdown = DECI_KELVIN_TO_MILLI_CELSIUS(hi_shutdown);
+		t_poweroff = DECI_KELVIN_TO_MILLI_CELSIUS(hi_poweroff);
+		t_throttle = DECI_KELVIN_TO_MILLI_CELSIUS(hi_throttle);
+
+		ntrips = 0;
+		if (hi_shutdown) {
+			trips[ntrips].type = THERMAL_TRIP_CRITICAL;
+			trips[ntrips].temperature = t_shutdown;
+			trips[ntrips].flags = THERMAL_TRIP_FLAG_RW_TEMP;
+			trips[ntrips].priv  = THERMAL_INT_TO_TRIP_PRIV(TRIP_SHUTDOWN),
+			ntrips++;
+		}
+		if (hi_poweroff) {
+			trips[ntrips].type = THERMAL_TRIP_HOT;
+			trips[ntrips].temperature = t_poweroff;
+			trips[ntrips].flags = THERMAL_TRIP_FLAG_RW_TEMP;
+			trips[ntrips].priv  = THERMAL_INT_TO_TRIP_PRIV(TRIP_POWEROFF),
+			ntrips++;
+		}
+		if (hi_throttle) {
+			trips[ntrips].type = THERMAL_TRIP_PASSIVE;
+			trips[ntrips].temperature = t_throttle;
+			trips[ntrips].flags = THERMAL_TRIP_FLAG_RW_TEMP;
+			trips[ntrips].priv  = THERMAL_INT_TO_TRIP_PRIV(TRIP_THROTTLE),
+			ntrips++;
+		}
+		if (!ntrips) {
+			dev_info(dev, "thermal%d: no valid trips\n", ch);
+			continue;
+		}
+
+		eio_th = devm_kzalloc(dev, sizeof(*eio_th), GFP_KERNEL);
+		if (!eio_th)
+			return -ENOMEM;
+		eio_th->ch = (u8)ch;
+		eio_th->mfd = dev->parent;
+		eio_th->dev = dev;
+
+		tzd = thermal_zone_device_register_with_trips(therm_name[name],
+							      trips,
+							      ntrips,
+							      eio_th,
+							      &zone_ops,
+							      &zone_params,
+							      THERMAL_PASSIVE_DELAY,
+							      THERMAL_POLLING_DELAY);
+		if (IS_ERR(tzd))
+			return PTR_ERR(tzd);
+		/* Make sure zones start disabled */
+		thermal_zone_device_disable(tzd);
+
+		dev_info(dev, "%s thermal up (ch=%d)\n", therm_name[name], ch);
+	}
+
+	return 0;
+}
+
+static struct platform_driver eio_thermal_driver = {
+	.probe  = eio_thermal_probe,
+	.driver = {
+		.name = "eio_thermal",
+	},
+};
+module_platform_driver(eio_thermal_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Thermal driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


