Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF933E92AB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhHKNai (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:30:38 -0400
Received: from mail-bn8nam11on2043.outbound.protection.outlook.com ([40.107.236.43]:1057
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229968AbhHKNah (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 09:30:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWB7zYGSuy1VX2wPltFGuKswAPMqX6uTx96PRAZQyVQs6ZM+qO5haMuSScQu2q3yKAoSc7WSUcM2qFy0c0X7AB9++88Ok7aflUL0M8ppKh/QSgAKRfzh4L9/HAK7Zl3qkKrVXfZ9+DSFJcOvR6t3t+TwGZ4Ljda61twbyXjWR+d+1u+zVp5UauGlau7swSScedTOQ+5uEyhkuatpiXLL0jRf6qVLS1FZoRj6JokZkpTQ+3smwe+mrlTDcA3mr/nV2c2blemajSmTZ85MN6L3cs1xd/3UoLB+nS4FdUt30eTFZdeFrvdKjr5olSaBzpABkLkYh+vYvTsQUFVrAFN8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DKqTFzkNV9WJ8mthoUNwqr4sjRrxHpna2CRhb+mIgo=;
 b=OQYEPJzOsEpeyZDwGefhmhRkw1BLV1pVE7k2KFxB7uNENZhys0ybBqVNGH9QlXKpmyxVF3uPzo99i4PHkKOfwa56D0ljnwVIwuTfmwyvJBJEFYeTPmPzS2RpmCAt9mlJFtOt2ND7FWaMOf8HSlmxXxutBGOgGTKOZceCvz2Lj8Ewd+mtiuUxAfVsFSV8MMfOvmealfjm/mrmjmQFF641k2kFwDOGYzhUFQP2fuO/Zc2Cn0+aMiuSa9hlSMSW/Iw8F028vojvM7vP8HZ5S14IXL/5mfwTDZLDfj9rZ7mxoQ3UpS3fybWd+TODFefylalxS7v3ncY1HsFUFFuvLnzwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DKqTFzkNV9WJ8mthoUNwqr4sjRrxHpna2CRhb+mIgo=;
 b=LjTrrIxUK2NxpUWQ+Wh/2REwGc1l+BRHZRPfGJ2eP4z1hlxqxuNCOHONlABxFPBe2KwKVadqKwz7TspyOGNfN3Kn4/pKcvYmHHPrOezOrXRhqeV2g12GlU3XIoYR1s+1/JVKid1UkNKEtZPvGpVt9VegeH+BTOxhfta5mOaVPgA=
Received: from SN2PR01CA0038.prod.exchangelabs.com (2603:10b6:804:2::48) by
 DM6PR02MB5753.namprd02.prod.outlook.com (2603:10b6:5:179::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.19; Wed, 11 Aug 2021 13:30:06 +0000
Received: from SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::be) by SN2PR01CA0038.outlook.office365.com
 (2603:10b6:804:2::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 13:30:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0030.mail.protection.outlook.com (10.97.5.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 13:30:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 11 Aug 2021 06:29:52 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 11 Aug 2021 06:29:52 -0700
Envelope-to: git@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 robh+dt@kernel.org,
 bgolaszewski@baylibre.com,
 iwamatsu@nigauri.org,
 gregkh@linuxfoundation.org,
 zou_wei@huawei.com,
 arnd@arndb.de,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=51740)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mDoIp-0005r3-1q; Wed, 11 Aug 2021 06:29:51 -0700
Subject: Re: [PATCH V2 3/3] gpio: modepin: Add driver support for modepin GPIO
 controller
To:     Linus Walleij <linus.walleij@linaro.org>,
        Piyush Mehta <piyush.mehta@xilinx.com>
CC:     Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>,
        <wendy.liang@xilinx.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git <git@xilinx.com>,
        "Srinivas Goud" <sgoud@xilinx.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
 <20210805174219.3000667-4-piyush.mehta@xilinx.com>
 <CACRpkdZ=WRhTTQOvQcDEQhbf5Fone0GHopZfJhsQfsS-NRQUUw@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <974df9ef-6cdb-cb7b-2b9d-2eddaf1171f7@xilinx.com>
Date:   Wed, 11 Aug 2021 15:29:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ=WRhTTQOvQcDEQhbf5Fone0GHopZfJhsQfsS-NRQUUw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e1a6567-d36d-46aa-5caf-08d95ccc2238
X-MS-TrafficTypeDiagnostic: DM6PR02MB5753:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5753C24037B8B1D028FBD2C0C6F89@DM6PR02MB5753.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10li5Nyof+025BADoAkEWDCAtti5Je5V2ExfPtoFC54XkEYH4yJ65xALMOER32SegoIAD0hfz5KecLoddJkXcQctf3zZPFnJSvDaJSeD49mnWt3YWirpL+yJmj/a8q8TEnkzfWyF5XlRgrJjjNeUEaHOKTXZbwBC2C+jWra+Wt18m/5ou7/oah/1iYGyvcYQRFFOiMwEt/xSCHhtoNqKoyxwvNnwj6M+y/fQbx7iEl7qPF66zIpcZvxqiuN2ppTQz9GW46gLR0GkwutTnc7u0Dr7On8YrSKKZMtNVeyX03HGQE+Kvkaj+UmFoSChLNMQBEac5F8eOGOuNjFpuMdu93EJegxcilFZO7olXPMwHbS2psraAV9kKgy6nb/EgCPNEcLk04RzGLTzUuxSDwOsZ62CKk8nGu3nipxS1+kdb2OJengJ6eIOo0i50r0pxSgk8nf8HetKmRbDz+W1RMh+26wE1KGGBQp6PLOEa++JOB8QLc6PElQcCLaloZ2OZKe7lb5yPPeyxmttpF/0NiwyJN/f+82vT3zlbJ40tIBuK/jTQNz1VSnyAuydx9ynTpjemZ+AYIQJoXTaPAXXdkLXiWchsRcL3gXwlhZZhvnqDc+dUFtALfTv6viwJWTfGNwVHLqa6gfk5GAaeC/T/RhpTMSKHIBk/X95O/gK+Vnx4sI2OIQGtZrZ2gLTLSL5A+HdcRYU77lO+g2pOY72JPUd2djuOljBWjUHlooHjjZLXV41zP4lUtRMqO5HvrcnXFzdSE8kB3xLeg7XmlCarQIQmw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(46966006)(336012)(82310400003)(2616005)(110136005)(426003)(70206006)(36906005)(9786002)(2906002)(26005)(82740400003)(316002)(7636003)(54906003)(44832011)(4326008)(70586007)(186003)(31696002)(6666004)(478600001)(5660300002)(83380400001)(8936002)(36756003)(31686004)(6636002)(356005)(47076005)(8676002)(7416002)(36860700001)(53546011)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 13:30:06.6049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1a6567-d36d-46aa-5caf-08d95ccc2238
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5753
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 8/11/21 2:59 PM, Linus Walleij wrote:
> Hi Piyush,
> 
> thanks for your patch!
> 
> Can you explain one thing to me: since this is now a GPIO driver
> that means "General Purpos Input/Output", then these bits are
> accessed like this:
> 
> On Thu, Aug 5, 2021 at 7:43 PM Piyush Mehta <piyush.mehta@xilinx.com> wrote:
> 
>> +       ret = zynqmp_pm_bootmode_read(&bootpin_val);
> 
> This does not look very general purpose. These seem to be all about
> boot mode, right?
> 
> So can you explain why this should be a GPIO driver at all?
> 
> I understand it is sometimes convenient to describe stuff as GPIO even
> if it is not (for example to get a convenient userspace interface) but
> as maintainers
> we really need to make sure that the subsystem is not being abused
> for things not GPIO.

They are bootmode pins because that pins are designed and used by ROM to
get information which boot device should be used.
But after this is it is really behaving as generic purpose I/O pins.
Xilinx is using them for years for usb phy resets. I have also seen them
to be used for other reset functionality.
And that's exactly what we are trying to do here by this driver. Because
usb hubs/phys have reset normally connected via gpio pin which is
toggled. And we have boards where these resets are connected via these
pins or via hard gpio IP or via i2c-gpio expanders that's why IMHO this
option should be designed in the same way to have gpio reset
functionality added dwc3 and based on DT/board bootmode gpio, ps gpio,
pl gpio, i2c gpio or gpio over power regulators, etc will be used.

Please let me know if you want to get more information about it.

Thanks,
Michal

