Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399FD28EBE0
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 06:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387954AbgJOEAd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 00:00:33 -0400
Received: from mail-mw2nam10on2069.outbound.protection.outlook.com ([40.107.94.69]:30500
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725208AbgJOEAd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 00:00:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwzZldz9NIdNnVVgKkmW5vXCb6TN6kL8KL8y7kp85cyxu7tvBBsLKVmjARJLw0ZviXJbKCKHDV5CchaFDizjNMFKKRpjb94nEUr+45BEd73QJaIZpb5PwXCevqHmolfiKMnriGWbIU8nOienO4mZGfACU8+cdQN5XUEuFMSW34ZSK4JS8qmYUpSYrV6ZQWnVaW52q7ZEWC8vUEUnfVRspizcO2jbuu0aX4e5zyVlRduO9XXu2A+yoc8TpkbOoP9hcETmsTIN3ozSpYfYoTZWLxkVmK1BBTVxz6atdIkkG3NTPT1FGxYOHs88YWCiJLuH/OZ7KG8G/Nq+8NZze8ZHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pEJFXNpF4yOi1hmh/F02Kz2YOaHhqeeu5PksVmP1rY=;
 b=UtUDwxWqAihl1yI5cssgifYWYB4HCwv71vMGCwfzJoqNdKXIfsofVvu8kHvjfebqx92SKjbJ+YdDyhiW2Dv2kaoZk7rYkjrXuula+U1bWAVJmTzKa5mwsvfdTVeqcPjU+jJ3lcKuoVo+gXZgNHdPUJpI9KIbT7Gh7XSzs6W2KhrTr1C3bsQzbPBX75JxICQIUbDhbZoDMBEWq8g1/R3x+Dh/mQKhS1nT1k2GPc4pC3JhNuUb8y4aaFaBoeHif3yMwxuIqKJ9TPbLOUPfKDP1O8608z4SYexo9UcdCtU3Bi4CWH9yrMlyxA0xI/WFDXZRfvKgBCmE4ScY7/FbH0cJBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pEJFXNpF4yOi1hmh/F02Kz2YOaHhqeeu5PksVmP1rY=;
 b=CIMH6Oq/BcSFG6/TT9+J0x9FiKYLdx2vbfIftdEFORs43H4fFCfCkVO83Slo6GwmRNZw/cmLF8qhaIu2J6YAJJrLC2abgW6xTnNEQ6iY8fJG4dfseQSHmicXXztkEUJsUNoUsFFooleZ3QGfs537/ReKykFjtcVTxW0RO8d4uWk=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 04:00:31 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 04:00:31 +0000
Date:   Thu, 15 Oct 2020 11:59:03 +0800
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/8] dt-bindings: gpio: dw-apb: remove never-used
 "snps,dw-apb-gpio-port"
Message-ID: <20201015115903.2a782f78@xhacker.debian>
In-Reply-To: <20201015115524.24e3c36b@xhacker.debian>
References: <20201015115524.24e3c36b@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.15]
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 04:00:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eef7384f-19ba-46c0-3faf-08d870bedbf1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB455583060BC986F15EB1B67EED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmhy/AgVpiK5tld+ymnKV9Dbveb9yqlkGCS0QTDHBfV+5p6DxrjfyTjj5SdpTl0C81gvAbJJ9Smy1YFkz1NFO74m501lTn0Mz2Q+l0ZoXyOIrrGHaWNqrME3E9Zm0qAiEigfH/y86Qq+UO7PJtuYf27Q+ODUbuPx54ea/y+7PWY9bOzNsEIQrYAA6rjh5g6PVk2GdayowfBcLx6UkHZzdMm7G/2QIws0rCjEFfcAPznvU4o+2V4lGAfXVV3YnxHPYJA/6W7B5JAyGmiWE3kf7IK06zsqg1IERnuyRT84DtrbCQz+CujOONEN6g9KpJkwFaXamrCoVyu5N2RK6NR4sbT1QW/dtN4b9UiKYGUpTRDjR4N3RA9uAxjnEqNVlBLeCYOd1j8GMDpb0r8Wfxmm1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(4744005)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3gZJgVaZ7VTx+VMWNnyUxdnroGy/9+98y+3VXjVAgYn9PfEYjzDD5W0U4mB1P96K3M0ahoGiJ01Lx3O3Ulf+69jl/vhaSP0syw2nx7GiSep3Q1PAzWTX2fadff0DBb3ZQ/G2boyWz5g6sqtx571e3f+aA69//tbf3hv3E/5euwlgRv4f9IRSQtoqIIbUM94QPFYnbbS9tmwuo1FL93twsY/ncgTvTXSDarEyDWk2sI/5eOcJiEHf+4Ry9hcXTTiJ7bvMbgzYtROKOxwDduy7rlhCv3CNHAiThSatBh7nOkEey9cPc2taRWXQwiv5YXdyXKNcqygUBrhFnpv4hR+RL6+Xv3x5uNSojIpTvDtkWDjb07elUxE7u90iH17d1dLSyFNhbJWJo0FFj6RzvjEDIqhRiwk4M6w8PFafmJAqvHlK05ij3EDTSfhoPBxIlWE24OMr+engywVeo9GQhn3FfefJUMSYNloak0wPJoiPbGa3PVcj3p7w6SpRW+bcUfH79UkVneDrEXJ/rOKd30hb+ddW+r2hTUGq41UusvEpoNbMdQGDl0yzjyCxQej9bDKb6Qao7C1Y83LTSalFHbhlQkRqovKL+PxCqK1yDyAJ9/q7pBWJRxjNSvxyIaqW1+cumcGVIl4E5r0Oi8+JDrtJFA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef7384f-19ba-46c0-3faf-08d870bedbf1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 04:00:31.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4JtzldFCSqfQJ/gvYEy5oElvDjqWSWBqPd+6mlwRnRJxOUFOCTEyqVJ3cZKTKi0duOUWPvLmfZrOM5/69IUUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index 1240f6289249..76e7b07d592f 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -50,9 +50,6 @@ patternProperties:
   "^gpio-(port|controller)@[0-9a-f]+$":
     type: object
     properties:
-      compatible:
-        const: snps,dw-apb-gpio-port
-
       reg:
         maxItems: 1
 
@@ -111,7 +108,6 @@ examples:
       #size-cells = <0>;
 
       porta: gpio-port@0 {
-        compatible = "snps,dw-apb-gpio-port";
         reg = <0>;
         gpio-controller;
         #gpio-cells = <2>;
@@ -123,7 +119,6 @@ examples:
       };
 
       portb: gpio-port@1 {
-        compatible = "snps,dw-apb-gpio-port";
         reg = <1>;
         gpio-controller;
         #gpio-cells = <2>;
-- 
2.28.0

