Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEAA27E636
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 12:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgI3KH4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 06:07:56 -0400
Received: from mail-eopbgr00082.outbound.protection.outlook.com ([40.107.0.82]:45731
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725823AbgI3KHz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 06:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxS7GM7+KijueT7DihdJ80kmgVED18awfsRm+yLU+5Q=;
 b=UcWE3koAPzIwgo8g/8bwcjBREn+5SxkAjqaYjjgUP0BoN8tvV5bY0yS9OrlYolHRsAYZNbJYELCX+C/s9gYD4T2qOEsRGOh+sAEiDzz3LRZYa5s0YvzYMz0lUuoRW6A8NXqXdMiwrdgsukWAom0sNKeOQEAZ68WiecGBzBkX+Mw=
Received: from DB8PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:10:a0::38)
 by DB8PR04MB6617.eurprd04.prod.outlook.com (2603:10a6:10:10f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 10:07:49 +0000
Received: from DB5EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::35) by DB8PR09CA0025.outlook.office365.com
 (2603:10a6:10:a0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Wed, 30 Sep 2020 10:07:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT033.mail.protection.outlook.com (10.152.4.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 10:07:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.52) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 30 Sep 2020 10:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2HpWOQ7o0jSCwHfpcDXVg8OyM1kVZReCImbVhtGauzwb+UiUTHJRXaytKFT+keHZXc/ds+GSzkKmT/WuSwBluMGC6Mp1UjaUa5cQsJHYffzM7ppXc1rqtakK2+af+AiJgXdA1+pqITXZ3s1QBl5sMGUWZhnCzidaUwIDIC6f3cUab4BmBQIsBJ2pSuSPmDL42/cFFomICHNIyW6rclGwCNalt5vFz71Tt4kUstQstY1PRRgrG4xZtcg6YU83PVicao4b7VJmbKW01qTsCPXOq+6xlzpBQ72B2D+w5AI7Edsi6oXGp/rqJCSz5X+UIi4lQ8d+sabA23VhXs89E/WDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE7tiUrabzMPHZVZhsD8Feaesc/PQaiys2CF5DmQvdI=;
 b=PgyCNUlXT9h5oQUjYDWrO4i9+1NEqIrZFYAlySkIPSIHJ81bm0igdoTnc4FAmv+IFhoimYRleYj5V6obst9wkRckkg5+2LU07uQG132u4o/KsV9fY0ufBvOuIhps8REgLuMlNCRILbJrDRwCPVBHmtyufIdL03DggOrGRyI+gbqc4iUzvcMGCJu0v1s62fzCp4LyirRpMllm5VtkMJ6lVvYW1PHVX+O1Cqeu1ZcgJPvEovl0zARE/epgEWzPqk6yJwcvwQIdLOERMcGiVbhYMon3rnfS9jMzs3BsM90fZ+tnd34Kuzw7+x3NKXMJtsUU+i7a+ewuO03Kce0Ws+hQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB7034.eurprd04.prod.outlook.com (2603:10a6:10:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 10:07:42 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3%6]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 10:07:42 +0000
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the
 NXP PCAL9554B/C
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
 <CACRpkdbsYcmv9m2EiQNgPDZ0MdjPnWTxXvnqATVPvWpB=8Oqkw@mail.gmail.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.5eb0d16d-0739-462d-9899-c160471e2953@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.6831bd86-b84f-4c24-a597-93882807faca@emailsignatures365.codetwo.com>
From:   Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5faea0b8-aaa4-3a02-6086-16ba43f282ea@topic.nl>
Date:   Wed, 30 Sep 2020 12:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CACRpkdbsYcmv9m2EiQNgPDZ0MdjPnWTxXvnqATVPvWpB=8Oqkw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::20) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Wed, 30 Sep 2020 10:07:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ad1bab4-343c-4570-6310-08d86528af1b
X-MS-TrafficTypeDiagnostic: DB8PR04MB7034:|DB8PR04MB6617:
X-Microsoft-Antispam-PRVS: <DB8PR04MB6617AAF9293842E4E9E8E01796330@DB8PR04MB6617.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ytGHGKP/Zd/uTAbvwsxEYoTz85fgasIKOn2877/NsuDfCSD1Sk5CrVdpj+BAJsjekTQIWvHBj6cLvMmsweegxcTXrrfUMAsg+FZkf609kTAy6BCBwAQrxiT/nDiG0Hi0zwYwW7nSAOYJJJGbQ1v9SJSAdVAFVxJnXk0HVizCZRBeO7MLpvAn5vSqM3Jlt/4y6m6iGPda2f6XxoGvX2s0u4RtSFu4RRxli5Cb6IjtPE6UhBRXRDryCvx/486dEKokj6fEKYjfeDxaXMJBd0vdRjhEUZviI8sHMKdysBPn8IDjeOBe419POawDay7r+D0IG/6nYyF8/jQ0ISFby34BNNq2FAFNUxfUN/+aUvayk32A26R2GJbRYIpsGirR4bsw
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(396003)(346002)(39840400004)(42882007)(36756003)(2906002)(66476007)(66556008)(8676002)(66946007)(956004)(2616005)(186003)(44832011)(16526019)(26005)(316002)(54906003)(36916002)(16576012)(6486002)(6916009)(4744005)(31686004)(52116002)(4326008)(8936002)(83170400001)(478600001)(5660300002)(53546011)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KFUOZw4CLKcsdSH57oNHkh/6itKVuU1Fcz0mZ1o78To3zD/qOh4vPJkOQWYmSYk/uqXPjoAfiHkqpu48UXIqDntHMKC4imt+5YXO6UOVxoQth2eqJHKTss4o+ysffCihjStYtzKRBBX6V4L+BiMpL9JvieRYVeTZoyq3azUr7+KOr3m3Z8PahA+Om+bG+SZ5iVY+nVtl6dxLoKTEOj1//uGdSZRNbyot2AMPwDtn2zhDl1bJcWuFUZX2C5dn1olxNId9nyCQ0ItK0PqOH6jl8Y9LWdIeL1Itw2NL8G0DtZ3AfvVPbgqe+yUPO6hQHFLPXMKm3+sfuV+Ouzku2L2kMRsAi5Gnq9E3GIfhR1Tp93o90iuRB9N1u8DL7zOsZMyEoWCjovA0xq1RxEfCb/endG4Ad9lnl4lJ7PmHCvK3ogMcwDNX4AwBqiBL3rzL6RyvGNr1hIvvK8Hmt2NZpHf56eNdJY1UGtuqwvEWA3mEpiPiLbdXYZ7XWL85XmdNVOaIzDKyDe//zw0406Zf/YMNfQ5wp2y4a0rqZLrgSVXp94GmLimHeSRos5XugQ1Li8QjVrrbj3zZC56FnnVLI5yG7xjhWuU1hK1bP6o8HsZUAjHmxTk31f9XbPeLGv1+a+C4InMca85ZLEe3RewknT4EJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7034
X-CodeTwo-MessageID: e4421d3e-5538-4136-8b98-d7c3efbe421b.20200930100744@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e75fd26f-9590-4be0-a81e-08d86528ab2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YVWJe3AvLR8n+L46yUCEk1+wjwJ50oq6rsWWV6Bk0kd8EqnvDsWxq9KREzma+T4U5f9sll9yh/raCrR8ke/tUTr9VgR6Okax5jcQszZ8R4fUEdSb9VMGYxpbM/7TBw3EyKKEUNY7m0ETHB6F7VmfPfvhM89mTrHlbzXNoOk6VvlQGiw5VJ1uBdZ7Rl0lCDdiCaiCJ7l2tEyBi0jWpZLg/lKSeBaHqmgodwHfhSWQy0XVe4oET1e6W7hhouEFn2Jko/+Rtml7ULrcr7CL6p73QA8vNz7TvGCeFjPoxzbVV57QxzWoZ34LCFPudPpKglS8Kt4gQimNFvaGCmq6xE6bBsHGrLUU34EUGSt7211DyWFRPiEnEHhg3AbY/jSjhDfH8KUaUCvlVBTvpKCYQfHjwWqpMcvdpt9yNwhjq6IFDaFW1teeL3FU6fUPDDMLMOMVKrVR2pRVZzChKPTn2E4T1nFJ1SnvMYcZKVC1H9niVXlTdhz3hgZTMFJcZbeGalcv
X-Forefront-Antispam-Report: CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(396003)(136003)(39840400004)(376002)(346002)(46966005)(7636003)(31686004)(7596003)(83080400001)(6486002)(36756003)(356005)(8936002)(83170400001)(15974865002)(53546011)(2906002)(47076004)(336012)(42882007)(82310400003)(186003)(16526019)(31696002)(5660300002)(26005)(6916009)(478600001)(4326008)(70206006)(8676002)(70586007)(2616005)(36916002)(44832011)(956004)(16576012)(54906003)(316002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 10:07:48.1561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad1bab4-343c-4570-6310-08d86528af1b
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6617
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
On 30-09-2020 11:50, Linus Walleij wrote:
> On Wed, Sep 30, 2020 at 11:21 AM Mike Looijmans <mike.looijmans@topic.nl>=
 wrote:
>
>> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
>> with 8 GPIOs, latched interrupts and some advanced configuration
>> options. The "C" version only differs in I2C address.
>>
>> This adds the entry to the devicetree bindings.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>> v2: Split devicetree and code into separate patches
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> This patch 1/2 does not apply to my tree, I suppose Rob has
> to apply it?
>
> I will try to apply 2/2.
>
> Yours,
> Linus Walleij
I based the patches on the current master. Well, master a few days ago.=20
A rebase on current master also had no complaints.

--=20
Mike Looijmans

