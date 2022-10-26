Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5BCE60DF6E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiJZLWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbiJZLWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:22:43 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD11CC8220
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNSkBbH+Ly/hTMCMa0GrXe1HSlbouUPDlcJvtSevL5j+vQXwHAdXKxO3Xarnn94d6kRZnWmGpMbcXjXVgD9J3hUBqlz3LSXMhXUKTuz8bHVU2HU5+MQcsJRLTM03WNdBp1wgbD59sRQnH7OHaMrPtzzGF+rjGECU7qmqNyCKn2WisEgjHlVc25KoEZf1WRA/BKy7AEyFQyrBae5qNMrRxCqhWeZQAnPdDEYTopyuovy1X9YELe9H1w68RnOdAvgS4S23e1oP2PIyrh9BkGeTGO2K+WngbiembAaItPgaYR4lxayxfcwde6T/oc95aWTJnCfAnRB4BFIzkuNOhi5EHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mJzuCmw6nf0NLzONA14V+iPRjD5j3F2vAjuS7rT2as=;
 b=kxOo6TNycOZMMT+aUzb5x+JNi/2ryt8XfrFWKvmLvxWLr3SRJsJbWb+ZzgaUtQ0Dy3r83rFJDMYrizrV0tRsVelEu5lcx8zafXFxRBfMYiuiugA00gT7pDOA7X44GToA0aSKrmPe81iqkwW04SZIeQIwXakazzMoFb1NIIx3p1EdlfzsYqw3msueSoEX/wwDwVDmblZV8D3WUdPCOMm1OtPZRKf0tUY361oywKr2mBurDKlF5TF++POTNAnMAxnPEN2CLY9goz9JT0Ub/blY6yKPJQeTcFU4wiCjTzYB6QebgWlLxoRM8eMX6vlJNk6pbfDVLUw5dbkYYRU0aZvUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mJzuCmw6nf0NLzONA14V+iPRjD5j3F2vAjuS7rT2as=;
 b=JQQHnq4XUhc1vxOVXHGMaCDZ9l7XHe8CK2r6C85gI+kYNnFqQsr+19SAEc9NsZmyruxLq2ilAWO1lbCitRLr0WRk4nrlDNruN543egXuNWR9od+HRGGAOXNkjQBVRo7LjUhb5n5/i0TZp3SFtBJ8YnHuuxS0mEQNOmzzGjD77m8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by PR3P194MB1700.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:17b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 11:22:40 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%7]) with mapi id 15.20.5746.027; Wed, 26 Oct 2022
 11:22:40 +0000
Message-ID: <a0b1d922-0bb6-91ec-9b86-b9dc46afe244@eilabs.com>
Date:   Wed, 26 Oct 2022 13:22:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH v2 3/6] gpio: pca953x: Add helper function to check if chip
 has interrupts
