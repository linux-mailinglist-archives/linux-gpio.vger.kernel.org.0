Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6A841B924
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Sep 2021 23:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242873AbhI1VWn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 17:22:43 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:3717
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242879AbhI1VWm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Sep 2021 17:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvY3aVaZeuvuh/NNzuTu4vgcOhvl7iaUt8E8armPtqs=;
 b=4q+wg2baqwTjtP34K+UbADh8s6URgsVRZwfXUN6mE96p8/sjpLmsRJCaZUra+ryFD83SkTSFmnJ8K1favMSHZzB7Q5NS2i3BtAciRyvGZHgfiNCjMqEtq/Pabk/f57d6DDBY77X/cMYRZ5rckrNnz0de6Q6k9DP6eFjfPQH2jPg=
Received: from AM8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::16)
 by DB9PR08MB6940.eurprd08.prod.outlook.com (2603:10a6:10:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 21:20:58 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21a:cafe::c1) by AM8P191CA0011.outlook.office365.com
 (2603:10a6:20b:21a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 28 Sep 2021 21:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 21:20:58 +0000
Received: ("Tessian outbound c21c48fbc857:v103"); Tue, 28 Sep 2021 21:20:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e6d7ca61b16769e
X-CR-MTA-TID: 64aa7808
Received: from 079432d03c00.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 39A71581-4DC8-4924-BD34-5911E3A1EB46.1;
        Tue, 28 Sep 2021 21:20:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 079432d03c00.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Sep 2021 21:20:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oae77kfI5F0aLa7RTv6Rl56k8NeNoFMtjckCgJZlNOVpb/EkN65UVLmsTzvK73Vc/en14UBmpgISNke33CFfl+SaBCe4ZytpAgdvjxZ1zpoqT8gChrIz1vJYIK/EOIUA2OsyHWtFF7zASV3Ca3z8oAdfSEto73HoJjKS//USGPUGeORdtNEgOA40P3pPgI0h2TPXLtKnouAkBm2DcFVnDCyhdyZ7J3MvQf+9ZcItU/E9Tmsnnz7sRKQPrAs+oLhSkO1cFuYKS6H3m8+ibyHK5Q0lRWMA+nbBPm/HDyrrFVBZ99qSbUKCXcn6I0pgLXjfecVMfP+61t7jb6b8sdSW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nvY3aVaZeuvuh/NNzuTu4vgcOhvl7iaUt8E8armPtqs=;
 b=ZqOrBZW3A2IFT6j9MjAiiwlGugtsIRdfuWeYuIYYovfwxez/sd4FLIGIEqB8UOjxBVawMl84vyJjmgT5nkQiRjFfS5IEuBjX6Uc2NeDEn6Fs8AasgRiGoujwoQ+em6E/HPPr0Bh3SO8svTx/82MiYX9pJ7qI0N+YshDoVoD3nm0QpqljBod16qApMCedED7ZSvhKL4sV3C1FIXNU2OzIJK0V59GXFA4TrWK3TiHs8sEu256M186tMe2vDPCyyLczJa4skSrUjyjIm6FUEYkXSm4150tdKPPkaNsK0l1EQRBKni6wA2Rl59o6+VjAEfRcgL1FFV1Qkjo9krwh4VkJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvY3aVaZeuvuh/NNzuTu4vgcOhvl7iaUt8E8armPtqs=;
 b=4q+wg2baqwTjtP34K+UbADh8s6URgsVRZwfXUN6mE96p8/sjpLmsRJCaZUra+ryFD83SkTSFmnJ8K1favMSHZzB7Q5NS2i3BtAciRyvGZHgfiNCjMqEtq/Pabk/f57d6DDBY77X/cMYRZ5rckrNnz0de6Q6k9DP6eFjfPQH2jPg=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DBBPR08MB4555.eurprd08.prod.outlook.com (2603:10a6:10:cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 21:20:40 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3%9]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 21:20:40 +0000
Date:   Tue, 28 Sep 2021 22:20:38 +0100
From:   Joey Gouly <joey.gouly@arm.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sven Peter <sven@svenpeter.dev>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <20210928212038.GB19131@e124191.cambridge.arm.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
 <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
 <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
 <CACRpkdZp_SNZEvLW=mYTJxaTdnX=mL0tbC6hnSkr1kht67ufZA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZp_SNZEvLW=mYTJxaTdnX=mL0tbC6hnSkr1kht67ufZA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LNXP265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::31) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.50) by LNXP265CA0043.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend Transport; Tue, 28 Sep 2021 21:20:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ecf7feb-e864-4dc4-4587-08d982c5dd4e
