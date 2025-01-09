Return-Path: <linux-gpio+bounces-14622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C065DA07C90
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 16:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18C533A8E56
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 15:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E609D2206BE;
	Thu,  9 Jan 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bl/mYVoK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2F220696
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jan 2025 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437988; cv=none; b=u2QVs8PDXPaUL/kon/KbRx6ZHiibAIhRP+7b3tmzK8kbjXb/7NeMdv9KpdQTG35flO3sCtlNXPfNAUdLC2IJpM1u1cagE77DdOZhGRDiyfq3m9KStyv7w1nprok66+/6amuWOQs00RG0YWFG6SuwtGf9niJMJwepcazlhFgKt6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437988; c=relaxed/simple;
	bh=pJgGVj88K8V7gJ0zgIUhUwlsCxKgV+W4Ci2hCN34mIY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7lo93uN4xkqPBa8UuyG0LZ9h8ZAw6FVwE6yHgWBQIiaJWf5J8vIYbhYyoz3yHVXBNKkcR16HLSdGMiYD00BrzCMYt7sC8XO2TY2CNF4hDaHRWF53pscIcqtTasDGEs0sp3wIHgBYGOf/RfryEOufrGTgteylVS5z12wsAJti5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bl/mYVoK; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso207576766b.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2025 07:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437985; x=1737042785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiM8y2KF3+onAr2SvicvIVsqQjxBJ+k4H+eZXUhohgA=;
        b=Bl/mYVoKctKrr4gURZuPaipQQxFpkN47P0NlpCMfjizKqQNYQVhLEN+Rrs1NmO6Bbl
         Pk0gJ699p+KTMEwouYyn5iWanH06Zfa8lCBNjlTFl7Vsb1+MZr/5bicGx9uRLFleFiT9
         rgTppDeph9xyTknOcMsi/Zma8kkEErYrwCbAfR1jbPcBNswOMQzcWUXL1mXsaCVhauMl
         fUvIGf+9SAIUDmL+1Y+f+DiF9C7JPvtot6yczg+M574vA9tgtRKVZ84mdAClQqcWYUrP
         Jiag7lXRPPPKmsgTX0C42XLBThXjXic+pkAAjgFyP0NONL0CF0HPhMXwbySw60jCxTvB
         vQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437985; x=1737042785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiM8y2KF3+onAr2SvicvIVsqQjxBJ+k4H+eZXUhohgA=;
        b=In6AHvoN2aeQtgT3myH4MELqrs3tNIw9eLmjlRikkXBl66Am1zP2Z61ZbFrpNRjn/r
         TAB7KKWQGD8za5empjIFu5XYm1F89dVCMDHRbhlUiQdPCpJSzrzq2m9lhYqm2LgtZHrD
         sMhsPpYTZCGA2Ke/AELXDYNbj31KZI/ceWuGLTGlHbAiDzHaz8KlnXXxkFF9qfVQ7H/E
         eLbf5P/yRKQBH8yePhkwf9ejJc26/tVXiV/HH8I5v6ihIRZ/TQOr8SvfX+rCp+xthmHd
         UhTMWl1Tz7SwiVgxnCGnIMkc05qmmTTaOZgqgsUGAe6dUfWnvQgFeiPArDZk7I6OuCBE
         q/qA==
X-Forwarded-Encrypted: i=1; AJvYcCUrJiOsIwNMQiTrY6Z1kAN6whVrrDFB44r4SqN4yIN6rRHHUMPf01aGqOcaMZYuyoU0Awnbmea1BkGl@vger.kernel.org
X-Gm-Message-State: AOJu0YzcGlnm8nGwCExFfNUXOoSpOKIGu+4hF0BiAI+nTX6njCjeu4Rx
	83MYFxz7j2c6Jxp3KDjJTjjhAzTUH68JbObpb2WuzgxMMKfG+Wz6QMlfMF4N+0k=
X-Gm-Gg: ASbGncueUjPOrZfCG16Q6O0ssUvZHGORLRdBmrJT+d7bTByWm4rHKWhKuQYlLQHf6s0
	ZUhaKP1PGOdZco3R5pLpT6ZueWWMe5Y44HilDysmwcMPf2x3zjj/NB0emPPWIbAE3h6XmvT5Wmn
	5GZr+9FiAEAoqP4wgvbvUASplQgEL4GSDcayBRl3Q4Bhkts7iIDoDZYT/Vv+aGb3W0MC+M8SlTt
	PUTd2WStlcOcLLUOdg3q0IrcRTcOwNAIhMZrfN4pH2w4mGsLrdsgiQkbELU8i25YUN55w6nWWBu
	B0ONmsahU01/n7boeON0MF8KwWNHNQ==
