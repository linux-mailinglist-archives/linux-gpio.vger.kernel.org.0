Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1DB43B8F1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 20:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236738AbhJZSHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 14:07:42 -0400
Received: from mail-eopbgr70049.outbound.protection.outlook.com ([40.107.7.49]:2532
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237656AbhJZSHk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 14:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZSK+plgU3nU0MCMlgXPSmtcoFzMLHqYMYmga1ZXFOg=;
 b=yVqCzq50u7gWzLoHCRCQzQvndHw0jpLz0v7/r7QfhUNM47Zvm/U1xJ+w8e43sbv7nKohRF1Q5zIXqkTUrxb6LC2FX1bOgM5Jtl8rROpJWc3PbU9etBZrGKL+oomCzFX7n061Ey+ZQPkLXsjry7F5cGHun4+ft1/UbErvhXOAVcM=
Received: from DB6PR1001CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::31)
 by AM0PR08MB2948.eurprd08.prod.outlook.com (2603:10a6:208:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 18:05:10 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::9f) by DB6PR1001CA0045.outlook.office365.com
 (2603:10a6:4:55::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Tue, 26 Oct 2021 18:05:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 18:05:10 +0000
Received: ("Tessian outbound e27daf245730:v103"); Tue, 26 Oct 2021 18:05:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92931ffaa20e382c
X-CR-MTA-TID: 64aa7808
Received: from 00bbfb74e6a2.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9E731C55-534E-4891-B4E2-FF865B7DBEAC.1;
        Tue, 26 Oct 2021 18:04:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00bbfb74e6a2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 18:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVkVOnyoVaGenMgQrfYHVQqg2xmSRYbv16mr4pm3nCJOTEEpH7tdbKOXjwAXLoLDvEWrQbnpmqzA3YGpU84dgTzlc8ljCzLBXhxPutBAL25uO8ejLWLi0oECc1WT1uSSRG1ej3/lHMtihjos+UsSRiZeuNOE2bdzYD5wifhLHLlsM7sBle+bHQRmIYdtaGZdLEyUQJS7cXeRiOiYLoC+izKG9CDHIYFbvFgeeG1XFJz8r60IWBBxcfMvBFATKtajdUHBXx1jUhrO9jaQ6lxPcH3pb/mFLQ2goiREg3vPCcE0zjF598P9HsuYSs8tod3ohK3VBkhwxa59/uhFXBHSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZSK+plgU3nU0MCMlgXPSmtcoFzMLHqYMYmga1ZXFOg=;
 b=At2PfyrWp3hhVwkS0MsDpgYeL6xGSy3xTPknbX/jJmDta+t4cV5cZYrpTUVs5yD6RXEUXABXT/47OV3sPJFIUCVnLZbvx3Cuoj0k4Tsdxhv2YaBM3DAgA9Smrc7BCSzLbVdk9oG/ByP/NTF76Le5ZEH4RfoYTdRdKCiiMZDj2OD9+ksIAX1gzrPhW6iUoSps/VhZpHf8fszworL1s/glp7cuqg8eX4f4bK5NGRJGd0vJ42bWMRRoC37WU9Av5qll+9N++vGOZk6s3bs3fdFBhCjqOI3W1bY+3e9zL1zitRuyhGt/EWA7D4kLpWwmqg2cv2dZqj0+8AN9IK8lETvarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZSK+plgU3nU0MCMlgXPSmtcoFzMLHqYMYmga1ZXFOg=;
 b=yVqCzq50u7gWzLoHCRCQzQvndHw0jpLz0v7/r7QfhUNM47Zvm/U1xJ+w8e43sbv7nKohRF1Q5zIXqkTUrxb6LC2FX1bOgM5Jtl8rROpJWc3PbU9etBZrGKL+oomCzFX7n061Ey+ZQPkLXsjry7F5cGHun4+ft1/UbErvhXOAVcM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DB7PR08MB3916.eurprd08.prod.outlook.com (2603:10a6:10:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 18:04:56 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3%9]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 18:04:54 +0000
Date:   Tue, 26 Oct 2021 19:04:50 +0100
From:   Joey Gouly <joey.gouly@arm.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com
Subject: Re: [PATCH v5 0/5] pinctrl/GPIO driver for Apple SoCs
Message-ID: <20211026180450.GA52884@e124191.cambridge.arm.com>
References: <20211026175815.52703-1-joey.gouly@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LNXP265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::29) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.52) by LNXP265CA0041.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Tue, 26 Oct 2021 18:04:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc72c0a1-55e4-4c6d-64b6-08d998ab26d0
X-MS-TrafficTypeDiagnostic: DB7PR08MB3916:|AM0PR08MB2948:
X-Microsoft-Antispam-PRVS: <AM0PR08MB294834A2F50EC856F8951F4794849@AM0PR08MB2948.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2zeEeDJL5UKfIl38N+g+KxhfEhHfsx7cF3XT/TpycyCfQT9pelRMSnz3qBrxtBHAZ+yVYz2ZCSbpOkbfm6QDG/aP9RgKWb8FOsju1Uss7xmKUmOJJ2iGzJMHiYnUaADvKrMKW7qznV/TxCYDWFnAPd+l5s1inY4J+Fbh08kpbDaDTy9zsdlnMZ988Ot4JicPDeDUmz7UWTXDVA0uW46QI4VdlWOmnPpHJAHZKq+7h44LYXZmwgB8zmngN1E0sGpEJJyGUgLvUZYFU7v9j+lRwY7hnY7Kn22CGEUNJwrAObx+39uuPIeM0qphzWYZ3RSUHAK6IErocpNYXcZ1ErwHZhWPgtsaiER8J3RlN0ilBmCfWJ0dK9bCgqDEbKLsb1EKZcQ3OtPTQQOn2nMlHyuesUvYsV1GZ1/LHzyj8pAvydhrdKK089iYagcEfW+HPU1sGR54VC8vJ3AVe64ewJsTpmOHFoRIXSFnPcATZi3gPfzUILPA5KgOWhZO/kQjy8lrpMb+7M9g97MnN+NuDvsJo9+SuCG7+kkPnQR4bbl8iRilddyhd1/gxrtUS/p7a6TmaSKuUzGGhTpIQ5GIJVmdL2MkpebrwY4qDYtfv/wOuJ1+2PYKRut5wu6q5EnKq/hueuHocevlKd7U0LjSfh8PtCDhBu2DH0IfQYiMJ6wL3FCMaCK3aST5TUuiysSEE1yIGkQMaI91ZkFOrVgzwocoKdQ7EPKen9Z0bgWRIu+6iR+1Sm8V78BNVBjdVAJ4Ms2NGR/PS6E66bGWIjzAaFwMQ/J9gRQ2s3rhvOH4mAKQu0wNzbNuz6ODPG0zAjxdzvYl0Al+42tNlgjHavaie0Y1Y/u/KYbc9dRUdJdJZq+tXsg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(47660400002)(508600001)(44832011)(186003)(4744005)(956004)(86362001)(1076003)(966005)(6916009)(5660300002)(8936002)(26005)(33656002)(2906002)(7696005)(316002)(66946007)(66556008)(52116002)(38100700002)(55016002)(4326008)(54906003)(66476007)(38350700002)(8676002)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3916
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 380b236a-1d8b-40b1-99d2-08d998ab1c4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TATHqeFfn/HnTGRGAY+ZzV1kQyb7toUcHYmfFNBYq6gRJfpE3QIEYBYIX86GcDw1IUjad0kuAoV2hWYx5QaxeFegQU7r74Dpkvc6wlOZQcE4O9sxFhM2IUuNxUnpMR6NGdkBi5F4EKuu5t4vv64cp1PJ/nuEQKLnAtjfUH61XB2w+74l0pms3MP6dqPcuYlksjSCcnnjRtCtDDWsPM+8Yiw590bmh/COfSTwX5TCgVDQxVtfHmT9G90Y1oiGD/bpI1gv520lnFRc7QpIuQ1BRdAQInQkmq0lhPqZVeioJqhNvMNRRiOnUJH7n4Fe56OLAlixcmtDs24TrCw/ayMIbv7e5SOtyxvt+nwSkywiwAHPvHoQBVAP2pG/T1TjkeJ/QdaxP6lroiXlLTq8VR/+okup0JfOkcw5zCSqMB+/YkEJP9n45VnH59lMSb3ataBJk7CgDVV5Z4hMpiNFfElk8slcGl13fNgxo2vU9oKmYENCp8xXtEaf8cewS3OTe8Vl06a0/NRDSkeE/Q7luZp3/2JU6lkXGjLGZ/Rs/A0nLpNDhD0i+m5oD+xHY4/hHApqFLXPsvSPULWOaAjEh5rEwkqzc6jaFICeUd/k1URYZhO95ncVSoAexygTnGZN9LbATYDLpisEaBZOOdC8I+REDM0s3uMICpcIayAP+SXN/ZGOg5BT8DXgepRul6+RUW+CbkuClKD1MHDIDXWE1nhWacs0MKwUYCZnFakHmxfP/Fu9kB88c/g0zbMJKhF7caNA3esOS6LNQrX+XihCpY74GSMVLdw0tkJIOvPTq/OYiYz7mYHudWYkef5O8JimymVPpvvzfJdl+IYUoGC5CCbjo49cgd5OPq1BkMJNXtmlPcw=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(186003)(4744005)(86362001)(70206006)(81166007)(336012)(44832011)(7696005)(2906002)(47076005)(956004)(33656002)(8936002)(4326008)(8676002)(70586007)(450100002)(966005)(6916009)(26005)(54906003)(82310400003)(55016002)(498600001)(36860700001)(5660300002)(1076003)(356005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 18:05:10.7542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc72c0a1-55e4-4c6d-64b6-08d998ab26d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2948
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Oct 26, 2021 at 06:58:10PM +0100, Joey Gouly wrote:
> Hi all,
> 
> Here is the v5 patchset for the Apple pinctrl/GPIO driver.
> 
> Changes since v4 [1]:
>   - Renamed functions to remove duplicate 'gpio'
>   - Create all 4 functions (gpio, periph1-3)
>   - Applied Acks/Review tags
> 
> There is a branch here with the driver:
>   https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_v4

Correct url is:

  https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v5/

(I'm guessing the patches will be applied with b4, but just in case..)

Thanks,
Joey
