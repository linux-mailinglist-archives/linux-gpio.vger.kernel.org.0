Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B09348C57
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhCYJKt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:10:49 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:16713 "EHLO
        esa5.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhCYJKP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616663415;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=HOZWbGlbhxxJD2vJ/uM6///3+z46T6ShUqQYtOIdLCo=;
  b=dJkObveZqlNwivffqMrix2pVa09TOAaLsW6GIaneapDwpdlmN6kO6MOB
   gB9RTv+gHbD4009FGPfgPZCab4qp4pOqBwvGqLV1tZTtC/0v0ZsK8DjnY
   z6TykULh3Y/tynJJZy2GsEl1Q3npNF8ZZ3YNbnUMV6EI4P2Nw+pRA3Rzc
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a4Bbf+NW+K3TdNfwnL2cl4X0OvFXi/Txre31iiSGluz/dVlKiTubdrTZ6RAm/fM4wzIDtjD+WA
 zK2kgLDbg79GXPcawDBgRAotXUCIlV2KaUmPXqn3RfHimrZSYved7P2jo1Rgc6eTOzdHiajfkC
 YWSgRqcF+YUMnkrH3+lwACK1vNRoFeIe+EBkX/DhgEHN3Ka78Aqz2Grblw1U+rlApiGM3bNKtz
 IgSvvxn1inGRG9jURV8ttjR3LisxTQs5q/hV+1OWnHzpc/hfr26qJ3ntCgIpwBM9wXbNycKQoC
 EoE=
