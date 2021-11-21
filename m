Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03694584FD
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238525AbhKURAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:10 -0500
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:20666
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238491AbhKURAG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3nHfBq11m4FJjNJAXI7jxhqFrryG8dH+D7Cyc5iTvE=;
 b=YZ8YSxdzD26HpSHHN3oLKl9clI5qQ/sykJkoLT37YEjSWiMKq9Mdhgn/wzurPpE/B4MDt1rqOmhAxa8h0UiJNoYHRw9Oc0i1YsV02aElDbGJYJ/rOI8mI0VI2rlibYeUb7i0O4GEa740ETv4VU4Z9iBR/fsw8JOCyYBQ9nwZ4So=
Received: from AS8P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::25)
 by AM9PR08MB6067.eurprd08.prod.outlook.com (2603:10a6:20b:287::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Sun, 21 Nov
 2021 16:56:59 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::5f) by AS8P250CA0020.outlook.office365.com
 (2603:10a6:20b:330::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:59 +0000
Received: ("Tessian outbound c61f076cbd30:v110"); Sun, 21 Nov 2021 16:56:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1c4fd40ad8e1b2b
X-CR-MTA-TID: 64aa7808
Received: from 0f7bcf1f3f54.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id CD563DC1-E58D-4288-8730-4B2B9BF85E3E.1;
        Sun, 21 Nov 2021 16:56:52 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f7bcf1f3f54.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7rsiaRKOYMZaVVTSCL1gZuSicyG/2pYwlshTKFfCj9M/ZT300Q0q6+isQtMZFYVJYEb7tg6Mech1tqaWEmh2MdeQlotx6PoDUL2SRKpWdnjmp6vmnmwshb41OQ2p1uYsMRVp3qtw7qSws8a+UQmBTUmyrXS4XJpMNqA+j/kLA4tyG8ZAWjE5GLS6f1dOeZ2/VXI8F9vQ6uImvSWrlO382nnxN6c3KWYVRwEGKavDDC+c2CRvn/nwySAh17XByO5Dr2yk0Od6HiwtePFNTQw0kepJIqel8CypwgueSq5vhwlAjyMoChYRSZmMngCgRzhM41j5B2y92ChH+UCJ3pmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3nHfBq11m4FJjNJAXI7jxhqFrryG8dH+D7Cyc5iTvE=;
 b=n3JoZlZjZeBzUBAMhQzCNaZsL/doTJI/CkTIS51VRG6rLJE1dpa5grXPkoGDop9Jmi/H2Pmz/izZqmf6/2hJDG9nIQAVLbUBCmigTPyXwaDehx05eE9qnJz2B5939CleOUDqv81e/9WlAxFIrTxyRsTivcBd0mgv2svsCUHvIJGR+MCXhlroCx+yCLsR4ulsrfGCcpchI7IOYaSyZypLvCEegIQKVp6DZ6lDiFq8iUTv2HncbtbPHINIKxOwDB1ddfu/zdqMotsZCFeeOPv1WOsdCLDmQ5oHsseWw0tslFHztoEr3OPMD1uLXN5OkHP55qe8b+aN5lPZLnD+E07mGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3nHfBq11m4FJjNJAXI7jxhqFrryG8dH+D7Cyc5iTvE=;
 b=YZ8YSxdzD26HpSHHN3oLKl9clI5qQ/sykJkoLT37YEjSWiMKq9Mdhgn/wzurPpE/B4MDt1rqOmhAxa8h0UiJNoYHRw9Oc0i1YsV02aElDbGJYJ/rOI8mI0VI2rlibYeUb7i0O4GEa740ETv4VU4Z9iBR/fsw8JOCyYBQ9nwZ4So=
Received: from AS9PR06CA0410.eurprd06.prod.outlook.com (2603:10a6:20b:461::28)
 by PAXPR08MB7384.eurprd08.prod.outlook.com (2603:10a6:102:22f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:56:49 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::7b) by AS9PR06CA0410.outlook.office365.com
 (2603:10a6:20b:461::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:49 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:48 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:48 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 00/11] pinctrl: apple: misc fixes from post-commit review
Date:   Sun, 21 Nov 2021 16:56:31 +0000
Message-ID: <20211121165642.27883-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d442da7-39bd-4774-8c9d-08d9ad0feee1
X-MS-TrafficTypeDiagnostic: PAXPR08MB7384:|AM9PR08MB6067:
X-Microsoft-Antispam-PRVS: <AM9PR08MB6067EA4EFF31E1AEC0A7DD30949E9@AM9PR08MB6067.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: GnYg5O5luArYgtm7WiH2yB87vTfZRjs1g6RPzega2kBxCcFNjwHkFSiML6+lhS9RY53+ELmIfVbPzkeO4Tu6jMbkvs2QyxzEobSls+9kxOEwDfsEg4+b4xsWp0PLfxj9f1op2o6DS2IRsHEH/RtLHzwxhdxb3SJWP+ReWRJ3zlSJ3JULbjC3vq5N6OiIjjGc9BZHF1DJKJUM0+U4DEQ9HIOCH6vsglYFSBklv0w5w34K+3rVL5+URGZKU2TtefHR+SvKsaHhFYd3co4FZ9hG06K1WjxgUolGsmpuUoLinMdoAVdqWhKgutEIuZpyePJbzHyhPKe0lHEUR0rnQrsyUkN3eoji6GU3YBH5SOXdlpLV2ksq2tUaVzAazA5ThNfaRJmzkH3P8WeigC7/K8GzE5hkEuqv+0PXbq9rpWP2j4WFMv79D+nCW2bU02bvA+TZO2pUpFWByHWqXBFdcJVV80XBC651rzlkq773DsaUFGkwuc7ICM/KNPqE1eyG7i4haKgMVq9e2n0oPrnBt1VTYarr4vMQ2oIRCiIJe3b95PnynjxUvSM7WoQa6S4hTGtE3/FVwLjL/uL4WSJnnDIht4eiM7ULtzPLnZRR4ZhTIztg62T/8HE4oU1KZ2+A1SIwaCTjJXZpik1C/FFMh12Faa8JI5t1pm7RWDRhE/jpg32l77khaTxSgCk6iAaX4AbLYtZxOi/aHVUH7Xl/GpNie6cLhMMoH670Rv2gKFkPHYVibEhvXg7Q264mAERvLo9kKYS1yKKL4KGOqd8dYls3WSqwiAzUVJ4DFQyWJlR7xvDfIp1svI/QFCMNQtHfP2CNQHezL4t6EYn1dURH5hsDXPKIVKbdkon7xIWVuAxo3mk=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(83380400001)(426003)(86362001)(70586007)(1076003)(966005)(6916009)(36756003)(2616005)(70206006)(82310400003)(2906002)(5660300002)(186003)(4326008)(54906003)(36860700001)(44832011)(47076005)(8676002)(336012)(6666004)(7696005)(316002)(508600001)(81166007)(356005)(8936002)(26005)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7384
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4fdd5559-dca3-46d3-7e94-08d9ad0fe8dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7VPLDde/6la4tTsQ99jctFkc66KnMNgzyAEhUpnWIYeaX/v5bvEBRWMHblUu0q9oVkvTM4Y+jO01EsTYv0BPvEPKGORfndd/cGV2teNWiSnxJRfaPM1bqcfhY9+JpW1N5h8K2QcFsxxvOvTYRA92Br+m8AsPPsjKESa3Gu3rBep/UVUpGITELt9GOd80of7UiNygEWnLLkzZfyKkOatZyNQvZf/eR2Kv3MS6kMpLykMDp2UrzFctKJmN/aDhr1SkRKn+PB4QSs+1sIDm+MNgEO5I6llY02fmTIvw/iYq528Vo4GNCzjDUFrK/A3eejLEDgemWrU2tXKZNG+UCCVgvLrdGZdXgjnS+IJX3inBXafop+SXMHRGlH09XH0vDolVTyaGfdCizEtx0J+oHIjgseyIMFvUMQOHQCtcW4aKGr1r/yQDaqDHjBjGIgrKzdhiFbix80ZZVB3cQr5e/pFeD40yA8mSFygAThrRpfeTuaaBgA+aoWd6U+tfm2qSIGLE8vRfK48A+iDWo6elkyaT+9mnYZHCRA7aMFARyUgR4NWHKO8zS2QUO5ElNDuaQxazVgfdPMxmIAb1o4BKky1TTnKOlPA4Td20EbLIbc/RGM5oSyyGy938xHAkD0eFnccIEQQ+Rzr0Qasza36/pmQp9iWeH2dnPw5mVVEYsO5HjBDXm0ZrA3yh0bsI6rg/rXTdOrI6E+6++DtClTqi/rToiERTV721lRYXmg30rDPTWGRZxhXYRxf6/fgEMBLhhbU9yMDtdkXTDjtB10l5wwcS1TvtWZ3szEQSOOx5p3gcCejNCUDWHNcXtwfRbvw3MbP
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(36860700001)(4326008)(44832011)(82310400003)(6916009)(70206006)(2616005)(336012)(5660300002)(1076003)(6666004)(8676002)(54906003)(36756003)(316002)(83380400001)(70586007)(81166007)(7696005)(508600001)(86362001)(966005)(8936002)(2906002)(186003)(47076005)(26005)(426003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:56:59.2410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d442da7-39bd-4774-8c9d-08d9ad0feee1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6067
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Here's a series of small fixes that Andy made comments about, after the driver
was already in the pinctrl tree.

Changes since v1[1]:
  - No actual code changes (git diff pinctrl_apple_fixes_v1 pinctrl_apple_fixes_v2 is empty)
  - Split non-whitespace changes out from the first commit.
  - Add suggested-by tags

Thanks,
Joey

A branch can be found here:
    https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_fixes_v2


Joey Gouly (11):
  pinctrl: apple: fix some formatting issues
  pinctrl: apple: add missing comma
  pinctrl: apple: use C style comment
  pinctrl: apple: add missing bits.h header
  pinctrl: apple: handle regmap_read errors
  pinctrl: apple: make apple_gpio_get_direction more readable
  pinctrl: apple: give error label a specific name
  pinctrl: apple: remove gpio-controller check
  pinctrl: apple: don't set gpio_chip.of_node
  pinctrl: apple: use modulo rather than bitwise and
  pinctrl: apple: return an error if pinmux is missing in the DT

 drivers/pinctrl/pinctrl-apple-gpio.c | 103 ++++++++++++---------------
 1 file changed, 46 insertions(+), 57 deletions(-)

-- 
2.17.1

