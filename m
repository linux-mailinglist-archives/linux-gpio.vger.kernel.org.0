Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7035F9F4F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Oct 2022 15:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiJJNXa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 09:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJJNX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 09:23:29 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F11B63FCC
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 06:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dW6RE7JjPKcwn6gJrPTRuCPfMl4FH8Nwo2LIxEoZ9wudhAgtW/H7Zt8Il8CUonkk8sA7MYW+98EqK8YBL8fBdk4UMLnd9Kp9jlRlUBy8QgMPMjuLnzjDxMM6a72JAZqQjJK+JCJDGn8EfMwumF/6xQiCH0YldGjW+CcpuU+zPT2nQdGNTFTJVPyQxVkZVDhrv03uir87mcGizKtcDCv3DNA2Bymz9bxbvwMX5ng1/0N8ZrHI6aDeaQRDXAzSTYguMfAFYOR90cRfrzCACdBnDXBle6hnFhhuSmx0RiQbgYqnaORwwgPodCtmk8mli4aJX6hWMU4vMhOoi5U1HZDdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DSnuUKop/EZbLwVP5huusJqF5PMa9vCo4H1oqh1Td0=;
 b=YJjYinLr8FDc2BPolO9oGSFpn+MA+gkePiStG0Mvt8QCxmQF/HEhcN+CCG8QsxeQfa9HqKzDYOGwbZtS2QfITNKc8z1FXmBYRa6XY+o77a6tQDYwvDPsWJ9DvLcToTOdShRWL5eEj7/5QhAP/T3XKr0XGgt0wgjMaszR6VWlT4EuOr2cHVNqD5uTeohqyY0tnbJLkcS2behXc8kLgExVyGDe0vAsDvP1Gb7xd/fHFsrf8hZWtQpGEkq3QusGyuWW7yp7QS+I/G94l1ZYFRgPZ45BLColqJirM+6S2HU9GwyDgSAvT5PMTUyHuptedjx+qGGj51KJ74U0rB3Eh2qu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DSnuUKop/EZbLwVP5huusJqF5PMa9vCo4H1oqh1Td0=;
 b=UJz8KS9ilPdEWRz4EufmyP3c5C3C3jdIKmJWNRwnwJaTMlcZhGIdM2XAIF+s1TRtOpxkevcJeOcTYI77OcC4i9ljnjG+R2v9N9aXUaSSXhZ1i5tnDmDLx9dHMHjFSp1Sg+ZJNf8bqxrGWm1iwYOzeQFX/EKY0a3FNkoLGglf0dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by VI1P194MB0656.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 13:23:23 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::8dfd:7542:7a0c:1f04]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::8dfd:7542:7a0c:1f04%6]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 13:23:23 +0000
