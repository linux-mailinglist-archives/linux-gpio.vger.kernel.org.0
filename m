Return-Path: <linux-gpio+bounces-24522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D397B2BB75
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 10:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAB3E7AE92C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 08:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A7310957;
	Tue, 19 Aug 2025 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S4sb0XG9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803613112C4
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591147; cv=none; b=CYGIbOmHROHGXe4nBQxsCHQ6lHhgd3p9arAeT9PvtEyihdWX62FpyXkr7dsRdIDF/vjRI2OdBXf9fgb7/KXTk6HzE8Hq/WI2uPIIcswFlrqmnx8tsCh9/WbH60QwxLsju1KL7IPp6BkQAYAxy9Ew64SrswZN9yT0i509kqfWRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591147; c=relaxed/simple;
	bh=/U4vQ+4uaor8+Zvvu+HVf331BVfrCrCt35ZNYnVXSPg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKf23M5TcAvEd/zQfqsqpqmbXFdUe63s67LH/uQ3xE8tuRcj/UzpsgvSIMWWE+bT0GxpeScaIq0P0hNZoUppYZ5yFsjT0IYawocZIYt5K3PLF1PQjCiHoHMSthddpDvU1DOXj7HEP682wXuVvfZloLnpbkFKSm14wAcyCu2YIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S4sb0XG9; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-6188b5be5deso6550863a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755591144; x=1756195944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nzPUQ0/d41BabMrdFj7Ztc0g/CB1x+z2efsCXODZwQ=;
        b=S4sb0XG93wSZqon+IFAa2f8WUqGH4D6SZ4x7zjZS43NVOtENqFMAv/elT6DCgMz7zp
         AAZfchhX70BU8p3LL4V81a7oRcOa7txh/TqSt3uH4qXX2ftgvltMthVNh2Rm0114/V/S
         MMAuD+rEXfigo+DSFd9xEI406I2c37EQhP4equBg//VKI89Ot0MXHA54po5iJRc9aUjB
         QqyUEhL5SBU0vwuMCVvZMFejLIuO87SoXoJfI9jv/SfUwipO2Dfh/aeDTPZnKBU/TKFP
         CvHID6ff0GU44MKeJaCKtzOFQSYwMOoF9Roz+7xIitQjG/twKAhC1l6EYeyIYFysnJtA
         YnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755591144; x=1756195944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nzPUQ0/d41BabMrdFj7Ztc0g/CB1x+z2efsCXODZwQ=;
        b=W9Zf0my5FkaqwSgjfxHs6gG4kvESHVIGq87xuzOGkfdcDXE65Nq2j3NAYtB0igKwh9
         AksZxjKpqnt9gXUOUq/VmcCGyKg7uInZgo610tuj1ZbPB7kq73r148BY730DyYfTzrvA
         D6oT2dJuT4OomF0yUBsU7EzZ8t59lf3atttK7rIGctHfeEAmRltZtNfUT4wicLODtZv3
         MgxNOWWBELyKC5ZgRGF6F3MK3YZRbaaj3xxXoL2/fYQJ7bX5HIGZXIEBHAUDHb4m8rrA
         rjfNMCXq9yWK888wdeMr+Dc7f5UBYRtv/MYuLAK008ezLUuMiZujnbs8v3syXonixkiB
         B7mw==
X-Forwarded-Encrypted: i=1; AJvYcCUcHQtERWRQB8if5wf3bW6jA9jUQkw0k4yfxxxqZU3Uc2v7jG8EHLXaKUuHfMPW1kh2d26VBCOzyw9j@vger.kernel.org
X-Gm-Message-State: AOJu0YyIl+9JR03M5OvRm5IEFiSMflcuoCP64A5uvii0d9iuQLSBqlMP
	b98vnTantdSBy6h9ldkeHIeocgKKcsra6rkFjC9fPhRB0sK3DALbLViYNEz4mVPa0c0=
X-Gm-Gg: ASbGnctpS/X/t56ir7hiEqKi7gsLWAyUErpik5N9IFWAnukRmltfJvB0sSlOWE3v0Do
	VtidSmfR6PYokMDFiD1wQc0EvD941pTAu8GZ/iGkT4iQRNVjX70dY9zl4v4hCgSaNRJzTiVI49v
	jEcaHl058hWF1RWZwm0HL5q2xWIKRy2mlw2BW9hk3Zv2mkq0dw2zCVuPJJ7i0Ncq5md26KY8ME0
	py0Xzwmwd/AhiOjyH2EtK0AID6uy3iHmrIIcXyAlPAQYN2QGhTFb5uTTemgJrn3Hycufv1Za/Le
	vrG2fP/pWO/Em2pspdoFPK0lVwzZMo697qRyDipvAWY8vhmibTZ4ouhv8omeYtD5wZkczSX0pux
	rPmk7gawmjJnej0Nxej7HpXjTFclJTqgR4PSl3XdT1Qg6FopKMH4Hkd6Gp7Eyhqlc9ePdlao=
X-Google-Smtp-Source: AGHT+IFWUFHoGU/t7RtStcFRX+OfWnQMuoPAH5EIGoxs7IRL94PQgOjPHffK157QAOTE9MTriRH+/w==
X-Received: by 2002:a17:907:6e89:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-afddd0b555cmr143308466b.35.1755591143820;
        Tue, 19 Aug 2025 01:12:23 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm949783566b.88.2025.08.19.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 01:12:23 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 19 Aug 2025 10:14:14 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aKQyViTbXAsFEuT7@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <f7892abc-1063-4b12-8d47-c80714aeb8fe@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7892abc-1063-4b12-8d47-c80714aeb8fe@suse.de>

Hi Stanimir,

On 10:40 Tue 19 Aug     , Stanimir Varbanov wrote:
> Hi Andrea,
> 
> On 8/11/25 5:46 PM, Andrea della Porta wrote:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.
> > 
> > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> > 
> > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > Cc: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/pinctrl/bcm/Kconfig           |   13 +
> >  drivers/pinctrl/bcm/Makefile          |    1 +
> >  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1197 +++++++++++++++++++++++++
> >  3 files changed, 1211 insertions(+)
> >  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
> > 
> 
> <snip>
> 
> > +static int brcmstb_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	const struct brcmstb_pdata *pdata;
> > +	const struct of_device_id *match;
> > +	struct brcmstb_pinctrl *pc;
> > +	const char **names;
> > +	int num_pins, i;
> > +
> > +	match = of_match_node(brcmstb_pinctrl_match, np);
> 
> The 'match' variable is needless, you can drop it.

you mean something like this?

pdata = of_match_node(brcmstb_pinctrl_match, np)->data;

I thought that kind of compact code was not really the way to go,
at least taking a look at other driver exmaples: there's only one
avoiding the intermediate variable and many others using it (although
in some cases they also check for null, so in that case is fully
justified). Anyway, I've no preference on that so I can proceed with
your suggestion, unless anyone has something against it.

Many thanks,
Andrea

> 
> > +	pdata = match->data;
> > +
> 
> <snip>
> 
> ~Stan
> 

