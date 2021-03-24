Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C0E347CE0
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 16:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236762AbhCXPn7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 11:43:59 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:23293 "EHLO
        esa6.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236732AbhCXPnu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 11:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616600630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3SSMjXLR2Pw8e0lwOcBT/8UcWH1S4+UdZqxdNTeo0c4=;
  b=RNvZf9jDRuQ17+xvTqzg1YrXLFr7jP/PtAjr8uadddN6o0eyYLbNZ14m
   h3TM3vXUTeWnnEIBKT/c91ljP8vkmlJMIvSnvVtoJmictpcdwKfllRES8
   sb/IiPhjNt6waOWdsrllHSiKjdLSet0hUNwFVXGUs2RNAsne9OyPMFOrI
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: T2L+nUH0GVj4TT8m8wtOGnV8vZLqkRcN/TSm4y4PfQ4ZjqVvdavR16HW6mBzsmafsLUnyiA+ow
 64bEwZ1Rl+2jnhaJiCY7djrDk8ysavXvq95v5CsLZi4LHZ/S6HUST+l7mjZY5pnzfLML2P982j
 hmNerLpJNyl8SCOyjVTmP2au3eYza3fBfdmGcMMAdZwaCL4jLpWCKDGcBBhxqywG64hnHpVI2R
 NWx3mEN4m26GvGWUNAoArM04uBGVeDlw/9QAesvImrfAbXyBsiIQr+pSn9mzhjVaMMxVcZ4m02
 we8=
X-SBRS: 5.2
X-MesageID: 40188095
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XDgRN6zPgOrBtE6uKU/KKrPx/uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpwHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5lNMaS0vVK169Qd+DW+gYyhLbS1LH4AwGp
 bZxucvnUvCRV0tYs62BmYIUoH4zrWmqLvcbQMbHBli0QGSjFqTg4LSKQSS3RsVTlp0sNUf2F
 XC+jaZ2oyT98uV5zWZ/G/V4pRQlrLau6Z+Lf3JsOc5AHHBjg6pYa5oRrGNuiskydvflGoCoZ
 33jDoLe+h19nPNbkG5yCGdpDXI4XIVxFLJjX+enHf5rsTySFsBerR8rLMcSDT1wQ4EnrhHoc
 V29lPcjbV7J1f8uR64wN7yWxRjhiOP0AEfuN9WtVNze88jcrNLxLZvmn99IdM7Mw/RzpsoK+
 VqBNG03octTXqqK0rUuWRi27WXLw0ONybDRkADv/qc2CRNkEZ4yFMFxNcekm1ozuNEd6V5
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40188095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvftgZFiTf8F2z9JvoYNbVzO8LCL3AFYEok7Yb23FH8KbpczKO76MYtBVQFpVlJSOkYC5Q/Z2ofeCYVj27QW53CrfmD7vz/QzB5IawQxyKA9RiY089Iz1eOsjougRKbnOQssRRmYqheOT4olJyobIUxpa8FiV+0vqLp48QK2LrNxbrAoE7TTDAVo26WKRcloogBoqwnalGH8lh+jvqtq4CaKAEMIlU939bXVbhVKoERPL3I1oO42VXlxdIt0lePiILI5/9xRfaZWiC6a7AeCmZwk924gbx5kxThRNlJt0K3fMtU9SJ42LyZ/e87nMNyUK7OZxO33dYggOnYgQ/XKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub0sbUt19Z455MEMout2SS1YkpeYLQCcmLvqKsToEuA=;
 b=MyDkuMZLSkGhDK06hHHTWn5cz3gGZ4b95y5N6B2Cwn1Cml1KmIfp5pe5oavF+gJ+J+j1QKE3ovtWnzugAHJPaGFajM5ljibwZ0Bu2KZDtoLRFuhvmE8yxnRKcv4fGetehFNe3Lbi33HpdRRHTp+y8gncVcQcfK39oo/56sMRBgQwhUUCJUWq+jGad180dgOcmy22qlfXk8mhmbkZXtNAZo6M8O1DmMBWa0HwM56RkVQgryynbknmZ/AAXVzPjD6QRhBojgvxLxGw/FQQx+9gMwssMLZ6TAFPOUsVMYeuJVkk7sfmOi/6x13z4kbAQTV217puHNGiPGIyyDfNB6KmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub0sbUt19Z455MEMout2SS1YkpeYLQCcmLvqKsToEuA=;
 b=XpNVOtT44B455bjm1RoXko+cMLriNYY2UYyTc2L8fAmNH7IGhou7hBEOqor8U+xtE3wYjH5He5DvswcBt6DQOJrpu9Qo9UM9PW8uxYfDeMuR3xbEY9H4/Mak0CHmuB2JoPHBQQg1gT/o2YvXIUwrItYC8Z1XUHJgLuqZxwnIAdA=
