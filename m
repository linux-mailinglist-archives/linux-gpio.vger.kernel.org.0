Return-Path: <linux-gpio+bounces-15965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A967EA34F4C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 21:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5169E16D67E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D47B257AF1;
	Thu, 13 Feb 2025 20:24:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0DB2222DE;
	Thu, 13 Feb 2025 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739478259; cv=none; b=eX8kgU8lGsuFAcmDjmcoFRMunt+J09H18LdVyBPWwf2LHZ8Fh09iwT7EXZ09DgH4+C47z8taMiZboyRRJl3ShiYrTWmir9YgNWXF1qILMTCD0AzGhYKFSTFPpyXZicEE1jarK3Kml0v+fG6m9f/038TEkZ9VfrwLASnCBroMIds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739478259; c=relaxed/simple;
	bh=D2YETnVgFrI7hLRiidm23TMJLYAHSLeT0TpoXHZ/UJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfDI9w9HOR8NitbfIfuziv7I0WMRN1eTihUaccVvOmLbJ9WeNkivmDNFmcYQEW0X/asK9TxVA2SWaIL2SH1wmAyFlKp6wW7IUFAvRq8+Z3m/9MkMn7DsIGDi99kFIY//fCiNZzaNgaw2j/5g/Qov8v7n00f/NiCx+/WjfYBwwm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C5CF113E;
	Thu, 13 Feb 2025 12:24:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E747B3F58B;
	Thu, 13 Feb 2025 12:24:10 -0800 (PST)
Date: Thu, 13 Feb 2025 20:23:53 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z65U2SMwSiOFYC0v@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>

On Thu, Feb 13, 2025 at 12:03:15AM -0800, Saravana Kannan wrote:
> On Wed, Feb 12, 2025 at 2:48 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >

Hi Saravana,

> > On Wed, Feb 12, 2025 at 03:01:20PM +0800, Peng Fan wrote:
> > > On Tue, Feb 11, 2025 at 05:13:21PM +0000, Sudeep Holla wrote:
> > > >On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> > > >> From: Peng Fan <peng.fan@nxp.com>
> > > >>

[snip]

> 
> Cristian,
> 
> Thanks for taking the time to give a detailed description here[1]. I
> seem to have missed that email.
> [1] - https://lore.kernel.org/arm-scmi/ZryUgTOVr_haiHuh@pluto/
> 
> Peng/Cristian,
> 
> Yes, we can have the driver core ignore this device for fw_devlink by
> looking at some flag on the device (and not on the fwnode). But that
> is just kicking the can down the road. We could easily end up with two

Oh yes this is definitely some sort of hack/workaround that just kicks
the can down the road, I agree...just I cannot see any better solution
from what Peng propose (beside maybe we can discuss his implementation
details as we are doing...)

> SCMI devices needing a separate set of consumers. For example,
> something like below can have two SCMI devices A and B created where
> only A needs the mboxes and only B needs shmem and power-domains. This

..not really...it is even worse :P ... the mbox/shmem props down below are
really definition of a mailbox transport SCMI channel: some transports
allow multiple channels to be defined and in such case you can dedicate
one channel to a specific protocol...

...so, in this case, you will see there will be something similar defined
in terms of mboxes/shmem at the top SCMI DT node to represent an SCMI channel
used for all the protocols WHILE this additional definition inside the
protocol node defines a dedicated channel...IOW these props mboxes/shmem
are really parsed/consumed upfront by the core SCMI stack at probe to
configure and allocare basic comms channel BEFORE any SCMI device is created
...then the protocol DT node is no more used by the core and is instead 'lent'
to create SCMI devices for the drivers needing them...(possibly lending it to
multiple users...that is the issue) 

> will get messy even for drivers if the driver for A optionally needs
> power-domains on some machines, but not this one.
> 
>         firmware {
>                 scmi {
>                         compatible = "arm,scmi";
>                         scmi_dvfs: protocol@13 {
>                                 reg = <0x13>;
>                                 #clock-cells = <1>;
>                                 mbox-names = "tx", "rx";
>                                 mboxes = <&mailbox 1 0 &mailbox 1 1>;
>                                 shmem = <&cpu_scp_hpri0 &cpu_scp_hpri1>;
>                                 power-domains = <&blah>;
>                         };
> 
> Wait a sec, looking around at the SCMI code, I just realized that you
> don't even really care about the node name to get the protocol number
> and you just look at "reg" for protocol number. Why not just have
> peng's device have two protocol@13 DT nodes?
> 
> cpufreq@13 {
>     reg = <0x13>;
> }
> whateverelse@13 {
>     reg = <0x13>;
> }
> 
> You can also probably throw in a compatible field if you need to help
> the drivers pick the right node (where they currently pick the same
> node). Or you can do whatever else would help make sure the cpufreq
> device is attached to the cpufreq node and the whateverelse device is
> attached to the whateverelse node.

..well...my longer-than-ever explanation of the innner-workings was
meant to explain where the problem comes from, and how would be difficult
to address it WITHOUT changing the DT bindings, BECAUE I pretty much doubt
that throwing into the mix also multiple nodes definitions and compatibles
could fly with the DT maintainers, AND certainly it will go against the basic
rules for 'reg-indexed' properties ...you cannot have 2 prop indexed with the
same reg-value AFAIK...and the reg-value, here, is indeed the spec protocol
number so you cannot change that either within the set of nodes sharing
the same prop....

...moreover the above additional construct of having possibly per-protocol
channels would create even more a mess in this scenario of explicitly
declared duplicated protocol-nodes:
 
- should we duplicate the optional mbox/shmem too ? not possible...DT sanity
  would fail immediately also in this (I suppose due to duplicated entries)

...BUT

- at the same time we should assume that ALL the duplicated protocols inherits
the optional per-protocol dedicated channel that is defined in one of
them...seems very dirty to me...

...moreover...explicitly allowing for such duplicate DT protocol definitions
would open the door to create even more SCMI drivers like pinctrl-imx that
uses the same PINCTRL protocol as the generic-pinctrl BUT really implements
the SAME functionalities as the generic one (just slightly differently
and using a complete distinct set of NXP pinctrl bindings for historical
reasons AFAIU)....BUT pinctrl-imx is an *unfortunate* exception that we had
to support for the historical reason I mentioned BUT should NOT be the rule
NOR the advised way...

....while other drivers exists that share the usage of the same protocol
(HWMON/IIO GENPD/CPUFREQ), they use the same protocol to achieve different
things in different subsytems...and they are anyway impacted (even to a less
degree) by this fw_devlink issue AFAIU so the problem indeed exist also
out of pinctrl-imx

> 
> Looks like that'll first help clean up the "two devices for one node"
> issue. And then the rest should just work? Cristian, am I missing
> anything?

Yes that is the main issue...but still dont see how to solve it in a
clean way...

Thanks,
Cristian

