Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40EA4392B1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 11:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbhJYJoZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 05:44:25 -0400
Received: from mail-db8eur05on2064.outbound.protection.outlook.com ([40.107.20.64]:45217
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232606AbhJYJoM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Oct 2021 05:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1xKtDfOPVp+gpGkfv98s/bSsjoXLp5jH4gYTdynq/Y=;
 b=SpcKGhXnwkcGuEYf8UosOHZkevweVdG8DVzMDQro6QhtBTakOWmWfLJCHjxPJGQ81aagj3MNH8cZvo1URrBzMfWk/xsdkxjZpc647LvAsgMFyQQ198Yzg+/z8Xd4zTRKhKr1z9nA03fhxMPYxBx96rkSMMgbYdIH09sGEHJcy9k=
Received: from AM6P194CA0045.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::22)
 by AM6PR08MB3414.eurprd08.prod.outlook.com (2603:10a6:20b:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 09:41:32 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::e9) by AM6P194CA0045.outlook.office365.com
 (2603:10a6:209:84::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Mon, 25 Oct 2021 09:41:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 09:41:31 +0000
Received: ("Tessian outbound e27daf245730:v103"); Mon, 25 Oct 2021 09:41:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de4cc1a9cb1e38ae
X-CR-MTA-TID: 64aa7808
Received: from ed1df057db3b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3AE56A9C-51F7-41B2-A210-5D951A9C631D.1;
        Mon, 25 Oct 2021 09:41:24 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed1df057db3b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 25 Oct 2021 09:41:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5l1Mi2PsB4oF5iIuEMeqKweJnWFNxAU6KNs0G0csNamHMxxF+zrZVMing1i+9S2B2DEOyUX20EYl4kKekI70nJJCloQebttan9XIR+xR5VzQbWfTJPk5WRfmQuWpjMC1d9fPhm4JG2E3FHQGMxAqJfqGjAkYmBeaJj7fH+7QF/nak4fpykAmxaOqMu6YwhHkOv8wHVq85iu4pTwu8el+9hP+hAHfTCQ7tfOKNhRuixqoO9820K2n1YW9QM8ldVhzP6CjMgQLhU6yJ8ef6FduU+p7MsapUQO8U/AFSzO/UB9XWY5Jt77nZMqolzClQPp8k52WGpjW/IN9tHl6JpAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1xKtDfOPVp+gpGkfv98s/bSsjoXLp5jH4gYTdynq/Y=;
 b=AR0iBqjbDo48lRBgwztHsEwh+jg6oWYf4XMcMf0U2rUiHQdAO+2EsxySPAHxG60WuY0Y3MTC9t/rwLPgwAR/HzeYOQsW0VW/QjezdCFklTjmmIfFfhQR6URYKFEEngzxi0wcpnofT8p5Nq1vefXbXDdtGtBRSua9SipCVX58MVx4XdGi8ZKgrhIvtZKxuoZFzj0DeILdOJ2texa6vPfMUf7nr7Qko4fUR3nuvpQiS8FLbbejuJkOUudmZfoF9KpXB9eW159XARWe5wtvLmPLf0JHpQqZJ7CWZn5RJ0XHm949owvUY5uVAbArahtY82z7T4N4kL/FiPBXH1rvkEfhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1xKtDfOPVp+gpGkfv98s/bSsjoXLp5jH4gYTdynq/Y=;
 b=SpcKGhXnwkcGuEYf8UosOHZkevweVdG8DVzMDQro6QhtBTakOWmWfLJCHjxPJGQ81aagj3MNH8cZvo1URrBzMfWk/xsdkxjZpc647LvAsgMFyQQ198Yzg+/z8Xd4zTRKhKr1z9nA03fhxMPYxBx96rkSMMgbYdIH09sGEHJcy9k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Mon, 25 Oct
 2021 09:41:21 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3%9]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 09:41:21 +0000
Date:   Mon, 25 Oct 2021 10:41:19 +0100
From:   Joey Gouly <joey.gouly@arm.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v4 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <20211025094119.GA52794@e124191.cambridge.arm.com>
References: <20211024101838.43107-1-joey.gouly@arm.com>
 <20211024101838.43107-5-joey.gouly@arm.com>
 <7092f3f8-c9ae-4cde-2d1d-f5fd19ad2626@marcan.st>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7092f3f8-c9ae-4cde-2d1d-f5fd19ad2626@marcan.st>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LO4P123CA0398.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::7) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.52) by LO4P123CA0398.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:189::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20 via Frontend Transport; Mon, 25 Oct 2021 09:41:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc9b2d66-f6bb-4804-1c9b-08d9979ba0a1
