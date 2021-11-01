Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4503441FA2
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 18:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhKAR4Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 13:56:25 -0400
Received: from mail-am6eur05on2082.outbound.protection.outlook.com ([40.107.22.82]:2145
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229802AbhKAR4Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Nov 2021 13:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF4DmACALsuEiEdsxY9+MaxaHt2pfq7dltunaQpICWE=;
 b=1nWjmS54aLAb1xT0hJkdEFXKIkWm3ZvFSeAUSRK1+oW2PHDVif4cLJOcycW7d77GAH13DB4wbwXFxeqHfnBXBx2bC6kAKmZfEoAP7ISU+RPxgnYGOfe74x86Nq8BnIW1ZdW5Wgk2n8qw6nADovTzM7NYkrKd35Ir11Lfc0gATUU=
Received: from DB8PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:10:a0::27)
 by HE1PR0802MB2201.eurprd08.prod.outlook.com (2603:10a6:3:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Mon, 1 Nov
 2021 17:53:47 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::69) by DB8PR09CA0014.outlook.office365.com
 (2603:10a6:10:a0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Mon, 1 Nov 2021 17:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 17:53:47 +0000
Received: ("Tessian outbound 6ebd41198c5d:v108"); Mon, 01 Nov 2021 17:53:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84951f99555887c4
X-CR-MTA-TID: 64aa7808
Received: from fc66fcdfe44a.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 266CA750-4A36-41A2-9ED2-8221FABDDA0F.1;
        Mon, 01 Nov 2021 17:53:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc66fcdfe44a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 01 Nov 2021 17:53:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EO7eITOuAeOne4jfha2Zcp+PrCRo7Kjr6XGtm4KKLFsNr5NXGWfjIeCSXiqkzZH7kJ8fLshDY2EXtNntrbHX5SWGuLLXVp05UoCN7p4dUB9Zs9tZXIpKafNHpTMo0DmP0aDGIi/ENeK8fuiyE39llCnPXc89C3p+p00hS+7HiEdYtBPxTvQHYIgZlq6aQXuMDTtZ4JRYcYnqf3NqoUbN2vGho9VIQ8UBSkU3VhJGhkJ3/sBl4vJ8cm+kRkkDdVteqaQYaUMB+um4RgeYWBB9mwVRD7+BiZ+Bg3B14ErZYiZg9Wt11ddGburRkiwtqn2rmfBHM3wWpamu1Q8EjX1Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF4DmACALsuEiEdsxY9+MaxaHt2pfq7dltunaQpICWE=;
 b=U8StV/srH7yEmWRpHGsL/zLncZ7xBt6/62j1cux8sJQXpHIXyGKocJqEkTbKohL5v3ujmb8OQypIHSvn+StR4CtGB/0d32RYXnjOqE3eGRRaHQLOqCbPW0egUTg5aRbF3jOZ/gLXlkoVQD4qJ6u6WXw4S/nqASNa855QiqkCQlWaw+/xlYvT+9enZObdmAHCr63BArhGfRoHYhVHmFwpggRvd5oCjersOtj66U+Be5Ms0LidrmcebYo8He+IHtIuOQi5ST41ZHXLsfoPOZNH+5Tw77+VhKkZn8f5IJaJ3gcssnvfPLRimX/wRBu7NlFceKew3PZ014HOZ2rjitZ1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF4DmACALsuEiEdsxY9+MaxaHt2pfq7dltunaQpICWE=;
 b=1nWjmS54aLAb1xT0hJkdEFXKIkWm3ZvFSeAUSRK1+oW2PHDVif4cLJOcycW7d77GAH13DB4wbwXFxeqHfnBXBx2bC6kAKmZfEoAP7ISU+RPxgnYGOfe74x86Nq8BnIW1ZdW5Wgk2n8qw6nADovTzM7NYkrKd35Ir11Lfc0gATUU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DB7PR08MB2972.eurprd08.prod.outlook.com (2603:10a6:5:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 17:53:29 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::f169:9645:e7f:7dec]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::f169:9645:e7f:7dec%7]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 17:53:28 +0000
Date:   Mon, 1 Nov 2021 17:53:26 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v5 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <20211101175326.GA14846@e124191.cambridge.arm.com>
References: <20211026175815.52703-1-joey.gouly@arm.com>
 <20211026175815.52703-5-joey.gouly@arm.com>
 <CAHp75Vc8-sZX-aMtR9o5_=_X0y6ALYCXR2W3Y4389=xD7c__nw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc8-sZX-aMtR9o5_=_X0y6ALYCXR2W3Y4389=xD7c__nw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.52) by LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Mon, 1 Nov 2021 17:53:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45013959-cb48-478e-cb1d-08d99d608dce
