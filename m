Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4789A286F92
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 09:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgJHHgQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 03:36:16 -0400
Received: from mail-eopbgr130058.outbound.protection.outlook.com ([40.107.13.58]:3046
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726491AbgJHHgQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Oct 2020 03:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPt3iPVjsr59XsirwjQgzr5gS9X21KkdvhBSNZpoapA=;
 b=oMdaXFIR2S60EtyRnOwH+9w30XoK5thgwSW/jFSp27KMDUb99yVME4ZeKt+anhhGHlEaK3LHDCpu+ohzXmcNCJW3U+2zo/6HQDqmltCaeieXgTkVz+YBsVKVJYKJ7033PmdUOSzvGE7yPYN4dStX/22/HYF4fYnVa7O5HMDlZWk=
Received: from DB6P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::33) by
 DB7PR04MB4073.eurprd04.prod.outlook.com (2603:10a6:5:17::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.37; Thu, 8 Oct 2020 07:36:08 +0000
Received: from DB5EUR01FT025.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::e3) by DB6P195CA0023.outlook.office365.com
 (2603:10a6:4:cb::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Thu, 8 Oct 2020 07:36:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT025.mail.protection.outlook.com (10.152.4.240) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 07:36:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.107) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 08 Oct 2020 07:36:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrL0XSPc2QONOphx3WbkC/1h1USjwfXRbFp+PoPFexTcCkoiVupD0WiZbZj0L/c63FnygNJAmAFu8HIxbyTtkcTjZcZZYtpakSccHb7kuRCCUTksxGM/Y7ztP6F9RNf1hKmkyMiQqRyOaTEgGT8RYZam2TNSPivdVhLy1VOfiq0pQL30+LeOzldRd8LKyZYg3bo3T1hnilgFmcxlJ/GZGEv6mXpWPFqOBb1LCR9DCdoRHJoHxlCg+ihEdNQ7X3lNxPYqafrVshIHsTtdTNBTV5w72yN56L1UpTPbFbiWptj8uVqCq+6TKQM2qLgEnbZ7ToIgssVJLqBcTlLTO9KZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH61XWknZ7YVZhsdvIJJezEIN78ucuJUXSZE0zr209E=;
 b=fNObv4mvLG/Wt7ciwdccx3H6yUuIzP8U0TvyV3dTBkbo8xJDq5DBznU8PY5cdlUKk6ntDd5myuoE915xmmyEh8DM/X4V00Nd5vS8lw+BH//rtus6tLplyqclPZ7THatY2MUkUP6qMYkVlgQi0daqh3GeMvhVRNAlB1zMUKNqGxvyZonTpc1kYubU/cLdti2m1tjJBxC6nBi2iHYve60ZIarzowKG0Wnu5vefUlzxOG5jcZ1KJeNpxff67hTnwV9WM0ZTPoTlVeRIIGdbGmKQFLfuTn6zAgMLse7dDjN/LWOd27umb8sIjFVvP6/MriUQ3Ucfm24K9vIbYpmjdvxzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB5675.eurprd04.prod.outlook.com (2603:10a6:10:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.42; Thu, 8 Oct
 2020 07:36:04 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3%6]) with mapi id 15.20.3455.022; Thu, 8 Oct 2020
 07:36:04 +0000
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the
 NXP PCAL9554B/C
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
 <CACRpkdbsYcmv9m2EiQNgPDZ0MdjPnWTxXvnqATVPvWpB=8Oqkw@mail.gmail.com>
 <20201006193235.GA2689027@bogus>
 <CACRpkdZmYKn1JU8PeA+GAJDuVEtWQrH-3KijH4+df88Bt=iZtA@mail.gmail.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.e0bfef86-33da-4b33-b856-e32dbc3f2992@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.6462df9b-cbe0-4101-9ae9-b09faa895eb1@emailsignatures365.codetwo.com>