From:   Roger Pau Monne <roger.pau@citrix.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <xen-devel@lists.xenproject.org>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 2/2] intel/pinctrl: check capability offset is between MMIO region
Date:   Wed, 24 Mar 2021 16:43:12 +0100
Message-ID: <20210324154312.61878-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210324154312.61878-1-roger.pau@citrix.com>
References: <20210324154312.61878-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a898119-3a44-4b47-231b-08d8eedb9bca
X-MS-TrafficTypeDiagnostic: DM4PR03MB6062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6062CE384DB9BE1BC43530C98F639@DM4PR03MB6062.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iUSZn4Z/mitWANUDBIi1vmCnml/K7B9YOrGUHjxHbd6+EhtYZH4qAS2lKP1aHQpgNdjySrCCjexep0+3uISBq0M6YJUQ5mjM5H/e4L4DJvXxQLLotrNNNL5/rWcEqZZuNf0vBrrJ9KbWI1AqHx7EFgQVOmxI1yy9MPg0KTd4HIGdrnHH5CUfPjCMR5jTERUTqUu8D5O41E3TFpekY4bL/F3S8xwls6EyGaCwb/EIpdus/vX/2IDHfYc/LOqypLbY/vQVXNYzwHS1DOI4gnyCIqiWzIT2c0z8ctUftt1Q/hoDOSU5uJcPRsbdsHcTRNmxjt2rQZyLYMIW1dsMxjor5IdhEHQypRdS4R1Z0+01o8LXTebWDlB+78alkI2FIJXSpNhmz0mmCbGC1+bcAdMcYJKKe8V8tkjMHyYLiZp8gRIb5XgC6APu1nRWov6PWPxcvWg0SSZyf1o7xBT8pg/HBVQBeMGcgiFBXoLUohRVyeXcVybF9FJl4eyF29vPb/UkDdlOIAng3kpZQ4+TQzkbYGqZu70D5aArPOVpr9DqiVmTkfWCIiOnM5O55fLGJwSryiy4QaRJgRhynT/S+U29tA//ktGDal/9Fkxs427AjULUU6ejlFf9UmDkxfifLcZjnO7PRBiP9cjyLYka90PgeDcixXBuvvDREbOk3AqZAV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(54906003)(6916009)(478600001)(956004)(16526019)(186003)(26005)(83380400001)(86362001)(2616005)(1076003)(4326008)(38100700001)(2906002)(36756003)(316002)(5660300002)(8936002)(66556008)(8676002)(66476007)(6496006)(6666004)(66946007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZEN2SDNwR29EV0ZaVXFTZFptMVRTRnBrYWd1a0U1d3ZDV0xJaGw3MklEL0Jn?=
 =?utf-8?B?L1F1Y0lVa1BRQW8wK3VxUzVHRkFwNDBjSmg0NFpTd1ZocndNVHJZSC8xQjh1?=
 =?utf-8?B?WTQ1cDU1SU80SUVTdlVVOVBNNGtDYWdlRTUrU1M2UEVFZUpSVW5BMC95RE5Q?=
 =?utf-8?B?QVhxejVjQXJYNk16V0lqZ2VtSzJIRk9RclVrajZVenY1ejMxVmNLd1VnWDVS?=
 =?utf-8?B?TGYrdzFvNTZTbFl4Z0QxcXdQYjdwanBRQi9ZQzJyc0loY2loZ3paQXlmaTZB?=
 =?utf-8?B?azVFd2dzaURVdTNENmI2b1Z0V1J0ZG4xa0JieXd1SzdpamxRL3doUDFFN21W?=
 =?utf-8?B?ZE5sUmpiZlVIQkI2TUFQQjJ3U2JmMmhGdktmTDlTRktoZnZJLzJiZjgxYnJS?=
 =?utf-8?B?d2VheXdjYTV5eG5SdzZUbDFjSlRPYk45RjB1cWltemJxYWpqUHNLTTRXTWQ4?=
 =?utf-8?B?bjNBYnh1cmtNdHlLWldwSWJBU0N1ME41cnBHcVZpY0o1U1ArVnJMK3FNR3Q1?=
 =?utf-8?B?VUl1b1dkUXFTSWp0SStKM3ZmR0NDRnVKbzRycE4wQVFzbUw3QWFhVTNKeDNp?=
 =?utf-8?B?MjFmS21KaWhjSWRhN09pejl4V0RvbkhpUTRQVzIwRURwT25uWE11OTZZYk5M?=
 =?utf-8?B?MnFRenlWMVhhdlhHTkZKbXo2Y0ttU3VnclZEU2syN3duTDQvNjF2YWZ6cVpv?=
 =?utf-8?B?Z2YzM2xFQ0R1NjNSZU55eFhOY2t3aW5BRngxNjBtdGRsSUR0UlVuQlJKKytq?=
 =?utf-8?B?VEhNYllPTGs2RHA5a2pCYUlpVWF1OHRkVERRMndzeW9hUjhQM0J1ZDBEU1Jy?=
 =?utf-8?B?OXdKVkRVbWxoZTlQRzM5Y3JaUG9UQmU3M0l3YTI2a20reGExNGxNM0Ivem5G?=
 =?utf-8?B?K1pwZjlSaFlNM2M5N2x1d2NrNHM2dHcxbGJqUjVFOC91cmJKV2N1RUluK0Qx?=
 =?utf-8?B?OVJMUWpSanpLaStWVVhzVzA1MlY1NURJOHpoZnlhaHRtbWgrVzh3S1RpU1Q0?=
 =?utf-8?B?TDRaUVlyT0xtampLUVJkZzFxdnNkQm1DMC9NUCtkajZnNklrSEQ2WkN1UERU?=
 =?utf-8?B?Z2JMck55eVN0dEhHbFZxQVlPUFpwWkdTTTNVbktEOWRWWGM1akNGc3RiTm9w?=
 =?utf-8?B?cUFXcmxCMnlHYWYrN2NWL004QTM1cHZiUHdhQmJKZlVCTGUwVkhZa0hPT051?=
 =?utf-8?B?MWd3NkFoMnQ2ajRCaFJ4dXlBZGFQMHdESEdWa2FrNUcrTDRidTdTZURPSVBK?=
 =?utf-8?B?OFZrUXFDOVpYOFhhMERKOVRxdWJqNHU5MHowS2tFK0dVcXZpWThDeGxQTDkv?=
 =?utf-8?B?YVdtMjh5NzRMdXR1UWpYbTN3YmhhL1czb2VOdU1QbkdJQ0wzSW1ES0QrWXZ1?=
 =?utf-8?B?MndyMDFNbWRDcXYrZk1Tak82YkhBMjNFUHU4WU1lUXRWaDhHOGlFSHRoeFpC?=
 =?utf-8?B?ZHN5WTR3dkpPbVZPQXR0aVh2T0hPLzhrZDE2UzBjMU94QzZuVWhkY083amlD?=
 =?utf-8?B?UlpJNnlkYWx6dlY1RGRWZE9UekVXWlcveGtMYVNDY2FjU0prWFpEVjh6V1o5?=
 =?utf-8?B?UUdFSGVMWEQrcHhCWkpjZGc2OXZ6eGcyYXlVWXRpKzd6U0ZIRVFMZGNOTVhG?=
 =?utf-8?B?eWJiZmMzTFRwSENRc1I4aEZHV0haNThxVzVKL3ZHdDdlT1dITUYwUmdYUXNj?=
 =?utf-8?B?dTcrWFlzNGc0bTNRdTV5c3g3dUV3R2VJbEJRcFViZE96bm9YTWZYQ1RSR1Az?=
 =?utf-8?Q?Rw9X3YAKXcFsKf25ax3E0z2qTdUm4jjFIEUvnYo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a898119-3a44-4b47-231b-08d8eedb9bca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 15:43:45.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZG1u4rKV0LIawGl3is2QIotERP5/BRvYVqhwhxiS1snYI20Y6IfoSAmgvN9cb6zhruhzZZzSz/xonNArgbHKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When parsing the capability list make sure the offset is between the
