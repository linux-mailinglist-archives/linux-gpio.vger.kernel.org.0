Return-Path: <linux-gpio+bounces-13284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F019D9A2F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 16:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66915B23CE7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 15:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08831D61B7;
	Tue, 26 Nov 2024 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VbV6WM9V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29771D6199
	for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2024 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732633689; cv=none; b=aaqTNFiF3g8M0GvlV8h7AodbwN+cgJJhKQGLGD/otOz+AqldjSvuSMXDX2C8pn4q0LbRowBh93loDzLIAdnEU2MPExaVLZ9yQonX4+ESpGkLnbTcPXJQfSttW32DMnSZCR3yrO0rzzAJJl6GA14cj4g+5lOdjO0vQEMXnRuu6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732633689; c=relaxed/simple;
	bh=rR9fCYRGtZ0WqiCx7bsr9NOHtvAkUDm6R/T+RFpzqCM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im4kK6IKS9x0rLKXWEtIqjhvzPpgxefE6a3WfmmvWUjYtNprkdRXJiNnW843aRBdQkPSOVYW7A7eyFAWVnE5oPzdpAhuUplhCTaMZJmZnx3rzXl7MJbM8gp+1bo94M4wcOpLEXCqNHrmkrSP+7yv2w65oSVkmQ33dYgnHIAH8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VbV6WM9V; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so33851171fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2024 07:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732633686; x=1733238486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wkXmTfuY/onFcHGFkT/ioLNg+ObOS9O+E99ZOLPbjVY=;
        b=VbV6WM9VyuFtdfUmhTGye41Mq7eczXU6FxYhf/c/zBG/dwQynC5q1xiExXDmmja1Pc
         DJeFB2s/Rldcalexh6N7op1aOm8cVxaAbUZHOCf00nNvzspZHpGPcrY40/NeJU0xfM7t
         tRu2MF80hRR71npcKlZDwsSisr7DOMD9hQq14yvfLZDWGnyD6jfVmemvvE2956yI7uIA
         zpQ5ncn7DypM2EMfTeTf7HbAkFcFDiybUUrq9b48R0LWfEHUWTvz2s25NtE+dtSrbYiK
         3v0XWKfMmIbghIoCUhoT++ZuCTsnwZyPTLU4/ZyDREfXeV6StHUyV/p/nIGEjoF6LInT
         AVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732633686; x=1733238486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkXmTfuY/onFcHGFkT/ioLNg+ObOS9O+E99ZOLPbjVY=;
        b=cws0EMumex3OYXa76E/GFESr8+fsgyv7giDSwOXS33LWW99hnGgI6VsNmS+jtMZ61I
         tKP8Pt+CvO8ZVWSBYD4+zRk0OEfXM61GU0sBlTUbpU3gpP7r4z3Q4Laq9JmE0PVdoWzr
         J6E1k9PzCcX18OFWC0jjMyislwI2kcabS4hjy4xQiYlUnHceI6BB8eiXdBWfUNwpmvKX
         +1mMhhpm31CMj//0Cy68ePxuToZqqhT7IXC/l8sOPGwttQsxySRHC7GB+P4EOiWxqny4
         K5UHgiXBl76zB1cCq8gxg5Yz/jRnlq2ZfUofoyAoVz51qJthPZLftUalUTLIPPU9Eopj
         BGZA==
X-Forwarded-Encrypted: i=1; AJvYcCV04VBss8QYwaQISCbIl7HdMLqGodEDxBUY+2f8sTjnI+nZdIQwX2gxezQVwzYmItNEPRulXbkYU5hj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3unLm6Cz0h31O5LxRUVRd6c/CWrQQ4U8MctXdChV2NRZOVIeY
	12jrH5aCO12fVkmu8bfHaRNJKU4hLjphnYLjEkVw7AGAX7j453zGM6RLfqqS954=
