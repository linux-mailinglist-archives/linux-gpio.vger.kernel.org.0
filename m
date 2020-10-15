Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9BA28EBCB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 05:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387436AbgJOD7v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 23:59:51 -0400
Received: from mail-mw2nam10on2064.outbound.protection.outlook.com ([40.107.94.64]:42656
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730842AbgJOD7v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 23:59:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjFejb+KTbshlb/6r0RcTrTKpadVR10e6HzEvgwTRm4tfp+jzajfJYDl0efrpspgsAcW4heajuL4Pd+69K5O9TWzLxw9hk7CvBEGtqQY6m3nnt+zhsB6Y2+fSa55rcvSyhFJDvA3uvItfd9uqfj+3X2qQYk4xUPcdakDzYPCCNRoku8Fj89C93s/3nJ+cGdn0J/rLXD9oO63A3Em1uKf8Rj2+MonH+XYeWVOR7lj6+t8Li0nxFsb08opYaJ4ylYtT3jRTRfTZ92KolQqHn5zthKThMoMPQEpWkzf6dPaIXf+wgQzIj6pzVHIQYYImdu14QF9Uua17FVwzpn/r5lokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+djlE/RxhbpRukq0Rhff/is8uf9PxUT1gmUoa1C3gyc=;
 b=Z+VQM8OEhpYpZ1VLSpvseWEY4lvUpdfaY8GffvEK4DXHgf3ippM8HLKniPCt/GqV9G/mq06uXTDeghikFnXTuUO2e0ErpWe+XA0K+VC3T8sQEGrpP3lFUfQ8mDX1CiOP0X+4g9pBwFjsqRTKecIz9/HltMjjO1saHXTkDFYf+CiIRtxcFVX4mjQ0vxeqjAJSiKihV08jdE4NqP0STeAM/ar5sJcCGGu2/DlZsa4hE+YOvN7E8nqVOU6qWQKxwy/bikEdiVO2XqPtyoec3Kjkn0mjRIAERmaNr6FffUEj8kr0dzh0/0YDP7quKQM+Hph6UZjkHyBXnanjzU6LzOOsOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+djlE/RxhbpRukq0Rhff/is8uf9PxUT1gmUoa1C3gyc=;
 b=XlyLyw1yeSm7pnsq1GQHFyySM10LyrbkVWcb1RhET/tgyxJRYReixJVDMVEEsq3eWEAqx6S4/LZZpjWA3oibdQeE58BtRnpWWQgkpK3rgDIAy7F7i5UbjrMc7XbdxTgxUkw9pD/49LTkeuO4lx1nz4ibPmx+thFDoPPBCmcOyNg=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 03:59:49 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 03:59:49 +0000
Date:   Thu, 15 Oct 2020 11:58:10 +0800
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
Subject: [PATCH 6/8] arm: dts: socfpga: Remove compatible string from dw apb
 gpio port
Message-ID: <20201015115810.4913fc4c@xhacker.debian>
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
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 03:59:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1bf897e-e8f6-43d5-d493-08d870bec320
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB45558BC9DFDD4A005A9B872DED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PLMFP1Cs5zTnjasDefk5yddxyWlLd7QYqcF95aUDFHNKi7A1ZYbOEnd4in9I16s55lGTNcv8B90k+Hu+8z79yAHiiM4o0LQMOGar0QHNnTy+7vLoGWCz197g10UV5hPKHA4nUAAQbZI+azE0BJ3hirMUyKtgG1Uz/0l5TJgaq5sRy8ANkX/Zswsy1vYcCrVN+FucGwEZuMrXfKbOQ3pzBLaBPnavUwTzQb3xrbymkk4hbSin88IF3BxAm7vAhEsgJJw+T5X8zWwCvYIY4v66jKetlIUq3qT5cHM/xKyjL803GfnI13EKWtwtAKtq16V8kzzNFgdyi74VEi7s2Kp2Weo/RGWShwjS7ia9akhA540gvxMLRLRh4of6bC9EWxtc5ePvo3iD6lTmPVPsS7PaXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(4744005)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jQjVsCdXB0CuekIcLeMz8FigipvWrLI/Sn7sYed5Sn+XuHN3u1FYta+x46SH8hqmWF4GGwvSXalGT3JWvz352lTINS5lhmJcyvwlbUNbMf4pIswYA/DVfuQJpN7FhPG4UCpyhPE63IvSSTNuP+ErB8BXx1TG3uoqSrrhyL33L0hJxhJyJvIQpuvU9L7i7rrHs3+NEm7yQtHJhixbGD7JCHm/TC7oNNpm6jlNakTUIABxi1vXsDVUx7KqK8w0So+9W1cgC9PQan+DC0lwbqtoK34LySUAeG7LrobUifJs1JQ+qx4yCcgd+sinDK6DWWqSgU1S3eRwAbQHgAbOQsl20m2ID09ZrynRg34bv+sOhXLY751pRUiIsWl7JuRXihyMIWghPfmejpswskUhBCSbaoiLBxR6Ct0N2sw80HGLnC0+AoM0nK+vzB9tPYbn4+feNxGpzQnswxrChDeC3fBbLcRve3GpO2CVWCSpsqEuQ1eNeu+NYZx2ci9UmD5BQJvuPIQ6OO6hufa5bEp0NUZPqybVMb4pAIexKkFg9CvJu/sXJHtBI74GiWVUJCFXzPhcCeDvSCzoC6HE9XLgtAc8llDQctbDOwUhHmB7pcu0Dle1swTiXBC3N/UMxPNfo2jz/0/jeiRSdS5awWQh39FlRg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bf897e-e8f6-43d5-d493-08d870bec320
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 03:59:49.6229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+2EhY2snziqaQWJ80KyQOdpdOYvYcjVO2iBue5lka+n7rYLYGVqyRpiy5E4OJ2GQ0cPZMYvzbA1d4n9gjT97g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 9d7f19e97df7..757c53ffe345 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -199,7 +199,6 @@ gpio0: gpio@ffc03200 {
 			status = "disabled";
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <24>;
@@ -219,7 +218,6 @@ gpio1: gpio@ffc03300 {
 			status = "disabled";
 
 			portb: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <24>;
-- 
2.28.0

