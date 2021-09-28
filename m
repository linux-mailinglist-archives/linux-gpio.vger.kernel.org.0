Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA29341B5D4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Sep 2021 20:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242105AbhI1SX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 14:23:26 -0400
Received: from mail-vi1eur05on2042.outbound.protection.outlook.com ([40.107.21.42]:29533
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241488AbhI1SX0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Sep 2021 14:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epwc0uW1B/q++yHjT3bGAUwyv0YTKSj2Y2TqCBe/42I=;
 b=WPz3gC6Bf5mivakDitaxMS6rA6HIHwrnCNPRiYMm7yMSmAxdRLIZmY43tQUvrkNfkKAJeXw23J9Y+TXUZk7HVT0gHLJdn6y1kIThiBd1HJwSqnBRtA6CRfK/8j4uzEFc+Ut1tnAOBPiHuS0NvGOIzBC8OLeXPmgKJ6dpwT9LkX8=
Received: from DU2PR04CA0358.eurprd04.prod.outlook.com (2603:10a6:10:2b4::31)
 by AM9PR08MB5921.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 18:21:34 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::5e) by DU2PR04CA0358.outlook.office365.com
 (2603:10a6:10:2b4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 28 Sep 2021 18:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 18:21:34 +0000
Received: ("Tessian outbound a492f2284909:v103"); Tue, 28 Sep 2021 18:21:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c3aea8d70456024
X-CR-MTA-TID: 64aa7808
Received: from 264544cc9a48.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id EDAE5A04-CA2E-467D-AB5C-40538F554338.1;
        Tue, 28 Sep 2021 18:21:21 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 264544cc9a48.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Sep 2021 18:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nm6+0AtplExirUbKb+oj8Hzvy1DFPxATYInQth/aj4opSLmnIu97ZZyf7oY1Z7fqvrEAdCwTzEEcoM2VfV+BDN+z/+Vc74L/LCbbqyaWB7UOpMNUixRjHol6kuag9+3FFBH3040YCeQVBgrqB2JiwYvNU3nJ+7KdyJLVyl8xSgYdRBhT482uV3YhfvSYhpMlLhroWyXRQjEmqUUnMUUNIv963zCOvFZIUk/IpEYeubsfbnr+A31Vxj0fElpMEMNDe3gbIQ6nLXBTZPDly4DZsi9ezdUZd7NHN9N5XYGOkSWY79xepj+ewIUmsd/z/aLRKNRHpjATSbZWnh07EM3igg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=epwc0uW1B/q++yHjT3bGAUwyv0YTKSj2Y2TqCBe/42I=;
 b=X0h/lkIygUCtQjpg+NF1SFqd0oVLOPEoZbgjnRxnpApjsGF+STyaV9l7WXFuTVPnKcB7aIi+anLl06LaGs5EX+s82labt6eVMoDd4EPGjzdKNyeFlWyP6pALZ/HDDBY0monPV0sGPh2T/iWiaYSPH7+nbJlnmT72uSvJivJ+6nzwGNFtsZr77vm8KZzxBiiLZQtD5lD7TNJz7pbTpAlpkQjpeZv5c0UflsQBWCzPdC7g5/7o40upabDChscAkYaO2pdlw2xJJnIV2nFvqBCFIdSOjUVzq4q2NWN34xYyfq/RIH8M1EltUxXeUbxY4p6XdCU/4/5of7gD49axuW6nvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epwc0uW1B/q++yHjT3bGAUwyv0YTKSj2Y2TqCBe/42I=;
 b=WPz3gC6Bf5mivakDitaxMS6rA6HIHwrnCNPRiYMm7yMSmAxdRLIZmY43tQUvrkNfkKAJeXw23J9Y+TXUZk7HVT0gHLJdn6y1kIThiBd1HJwSqnBRtA6CRfK/8j4uzEFc+Ut1tnAOBPiHuS0NvGOIzBC8OLeXPmgKJ6dpwT9LkX8=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DB8PR08MB5273.eurprd08.prod.outlook.com (2603:10a6:10:e8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Tue, 28 Sep
 2021 18:21:20 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3%9]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 18:21:20 +0000
Date:   Tue, 28 Sep 2021 19:21:14 +0100
From:   Joey Gouly <joey.gouly@arm.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <20210928182114.GA19131@e124191.cambridge.arm.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
 <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.50) by LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a8::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend Transport; Tue, 28 Sep 2021 18:21:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d7d766d-8203-4517-b4da-08d982accd66
