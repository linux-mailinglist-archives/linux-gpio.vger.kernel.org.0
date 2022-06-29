Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248AB55FD6E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 12:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbiF2KiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 06:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbiF2KiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 06:38:15 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121A9646F
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHmdaZ4DgHieu1W0R3v8G0czvj3P/QwlDw0XPNl+E/4k3AjqHzdNyvqO5l1lpdjmBwzpMSKDyZaDL+aBomCtOveYoh/MqQJe5dkEdaY77hoDy2wNuo8EvnPW52T2KXi7RhYouAW5F+nYH0Pz2ZjbDNfDb4tVYcS30wZlLpYy4PLOWdxjFivs/tFK45sda0SJl1JqzFihpsteZhPK6sNxvG7d7G8hviUw3sMDBwnUfJZzTEKCaQrEDE+uvF9iyOLUP5C19gp+Vv0nGPBKCn/F5iK0kCnad7be3xajVoYFskwqp31cZU58cB1ZtMxGDao2yvsofEWbGls56/WHPBeKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xglYitCLGCgBzE2ORO9xKTCTlcDQNvS4HX9DHt9aiak=;
 b=dOHGznoSQrrA8/CV3oUwxROe0gbFyUVKZ97ygF31zdMSomwAs2zKGAeV0/YP2qkVhcvbKEv2nojtGzGhLWpSMRwdLMc4k2fv3PWcn462GXkzd8ygxIskW4QZ2Zzdao8n0iHEEK9h27/qi+Tr09SwFxccf9zahlBX7qYuNc2TV1ibpInb3MpcRaNuaLQzK97t+UqsJvlW3YQwI6db2Z24VeNbB6qNHUat6luA4ilFqPAk194eOKyT0HKAU3p51nrsQKlrNgilPrZebrOptKqDukut6defpAFAaJvyfMSZmNGpzREycwV2Gwttx3vdfjx38uRMoii2SkyS+GFkj5dmUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xglYitCLGCgBzE2ORO9xKTCTlcDQNvS4HX9DHt9aiak=;
 b=2jSJepTShiif/qQg51LELyy4h5iLoZOx//oB+IQb1R0K9/L8laqsJIersHTzk/pwqnY9CnR5cN7UcG07u5EN34Jn8pTf0Nk0uIpnk7S+BKNKVxmVKRlJGPHAAtUJlPNqie2jZvjg2TKMb6hn3yB0vHNbhDUkqlFpgxTK2vEhlPU=
