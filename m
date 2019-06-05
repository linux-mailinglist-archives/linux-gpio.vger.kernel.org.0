Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF3C3581B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 09:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfFEH4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 03:56:19 -0400
Received: from mail-eopbgr130077.outbound.protection.outlook.com ([40.107.13.77]:39076
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726543AbfFEH4S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Jun 2019 03:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com;
 s=selector1-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj2xUrvt8QrdbojlbGD45elxuQ/1OswJGMOcRxCUBJc=;
 b=hQmj8AQ3O4wwstRsSAy31pyWX44x0Kk+++Osck61PxU6sXPgXXKzpgP1H+tF6CNjno8onCpvyo5ZnM/GHoCSOMDuB0X2n3c4kvnBbfE5HNLAS4UZ4eRd5qfgFLwDb6OLmU/WGuiOwc901Blpi6lhiHzdFAJX3ynf5fcvCtJvelA=
Received: from AM0PR06CA0063.eurprd06.prod.outlook.com (2603:10a6:208:aa::40)
 by VI1PR06MB4173.eurprd06.prod.outlook.com (2603:10a6:803:71::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Wed, 5 Jun
 2019 07:56:13 +0000
Received: from AM5EUR02FT052.eop-EUR02.prod.protection.outlook.com
 (2a01:111:f400:7e1e::205) by AM0PR06CA0063.outlook.office365.com
 (2603:10a6:208:aa::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.21 via Frontend
 Transport; Wed, 5 Jun 2019 07:56:12 +0000
Authentication-Results: spf=pass (sender IP is 188.184.36.48)
 smtp.mailfrom=cern.ch; metux.net; dkim=none (message not signed)
 header.d=none;metux.net; dmarc=bestguesspass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.48 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.48; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.48) by
 AM5EUR02FT052.mail.protection.outlook.com (10.152.9.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Wed, 5 Jun 2019 07:56:12 +0000
Received: from cernfe04.cern.ch (188.184.36.41) by cernmxgwlb4.cern.ch
 (188.184.36.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 5 Jun
 2019 09:56:00 +0200
Received: from pcbe13614.localnet (2001:1458:202:121::100:40) by smtp.cern.ch
 (2001:1458:201:66::100:14) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 5 Jun 2019 09:56:00 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Reply-To: <federico.vaga@cern.ch>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Date:   Wed, 5 Jun 2019 09:55:59 +0200
Message-ID: <51993170.yLCrTtoNgA@pcbe13614>
In-Reply-To: <4f4b2dc0-2ad3-4e0a-ee12-c2755e810600@metux.net>
References: <20190603230604.30938-1-linus.walleij@linaro.org> <22282873.PltXLBtAh5@pcbe13614> <4f4b2dc0-2ad3-4e0a-ee12-c2755e810600@metux.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [2001:1458:202:121::100:40]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:188.184.36.48;IPV:NLI;CTRY:CH;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(52314003)(189003)(199004)(126002)(43066004)(46406003)(26005)(486006)(44832011)(446003)(11346002)(476003)(54906003)(186003)(106002)(356004)(6246003)(966005)(7736002)(7636002)(6116002)(426003)(336012)(23726003)(70206006)(305945005)(6916009)(478600001)(246002)(74482002)(229853002)(50466002)(70586007)(8676002)(3450700001)(47776003)(53546011)(9576002)(16526019)(86362001)(2906002)(76176011)(8936002)(561944003)(316002)(33716001)(9686003)(4326008)(6306002)(5660300002)(230700001)(30864003)(14444005)(97756001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR06MB4173;H:cernmxgwlb4.cern.ch;FPR:;SPF:Pass;LANG:en;PTR:cernmx12.cern.ch;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41d98c4f-d7c8-4e2a-b128-08d6e98b4773
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);SRVR:VI1PR06MB4173;
X-MS-TrafficTypeDiagnostic: VI1PR06MB4173:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <VI1PR06MB4173F1B352600053D2F26701EF160@VI1PR06MB4173.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FZMZ1ewogxDAaXHe0TfE0B1tuGUESDSbJ1joNkIBIv4EBx4x2yoyFkHKVaPaqbhQoAZvtl6tVcX+gLNZVjBfkIx6sbRheJRZl+0NKCJUy/8+9RiYhMDrdSvvLnTk2d+QZ4V+0lYyzIuCHLXNngJbewa5LoH/NiS5GKaoXGP20l00Ju1nPS3VInsqSMCljKB0i2Nh0DrEayK7rvaEwcnRMcgdNAiOnTa1/gDFLx7vZTMZQg2lxWb8UzcrIq3uPftrPwYpg4l5zyp8VDr6tLN4bkb60Fbjl/P2SA60HRg0KT3Me9eGTobQQHzzQR4ASK4Qzqc+HNd78i2vsMlvTdVnqC/OIB/SLNU5s3nQX9+eDGmnsNUdwlJimTmCwAESHFcqGIFDUKs9XojBbTrDOAJHsY3zqvh9oheiWj8/qOYNkoI=
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 07:56:12.5602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d98c4f-d7c8-4e2a-b128-08d6e98b4773
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[188.184.36.48];Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4173
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Enrico,

from your questions is clear that you do not know the fmc-bus and neither the 
VITA-57.1 (FMC) standard or the IPMI FRU specification. Some of your questions 
are answered by those documents (VITA-57.1, Platform Management FRU 
Information Storage Definition V1.0, fmc-bus documentation in Documentation/
fmc); of course you want to understand but I think is better if you read those 
documents first because I do not want to answer to direct questions without 
having all the background knowledge supporting it (the risk is that out of 
context they are open to misinterpretation).

So, I will focus my answer only on those point which are not covered there.

On Tuesday, June 4, 2019 7:24:46 PM CEST Enrico Weigelt, metux IT consult 
wrote:
> On 04.06.19 06:42, Federico Vaga wrote:
> > Hello Linus,
> > 
> > I take this occasion to renovate my proposal
> > 
> > https://lkml.org/lkml/2018/10/29/534
> 
> Is CERN open to invest resources into it (eg. manpower
> or sponsoring) ?
> 
> Just a few questions on your original proposal:
>  >> The FMC Standard
>  >> ----------------
>  >> 
>  >> The FMC standard (`VITA-57.1`_) describes FMC modules and carriers
>  >> from the mechanical and the electrical point of view. `VITA-57.1`_
>  >> also specifies the information stored in the (mandatory) EEPROM on
>  >> the FMC module.
> 
> So, this is some special backplane bus ?

Despite the fact that FMC on Linux is a Linux bus (a mechanism to match 
devices and driver with some logic), it is not a real bus. Form software 
prospective it is an I2C EEPROM that identifies an FMC module. A part from 
this connection with the host, the FMC module is not accessible. All accesses 
pass through an FPGA which interface is not in a one-to-one relation with any 
FMC module.

VITA-57.1 standardize the connection between an FPGA and an FMC module. In 
addition it offers this I2C interface to identify the connected FMC module(s).
 
> Does the host (linux machine) also act as a module or more like a pci
> host bridge ? In the latter case it IMHO smells like it deservces its
> own bus type (which also cares about things like probing logic)
> 
>  >> On the other hand, `VITA-57.1`_ does not specify at all how FMC
>  >> carriers and its FMC modules communicate.
> 
> <snip>
> 
>  >> 5.5 I2C bus signal
>  >> 
>  >>  This chapter specifies that an I2C bus connecting an FMC carrier
>  >>  and its FMC modules is mandatory. Consequently, it specifies the FMC
>  >>  signals that are reserved for that purpose.
>  >>  
>  >>  By this chapter, an FMC module must contain an EEPROM connected to
>  >> 
>  >> that
>  >> 
>  >>  I2C bus. The purpose of this EEPROM is to store
>  >>  *hardware definition information* using the
>  >>  `Platform Management FRU Information Storage Definition V1.0`_
> 
> Does the fmc carrier have an i2c controller, which in turn the host
> cpu can speak with ? Is that one directly accessible on the CPUs
> mem/io bus or do we need some extra transport layer (regmap) ?
> 
>  >  So, from a software point of view, we are interested in reading the FRU
>  >  
>  >  information that provides useful data to identify the FMC modules, and
>  >  to do so at a standardized I2C address and EEPROM programming interface.
> 
> Does that eeprom contain just some model ID (similar to eg. PCI IDs) ?
> Or maybe something more detailed, similar to oftree or acpi ?
> 
>  > 5.6 Geographical address
>  > 
>  >  This chapter describes how to address the different I2C devices hosted
>  >  in the FMC mezzanines that live in a single FMC carrier.
> 
> What are "FMC mezzanines" ? Specific combinations of cards ?
> Do they form some kind of composite device ?
> 
>  >  As the
>  >  standard specifies up to four mezzanines per I2C bus, it enforces the
>  >  convention that the two least significant bits of the I2C address
>  >  identify the slot.
>  >  For example, the mandatory I2C EEPROM must be addressable at the 7-bit
>  >  address b10100XX, the suffix XX=00,01,10,11 determining the geographical
>  >  addressing of the module in the carrier. Other I2C devices follow
> 
> the same
> 
>  >  schema.
> 
> Is that information ("card X is in slot Y", correct ?) important for the
> drivers or even userland ?

This sort of information is always important when you what to be able to 
distinguish cards when you look at then with your eyes, or when those FMC 
modules are used to create a network with external equipment

>  > The main wrong assumption in the Linux fmc-bus is the idea that
>  > drivers
>  > are bound to FMC modules through the carrier FPGA: this is not true.
> 
> hmm, smells a bit similar to having a generic FPGA card in PCI, where
> we can probe the card model itself, but yet have to load a bitfile to
> do something useful with it. correct ?
> 
> Maybe introduce an own bus_type - similar to eg. pci, let the carriers
> be host adapters and the module bus devices. Then it should be pretty
> much the same scenario like fpga's on pci cards. IMHO.
> 
>  > Behind this lies another wrong assumption: that FMC modules are in a
>  > one-to-one relationship with the FPGA code: this is wrong. The actual
>  > relationship is one-to-many: one FMC module can be driven by many FPGA
>  > code designs, which might be wildly varying. The real behavior of a
>  > card (FMC carrier + FMC module[s]) is determined by the FPGA code that
>  > has been loaded on the FPGA.
> 
> Is there a way to dynamically identify the currently loaded bitfiles ?
> Can the fpga's be directly memory mapped to cpu ?
> 
> My favourite approach would be putting an oftree into the the fpga, on
> some fixed address. Then the individual module could also be treated
> as bus adapters, which probe the in-bitfile-devices as platform devices
> via oftee.
> 
>  > We can have an FMC module with a simple 5 digital I/O channel. We all
>  > know that such module is versatile, so we can have FPGA code that
>  > implements: two I2C masters, an SPI master, a GPIO interface, a TDC,
>  > custom logic. In all these cases the FMC module is the same but the
>  > FPGA code that drives it is different,
>  > as well as the Linux driver that should drive it.
> 
> hmm, so the module driver somehow has to do the probing, after the
> actual bitfile is loaded.
> 
>  > So, the fmc-bus design is wrong in trying to match devices and drivers
>  > using
>  > the FRU information from the FMC module EEPROM.
> 
> IMHO depending on the exact definition of the term "devices and drivers.
> We'd need to split it into two layers - one for the hardware module,
> another one for the payloads. I believe the approach I've mentioned
> above are a good way to do it.
> 
> On a highlevel view this scenario shouldn't be so different from having
> an USB host on a PCI card and arbitrarily replacable usb devices behind
> that. But here replacing devices is done by software (bitfile upload).
> 
>  > FMC Device Class
>  > ----------------
>  > I propose to retain all the functionality of the fmc-bus that should
>  > remain (see below) in a kernel module implementing an FMC device class
>  > that registers the presence of individual FMC modules.
> 
> I believe it should actually be a fmc bus_type, so we can benefit from
> lots of code for the probing / (sub)device instantiation.
> 
> Few years go I've did a similar approach with some strange railways
> backplane system. The usecase was a little bit less complex (basically,
> a memmapped fpga that implements a bunch of proprietary serial pipes
> and the cards behind them).
> 
>  > FPGA Manager
>  > 
>  >  The Linux fmc-bus asks the FMC carrier driver to export the necessary
>  >  operations to program the FMC carrier FPGA. Currently, this is handled
>  >  by the Linux kernel FPGA manager subsystem.
> 
> Can it already trigger some probing ?
> 
>  >  So, the FMC carrier driver should create a device instance for the FPGA
> 
>    manager.
> 
> The bitfile loading is done by the carrier, not the modules ?
> 
>  > I2C Master Driver
>  > 
>  >  The Linux fmc-bus current implementation asks the FMC carrier
> 
> drivers > to
> 
>  >  implement the I2C operations in order to access the EEPROM. In
> 
> theory > this
> 
>  >  is not really necessary; Linux provides a nice I2C sub-system for this
>  >  purpose. Only the particular I2C master instance needs to be
> 
> registered by
> 
>  >  the FMC carrier driver.
> 
> Are these standard i2c controllers ?
> 
>  > EEPROM Driver
>  > 
>  >   The Linux fmc-bus uses the I2C programming interface of an FMC
> 
> module EEPROM
> 
>  >  to extract its contents, in particular the module identification for
> 
> driver
> 
>  >  Again, this is rendered superfluous by the Linux kernel I2C EEPROM
>  >  drivers. There is, however, a difficulty with the particular EEPROM
>  >  to use: which one is it? `VITA-57.1`_ is unclear about this.
> 
>  >  rule 5.69 about what kind of EEPROM is mandatory:
> Seems plausible.
> 
>  >  to support 24C02 EEPROMs. Support of other EEPROMs should not be
>  >  excluded, though, as `VITA-57.1`_ is admittedly open
>  > 
>  > misinterpretaion
>  > 
>  >  on this point.
> 
> Are there some known cases where a different eeprom is used ?

For example, all open-hardware designs that my group at CERN is producing, but 
there are more out there which are "not standard". This happened because, as I 
wrote and VITA admitted, the standard is open to misinterpretation; VITA 
promised to fix it on the next revision.

> 
>  > IRQ Controller
>  > 
>  >  The Linux fmc-bus asks the FMC carrier to implement the operations to
>  >  request, free and acknowledge interrupts. This is necessary because
>  >  FMC modules plugged into an FMC carrier share the unique interrupt
>  >  line or vector of the latter. However, this function does not belong
>  >  in the fmc-bus. As the obvious need for such logic suggests,
>  >  the FMC carrier contains interrupt routing logic; thus, an IRQ
>  >  controller is the proper way to handle this.
> 
> Agreed.
> 
>  > As stated before, there is no such thing as an "FMC module driver",
>  > nor a "device driver for the FPGA code".
> 
> Oh, seems I had a wrong idea of that. Do the individual module types
> differ - from cpu pov - in anyway, despite the bitfile specific
> interfaces ?

I am not sure to understand your question

> If not, what's the actual purpose of the eeprom data ?
> 
>  > So, the only way I see it possible is by using platform drivers for
>  > the *FPGA internal devices*. The description of the internal devices
>  > is not within the scope of the FMC software layer.
> 
> Who shall be responsible for instantiating these platform devices ?
> Maybe oftree overlays ?

Could be DeviceTree, ACPI descriptors, or another driver. There are plenty of 
possibilities. I have noticed that DeviceTree is extensively used in some 
context.

> 
> --mtx




