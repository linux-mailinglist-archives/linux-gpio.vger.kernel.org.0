Return-Path: <linux-gpio+bounces-22019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A01AE4BCB
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B189117B842
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 17:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7231B29CB3E;
	Mon, 23 Jun 2025 17:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Qb/FuNYu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2104.outbound.protection.outlook.com [40.107.237.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD90299A90;
	Mon, 23 Jun 2025 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699715; cv=fail; b=oDcI9IQC8/0f1dLqk0ub3X3JZUk6gS/Vd/HhqpUI0R/Cw7xFVaIKNfWViw37W8biz1jCmlaTnHHHDbuseIjtK/Aw1L78JXVq61Ns6BfcHBz8CERXG8oMHBpWVylMtM6id0btO9usCB9Ic/2mygsgRWAgSYXsD7VUSdoljTh12dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699715; c=relaxed/simple;
	bh=Gax+tipc3gkFKaWkFIH6Tl+uPU9+Pm3/dBZyRQ5L10I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tf8bCE5rUEipdoahGS7J5X9I3ojMQXjiodhY56CyXPUKRo3WoiXZqRAfzLw+KktTI30+eS3BJNuVoZjOgB65bU1YSI+rRYOjneSCkFsJ3YTYSowfhlA37BcpmCJNVKjCfvTkoKnlyuGooSJ437Thg2gQsrqf01KTiEpGiZWgACc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Qb/FuNYu; arc=fail smtp.client-ip=40.107.237.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l94EM6FtTHJgoqFMDSG4acwmM6rdmTsyFBxQUH4H0acbZe7nTg8jonFs5RpWwIG76UeA0xWp+EMyEGqnd7+UwmOwHckDN9hoGDZriDPams2/SEZxfLTH7OTc9Hmd8FVCjh0Zh2HFuDpXXFwAZ9D2YoL6LVWmaljIxdt/j7V6EB/StvdgyHkLY8kE8E7nqifxd0cfat9IHEsrVo0H7J9agEgf8s09PoT5xCgcOnwwTrGvi9Sn7xM/xCjZAaGJ6ZbDgiuNcLw8hvRIVWqJPkoC5tmIwqkGMgqc2sPaq60CdN6D08lusEmytUTdUmpYzfDCzVsaDkfyXBvRlW5so/39eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWYVHo4kMUrMBkrttmDq5uxiz8ZTCJNR6XV48V+ThCg=;
 b=My+i9bOc79jT0kwOsWqrqKdVhJrKeEvE/a818KhfApixT/d3s+HLGxql890iE8X6JFOJM0QnlCv42Hqq1WDkznqne1ocA6GLqymCPrsyoSDlkrOug3UMPGoEQLM8xloaQyc/BzBem0cN1YkylgdV2ZjWDoMv+vfRldmf377P+6bJ5lZi+fMR8OQmfKHU9uIXIboIXpQPMyWmM4wonoqjjO32IIvevDrTFjgzbFw7LhIaiofukAqzKtVoZM2ZMviwdlEdOub8VNMurpMID+Tyz86g59P6TbkkMWqYUMtmZz2h8K1GJ0d72Olru9fu7aoSkPUVxTZu17O0UE/07nTleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWYVHo4kMUrMBkrttmDq5uxiz8ZTCJNR6XV48V+ThCg=;
 b=Qb/FuNYuUqI7O+1xp/iUmtDD8W3Ru+oui+fJWliO9JwwUJVWFOlbDosaVYzInRt02NX0ksjsz6jkZUMxr1KC0BkaVJ96vZsMIfKeLvBIpt/4aF7v1+S0o1HflWq3jpvuAoVfY1S3qGgGu9xGwRj3VDDcBylKxIMEWqZ+9biUtYqtFOzfdF7CW0eWIat6/YUgDpk7+eZVwPUo1PVSnFCw2xPdRxM8ynzoHCkTVKd/ENkdcf7Bu6Iv50rB/Fpw818L9ccGES8AmcsP++iAljiuUKOkcQstqmut+S9U62vWwVSFt2ZXVsybDWvLAiRPlEIOR9/M8OjJx+A4TDE56l6kpQ==
Received: from BN9PR03CA0118.namprd03.prod.outlook.com (2603:10b6:408:fd::33)
 by SA1PR18MB4533.namprd18.prod.outlook.com (2603:10b6:806:1e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 17:28:30 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::5) by BN9PR03CA0118.outlook.office365.com
 (2603:10b6:408:fd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 17:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:28 +0000
From: Harshit Shah <hshah@axiado.com>
Subject: [PATCH v3 0/7] Axiado AX3000 SoC and Evaluation Board Support
Date: Mon, 23 Jun 2025 10:28:11 -0700
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKyOWWgC/52NOw7CMBAFr4Jcs8i/mEDFPRDF+gOxBHFkJ1ZQl
 LvjhAZKqFaz0puZSHLRu0SOm4lEl33yoS0gthtiGmxvDrwtTDjlFVVMAo4ebShHUEohBQPYWnA
 Z7wP2ZQw6YLSQhq4LsQema6UlHiyiIUXaRXf14xo8Xwo3PvUhPtd+Zsv371RmQEHwPWohpWHKn
 t6CnQkPsrQy//RXP/v54pesotyKWrH6yz/P8wva8eqiTQEAAA==
X-Change-ID: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863; i=hshah@axiado.com;
 h=from:subject:message-id; bh=Gax+tipc3gkFKaWkFIH6Tl+uPU9+Pm3/dBZyRQ5L10I=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY62xeUgkFsfanWUEGaI67A8gzLAzqinghq6M
 4hDJsqW+j+JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOtgAKCRDxWHMRoTLV
 +xAcC/9bYGVHWBCkTzHIX13jPyGpBoquGN5jDPTBHiGTjrUsQiIlcl14Rf8lr8bAgeCG9e/vSpc
 5ybs0MvcEoYN9qxN1s8cFvYLx1pobJNGO3X8IJiJWS/uAItjeSDmT9+yNU6jMT40tDdB/7lhHUz
 9uW72sTIboXsF2ARhuqmWUc8D0+Ut449aGnLbSnSh88CgEFPNYTpuCkg4NOGmN26akP7T6Xcmso
 3E/+lqmfdAzXH+RiQo2zpibT/NcvxYJxJ92Bf+3o2a6IxTAq0qxkq4kEdsfd86i87SUekaBvie6
 nC2K/QHQQ0Cbriq1GRIQRzjmbL7yvZ/XF29x8ESD1mXRDAGL9k3MKanl3VnpY8qVBMhwSKYFygx
 s50oWWhpHm+bQTRM3TXux5fEcgXA47CV5MQkGK8Fksm/t4VvKy0SoT8YXPDIccAdMJ+cCj8o5pk
 TprVMerxx8RjTT6+01f0SL6j2CLfXr9i3jffvuNEJy71N8XYZzoxkuPQgJGbHXVdwzA3w=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|SA1PR18MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 00540cd0-4a6c-4601-1b30-08ddb27b5edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUdtbmlLbkxrNWwvRDl5MUNnTVJneXoyTlk1RTRoYlpFNDR2OUZqNitPQlpM?=
 =?utf-8?B?MTc4MS9iRnUzM09qVUhORHNQY2R1UFdTa283dXhMRXVqaStTbU1PKzRmclJ0?=
 =?utf-8?B?SGlLUXJBSi9FUnJnZXJURjRhMXZ5THo4THZ4K011OXdhYTUwSEFaSExjc1Uv?=
 =?utf-8?B?bWR0WmJTVURLR3lsSkM2aTFXYXhDNS9yTEMxeTNtU0owUEhTTEl1SmEyN0FX?=
 =?utf-8?B?Q0JxTE9welFPbkFGNnVpMWMwb01BVWNTZEZMSW1lWHR2T1R4Q005RndxOFRo?=
 =?utf-8?B?QkVoZzRINWsyYW9tM3ljcWVER21aL0tRS0l4TjI1M2tjZ1NoTGRvc21rTDIz?=
 =?utf-8?B?MlFLYWsxSHVsYjVQTEZFZ0xYclk5TmRsMWN2WVMyQnM1VDVMN25pRGkvYXE1?=
 =?utf-8?B?OU4wMHd5Qy9aWGZmSkdMVkx0WmFIdy9wTzdYWjFuN1A2b0x4UzNPRnpJQjlL?=
 =?utf-8?B?TGNUZTE3Q0s4NFFxYS95UWNRTWJLbyszZmN5T25TL0FKQTdLMFc5V29MbmRh?=
 =?utf-8?B?MEpEV0V0QXFsakhmK0t0WUJoV1VOV2xmQUd6RnBJbWRnT1FIV1Y4dnRDenpN?=
 =?utf-8?B?Y2ozMlE0QjNoZWl2Q3YzdGh0V1ViSkcrVkp5RVZDWXhoUExwbmh6TmVrZWVk?=
 =?utf-8?B?ekRTQWFWYmxaUUJpaVZwNndmUzB0bVFiUzZvUkdVWFlXVWhYZUNZZC9KZW1V?=
 =?utf-8?B?WmRab1dGSmpOVXFGYmorRW81UGZsZHRlc1ZmYmRGUmw2dzFRaTYyS2puZ01i?=
 =?utf-8?B?dnZDblcySThJeVNrVndRdk1wbVJCekdZRzZWeVVaeXI1Q0IxeS9tV1B0WC9I?=
 =?utf-8?B?NkJxaktnTWhTWWl6Y200QXZhRE9Yd3RsNUdEWmo3WHNuRFk2RXFoSVpnMEkw?=
 =?utf-8?B?OW5ua3R1OXh4dTNnYmdlRU9UWkFFdGhMN01hVTdCNzdWOXV3SzhocWk3SVBq?=
 =?utf-8?B?TEJBQ0pRdVl4cWltYjJTekw5NXRkWDR6SFBsVmEwQmY4L1BaTHFEemlNVFBS?=
 =?utf-8?B?clYwTU1OeldtbVVBdzc0ZnptdXo4UkRRbmlKc2UrNFNwWHplTlVaZzdMTDB5?=
 =?utf-8?B?dlhmMHBmck53QVN0Q0FBTVBTSFo1RzVNM24xVklqb3plUzVQYUlKdXQ4TXh4?=
 =?utf-8?B?NXJSck9oQ1d2TndUMzR5SjVzdzFCUXBYRVh0a2tTNE55MVFMb1hlY3dKeWJq?=
 =?utf-8?B?TDYwZytMdGNHQ1hXTEtWNys2SVVUc3BpVHQwNlNNOUd6NUFIeUZ6b25sN1dw?=
 =?utf-8?B?cHladHQyMUtqeERuNlVINHN1cmltOHNQalIvM0lWSFpJUnRqN3pBbkZkRVZu?=
 =?utf-8?B?dll4dkp3YWx1T0tYOEVJVWZvOGdjQ1ZTTWV5NkVBeVFzV0wzbzQ3V0ZDN1Rq?=
 =?utf-8?B?S0FFVFRwZXFDUk9OSlFuQVdvRnkvL2ZBaitMLzhpNG16YWdNY0RRWEZSVmxr?=
 =?utf-8?B?anhzZkc0cVNuTGs5M2gxbXhNemhCNDRyVk5rNHZTcmJyNjU4ZjNhTFl2WGlU?=
 =?utf-8?B?MlFnc3lwalR4azAzektqdXAvSTUvYVdkR0x2czdhZTBHelNZUUFhQUErZ24x?=
 =?utf-8?B?VVV0WklWRnpxWHdrSDFNd2dFejNDOVNjajFPOXJBQWQyNmh0bkxrTDhQbGo3?=
 =?utf-8?B?OElmUFhSUlZRVFZsNWU5akswRFBuV2hlUENodU1yQlVHRWpqaUtSTmpCZVhs?=
 =?utf-8?B?bzRoVUhrNmg0bExaZStMcjVnQ0R4ZXlsLzlCZjhCVWhFc2Y5ejZhUGpWVktI?=
 =?utf-8?B?Z0h2aHpBVEZtVnBNNnJ6d2xNVnA4MlN1aWxOVDJRWTV2SkdBWHorQWVLN3Bv?=
 =?utf-8?B?NnVlK3M4cklkcFRPM3NBL0FLdmVTblA0c2p6ZG1TSnFqOWhmZkNwZXJLQW53?=
 =?utf-8?B?NHJ4dDdPSnJvaG9rdVdXKzlwaHlUbms1dERoOVVkdlVrSUZwTkhTVVJxZlpC?=
 =?utf-8?B?d0x0Ui8zM3ZqUHRjWUNpRFNzQ0N6Nk80dlFWS3RxS0V3dHFRNzdqQUIvUlFI?=
 =?utf-8?B?cnFJRmxLVURqUS8yQXQ1UnFGVG5GR0g0QnJYSXFhWEFjNnNYZGpwQTBKaG93?=
 =?utf-8?B?Q1RsRlpHRVFDcm1CSXhOOWZqbkt5dE13NmFHdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:28.6763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00540cd0-4a6c-4601-1b30-08ddb27b5edb
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4533

This patch series adds initial support for the Axiado AX3000 SoC and its
evaluation board.

The AX3000 is a multi-core system-on-chip featuring four ARM Cortex-A53
cores, secure vault, hardware firewall, and AI acceleration engines. This
initial support enables basic bring-up of the SoC and evaluation platform
with CPU, timer, UART, and I3C functionality.

The series begins by adding the "axiado" vendor prefix and compatible
strings for the SoC and board. It then introduces the device tree files
and minimal ARCH_AXIADO platform support in arm64.

Patch breakdown:
  - Patch 1 add the vendor prefix entry
  - Patch 2 document the SoC and board bindings
  - Patch 3 convert cdns,gpio.txt to gpio-cdns.yaml
  - Patch 4 add Axiado SoC family
  - Patch 5 add device tree for the ax3000 & ax3000-evk
  - Patch 6 add ARCH_AXIADO in defconfig
  - Patch 7 update MAINTAINERS file

Note: A few checkpatch.pl warnings appear due to DT binding conversions and
MAINTAINERS update. The binding conversion and includes were kept together in 
patch 3/7 due to their close relationship, but we are happy to split them if 
preferred.

Feedback and suggestions are welcome.

Signed-off-by: Harshit Shah <hshah@axiado.com>

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: soc@lists.linux.dev
Cc: Jan Kotas <jank@cadence.com>

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
Changes in v3:
- patch#3 
 - Update with the original filename
 - maitainer and property name updates
- patch#4
  - removed defconfig
- patch#5 
  - update nodes to alphabetical order, remove redudant nodes
  - add fix clock nodes
- patch#6 
  - enable ARCH_AXIADO in defconfig
- Link to v2: https://lore.kernel.org/r/20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com

Changes in v2:
- update patch#2 to fix the yamlint,dt_binding_check error
- update patch#6 to update path mentioned by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com

---
Harshit Shah (7):
      dt-bindings: vendor-prefixes: Add Axiado Corporation
      dt-bindings: arm: axiado: add AX3000 EVK compatible strings
      dt-bindings: gpio: gpio-cdns: convert to YAML
      arm64: add Axiado SoC family
      arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
      arm64: defconfig: enable the Axiado family
      MAINTAINERS: Add entry for Axiado

 Documentation/devicetree/bindings/arm/axiado.yaml  |  23 +
 .../devicetree/bindings/gpio/cdns,gpio.txt         |  43 --
 .../devicetree/bindings/gpio/cdns,gpio.yaml        |  80 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axiado/Makefile                |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts          |  79 ++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi             | 488 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 11 files changed, 690 insertions(+), 43 deletions(-)
---
base-commit: 8c6bc74c7f8910ed4c969ccec52e98716f98700a
change-id: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