X-Google-Smtp-Source: AGHT+IHcBvpBouxzG2xA8PisFV1s3Jhs8UiQjwM9GQq0MdUzIaP9cn8QbUIcgBfqgLqpN4NyhXITew==
X-Received: by 2002:a17:906:fd87:b0:aab:cce0:f8b4 with SMTP id a640c23a62f3a-ab2abc9ed6cmr644656666b.52.1736437984935;
        Thu, 09 Jan 2025 07:53:04 -0800 (PST)
Received: from localhost (host-79-40-232-186.business.telecomitalia.it. [79.40.232.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b32sm82250366b.122.2025.01.09.07.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:53:04 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 9 Jan 2025 16:53:52 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z3_xEEGVWFu-bDjT@apocalypse>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>
 <20241210224837.GA702616-robh@kernel.org>
 <Z2A0aAPotT0NvoCl@apocalypse>
 <Z3_ZlvbszezcanA4@apocalypse>
 <20250109155036.27b82b7e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250109155036.27b82b7e@bootlin.com>

Hi Herve,

On 15:50 Thu 09 Jan     , Herve Codina wrote:
> Hi Andrea,
> 
> On Thu, 9 Jan 2025 15:13:42 +0100
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > Hi Rob,
> > 
> > On 15:08 Mon 16 Dec     , Andrea della Porta wrote:
> > > Hi Rob,
> > > 
> > > On 16:48 Tue 10 Dec     , Rob Herring wrote:  
> > > > On Mon, Dec 02, 2024 at 12:19:32PM +0100, Andrea della Porta wrote:  
> > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > and others.  
> > 
> > ...
> > 
> > > > > +#define RP1_INT_ADC_FIFO	52
> > > > > +#define RP1_INT_PCIE_OUT	53
> > > > > +#define RP1_INT_SPI6		54
> > > > > +#define RP1_INT_SPI7		55
> > > > > +#define RP1_INT_SPI8		56
> > > > > +#define RP1_INT_SYSCFG		58
> > > > > +#define RP1_INT_CLOCKS_DEFAULT	59
> > > > > +#define RP1_INT_VBUSCTRL	60
> > > > > +#define RP1_INT_PROC_MISC	57  
> > > > 
> > > > Why all these defines which will never be used because they come from 
> > > > DT?
> > > >  
> > > 
> > > Right, those defines where originally designed to be included from dts, but
> > > previous discussion deemed interrupt numbers to be hardcoded instead of being
> > > specified as mnemonics. In the driver source code I just use RP1_INT_END as the
> > > number of interrupts but I thought that the specific interrupt numbers should
> > > be documented in some way or another. Since no one is currently referencing
> > > those defines, would it be better to just turn those in a multiline comment
> > > just to describe them in a more compact form?  
> > 
> > So, here's a couple of proposals about the interrupt defines:
> > 
> > - since they were banned from devicetree, and are not used anywhere in the code,
> >   turn them into a (admittedly long) multiline comment, so they are still at
> >   least documented
> > 
> > - since they were banned from devicetree, and are not use anywhere in the code,
> >   just drop them, we don't currently need them after all
> > 
> > Not sure what's the best way here, anyone can advise?
> 
> Maybe in the #interrupt-cells description in the device-tree binding?
> 
> In your patch 4, you describe this interrupt controller and you have:
>   '#interrupt-cells':
>     const: 2
>     description:
>       Specifies respectively the interrupt number and flags as defined
>       in include/dt-bindings/interrupt-controller/irq.h.
> 
> In this description, why not add the supported interrupt number values?
>     description: |
>       Specifies respectively the interrupt number and flags as defined
>       in include/dt-bindings/interrupt-controller/irq.h.
>       The supported values for the interrupt number are:
>         - IO BANK0: 0
>         - IO BANK1: 1
> ...
> 
> Or something similar.
> 
> This kind of description is already available. For instance:
>   https://elixir.bootlin.com/linux/v6.13-rc1/source/Documentation/devicetree/bindings/dma/fsl,imx-sdma.yaml#L64
> 
> Does it make sense?

Seems fine to me, if there's no concern from anyone I will procede like that.
Thanks for the suggestion.

Andrea

> 
> Best regards,
> Hervé