X-SBRS: 5.2
X-MesageID: 39977580
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9Xg9j6v3ZFUnxs8yh7OWpIAB7skCkoYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue77q7OSxgAGhIh9U2ynSqlgYSKaCSw8zU/d3d0wbkk+X
 XYiACR3Muemtyy1xO07R600714g93ko+EzZvCkrugwBnHShh2zZIJnMofywgwdhO208l4lnJ
 3tjn4bTr1OwkjcdG20vhfhsjOIuF1Fiw6AuC+lqEDuvNDjQ3YCA9dB7LgpDSfx0VYqv913zc
 twrgWknqdQZCmw+RjV1pzjUhFnkVeMunwykeIfpGw3a/pjVJZh6aMY509bC5EGAWbT750mCv
 BnCIXm6O9Rak7yVQGSgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i28V3tYWkHss/I80IqM0qt
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOCl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wj9uhuo7xC/pHsTrviNiOODHo0ldG7nvkZCsrHH9
 mpPpZ7BOLiMHvOFY5F0xaWYegTFVAuFOku/vorUVOHpczGbqfwsPbATfrVLL3xVRYoM1mPQU
 crbXzWHoFt/0qrUnj3jFz6QHX2YHHy+pp2Dez/9+gXw44dC51UvmEu+BaEz/DODQcHnr09fU
 N4Lr+iuLi8v3OK8WHB6HgsHRZBEEBP4vHFX2lRrQEHd2P4GIxz9+m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQFENKoMmWTilMJv3KUR5IgmqmOjP2VO68QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fTk6m/tYcVA+vebtF4pw+uLadv2DfinHTZgftqamoQXjaoX8LSpQo1XTJbim
 d89LIljKOalSyiLnY+h+oEIERBAV7ncY5uPUCgXsF5i7rrcAZ/QSOxiTuWhwoaV0Dq+08R71
 aRZBG8SLXuOB5wq3pY2qHl/BdIbW2bZVt3cW0/m5Z6D376tnF61vKraqK/33CKUEYLxvgQPV
 j+EH8vCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N57UwXGgJeSz5NU7Ns4R2KwgEt/gsuUGC7
 3CPyCUKS71EOMv1Ui+oG0/NCx9tXkjlrfJ1XTenRqF9U96JcCXBlJsA4w/CZW7yUPPQv6Typ
 V3jd4vp4KLQxPMQ+/D7ZuSViJJLxPYnHW/QO4po61FpK5ajsoBI7DrFR/zkExd1BowLM3IhF
 oTbaRy7rfGIJJudaUpCldk12tssNyOKUcx2zaGetMWTBUIj3XBOcmO7KeNgb0zAleZrA+YAy
 jWzwRtu9PEVTCEz7gUFuYZJnlXclE17DBH8PmZf4PdTCWseOcrxivwDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27A4z/r1AELVZ5mwiKAWsO9AAWFBO5O/ZibAD2389aXyf/2qiz2Rzu9Y1kfnq
 tfeyUrH4N+tgU=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="39977580"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5HS7lg12ay8wSsRtufc2sjiW4UeF2Id344NhnhJGvFea0MCy2u88xNVUmGc1YWF28UUX8NgCJhcNDmlZIXN+rBc4E8dTb8YesxH2pqpmL+hIdeVGqIq/0I78EBtK5SJ2sC16jeuNOmbpYnW1f84lEFgv1dIhTUiNs1XpdYFe3gAMxIIZVbybxIKhBS1qplRHRWgO52Boa06iepE3XXBj2GcGp85iHIDidfXQ3mTe281S2VhHIv+K1Uc5lgYXsU4MAYZr6LP0ImOMHgamrUGpt+nIQJvrru8hzjCuohpyDZnJ2Z9qsjOA5YZ8+agEftenRCb5VF/E3ehzcPn1Sj09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy90LQX86leF6ZR1WNAfhPrItTPQigLCB93lZMNhTss=;
 b=CAVRFwMPNbhlJB4fb9GQE/TbbFQ7+GoKOEMhJcT4qQHdMayEtby/Wvtqril7AE3NW7Eh1FsWxAThH2T6ctKPLYcK+NGnLLWcVvVuE5nDcvwQcG3xOsq7RdxUavGVdbP23n10YRdUaQjmjGvOiKwQzSEQncF34Yk6uFnVH2kx68YvX+IMtsvG2Wi76qalB7xLumwc8goPo577PiosEnOSAPHjHr1dOstLHeY2beMf2jsS3F95EaoB0RxoB8cWQidZPpo4PZs/O/cUPBAxpnXCqz629AtPjMQISMvL4L9sKmGntHAZ4Inp0LIAV+8aM/UtD39WMMZ41ZMisizYAVU+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy90LQX86leF6ZR1WNAfhPrItTPQigLCB93lZMNhTss=;
 b=l1isVPP1kvlJw1X3B+dWLNUa2s7l5w/XMwF6WHq7IRoWAX0ikHP7bGPkx9GEJmrtPNcH3vP0PK3lxdRz9L8FXCghkqlbJEHoYGg/YRjKvSDSwrFVXxQE4w8MpaNfav3qmViyzL4oti6YJ4RBZ3fSQwpTtddxKTTjOdXsmbxlhsA=
