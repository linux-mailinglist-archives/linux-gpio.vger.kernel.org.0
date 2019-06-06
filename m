Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 979A7376FF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 16:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfFFOlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 10:41:52 -0400
Received: from mail-eopbgr150048.outbound.protection.outlook.com ([40.107.15.48]:49336
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728846AbfFFOlv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Jun 2019 10:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com;
 s=selector1-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wul5xRIF4eGlnBLbd+iC/6i0xaybdJdJi5vXSPtce/k=;
 b=XoZwc0xbVzH94nN+gcux0FEg7XeevIcLbz4PFvLOX+QHrfOcDNjSKZuxG0PN1NSS54FsGtTrLQ236erLcJGhG+L/nGCUaMWDGTmZx6xBhLwem2WnrYfH9rrx6yUxe6eXqu5AAEZRWMzJSMauYHfbNvuLF9+LrAhp5M4+IyAGmbc=
Received: from DB6PR06CA0001.eurprd06.prod.outlook.com (2603:10a6:6:1::14) by
 HE1PR0601MB2587.eurprd06.prod.outlook.com (2603:10a6:3:53::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 14:41:46 +0000
Received: from AM5EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2a01:111:f400:7e1e::208) by DB6PR06CA0001.outlook.office365.com
 (2603:10a6:6:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 14:41:45 +0000
Authentication-Results: spf=pass (sender IP is 188.184.36.50)
 smtp.mailfrom=cern.ch; metux.net; dkim=none (message not signed)
 header.d=none;metux.net; dmarc=bestguesspass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.50; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.50) by
 AM5EUR02FT031.mail.protection.outlook.com (10.152.8.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 14:41:45 +0000
Received: from cernfe04.cern.ch (188.184.36.41) by cernmxgwlb4.cern.ch
 (188.184.36.50) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 6 Jun
 2019 16:41:40 +0200
Received: from pcbe13614.localnet (2001:1458:202:121::100:40) by smtp.cern.ch
 (2001:1458:201:66::100:14) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 6 Jun 2019 16:41:41 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Reply-To: <federico.vaga@cern.ch>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Date:   Thu, 6 Jun 2019 16:41:40 +0200
Message-ID: <19747274.VuuCNqAmkf@pcbe13614>
In-Reply-To: <559a0d26-5abe-093e-0d4b-05d244dc1e35@metux.net>
References: <20190603230604.30938-1-linus.walleij@linaro.org> <51993170.yLCrTtoNgA@pcbe13614> <559a0d26-5abe-093e-0d4b-05d244dc1e35@metux.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [2001:1458:202:121::100:40]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:188.184.36.50;IPV:NLI;CTRY:CH;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(52314003)(189003)(199004)(45904002)(476003)(305945005)(7736002)(7636002)(336012)(6246003)(426003)(70206006)(70586007)(54906003)(486006)(46406003)(3450700001)(316002)(126002)(26005)(229853002)(16526019)(186003)(106002)(2906002)(50466002)(86362001)(6306002)(97756001)(9686003)(446003)(9576002)(4326008)(53546011)(230700001)(478600001)(44832011)(8676002)(8936002)(356004)(246002)(11346002)(5024004)(14444005)(33716001)(43066004)(6916009)(76176011)(74482002)(47776003)(23726003)(966005)(5660300002)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0601MB2587;H:cernmxgwlb4.cern.ch;FPR:;SPF:Pass;LANG:en;PTR:cernmx11.cern.ch;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b5f1a68-097d-4d74-caa9-08d6ea8d1955
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);SRVR:HE1PR0601MB2587;
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2587:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <HE1PR0601MB258736A50D7BDC045C173799EF170@HE1PR0601MB2587.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RiHiRRMzEtvjFSh5+Mj8b9aknB1wDSo0HsViMuFokLoZA4Y0w8DFp0kLgE5z5W3hV0t0WTqb2kS+19VieXeo80qVXMZRjASWNBpZWZ1pZxGMn1+kTc/6dDNgH42Tm7y/A2Fpn1q6+M+6NlqXhfSSSIDCblcMMneZMtsnoMK4itfQwewsb9NSK6E6fxp5OHQVProXcWn8dHri0VonYg8xBg+/a5JzNZqsi3vGdWUP+t3VBhwzfe/+JOgr+5iOqfP6OR9Y+vWhirXiTL0Apt7zg1gDigmpq8SCukHU64WY3s0fOkM0UPwcBM80FWDZw8MmD+8wQsmujUZkR/Mf/fRNPlMc7d+XrAKnUR8DrlqQ17N6eKsVar7DAOpi993MpVxPZOKZQdIf1i054bqjhgcj3wtIcQfcyUW1nb1ssS2D+nI=
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 14:41:45.3453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5f1a68-097d-4d74-caa9-08d6ea8d1955
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[188.184.36.50];Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2587
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thursday, June 6, 2019 3:58:35 PM CEST Enrico Weigelt, metux IT consult 
wrote:
> On 05.06.19 09:55, Federico Vaga wrote:
> > Hello Enrico,
> > 
> > from your questions is clear that you do not know the fmc-bus and neither
> > the VITA-57.1 (FMC) standard or the IPMI FRU specification.
> 
> Ideed, I never came anywhere near it. (guess, that applies to most
> people here). So, forgive me for asking some stupid questions.
> 
> > Some of your questions
> > are answered by those documents (VITA-57.1, Platform Management FRU
> > Information Storage Definition V1.0, fmc-bus documentation in
> > Documentation/ fmc);
> 
> thanks, I'm just reading the kernel docs (unfortunately lacking the time
> to work through the whole specs).
> 
> Let me some more stupid questions:
> 
> * am I'm correctly assuming that there can be different FMCs, which in
>   turn can be deployed with different application specific bitfiles ?