Received: from BN9PR03CA0962.namprd03.prod.outlook.com (2603:10b6:408:109::7)
 by DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 10:38:12 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::5e) by BN9PR03CA0962.outlook.office365.com
 (2603:10b6:408:109::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 10:38:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 10:38:11 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 05:37:42 -0500
Message-ID: <02badfe5-395d-b63b-cf18-e2b3aad93625@amd.com>
Date:   Wed, 29 Jun 2022 12:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Sungbo Eo <mans0n@gorani.run>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, <git@amd.com>,
        git <git@xilinx.com>
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
 <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
 <CAHp75VfVaKnofadyyf2jF3Lk816i1TJf4pq9s11iN=wFqJH2rA@mail.gmail.com>
 <d1ecc96f-0f92-4023-5b91-832f089d1cce@gorani.run>
 <f2d1d6e6-abaf-8f3b-0102-49bb93888ede@amd.com>
 <CAHp75Ve_mgam2jcyFG-NggziUScK3JBZ4fmtN+rjd+Vra=ixuw@mail.gmail.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <CAHp75Ve_mgam2jcyFG-NggziUScK3JBZ4fmtN+rjd+Vra=ixuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83dea640-6868-44d8-8e9a-08da59bb772e
X-MS-TrafficTypeDiagnostic: DM4PR12MB6591:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNkR+fmuhBP+ivZeZxOzpEd3IZYJKF3Lj7ESLnikbeyoXs/tMOGiAELOt10JN4lgMcCO8WZhX8cYMLZ3H+9Tcfjd7thxuSS3eUja2b43lHWltjakPCSzQwBAHNgbfdES9tSgo/UkG7c0ZMEpyN/A7//WJB1BjGgcXXBaC/YGZmUBJrOHAEBYEaGYqYCmjK4sthl0HdrRXpCrcls595ZOh55mcUZKPFzKibowqfkQDHNVCXy9MUykHPTitQar/mbiTCLBmYiUkVN2VCzTDmuSEUaG5CshsYtYLbo9u3OxuTYbRd8nPr5KXPqBwsEVOzIZcpbkeSeYJpSu+3EzbaahYTY/KVOjZ9Nc3Ry8Mib2j4zFs1Sw5oNLtLG9piizJL4nan2whoN8MhcI6G947tVwBXQME3ICIDj4Ow5xjujnLcgx0keNIzNXtOF47ZdBDsEkQdo9tP6JO55G89KDtAsgS9WrdS+duYz2Fcrbwbh/8KFwSha0jLEgvP90qDyD16voMxn0fb0aUKh87PSSXqkF2mrbvkKj6HiS8D0e5n1tXw38e+eLsBva4S306hkDgJ0FFAk9hm0VU9Md8haa3DkOgsB3jHP/a1h90JFsvu3inkTI++j2kVoCy0+xXUhga39QL13IISDOygOtfgmphHuNQKKzXCEr5UMAf3twfdhABoFNnYO2Wiw/nPi+ng1J5+ZwTIABt7f//vQPiP9WZZ6Wf7laGVITJQXD8g9F7YJOku3WfwLfMFb2wS6YLHUD8X++2UhzKv0NIbG/J2ILjoL35cB5htMynw6znzVDK+YPn2bTXhEiOp1oOAZyKmFZhohUAXxAg9l1KWcvGtBRDuCJCJcSbLzJMkjNkFVGtUKW9YQ6xI2AJgglHAoJE3smUTPSCbD5bf4ECW7xubSdfmH/Qg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(46966006)(36840700001)(16526019)(31686004)(6666004)(40460700003)(8936002)(83380400001)(478600001)(82310400005)(186003)(82740400003)(2906002)(5660300002)(44832011)(36860700001)(36756003)(40480700001)(426003)(47076005)(966005)(316002)(16576012)(53546011)(6916009)(4326008)(54906003)(2616005)(70586007)(8676002)(70206006)(41300700001)(86362001)(31696002)(107886003)(81166007)(26005)(336012)(356005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 10:38:11.8861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dea640-6868-44d8-8e9a-08da59bb772e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/29/22 12:15, Andy Shevchenko wrote:
> On Wed, Jun 29, 2022 at 9:14 AM Michal Simek <michal.simek@amd.com> wrote:
>> On 6/29/22 03:00, Sungbo Eo wrote:
>>> On 2022-06-29 04:21, Andy Shevchenko wrote:
>>>> On Tue, Jun 28, 2022 at 9:13 PM Andy Shevchenko
>>>> <andy.shevchenko@gmail.com> wrote:
> 
> ...
> 
>>>> Actually, why can't pca9570 be amended to support this?
> 
>>> It seems the slg7xl45106 driver reads/writes a reg at 0xDB so it is not
>>> compatible with pca9570 driver (in the current state), and (I suppose)
>>> it could be converted to use gpio-regmap.
>>>
>>> [1]
>>> https://lore.kernel.org/linux-gpio/69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc/
>>
>> As was mentioned driver is based on pca9570 and the only important difference is
>> with i2c_smbus_read_byte/i2c_smbus_read_byte_data and especially
>> i2c_smbus_write_byte/i2c_smbus_write_byte_data.
>>
>> Read can be aligned without any issue but write will have if/else because of
>> i2c_smbus_write_byte_data. Example below.
>>
>> Something like this. If this change is fine I think there won't be any issue to
>> just merge it with pca9570.
> 
> Thanks, I also would like to see something as below in the result.

ok. Good.

> 
>> diff --git a/drivers/gpio/gpio-slg7xl45106.c b/drivers/gpio/gpio-slg7xl45106.c
>> index bf25e6fb6782..b90950ae38c1 100644
>> --- a/drivers/gpio/gpio-slg7xl45106.c
>> +++ b/drivers/gpio/gpio-slg7xl45106.c
>> @@ -22,20 +22,24 @@
>>    struct slg7xl45106 {
>>           struct gpio_chip chip;
>>           struct mutex lock;      /* To protect writes */
>> +       u32 command;
>>    };
>>
>>    static int slg7xl45106_read(struct slg7xl45106 *gpio)
>>    {
>>           struct i2c_client *client = to_i2c_client(gpio->chip.parent);
>>
>> -       return i2c_smbus_read_byte_data(client, SLG7XL45106_GPO_REG);
>> +       return i2c_smbus_read_byte_data(client, gpio->command);
>>    }
>>
>>    static int slg7xl45106_write(struct slg7xl45106 *gpio, u8 value)
>>    {
>>           struct i2c_client *client = to_i2c_client(gpio->chip.parent);
>>
>> -       return i2c_smbus_write_byte_data(client, SLG7XL45106_GPO_REG, value);
>> +       if (gpio->command)
>> +               return i2c_smbus_write_byte_data(client, SLG7XL45106_GPO_REG,
>> value);
> 
> Missed change to gpio->command :-)

I found it too. :-)

Shubhrajyoti: Can you please merge that slg driver to 9570? That dt-binding will 
require small massage too.

Thanks,
Michal