MMIO region mapped in 'regs', or else the kernel hits a page fault.

Adding the check is harmless, and prevents buggy or broken systems
from crashing the kernel if the capability linked list is somehow
broken.

Fixes: 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Adjust commit message.
---
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 59d13342caf6..d45a6994b2a3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1481,16 +1481,22 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
+		struct resource *res;
 		void __iomem *regs;
+		size_t size;
 		u32 offset;
 		u32 value;
 
 		*community = pctrl->soc->communities[i];
 
-		regs = devm_platform_ioremap_resource(pdev, community->barno);
+		regs = devm_platform_get_and_ioremap_resource(pdev,
+							      community->barno,
+							      &res);
 		if (IS_ERR(regs))
 			return PTR_ERR(regs);
 
+		size = res->end - res->start;
+
 		/* Determine community features based on the revision */
 		value = readl(regs + REVID);
 		if (value == ~0u)
@@ -1521,6 +1527,12 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 				break;
 			}
 			offset = (value & CAPLIST_NEXT_MASK) >> CAPLIST_NEXT_SHIFT;
+			if (offset >= size) {
+				dev_err(&pdev->dev,
+					"wrong capability offset: %#x\n",
+					offset);
+				return -ENOENT;
+			}
 		} while (offset);
 
 		dev_dbg(&pdev->dev, "Community%d features: %#08x\n", i, community->features);
-- 
2.30.1