yes

> * could the SDB data be dynamically changed at runtime ?
>   does it make sense to expose it as an actual fs to userland ?
> * is not having the SDB data a common usecase ?

SDB is something that has been attached to FMC but actually is totally 
unrelated. There were plans about it in the past but they have been abandon.

> * GPIO: are these actually in the carrier itself (not on the cards
>   plugged into it) ? Who's gonna consume them ? (also userland ?)
>   Can we implement this as generic gpio drivers and use
>   gpiod_lookup_table ?

There are no relations between GPIO and FMC. GPIO usage is design specific, 
and in particular specific to the carrier not the modules.


> * chardev: is some kinda /dev/mem for the fmc devices ?
>   is it used by applications or just development ?

probably development. At least at CERN nobody uses it; it has been used to 
hack around at the very beginning

> * eeprom: should we introduce an actual eeprom device class ?
>   several years ago, somebody was working on that, but don't know
>   what happended it it:
>   https://lore.kernel.org/patchwork/patch/436179/

I do not think is necessary. The kernel has support for I2C, it has support to 
the FMC standard EEPROM. They are easy to configure

> By the way: looks like the git repos aren't publiclly accessible:
> (gitlab web frontend seems to work)
>
> >> nekrad@orion:~/src/fmc$ git clone -vvvv
> 
> git://ohwr.org/hdl-core-lib/fpga-config-space.git
>
> >> Cloning into 'fpga-config-space'...
> >> fatal: unable to connect to ohwr.org:
> >> ohwr.org[0: 188.185.83.37]: errno=Connection timed out
> >> 
> >> nekrad@orion:~/src/fmc$ git clone
> 
> https://ohwr.org/project/fpga-config-space.git
> 
> >> Cloning into 'fpga-config-space'...
> >> fatal: unable to access
> 
> 'https://ohwr.org/project/fpga-config-space.git/': gnutls_handshake()
> failed: Handshake failed

I can report the error, but as you can see that project is abandon. 

> >> So, this is some special backplane bus ?
> > 
> > Despite the fact that FMC on Linux is a Linux bus (a mechanism to match
> > devices and driver with some logic), it is not a real bus. Form software
> > prospective it is an I2C EEPROM that identifies an FMC module. A part from
> > this connection with the host, the FMC module is not accessible. All
> > accesses pass through an FPGA which interface is not in a one-to-one
> > relation with any FMC module.
> > 
> > VITA-57.1 standardize the connection between an FPGA and an FMC module. In
> > addition it offers this I2C interface to identify the connected FMC
> > module(s).
> I guess the connection to the host is very FMC specific. Which
> IO operations can we do here ? Just register read/write ?

It is not FMC specific. FMC is just a connector that you can use to extend a 
PCI/VME/USB/ISA/SPI/... card