From:   Roger Pau Monne <roger.pau@citrix.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <xen-devel@lists.xenproject.org>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v3] intel/pinctrl: check REVID register value for device presence
Date:   Thu, 25 Mar 2021 10:09:47 +0100
Message-ID: <20210325090947.73729-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff91029-e274-4655-2e18-08d8ef6dcaaa
X-MS-TrafficTypeDiagnostic: DM6PR03MB4297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42971B3FA7BC1425FDF93A128F629@DM6PR03MB4297.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/aJcySS3t4xmVWgLa6twOE0P8YDoC+ZtndqT2izb5H+GMSt3wG191rQQeGJM6rYg+qhgQsTDMkCU7ywq9mICWOar8wWBTgurYbfIH84j+m6Q2d1I0NJSdJGW5IO9HWr/RDcPsFDq8WGXVT4QYjbE2xhObrE83AW5oroo6ZlRbeBFzEXSw19KEm2a1RHIqQP6HLixSLAq6ZBp1P5Q3C40wH2iB0TGcfcULAnI1wY6057MpVUk4+IX30x1Dm79l8F+lWDa4g69J5MnYgiwvpthKr2ZSnVKK93eHPYnixu2Begubp++GMkN2/1PIZw9AbP0/3U+xbtdOTtl4lNIg8J8rwSP6Rqv+6it2Q7ovTcO9D3n6o3+hoCPDAhr9uk5cnA6Gvdm0D8r2aQRuIar4XBrcogNeS+VCG+9XuOLVPd0lFGozeHAv+2Bt/W4zm5pHx5p0wbEaZWIOveUpYe8H5lMp9d0VMpTCzAP+vXsBWPyvay8c1szflrQGW/O4aoGIxAEzhUJDuO9oitE1PPq4aAjIoAcOFJiSV174YIUsU+TrQyDPp33uJSrHaRTigdX71lljgCO3sFgzs2PjvDeO9RpRmHa+fQjCwpGVH4B7HcdFQLXhWSyX9Uq3mDx3evbtzaeO8CkvYNyoZ8JLRo51B3I0pyASP69sOJKpqS4Hn+2Vw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(38100700001)(2906002)(86362001)(956004)(2616005)(83380400001)(5660300002)(6496006)(6916009)(8936002)(54906003)(66946007)(4326008)(8676002)(1076003)(16526019)(66476007)(26005)(6666004)(36756003)(66556008)(6486002)(186003)(478600001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sm1xUk9ydWVla1J0SzFvTUNoQkVqVjR2VzA5TS9TNUltQzlhdmhLNmk2dHdO?=
 =?utf-8?B?WGNtakNKdkJoaEVMYlZ6azAyWGFUbzVBbUZjV2Q5NTV2bjh4NUdWcHR0WnVN?=
 =?utf-8?B?UTUvQUJOckVvT0ZVWE00ODloaU81QjJXTFBObm5EU1pEQ0hsUEdJZUV5eTFM?=
 =?utf-8?B?L1F3MjJqTjZKT3MyMXJkVEFSV2kySGtlbTBmbmhPQTlqR0E2MS9aaUgvRkRG?=
 =?utf-8?B?NjQxQ2dWZEtpMDZ6R2huQTUwU1hqWm1xeVlpN2Yzc01EWGJ3eEhWbzlLR2Z3?=
 =?utf-8?B?WllrTlFRelkrRzhKSEliWXhxTzI3aWY0aUNMOC9RSkUwa3R0SHVIOEtOc0xM?=
 =?utf-8?B?R21SR1E4UkxuRVY5WmpmNnFJanNYcTM4ZWF5SmtldzgxYU94OWtkQWIwRU4r?=
 =?utf-8?B?dU1jNGEwajRkU0d5ZSs0MmJjTFVwMlFCNWJaanpqQUtrN0xxQWEyUHZLMXdz?=
 =?utf-8?B?VmVWOGQxQlpDWkx6OEFMektlRDRwM2xXbzBWVzRPMWZ2dWpxSnlDOGNtcytu?=
 =?utf-8?B?dVY3OURoYXFaU3lrZ1UvcFVKUkl2Y1IrSHdYbU5saWROWTU4dUdRdlNFKy9G?=
 =?utf-8?B?cERtWVFqNTVvU3B1NzZ3NVRSSTcySXQ0ZThKOG1SSExFeXAyWUxzS2lRTFZD?=
 =?utf-8?B?ZHRqMGdTVHhsL2JwenB2NGZTUjE3NUM1SEd4VmtjMm5yYWdDTUc5WFlFcEtU?=
 =?utf-8?B?d0pmS3FVVU93NXN0T3J2ZTZQZ0RUbDVCKzQyUEVjOU5hTnVpaTRISnhMQVFh?=
 =?utf-8?B?V1Vva0RESUEvcGMzV1hweVFDck5DcTRQdEJ5VXNpbDRzdnRMQmU4UFV5bHEy?=
 =?utf-8?B?TEh1R0JXNHh3elM5UzlnV2ljNVl5TnhjUkZxTDJyTUpreElaVFVhOGZqZFlm?=
 =?utf-8?B?Nkc4cEFkdEdkMXdTVUcvT1A3eDF2ZEh5SXFydjJGR2d0M21rRkFkZ3hwbHV3?=
 =?utf-8?B?cUFrSXlJdTg5NWc4VnN2b2hJbWlQaEtoVHg3RFRGUXZLaFBPVG4vMDB6RjFi?=
 =?utf-8?B?UFRwUVFZU3ZLRENSU3E1SS95Tk1taU1KT1dZMkdZOXpabzE4YVZydkx4RjNU?=
 =?utf-8?B?SzJZdjhxS1YzZkJGNTFHT3NwdVNGS3RpV05yRDV1amZpYlNqSituRlBBQytn?=
 =?utf-8?B?VEpJTTRxY0dXcnRWVzhEYjFkQ2kwVm52aG4vY1Fabjk3NDBPdHVnTllWd1Az?=
 =?utf-8?B?YVlyMmw5dUZMeCtDSURlaSs4VnRQNHpHak11OXNMc3dTaVVxQnBvbDJBVGtt?=
 =?utf-8?B?MzdQaGlBb0RXMHM1SnN1NFQxTjZ6eUEyelk4dExqWVUvSktmbWRCMTVOU3U5?=
 =?utf-8?B?dnBKa24vRThHbzcwVGdlcTdyNHZDaHh5OVBLU3lBL2h4dUJoWFlGa2NhQk1N?=
 =?utf-8?B?dnlJRWM0SUNHNHFybU9sd24xNE81c1ZLeEhrLzNrQ3lJSzZYR01wR1RMZ3lv?=
 =?utf-8?B?S3BWc2FLNTJjcVBkK0VvTm1PUXVrQi94S0swbE1ZTVNEaVd1QzlHZWU1M2xY?=
 =?utf-8?B?YU5lL3BTbm1KYkdJOEZvaUFoMjJBdzVtRGx3YWgvcVB1ODFKVC9xNit5aGQz?=
 =?utf-8?B?ZDE3L0d0ZEJLMUlLeFVadnU4cFAwY2c4VmF4Z1Fxa0hISFZlR0xmanY1S2lH?=
 =?utf-8?B?WGFyK29ST2VNS2E2UXdOWkdYeXVXRmRQZmpIdHE1aFpxVXVzNmlSaXozWFZo?=
 =?utf-8?B?MVJ5ZGl0ME5Ea3FyYVpGWWx3dXY4Mkh1MDI4ZTFRN0hxWUppZFVldEl3NDJu?=
 =?utf-8?B?cmhLQUlFTi82SWJkM0kzZFRpTFJzcWUweDlZVWtCNlpsSi9uY0RreGc0Ry9H?=
 =?utf-8?B?cUNobGkydnFYYmp3MWpuUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eff91029-e274-4655-2e18-08d8ef6dcaaa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:10:10.5709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q89aanN0sOehyGtZPebfcdQeJWXZXZ+AH00/BIkCLhD/QBhSo+p9TTslDJzDvnY5ebPa8YlqfkksakS8nGPMyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4297
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the value read from the REVID register in order to check for the
presence of the device. A read of all ones is treated as if the device
is not present, and hence probing is ended.

This fixes an issue when running as a Xen PVH dom0, where the ACPI
DSDT table is provided unmodified to dom0 and hence contains the
pinctrl devices, but the MMIO region(s) containing the device
registers might not be mapped in the guest physical memory map if such
region(s) are not exposed on a PCI device BAR or marked as reserved in
the host memory map.

91d898e51e60 ('pinctrl: intel: Convert capability list to features')
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Return ENODEV.
 - Adjust code comment.

Changes since v1:
 - New in this version.
---
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/intel/pinctrl-intel.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8085782cd8f9..9fc5bba514ea 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1491,8 +1491,13 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 		if (IS_ERR(regs))
 			return PTR_ERR(regs);
 
-		/* Determine community features based on the revision */
+		/*
+		 * Determine community features based on the revision.
+		 * A value of all ones means the device is not present.
+		 */
 		value = readl(regs + REVID);
+		if (value == ~0u)
+			return -ENODEV;
 		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
 			community->features |= PINCTRL_FEATURE_DEBOUNCE;
 			community->features |= PINCTRL_FEATURE_1K_PD;
-- 
2.30.1