From:   =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
Subject: [PATCH 0/2] gpio: pca953x: Add interrupt mask support for pca953x chips
Date:   Mon, 10 Oct 2022 15:20:05 +0200
Message-Id: <20221010132007.924810-1-levente.revesz@eilabs.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0146.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::39) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|VI1P194MB0656:EE_
X-MS-Office365-Filtering-Correlation-Id: 846fa170-fd43-4fdb-40a4-08daaac29b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MdTqjgU3Qau/2560oBsyszwvY9Fd3MYZMu8Aa8ARthakX3L0BkNL8wMtbBt3FWdWyaRCG07G9+2MSanP++SJ131l8cVl/TWZwi0ZluwGjVkc1FBqchmL2va3YSUfn8N5YUMB/qU4BSxsXNf19Onp5N7RO2VRCHlR0d8Y89AtvOq7/pze1LMavxaqCPGK6WaGYiTV6tWaz9sMggimtcrnLNXANKwALGCih8DPHOSnPX+W7laV+QNb62e18S7YoCmYAoV54nyOL8E0PaxF7cEpKk3dnkfpC0RhfKRs7Kfx1MHDlGuvbx2y8HrUv4odjrFN/WPvaMBUrknqrGwB11QGuNOyHU0BU+nGh7XrRtR7JTYYf9RoVMsqTZfAkk0RgAQ9rhA5NgUJNkQyHXxjUkiLwnsT214S/4F/Btu0oqR8leYvGphfvBC8OLwAAS4Z1F0BeClatd4kbnJdAHGPZ5y28ffXfdRyVXiEYqnADsDHmso/zjgd5F36mRFsttUUgUEJTP3CKy7s99KojX/XoYRquM+S5JEPCLzZSQI2RK47H8VBhyL9fANaQVtEeNZQAlErIdUm+0IYcGQBaL3PjxXZumWpWGmUzr98KNTCU4Z/u3TQzolkM9MlYPC63bQwRItK0j/8HaMHPV8+JeiYl5kft2zu5/SGag2KCPTb79FHdWmA4PcRG/sAWaBlHtOPZgT6NJNvhGSLCH2uXND3LWqqiH34W+C5JMFujZ8oKrsohAJApLyBmzFxubolHhHZuTy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39830400003)(396003)(376002)(451199015)(66556008)(316002)(66946007)(86362001)(66476007)(4326008)(36756003)(2906002)(5660300002)(8936002)(8676002)(110136005)(41300700001)(83380400001)(2616005)(1076003)(186003)(38100700002)(6506007)(38350700002)(478600001)(6486002)(66574015)(52116002)(26005)(6512007)(6666004)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXUzTnRxby9JZ1Nzc25NbGFCN1pha2dFaEZwemFFeW5tSUFCamtmcHZpZktw?=
 =?utf-8?B?VFl2RU1YRWdDL2hWZFIxVnlDOFUrVlZkL2pNa3ZYczE1RFBhN1o1VDczK2lW?=
 =?utf-8?B?RElTNUFoaTRhUEFVc2V6UElaYzl2NEEwZlg4dWtBVXRvZ2FjOHVWZEtjTnZY?=
 =?utf-8?B?enFyajFDWXhBVlZuL3RTTlJFOWF5ZW1oaWh1NHg2ejZvT2JaR2hEdDlYdzkx?=
 =?utf-8?B?VktYUlkwNXMxbEt0NklvNzc1enU0UXBlU0M3bFd0RjV6UlFSdTNiMjZSUlEv?=
 =?utf-8?B?K1MyYkZQTzhrVzB1NFJLWE1jTFdCZDBMQzZSaHRjNzhVVlM2SGFhc2hYN25X?=
 =?utf-8?B?TXN2TFl5NnNqUVg2bVFPbjE4MHJmemVXSm9GLzNLODBZZVN2cEhmT2xjekJ6?=
 =?utf-8?B?WG5yKzNUeSs1V2N5TDg1T0h1ZllXK0tJUWgrTG1maXBQdzFYUnVpd29UUDF2?=
 =?utf-8?B?N0IvWnQrbGVOS2Q3R1FqdllxbkE1K0VyMEh5elZuOXZBU24xNTR4Nmk1bjRR?=
 =?utf-8?B?Ym1oTklBeTJBWXRMUE1ZcjQ0MXpHVDRtNGI2OEZ0NUxTZCtPVlZWaXZmbnJ2?=
 =?utf-8?B?eFE5RmJCMTZhdy9CUlZpdVJoU1RJOFVWczM3d0RXaGNKQzVNK29sOE1Oa2dW?=
 =?utf-8?B?VndEdzJGU2tGa25RK2dlbTJPdFd3dE44eWI2S2l4STl2bHBSVjU5TGcxRDln?=
 =?utf-8?B?dWY5K3ZPNjJ4WXY4YklvSHMyT0xlLy8wQjFsZTkwVmFJTUQwcWdvTWdIOVhX?=
 =?utf-8?B?UVB5RzRMZVk2ZjF0Z2xSVytOdTg3NVgyMVZIMGpkVWpPZ1BEMzhSWDdCU2RP?=
 =?utf-8?B?UHRYRTJ1WTRrbk9FWmsxYjhzTVpiSmJqZXpVNHgyTFFWYnBWZXE0L0QyanBs?=
 =?utf-8?B?cnNrMTA1VDZNR3ZqM3N5Vnkyd0ljOGw3Y0xUSm10bkF6QytGWlhRV1hBQ1Bj?=
 =?utf-8?B?ZDEyMXREdDl6UHM4Vy8xSlFLWDVpNWViOVBMT1A4bWg2NDhQSldMRXJxOHBp?=
 =?utf-8?B?VzVraXFSTktkMHBlbWc1b2o2R0pFTzVId092MEtMbnZqNXlGMmw5NG5JbVJT?=
 =?utf-8?B?cEh4UG1VcC9EbEhZTGVIQXNLRmg2NGRadERkTXhKUTZydU9wWHNYbnZ1b05G?=
 =?utf-8?B?bG1WUE1jdUQ1SzBnWW1XQXhBMytQYzNRektqcFhGMzVSUHdCRFBIYWVDRk9L?=
 =?utf-8?B?cDBGM2MzWS9kL0g1RHpkYlNkYVI1QkhpUG5lN21VdVhCb213NFYwZ0Q1Sjlv?=
 =?utf-8?B?WHlueU5FUGM2cXRoK3RvblFtNXdkYTNGRWhKek1OeEFoajBNUjdGbTQ3MGVo?=
 =?utf-8?B?cEdQcXVqL2FONVpwOHVhYk15NjhoS3NwaVVMU2VsR2U0U2hpLzdYQWtwRUpa?=
 =?utf-8?B?azY4YjZSaThBdWdPYnRIdUZCMC9oTGVGdVNqUUxSOEh6YTMvb3dUNzZ1NlJ6?=
 =?utf-8?B?ZUhXTXVic0swWXd2R0xGSll0b2h1MEhldytOMHZYa0dzbm5sdGdnaEdXcjB5?=
 =?utf-8?B?TUtzcTRaYUNBQzdIWElhc2xrU21oSHFNNThvc0dqNTJxemtCWThzV21RbmU5?=
 =?utf-8?B?ZjN1eU5ub1B4SWM3dTE5czJsMnNCN3lsaVhjYnBNWjlqc3FQL3NSWFhIRWtB?=
 =?utf-8?B?L0tLSmQ1dnRaY0wybDFadCs0bzBvZ1BRbzJsRERZL0x5ZGthbTBzdWNISFN1?=
 =?utf-8?B?Q2o0WEVlT3pqUEZGNTN4NkJZYlI2VnBwNFNqSmxCRkxxOGpvbWFRTDh6M1Vx?=
 =?utf-8?B?THV6U1JLMStaQ1RjOTlkb3g1TGJRYTN2RjNaZndHRXN1ZE9iQ2grbTJYQXJR?=
 =?utf-8?B?TVA4U3ZZRnFMSXZrYlVjRldoV09RL2NJKytkcEkwK3FvNGZMMzFBNUk1c3JG?=
 =?utf-8?B?cWtFcS93bXpPb3ZMamtjbCtMeklRbURMUXNRdUhIRVhQcDZKOVZpQnlNZ2Yr?=
 =?utf-8?B?RnJZWk9FbHVpN0RLbmxFTlBabkErVWtURTJmVkp3cGE0bTRWWlcvR3h3L2RZ?=
 =?utf-8?B?L3loWnJNa1dzSE40eXMxTC9RN2pXRXRkS2V0bXBTZ1QxZm1HSTNxUmR1ejdU?=
 =?utf-8?B?S3orSUZack1takM4b1cwc3g4NVd4b3NzYm5JQ0p0bnJrNzA2SWVDdkZObFpz?=
 =?utf-8?B?VlMxYWMyc2cvNnZZNW1GL2YzeVRFTkxUUHFxZDFlYlNaNTQ0VzJjeGJOUTMy?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846fa170-fd43-4fdb-40a4-08daaac29b71
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 13:23:23.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lZ0qHpEbTZFfKIjjD+crRPJk3lml9OKgnbyFFHffmEhbfE7dLfcWVYxF9KKNIcQdI6qnIUrrgx2ZUZACjnXMY+bSDamCHnkefHfloSSyio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P194MB0656
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Some chips in the pca953x family have an interrupt mask register in
addition to the standard 4 registers:

    0: INPUT
    1: OUTPUT
    2: POLARITY
    3: CONFIGURATION
    4: INTERRUPT MASK

Chips with this register:

    - pca9505
    - pca9506
    - pca9698

The interrupt mask register defaults to all interrupts disabled, so
interrupts are unusable unless the driver sets this register.

Interrupt masking is already implemented for pcal chips. That
implementation could be extended to support this register as well.

This patch series adds support for the interrupt mask register in
mentioned pca chips.

Note 1:

    Interrupt support for the pca9698 is not enabled currently, so the
    interrupt mask support has not been turned on either. An additional
    patch in this series could enable support for it, although I have no
    hardware to test with.

Kind regards,
Levente

Levente Révész (2):
  gpio: pca953x: Generalize interrupt mask register handling
  gpio: pca953x: Add interrupt mask support for chips with the standard
    register set

 drivers/gpio/gpio-pca953x.c | 81 +++++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 25 deletions(-)

-- 
2.37.3