> Might that be a case for regmap ?
> 
> I'm imagining giving struct fmc_operations a ref (or get/put) to a
> regmap instance instead of readl()/writel() operations. That way,
> subdevice drivers (for some generic logic inside the fpga, eg. a uart,
> gpio, etc) don't need to be fmc-aware at all - they'd just be
> initialized by some bitfile-specific parent driver.
> 
> By the way: is there already name for bitfile specific devices ?
> (maybe call it "fmc payload" ?)
> 
> >> Is that information ("card X is in slot Y", correct ?) important for the
> >> drivers or even userland ?
> > 
> > This sort of information is always important when you what to be able to
> > distinguish cards when you look at then with your eyes, or when those FMC
> > modules are used to create a network with external equipment
> 
> Aha, so it's something that an operator needs to know, like "this is
> the first uart" or "that's the 3rd eth port" ?

Yes
 
> >> Are there some known cases where a different eeprom is used ?
> > 
> > For example, all open-hardware designs that my group at CERN is producing,
> > but there are more out there which are "not standard". This happened
> > because, as I wrote and VITA admitted, the standard is open to
> > misinterpretation; VITA promised to fix it on the next revision.
> 
> hmm, is there any way for probing the eeprom type or is that something
> the operator needs to know/configure ?

In principle there is only one correct EEPROM: 24C02. Any other eeprom is non-
standard, so the operator must know what to do in that specific case.

> Not sure whether I really understood the whole, so I'll try to
> summarize - correct me if I'm wrong:
> 
> * each FMC carries an i2c eeprom with the SDB data, and potentially
>   extra payload specific data (eg. sdbfs)

No.
FMc Modules (plugged on FMC carriers) carry an I2C EEPROM with the "Platform
Management FRU Information Storage Definition V1.0."

> * there may be different eeprom types (speaking different protocols)

According to the standard no. But since the standard is unclear, people 
misunderstood this point, so it is possible to have different eeproms

> * this i2c eeprom is connected to an i2c controller on the carrier

Yes

> * cpu can talk to the carrier in order to do i2c transactions
>   (thus, from cpu pov, the carrier implements an an i2c controller
>   that's connected to that eeprom)

yes

> * the i2c controller type (more precisely: the cpu-visible protocol)
>   is known by carrier type

yes

> Are this standard i2c controllers that are already supported by the
> i2c subsystem ?

There is not a standard I2C controller. It is a carrier design choice

> >>  > As stated before, there is no such thing as an "FMC module driver",
> >>  > nor a "device driver for the FPGA code".
> >> 
> >> Oh, seems I had a wrong idea of that. Do the individual module types
> >> differ - from cpu pov - in anyway, despite the bitfile specific
> >> interfaces ?
> > 
> > I am not sure to understand your question
> 
> My question is whether the FMCs, besides the current bitfile in FPGA,
> differ from host point of view. IOW: does the host need to care about
> the actual FMC type, before we have an actual bitfile loaded ?
> (maybe fpga specific upload protocols or check whether bitfile fits
> that FMC ?)

It depends on the context. If your FPGA is empty and you want to load a new 
configuration then you should check the type of FMC Module plugged in order to 
avoid to "burn" it (really rare, but it could happen)

> >> Who shall be responsible for instantiating these platform devices ?
> >> Maybe oftree overlays ?
> > 
> > Could be DeviceTree, ACPI descriptors, or another driver. There are plenty
> > of possibilities. I have noticed that DeviceTree is extensively used in
> > some context.
> 
> So, this part isn't defined yet ?

It does not need to be defined. It is out of scope. How FPGA devices are 
declare is a general problem, not and FMC problem

> How is that currrently handled ?

The way fmc-bus is designed, does not need to discover FPGA devices.

> Could you put a dtb directly in the FPGA, at some defined address ?

In general yes. Why not?
 
> Some quick idea floating around in my head: we could place a dtb
> right next to the bitfile (one dtb per bitfile), and when fpga payload
> is up and running, start dt-based probing of platform devices.

Yes it is a possibility but 

> hmm, there're several things, I'd like to put on my fun-project-list.

Well, I am suggesting to erase fmc-bus from the Linux kernel and to provide a 
device_class for a standardized way to access that I2C EEPROM. I already have 
the implementation; perhaps it needs some clean-up and for sure to be ported 
to 5.x (I will do this job only if there is interest in removing/replacing the 
current fmc subsystem).

I can tell you that it is not that funny :D
it is only 484 line of code, most of them to handle the special case where the 
EEPROM is not-standard.

> Do you happen to have some remote-accesible testbed for playground ?

Of course not :D
CERN infrastructure is not freely accessible

> 
> --mtx




