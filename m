Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C2F45F6E3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 23:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245075AbhKZWgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 17:36:07 -0500
Received: from mail-eopbgr50079.outbound.protection.outlook.com ([40.107.5.79]:27220
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245268AbhKZWeH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Nov 2021 17:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0BQnyZWo8m3RtwxyFLzcoWArzJ1tsLa+D9A++rWoTQ=;
 b=HQ7JcoctFn/NydupY1B0A6cukon2B2mIbol+seCJiG6QzlcKcDCbSkFWB95FY6vr+wJ+QDxWg88Rs3g1UtEZH1zvpHAFu/twhexTK3r/RcFC1iPrzofXBJF1xN0sYDHqwMNxn04tcPxPCGokOHvGJ5oAc/An+MrAYvxIGhYWEpw=
Received: from DU2PR04CA0345.eurprd04.prod.outlook.com (2603:10a6:10:2b4::16)
 by AM0PR08MB5012.eurprd08.prod.outlook.com (2603:10a6:208:15b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 22:30:51 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::17) by DU2PR04CA0345.outlook.office365.com
 (2603:10a6:10:2b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Fri, 26 Nov 2021 22:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 22:30:51 +0000
Received: ("Tessian outbound c61f076cbd30:v110"); Fri, 26 Nov 2021 22:30:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98c0b477858e36c2
X-CR-MTA-TID: 64aa7808
Received: from d9171573a1de.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id C1F029B0-60D5-480D-81A4-06169676B550.1;
        Fri, 26 Nov 2021 22:30:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9171573a1de.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Nov 2021 22:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fawe/WE9zcgnVWwrR2+FvkM/nlmo+FwR98UU1y+KF2mxpWikzCVcjMYsD1zNUYAaXIZYWjPoJ8iQCU4l+KB+RRvRH226MnLV0TXnesWs1rngZr8eNJMdwqEZHt+QW6k4vp7IxWTSuh4x3pKGHzCDv5g5K9BGQiZbVmdMZ4mfPaCdH6t91Ac6X7MMPM5cCgIY31K1aq9Zf3b2ZrJnfmWmtoHpiaLief/JQxdqLicWZW2Y+FWakR7zuUgn+9Ot8qBJskPro9OWx0xZoXI8jSXRe7x0gHiosIQOAWZi8grOZrswY/KOQG72Vrsrdni6lG9x+Bjd+G1kVfre6mmkI/OV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0BQnyZWo8m3RtwxyFLzcoWArzJ1tsLa+D9A++rWoTQ=;
 b=CZ3R2lxbASB9EXposNkfLxItQIUIA2w2mW1Cchbm5vWpkqqtyxFfxnhMbJvxB14pwwlyaGM2KKpYI2vV+/IUcTk2TVhZZYgmrGnKsSji0OzGLJlatBIeCwAHVAyNwc1BM3rAzNxT8jq0yWDx7C8tgK4VvLrQp894uc3AJXWcEvJzVRy19FepbVv/tgdcHKuFx3AoSq9eKmsIhhmz6xF2PKkGCJ3U4FhLaRfGy5fvyS6uJYQnHC5tCNQiS48fFTIriUSBfNlB0cMZiCmSp4dvyhSoYCXD0+aJRQiiLV+WXx49zouF+aszik4wfqFzX+HvWR/nc728uoG8fE+1tJTBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0BQnyZWo8m3RtwxyFLzcoWArzJ1tsLa+D9A++rWoTQ=;
 b=HQ7JcoctFn/NydupY1B0A6cukon2B2mIbol+seCJiG6QzlcKcDCbSkFWB95FY6vr+wJ+QDxWg88Rs3g1UtEZH1zvpHAFu/twhexTK3r/RcFC1iPrzofXBJF1xN0sYDHqwMNxn04tcPxPCGokOHvGJ5oAc/An+MrAYvxIGhYWEpw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DBBPR08MB4680.eurprd08.prod.outlook.com (2603:10a6:10:f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 22:30:35 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::71de:ed79:2f31:c001]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::71de:ed79:2f31:c001%3]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 22:30:33 +0000
Date:   Fri, 26 Nov 2021 22:30:29 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, nd@arm.com
Subject: Re: [PATCH v2 00/11] pinctrl: apple: misc fixes from post-commit
 review
Message-ID: <20211126223029.GA34315@e124191.cambridge.arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
 <CACRpkdbbj_PapRXYv61Dt8369_qqQx97t3o=FyFUY7s1ThytMA@mail.gmail.com>
 <CACRpkdZO=8efvoVnSE_Oc26grv-UWNzN97f-SoUjm-jGG7AFzA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZO=8efvoVnSE_Oc26grv-UWNzN97f-SoUjm-jGG7AFzA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LO2P265CA0384.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::36) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.52) by LO2P265CA0384.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 22:30:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16e398c8-43a4-41c2-99b5-08d9b12c6712
