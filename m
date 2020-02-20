Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32CDF165D79
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 13:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgBTMZm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 07:25:42 -0500
Received: from mail-eopbgr20053.outbound.protection.outlook.com ([40.107.2.53]:62630
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727393AbgBTMZm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Feb 2020 07:25:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq5OiRZyQa9QZVuZyfJQp9TmXwccXBePVEJtge+5YZnf4hw2zSE52dqkNQA1cjWDsHojJFMHH8CXV1v8rLLdiU2lngs0yX3qCzoY7GvBSQy1KRs+S03mrbQ2IwSBlLc4rP0ECihHKDlBcV0JsN215rqYFJ1gbWzYXXVgRU5IJ6p4X0r2/k+RfqFrRO3WToiHsQ/z74iFeyYDmNEbYTM0jUbPcZTb3CLDh7b4XsyWq43mbYx/EfsypVef8KIxRxvxBKMTIZbte15xpXaaFzBkRFHxwakmY9UVimdax8QdOWaGypH7e1XysmZCKqWM0BpzrEJngE3xCe68CUqUs80L9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmAiRV8RnskG8z/fk97UAFLYIffydtsq9IIHtvaZvYQ=;
 b=cOKHVTnetQhKvJol1MdaQFZNhilB3SsO2LM5Xq0c8sN6VUS2c2BDmAtl64jM/yM9q2MsJFaZ/q/6n6R2NHi6N706iK3dyC3+xMPO700dYXLMPOTQlI6saZCbT4nUVhuC059qw5LSUHC3ZodcsVTzOY4gcpm/ALBqM3GDOz99dmD3ud+SMmpk3CTXvbYsZBhNKtfmFY1IDk6NnuL9JYx+Bn7DmE01dIJ4L53xmtiLCTyvdPtDltw03m10Ng/dGn5K37fByEKX2L4E2vcIYElc3hsSNdcb0EIUUCbdOvmkR59HM6zA24WoLPRme3aWbQpIsKuL9YVxirgJpjfJR8rgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmAiRV8RnskG8z/fk97UAFLYIffydtsq9IIHtvaZvYQ=;
 b=M0Jide8HA4vjBYyV/dzxEtJ9cS9FIGQ8p9y2p3TLUxFcVCtxwWZqb0IsdNiLSHrVGuP6Jr4haZCYFT0wHVax78EAYPz6sH857wnxh3F66LhEcp/TDtQotih1iv9x9oOUqpB6rTWZSkJJSXXvepXhiQg5QFN4JJNDMVm3BfFXp/Q=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB5598.eurprd04.prod.outlook.com (20.178.204.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 20 Feb 2020 12:25:36 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 12:25:36 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
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
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] firmware: imx: Align imx SC msg structs to 4
Thread-Topic: [PATCH] firmware: imx: Align imx SC msg structs to 4
Thread-Index: AQHV4SGqSL+k7/w06UOL1nyEN5GYug==
Date:   Thu, 20 Feb 2020 12:25:36 +0000
Message-ID: <VI1PR04MB70230F085F260D01610005FAEE130@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
 <158215662160.184098.12475377410437970578@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a0f2fc90-761e-4c2b-ab34-08d7b5fffd32
x-ms-traffictypediagnostic: VI1PR04MB5598:|VI1PR04MB5598:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5598931785321FD54D9AC0AEEE130@VI1PR04MB5598.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(7416002)(7696005)(71200400001)(91956017)(66946007)(6916009)(6506007)(76116006)(44832011)(66556008)(64756008)(66446008)(66476007)(53546011)(4326008)(81166006)(81156014)(478600001)(55016002)(86362001)(8676002)(26005)(9686003)(54906003)(316002)(5660300002)(52536014)(2906002)(8936002)(186003)(33656002)(505234006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5598;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QsoYM7H8aQYenKyQlFIipagoRs/gKOXZOvxFAx1B8l+/BDhZUR7mvwO4z2flfKgXwiv+Q2Lee1Nz0bP9hgWURanVJ9Ngommx71eCgPlZiIa5KM/qZ4UfjPLdZTUqDGT23ZwDRW41mq+PaZzx6zxDju8pNqIxLATTvjng7xipUWXVLMCc7Rsxe8swkDxegLxwfASf4LVqo7HC6+mhlLRP+KO3QFsGhCKOiDDO9URT2fKTAo0L/zI1BMRBdecenK3KWJcBKAqu8gTf1ZWE68/4byad8DzRbzO47MpxwN8/DHvxbJITf0Z860xGTQbhG8m7122wP4n+sIZwRhrSxVs5lMNYqyDL0TKfdtkCpKx+5TSv0yBdTR2BYv8uq1LDqM7ce09fJw/V8Gpyhsrdz8OQ4eyILUjBFyRHVups6sBd0yMz42uUB70aMSf+VE2F9uaWIIqGrHC+6QgNs772WQPqJau8cWMR6yeFzCe9vIB0h7MmQf5bwPGd86oz9jTBkpk6
x-ms-exchange-antispam-messagedata: uH6BpdcD2C12xZQE8N8ImlsQTdTjzjmjv4eWlT9EJVHiAiPm8Mpv4AXEor+Bin06aTWxxFfh+iO7fcD5IkCQiMwIVShnLxzaLFj0MLsAnu0OUzsX7D1WQGbEBEyQp0emwjs5/CPkiWZcy48a399RRA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f2fc90-761e-4c2b-ab34-08d7b5fffd32
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 12:25:36.4005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16tAsexYxUG/pE7lcNKiv+iQAxSsjg0e8dJCQgfaEHS7KZ+atfV4AdvXSU01jbOP0moaSy8cb1HBUosX0to5TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20.02.2020 01:57, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2020-02-11 13:24:33)=0A=
>> The imx SC api strongly assumes that messages are composed out of=0A=
>> 4-bytes words but some of our message structs have sizeof "6" and "7".=
=0A=
>>=0A=
>> This produces many oopses with CONFIG_KASAN=3Dy:=0A=
>>=0A=
>>          BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0=
=0A=
> =0A=
> Can you share the full kasan bug report instead of the single line?=0A=
=0A=
[    1.606708] imx-scu scu: NXP i.MX SCU Initialized=0A=
[    1.635265] random: fast init done=0A=
[    1.652200] =0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
[    1.659118] BUG: KASAN: stack-out-of-bounds in =0A=
imx_mu_send_data+0x108/0x1f0=0A=
[    1.666046] Read of size 4 at addr ffff0008c80e6bc4 by task swapper/0/1=
=0A=
[    1.672642]=0A=
[    1.674134] CPU: 0 PID: 1 Comm: swapper/0 Not tainted =0A=
5.4.3-03848-g13efcd6 #54=0A=
[    1.681335] Hardware name: Freescale i.MX8QM MEK (DT)=0A=
[    1.686373] Call trace:=0A=
[    1.688815]  dump_backtrace+0x0/0x1e8=0A=
[    1.692458]  show_stack+0x14/0x20=0A=
[    1.695766]  dump_stack+0xe8/0x140=0A=
[    1.699155]  print_address_description.isra.11+0x64/0x348=0A=
[    1.704532]  __kasan_report+0x11c/0x230=0A=
[    1.708356]  kasan_report+0xc/0x18=0A=
[    1.711743]  __asan_load4+0x90/0xb0=0A=
[    1.715218]  imx_mu_send_data+0x108/0x1f0=0A=
[    1.719215]  msg_submit+0x104/0x180=0A=
[    1.722689]  mbox_send_message+0xa8/0x1a0=0A=
[    1.726696]  imx_scu_call_rpc+0x168/0x310=0A=
[    1.730679]  imx_sc_pd_power+0x180/0x1e0=0A=
[    1.734589]  imx_sc_pd_power_on+0x10/0x18=0A=
[    1.738598]  genpd_power_on.part.23+0x118/0x2a8=0A=
[    1.743105]  genpd_runtime_resume+0x138/0x320=0A=
[    1.747454]  __rpm_callback+0xb0/0x1a0=0A=
[    1.751184]  rpm_callback+0x34/0xe0=0A=
[    1.754659]  rpm_resume+0x5b8/0x7e8=0A=
[    1.758137]  __pm_runtime_resume+0x38/0x90=0A=
[    1.762222]  imx_clk_scu_probe+0x5c/0x1c8=0A=
[    1.766218]  platform_drv_probe+0x6c/0xc8=0A=
[    1.770217]  really_probe+0x148/0x428=0A=
[    1.773861]  driver_probe_device+0x74/0x130=0A=
[    1.778031]  __device_attach_driver+0xc4/0xe8=0A=
[    1.782380]  bus_for_each_drv+0xf0/0x158=0A=
[    1.786283]  __device_attach+0x158/0x1d8=0A=
[    1.790195]  device_initial_probe+0x10/0x18=0A=
[    1.794362]  bus_probe_device+0xe0/0xf0=0A=
[    1.798185]  device_add+0x660/0x998=0A=
[    1.801659]  platform_device_add+0x198/0x340=0A=
[    1.805916]  imx_clk_scu_alloc_dev+0x1b8/0x1e8=0A=
[    1.810347]  imx8qxp_clk_probe+0x19d0/0x28b8=0A=
[    1.814601]  platform_drv_probe+0x6c/0xc8=0A=
[    1.818601]  really_probe+0x148/0x428=0A=
[    1.822250]  driver_probe_device+0x74/0x130=0A=
[    1.826423]  __device_attach_driver+0xc4/0xe8=0A=
[    1.830763]  bus_for_each_drv+0xf0/0x158=0A=
[    1.834675]  __device_attach+0x158/0x1d8=0A=
[    1.838583]  device_initial_probe+0x10/0x18=0A=
[    1.842752]  bus_probe_device+0xe0/0xf0=0A=
[    1.846572]  device_add+0x660/0x998=0A=
[    1.850058]  of_device_add+0x74/0x98=0A=
[    1.853610]  of_platform_device_create_pdata+0x11c/0x178=0A=
[    1.858908]  of_platform_bus_create+0x404/0x4f0=0A=
[    1.863425]  of_platform_populate+0x74/0x110=0A=
[    1.867688]  devm_of_platform_populate+0x54/0xb8=0A=
[    1.872291]  imx_scu_probe+0x1b8/0x220=0A=
[    1.876022]  platform_drv_probe+0x6c/0xc8=0A=
[    1.880021]  really_probe+0x148/0x428=0A=
[    1.883671]  driver_probe_device+0x74/0x130=0A=
[    1.887841]  device_driver_attach+0x94/0xa0=0A=
[    1.892010]  __driver_attach+0x70/0x110=0A=
[    1.895832]  bus_for_each_dev+0xe8/0x158=0A=
[    1.899741]  driver_attach+0x30/0x40=0A=
[    1.903303]  bus_add_driver+0x1b0/0x2b8=0A=
[    1.907129]  driver_register+0xbc/0x1d0=0A=
[    1.910947]  __platform_driver_register+0x7c/0x88=0A=
[    1.915653]  imx_scu_driver_init+0x18/0x20=0A=
[    1.919725]  do_one_initcall+0xd4/0x244=0A=
[    1.923552]  kernel_init_freeable+0x238/0x2d4=0A=
[    1.927889]  kernel_init+0x10/0x114=0A=
[    1.931365]  ret_from_fork+0x10/0x18=0A=
[    1.934917]=0A=
[    1.936399] The buggy address belongs to the page:=0A=
[    1.941184] page:fffffe0023003980 refcount:0 mapcount:0 =0A=
mapping:0000000000000000 index:0x0=0A=
[    1.949447] raw: 1ffff00000000000 fffffe0023003988 fffffe0023003988 =0A=
0000000000000000=0A=
[    1.957170] raw: 0000000000000000 0000000000000000 00000000ffffffff =0A=
0000000000000000=0A=
[    1.964894] page dumped because: kasan: bad access detected=0A=
[    1.970449]=0A=
[    1.971933] addr ffff0008c80e6bc4 is located in stack of task =0A=
swapper/0/1 at offset 36 in frame:=0A=
[    1.980708]  imx_sc_pd_power+0x0/0x1e0=0A=
[    1.984442]=0A=
[    1.985917] this frame has 1 object:=0A=
[    1.989481]  [32, 39) 'msg'=0A=
[    1.989484]=0A=
[    1.993732] Memory state around the buggy address:=0A=
[    1.998520]  ffff0008c80e6a80: 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 =
=0A=
f1 00 00=0A=
[    2.005730]  ffff0008c80e6b00: 00 00 f3 f3 f3 f3 00 00 00 00 00 00 00 =
=0A=
00 00 00=0A=
[    2.012940] >ffff0008c80e6b80: 00 00 00 00 f1 f1 f1 f1 07 f2 f2 f2 00 =
=0A=
00 00 00=0A=
[    2.020141]                                            ^=0A=
[    2.025448]  ffff0008c80e6c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
=0A=
00 00 00=0A=
[    2.032659]  ffff0008c80e6c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
=0A=
00 00 00=0A=
[    2.039862] =0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
This is actually from an NXP release branch but code is very close up =0A=
upstream.=0A=
=0A=
>> It shouldn't cause an issues in normal use because these structs are=0A=
>> always allocated on the stack.=0A=
> =0A=
> Is packed necessary for these? I thought that if the beginning of the=0A=
> struct was naturally aligned and there was sometimes a byte or two at=0A=
> the end then having __packed wasn't useful. So maybe it's better to just=
=0A=
> drop __packed on all these structs and let the compiler decide it can=0A=
> add some padding on the stack? Or do we have arrays of these structs=0A=
> sitting in memory all next to each other and they need to be that way to=
=0A=
> be sent through the mailbox?=0A=
=0A=
I'm not sure I understand the question: the structs are __packed because =
=0A=
they represent the binary protocol for communicating with the "System =0A=
Controller".=0A=
=0A=
Without __packed the compiler could insert padding inside the structs =0A=
and break the protocol.=0A=
=0A=
As far as I understand compilers are still allowed to use padding on =0A=
stack since that padding is outside the message struct itself.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