Content-Language: en-US
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>
Cc:     linux-gpio@vger.kernel.org
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
In-Reply-To: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0302CA0003.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::13) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|PR3P194MB1700:EE_
X-MS-Office365-Filtering-Correlation-Id: 01af3a85-0f61-4e4a-9cb9-08dab74464ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Pzv74x/OykCHQ/BB9SDFpPh08N+Cbuywffwdf4tmUKISSIrkb1bsvj0B89FBsw4H4P1571oSzHquuhmL0uK+OC07YtgMAPKAWWRcQvJPUVd7tUaWjs96Bzlv1lb7N7BrYFeN1rj5KAaoQ6ppE54En1snBbt1scjGJhed8qqVHzXlE0iHToDK/uvuM6XSsN0MA9PoEVDtSOA/50vmV9q1Fbm31l32RC86OXb5qouK9BstMiOwub1GItfdwcLHBFfcGx84x+WDQNALYwRL8OKe5jRGIzf4BYEQll2e2kMbBHga0DuaaRuktrCTChJ44b8/1Tgz7cbFpOkU9ExYPhFfYYUIAYCcjXTrz9k6ItaLDaBcumzj/WCaZIYzIFBZAakHeEkedBS2iTlGYcFc+ffky6I5+VTBax2PGQc4d3/NCcyV+270CYHeqTqkrFtXFE2lvO8gpvJcw/I23/w9EOC1e/52Q1do9f7oExDdcLXlXm6DtlYecJonp+57ZnrNw6m8YLmb0uxRZNwWVzCy2IkJxGngUJdkQAf3obpc/8cyZ31dm9ybqbc+VSATFB9KBHbM08EI5pB415Rja/vpKE/0oWr0bAjddjBVho9EjE4I9MgAnMAf15K3XLEFytqU4YpNbl8pZX3RZWoH0c7rvFj3sD7BV2LLw+5ZhVJqBgpSRg+WTCCRcLSYGfpdQZBud11txRulMwVfLKdMqRo3Kn86MM+yQ1KjaSe6ZSkfE+/31Ag2W4MLUHVarIZv4+dlgj/iTOJckYLRXWismC2/XFk1Wx8c46TaZRyK2G59kJ6RiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39830400003)(136003)(346002)(376002)(451199015)(31686004)(478600001)(31696002)(83380400001)(6486002)(86362001)(186003)(66574015)(66556008)(316002)(8676002)(66476007)(66946007)(26005)(6506007)(36756003)(6512007)(7416002)(41300700001)(4326008)(110136005)(5660300002)(8936002)(38100700002)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUJYNzFsOHNpcC8zbFVRditMaFpjVVBuR0tVMnduNnI3diswNDFHcGNzdFoz?=
 =?utf-8?B?VVJOMzQ1eXpQSXh3M0kvaHNRa0RITE83bVVqWStONzQweXgvU1Nyem8rVnA1?=
 =?utf-8?B?ZHNyVHdGdDViU2dyVWNkUkN3WUE0Skg4ck5BT09YOTltUDI2TzNFSG5DL0Qw?=
 =?utf-8?B?TDM4NklvZng4eHlvTGlTRTZLSXlpSmNqZ3hPWFJRRW5TNDJZK2J4RWt3NFcx?=
 =?utf-8?B?U2QxelgvNG42TWpkYWRiVUs2aWdGMzNkcWU1cVdMZlJoVXV3N3FKdzA3S2pN?=
 =?utf-8?B?M3lCbDk3NFFkbTlsSDUzcndqWXBSL1Q2VUgvOHJ6WTNBbktCYS9zOHRCVHBt?=
 =?utf-8?B?dVR1KzBDcXIrQ2NOK09udUVmVE9NRkVvbFM0cWhrNTdLc3FkcWY0Tk1tMURX?=
 =?utf-8?B?NVMveEJUQTk5MkhXbHVrTWRmbE81dEVhS3JPL1BnTGpNMDRnTFFFV2JIU1BF?=
 =?utf-8?B?dG5ESUZhZTU5U0hZYVQya1M1Y1A0d3U4TWFjaE9lTXRFTjRiUEdRUTlaYUpH?=
 =?utf-8?B?dHVwamZDSkR4UGJqV1M1MzNkZ2dEYUpSMXM3bmpVSkxVeTJ0N0JDUUU3WDl6?=
 =?utf-8?B?Q2NhMGtiQURvT2gwU3JKVVhZYlRodGhHRGxGdVZUejY2ZDBqOWd0cnRKa1RZ?=
 =?utf-8?B?by9wVEJGcVRlNDJUdkdIaFZDZzUzbWdPTnE0STJuL0NydS9pN3VXb1hTcmta?=
 =?utf-8?B?TjFiVEx3aG80MkVJcWZmSG44L3J3REVJUmZrZDY4b2RjbTh4RlBZL0Rna0l6?=
 =?utf-8?B?b1JoSmhCQUZyaEhzQjdhS3hnR1E3aUNFU2h2YXJTMkloUncrSi94L25nVU9Q?=
 =?utf-8?B?MUF0cWZGNHBIbmE3dy9WaFBXRGRWLzJLdzJNVEhGT1lhT3Bpa21UM1ZMNzJ1?=
 =?utf-8?B?TkU2M1JHOWdBNEs5Y3hwMmE4R2U0dTlweENCWHZGd2h6dE1hcHdMMEhWWjJW?=
 =?utf-8?B?SUs2aVVMTXh5VWdrT3ZDNWRuTGgwSHdTcC84OEswcERKN05XSy9jZW04TjZq?=
 =?utf-8?B?L3NNckJ0NjAreTR6L1V6VXZzb0xGK3FpaWd5cytYVjZGU0VxdkVqWFBtZTZ2?=
 =?utf-8?B?MUY1TkI2Nk9SNHpmMXZ3Y1RoblJ3UE5VTnhVSXQzd0htSStsWE5zWWJDbEJQ?=
 =?utf-8?B?bldvbW1JMVpWaTFMZDB5TTRwRDNkUEZTSGRaZGxnUXova25ZemV3eU45ZjVm?=
 =?utf-8?B?WWl1T05HSnd5VUtycDhoYmFTMnNrQ1BYdVphZFdFbGt6TXo3UUZGWHVsdmR0?=
 =?utf-8?B?OWVBRldkWlJ5NGpUeVFJejN0NlQ1Z0xDSG55NGdXelJhNkgwQTUrcnZBdzZO?=
 =?utf-8?B?U0YrSWZ3dUcrY28xbjFHZ2J2WUQ3cjlVbHJXcW93QXlRaUlwaTlvL1Y5RTM0?=
 =?utf-8?B?UjVoWi9kdi81MSt6cFJNRTJreFJMMGhuWmttYVNVWERFeTlJZXF2STVlYlVm?=
 =?utf-8?B?YTMwR0oyRGFlSzFMMFV1TVk2TlBLdGhxcTZtQ1pzcFV3eVJrdEExUThZNnp0?=
 =?utf-8?B?RWYxZmQyRlV3TWN3Y1ZsakUxblBCbklHNFhsWVZFZnVtaGNOM1d6V2lZZmpP?=
 =?utf-8?B?YzN3R0V3cVZxVkJoK3JaUXdvNEx1UVA4cEwwMHZFaTRRSXVqNFovV1cxV09V?=
 =?utf-8?B?UkNtN2k0Q1I5azgvVVFTS29EZWlwV3hVa21TUUt4TjRFMzBPaUc0eHVwRTEv?=
 =?utf-8?B?ZjJtMEREaDNOSmp4QzgvUnRHY0NuMHBSck9NMnBWRzhCSDlZOThQWXp6TDBM?=
 =?utf-8?B?azNLWmZ2cmg0TG1EaEtZcWJyOTJYbVdnQnY2enVpZXljQStBcC9oQkxzWXFp?=
 =?utf-8?B?VUJYL0ZYOTI2ZGl1cDJ6ejhqNGg2dERFdURIT0E3VWJOeWpXcHVUN0VSTnF2?=
 =?utf-8?B?Vjk1MzNSRU43Y3VZQS84MVJPYWt2WGR1Tk9vaTFhVGFpb2VQcVRCQ0dNYWhW?=
 =?utf-8?B?bm1VVGpXUS9tUmZLQTYvQkNwSjg0WllyNlR5L20vWStzZmRQQkh4VEN3TnpW?=
 =?utf-8?B?di9BZUxwS1NpZGo5QmMyQU5wNEpLYjFXaWZXTWhtT3A0N3JwS0hDM05qc3g5?=
 =?utf-8?B?RDNBZlFKdDNqdC9oZUxwVU1RQTBhVnQwMWdpL2M1ZU5md2ZibDAzQStiR1R3?=
 =?utf-8?B?RTBaaEVrZy9yZVpHa2cxOHdZeWtOMzRBbC96alQyUXpZMnFFcVhibnR3Vndn?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01af3a85-0f61-4e4a-9cb9-08dab74464ce
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:22:40.4516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgKzkEyJWwdBUBtmqdDmrBB7EZ1syATwVDkchdSPbaXZlTht0OptEBEkT9tuN8MfoaWKEDsF33cngSPVpXCivxXYgvApgL0tpo9Ph7/050g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P194MB1700
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pca953x_has_interrupt() function to improve code readability.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
Changes in v2:

    This is a new patch.

 drivers/gpio/gpio-pca953x.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index dcd508368520..1725c1000445 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -230,6 +230,11 @@ static inline bool pca953x_is_pcal_type(const struct pca953x_chip *chip)
 	return chip_type == PCAL953X_TYPE || chip_type == PCAL653X_TYPE;
 }
 
+static inline bool pca953x_has_interrupt(const struct pca953x_chip *chip)
+{
+	return chip->driver_data & PCA_INT;
+}
+
 #define PCA953x_BANK_INPUT	BIT(0)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
@@ -965,7 +970,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	if (irq_base == -1)
 		return 0;
 
-	if (!(chip->driver_data & PCA_INT))
+	if (!pca953x_has_interrupt(chip))
 		return 0;
 
 	ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
@@ -1011,7 +1016,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 {
 	struct i2c_client *client = chip->client;
 
-	if (client->irq && irq_base != -1 && (chip->driver_data & PCA_INT))
+	if (client->irq && irq_base != -1 && pca953x_has_interrupt(chip))
 		dev_warn(&client->dev, "interrupt support not compiled in\n");
 
 	return 0;
-- 
2.37.3


