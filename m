Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F04A28EBD7
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 06:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgJOEAR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 00:00:17 -0400
Received: from mail-dm6nam11on2088.outbound.protection.outlook.com ([40.107.223.88]:19828
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726185AbgJOEAR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 00:00:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeIdm+6LzDbPRbLGd/agA/mNGDgEU79YifD1IJAIwXShwF9px3LQnsaolgyz45Hhkly7FIDj7bvQ3XTtDtIHKQ2FBnfI5sa52eH+O2rzIB7jLt6rMoW6apnd83wbNeMsD9+6gnJhGaAZYwj4Ck9ybNsa46AuBx9v13xPSieuUpTsbz/RSTWMnc4Dpw/1gZXfMeplDrneK83VgYcZ90TonDr7nAyMqmllzKNRzBEY56bexszqytUWvNue7q+SE6pPOOVoFvCWIOeFmL7NKscfdbqbYnVFT2ftigyV/jv97NnAVXo7x97sdb44R/qvADdsooiR+pamkiL2qynUPysLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dtKA+3/JxJ+5OI1gqKJSjNQKiZDPYnNnxYjFrZ69eY=;
 b=L3iefDpZrAFCz/Bu1RfInPDjGv87ApCiFpF+l1dzfkcekcDnsxEBywNuT3s66dCkJYs8z2+Dm2UF6uaO3zPhctJouNa0zsLZTO9O2kWl5QzhHknttKZuGe/GVVdmV3kcyTtfb0BWbTfhngoGp+T6JkCuI2HfFSQvYEeBp8rh11pyTZHLt0BDfg9LulocDZw/na598RqwIBiYopvRgHd8jz3pgfmMOWLz6lgk4eOHpHsfPX7b1CSuhIQkLLOhMxtoqALDKdX0QL7gvLwBpkmoc+9xPybw15FOcBDQap1bU/8sFbor+bcX2hwvvnovfCgTeq7NffNh0DfpBbn2OOqWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dtKA+3/JxJ+5OI1gqKJSjNQKiZDPYnNnxYjFrZ69eY=;
 b=ZoFjNByBQ9oPNToIQgM7SMlP+8j7VOAY+JLH2M8xzVmGcuEZfcCMEKOBp4s9MI/cQ9C++1gphLlLWMnj4pdk3bbPqnLcBuC4dOBkro/inpOGMDuFXPrvxOgz5OtWCMYPSxJUs3GfwiPml0dEt2vLlXpOpN555fPrtVPDGVuDri8=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 04:00:15 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 04:00:15 +0000
Date:   Thu, 15 Oct 2020 11:57:43 +0800
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
Subject: [PATCH 5/8] arm64: dts: hip05: Remove compatible string from dw apb
 gpio port
Message-ID: <20201015115743.4d764a87@xhacker.debian>
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
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 04:00:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb48a27d-1802-44ff-3f45-08d870bed2bf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB455523A1A3D7FEB2FBA0EF32ED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dGg8klEfzfWeK+CN2HhGeL0c3sCAWw87V/BE1b6EBdjDfbf/I9ZQcT9nIRqq2EAOWIJxI0+n0Gktf0Ab2PGWZxAjYPzu7wkrI70Bu/Rb6uIydbf68aaGnmf/XuH4cvDOo33brmGKdDT3omLvkohdAbsGq/owqOvy4KHZNXeOjafxPmnWgjuPuAnVrEVZ+zmbweLLehS7wKHjm/f8F67NoXXLf2BsKuz9yln7jeoUadKvIx6czoORnic4BbAxoAPTFoByVV1qiGgFeLA2S29RDnZmLiIaICIPYPJehD0Nz7aV0bRN3YSl8CpkL2aUbE8ZgYqhboeYKNZTr32oztLKjLezVbD/EP1FhOHJDiCXxMPl8nYbUjSlCoyfrSmM1eRcM6L1VonNLS4qgNQjawuTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(4744005)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6+9LQQSM1iBFnIfZuyJVAuuOYNfYVHul5Zy4fhyv+qcQOEuhMZ2gDKBLyzYDpYW19p7nYHNKPOiGhM8/04QTEve7JhjbAGrMkLqmEZ0AKGraNgGFCaVEvFPHc93mO+BXfQlKlu8DoX8ljYN8q8hAeLtv+WBb4uOP2g+0rhIzPfiWJW2KCtH9M1WC6I76KrJ3uGT1e0d8o5mdpcE4kwNDD+h9v+VLwOtxWI+Hw3scUYqrWVJyT4L1Gx5MNW6c8IXjbqR8Yx6qYQloiVu+5sxyAFFiGaDkkpTcOkrD6rgqkdv4g9sktuk8gQb26wwV9AyfqiUoKJJy8rXQQR45hONdGRnvSsGjH1NFa/IuVltxLuELYdaYISH9EtEkWpRcsRSEBCBEcZnLB9qjERMr/CDuREWoOK3caGuKk0wPTX1SN5YGXJpMhxhlpOZgHRIP7D6StUGxEA7eTToOIVJzxrwS/b3+6r82HdLswvksv82LxO+ZpxPF8Qvn/QISnTf7GQSnk1TXqMI6tgT+GveXzowEFPJFsq09sibNChLwOGwYTyt8RAoh5ytyXHQbtkCXnSqgt8+bEoM0rzcK92o2yJcDXC4f+c1WhJXhAiqDDeeluE2IQeIWQ9kFS0HWQFhkarqveDdUDuRVKWvk5ZrYEH4eyA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb48a27d-1802-44ff-3f45-08d870bed2bf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 04:00:15.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQrMM6VxgUyl5pRdTrQtcLTcFhLV6aKnz1JqkITKxRBKbfDALtMIigo1lcBji1BrmtgjGZ7zTkaV/M0ej4O6Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm64/boot/dts/hisilicon/hip05.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
index bc49955360db..390225f8979c 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
@@ -332,7 +332,6 @@ peri_gpio0: gpio@802e0000 {
 			status = "disabled";
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
@@ -351,7 +350,6 @@ peri_gpio1: gpio@802f0000 {
 			status = "disabled";
 
 			portb: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
-- 
2.28.0

