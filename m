Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA69418275
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Sep 2021 15:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239261AbhIYNqd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Sep 2021 09:46:33 -0400
Received: from mail-eopbgr50046.outbound.protection.outlook.com ([40.107.5.46]:1637
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236876AbhIYNqd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Sep 2021 09:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQEvTatS3nQe8F1ka5hC7TOuQyBf0XgtUsbOzR1NDuk=;
 b=K0w7SfM8vqlJLfBtigObLRBmPBMqolQJ9xjBmX4pGa1pZYqxNxc582OffYxVmuP4q93rkMdTRuagQqEaEy95kQYnez4N5XhVve44Yes0Hg7nAC32pgCrGTXMRSy/TQH2gvx/UMwjxum5+UvIS5WIxpxoK9q26TiXnKJQlUn9bXQ=
Received: from AM7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:20b:100::13)
 by DB6PR08MB2790.eurprd08.prod.outlook.com (2603:10a6:6:1d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Sat, 25 Sep
 2021 13:44:53 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::2f) by AM7PR02CA0003.outlook.office365.com
 (2603:10a6:20b:100::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Sat, 25 Sep 2021 13:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Sat, 25 Sep 2021 13:44:53 +0000
Received: ("Tessian outbound 3c48586a377f:v103"); Sat, 25 Sep 2021 13:44:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5403a165d3433bd
X-CR-MTA-TID: 64aa7808
Received: from 77261313c5dc.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0F438EE3-7A01-4AAB-8AA7-47F677AD85DB.1;
        Sat, 25 Sep 2021 13:44:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77261313c5dc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 25 Sep 2021 13:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhZ4M2n7dA4E/Y2crOwewyrBFX498DlkNKFdgRsr7bVJV84JB/0qQuy0ZzDiS26ZIdoTOuliL30TDGV+H3M74EueasC/3hw4bCWgJ8PyVQ0IcTZzqtFZN4aN8LMiBVa5aNoSTIAxlvmzYRFf8kcOLhZkCp5gErOOZfolu4JaJJ+pkwJftW4dpXciIxtWBroH1z9dv24qxA7XxnnurC1kRBN1mSisHYZ9Q5ZpD2IS2n5DwSK9rivzjaVj72jJTCK+X3jpw4L22eBtRNIfMFI1JWoJB6Dwl7a2JqHvpW3b2/rWFRNIlHN/D5SLJ/EIiDQfIhw2O5gndEoGK/xOIn0z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MQEvTatS3nQe8F1ka5hC7TOuQyBf0XgtUsbOzR1NDuk=;
 b=ML/nFGq3sM0hYPximv3QT7HJjVISATghnEfaRhlqoi/aRomGOzXTrhejY2h8pnjT/2mYSpLKto7oQQN9YH+r7b6w7X0D4+0pCGbf4vCgQK7s3JKLiQ+ziprrsQzxSesAvzEb5+ufOprnEayc+V11yho1oiMoo5aOhRCICZQHPEoq8uN9otXAneOkCJAO+RhEDUl3fT0eYq/E5hfg7NMAQk1wGIZDFTWLIyVpastv6XXUil/k9mqrldiWcRNqy+URsodwLA61zw3RSWvWtzJvSlvyC0k+jIJefDyMKaMh4gkLYgk2xZ1qutHgTLYQ4rWiMJml9c0qjbR2MCNVEP+O6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQEvTatS3nQe8F1ka5hC7TOuQyBf0XgtUsbOzR1NDuk=;
 b=K0w7SfM8vqlJLfBtigObLRBmPBMqolQJ9xjBmX4pGa1pZYqxNxc582OffYxVmuP4q93rkMdTRuagQqEaEy95kQYnez4N5XhVve44Yes0Hg7nAC32pgCrGTXMRSy/TQH2gvx/UMwjxum5+UvIS5WIxpxoK9q26TiXnKJQlUn9bXQ=
Authentication-Results-Original: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DBAPR08MB5672.eurprd08.prod.outlook.com (2603:10a6:10:1ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Sat, 25 Sep
 2021 13:44:36 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3%9]) with mapi id 15.20.4544.020; Sat, 25 Sep 2021
 13:44:36 +0000
