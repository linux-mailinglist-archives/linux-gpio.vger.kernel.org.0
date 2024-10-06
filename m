Return-Path: <linux-gpio+bounces-10899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFB991E14
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 13:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A8F8B21932
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 11:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0232176ACB;
	Sun,  6 Oct 2024 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H4fDhIR/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FFC17625F
	for <linux-gpio@vger.kernel.org>; Sun,  6 Oct 2024 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728213644; cv=none; b=QoZA2eOFeyIwhHhYIVreQLD5ey4Xe/2bRLhr2qu1BMjIfgSc7BHL8cFwGifeuwqXtymM/AWeprmhNmiUcOfwP+lnxkMBH4paNOW+JHvoO40IzfwKt4GRxrCjfQP9I02BwXa+tBIvrvqPF3bS8sCnEOsoIYEegZnkhph9YcpuUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728213644; c=relaxed/simple;
	bh=xwtqRkymQbWLyrHFQs3l8k1xM6HJQbYROF9P9jVE/4Q=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyLmkyE1lxRrgRsdMJbNe+DKTCt4+jJ2oAiR6+Hd24lB9NTQ2MduSsNvgJZsyCS1oExm5Za3A44y16J56Q0UUsdmyTYxB5vtOlSYPLQI6U/0QkfbajBdL3drHsd64yKDSaF1EQeQW+W2JfmDvkjsNlEtrBzShZ8LWuOt2Mofl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H4fDhIR/; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5c8784e3bc8so4819401a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2024 04:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728213641; x=1728818441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPsiLERRYU7D4j4sUXncuZrtdOCgoc8Hb9DOFm6I+ts=;
        b=H4fDhIR/jUnUJLOL4s73skEwo5qT+KAQdjwxLM2Ekz/Yfd3KBTlBBYN58+qucb9FMT
         H+h3H3YYaysKYcjGw/Qu8omgTDePQtYE9Ii8JWiy7Se7YFW/7r0wE2rGauAIjS143L13
         onrxybd2iLH/0/CPQRkgCeMfISA5xdDmGJl7r0EUEyu6ZJfmBroZIQi3RV60oqJ9bNko
         Tp99pLtsDhHfZfRWbU76+JSmmdTFGlrbFuA9nRWuJ2pRlZbwDVHbZLCL2bykcpNCOFXA
         V/zYgg2O0JhNNzllhTNJYhH3JV9fJN1hUC0S1ZMXVzRW4DAUZt+Q58FV3ZIWlYALktuf
         qCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728213641; x=1728818441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPsiLERRYU7D4j4sUXncuZrtdOCgoc8Hb9DOFm6I+ts=;
        b=mBhek3wl9ZPZS9RVCy89ZUS1x39rk8SPJmu/6jEn1DkNfsj3hSCxkZNuejIeobQflw
         0Hp8r11HMZdQuTaqlVi7xAYuo0s256K5yEaJYV5GMhkT0T7UCWPaTujSvizEbsYc+LyQ
         wiNpVXuWRAHp+VhKs9SYp+oed9B4ie7lpr4QsdDAGtJrGyYcg1LUiTn2qEwd3fbrcLZk
         QgK8zO6jNOi5EEHx0raU83IJzkEnczPReqbu+cTKwo4ZllT82HcdiCaOa4QKOcob1NXY
         hjaV5E2qST9KxYGiLYqHIaOrrluvNnq74le1tCrNmdaB/IWcJugKRh9xeDIv+lf8ioCs
         Sn9A==
X-Forwarded-Encrypted: i=1; AJvYcCXVebdop3zLUcD88UXHSK4/rygP8Kf2xXCS0fNBdUop7aBXupbAk33B+HfNK4g0ZjOppEq7h9qokNLP@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNwbWv6pteAnVV3nN97+zzObqcIND92YYP/BlQrEYgARRNJNk
	imKjTI6RPVZ5ueGJ8DRljZ1AyZkn1c2/IM/1PMurytN0LXWAK+mZpgLvzcVvDz0=
