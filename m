Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE7E3A057
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 17:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfFHPAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Jun 2019 11:00:39 -0400
Received: from mail-eopbgr80075.outbound.protection.outlook.com ([40.107.8.75]:23106
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727053AbfFHPAj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 8 Jun 2019 11:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com;
 s=selector1-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMpylm2w4FISiyGnJPCOxLBjOWL+kV0aaO7YAqbspUo=;
 b=iJzzeBAfxPxTU9k0pkcIm1HisyIX95SZ4JPpOJTj6oQni0s1UaT1fu0HO15yL0IVyRvn9jeylJQz3mOfJMD7rOIw3gk6t8qREPReNGaWvBoNxe/xmAHzzPooMIEF5YE46g2ik5GKXH10nWhkDtTy/nTDImyGFcw5g7HU7v9ccfI=
Received: from DB6PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:6:1::30) by
 VI1PR0602MB3598.eurprd06.prod.outlook.com (2603:10a6:803:2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.15; Sat, 8 Jun
 2019 15:00:35 +0000
Received: from HE1EUR02FT059.eop-EUR02.prod.protection.outlook.com
 (2a01:111:f400:7e05::209) by DB6PR06CA0017.outlook.office365.com
 (2603:10a6:6:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.14 via Frontend
 Transport; Sat, 8 Jun 2019 15:00:34 +0000
Authentication-Results: spf=pass (sender IP is 188.184.36.50)
 smtp.mailfrom=cern.ch; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.50; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.50) by
 HE1EUR02FT059.mail.protection.outlook.com (10.152.11.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Sat, 8 Jun 2019 15:00:34 +0000
Received: from cernfe01.cern.ch (188.184.36.42) by cernmxgwlb4.cern.ch
 (188.184.36.50) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 8 Jun
 2019 17:00:34 +0200
Received: from harkonnen.localnet (178.199.148.24) by smtp.cern.ch
 (188.184.36.52) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 8 Jun
 2019 17:00:33 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Date:   Sat, 8 Jun 2019 17:00:32 +0200
Message-ID: <1726027.xYMg8yrU2x@harkonnen>
Organization: CERN
In-Reply-To: <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
References: <20190603230604.30938-1-linus.walleij@linaro.org> <22282873.PltXLBtAh5@pcbe13614> <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [178.199.148.24]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:188.184.36.50;IPV:NLI;CTRY:CH;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(346002)(396003)(376002)(2980300002)(199004)(189003)(8936002)(33716001)(53546011)(5660300002)(966005)(46406003)(478600001)(8676002)(36916002)(6306002)(9686003)(86362001)(54906003)(97756001)(356004)(246002)(316002)(76176011)(50466002)(70586007)(70206006)(9576002)(4744005)(74482002)(6116002)(3846002)(230700001)(305945005)(4326008)(16526019)(23726003)(7736002)(7636002)(106002)(956004)(126002)(476003)(6246003)(426003)(561944003)(44832011)(486006)(336012)(47776003)(66066001)(229853002)(26005)(186003)(6916009)(2906002)(446003)(11346002)(39026011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0602MB3598;H:cernmxgwlb4.cern.ch;FPR:;SPF:Pass;LANG:en;PTR:cernmx11.cern.ch;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b116f23-8ccc-412a-4915-08d6ec220f07
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);SRVR:VI1PR0602MB3598;
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3598:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <VI1PR0602MB3598F0F9C083B7278C967A91EF110@VI1PR0602MB3598.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0062BDD52C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pIbKYCFsotZqyxBoe60vp2WaP/mLrKq86PhB/+mH24wQtJmtL0HWul9EazqlAd0WfKbwTz174RO2u3lqlt5Er7Rau9k4F1ppbpvJK2MfuKC8FU3MHu4xGkpILh4t8hOfK1zmV38ubRrWfOZcWeM2TyD7UCsTk7V+ypTtojKmLiJbp/DlQC38LejXJ4Gvt8sEV9hl0DXlt4QlDSv3ChVbP88JeY1QkadFsX9IFP1GEs8nonmZzfAkZMiDZ/C+JT4BZKNCpUmqJhfxiK5cr1foxEavkQuo/ApckeEVfnk4xaORFY9DZU4iWUTj60RDjj3e6dA8Nw1yZatHhiUX4026qD9nuCHOk6M7H8KcpexEVPLbGOWy5F5WoZAG0vfEuAQZA1woCCW1UJActnkHGuwg3k4D8Zld0ZI0ViXuVlKpYNo=
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2019 15:00:34.1700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b116f23-8ccc-412a-4915-08d6ec220f07
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[188.184.36.50];Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3598
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Saturday, June 8, 2019 3:46:07 PM CEST Linus Walleij wrote:
> On Tue, Jun 4, 2019 at 8:42 AM Federico Vaga <federico.vaga@cern.ch> wrote:
> > I take this occasion to renovate my proposal
> > https://lkml.org/lkml/2018/10/29/534
> 
> Hm, it looks from your proposal like the FMC device core
> is using its own hacks for i2c mastering, FPGA management
> and irqchips. Does it also have its own GPIO implementation
> not using struct gpio_chip from <linux/gpio/driver.h>?

The FMC subsystem has its own API for all those things.

> In that case my first step should rather be to remove the
> reference to <linux/gpio.h> because then FMC is not really
> using the GPIO subsystem.

No it is not. Probably you can safely remove it.

> As for the proposal so remove it, I'd like to hear what
> Alessandro says. If there is consensus on deleting this
> I can queue something up and send it to Torvalds, but
> I need consent from everyone who cares.
>
> Yours,
> Linus Walleij


-- 
Federico Vaga [CERN BE-CO-HT]