From:   Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <bbc77660-40b3-72b2-4829-4f1d53cbfd2b@topic.nl>
Date:   Thu, 8 Oct 2020 09:36:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <CACRpkdZmYKn1JU8PeA+GAJDuVEtWQrH-3KijH4+df88Bt=iZtA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM4PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:205:1::40) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.80.121] (81.173.50.109) by AM4PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:205:1::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend Transport; Thu, 8 Oct 2020 07:36:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e6d948f-abef-49b1-0e5d-08d86b5cd228
X-MS-TrafficTypeDiagnostic: DB8PR04MB5675:|DB7PR04MB4073:
X-Microsoft-Antispam-PRVS: <DB7PR04MB4073D1FC371B3F6E27994694960B0@DB7PR04MB4073.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pbGMzbiTOdp+PjuWib+XcAt+Pld4GClp/GgMUeRpeAVhBUCwM5QilnRWxa8YYnem4nuH7XEemaTdb+RYvjjZeUv9LrFhXj9CClWaVfli4tB7uBeS1E1UMQOy63W7czlrzyw6ZbWScV/iQctZ6wiqCB7AtNc4rtHLs7iyj0ILcesRTFlUMNk8aU4RJaf3/cDbHAfQJQRm/kuKL/dsclYXjWKhr+LDgNnzMTnub5IwONQYZGJ55am2IyqRjjbOURh0STCg6B2nEtnNImQy4ydts2QxqA9JPVisvgVlA1QZvt5d0f2yiUywvo11dsprVF6dG5+rlGAJHE7v1GXAa2vWbkNQadrYyPFsFPYGOEu5um1WIIILxd6QYtlGCCJdLa9d
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(376002)(136003)(396003)(346002)(366004)(956004)(66946007)(31696002)(2616005)(42882007)(44832011)(66476007)(66556008)(16576012)(316002)(53546011)(31686004)(36916002)(52116002)(478600001)(36756003)(110136005)(54906003)(83170400001)(8936002)(2906002)(4326008)(5660300002)(26005)(6486002)(186003)(16526019)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: oLBZ+bHldRW5kN/o9bZIzolIpfeVnrTJXwUZ0EsXHgRkuI/8MRhGs2zn/hNU1zkf6UARQlaQ8cwXVKJq5fuzrY55yaF/ndTkKdMdfI+ksJ1xT5J1L4rvqyltYxxEwu7L56XnJaFCuL14Bq3k2BTZp2YArT9c5Aj3RjMINDGYSz80ceW5mFAFrm+LNEr2d0aisK+IKY8m4cySEaWwZXKPaYediCALylfHyOp2DVCZyATmniuEU/kCzHn1AL0TG+YI0i4//9+G9amz1Cf0HtRYHYxPzM6imSpeoqvZQMovewoj1zoYRhcg5UmZy0qQN26zHAJ2GbtmRLGgCsATXGIbTNq11kr+P3DNpJ9pBtz5pjR/eSuhYlU0pgOXqWSDZtka4fIrO6OAMu6c06jW2pXNptjovaW2ceElkJq2BLmJVVerZZGRSJV8IfKYjWAif7SIg0jTVYyN6wL5VgXvxPbSbC3p29Ed4w9VZzfTrMTCdJhgrybQy4uixGcTaZGzW+a+ropdL8tcY/RA3WrcvfUIhnmHLBzoohje7kosVypMfGYWkfMAXoLmGkX33+0fVc6+MLyV8Y9ykQZvLBtc2U4OrkJWhRa5jFpOwJ5LOPP9nfC+KzEKwnGrgi9aKGxYoN/rQcG7xLUEiyYu+GL9YHVCZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5675
X-CodeTwo-MessageID: dcec9e7e-8a10-4971-83a4-4c0cc2262933.20201008073606@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT025.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 084abcb6-16d3-4988-03c1-08d86b5ccfab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CiOI01/6+XL17tj6RWpQ0td1ZPoaYdvUYg2aR0GKG0J5cXkJdlbttrt00zlkQCtKQoxqW+PHiFLlnYwvIGKvNqDKZOZPhoYSY5cUPSSTuQ6831i6b0iwBV2oSBYQrSr6iuuxJ2A6NpGfHKoWbVt9BszQlmoc1T30O8aqY3rOMpWVuXbo1WWBX64TGOq1j8XVSYjHjSegWYXWg7V70m5LVMqhD8bUYJsktxaRIaxN9p0tJPZy56s/psz0WXpwbl5AmybLm4HK1C5u2D5Pevu3fMrPp13Fr8p5iX1+CEHU8O7B5Wb2lNJCMa1qZY+XgZWPfZoA34tVXME5sLvutgeQAbpc4+Xh1rdOrHEoMZtFO5VQ37DyCOlrcq3dSC+RK5DPD7Mwlrc/smU833HzbP1eEimgWpfvzyKni5rgaxOiwJgq15MVzpK5uXF4DQc76pnwimeWWqZOa6sm9rQo7zE2VCaxm9u4IU4lKqQNNyj89I9PihokLAZYRs/pKrjOlsBn
X-Forefront-Antispam-Report: CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(396003)(346002)(39830400003)(136003)(376002)(46966005)(83170400001)(7636003)(356005)(53546011)(70206006)(70586007)(7596003)(4326008)(83080400001)(6486002)(36916002)(8676002)(5660300002)(44832011)(36756003)(15974865002)(8936002)(47076004)(54906003)(316002)(26005)(16576012)(956004)(2616005)(82310400003)(16526019)(31686004)(478600001)(186003)(42882007)(110136005)(2906002)(31696002)(336012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 07:36:07.8459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6d948f-abef-49b1-0e5d-08d86b5cd228
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT025.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4073
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topicproducts.com=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 07-10-2020 11:58, Linus Walleij wrote:
> On Tue, Oct 6, 2020 at 9:32 PM Rob Herring <robh@kernel.org> wrote:
>> On Wed, Sep 30, 2020 at 11:50:38AM +0200, Linus Walleij wrote:
>>> On Wed, Sep 30, 2020 at 11:21 AM Mike Looijmans <mike.looijmans@topic.n=
l> wrote:
>>>
>>>> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
>>>> with 8 GPIOs, latched interrupts and some advanced configuration
>>>> options. The "C" version only differs in I2C address.
>>>>
>>>> This adds the entry to the devicetree bindings.
>>>>
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>> ---
>>>> v2: Split devicetree and code into separate patches
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> This patch 1/2 does not apply to my tree, I suppose Rob has
>>> to apply it?
>>
>> Nope, no changes in my tree.
>=20
> Weird, OK Mike apply this wherever it should be applied or rebase
> on my GPIO tree and resend if you want me to apply it.
>=20

Could you provide me a git URL + branch to rebase it on, i'll send you a ne=
w=20
patch then.
