Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB85C55F88C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 09:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiF2HOW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 03:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiF2HOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 03:14:22 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82318326E9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 00:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXFQh53myw0KXhZ1MzMKaR8QUTUfI1NEu1LuZUrK/sBJBoVpUR3zxEwcbWlGC1Owg6cs6hmEAZpMnypymF5B9nurIl6bZh4HfXN2Lo04PJ7OIxPrdYJzu+36STXBfyKsbjTsRfmebLl/J8RzUyh2UtNVLTpYqLt+jW7UDyN7ruuqDSw6u5XY/JsUEsV3rzHlXqYXcWfNkHC+AJ8uttQoxp7haVANTVMs/nMOcItouNpP/6/HH2q8fXbwKpSuyIN2Ry6UBZpIcslJ9p0IJlmC3XSpj04geh8ipvdfvX8SHsjI9PxqtWzRRejQPVY8nmSMUz2j6CWnSnER6hCBuDqcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJ1KaRxsEcXaR0EU8zT8ymPDzRuq+dKnkjBqLIdiJck=;
 b=RwraZ41MyvqBGSmf6ww+A9FsDUhUu8aJouelPICivoI+hgqrJuZgcAM2DLhIprTZFAsprU2qbZCR+zDp2INtd9OoQgfuk+GQWjlKztajXALaNBecLuJ/wzYKzolpf3uei7J5A0Rd4VSxGB4XgH4ai9zLhhd6nq64ay1JOBOCRFY01ompvJEYSjN7yXSrln/1T9la61ieVZ2itsYWMYE4zL8Mh+5Qyrlbwqrx1baJwg17qlN841f3BzTGgIovYq69qaZ/HF3Cegu3R6t5DCo0G9tTetdN4ZHxCY2MPqMaRRHBZqCcbPQJD9t1Rgl5DehyX0IXxm+E9Hdxq7pDVC24uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gorani.run smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJ1KaRxsEcXaR0EU8zT8ymPDzRuq+dKnkjBqLIdiJck=;
 b=1sAQ5rsMpucThWFxOv/zqwBoI4eq9sZVkyMr8aDm53RrjexYqxtMVpoyhRw4BAKFzM53e+QH2jGYYOzlXWchHxuvDYFU4yhqd7rJ8njkLDrnmKBnivM7fwQ/NRUeoctlkdBxWLfAgu35M4a0FzB9OM6Ybg44MVAF6NcaqD/22Vk=
