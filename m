Return-Path: <linux-gpio+bounces-12515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F19BB32D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADFDC1F216AE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADCA1BD018;
	Mon,  4 Nov 2024 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J0RBxbUU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809091B21B0
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719060; cv=none; b=NHvwAboglLs9kRcY2NuPN4LXOMG1bALQ9C7qkTZwdthZ/CdmsRNHaDjSRZgSd6qkjzGxSVAaRCoPXfI0ucJJGuhxsJafGuVAoXc8OlVdbMFxJHs/sHY67mExJKSH+fb+HCAEXROFoLGpoMYZfNThZEYY+0HTR1En9QmylMKG4QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719060; c=relaxed/simple;
	bh=m6AwtJV6JumlnupkTYJZWz+WL77mCi1FfjKbjWxYVgY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFuwRn4ra2udPed4jXanCZS4w4Ty/CafEhLtdfZiWuRlw4qzy/hahqIao7WRO1+YurRphiYIdvTiP/pQG9NZPF6RQO/cXENEqJgZcEIVSEys+SNHO9zpFTGa55adpS8hwsrYaAaKcaYRAE+qaq+PFYEY7EHmXdiN8PG8bjakOwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J0RBxbUU; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a9eaaab29bcso52014466b.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 03:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730719057; x=1731323857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zm6fQFm9ooxBDk4g90danCCrz6mePB1JIcdtVnE9xbo=;
        b=J0RBxbUUQSiNRH22p/7fwkq/iabs82RMJh4D3bARIWUDWpsiJxgiwf1dgmLHMqC2pX
         LNurdUvVtcz6hGWgP06Ldc1dLZDI82FzpnRbrzzZV+5ZGPPJahoheDw2MVOXR0LprYTU
         vnX5Gq744g/h8PYemKJ/9hiI4/xvwtcyMOUIJN/IH/DsoHc4TriRH+M0yTbqNIip56Qj
         V8awiYzWVHURXAum0E3PX/aphvVOknynsBNKGJZv67dlOo/+H0SwC5WFee4vkop6kBRX
         9ppBDMHQYiLTOL/3pfvOG5kVEhoLKPUvX2dIWUbb7O6x/iW3bbwPWeiAo+1Jux30k/oN
         rrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730719057; x=1731323857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zm6fQFm9ooxBDk4g90danCCrz6mePB1JIcdtVnE9xbo=;
        b=lupApQCx0rMnu6xZDzMh2ZOr1Jl1yEGlq2zdFPkk+PPxEBYyrRSfUcA3iar1EfUDgm
         YCXs+WMei1vmC8xtv6bFmOISfZTjnuasDL6rNz2YyAnG84zyLCpDjOU49ZpguSMDqh+b
         uhQ2ChusE+F325dJSenua2EkmEWArQvgy/st/BSyW7hCppSj+irjY5aJk8nidZueJaHy
         edZ35C29Z5dwHGUm9nGWJu0TB/arCQX5eWvFaLL0v9sxyABRjeBGXjOd5iwQgspxj+FM
         J77G2XLWg9ZxZWX7Ufui6LC7Sa30an6MNOcEveNZENe6LGpg4/Ep3Myvc8P1K1t3Bl13
         p7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWVcp05Kw3Jee77LfttrkHpAdsZXCR3QwQuduayHVE+gfGhQnHn3PjzFQKFi+no139LmuQeQHbyuHWJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxagn/wMK35Bbvn/i7Fco2SFZ3p/iyfSErRVOUuIrUm+SmVdKNj
	VwDiuLUd7LM0SxAIgd+tA1acR2MkKvtC1NZ8wXlLGXwsVtT65tbj7HhBc/5dYao=
X-Google-Smtp-Source: AGHT+IFcSLCzci43q6B6uwk+mOIVwVMzbBAMNInxtnBTc5cfQ4MVXaYIjI3lyJk3DmBUHaqfz5C5og==
X-Received: by 2002:a17:907:7242:b0:a99:ee1c:f62f with SMTP id a640c23a62f3a-a9e5094307emr1279580066b.34.1730719056854;
        Mon, 04 Nov 2024 03:17:36 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564e88a1sm544922266b.95.2024.11.04.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:17:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 4 Nov 2024 12:18:02 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 03/12] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <ZyitasLlDB3pXKEp@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <2948fdf8ccf8d83f59814d0b2a85ce8dac938764.1730123575.git.andrea.porta@suse.com>
 <fwqcbnub36fk4abmhbtuwsoxdlf64mx4v65mxahsxmiv2sz6er@bfjddapvb75v>
 <ZyOSGgJ4zb31Posb@apocalypse>
 <e2ce5f7a-6ef5-45e0-9868-11eb9106ace8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2ce5f7a-6ef5-45e0-9868-11eb9106ace8@kernel.org>

Hi Krzysztof,

On 19:06 Thu 31 Oct     , Krzysztof Kozlowski wrote:
> On 31/10/2024 15:20, Andrea della Porta wrote:
> > Hi Krzysztof,
> > 
> > On 08:28 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> >> On Mon, Oct 28, 2024 at 03:07:20PM +0100, Andrea della Porta wrote:
> >>> Common YAML schema for devices that exports internal peripherals through
> >>> PCI BARs. The BARs are exposed as simple-buses through which the
> >>> peripherals can be accessed.
> >>>
> >>> This is not intended to be used as a standalone binding, but should be
> >>> included by device specific bindings.
> >>>
> >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> >>> ---
> >>>  .../devicetree/bindings/pci/pci-ep-bus.yaml   | 58 +++++++++++++++++++
> >>>  MAINTAINERS                                   |  1 +
> >>>  2 files changed, 59 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >>> new file mode 100644
> >>> index 000000000000..e532621f226b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >>> @@ -0,0 +1,58 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Common Properties for PCI MFD Endpoints with Peripherals Addressable from BARs
> >>> +
> >>> +maintainers:
> >>> +  - Andrea della Porta  <andrea.porta@suse.com>
> >>> +
> >>> +description:
> >>> +  Define a generic node representing a PCI endpoint which contains several sub-
> >>> +  peripherals. The peripherals can be accessed through one or more BARs.
> >>> +  This common schema is intended to be referenced from device tree bindings, and
> >>
> >> Please wrap code according to coding style (checkpatch is not a coding
> >> style description but only a tool).
> >>
> >> Above applies to all places here and other bindings.
> > 
> > Are you referring to the title being longer than 80 column here, right?
> > Because the description seems correctly wrapped... or should I add a
> > newline for each paragraph?
> 
> Hmm, I might commented on wrong description. I just looked at patch #2
> and there it's passed 80.
> 
> Here the title is not wrapped.

Ack.

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 

