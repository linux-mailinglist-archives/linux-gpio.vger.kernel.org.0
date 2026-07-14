Return-Path: <linux-gpio+bounces-40065-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N9sCNulbVmrp3wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40065-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:55:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF2C756ACA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:55:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=y8eoxC2g;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40065-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40065-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0C2F306BF9D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275294968E6;
	Tue, 14 Jul 2026 15:55:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023111.outbound.protection.outlook.com [52.101.127.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42C3A4F55;
	Tue, 14 Jul 2026 15:54:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044499; cv=fail; b=WHH4+plf8MNkqd76s8GsFUyz7R8Ab4DyyxEDvU8m5dzmWEI8DtOuvSWUyr0kj5Np7cParhQMrbUgNRLUDbqsuXG6ulNLMzalWPwLUSQ3ZmJdOphajkQjg6gA01WjuNaGSDp+dlH4VCc3dg0CiXWV6rFUi4wyVxxt54yQ2zBdZPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044499; c=relaxed/simple;
	bh=yXoPXr9j/J//s4BsCd+aMWOqeFtBKfUVrROXWUw0Ha8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kb8toQFXgb1r/OUOn0E8wfI25eONtj8SPyNMJu4yqZ0zcU8oc8xtrzkQU0N1t9TG9hdxmt3hC0SWmFgMvbM57beXwQMeYaJruIB3KmkpUFYsBGWcvONiKC9ifxDMn60bXTp1uSjA4RBpdjd8lGLnDX7UviXpg3ZL4I5YKeMUles=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=y8eoxC2g; arc=fail smtp.client-ip=52.101.127.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvycWw+b0/RtTQzYUaXpu5+FUn23po47PwbSlvWMHJOjj0gB+2lv8O8VTj+QqCuBV78X/bZVR/3bUFXGSTL9t6eGvAh5ecw7tfAE0CUSoeBNeTNZbg0x+I4nPShXl++3CRXzGks3KSllDi5f7t/XeMusxD0Of9m1GVuHagUltS0W+dhLTDUW6FuOsL/4jyP9xuVZVhpUvQzMl8pHvLs6MiRM4N74mU+TmbddTvN5wj1nRrXYG6uDPDIfdrmSVIAw3CyfpcgOBf+Yzv8SiQaLKOUtmltFIs/l6gb03ZQ7jkbAeH/nbSaCnxBN99p4V+YMK9q4t2Y/OExMv58CAHpU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft5cmZw/ESxt/eAfvxf5FBlZIIaLYIIu8rqsT+8XnbM=;
 b=nGXRyBfqi9CNBtBgnyTPxBRYD9nHhb1P0cNh8yTu/h5xuwxYrA9amcW8UUNGD/kM0knoZlrwteqZbS5nE9Fm/3KTpuW0DA25RJN41ie0d7LyfAPTChrTnpHtzHDuPU3t/rtPiHlnZkLfiQvN+F+B5GRUjB3vn2bcQDxLN6mvur3LmyEI4RHMj+39xsLo1PkeT6fZGP9OKEA7nl0NCrYGTS9sZUKMqQPMbGDqhXj4RMuO9SACJVFtOBHAUnAoQ0EmEd3QMDryILzOPQNIHlh+CPnHiPsNQdqCARlJOjTnLgXJb8JMygcVomDHtNOC+CcC4cUwygKWMzbX8m40xThH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft5cmZw/ESxt/eAfvxf5FBlZIIaLYIIu8rqsT+8XnbM=;
 b=y8eoxC2g5GgJlvRmLEPFXad9Vz5FzHWnUSZaIxIAN+7c+2whPthb9lhAdDx2IULqR/UkGm4LNt7UHR7YnnNCs8M/qC38rQJtgyeEDv5492q9tpRPWOQsZ/67/PrSmoyoYy+PFbcJXJNwKJ61UY3HDu+CaVC09Z9dO3tCbqVGo2M++8XBCVy5d1oFqRXliVIlVoixxrG/MCIVq6kty3xO6W1g6Kyot/l66FbXYYnWVmtejfgv3BumUbvWHQ3n+6lHvddW2l/To3Lu9XhD+vN1eIapvaBpYs08GCKXANqYOPYEKSbPS7p1RJ1PKQgf+zHPi2z2Gs6QDYOGB4Af+pADFw==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by KL1PR02MB6189.apcprd02.prod.outlook.com (2603:1096:820:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 15:54:54 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:54:54 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Tue, 14 Jul 2026 17:54:16 +0200
Subject: [PATCH v2 2/8] Add Advantech EIO GPIO driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-upstream-v2-v2-2-76e5e41026db@advantech.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8128;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=yXoPXr9j/J//s4BsCd+aMWOqeFtBKfUVrROXWUw0Ha8=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu41d/JnUp6TYH8eh2U11mxfVt7qdWZVYmdK
 c6MQv/qGLqJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbuAAKCRDO7dCnvL2w
 CcfKC/97BM/ELXZ3oJHm7oz9sctiRlpfvt3xAsGbWZiUqlkcLPr9+BT4UaetRPvKHykntE3KmFo
 73nKuLtJ77HRZyHwh+O0SLYGh+QtGmQOSF/Un349QiiuXSNNGGuMBNZV1IRvLa8cImkpE7Cv3yp
 HSr0f3JtI3S3kBNf8T8Ogt/4EZN+nJBfh7Zs6kap4+L9NFPq+YXk9Vp+lLcBDQAd/pnEatfgDNr
 a2UZ3dDfmnVoCcVa0d+QG0vgtyurAEIiS98tb5A50Zx+2RMiE630J4Ek68Cc3QPuP3FTEZwA0JP
 kMTj0E2nA7MDHyZ3Ya3Z0SbcYQJ0bEU3zRIVNzwUITz4a6WdHrIycwkAFRgvCVkwgHS0OAScOag
 DzHjCLz+5ZHSWezZs8FbSeW3zbqT6z0T5EQsVxgIHalRcZeK+FJmHi/e7in8hWSkPJCoNqtJ1yC
 dVgdMAygUDtByGtwTpcCVl6vEEOCw2dJ08/cMDP0PYKWO1+XeYrycUkwlMRpphyJzuqsE=
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
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|KL1PR02MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 72895e65-baf4-42b5-2af1-08dee1c03f4e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|921020|38350700014|3023799007|56012099006|11063799006|22082099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zx6Mr1onxSLzn+JKb9jofurSiGw0/9DQYOrgJoRHoDyDw5qiMnM8vwpVyZx75+A/0LUw2vOPy3mRu8k/m5mOe5O+BKxjZ/5OxAZcLulmKwspciA1CNYM/TMXvvv3C5XdzLsnPEfkQMNEVpcO0a9XfaQpv7KYbd1bZPDkS+y6LlEG0clysO9IXcfW/AfJDUuXEDX1Xlhj8dwImN2DqCgoiYn4CnXt15vsuq53X2IhKjvfBqTC4N/nwPZ4aAB/mBNbUN8boYcwXCMtFXsYgZZGlnvOiiqNjiHrMREJ4mcItKxAJAfECGYl/bsxsU/Q6dzarV8r1Gap8cXR78stCkg/2wjzGuQ+9cDzCma5H0R78uwBMYshAHeEUxh00n2o8DUoFQF7QrraVHhOSujR/LsQsN7PFsJn24y02rSCuckjEIUMRvjVBCuJujs1pBd2J8eQDer5FS5ZjRV5Wg3quiPrfWHqcFosSH2zw14YOWYhm2+9IcpuFDpTACBzoBTIifCGoebqGQKAzRwkqMfiR8VINW/uAUp3kCEJqwQKymYoRf85WKue7ti2i877kPk3TtdBjY6pW3/irdgoYJW0JwKRBaL5vzkIgYZ918m3O9kosiv28WiVx6SdNa+2FjDiHA71n463WIbKdY8qsFUX4EcDRcdmAlUY9zNDar9aC9g8qM7HFTDYfnaZ3GzyrMaL3cvMr80RyfE7/j03Sclfod/935T8arI1MCloXQToqce/Skcv+oliRjpSEDtNAosVRB5U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(921020)(38350700014)(3023799007)(56012099006)(11063799006)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RhRnVMMDFDQTNzMHRabHhvSmpYaE1udG1wZmRkSUtIRjFwK0FqalVYUUF5?=
 =?utf-8?B?dDBubEwwUXlZZ2ZaNUtWcEZyTmlnVlJOTERlakJHYUMwdXpFLzMrNngxUWc2?=
 =?utf-8?B?dEl5T2xYODBvWGNCZ3VUQytmeDZIM2lhNjhVMmZMWU9sV0xwcXNVSEMrQmFB?=
 =?utf-8?B?VmFUUGRObUJld3Z5WGJvWG42ZHp2ckZvVnVWdEZTTm0yRE1GNTZ0V1YydFNZ?=
 =?utf-8?B?WVNYbVlPbnUxTUlSeEdxby9UOUtEeTQ5bmJQSnhaRXhnUmFORHFiOFFuQi9X?=
 =?utf-8?B?NkRIci82R0RjM0tHYUJ6ejU1Ylk4Q1hVZVdsMnloZmlSaUN2UlpyY0JIRzRw?=
 =?utf-8?B?THlwOGNNV3JIZ0R3dWRVaVZYS0JMWEFVQkN5My96cEtxTC9VcHl0RHZpemZI?=
 =?utf-8?B?QVZnUjNzeGlaMERVbzZQdXNVWGU0ZTR4NmFtMll0SDE4QzI5bXA4Tk91S1hz?=
 =?utf-8?B?SnVhQm80SXV5ODJJV2k0U1hyVXpiaHVRNHpxYUVCbnlCYVRWUFExckRyaHEx?=
 =?utf-8?B?MDhZMlR5VVE3RG1YcWNJMTk5c1oyMlVpMVJiTnhIaXJ1UHQyb2ZHODVYdVZs?=
 =?utf-8?B?SmxEbEpySWlFUUhMeDZoZkpnUXpGRi9DRW9BaWlLZllhOStkVWRENGJscEhp?=
 =?utf-8?B?bWpqUmVpVzE5UDEvY1EydkE4YVpkYjBWWis2K3JDWTJzdExoR0tNNDNIbFdi?=
 =?utf-8?B?Wk9BR0ErK1pJT1pWdFVpbXR2eHRYSXRkT1ZXbk5KWFpxTW5CbVg2d0ZjSWo2?=
 =?utf-8?B?Tm9yZXAxa055NSsyUE5CMHRNU1l2dzlCc09ZTjkrdXlUVU1pNm94RDlQZE1V?=
 =?utf-8?B?WVJFaHl4Q28vODNvQ0p5TUx2S0lYRzdwaTUrQzEzZXQ5SjBvSFVyY29MR293?=
 =?utf-8?B?RTd3WVBHODdQNWxNcEY4eHljMVJxN3R0aER4S2VxN05BbmcxWVh1WEpzMkhj?=
 =?utf-8?B?UC9DRUdhNDgyaVo1d0R1SFVWNGdXRjRxNm5PamdOd1hwT3ZYNi82MitWaWlt?=
 =?utf-8?B?NWVBSFp4RjdNcmdQZkptYi83RDdjOEpXeDArRWV5KzhPUUMyOWU4d21MdGNK?=
 =?utf-8?B?eDZVWXRrUEE1R0pjNHV3dUNzK25lcitGWDcvMHlXVUN5cVdFYkxrKzJ2RXJI?=
 =?utf-8?B?ZlJRL0RRNjVhYkprWmRTejdPdE5Ga0QxYmU4Qm1LUDkvek9PbEZCdkxRUXpj?=
 =?utf-8?B?U3JEZWtITGNzZ1RlUWVlcndjWVJaV3FYdnJHTUNwUWJJbkNpTEswZXpBalcx?=
 =?utf-8?B?a3FLTVh0aGlLS3hFdDluTzhxY2hZN3FXWWFWZnQvVllSY2lhTzJjVldqZ1Fy?=
 =?utf-8?B?ZXhVUDNLME10TnR6NHpaRitiRUFIOFo5bTNtRUVNdjJ0WWdGcWY3NDV0dlMx?=
 =?utf-8?B?UjJLRTJLRDU4WnRpSllWTHI5MUlwRlZPbUowWS9zL3ZLNWJtZ3RKSElxcmFo?=
 =?utf-8?B?WFpsMFgxeEQwT2JXSFphNHE0TFZYeW40eWRNdFBLcHRPKzZkV0tOTW1JN0o4?=
 =?utf-8?B?UWFlblpKRU9VQ041ZWRFcVB4WnpsMXVQZ0o0d3p6UVlKdDRaNGxPZTFWSmM2?=
 =?utf-8?B?aHAzUTNjZTNPUmpVNVQwR0NtSGorTSt3WU9BcFRsc3pQOGE2dERQZDNzRGxq?=
 =?utf-8?B?WVVGWGoyVHRrZHdsQTJWTFF4d28zR3p4QnhRSWNjbTJGR2ZjeThlazVLUGdO?=
 =?utf-8?B?aEdiaXJwYWVKckJXZ2lYZ1lRc20yZkpIaXlYOWhHWnNHb1ZIWEJwNWJFNUtM?=
 =?utf-8?B?amUyOHFQaDdkZUlmM3VReWErZ2xhUEdkYlpuQkZOcjh1bzVkajZ2YUFQczRB?=
 =?utf-8?B?QjY1dHEvZW9EdFlpQ2NBeWZDQlVtTG8zYXFFbmlLTnFWN2FsVEg5QmZyWmNt?=
 =?utf-8?B?aW1WcHNRYXFqYUJQSTFoWDR1dmZIN0VINVpxSjVsZEt3WE5qMHptVndzSUlk?=
 =?utf-8?B?VmtJamhrZWVDK3hkRmNaSE12aTZvQ1BUTk1FSU9FM3gvREVOZjU0UDdmRyt1?=
 =?utf-8?B?djkxVVcxZVp3U1FOSlRuWVVUdjRiUTFURTNwMm5qTzA5bVd2dGIzMTA4QUZI?=
 =?utf-8?B?cCtkV0VrOUFGYnJrc29wRjJzUG5uVUZGNnAvLzFTQng0aGRxV0VoSTFRWUpp?=
 =?utf-8?B?ekxSeEtUdG13YS8zNVUrdzRKeHMzY3ZSb21JanFMdXVpRzMwdUt4R1hWQnVU?=
 =?utf-8?B?Nnp1NFNEMlBQeXBtL0Y0dDAvVklxWkE2aG5yTnlkR2U4NGJ4dFl5aUlPR2Rn?=
 =?utf-8?B?STRPSFRpOGlLVmV0OVhDVGVZV0JJY1FKR2c1dWZZbUlWU2MrbklMUmp3dGpr?=
 =?utf-8?B?TDNOdFU5aE5RV2I0dnhGYjhrZVlLV1RxVlQxTERDZlI5YXFONFNERVhBaVNK?=
 =?utf-8?Q?fDqpilz/06JzkwV8=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72895e65-baf4-42b5-2af1-08dee1c03f4e
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:54:54.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ih+FJ64bHb3ndB7LY2E7rd69g/Z24JPTZfiqF98l1EXONs5MTri9PEUViOBM4IIjJfJismdYeg7xFxvaiBCvTrZtvec1UwVKemECT0zfQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40065-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim,advantech.com.tw:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CF2C756ACA

This driver controls the GPIO component of the Advantech EIO chip.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS             |   7 ++
 drivers/gpio/Kconfig    |   6 ++
 drivers/gpio/Makefile   |   1 +
 drivers/gpio/gpio-eio.c | 252 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 266 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53b5f7412966..a7da47393815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -609,6 +609,13 @@ S:	Maintained
 F:	Documentation/scsi/advansys.rst
 F:	drivers/scsi/advansys.c
 
+ADVANTECH EIO DRIVER
+M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
+S:	Maintained
+F:	drivers/gpio/gpio-eio.c
+F:	drivers/mfd/eio_core.c
+F:	include/linux/mfd/eio.h
+
 ADVANTECH SWBTN DRIVER
 M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f03c05288376..696065d77235 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -295,6 +295,12 @@ config GPIO_DWAPB
 	  Say Y or M here to build support for the Synopsys DesignWare APB
 	  GPIO block.
 
+config GPIO_EIO
+	tristate "Advantech EIO GPIO"
+	depends on MFD_EIO
+	help
+	  Say Y or M to build support for Advantech EIO GPIO block.
+
 config GPIO_EIC_SPRD
 	tristate "Spreadtrum EIC support"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index fa14581e3995..628596705c21 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
 obj-$(CONFIG_GPIO_DS4520)		+= gpio-ds4520.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
+obj-$(CONFIG_GPIO_EIO)			+= gpio-eio.o
 obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
 obj-$(CONFIG_GPIO_EN7523)		+= gpio-en7523.o
diff --git a/drivers/gpio/gpio-eio.c b/drivers/gpio/gpio-eio.c
new file mode 100644
index 000000000000..34e1aefd0716
--- /dev/null
+++ b/drivers/gpio/gpio-eio.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GPIO driver for Advantech EIO Embedded controller.
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+
+#define EIO_GPIO_MAX_PINS	48
+#define EIO_GPIO_WRITE		0x18
+#define EIO_GPIO_READ		0x19
+
+struct eio_gpio_dev {
+	u64 avail;
+	int max;
+	struct gpio_chip chip;
+	struct device *dev;
+};
+
+static struct {
+	int size;
+	bool write;
+} ctrl_para[] = {
+	{ 0x01, false }, { 0x00, false }, { 0x00, false }, { 0x02, false },
+	{ 0x01, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
+	{ 0x00, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
+	{ 0x00, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
+	{ 0x01, true  }, { 0x01, true  }, { 0x02, true  }, { 0x02, true  },
+	{ 0x02, false }, { 0x10, false }
+};
+
+enum gpio_ctrl {
+	EIO_GPIO_STATUS = 0x0,
+	EIO_GPIO_GROUP_AVAIL = 0x3,
+	EIO_GPIO_ERROR = 0x04,
+	EIO_GPIO_PIN_DIR = 0x10,
+	EIO_GPIO_PIN_LEVEL = 0x11,
+	EIO_GPIO_GROUP_DIR = 0x12,
+	EIO_GPIO_GROUP_LEVEL = 0x13,
+	EIO_GPIO_MAPPING = 0x14,
+	EIO_GPIO_NAME = 0x15
+};
+
+static struct {
+	int group;
+	int port;
+} group_map[] = {
+	{ 0, 0 }, { 0, 1 },
+	{ 1, 0 }, { 1, 1 },
+	{ 2, 0 }, { 2, 1 },
+	{ 3, 0 }, { 3, 1 },
+	{ 3, 2 }, { 3, 3 },
+	{ 3, 4 }, { 3, 5 },
+	{ 3, 6 }, { 3, 7 }
+};
+
+static int pmc_write(struct device *mfd_dev, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		 .cmd       = EIO_GPIO_WRITE,
+		 .control   = ctrl,
+		 .device_id = dev_id,
+		 .payload   = (u8 *)data,
+	};
+
+	if (ctrl >= ARRAY_SIZE(ctrl_para))
+		return -ENOMEM;
+
+	if (!ctrl_para[ctrl].write)
+		return -EINVAL;
+
+	op.size = ctrl_para[ctrl].size;
+
+	return eio_core_pmc_operation(mfd_dev, &op);
+}
+
+static int pmc_read(struct device *mfd_dev, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		 .cmd       = EIO_GPIO_READ,
+		 .control   = ctrl,
+		 .device_id = dev_id,
+		 .payload   = (u8 *)data,
+	};
+
+	if (ctrl > ARRAY_SIZE(ctrl_para))
+		return -ENOMEM;
+
+	op.size = ctrl_para[ctrl].size;
+
+	return eio_core_pmc_operation(mfd_dev, &op);
+}
+
+static int get_dir(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 dir;
+	int ret;
+
+	ret = pmc_read(chip->parent, EIO_GPIO_PIN_DIR, offset, &dir);
+	if (ret)
+		return ret;
+
+	return dir ? 0 : 1;
+}
+
+static int dir_input(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 dir = 0;
+
+	return pmc_write(chip->parent, EIO_GPIO_PIN_DIR, offset, &dir);
+}
+
+static int dir_output(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	u8 dir = 1;
+	u8 val = value;
+
+	pmc_write(chip->parent, EIO_GPIO_PIN_DIR, offset, &dir);
+
+	return pmc_write(chip->parent, EIO_GPIO_PIN_LEVEL, offset, &val);
+}
+
+static int gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 level;
+	int ret;
+
+	ret = pmc_read(chip->parent, EIO_GPIO_PIN_LEVEL, offset, &level);
+	if (ret)
+		return ret;
+
+	return level;
+}
+
+static int gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	u8 val = value;
+
+	return pmc_write(chip->parent, EIO_GPIO_PIN_LEVEL, offset, &val);
+}
+
+static int check_support(struct device *dev)
+{
+	u8  data;
+	int ret;
+
+	ret = pmc_read(dev, EIO_GPIO_STATUS, 0, &data);
+	if (ret)
+		return ret;
+
+	if ((data & 0x01) == 0)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int check_pin(struct device *dev, int pin)
+{
+	int ret;
+	int group, bit;
+	u16 data;
+
+	/* Get pin mapping */
+	ret = pmc_read(dev, EIO_GPIO_MAPPING, pin, &data);
+	if (ret)
+		return ret;
+
+	if ((data & 0xFF) > ARRAY_SIZE(group_map))
+		return -EINVAL;
+
+	group = group_map[data & 0xFF].group;
+	bit   = data >> 8;
+
+	/* Check mapped pin */
+	ret = pmc_read(dev, EIO_GPIO_GROUP_AVAIL, group, &data);
+	if (ret)
+		return ret;
+
+	return data & BIT(bit) ? 0 : -EOPNOTSUPP;
+}
+
+static int gpio_init(struct device *mfd, struct eio_gpio_dev *eio_gpio)
+{
+	int ret, i;
+
+	ret = check_support(mfd);
+	if (ret)
+		return dev_err_probe(eio_gpio->dev, ret, "GPIO not supported\n");
+
+	eio_gpio->avail = 0;
+
+	for (i = 0 ; i < EIO_GPIO_MAX_PINS ; i++) {
+		ret = check_pin(mfd, i);
+		if (ret)
+			continue;
+
+		eio_gpio->avail |= BIT(i);
+		eio_gpio->max = i + 1;
+	}
+
+	return eio_gpio->max ? 0 : -EOPNOTSUPP;
+}
+
+static int gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct eio_gpio_dev *eio_gpio;
+	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
+
+	if (!eio_dev)
+		return dev_err_probe(dev, -ENODEV, "Error contact eio_core\n");
+
+	eio_gpio = devm_kzalloc(dev, sizeof(*eio_gpio), GFP_KERNEL);
+	if (!eio_gpio)
+		return -ENOMEM;
+
+	eio_gpio->dev = dev;
+
+	if (gpio_init(dev->parent, eio_gpio))
+		return -EIO;
+
+	eio_gpio->chip.parent = dev->parent;
+	eio_gpio->chip.ngpio = eio_gpio->max;
+	eio_gpio->chip.label = KBUILD_MODNAME;
+	eio_gpio->chip.owner = THIS_MODULE;
+	eio_gpio->chip.direction_input = dir_input;
+	eio_gpio->chip.get = gpio_get;
+	eio_gpio->chip.direction_output = dir_output;
+	eio_gpio->chip.set = gpio_set;
+	eio_gpio->chip.get_direction = get_dir;
+	eio_gpio->chip.base = -1;
+	eio_gpio->chip.can_sleep = true;
+
+	return devm_gpiochip_add_data(dev, &eio_gpio->chip, eio_gpio);
+}
+
+static struct platform_driver gpio_driver = {
+	.probe  = gpio_probe,
+	.driver = { .name = KBUILD_MODNAME, },
+};
+
+module_platform_driver(gpio_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("GPIO driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