X-MS-TrafficTypeDiagnostic: DBBPR08MB4680:|AM0PR08MB5012:
X-Microsoft-Antispam-PRVS: <AM0PR08MB50125BFBCCE712A87E67F9CA94639@AM0PR08MB5012.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: r5bEe6yg6LLTxOEmLdJo2AFu3NyZHKuA0Zld4NvBe0Dxq+bBzILE+6ox3CmtGHhOTgtmEmOqP3Ezu9iNJUaxKmHFmv8aJ5s63zWGjDfwUc6tGwahuo+1x/GOg0SZJss2a8+F8e5AsDOnO8YnZI19/GsCeD60f5hWsTbl2T5VoTikSS9MgMw1IVHFHapA+SJ/Uk01IilH7pRFKqvfyxsgOqduFKNt88GPJJSKrs7zMOfj91e8zAc320+atUI6zt1K+/aFq6ut72frIXyBIujCyzso48EwaDJrCAjw1enyUWrrsqjkNvtTXy5G+jGeUAG8lsk7GgKpvszvqOwtlXmIvyGthWmT1gurDK1z91gFthJgUNuHrYlWNHEberdupSQsPP+e7oKSlhprAoK/LXwgH5qJO6jn6eNEgNqv4HOkesDypXUR6JvsJBQCHhlP3kU+c2JN2i+gtV8d90J3/HfBiLQMRxqQh7QfFq0T2UNQfjjmX/mn8TuyFCdoGl1RajrUmv16+pyfXgctvtT45Ks4BaUD78+sG3I4CQceLRyk4dL39n1tG+WpGpDNjXhSjcd+5B3uLZUBuGqilW+dWumgUqQvJNeoJFu0g1gjCEDehh3+u0jkSRqMQdFVq7SQXv02owEOSbxOdnYDKjimSQOz2r1uOoJ3D7H6dcXMesloTV3UawvgdqNPCRUT3FW8I4B+tfjWAzPoCxot1sHVdm7su8ydyBTszTf99M+y/wjPUALCZcSxIXL5hKa/dHcvzHOlNnzsXWPoSxvdfFZnkjFMf1uBHNlj1xlNK1nqH+G6FqAWSDNtR0ZO2UnxXWQUm0vEuIym/2Ce79YlTyOgdu7pMnnRRb/Kiw1DBxKMBrhwObE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(47660400002)(1076003)(6916009)(53546011)(316002)(6666004)(8936002)(508600001)(186003)(54906003)(7696005)(52116002)(55016003)(966005)(5660300002)(33656002)(26005)(86362001)(2906002)(956004)(66476007)(66556008)(66946007)(44832011)(8676002)(83380400001)(38350700002)(4326008)(38100700002)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4680
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e062d24c-d326-4dc9-2b15-08d9b12c5bab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfC8oNZwV1beWUNXHtNcUescbKaZ7dWF4DDaQoZBNYbwzw2BTfW1kbMXKPWJe631tmoD16mjnUAMZRUe9YfXcmi1F1sZWyxMjjkfR+RIJ+u/SjzUOKVS+qsA54aE6ydIUoPUvY2oscLnzqVtt+wHwWS3xBwaBLBpnbFfo9rjKMPM/koe+XiZpr+eka+xfdWibPxC0HbP98PELRMXnCgkwYfZqtExnhl04P01OOtGymbkncFFfX/PGWxi9Sc2zPir0Wvc3nCIcmJ87hEJ71eXy4TyZ5gTFiAZDDyk0nQSTBvGsPZWvWvBBkcV9sOT244m/GBaD/6XIEWLb7G9/0aQvVqnaOa1lzGRbMZkYvo3HLMXFGna4skGLMvrGi+8eGP3m6GPx/9yjfSMuB+oODrG0VmVyAG3A4IEiyefF3LKrdH03nIMyb9+UldGXbxyQnKRe5gzkiB+B6Bk1QsdOlq4302+NdDJkYOpTrs7pCYc5dehH0AsL0d5Mcr7+XLDIjrqec4CPzlnsMpGTlDGCqYojgtETRNev73lE8D8J8VSNMnpx5AzVfYaI1CkGc+8MrJGxEbsMCGJPAHpsT0h6xRLYaZhuNFTRReTiCod8aCrO4pxs9uGiJcm5LYAcpeG6Gt7QHIVYKI9KrC3wTQXr3W+dFSVuuxKfmD/e/lmZXiAMeDtUniYb4GST+DU0QEy0M66hMk4jeaPdBhM/JqsPTn2C8IBqFLXaDZ8T9xPorvo3QIeHW9QUHQI9foeyK/Me883tG1+z/+vFUqrOiORWEj7dM8S+/zz6sENStaJjNaKTNCpSvBpwzp5E1OtOS2vIJl1fjXTNzdDWrT5IqGLSwGYaDItm1RuXHlRyztZC6qsPhU=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(26005)(7696005)(8676002)(81166007)(36860700001)(1076003)(508600001)(336012)(356005)(55016003)(82310400004)(5660300002)(8936002)(53546011)(83380400001)(6666004)(186003)(47076005)(956004)(966005)(44832011)(33656002)(54906003)(6862004)(316002)(86362001)(4326008)(2906002)(70586007)(70206006)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 22:30:51.5505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e398c8-43a4-41c2-99b5-08d9b12c6712
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5012
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Nov 26, 2021 at 01:53:13AM +0100, Linus Walleij wrote:
> On Mon, Nov 22, 2021 at 1:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > I tried to apply this on the pinctrl tree based on v5.16-rc1, have you tested
> > this?
> >
> > It didn't work for me :(
> 
> Still doesn't work. Please try on top of this branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
> 
> This happens:
> $ git am --signoff
> ./v2_20211121_joey_gouly_pinctrl_apple_misc_fixes_from_post_commit_review.mbx
> Applying: pinctrl: apple: fix some formatting issues
> error: patch failed: drivers/pinctrl/pinctrl-apple-gpio.c:249
> error: drivers/pinctrl/pinctrl-apple-gpio.c: patch does not apply
> Patch failed at 0001 pinctrl: apple: fix some formatting issues
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> 
> Trying manually:
> $ patch -p1 < ./v2_20211121_joey_gouly_pinctrl_apple_misc_fixes_from_post_commit_review.mbx
> patching file drivers/pinctrl/pinctrl-apple-gpio.c
> Hunk #9 succeeded at 243 with fuzz 1.
> Hunk #10 FAILED at 269.
> Hunk #12 FAILED at 299.
> 2 out of 13 hunks FAILED -- saving rejects to file
> drivers/pinctrl/pinctrl-apple-gpio.c.rej
> 
> What am I doing wrong?

Sorry, I see the problem now. I thought you were appling the patches on top of:
  https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=for-next

Which has the commit by Sven (9b3b94e9eb14a "pinctrl: apple: Always return valid type in apple_gpio_irq_type"). 

I can rebase onto devel, but you will get a (trivial) conflict when merging devel and for-next.
If that's fine, let me know and I will send a v3 based on devel.

Thanks,
Joey

> 
> Yours,
> Linus Walleij