X-MS-TrafficTypeDiagnostic: DB7PR08MB2972:|HE1PR0802MB2201:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2201656A588FC001716B70D3948A9@HE1PR0802MB2201.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xKEUebI9czDo82qgEg5zs0rW5F2wmSusUhtQeow7khGBodztNCd8mJK4mJsfYjoC+mHQknATQY7dEhb3fxruYHNMrceWm0WSOe9GbzsczjEHUThv8gghTomHHyva0BeWMHUSPOiYAR6o0gRWMkTpmVKaWaOdxH+V/YU0qLH7BCayXm+R8c4LqFdDXoRmVzQfTrlgqpEyxfee7zgSVB3KS39lnm0smVjt/PMzyb7WQUkMvK9uBJenPi/qxs7W5u9e+fvrAd3DEU4Cn3KVEzMkGY2lvM6V+XwD+HLq0Swd/lbW4NevF5r4tob0ZopsTEH63FudILn/80G9x0GfBqcs9fiTR2/sdDDo32/jg8DGEnmglikw3P5Qnczr0K7c1ASa9g61umg44RHhbqXktlI0jLgalkJENeYF4v3386L9jLco3zSvD5kfvaTMg/sQPxCN2Jp78RYG6I6fazHoGpJGVtvRp4b0n5n+w4HsdYLi5HpNsTWA4BR3T2YWE4luw1nyfOxBGbdolkpvggsf7f1+kdKQEGsaUzx8rs4Eis8XL3gVndu/eHZtNBEoVSnAzxGM1hiKPJdszI30oI/x9oAFCSRavWFBNJuoQVTUBYTCJwroZ5inwmkejUjyBFPEGX/Gk4w5W7o6aah+JfAcWMAvL3Hylrf6iLikzTXgyt8eD1qwj/KccJcPtihbOplX1/de7CzkS50yiRyfbWlINRNcvKbD4YyghWsykN6khASgfpU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(47660400002)(7696005)(316002)(66946007)(66476007)(66556008)(38100700002)(38350700002)(52116002)(6916009)(53546011)(186003)(86362001)(7416002)(508600001)(55016002)(26005)(33656002)(2906002)(54906003)(1076003)(44832011)(4326008)(8936002)(8676002)(5660300002)(4744005)(956004)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2972
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d3d7c8e5-5d20-49c5-4d01-08d99d60826a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tlEPKG9gRLbxN+z/NqQkotkupGM7Oy4+ykxUPNi31HU+iAaznSq71s7y5C/hgM5JV7MZ4QIAdn/0OnYxgBFFwGhYjZtyo3+2QgjT30TDIS41qZ8Jrp12fYa5B95+VQcAARzaEGHXj0TXmEbmqlwRqaBpOrJikQnLjFf+3njtruRPxy2p93woNparqHaH76pC8+LVRD9HGmSeZsybVgupF4TB2gtyW2yI1lBX+N/hcAW4JOuZDu6f7kyXyzMHpiAqcaeT0z7V+pSdSZoivzZ49Mgy049jHWBhiaKe9mvZ5cP1mEQgEehAlaFV8gsQBpxNdDlZ/bzjHcOdQ6gVZ7W1q1cDXQBf2lwW8/zlVG/P4mzeL540ucDvFYqg5PD4mURjRoEUVgcGUaQteJc0w1nNmoOJApqRUxUgrRwtlOzVTBCXF6cwEugijBJe/3BXdU35wdqsyEI8STZmJLGmwjcOarnscfs+ekzGaPqpB1pbtsr9jhA9GTu2W8K4HeR9ACrVJJrZIYOLbYXTs5cgfDp+xeR98qDxfSyiTVv3+eq4qcWOepfzHOrzP8gtIqCZMI9gGvm9QV2PermGbCe4fkkb1OpKf6j2YhhmHUeoa6zelHnvYB1rlIgyY7WOrKv/XhqBnobCUhkKT56wNZIFJVcqh1X2tPxQa8TUgIFVUTAIXcle0krv+slS7p0SYHTv+wR+Q+enrwgH/4kdWQFv3kQSD6f2psbBIbrg9dsD4l2BeA=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(54906003)(33656002)(82310400003)(70206006)(107886003)(4744005)(55016002)(336012)(1076003)(70586007)(36860700001)(44832011)(47076005)(6862004)(53546011)(956004)(4326008)(508600001)(8936002)(26005)(186003)(8676002)(5660300002)(450100002)(356005)(86362001)(2906002)(81166007)(7696005)(316002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 17:53:47.0977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45013959-cb48-478e-cb1d-08d99d608dce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2201
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Sun, Oct 31, 2021 at 03:39:01PM +0200, Andy Shevchenko wrote:
> On Wed, Oct 27, 2021 at 5:28 AM Joey Gouly <joey.gouly@arm.com> wrote:
> >
> > This driver adds support for the pinctrl / GPIO hardware found
> > on some Apple SoCs.
> 
> ...
> 
> > +       ret = of_property_count_u32_elems(node, "pinmux");
> > +       if (ret <= 0) {
> > +               dev_err(pctl->dev,
> > +                       "missing or empty pinmux property in node %pOFn.\n",
> > +                       node);
> > +               return ret;
> 
> This is incorrect. It always happens when somebody is in hurry :-)
I don't understand which bit you are saying is incorrect here, can you expand on your comment?

[...]

Thanks for the other comments, I'll prepare a patch addressing it soon.

Thanks,
Joey
