Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F195C2A7BD9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgKEKab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:30:31 -0500
Received: from mail-eopbgr40070.outbound.protection.outlook.com ([40.107.4.70]:21910
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726152AbgKEKab (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 05:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlt0hU6K+9rcWUnSM6SClGS2e0yjrqf1yHVAlS9kh7g=;
 b=zZWpeMebQ/rxG3uRG7DDpPUMBse3eLD7jn54W7VIAfVtOei+BikPAbrgbBebRcIfeFau1NVhxiTciMGlRzQNN56CPFg7fUlOk0tLRVh4E0GrjVNprGJKDRu2Z+CgA1nmmG7jj5LmoDfb568/3X8YwrpQpKdeXRNM5Zj9FHV7pl4=
Received: from MR2P264CA0095.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::35)
 by AM6PR04MB6439.eurprd04.prod.outlook.com (2603:10a6:20b:d8::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 10:30:26 +0000
Received: from VE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::a6) by MR2P264CA0095.outlook.office365.com
 (2603:10a6:500:32::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Thu, 5 Nov 2020 10:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT018.mail.protection.outlook.com (10.152.2.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 10:30:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.106) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 05 Nov 2020 10:30:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbLXG4CpIjAsW/CH28b90hIan40pST5AfPpkQeWl7FJsEtTwky9ENJnjX7+eFnX7AhKAlfGbzwaR+SLEA0WxUjYIhTtLJxafXZrXP5BkGdHf8OaRUCsp4r7MHw1FeHHPp3L0sOqi3E3UR64/JBaYWMvicu8YHDBj09dIpf5PFvcRkIJWnAvmjY15ZlrGKAJjmWtp5kMeG4nZbd7iNYkzCaU6tDXDvnICQ1oFUvcCdjFC4MxygkDGUVnXCPjW8im9sorUGtmVzz5mriha6uh6ylBLxKPE7j7Na0f35x6hVVWCK9oYVJrt1AGZxp7vZO3ppc0SzM2XJ2n3poKXx3gYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8VkE+gPOVlYpvuwqLcqK4Jc3GzdIXJEvA+5SK3KUWk=;
 b=alrPr/8mP0Qbi0AkrRm5um75eXHwe3ISQ1jBnVb2KtSW4NDrrdq8bwAzAK5tx0ltdjmOCaB0H5ZzE5V86vlGCjvz4y+h0ii7SJjdGxvhzalknH1xeOtGeeNbgm+2CEakHJi9ljOsqsoB9fB4g3GD2+Y2u1Eqp17vRiqZvgGlMnxXkmkHpQJJySG3S9n3MMFrwAtbIpmT5U4BnnDdptx0QQTzfC42jjAZ2PNARlKJMshq6peQl6SpgP0XBNflBVGD5nEM99OWSJcDUhvYbp2D9A7Ll+XskNhspOR78/fZFzfxT3067sHz2JhbxObfXlClOueFB/j3VQi/tPuFQFR9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB5946.eurprd04.prod.outlook.com (2603:10a6:10:82::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 10:30:23 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3%6]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 10:30:23 +0000
Subject: Re: [PATCH v3] dt-bindings: gpio: pca953x: Add support for the NXP
 PCAL9554B/C
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201009060302.6220-1-mike.looijmans@topic.nl>
 <CACRpkdYLDUURK5yFC5UDZ3trQ8vN4pL_0zpU_FrgfhRUXibnLQ@mail.gmail.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1d75dfaa-ac5d-4795-8910-47c61fe5f7fe@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.18a45163-1aba-4d15-b42d-af12641f62ac@emailsignatures365.codetwo.com>
From:   Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <d66dd1db-ec13-2fae-9487-beccdf73a7bb@topic.nl>
Date:   Thu, 5 Nov 2020 11:30:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <CACRpkdYLDUURK5yFC5UDZ3trQ8vN4pL_0zpU_FrgfhRUXibnLQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM8P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::12) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.80.121] (81.173.50.109) by AM8P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 10:30:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa35c6bd-b6fe-46ca-d19b-08d88175cf3b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5946:|AM6PR04MB6439:
X-Microsoft-Antispam-PRVS: <AM6PR04MB6439598173A2AFEC954B429B96EE0@AM6PR04MB6439.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: o2AT/xQE7gYHN9zZ3+9qMc62VUmWK49nuagrJfZoJb8LZXKHxET+i8slbmkLNTkA9/zv3gONBZhm10A8P1tgPssuHg83zxnuw06IN+3N1eci8hENbFLQR8yKmweu6df9ZBgBg5PjKkzq3yfmuNciKVgCfsDu/ocRCo4Vv8mVVq9gVtH62TGWfKsIj3D/argwXUBLJHsnNiULzh/NK1xCTCNt2n8GJpwZJZK1SGsGwDXxu0+u3nfIONjoLkKncwFJCOou+q/0ZEDMBXPXD+D5rakoYPcOTY2obdOvXHJxSFTiUdK3fz/fyFOmsTGkZ05TmFjDh6CQg+zNVYGevZmpCgWCzS3SLF3vZnEYiGksA9Fz3PXr1Q3lDaC2QD2gHbjg
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(376002)(39830400003)(366004)(5660300002)(36756003)(66476007)(316002)(16576012)(54906003)(66556008)(52116002)(44832011)(66946007)(31686004)(36916002)(83170400001)(4744005)(6486002)(8676002)(26005)(4326008)(31696002)(2906002)(478600001)(53546011)(42882007)(2616005)(956004)(6916009)(186003)(8936002)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XgQfOCgPEicbXgcdKwpdSfA4lwjCHmXEiKa9l0rBpYGx1856hsaUdPg1xvJ8VEZEUZU0EF33QG+bFJXmA/qNhnN21UpnUXfWhtTAc0urNFcgWdCTFsdsc0tUS5PKBjmWQMB517WmZAYLMOrKeI4rcN9k1XU5WllZJPuD+amOrv6hGAwalBwpfTnEKGQxAeqIpp94gRozoXlGPMKR3NuZHRQHpGZqaCNeTOH/qLDmKCRlTIYMbA//xP3wPjXse1mGOmjcRMezPzdeYWh/yxC59OHh4+STokRXvxlp4fW9r/wrlqAZRrY2MCwul7NGol9Dxw2ZkubzsGhd/llwaQ+dH1DkaVgo6x6NPzzA8P3XZhiTVpDf8wNiS7l8YumNq/jl86nMd3ohKqgauEg2GR4hS7wjPHvly5lKSDpwjhgS2gx0pWwiSeSlONKCLKT9G6tGDupvS++znVyFqP0yXAp3SnPRWUUOawOs2IALIakcwCvxgYjiGrXZbKF+CdSuCnRiD6XWP487e/NDgKwLBdIjUpMm3rQlwZtSTKBKx6c9VwnRQJGE7c7IcNQ7lybhkG62AXE4F1h2QDQz7RWOdFtXZptcIfqtRWDpyyTygxo+qF7Yrc5SCOluetqVRAS4mUfTVS7fBPU9AG/yrTb/Ri9kFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5946
X-CodeTwo-MessageID: c3087df3-a352-4486-a5ae-758925c4ff76.20201105103024@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e167876d-b918-45ad-83c5-08d88175cd73
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1T5I5Qo6lYgYbQMfjRTPt3FIAyk+4IzYdKQC/h1ccmouchpyXO3CTA5uHqSPB2l4FJcoicyFKj4TbTk17H1+CCm20cinWiQJdV2TzvRpK+Iu6liHhYbpGptI3a851C+G7bQthX4pej+HoRLO6jAX+GU3qsZwZztc74awg2o0ZRW5HOYfKbceWz//NcxOwLPYxHngGP5kOH8o6AT2ezWUbGrPbbj1sBfWibd+VxqCJ6mSaHuMFYNRw2YwnadtUtjXyXAxVJhlUFlc48Op5KkGyfb5WL9c/gbQTCZU8Fa4t/yDGbtIlp6TsxZt0Kpy/+DwppLA9+oMU4NFTHw8NTIbYmygIRBi05ykTy3qy47lny+eog8YCZ3nwyryxvRJB58CuG1bDPvy0UAmwBKl7xCJ4FhaqSeiEsoUujyGepQmBXwxa9R+C7NEnQyIvjSXv4sXOHgENT0l+P/VXqi1nlS+6GUbAfS3S4bxxq9WRcdZnWuzq1EtuBBpGkkoY41bUCGr
X-Forefront-Antispam-Report: CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(396003)(376002)(39840400004)(136003)(46966005)(16526019)(6486002)(7596003)(83170400001)(36756003)(356005)(8676002)(36916002)(7636003)(8936002)(5660300002)(31686004)(336012)(53546011)(6916009)(478600001)(2906002)(2616005)(15974865002)(70586007)(186003)(4326008)(44832011)(26005)(70206006)(42882007)(316002)(54906003)(956004)(16576012)(4744005)(82310400003)(31696002)(47076004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 10:30:25.8946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa35c6bd-b6fe-46ca-d19b-08d88175cf3b
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6439
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
On 05-11-2020 11:25, Linus Walleij wrote:
> Hi Mike!
>=20
> thanks for your patch.
>=20
> On Fri, Oct 9, 2020 at 8:03 AM Mike Looijmans <mike.looijmans@topic.nl> w=
rote:
>=20
>>         - nxp,pcal9535
>> +      - nxp,pcal9554b
>>         - nxp,pcal9555a
>=20
> This triggers my OCD. Putting B before A? Please make it alphabetic.

Nothing wrong with a bit of OCD, it's probably in our job description :)

But there's a "4" before the "5" too.

>=20
> No big deal, but...
>=20
> Yours,
> Linus Walleij
>=20

