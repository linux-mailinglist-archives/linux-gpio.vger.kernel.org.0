Return-Path: <linux-gpio+bounces-17436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF92FA5C3EB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB5DE7A8F88
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15B51925AF;
	Tue, 11 Mar 2025 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GU3jOMES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882678F47
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741703747; cv=none; b=XUZzM/dJCN1jxl7FZX/rVMZWbhNhMTcJCLEhNkn3GdO18FgHI2IVu3HG0Khx/wzZjmRhZwSUjHo8gvkn9NrbZPyw4KkQfk6D0ZbSzB5ofR48JZ+VX2yBksFil5NHPbdjegFYdMLrIhUNYazs3x4JJOCejZX5D+8PZrC0nCK9PoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741703747; c=relaxed/simple;
	bh=rty27olN5qtT2FiJsZAnVeMcI3IQWlc6A0m+F2XfCzA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rep7xNVo0R7J9kgGDXXudge6SBr1axYZ+T2K1QCJ+TnMJ8Tyg+rOaifXJ3GiNv0wgj/BLv2DilfhpAv4Lo+akYlkFh+1ay8mhcHwFNFFnYVM4WfSt3vIrqHN/Mu9lM/yBOMZ03bRdBN9FFVBh8+ofjcPuen+xs+zRuJ0CvEVsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GU3jOMES; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-abec8b750ebso941290066b.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 07:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741703744; x=1742308544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlcozNRCUn2cDnJKUvdb8kPLVFjOiAX9tvU5DyWpFbs=;
        b=GU3jOMESekZDdTWy5z1Z3dpQgkXwFi6DXlPpnvBhmzJ7I2BBkGP4aDHIhYYp2cl/H1
         Jb09vev6yW/KF5JPE0/4XtrPgauwJDhYr0OhGS12+qPy/Llo/sMH2jRnaXa/0NgpmdbM
         MTftcdpClpyKf54p2vFufW7gQ49ecO1YPksWebiwWsUzUnA4EMOJst1yMmb60lG1qugf
         ckz0zalrLXHu6UrY/RJJh9Bv/IVR9we8MEJWyYcivSaMJpky3h/JHlzjzqljeiHyBLUk
         4pviQhS7SYOV1LlEHPEdK3IlpMXgZ1dPKsfSUv1gJoCNIamLzqqfbe0HEV3Vgpt6vxxH
         tTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741703744; x=1742308544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlcozNRCUn2cDnJKUvdb8kPLVFjOiAX9tvU5DyWpFbs=;
        b=FAgWS5Y9TPXg0mAsUWgGqjfsYCVbEjAqxSrzPwxiRnihhjGEwxJUdvB1mQ4xtwRBDQ
         tBUcMWNzqvgsFdqx0AwQwrl7pjVh4yRTVM0xqiJFC4Qx/uBMA5gpSjR9/BHXhd8vpBwn
         0zzos/azEI/dP/qzytQvSF6EAZuLfzaw/2/HrMLiMr6JdQaeWVzlX+isaUnWNhLoUKxe
         8A+4lWrIS6IblGSNfBbRGUUkicmkwAr3XtciEIuY8LFg+XrpuKYZX772NJvFjwpjP5iJ
         hk1tMpI2ot7zIuoaoX9yRT5WyibqlAQbgW12bYIYZA/pMiWUHj2ORTjwqi7E5rmNazeI
         CeEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBLIcgndrtyde2vh6KM0siaEwhS50eTLobemYvHdixFpnMNIDZrllrpkluAatTPZ6ZcY5hHJtTnh4i@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUkcAdQlwL6+UR3n4GPv23koiA8sSDBeFIVICk1IL/vWH81S6
	c8wugg0VvNM7zRPsp/vh89UJoP3TveF3hxALwr/Q4EKOdRU5G0s/+ugheZoSE08=
