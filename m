Return-Path: <linux-gpio+bounces-8255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D86934653
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 04:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6901C219BD
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 02:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3787628DB3;
	Thu, 18 Jul 2024 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NOXy9+0c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02olkn2042.outbound.protection.outlook.com [40.92.44.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF415C9;
	Thu, 18 Jul 2024 02:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.44.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721269402; cv=fail; b=mtn/dQA50C2hOkbgNOEZe2fckY5SB9eOvgAoT1ue4/A/GO+99NRg6SFfzLzsH0ioqVkv7B7VOHDHKVuGkBbdVNTz9zLy06+yW/0HF/hPlZUyBvTZB4ZPyINF/wKjwVj90qzjcUxfMIsMd2G+YLhQpn++iWVrBDK4st/+O6aKfts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721269402; c=relaxed/simple;
	bh=7rnVXK4z19a+cDaN0mdo4GpEpuRI85nl+B5rp7sdam4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZBW9sukA3ma+0BjFoocneNmzuseDHt0BK354xTt1rwRC8p2gCqB+SbpQb1yuNM0dLshX3usrMiuUiTamvL+qS2BQUaC6ohLAeK1BWGyp0qoTV75F6uGCyjFGmWuiIrODcFoAAGDdDhiWpsQAfmRrddVLs4IkAWnclOUPPrrjmnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NOXy9+0c; arc=fail smtp.client-ip=40.92.44.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwWBeznRYcRus0KFSlAjdAp37ge91IT0iWxf2a8YgHlwYX9S/N6823E8OmM3pisX2cv5BA0TWdvXWYwHgMTHi/H0+VDsFcCcRWJD/T2nUDJ/7MnSb8bfuaPvuRrNri8zk/IR7wLcrBNfIMhGGQrx3+w5Ep1xeAr5nVzs//Z81AN/dSWidQLMxudfygLo3FobOgpczZhsGodtunBHbLr4RMclcJ7OFxpuKjPY1cQ+fxNDEDVt2vaF0I0ToDTw5hsqbH//tZxxf8BwS8NMPVYHeQVSO1WsFMef+EcOC9UUzCZCqYXOhaANNp6fej2urHSuj3a8DEDaHUeqU+JriOeGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPdysIrVOsaI+6LTp27cQdQRmhxoQNr/FKsE1NR25Eg=;
 b=bn5lDEeTHgUY0fryhq3ndZCraClMoEJ2b0ymUyO7ZMqpRv3YKAWXsF1zj+QgtpfTnSPPqbj45tDhXZuBRfd7FKeakA22Gsj+ap6zq7UQBu11tf0s3f0/okEixnUK1u+Y0OSWhaRxuZo7wIo9Trz8qvXQKzJP4Y+uH0opVtoAUfgASn2815fvfct+EMmyX8mpE9toHHgT1NCwkzpDLEd7MePJR9i6zOzY0Z52DynVD7lx9ikrGI97J/jd+Bq2uIssy0QPYat9r0uWwhp7awqXk992x/TJrnRSIgqEPjHMrmOhE6RkmDgPGsnOKt5FSB7gxqus+XPfWsHiD643jIjhbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPdysIrVOsaI+6LTp27cQdQRmhxoQNr/FKsE1NR25Eg=;
 b=NOXy9+0c19Enbk+rQcqE1w6LsiGDqpuIU2S4DnHWttoZ0hQeychVwqakosYgC4ldehi6InS06nu/bhcHuUukcf1d0VkIL243iKu6AFsk4Px6g5DXeSBCobCpcbrK1aB52iI+0vFvkOr7aP4i4RINorSGP564rxbBsKCgOmEjFK7OcS8SphN/10ZG92tk1ACMD2xDAobN0ArDhwlkqoUrbGolH068fWNDwwT5rBqqe/UO/WrdvPXN0fEOWl8HP6ncW7UzE1KvZCvqygf03tCZs+KILBQBl6JuRqoQhZt1OwWI4f8fckj8mtF5HnlQi17lRUHs4Pe8sSgY6jLfhiyFBA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB6786.namprd20.prod.outlook.com (2603:10b6:8:e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 02:23:18 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 02:23:16 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: pinconf-generic: Add "input-schmitt-microvolt" property
Date: Thu, 18 Jul 2024 10:23:02 +0800
Message-ID:
 <IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [3NKzQMBWD6Dtk7VJ5oxsr49PQc+ifFfkFfIGTq07nMs=]
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240718022302.738346-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa23369-8fa4-4dcd-adfa-08dca6d09522
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|461199028|4302099013|1602099012|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	7UPM+yLhewoBXIv9lOSC3VYbk+D/51h8a+sr/yezmVIssOjqsFIHvFDIMznVa+SHco3D41QT4vcmVQNb9+/JgDQkvLbOmgS7/zowkh+y2vXQbdEhd+JXfThRE3VummPLaF+OZE77mO2nb32uD2DaEbbh3TWLV4f+Ev7SDPLVAzaAcd9l5Z0gOSW8Dl5bMh0pJkTYzN/O1iNXt0L0Qe7Thk33NQZfw+jhOb0rLC4AorPybGXqcQQjxFo4n4JXp0LsvfMvAp7/xkOvmkOxaTRAvPekSHSXt9osBbpIlDfPPxkpWSfU8mwQQ3H3pbeBOtLun+qPAgQDmrUg+/Coe1qXOEV5KR8qMw04X4ftLtk6YP61gKAxXhqpkC9tPKZSCr1i2QIxy3tZaiapLLqS/JrbfldJ47HllNotNtLEAYhe8oOJpTsNMBsc71OorIh0X+bcPTwC4/hprFyKs5iE9xUvw0vmEk8JOUUJcTDbHd5qEE1ozwe2Oy4QmpnwTo6mU2Lw16Sn3k2m85rfrsrTaUK4Eq20LvPTivTUbhYGYzTBig7+MHcEGF4BTNH734RUme3stNaMTCLO7CTj/mTY7P+Yg/XrgrWZV1VFZIXN+Yb+AExpsV318SXYDlwS2YXJZcQfSFFEs/SNoKCShFzMA4zQlZwgnXlaoqX1cpzQ84AujDcifRgaNPm6s3NMd6Lel9aqCOhsryDfa7Qof5jw0XmvqTJmUQJOiRXeTVI6itohy/oje5jigaXEzQjK2NTnqfoyvefnuCUHIhKVMfp7bEmyFhdhV958uDBGIiBfsARVTMU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cuZruQtvGyb6dGU9tiWcbzpeg3YRBFSXwnUjdVPm3QZG0tFaF5K8WCqJ83E?=
 =?us-ascii?Q?EvmWTajFNK5JWL9sgjQ0vU+X8lEVnrI1khbmb3GsPm2zXR6pasgdsmJWEixI?=
 =?us-ascii?Q?5575UANICO6BXU+udRXRolzep4Uff56t/P2Kyp0RIB2Q4S7/dO0giH9yh75K?=
 =?us-ascii?Q?69SPROIRFguxkA+FjbGxSiRWiSGM6d0+c3QLFlZ+Y7SZGb8QmSGlAf9nuUNr?=
 =?us-ascii?Q?+eHJ2uHHxzn4s/tUxWTygssjV6H/ayUFzVcMzZQY3rnphYza1d+dZ71Vry5i?=
 =?us-ascii?Q?pbM7lEvNLZKkCqVbJyUbNV5xSnllTAyUivlomjHJzRePxrJfeNgIlrugeN0Z?=
 =?us-ascii?Q?TEylP+9to2ng5iJhom4+xe7Fc/GV9VPEUCkFTznM3ifiyVeIHmPjtKqV8B1Q?=
 =?us-ascii?Q?swYLG7VZVU3XnGJV1DZfr1zhJ5gBj6iOy/9gu5gyF7qnerMUwoMyzKdVor4o?=
 =?us-ascii?Q?CuXUQrm0X/OwCFXeEct5BNsHVPmSAJRV+RED6oDafAh5K9VljhiIgoEe4nqC?=
 =?us-ascii?Q?japTBOlqJUvpwT/Fx5KCnD7xGz02NzNCtEIRaiq0NS7mIKVCOjEqOVbQodfM?=
 =?us-ascii?Q?m/gc9RRBXx9iq7e0+sAGixGgXgZTaovUO3rc14lsJQO0t0i8MP5RtH3uMG/x?=
 =?us-ascii?Q?SKKxCNenC7/kR9CSQVuOL+HEMxsZ4SIqicKtTVA8SQ3sIApVXtJmyTVOCBvt?=
 =?us-ascii?Q?rkx9E6LYY0Dm07/rg3/VtXZccdZ4NxypGDg+UI0UYXtsHc22PDmsvOaI/D9f?=
 =?us-ascii?Q?iiy6e+Da6+1/k3oh5rOfQW85WOsY29Qnzk2OA2+XvZOCnUN8GWrr5cec/07N?=
 =?us-ascii?Q?22EKlvEuKYEorSSooae9qmUtVNOgt8OVAo8KQVhiwvwXfXZlnesevJplyWUI?=
 =?us-ascii?Q?/MFsovZdKrwS0+qOG0rd5RVhEHuR2NhAz+HKlIOQ8J/tARupagZXm3x2gtGw?=
 =?us-ascii?Q?Y0lHRz/GxYxg4ivIyJJ+v3Y6w6DGQvd4g63/aiIio9ulY1xmnKlICUx20P41?=
 =?us-ascii?Q?HfVZZqFMWqOwNGs4ufrV/bYDFBfOfRQ2idbPOMuKnqYr28ydIdIwUY7kClLG?=
 =?us-ascii?Q?3wPIQHviEgAkhUkK6s+EIb9zR4h3GBpsdEfcORQ0nPw65V8VAljypFuSJsHR?=
 =?us-ascii?Q?drSyggUHdZQDOQBQCRrQ1k2SnLaFkktAYJ3UyGtJvIW5Ccbe8yJxUbPcFa7s?=
 =?us-ascii?Q?TMH1DcVGwd4hWFRnBHpUc/iAy7ZJ4VCMV8a1CInfTBdifDYLczuV2lEnibQG?=
 =?us-ascii?Q?TjG31xd7vkQHHk97bjZg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa23369-8fa4-4dcd-adfa-08dca6d09522
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 02:23:16.7833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB6786

On Sophgo CV18XX platform, threshold strength of schmitt trigger can
be configured. As this standard property is already supported by the
common pinconf code. Add "input-schmitt-microvolt" property in
pincfg-node.yaml so that other platforms requiring such feature can
make use of this property.

See the previous patch discussion about why add "microvolt" suffix:
https://lore.kernel.org/all/IA1PR20MB4953BB6E71CA3216E652E8B8BBA02@IA1PR20MB4953.namprd20.prod.outlook.com/

Changed for the original patch series:
1. add "microvolt" suffix

Inochi Amaoto (2):
  dt-bindings: pincfg-node: Add "input-schmitt-microvolt" property
  pinctrl: pinconf-generic: Add support for "input-schmitt-microvolt"
    property

 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 3 +++
 drivers/pinctrl/pinconf-generic.c                          | 2 ++
 include/linux/pinctrl/pinconf-generic.h                    | 3 +++
 3 files changed, 8 insertions(+)

--
2.45.2


