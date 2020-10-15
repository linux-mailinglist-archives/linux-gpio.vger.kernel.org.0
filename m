Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2EF28EBC8
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 05:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbgJOD7o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 23:59:44 -0400
Received: from mail-dm6nam11on2042.outbound.protection.outlook.com ([40.107.223.42]:22560
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727281AbgJOD7o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 23:59:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi7Gf9KduC3kw5QmP82jmtmbn/U3yJ++2sgV9W5iKstJBVlCAUCiGh+/CwN2yqrPJfgPEdh9t6FKI1i3anTB2ySSalKj+aiazrQA/0+KxVoYFyJ9JmYM2cF92U/X6L/sxPe3K90QOmFcR0omvlHAZnqTpaThlfKo/Nxa4PXBuwmD5a5SChowAcO5nm3ZRFGcJpTC6HEBT+lT1/lSh6OH26yhG8WjgJgGUXgR1tZCXA6kZeZDScTS9KQ6VrE2A5WoR7zGk1BDiJlaGlKvMgTHD96Cnp+vcXiO8GH6a8BD96kBLKhoxDwCpyqIn4oGY0XWcWw2jQvBm7Dv+vwGuviZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCF5eoSoYS1kU+EUQFGwFmNz3nLbCshy0mCs2AA7Ip0=;
 b=msWmEk9pvD3+NmF9TL6URn0d0Pf6uUPy/3O1Ll9igREYbCCu5IDkDAqjvWpHEW0hf/k97F+wnXffMFxmW2GsiMsrzbOPmXPhPr+DuXHLNhTzjCgiH8V7uhRkwXFTTGooQaWl1n9DL5l8z1K3F9nQMN/r4TEHMv4bKyeMJ55MJYs93QYcw//+znAQ6e8Q08EJ+VPXPmIGPXqViveqNcWPnAi54e6gOKQxSDUcvd5gvnYJdly7VGVIhXvnftWZc7Gm9I9ct2cZXddNRyyD+mDtmsIG+9CsuwgdfpKEAqZotmpUISqL0zCHKY7gaX9ifmvE9XGpbNeMCkhLeqZC0WF/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCF5eoSoYS1kU+EUQFGwFmNz3nLbCshy0mCs2AA7Ip0=;
 b=HtmqUoFiI1v81NjQCFRepUNQ/rQHQTghIwESKhU2jDbQQrAmdj/9i//b4zbqFL6uJkJtcH4aqOPdYVJoo6MsOXX/1CBsPDIVRFOZOJOmu0rxYlKUcsyJPdnAtZa3T9fxRA+PKeQ3cE5uMG8P0KK2d1MzGX5dP9JCYk3eYFnUN8s=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 03:59:42 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 03:59:42 +0000
Date:   Thu, 15 Oct 2020 11:56:55 +0800
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
Subject: [PATCH 3/8] arm64: dts: apm: remove compatible string from dw apb
 gpio port
Message-ID: <20201015115655.26eb492f@xhacker.debian>
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
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 03:59:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c51fc8f5-2ee9-4af3-1eb1-08d870bebe81
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4555F21FB061DE216F434529ED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5fXQRwOVsHM2Bl1PTorfQOxH6stDuDu5seF5zOyloOTU35v+qTAmf1bOKeT3FFyOfLl7viDzfofhMugikw2OPAdl30hr0agEyDRdVJsU7C+5R/ePt7tR9W/ZojNDxQjt948x6ifJXrG90XPEFJRW370lI4hR4hZwZnr5FLUhWJk3f2xjPDW9iYoyRE/vk9gPjTbMd9L/DCT9lU85FH2odzvDdv8+/CCfqKpyi/Q+YOCCHbRZRWmqkX+14TqNRIH3hBvMsNTr30PQHp68NP/LWbq/XerDMAOh43/jTtz8x7D8G6S6TlqyGF2UJMr2L//9R9Igosh1nPE3knn5jrHVfIjGeM7F9iESdJamYIRxYN2/2+hgqbatCF9D80tPaz1Eo8l2Vaqt5oDtz6vXSrJxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WE95PX10uMyAK28dqrMto5ggXuEt1vDlnWKP9ZkaYLdtxzbfMtPTw5/0j5OmIX+pxDjx9VVg8fjVJeht0RXelpW9TNsRUn4loZ6NhfseYE3APHW1KjZLIFL9VPHOW0jC2sthykKvvynVCCu/UQUYTqKNQwzEWD4+W2RfxoE4JrN+fvsvXjhsAzFPNaTMqaj7W6N/6dkT13NFd+mwzS4Ew9gAI/uPPU/IrVEMCyf/K4/Kp5fbCeZXMlVvCDaCUvR4VoTqBP2vTUDFH+zAMVuUoiJYOhXu6DWlWSE+9STxtyPvJ5Cn8yb7cYcKNkDIKN2hc4lICndyvmLZGRAXjfWPv1Svk+MxgalAtMWAGFUHXn8Xe1VIHKlVZPNFYRMmBNwZ2ar8BJMgkR1NXdEWXv0kE2a5M5eppPuNQ+Sx5Cwo//XNeZiCILFYw7S3PXp34WKpsXsDDmP8DPKFN5OblaHw7+aHJbkC7RZMsfhzbDLk+bz34bPBTTnQN7DBarznzKvmviabBN56O1MQtE6saoW5nYcPVTplsHZs+WIlSNq6zwS72itEpPRNfTrO5wvjXRugybH3COc8OzX8dgYxs4iAJduLlY9GiayPO0pwoeNmdmfOG6nPQzrdfuegNDDtGWFC58a87v+Oe691n86UYumKCw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51fc8f5-2ee9-4af3-1eb1-08d870bebe81
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 03:59:41.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQhI5pOEblsOyzwEasmjbcEioKooCxTwklyFw5YKPeF7rUfT1wrfCpQrpqlpKOy5msuuIl6Ny3mqqkuUUlSzaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 1 -
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index 3feb1881bbc2..cc4265cc13f6 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -714,7 +714,6 @@ dwgpio: gpio@1c024000 {
 			#size-cells = <0>;
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				snps,nr-gpios = <32>;
 				reg = <0>;
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 8c802d87e751..64b86b9d1b37 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -830,7 +830,6 @@ dwgpio: gpio@1c024000 {
 			#size-cells = <0>;
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				snps,nr-gpios = <32>;
 				reg = <0>;
-- 
2.28.0