X-MS-TrafficTypeDiagnostic: DBBPR08MB4555:|DB9PR08MB6940:
X-Microsoft-Antispam-PRVS: <DB9PR08MB694063C8994E7C6D100BF6B494A89@DB9PR08MB6940.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: o+3ksqXsTVGCggbBck+jkXQ215Xm+2j+3O858KV4JUwk1gdxzciYhuRig2NLQIS2u/QTXqgQbQxyT/C3v907MPT9SnbMt+NZIFqyx6ZWtUPV+CKKtyw1kjE6wP2R1n/vXhlwjZfl2WttVqCSnLlFwMJ+d/UxwqPrweltRUNIbzTlMT9Nhkd//p9NRwu8qY5GAyPvklgzKIEt4Jh1xXysTLY6oM6JMxXpPaSSUKa9i+N3HQpbFLWyIczgMm/3xK37021v4K96CKcuGfSxeT2rxfr1027FeWX5NBLXu7PgT8bD0fS+ERQ5qBkU7pix9kKw4u/Xsc0wVQJXg3YPVC4FmFcoGwQsQ/h0uCu7cUSwam8BeR9aFwmdL2ovVUrVLpvkLNDHI5uJwunbKWN1ArG1yV7CWDISMMIex0xK+5Xer0Q2vG6nnIZk4AQK8Ril4uDacRh3tzFM/nWqPINdsAzNgHJu7M/YiKp7ckfS4PiFTUkk6f/YACSaKTLWudmGEEQL8G83aL/+N08Nhv5joV/QFoYZ5x8G9pamZZswNaQ5V/hbLYjE+ovuaPRmxdiCBzurclXGOM1hBHFmGYVD7PdX+KfqWoLcBKGYCOc0viWrBoRZEPJpc+CDCK5BG0Jd8vGocxmNeJv8S1sQrAAW3SmoOvlUtOLLDnj0bBlfV6yUQ49A9syJKoq1k3CxnPJP3WxdXW0J63ClsuTAdiVDfrHvacY01TgGiWhaBBV0ajmd1gM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(47660400002)(44832011)(66556008)(53546011)(83380400001)(1076003)(956004)(508600001)(66946007)(33656002)(5660300002)(66476007)(38100700002)(38350700002)(54906003)(8936002)(316002)(6916009)(26005)(7696005)(2906002)(4326008)(55016002)(52116002)(186003)(86362001)(8676002)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4555
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a08f52bc-74da-49b0-2102-08d982c5d25e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H8+FtoqnE4nrBdIUBc9YY1sXgiMTKkLAWQwbuaDPRReXJyLkdjyEKEW4jIvJzWCw3cJMWztO9Qc1ky/ps0uXdG6ZX+ng2A/wpNsjhTv9wU73rTtRzz7SacCidOqjKtC4DiTDSw6JfbNMS9TddWhgKbj++IPd89vi0rW9t3OOhZ1rzNj3Yr+/XdOB+BCzW7cbzz0qvY2v7CO41Ln0uUx3YrwfjEEoSvEqAUDdaMsbNCno9MOVK+OsmB8kUgy1MoO6ndODbYeeN0pzyr/T0MN9Nwniqo6Sjrj8E1kdStEP8rhw3rVvTxVcTtE1oo7U8Al10utWByRGo58ybQ3IZo18zoXJgfsTgfzj0M87huc9Yd0xx99Wb8z9Vtekb8SA/pN+sB7NyWASdvm3gPMcbMXQeMZPzJf+nKao2n9/qlTo2IHnYsLsSmTeftWuQR2pTYbnCy2ihe+zuBCr+5esfqjLxVVxiPPD6ri5/WRiBVVReQKxZzrxE+s9Km0KCi6q9/4b0PC8PfIC0bMf7yhXPzoBrN9N4yyPmEZGkVXLXooAaafk+uWY8FBUjsi2qeewP17oJXNeKEswvpXP38VObQB5R6fGhgBWdmKCo+mzERVAacNPFK/IjjRBdgfh5yRPI/QsN5eu8HKAkKmQ+YGZsRFbGobKGfFMYuO8dhLF907y1se54U+LWw8CK+6Z3A1OW5pTPSXASGlfn2eqSJ8PQQhbETG+NhO1NN8HgnWDfh38qt0=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(86362001)(54906003)(44832011)(186003)(316002)(6862004)(508600001)(4326008)(8936002)(26005)(8676002)(53546011)(82310400003)(36860700001)(1076003)(33656002)(7696005)(107886003)(47076005)(2906002)(5660300002)(83380400001)(81166007)(956004)(336012)(70206006)(70586007)(356005)(55016002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 21:20:58.1648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecf7feb-e864-4dc4-4587-08d982c5dd4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6940
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

On Tue, Sep 28, 2021 at 01:34:39AM +0200, Linus Walleij wrote:
> On Sun, Sep 26, 2021 at 4:36 PM Sven Peter <sven@svenpeter.dev> wrote:
> > On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:
> 
> > > If these four blocks in the SoC are different, they should have
> > > different compatible strings, because they are not, by
> > > definition, compatible.
> >
> > I'd prefer to have a single compatible and get the npins from some
> > property and I don't think that's necessarily over-generalizing.
> > AFAICT Apple has been using the exact same MMIO interface for years
> > and I'd expect them to continue using it in the future. The only thing
> > that seems to change is the number of pins available and their assignment.
> > If we just have a single compatible we can likely support the M1X/2 or
> > however Apple calls the next SoCs with just a simple DTB change without
> > touching any driver code.
> 
> Admittedly the word "compatible" in DT context is a bit fuzzy around the
> edges. Sometimes it is more like "parameterizable" which is what you
> are saying here.
> 
> I don't have a very strong opinion on it, both approaches are possible.
> Being able to define new SoCs are not always helpful for developers
> as the data in DT can become opaque and hard to understand if it
> is too general.
I think we want to try avoid hardcoding big lists of GPIO pins,
especially when we don't know what most of them are used for yet.
As Sven has said it would be nice to not need to change the driver if
future SoCs have slightly different pin configurations or maybe even
extra pinctrl hardware blocks.

I have a v2 of this series mostly ready, if it's decided it's ok to go
with the current approach.

Thanks,
Joey