X-Gm-Gg: ASbGncs+JcEJ3QkxdSlTrTbdfs1/+i4TtwFJGmzcbvoL3FyCNMqVloMxdNBd+peZjYW
	ZQ9d3jDb0ogKZZSbJwQ0gvYH1XpxO9hb1bGfCDxzee0oXJceHb5+TL26MP2LZ96qdUzQnC8EE7Y
	A6BzNNDFzvFI40nGkPNAXdwz1piAmVysiVCWqgB8vXHJXQwZOd0GxqjpPNljyOIHiqpNM+/49Cj
	729LlWdWuoqYwLDkJejDr9/uxpi4TaOlMo9tUV1YGCCfEaxirLGrn2t/tXgTiZmOQHvNHMJiCu0
	AcLrotQ8aJ65FoDDYh6f
X-Google-Smtp-Source: AGHT+IHfNZc0WKbh7sqF1+iBLIXYZDOl4JPTwwJG5rgrazocKw4s1ERx1hlewAc6ByNqGEspG3q/FQ==
X-Received: by 2002:a05:651c:88d:b0:2ff:55b3:8e11 with SMTP id 38308e7fff4ca-2ffa7193c77mr95509071fa.36.1732633685736;
        Tue, 26 Nov 2024 07:08:05 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc94asm5286773a12.58.2024.11.26.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:08:05 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 26 Nov 2024 16:08:38 +0100
To: Rob Herring <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Cvetic <dragan.cvetic@amd.com>, linux-gpio@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	Derek Kiernan <derek.kiernan@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Wilczynski <kw@linux.com>
Subject: Re: [PATCH v4 04/10] dt-bindings: misc: Add device specific bindings
 for RaspberryPi RP1
Message-ID: <Z0XkdoBkrhCGo9sf@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
 <173250040873.6640.9720381303445148722.robh@kernel.org>
 <Z0RAGkBc-yz5lqN6@apocalypse>
 <20241125132104.GA1520508-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125132104.GA1520508-robh@kernel.org>

Hi Rob,

On 07:21 Mon 25 Nov     , Rob Herring wrote:
> On Mon, Nov 25, 2024 at 10:15:06AM +0100, Andrea della Porta wrote:
> > Hi Rob,
> > 
> > On 20:06 Sun 24 Nov     , Rob Herring (Arm) wrote:
> > > 
> > > On Sun, 24 Nov 2024 11:51:41 +0100, Andrea della Porta wrote:
> > > > The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> > > > schema is intended as minimal support for the clock generator and
> > > > gpio controller peripherals which are accessible through BAR1.
> > > > 
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > ---
> > > >  .../devicetree/bindings/misc/pci1de4,1.yaml   | 74 +++++++++++++++++++
> > > >  MAINTAINERS                                   |  1 +
> > > >  2 files changed, 75 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > > > 
> > > 
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb: clocks@c040018000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > 	from schema $id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> 
> The error comes from this schema and...
> 
> > > 
> > > doc reference errors (make refcheckdocs):
> > > 
> > > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com
> > > 
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in *this* patch.
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > > 
> > > pip3 install dtschema --upgrade
> > > 
> > > Please check and re-submit after running the above command yourself. Note
> > > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > > your schema. However, it must be unset to test all examples with your schema.
> > > 
> > 
> > Sorry about that, but even if I see that this should be the case (I've dropped
> > the clock-name property from raspberrypi,rp1-clock.yaml), I can't reproduce it
> > with:
> > 
> > # make W=1 dt_binding_check DT_SCHEMA_FILES=pci1de4,1.yaml
> 
> You've limited testing to schema files matching pci1de4,1.yaml.

Ah I see. I thought that DT_SCHEMA_FILES just restrict the check to that
particular file, instead it's also restricting all check of that file
to itself. So I guess there's no way to check one specific file against all
internally reference (e.g. from examples) schemas...

Thanks for pointing that out!

Regards,
Andrea

> 
> > 
> > and the output is:
> > 
> >   CHKDT   Documentation/devicetree/bindings
> >   LINT    Documentation/devicetree/bindings
> >   DTEX    Documentation/devicetree/bindings/misc/pci1de4,1.example.dts
> >   DTC [C] Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb
> > 
> > dt-schema seems up to date. Is my command line correct?
> > 
> > Many thanks,
> > Andrea
> > 