X-Google-Smtp-Source: AGHT+IG48id+lRY4xtL1ujqx4VpcR8QxySGV9q44wlS56hapCTBDQPNEacp1RsUNT7MPHUN2ohWifQ==
X-Received: by 2002:a17:907:7f89:b0:a99:435c:89f2 with SMTP id a640c23a62f3a-a99435c8ce0mr357354766b.63.1728213635990;
        Sun, 06 Oct 2024 04:20:35 -0700 (PDT)
Received: from localhost (host-79-32-222-228.retail.telecomitalia.it. [79.32.222.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993d92ed5dsm185689766b.63.2024.10.06.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 04:20:35 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sun, 6 Oct 2024 13:20:51 +0200
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>, Lizhi Hou <lizhi.hou@amd.com>
Subject: Re: [PATCH 03/11] PCI: of_property: Sanitize 32 bit PCI address
 parsed from DT
Message-ID: <ZwJyk9XouLfd24VG@apocalypse>
References: <ZvZVPA6ov5XgScpz@apocalypse>
 <20240928201717.GA99402@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928201717.GA99402@bhelgaas>

Hi Bjorn,

On 15:17 Sat 28 Sep     , Bjorn Helgaas wrote:
...
> From your earlier email
> (https://lore.kernel.org/r/Zszcps6bnCcdFa54@apocalypse):
> 
> > Without this patch the range translation chain is broken, like this:
> 
> > pcie@120000: <0x2000000 0x00 0x00    0x1f 0x00                0x00 0xfffffffc>;
> > ~~~ chain breaks here ~~~
> > pci@0      : <0x82000000 0x1f 0x00   0x82000000 0x1f 0x00     0x00 0x600000>;
> > dev@0,0    : <0x01 0x00 0x00         0x82010000 0x1f 0x00     0x00 0x400000>;
> > rp1@0      : <0xc0 0x40000000        0x01 0x00 0x00           0x00 0x400000>;
> 
> The cover letter said "RP1 is an MFD chipset that acts as a
> south-bridge PCIe endpoint .. the RP1 as an endpoint itself is
> discoverable via usual PCI enumeration".
> 
> I assume pcie@120000 is the PCI host bridge and is already in the
> original DT describing the platform.  I assume pci@0 is a Root Port
> and dev@0,0 is the RP1 Endpoint, and the existing code already adds
> them as they are enumerated when pci_bus_add_device() calls
> of_pci_make_dev_node(), and I think this series adds the rp1@0
> description.

Correct.

> 
> And the "ranges" properties are built when of_pci_make_dev_node()
> eventually calls of_pci_prop_ranges().  With reference to sec 2.2.1.1
> of https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> and
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#ranges,
> I *think* your example says:
> 
> pcie@120000 has:
>   child phys.hi	      0x02000000    n=0 p=0 t=0 ss=10b
>   child phys.mid,lo   0x00000000_00000000
>   parent phys.hi,lo   0x0000001f_00000000
>   length hi,lo        0x00000000_fffffffc
> 
> which would make it a bridge where the child (PCI) address space is
> relocatable non-prefetchable 32-bit memory space at
> 0x00000000-0xfffffffc, and the corresponding parent address space is
> 0x1f_00000000-0x1f_fffffffc.  That means the host bridge applies an
> address translation of "child_addr = parent_addr - 0x1f_00000000".
> 
> pci@0 has:
>   child phys.hi	      0x82000000    n=1 p=0 t=0 ss=10b
>   child phys.mid,lo   0x0000001f_00000000
>   parent phys.hi      0x82000000    n=1 p=0 t=0 ss=10b
>   parent phys.mid,lo  0x0000001f_00000000
>   length hi,lo        0x00000000_00600000
> 
> which would make it a PCI-to-PCI bridge (I assume a PCIe Root Port),
> where the child (secondary bus) address space is the non-relocatable
> non-prefetchable 32-bit memory space 0x1f_00000000-0x1f_005fffff and
> the parent (primary bus) address space is also non-relocatable
> non-prefetchable 32-bit memory space at 0x1f_00000000-0x1f_005fffff.
> 
> This looks wrong to me because the pci@0 parent address space
> (0x1f_00000000-0x1f_005fffff) should be inside the pcie@120000 child
> address space (0x00000000-0xfffffffc), but it's not.

Exactly, that example refers to the 'uncorrected' case, i.e. without the
patch applied.

> 
> IIUC, this patch clears the upper 32 bits in the pci@0 parent address
> space.  That would make things work correctly in this case because
> that happens to be the exact translation of pcie@120000, so it results
> in pci@0 parent address space of 0x00000000-0x005fffff.

Right. I think we sould split it into two issues:

[1] RP1 acknowledges a 32 bit BAR address from its config space while the
device must be accessed using a 64 bit address (that is cpu address
0x1f_00000000), which sounds strange to me but I guess that is how
the hw interconnect has been designed, so we need to cope with it.

[2] I still think that the of_pci_set_address() function should be amended
to avoid generating invalid 64 address when 32 bit flag is set.

As you noted, fixing [2] will incidentally also let [1] work: I think
we can try to solve [1] the proper way and maybe defer [2] for a separate
patch.
To solve [1] I've dropped this patch and tried to solve it from devicetree,
modifying the following mapping:

pcie@120000: <0x3000000 0x1f 0x00    0x1f 0x00                0x00 0xfffffffc>;

so we now have a 1:1 64 bit mapping from 0x1f_00000000 to 0x1f_00000000.
I thought it would result in something like this:

pcie@120000: <0x3000000 0x1f 0x00    0x1f 0x00                0x00 0xfffffffc>;
pci@0      : <0x82000000 0x1f 0x00   0x82000000 0x1f 0x00     0x00 0x600000>;
dev@0,0    : <0x01 0x00 0x00         0x82010000 0x1f 0x00     0x00 0x400000>;
rp1@0      : <0xc0 0x40000000        0x01 0x00 0x00           0x00 0x400000>;

but it fails instead (err: "can't assign; no space") in pci_assign_resource()
function trying to match the size using pci_clip_resource_to_region(). It turned
out that the clipping is done against 32 bit memory region 'pci_32_bit',and
this is failing because the original region addresses to be clipped wxxiereas 64
bit wide. The 'culprit' seems to be the function devm_of_pci_get_host_bridge_resources()
dropping IORESOURCE_MEM_64 on any memory resource, which seems to be a change
somewhat specific to a RK3399 case (see commit 3bd6b8271ee66), but I'm not sure
whether it can be considered generic.

So, I'm actually at an empasse here.

Also, while taking a look at the resulting devicetree, I'm a bit confused by the
fact that the parent address generated by of_pci_prop_ranges() for the pci@0,0
bridge seems to be taken from the parent address of the pcie@120000 node. Shouldn't
it be taken from the child address of pcie@120000, instead?

> 
> But I don't think it works in general because there's no requirement
> that the host bridge address translation be that simple.  For example,
> if we have two host bridges, and we want each to have 2GB of 32-bit
> PCI address space starting at 0x0, it might look like this:
> 
>   0x00000002_00000000 -> PCI 0x00000000 (subtract 0x00000002_00000000)
>   0x00000002_80000000 -> PCI 0x00000000 (subtract 0x00000002_80000000)
> 
> In this case simply ignoring the high 32 bits of the CPU address isn't
> the correct translation for the second host bridge.  I think we should
> look at each host bridge's "ranges", find the difference between its
> parent and child addresses, and apply the same difference to
> everything below that bridge.

Not sure I've got this scenario straight: can you please provide the topology
and the bit setting (32/64 bit) for those ranges? Also, is this scenario coming
from a real use case or is it hypothetical?

Many thanks,
Andrea

...

