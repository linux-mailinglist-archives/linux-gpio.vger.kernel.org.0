Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D408A161C5C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 21:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbgBQUhu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 15:37:50 -0500
Received: from mail-eopbgr40088.outbound.protection.outlook.com ([40.107.4.88]:53380
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726704AbgBQUhu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 15:37:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVYW4mPjzWjCLoMYWpP28Dr0qo2ekPr2c107WuXZSqPsnw6bOCyyi4QQkyafWz2F144dq81a0O8kK/QXNS1M6E/R6HF/2T+q7kRe+Ll1JCwpcgDHJTZENYmQ8FYdz3yUtK95B/AstuqS46k2M78m89gQzo2eE4H//SrCmiThJWKzcH06/xK42KeD9cCA3jvg3p+NpApF3EQq/NMU8BD5WLi2foDas+5yLfU1T8vfDAiszy3/7NSOgwGQ8N46DiuXonJeKuWT0MYNI/VDaTtclLWR/CFzdJiJm16mgRbuYbzE+F2jJ7w7RgbMWZ22+pi3TaD2F2J7TUfDPhFsQ/z6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GwAojTp8lAfdbFH9+FXdw+woAXmQP9yyzUO3eEb/1o=;
 b=dVgP2T7AmT4p9x9sP/K/uiQ5u/HJLeKC9SExtVucrxAIFsQDeoBVhxvfXx99sjcjNIIoufFA9NVus7PMLo45mQl0yk7oE8mUJz4aaTrabgUTudwmS2J5Pzqd+kL4u8pgj+gLfbYjxMZpuKQd9KbcmpxI1vsol219qik00nf3Gbl7vWtj4g34Vn39AIx1hYaylH7MufRl0CBGA/0ArC2X0c33NOpqdpF+rg1e64dCOGiayeAHgT623+7mce6pbaitxQoEF11845AXKAms9bxx7I0UNEtOOPknWP0ZMAiGu6AP+L9jeLla7d775scwlkDVuX6DK7dquC0nIDpvVrOa+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GwAojTp8lAfdbFH9+FXdw+woAXmQP9yyzUO3eEb/1o=;
 b=b2Fb87QzYfx7zZE+fLPzh7fZTNx08xnoC0Ya65RzmAYF7MT889A+a38pZNBVu4OwzMLr3syRFA2QouVDSgv5EimIL3t/VfURC1XHOCMh7RCIjflb3FLjbE5A5WlL/0Phjg0Dyf5iBpEMUcfKjYyvzYlAKB4SHkAouPBHI/QO0Do=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB6046.eurprd04.prod.outlook.com (20.179.25.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Mon, 17 Feb 2020 20:37:45 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953%7]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 20:37:45 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] firmware: imx: Align imx SC msg structs to 4
Thread-Topic: [PATCH] firmware: imx: Align imx SC msg structs to 4
Thread-Index: AQHV4SGqSL+k7/w06UOL1nyEN5GYug==
Date:   Mon, 17 Feb 2020 20:37:45 +0000
Message-ID: <VI1PR04MB7023CDE9E4AD086F2E926495EE160@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
 <20200217062129.GB6790@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f2ee3e91-a013-4352-9b6a-08d7b3e93e7d