X-MS-TrafficTypeDiagnostic: DB8PR08MB5273:|AM9PR08MB5921:
X-Microsoft-Antispam-PRVS: <AM9PR08MB5921F82F01559202063F2DBF94A89@AM9PR08MB5921.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RvYeVsFVsxKVWDG2CC7uLq2XFwF6M8hANVbugtLIzxZCRV0fk1Yr19a4jjf9wJ6llwUASfJqD9iY0w+nzhcGIVURdkuASqakdyWhGgS/gGCY0NkpGxOVRW+8r380/dlBZq+jamCu+1UxBCd6f1YYSIiDtdM8Pe0IzWXbTqgvyv2TxY5TGD+E0E2zsx9mYfJ8VI1BVP6IfW1BdUYmkQSgjgXHaaMYnz9+l2UW0/mDMSdpC8iI1tu909urFM+R3eEASLyf+AM7QM4PgGMhOKLLymCcWnfperL+tR8ezrXlR1irhxi6BiimjZBbSe4UrIDckHH8hVTPh22UK5cfPYR9KF8PixmfCsVQ7+D8sGqxTcDhrFGbNNRgZY5ujXu6OKDgadzhxyD+kNEX7WrS2RcssyGfhyfhzVHhxmneJebHZjJaPCbITpu8AJ8VtmI89mTzYdXXjpBr/3cn4vQGCgUMB31KH9zvBYnB5iCuj9O388VUcOGR8YsakTzC9kW+ytbtRI1BRMPx3llztYjpumnJuz/ISnzsAqoWXFh3h6oOYmG7TswdPc7ye0PoQdZfNFGrLB9b0FqQq5O8j+m/0oihW/I9VEYL3Ar8r3IwgnAC0cH8z6+A2wjIpYpo2T+ep/EOOVj/kAVJP8fvWBRM9oaLcppTwki+HrTTZrlv1ke1t65EzmRYxrjoKhwCg+Itja49Cl5u1a0BPZk284PnwdmpiZSzN+wUGKm4GwIPo/x8PDs=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(47660400002)(8676002)(53546011)(66556008)(66476007)(6916009)(33656002)(86362001)(508600001)(956004)(66946007)(54906003)(8936002)(316002)(38350700002)(52116002)(38100700002)(5660300002)(44832011)(6666004)(7696005)(4326008)(1076003)(186003)(2906002)(26005)(55016002)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5273
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f3e2f036-5bc2-4fb2-74f0-08d982acc4d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLR662fQu40cF5HEXUX/GGrkSnSvYOsoyWNAe6ibb+ex8pvJYKDO9lnYvWyvqiSbKTSdmj3Nspbgcujt7MEMFgPAp2rpDe6rQ1vFI+n6I6XnGuxL0s5XgW0aku4M+iOwoRS3/s7Canb96VCeI7b3vhuE3FfqiiGFDwHCtKUqPCGZr4Y0vvyaSOuKfefLachvYJZfe3rObI/K6mEwrxqUlyps+7vlq5tOIS26/EiIFhAEnzjYzkCDWUDLqfGIwQAIAvDFoBpz0f+J0F7xJ8kIKFLQ3VleRy/0XANP5tAf7GTklKPAEJobFDRRY/0dUh++uec/cgdIEl6TiY4oahpA1Zf6vKqanBZputyHym3eEdskcgJXlgg5v9kb9TAddqay78ypitzUknp+F0nxSad1tMbD9w9OLKCSpyAA/NYEWSr/JuE5dpIIhAF2vpcdfuU5grvvvvDaPwCfNfR1LAxBAiWLYY7Mb2alHg8KvE3AkuIYJPl+4ay1yKqe2D/42+Oh5IJGKRPJfzLmrZghADY/N75z8lN5bpTzig4o1gzuFNUxlnpZozBXqlYFmVktw671CbGdJmIM9iBwfbtYK/YVPxWfANxnRXAUB0dV6KvmZpyBOd64FIZOwfWeiebfHzzPf+YApSjtq41aJlj5mLboAsIIvppFydWVqTysv9kDGxANrjf4VHMV3/iYe5aCChFIpbHY+nthtm5L40FwInAw+KUMQP/xiZHc8cxJ8xQer9I=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(82310400003)(107886003)(186003)(70206006)(54906003)(1076003)(336012)(70586007)(508600001)(8676002)(316002)(26005)(36860700001)(2906002)(6862004)(5660300002)(33656002)(7696005)(47076005)(81166007)(6666004)(8936002)(53546011)(44832011)(956004)(4326008)(86362001)(356005)(55016002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 18:21:34.1611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7d766d-8203-4517-b4da-08d982accd66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5921
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Sun, Sep 26, 2021 at 02:48:18PM +0200, Linus Walleij wrote:
> On Sun, Sep 26, 2021 at 7:09 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Sep 25, 2021 at 4:45 PM Joey Gouly <joey.gouly@arm.com> wrote:
> > > On Wed, Sep 22, 2021 at 10:20:39AM +0300, Andy Shevchenko wrote:
> 
> > > > > +   if (of_find_property(node, "interrupt-controller", NULL)) {
> > > >
> > > > Are you sure you need this check and OF core doesn't provide a generic way for this?
> > > >
> > > I don't think so, and pinctrl-equilibrium.c does something similar in
> > > `gpiochip_setup`.
> >
> > Linus? Do we really need this?
> 
> I don't really see this as necessary, we don't need to check everything.
> Not that it hurts either, so I would say maintainer preference?
> 
I'm unsure if that means you (Linus), or Hector Martin as I put this
file under the "ARM/APPLE MACHINE SUPPORT" section in MAINTAINERS.

> > > > > +   if (of_parse_phandle_with_fixed_args(pdev->dev.of_node, "gpio-ranges",
> > > > > +                   3, 0, &pinspec)) {
> > > > > +           dev_err(&pdev->dev, "gpio-ranges property not found\n");
> > > > > +           return -EINVAL;
> > > > > +   }
> > > > > +
> > > > > +   pctl->npins = pinspec.args[2];
> > > > > +   pin_base = pinspec.args[1];
> > > >
> > > >
> > > > Isn't this being provided by pin control?
> > >
> > > Not that I am aware of. It is a similar pattern to other pinctrl drivers
> > > like pinctrl-rza1.c and pinctrl-npcm7xx.c. The driver needs to get the
> > > number of pins/base from the DT to setup the internal data structures.
> >
> > So, maybe you need to refactor the pin control core first and provide
> > some stubs that will serve your purposes, but to me it sounds weird to
> > have all these checks.
> >
> > Linus, what is your opinion / input here?
> 
> I don't remember right now how the review was going on the
> mentioned drivers.
> 
> I did imagine that of_gpiochip_add_pin_range() would be the
> sole parser of this, and drivers would then use the infrastructure
> for any necessary cross-reference between the subsystems,
> not second-code it.
> 
> What is it that you really need to do here?
> 
> I think npins should be known from the compatible (we know that
> this version of the SoC has so and so many pins) and the base
> should always be 0? It's not like we have several pin controllers
> of this type in the SoC is it?
All we need is the number of GPIOs from the DT now.
I got a bit confused with the 'base' here, locally I have removed the
'pin_base' variable and usage. I was confusing it with the `gpio_chip.base` field,
however that seems to be about the internal GPIO numbering.

Thanks,
Joey
