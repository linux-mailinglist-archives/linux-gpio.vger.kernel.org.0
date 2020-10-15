Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD98F28EBC7
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 05:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgJOD7e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 23:59:34 -0400
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:65025
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730632AbgJOD7d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 23:59:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxxIe9/WrY3jmOIANXordf69nG1Z7IP2rnFp/9Lwz5G/S5S+GZj5hq35hDRbCHc4cXVF3P6RUwsF2gZbbWDzOr9IvtMLHgzRWeV5V2+RvClvtWEFvy1jRccgno8DPZjzkhuNac/2/mHs58atLsiicr2F7LQuJ1E8Raf57sDXpofHj/8mpOF26M2Y16S1QHCNx1tgF5/FpTBsWSima6R5OXoj/PZkPDgwev+EVgDak58C5P04VgfmRWCgH+BR6LHlarrnCYlczzMA/OR8x2x/bVlFcCDd/v6znHv8M/mKRQG3h3nSHbUQ4752Kv20Y0Ep6H8KDtSJVFWu0mImES1qSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APr6zlp+zN3wiLoYeo/zKt0oYBtJ5eBRm/J/gXTJ5Sk=;
 b=J2+RDYHMzdgh9f0uxGVzVsOwqOoJpblIDMVL88FrS3vT4uXBwTbpQsXrviKXpn2jVkjcXAgblsHS6D+E/Cnu6nF3lQhqGUQVKOdZLPcHD5FGvtL3ZGI3kRjfgj1fYcCwsJ0mmote/KuN9v4YfSnJagsnEtwDIlFJbwva6V8J85KhcLZbB6N5Z+HgI2mgbjE9Tzam6fHKpa8yx4PygI5mLwN55e0OT1AUFibsfYY6OTBwQpYWdOmPif5UJUIAN/5QCz2CKoihqMYFG3tSrIJX4s4k0fQKn894qtNvOO7LPtB/KiCbic3fbLkiwSZTHvcPPeuWvEO8qReE1JMCWh2VFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APr6zlp+zN3wiLoYeo/zKt0oYBtJ5eBRm/J/gXTJ5Sk=;
 b=oaO/TjGu4PpgCLdIVEPRYHWM54chjdR/1yV/nzUZN1cpPyjFytlurfEeyCG8aaJvA1rZ356aiat69jXfzXUxcXRT9niuC9i9uSeZoXO+GekmB4R3oduj87/FkaJ1Rd8xPD8ehwCpRiEKZuUCQg8UTudtVeITvpxcG8yq5uV+Atg=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 03:59:31 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 03:59:31 +0000
Date:   Thu, 15 Oct 2020 11:55:24 +0800
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
Subject: [PATCH 0/8] remove never-used "snps,dw-apb-gpio-port"
Message-ID: <20201015115524.24e3c36b@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.15]
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 03:59:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32f9216f-a0ff-4c6c-45d6-08d870beb871
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB45555FC4C74D3877DD3B407DED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bmZmdwa5i6XmXylRKXFmaoehS6gC5HoUk5f7MwZZDX9aC2Ji0jIVFqh+YNghpBVD0q53WLaFuiWJtpgkKTJN3oAs+DNJgA/+tWHa6Awa7gYP38K3XJgD3zrgBKWjKCf4nPmq7XMPBOsRb4n8sDwXt0te3Miy7nVZAX/6RoD+L7NdUfbJEestf6AxjhebBxIeovq+Y6wCSCE9CkaltW7mMeZvy4EuXHqkFBNVzr029C6Lh6QaMctt8KAs1+1WhWgKifwr2ZGKEH/0sDfbwkCCO0ZSk8uNWVKTljl4wgRjwP5RUzfSTHzlKVn/LEPeeITTTqUPvB9O2bOngr+vEOeSQ6R4WX83ZCtmnJ1m8GYwCm5CizOs4HcYAzh6BUXe1IkV4all8rGKBF1BKvB4HQZU8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 7sPn5loXa56u7exwvP8wyZh87JjEuKxXouxZ3xDhgDKoLMVY+KAOAFAnkql3gC9gc74VAb5+ATGy0oz3c2IvsoN9WY+8XYTgyTba2VkibN6zL5iRJIl7qiCaxBgirkZda4462eUzbij3ohiPdmfl5ckmi8KQPgMPO5+v1pmt802ex+mPPTTOIjzlgad6KrbcSZ9A9NkppUcHHAhaatXol4M79lEjjJzYnzMF7CRzUhcDp/EypgipM8jmxc1sQX9NjRSzQPTqO9BcB1L0X0ji6O4voEyszIFfhTp2iZFcVZMSclVN+ZQsdRQ5Sutkl5ivLFUYXEkBHm5ZOkx1ENwrlCc/L+UXK14JIkOWbUiYGAaDb1ibcFcfKhp8pGONxFP/ts3lc6BZAhkBB1YBgM2onsv4hhuagRKLfV8/WrbSXbhoTe15tSG+/n491ItNGDskbRm+Iyc7+A9Dd3mMH7EzpASw2yRUPoTlxlnJKZIN0HS+Kl8he2ZOVsUvPtkgRNjkV62SHJ0nFMQ4ygo51Lc5HkQBJxQvLGHVcQvDIjtn06B4PGUXU0jYO8mlQmPSVZCpAslegFwVDF21BmUAolXzxKiN45E9l+8pe9OJprpK2Ge2cmoR8b1eJQpo/oeJJ2NX5alKZobajKY20n4toTy2vQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f9216f-a0ff-4c6c-45d6-08d870beb871
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 03:59:31.7081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: golX2G87yEts0TSgc0dX4TcKdgOyjevcI8pchVqmLqmXujchGgPoGhMG0heC9G4MvRAlBzPT4+HxVXtItX2moQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "snps,dw-apb-gpio-port" is never used.

Jisheng Zhang (8):
  ARM: dts: berlin: Remove compatible string from dw apb gpio port
  ARM: dts: socfpga: Remove compatible string from dw apb gpio port
  arm64: dts: apm: remove compatible string from dw apb gpio port
  arm64: dts: bitmain: Remove compatible string from dw apb gpio port
  arm64: dts: hip05: Remove compatible string from dw apb gpio port
  arm: dts: socfpga: Remove compatible string from dw apb gpio port
  arm64: dts: synaptics: Remove compatible string from dw apb gpio port
  dt-bindings: gpio: dw-apb: remove never-used "snps,dw-apb-gpio-port"

 .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml          | 5 -----
 arch/arm/boot/dts/berlin2.dtsi                              | 6 ------
 arch/arm/boot/dts/berlin2cd.dtsi                            | 6 ------
 arch/arm/boot/dts/berlin2q.dtsi                             | 6 ------
 arch/arm/boot/dts/socfpga.dtsi                              | 3 ---
 arch/arm/boot/dts/socfpga_arria10.dtsi                      | 3 ---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi           | 2 --
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi                  | 1 -
 arch/arm64/boot/dts/apm/apm-storm.dtsi                      | 1 -
 arch/arm64/boot/dts/bitmain/bm1880.dtsi                     | 3 ---
 arch/arm64/boot/dts/hisilicon/hip05.dtsi                    | 2 --
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi               | 2 --
 arch/arm64/boot/dts/synaptics/as370.dtsi                    | 2 --
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi                | 6 ------
 14 files changed, 48 deletions(-)

-- 
2.28.0