x-ms-traffictypediagnostic: VI1PR04MB6046:|VI1PR04MB6046:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB604669F1048B551AAEEBB598EE160@VI1PR04MB6046.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(189003)(199004)(66946007)(478600001)(4326008)(186003)(91956017)(76116006)(7696005)(53546011)(6506007)(66446008)(64756008)(66476007)(86362001)(33656002)(316002)(66556008)(52536014)(5660300002)(81156014)(81166006)(44832011)(8676002)(8936002)(110136005)(54906003)(55016002)(26005)(6636002)(7416002)(2906002)(71200400001)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6046;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Dw9Eqdi3rT+71H3V4avbne4d5tUISuJcRnsXwk749MK6F/SE19wiMUu70tddUsoA5pf6IHfZ/wEahyIN/6P92IQnFFwFT5UisIrvFHU1KC2JY6CODyHIPTWGrkhPFlHxqD9UhDGtz+cau+E92kqke4uw0e0b/uZXJgBi4O6QY6brHDbaHGxu5VgmtIZe6iCRuA+3+dMwj8Pp8O8MPW8Ortz0+/2anGs3sqWF482opkWEbQbTTAVdYgykjIK+nMWMsF4RsSs/M6AtAubVIMn+tnsa55s5jBqDCyB+fMZdim3wz9eHd268l97cTohKpJNn/j73O49WMuQh1ymkozR0h5oZnfYEhE73u95AgSXNUiQYkcYlDTzOQpBX6Jnk8lQIIQ8qjIPftwecwHhe8fM2CUzmG0cDGj/Aa59sVLy/Slq6DyCsmNp42nLVvrvFjHz
x-ms-exchange-antispam-messagedata: 0Tr2uIyGUSLQqGROu0w62HO46pKMGJa9jCrqjMSDvpR96adyuKIHPmvs3saPkDk0YAXfuWdRmjuEwVfjmxP6uaOIR7JCl/uY1WUVgTizCAJgAwXkuBU3ZPMONEdM6Uui6JT7Hu8cZr8rG/vsN8VlmQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ee3e91-a013-4352-9b6a-08d7b3e93e7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 20:37:45.2001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szm/5dRgZ1Acim1YMIgSFEF0u7FSi/9ClEIAXA12EKqqKPKX0bvRnAvfVKG/lgrVZqVmi0L/6HDBH2SmacJv3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6046
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17.02.2020 08:21, Shawn Guo wrote:=0A=
> On Tue, Feb 11, 2020 at 11:24:33PM +0200, Leonard Crestez wrote:=0A=
>> The imx SC api strongly assumes that messages are composed out of=0A=
>> 4-bytes words but some of our message structs have sizeof "6" and "7".=
=0A=
>>=0A=
>> This produces many oopses with CONFIG_KASAN=3Dy:=0A=
>>=0A=
>> 	BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0=0A=
>>=0A=
>> It shouldn't cause an issues in normal use because these structs are=0A=
>> always allocated on the stack.=0A=
>>=0A=
>> Cc: stable@vger.kernel.org=0A=
> =0A=
> Should we have a fixes tag and send it for -rc?=0A=
=0A=
I haven't check but this would probably have to be split into multiple =0A=
patches because the structs were not added all at once.=0A=
=0A=
> Shawn=0A=
> =0A=
>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
>> Reported-by: Iuliana Prodan <iuliana.prodan@nxp.com>=0A=
>> ---=0A=
>>   drivers/clk/imx/clk-scu.c               | 8 ++++----=0A=
>>   drivers/firmware/imx/misc.c             | 8 ++++----=0A=
>>   drivers/firmware/imx/scu-pd.c           | 2 +-=0A=
>>   drivers/pinctrl/freescale/pinctrl-scu.c | 4 ++--=0A=
>>   drivers/rtc/rtc-imx-sc.c                | 2 +-=0A=
>>   drivers/soc/imx/soc-imx-scu.c           | 2 +-=0A=
>>   6 files changed, 13 insertions(+), 13 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c=0A=
>> index fbef740704d0..b8b2072742a5 100644=0A=
>> --- a/drivers/clk/imx/clk-scu.c=0A=
>> +++ b/drivers/clk/imx/clk-scu.c=0A=
>> @@ -41,16 +41,16 @@ struct clk_scu {=0A=
>>   struct imx_sc_msg_req_set_clock_rate {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	__le32 rate;=0A=
>>   	__le16 resource;=0A=
>>   	u8 clk;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct req_get_clock_rate {=0A=
>>   	__le16 resource;=0A=
>>   	u8 clk;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct resp_get_clock_rate {=0A=
>>   	__le32 rate;=0A=
>>   };=0A=
>>   =0A=
>> @@ -82,11 +82,11 @@ struct imx_sc_msg_get_clock_parent {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	union {=0A=
>>   		struct req_get_clock_parent {=0A=
>>   			__le16 resource;=0A=
>>   			u8 clk;=0A=
>> -		} __packed req;=0A=
>> +		} __packed __aligned(4) req;=0A=
>>   		struct resp_get_clock_parent {=0A=
>>   			u8 parent;=0A=
>>   		} resp;=0A=
>>   	} data;=0A=
>>   };=0A=
>> @@ -119,11 +119,11 @@ struct imx_sc_msg_req_clock_enable {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	__le16 resource;=0A=
>>   	u8 clk;=0A=
>>   	u8 enable;=0A=
>>   	u8 autog;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)=0A=
>>   {=0A=
>>   	return container_of(hw, struct clk_scu, hw);=0A=
>>   }=0A=
>> diff --git a/drivers/firmware/imx/misc.c b/drivers/firmware/imx/misc.c=
=0A=
>> index 4b56a587dacd..d073cb3ce699 100644=0A=
>> --- a/drivers/firmware/imx/misc.c=0A=
>> +++ b/drivers/firmware/imx/misc.c=0A=
>> @@ -14,30 +14,30 @@=0A=
>>   struct imx_sc_msg_req_misc_set_ctrl {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u32 ctrl;=0A=
>>   	u32 val;=0A=
>>   	u16 resource;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct imx_sc_msg_req_cpu_start {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u32 address_hi;=0A=
>>   	u32 address_lo;=0A=
>>   	u16 resource;=0A=
>>   	u8 enable;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct imx_sc_msg_req_misc_get_ctrl {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u32 ctrl;=0A=
>>   	u16 resource;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct imx_sc_msg_resp_misc_get_ctrl {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u32 val;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   /*=0A=
>>    * This function sets a miscellaneous control value.=0A=
>>    *=0A=
>>    * @param[in]     ipc         IPC handle=0A=
>> diff --git a/drivers/firmware/imx/scu-pd.c b/drivers/firmware/imx/scu-pd=
.c=0A=
>> index b556612207e5..af3ae0087de4 100644=0A=
>> --- a/drivers/firmware/imx/scu-pd.c=0A=
>> +++ b/drivers/firmware/imx/scu-pd.c=0A=
>> @@ -59,11 +59,11 @@=0A=
>>   /* SCU Power Mode Protocol definition */=0A=
>>   struct imx_sc_msg_req_set_resource_power_mode {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u16 resource;=0A=
>>   	u8 mode;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   #define IMX_SCU_PD_NAME_SIZE 20=0A=
>>   struct imx_sc_pm_domain {=0A=
>>   	struct generic_pm_domain pd;=0A=
>>   	char name[IMX_SCU_PD_NAME_SIZE];=0A=
>> diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/f=
reescale/pinctrl-scu.c=0A=
>> index 73bf1d9f9cc6..23cf04bdfc55 100644=0A=
>> --- a/drivers/pinctrl/freescale/pinctrl-scu.c=0A=
>> +++ b/drivers/pinctrl/freescale/pinctrl-scu.c=0A=
>> @@ -21,16 +21,16 @@ enum pad_func_e {=0A=
>>   =0A=
>>   struct imx_sc_msg_req_pad_set {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u32 val;=0A=
>>   	u16 pad;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct imx_sc_msg_req_pad_get {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u16 pad;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct imx_sc_msg_resp_pad_get {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u32 val;=0A=
>>   } __packed;=0A=
>> diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c=0A=
>> index cf2c12107f2b..a5f59e6f862e 100644=0A=
>> --- a/drivers/rtc/rtc-imx-sc.c=0A=
>> +++ b/drivers/rtc/rtc-imx-sc.c=0A=
>> @@ -35,11 +35,11 @@ struct imx_sc_msg_timer_rtc_set_alarm {=0A=
>>   	u8 mon;=0A=
>>   	u8 day;=0A=
>>   	u8 hour;=0A=
>>   	u8 min;=0A=
>>   	u8 sec;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   static int imx_sc_rtc_read_time(struct device *dev, struct rtc_time *t=
m)=0A=
>>   {=0A=
>>   	struct imx_sc_msg_timer_get_rtc_time msg;=0A=
>>   	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;=0A=
>> diff --git a/drivers/soc/imx/soc-imx-scu.c b/drivers/soc/imx/soc-imx-scu=
.c=0A=
>> index fb70b8a3f7c5..20d37eaeb5f2 100644=0A=
>> --- a/drivers/soc/imx/soc-imx-scu.c=0A=
>> +++ b/drivers/soc/imx/soc-imx-scu.c=0A=
>> @@ -23,11 +23,11 @@ struct imx_sc_msg_misc_get_soc_id {=0A=
>>   		} __packed req;=0A=
>>   		struct {=0A=
>>   			u32 id;=0A=
>>   		} resp;=0A=
>>   	} data;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
>>   =0A=
>>   struct imx_sc_msg_misc_get_soc_uid {=0A=
>>   	struct imx_sc_rpc_msg hdr;=0A=
>>   	u32 uid_low;=0A=
>>   	u32 uid_high;=0A=
>> -- =0A=
>> 2.17.1=0A=
>>=0A=
> =0A=
=0A=