Received: from DM6PR11CA0055.namprd11.prod.outlook.com (2603:10b6:5:14c::32)
 by DS7PR12MB6334.namprd12.prod.outlook.com (2603:10b6:8:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 07:14:15 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::2a) by DM6PR11CA0055.outlook.office365.com
 (2603:10b6:5:14c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Wed, 29 Jun 2022 07:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 07:14:14 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 02:14:11 -0500
Message-ID: <f2d1d6e6-abaf-8f3b-0102-49bb93888ede@amd.com>
Date:   Wed, 29 Jun 2022 09:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
Content-Language: en-US
To:     Sungbo Eo <mans0n@gorani.run>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, <git@amd.com>,
        git <git@xilinx.com>
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
 <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
 <CAHp75VfVaKnofadyyf2jF3Lk816i1TJf4pq9s11iN=wFqJH2rA@mail.gmail.com>
 <d1ecc96f-0f92-4023-5b91-832f089d1cce@gorani.run>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <d1ecc96f-0f92-4023-5b91-832f089d1cce@gorani.run>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccd18b6a-3cc2-44fc-dd27-08da599ef957
X-MS-TrafficTypeDiagnostic: DS7PR12MB6334:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1m+jMbnUznT+PxMtWuznMmJaAZ8RmBfLErurmXPdnoTjSQl8TAuCMEUdK/l0Ikf6bkir7PoHaQcAWWiTnNOZq8a/6N0ICsNl/V3syEcnr8kkGNdM499eolGuS35jj0IOYuzUpeIhklrfyUNqnjoP18igoDIIz63n4zcjxugaUkszvF65KBJzCUBc5WvpjUHjYBtDprBPmVQCSsCq4vlfe5wbKjKgnqSBzcpYjjcb/iJJHqUjvbKPnoSVLViJK5BK73UUT64wqtoWfICQkg5SNX4Fgdi9RkgrFpU2BZkiBis0GHO7uHeGbPWYL/ZnNWgsx8V0QHds6Uj9pj/VvLO2aDsOQhC4ecjjuxtLD7pQ/OJSgWyd0BRujqUrQa2Jr4sgFbZfRiHfMTtzWWhetVeRSkKszxs9dIXpesJW4CCpvn8t7BmzByl0DGMRf9YZssozKA6WAU0ybwdMxV+zRg75mqCtDmFvmErDeqXSVa+A4lSQLyondb+lfcVrqH4ugsbW8RTp1jTtshDRlfDQjpXbMnlvoC6H14QTy9pU8Bx57Bw0A1cz2GCsVWKXr1N8XBV+Qf7TaqZ5sqDVePmk3pYtcAvdnb2s/WBgbwGwaFPMr7RInhAo3199t7qkP/bkfM/UEGorDTRnlZlolqF1B7wUtoDSpIVxuet7ih+7HEgKP9Jls6b9VY78NwjkaeFsUql5WtooYqmT2DFNA2WfwVnKT0WLgGutjvCE88k+iePEhiVKC764R1L0fTEqtLjjMIjiV0U0AcOVboq3uP5EFMkN/mL/u83nr5EuwYCdvAuRsGyjniJG1B7yG0a/65hS506saV3QiuYKpP0D8duykD4MC8ZNv/VfgXcjxyqDwohCj2w+e5lOU/Ot8qnWVJHgBWSBfKrbSWk3TtZoa3ZUAo93kw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(4326008)(40460700003)(82310400005)(53546011)(40480700001)(426003)(356005)(36756003)(26005)(70206006)(82740400003)(8676002)(70586007)(31686004)(2906002)(16526019)(8936002)(2616005)(44832011)(5660300002)(83380400001)(316002)(41300700001)(81166007)(16576012)(54906003)(31696002)(107886003)(86362001)(186003)(966005)(478600001)(6666004)(336012)(47076005)(110136005)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 07:14:14.8398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd18b6a-3cc2-44fc-dd27-08da599ef957
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6334
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 6/29/22 03:00, Sungbo Eo wrote:
> Hi,
> 
> On 2022-06-29 04:21, Andy Shevchenko wrote:
>> On Tue, Jun 28, 2022 at 9:13 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>>
>>> On Tue, Jun 28, 2022 at 4:35 PM Shubhrajyoti Datta
>>> <shubhrajyoti.datta@xilinx.com> wrote:
>>>>
>>>> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>>>>
>>>> Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
>>>> The output port is controlled by a data byte with register
>>>> address.
>>>
>>> 1/ Have you checked if there is a driver that sounds very similar to
>>> this already upstream?
>>
>> Actually, why can't pca9570 be amended to support this?
>>
>>> 2/ Have you tried to use gpio-regmap? Why can it not be used?
>>
>> Same Q for PCA9570 driver. (Maybe gpio-regmap wasn't existed that time?)
> 
> IIRC regmap could not be used for pca9570 as pca9570 doesn't have a
> concept of "address"; it only accepts a data value.[1]
> Please let me know if the situation has changed in the meantime.
> 
> It seems the slg7xl45106 driver reads/writes a reg at 0xDB so it is not
> compatible with pca9570 driver (in the current state), and (I suppose)
> it could be converted to use gpio-regmap.
> 
> [1]
> https://lore.kernel.org/linux-gpio/69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc/

As was mentioned driver is based on pca9570 and the only important difference is 
with i2c_smbus_read_byte/i2c_smbus_read_byte_data and especially
i2c_smbus_write_byte/i2c_smbus_write_byte_data.

Read can be aligned without any issue but write will have if/else because of 
i2c_smbus_write_byte_data. Example below.

Something like this. If this change is fine I think there won't be any issue to 
just merge it with pca9570.

Thanks,
Michal

diff --git a/drivers/gpio/gpio-slg7xl45106.c b/drivers/gpio/gpio-slg7xl45106.c
index bf25e6fb6782..b90950ae38c1 100644
--- a/drivers/gpio/gpio-slg7xl45106.c
+++ b/drivers/gpio/gpio-slg7xl45106.c
@@ -22,20 +22,24 @@
  struct slg7xl45106 {
         struct gpio_chip chip;
         struct mutex lock;      /* To protect writes */
+       u32 command;
  };

  static int slg7xl45106_read(struct slg7xl45106 *gpio)
  {
         struct i2c_client *client = to_i2c_client(gpio->chip.parent);

-       return i2c_smbus_read_byte_data(client, SLG7XL45106_GPO_REG);
+       return i2c_smbus_read_byte_data(client, gpio->command);
  }

  static int slg7xl45106_write(struct slg7xl45106 *gpio, u8 value)
  {
         struct i2c_client *client = to_i2c_client(gpio->chip.parent);

-       return i2c_smbus_write_byte_data(client, SLG7XL45106_GPO_REG, value);
+       if (gpio->command)
+               return i2c_smbus_write_byte_data(client, SLG7XL45106_GPO_REG, 
value);
+
+       return i2c_smbus_write_byte(client, value);
  }

  static int slg7xl45106_get_direction(struct gpio_chip *chip,
@@ -93,6 +97,9 @@ static int slg7xl45106_probe(struct i2c_client *client)
         gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
         gpio->chip.can_sleep = true;

+       /* will be filled based on compatible string, 0 for pca9570 */
+       gpio->command = SLG7XL45106_GPO_REG;
+
         mutex_init(&gpio->lock);

         i2c_set_clientdata(client, gpio);