X-Gm-Gg: ASbGncsCD/Rd6FLaMBsSi29TF91/y4YkIC1wpPYNg/SPa/1K6+JzXT8LdY/GsAXRkEO
	NRLSammYFbp2yQUsXR12UZ81R9ABNAlXRaXu8ib3UQlK8rCuonrku+nlHxVTGYEfMBfq7rH/B0x
	u9Hnf2KvqE4WX56iN0bG8+YrPNXuZQUa2Ur9qHacpitAb4+UYsG4e6XgI7ak/p3wuy/ImUb+zEG
	ecLvYiNmj8QZeiTjRza+DeUE/0etR7hEMqmVgo04m+Xbqsca2kYaP1sVJNVQEgB5EOrWginBzqU
	u/fikU3KEMVyp5+N+GoZb5bx2beHAUf6wQ9msfL0qPC5XY+/eCUGZ4+fSHnExqU7l/ZAWUFef94
	yBirRTgC7fWnL
X-Google-Smtp-Source: AGHT+IFLdM9vCnSAq2tyDNO5yPeJsNiGhv4R/i7mo9dqAzSuL9h81HaDVtVXHdqZ5ge8YgeZcopV0g==
X-Received: by 2002:a17:907:d27:b0:ac2:9e1a:bf95 with SMTP id a640c23a62f3a-ac29e1ac5camr1178043966b.18.1741703743784;
        Tue, 11 Mar 2025 07:35:43 -0700 (PDT)
Received: from localhost (host-87-14-236-98.retail.telecomitalia.it. [87.14.236.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a96a22d8sm278255366b.158.2025.03.11.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:35:43 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 11 Mar 2025 15:36:53 +0100
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Wilczynski <kw@linux.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v7 03/11] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <Z9BKhR5exw13yN36@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
 <20250310212125.GB2377483@rocinante>
 <CAL_JsqKPGOdS_8KDggO5tBHAnC-NTLAC5iS9GANm9BuxBfQUsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKPGOdS_8KDggO5tBHAnC-NTLAC5iS9GANm9BuxBfQUsw@mail.gmail.com>

Hi Rob,

On 08:32 Tue 11 Mar     , Rob Herring wrote:
> On Mon, Mar 10, 2025 at 4:21 PM Krzysztof Wilczynski <kw@linux.com> wrote:
> >
> > Hello,
> >
> > [...]
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index d45c88955072..af2e4652bf3b 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
> > >  M:   Andrea della Porta <andrea.porta@suse.com>
> > >  S:   Maintained
> > >  F:   Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > > +F:   Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > >  F:   Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > >  F:   include/dt-bindings/clock/rp1.h
> > >  F:   include/dt-bindings/misc/rp1.h
> >
> > I would be happy to pick this via the PCI tree as per the standard
> > operating procedure.  However, the MAINTAINERS changes do not exist
> > for us yet, and are added in the first patch of the series, which is
> > not ideal.
> >
> > I can add the missing dependency manually, but that would cause issues
> > for linux-next tree, which is also not ideal.
> >
> > I saw some review feedback, as such, when you are going to be sending
> > another version, can you make MAINTAINERS changes to be the last patch,
> > perhaps.  Basically, something standalone that perhaps whoever will pick
> > the misc patch could also pick and apply at the same time.
> >
> > Alternatively, someone else picking up the PCI dt-bindings would work, too.
> >
> > Your thoughts?
> 
> I guess I missed this in review, but why is a common schema buried in
> a device maintainer entry? Also, an entry in MAINTAINERS is redundant
> anyway because get_maintainers.pl can fetch maintainers from the
> schema file.

Oh nice, I've added all that .yaml entries in MAINTAINERS because I saw many
reference already existing there, so I was thinking that was a good behaviour.
Now I guess I can get rid of all .yaml references in MAINTAINERS file from all my
patches, since they will be solved automatically by get_mainatainer.pl... 
There's only one minor caveat though: I have a middle name, and it turns out
that get_maintainer.pl is skipping my first name. Unluckily I'm not a Perl guy
so I guess I have to dive a little bit in Perl regex and send a separate patch
for that.

Many thanks,
Andrea

> 
> Rob