Date:   Sat, 25 Sep 2021 14:44:25 +0100
From:   Joey Gouly <joey.gouly@arm.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <20210925134425.GA4681@e124191.cambridge.arm.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUrZR/Tl7obfehXP@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN4PR0201CA0033.namprd02.prod.outlook.com
 (2603:10b6:803:2e::19) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.55) by SN4PR0201CA0033.namprd02.prod.outlook.com (2603:10b6:803:2e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Sat, 25 Sep 2021 13:44:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f623a74-63d1-467f-5606-08d9802aa727
X-MS-TrafficTypeDiagnostic: DBAPR08MB5672:|DB6PR08MB2790:
X-Microsoft-Antispam-PRVS: <DB6PR08MB2790D54201D1702B536781E994A59@DB6PR08MB2790.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: C7HOhLQcsjamW6SLwjjHkEiMC6P3vL8amEaAI0J7SdoevSyU4nwjTud3/9Cb9COBiauNYAmgPU3ViCA64vhA68i9LLRg2f3rfms0YLObT4EFihyTkOXnlvzYF95Hy12ZcgWERZ6ZUHA71wVg4hldZVhdgqtLJVf0Y6/aOlEUGNXs1qVPCQ9Fv1ZJgS2DWw7kS8k/9RPLf+NxOTmW1ckAcg+sGDUEGtm1AsxzcpNOnTxZfz37IZTCblv4cmXKkNax0R17P/YH2o1kaLR13HmP1/foBljd0qKvB8pyw5bL+LGD0PhkTHkpglU86wynNLWdURlFQgy2OTrPissLnUQC/SArsCjXfaC/X3IRoa9Z+5GbZ2TYgt9Ay9WGiNWUm9mdKsoXdPyf8G3nZLGsZPSoLfne1bsf1LKCIayACdQf9AimPIa1MZYsyU/XcBpY8S213L/yre1WjPxLdnyVfTqK2SH8RNjDoi4w5TEBIlF19eMKCX0lN2VxFlj453advB2X4kiiakloLolIlkJ7GQTuEzsmyFQSEqmuZ5nhrc08KWqa8pnDiRXkleRooR+7pmsQgSWKBe8uXEB4jQizVcZl6uwP7RGZ3jFAEGOURAlLpbcW5U2yqbJH9QcNuMjXUXypMdGeKx+RG3CLEnpqEiM4Nd/OBVu1cvla0USpD9sMNficz7Bauu6eXLRIjPBgeIV9SRuQgyYn+NkkeS1KVRNgPevDnvRPgzO9JLgiKnIyHBI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(47660400002)(956004)(44832011)(2906002)(66946007)(186003)(52116002)(7696005)(33656002)(66476007)(1076003)(8936002)(54906003)(6916009)(66556008)(6666004)(316002)(4326008)(86362001)(26005)(38100700002)(508600001)(5660300002)(8676002)(38350700002)(55016002)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5672
Original-Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d226f685-4ae2-440e-261d-08d9802a9cd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2F5VgSjiNNxg0ll7B6k/Two/3s1+Y7n/oN9XjRRka07uNjHkNYrvD44j46Liihl+U30+vLlKE3R12ISIHZP+6W6VTu3GwUSrS6utvcHLatlZtR5xs5HOwsuz4LvCJfY9QSzdTqZzexkLU1C07/g5IFeVGHCbf2XSwM7V/83KCLevd8ngMGeQ2iMplpUuY8i8h/r2+OXKAOX9db7qgR4r0rP3SW/s0djkaUgZtyjGRofOYgeGbM3PyKBInoHfMQhte2Te34hRfDIxfJONIO+jOeO0W5gYU1+yCIleTRB2TmgrrpvYRBDLeaXLfSyJvgoXm5LkJJCpK4HEeyaIALDQW4qPFi46o7jAH/rBKNWLPZqPzsXNT9Q/TSL3v6aSRkyLe5fs8zvBZIZV8DIqEszqGY22K/O5CC+YvpG+7bfXc+aqBu5n33Pi7M5aRQLe2o34lOZ66aBloiSDOBz/j+aR67luYMPWTyGG8zJT6yiCQtQf4zJkkyb38iP4a5kJQJe/JjgMw3K0YbrWQV/+qpx3S4AGuW12GR6oWoOEinme95HEsGUi6QVRfW3z6o8S8Ynu9Y+lN0EDA9ee3wyUHObK53EinP72d5hVcy8A8BClslYzxCGap3rKDLdUaf8NypTPQxuZy766AguzKVg1K4g95SD09zAbgOYWiXEoUW7z9/jzYZWwi4sv0nOAGxZPAaRJhmsoYwedh7itWcJVBtc79bb757RbQGHuxp4D2dkG50=
X-Forefront-Antispam-Report: CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(44832011)(70586007)(6862004)(26005)(70206006)(336012)(6666004)(8936002)(4326008)(36860700001)(356005)(316002)(47076005)(5660300002)(81166007)(186003)(82310400003)(2906002)(7696005)(1076003)(86362001)(8676002)(508600001)(54906003)(956004)(33656002)(55016002)(107886003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2021 13:44:53.0380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f623a74-63d1-467f-5606-08d9802aa727
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2790
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thanks for the review!

On Wed, Sep 22, 2021 at 10:20:39AM +0300, Andy Shevchenko wrote:

[...]

> > +F:	drivers/pinctrl/pinctrl-apple-gpio.c
> 
> Are you sure it's a good naming? Have you guaranteed that next Apple silicons
> will use the same / compatible IP?
We don't know what will be in future Apple SoCs, however this same GPIO
HW has been in iPhones dating back to at least the iPhone 7 (2016). If
there are minor changes we can add a new compatible, and if there is new
HW in the future we can introduce a new file for it.

[...]

> > +	prev = readl(ppin);
> > +	cfg = (prev & ~clr) | set;
> > +
> > +	if(!(prev & REG_GPIOx_CFG_DONE))
> > +		writel(cfg & ~REG_GPIOx_CFG_DONE, ppin);
> > +	writel(cfg, ppin);
> 
> Is it IP requirement to have sequential writes? Can it be done in one?
We unfortunately don't have the documentation for this HW, so this behaviour is
based on observing what macOS does.

[...]

> > +	if(!of_find_property(node, "gpio-controller", NULL)) {
> > +		dev_err(pctl->dev, "Apple GPIO must have 'gpio-controller' property.\n");
> > +		return -ENODEV;
> > +	}
> 
> How is it possible?
This is possible if booted with an invalid DTB. "gpio-controller" is a
required property according to Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml.

[...]

> 
> ...
> 
> > +	if (of_find_property(node, "interrupt-controller", NULL)) {
> 
> Are you sure you need this check and OF core doesn't provide a generic way for this?
> 
I don't think so, and pinctrl-equilibrium.c does something similar in
`gpiochip_setup`.

[...] 

> > +	if (of_parse_phandle_with_fixed_args(pdev->dev.of_node, "gpio-ranges",
> > +			3, 0, &pinspec)) {
> > +		dev_err(&pdev->dev, "gpio-ranges property not found\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	pctl->npins = pinspec.args[2];
> > +	pin_base = pinspec.args[1];
> 
> 
> Isn't this being provided by pin control?
Not that I am aware of. It is a similar pattern to other pinctrl drivers
like pinctrl-rza1.c and pinctrl-npcm7xx.c. The driver needs to get the
number of pins/base from the DT to setup the internal data structures.

Thanks,
Joey