X-MS-TrafficTypeDiagnostic: DB7PR08MB3484:|AM6PR08MB3414:
X-Microsoft-Antispam-PRVS: <AM6PR08MB34143DFB8A2AE9160E5EB31F94839@AM6PR08MB3414.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: aVhzQMx6eBEnkKCAFkk2vMwn9fEwkm9layjf03HLrpVwiH9aIFztA4FWCbjmKWz0qobHhkVp5Dhsxvkj2aH4mX8Rsmv/osY9iytd0AitSncuzylsbWAm8vDe0caGJFHX/SZiLPHENgI1mIBn3TevhFCYNIrExQuXuzLpfQB0kaiCgEAb0WbP2iwmjbaioBKIJvHoBdSz3fDA1CFceROZZTu1qNK4GzmazvVcVIn0bvUVjvtiECNXyEnn/kalTxT8EujXjs9rQs4s2IQ0nb2IhOaXIIoBecwhg/rWsMqd9vaUtITUzXXAMIvTTtMOO1A4x3akhZCmKDzQEXlsIWq9a1sfcmBsG8+H7sWZVJ5DcpSqWuRbOu4Jlf71+bjAQW1QvPylhK+as98hlFaMuCONIhyFESSIYYvDwhcU/O6517uIUcYE9Wd3gA7p+r83V19x/HYUeEWA7YJ6ZQyf6yID2I0aiYESho9r4DG13iMgDoNAt5mM/R1SciKRt0vY/lvmn9Cz6VmOzX+Yk4zQkrsj4iARKmc0i6SrS5tNtJ2LCsaxvSdls6BNYdVtkAFCOntfEiDxgn0dzuNDnEduT0tO8hNTa/Uvj4iwoc/B/7VT9WUg3s5DkP9Y8f9GhkT1XSMwtzmbu2lP3DzAy3He71Iy002spXGEtT6G1Lky/IU4ZDzucRKI/guVtEAL5Gc6FIl7dhmBlB+Zms+k4xevLkxTWh8xnEif8Jmt82j597vVHPo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(47660400002)(86362001)(8676002)(6916009)(4744005)(54906003)(66476007)(66556008)(7696005)(33656002)(1076003)(508600001)(316002)(38100700002)(4326008)(186003)(7416002)(66946007)(26005)(956004)(55016002)(2906002)(52116002)(5660300002)(8936002)(44832011)(38350700002)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3484
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 162f5993-a78e-4df6-5128-08d9979b9a45
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhWRub33XlpLHZeSBYYygJv6g3MSIC3qBv074akfR38IAPCbqQPfeEn9DTUTeDKZDayYzc/CbXTTjunb5yO29OfJaRmbZ0tQoeP4RC130ywwEsiiV84uPUjnnD28UMjBOmRMm381IVw4s96x2SXmLOOad1K36bXpCmaUFanxOhVVgLtzxX41tGLawJSf3jBkpLOGDEzJ9U0873XrTKuLLNOnseNZJJuhE8fPtX/BideXc5VowWj+soO1OFo7AsY3ji/A7bWCatDKHKGfvRluw1YnMs48Bdp+xeQY5cD6GcfyWFn9VruWji15V/PCvQ1BTqnFQen20yERA85OM6gX/LJ6V1I4nSDu4LN3DrKmbJH1KQRzw70Nr5U4uLw9R8igSPETFKOw9cOrZMaKalPnNF0X8sEQIYulMU4IU6TYIFfhIOz4XCdqvaf27RE3W5ehawOlfuGXuNwdRHA2lHC80A5qTRfRJjlQBq087rTkLkKOXWhqy9QGKjWir5i2iBkqJ62g/+RoWwbktwQv/bT1j4Zya0jx83tpUOeZVTTb3vX8hZayrbJNmOM7sWJzyiqA6LdbQ8pjjtD6bCitJVw55DWZuWQRQOdKSY8ONQpJfNJfD4e78YayrYATttaKdjbQQ0BjFsBUdy8hE+rdnPzUu8pYLZQKPfuY/niK5RhfDFwP7tjEw18J/jlNhq9plbal6XCfN9UOtYiqgrXuHdmDs6UmY/vlfy4TAijtMALoRrU=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(70206006)(107886003)(8936002)(36860700001)(508600001)(47076005)(44832011)(8676002)(82310400003)(7696005)(70586007)(1076003)(186003)(450100002)(4744005)(4326008)(55016002)(26005)(356005)(81166007)(2906002)(54906003)(336012)(956004)(33656002)(6862004)(316002)(86362001)(5660300002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 09:41:31.9514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9b2d66-f6bb-4804-1c9b-08d9979ba0a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3414
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Oct 25, 2021 at 06:07:35PM +0900, Hector Martin wrote:
> On 24/10/2021 19.18, Joey Gouly wrote:
> > This driver adds support for the pinctrl / GPIO hardware found
> > on some Apple SoCs.
> > 
> > Co-developed-by: Stan Skowronek <stan@corellium.com>
> > Signed-off-by: Stan Skowronek <stan@corellium.com>
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > ---
> [snip]
> 
> > +/* GPIO chip functions */
> > +
> > +static int apple_gpio_gpio_get_direction(struct gpio_chip *chip,
> > +					 unsigned int offset)
> 
> Nit: do we really need to gpio_gpio all the things? I think maz already
> mentioned this one.
> 

I forgot to reply to that. The reason (perhaps not a good one), is that the
module is called 'apple_gpio' and these set of functions are related to the
GPIO interface (not the pinctrl side of things). I'm not tied to the names
either way.

Thanks,
Joey
