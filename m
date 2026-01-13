Return-Path: <linux-gpio+bounces-30504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E882AD1A4E4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 17:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11F9F303D14E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 16:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0C530AAC2;
	Tue, 13 Jan 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBBxawHu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4892F25F8
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321898; cv=none; b=RU2GmXoTKLEiYM2T7252OhlsVBrTrQ9YbUI3dgNHgxkVlN17hSmNLHdrr43y8WiGhAiIyiMjrGLr1JqP2PyBhqtyWYwB93oCfrOprPDUl0IsxWeMN4d2xW0nCWNx5d41IsvIVjv1MUFzRzQ5muAmyppq1/t/79+pKDakSftB/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321898; c=relaxed/simple;
	bh=LJvzeJ8sBeVhqAy36T1wh5GmbB79XkoE5MDUcTT4H/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4LKSPlGRannDUve2rKs7jNHx5O1+FPmbE04fFRWY5zj8tRkOTJq1/JiPrJKN+EomZ5RLYSKW3Yga7+NluR2iLQmeKUx/7l4n3CJ90PJQspn2uf1xdCHtC2/nLmzci+193qrkNePpef2X1iCk2UONxzzqD1MQbEQGF8VEJUWDZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBBxawHu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso83688435e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 08:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768321895; x=1768926695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=grkn1v8X7YjSC+2N10jrNHP80DnpBreGGtO6qDJnKFo=;
        b=PBBxawHuyqJJ/lWIjL1n47LS/TE8DXOrsKXuyRls0/n6LI7/dXmcEyl7JmD/U2t7jY
         PduNBxh7wc2wa6NuWT42cKWm4XfuizQ4rJc6F0y8rHfnkAHyzuy2iLUMmEgQ8uICsWly
         EHHDJ4R1n58YCLgoez21Axblx9UPShbWVPtMr6sg0DTFUSeK36rGGlCG1fBwW04ybw1g
         uS8uUvl6vssr5z/pTmfMR1gAHVqOrtDisL+jbJbQkRbfr8WAa2jsKK/HIr4KZTLf6W+J
         FOCEmZaPbcxgEaBHVFxEy3+j8AC33F1nxdOg/3uKcr9X9d9Tifdbg7UOCfAn2uyLX8Kt
         AjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321895; x=1768926695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grkn1v8X7YjSC+2N10jrNHP80DnpBreGGtO6qDJnKFo=;
        b=Xw6gZP/XSAMeuDrUc/fyCqYS6u3vqzab+lpdcSuz/vcuAtkzVrAs1aMjSp4XNrV3KZ
         z8UWvgPTV0CKAGK/65wQmEs8UrnCY//QFf/AbUYITXhJpLCw0akegw/viZBRfwur+nFK
         4y7xwYWb6e38iNmV/HecW+GmR4GqA3pb4KM2rpyXl8xEKeYiPj7bFmUc+lG3h6TNiIpi
         1cIAy3dpZEiPi148Opv0qaMmvdmvZDvvo7BSzSbLRimUSau06tvhY3LbgbXjJCxc8o6q
         pknnFjd5PMwyc2JqrR2DGv9OyYH0xehxhf0ygRVeiL9szwiMEaknBxanTniVqZ79TBgT
         r65w==
X-Forwarded-Encrypted: i=1; AJvYcCWhHgSltjyKAYWOYvNq1V8Co3szD91Mp3FkXsJ3v9obahQUuBK5y6KQvL7F+UdWdBiz1QlMhBOVWR7A@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/NOhpM8ewFTEm8/t/Vv0io48TA7VAR3yL+NAtJB4XnxfuiEk
	Eeb1L7B+7sF3qgwSiTdihFkZRNEO00D4Uue6BvTGkCAQHNbJySjyfA59
X-Gm-Gg: AY/fxX6aieqSB1mjG6tPIKRtqlhAmdZ1pRmbGD8nHfuadfuZpBTUqiY0hrgo1AZ4ISQ
	TWIO/P1T0pVJMm94AASoF/FrzpOkfzYYY+wi/Sb7TmT0X+VX//8W+xFDErlfgruxh9mTGKJWXgx
	YPAVJOJ5e7jPF5SykvssM3EUEBnQCD8EP1dM5MEFwBbYQG3GvrX1Y9693zSHU21v7lHM4fxvLFn
	yetqDQYm/IF7m3CPXbBSQy/DjrxTj0iC0eIR7K8jeDOGGlCxhxYlWfvo18c9J7cs/nCe4Wt/tH5
	e/5fgGrLlac3Qg9rF6avCm0GodsizKwcbdtRLqGEaNPaQ3q5sG+KyW6HImZeFgGaoaGsguoPxgf
	rn/HAi11GUiWgkhmiQfIwNqsuNfpspuRc77fcnoygg3jAEjMEBGZT+/yxJebAfLKkD1E3xslHLQ
	vuziSJE9Wogjj5nSWoU4E8bBEyTk1ofqX/Jpj4Jd3E9IizWS4oK1flFzhRtgnehO3c
X-Google-Smtp-Source: AGHT+IE76r6khCk9GhD6pPYjROvDziF403oJS/8McLP7s+xvzVPzDhrbdQizx3AjhSkT2XmEvncKKQ==
X-Received: by 2002:a05:600c:840f:b0:47b:d949:9ba9 with SMTP id 5b1f17b1804b1-47d84b1895fmr274042315e9.13.1768321894647;
        Tue, 13 Jan 2026 08:31:34 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d286cdecsm31463451f8f.7.2026.01.13.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:31:33 -0800 (PST)
Date: Tue, 13 Jan 2026 16:31:33 +0000
From: Stafford Horne <shorne@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: gpio-mmio: Add opencores GPIO
Message-ID: <aWZzZWTjctHasCHh@antec>
References: <20260113161152.3688309-1-shorne@gmail.com>
 <20260113161152.3688309-2-shorne@gmail.com>
 <CAMRc=MfLqoPvCiEtunvfidaRGAfZFbGM98y8vjj8R187ziUtdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfLqoPvCiEtunvfidaRGAfZFbGM98y8vjj8R187ziUtdg@mail.gmail.com>

On Tue, Jan 13, 2026 at 05:20:28PM +0100, Bartosz Golaszewski wrote:
> On Tue, Jan 13, 2026 at 5:15 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > Add a device tree binding for the opencores GPIO controller.
> >
> > On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> > opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
> >
> > Link: https://opencores.org/projects/gpio
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Since v3:
> >  - Removed example.
> >  - Re-order this patch to be before adding compatible string to driver as per
> >    device tree binding patch rules.
> >  - Add Reviewed-by's.
> > Since v2:
> >  - Fixup (replace) patch to simply add opencores,gpio and add an example.
> >    (It was incorrect to specifying opencores,gpio with brcm,bcm6345-gpio
> >     as opencores,gpio is not the same hardware, its 8-bit vs 32-bit)
> > Since v1:
> >  - Fix schema to actually match the example.
> >
> >  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > index ee5d5d25ae82..a8823ca65e78 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > @@ -23,6 +23,7 @@ properties:
> >        - ni,169445-nand-gpio
> >        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> >        - intel,ixp4xx-expansion-bus-mmio-gpio
> > +      - opencores,gpio
> >
> >    big-endian: true
> >
> > --
> > 2.51.0
> >
> 
> This is not a follow-up patch. Please rebase your fix on top of
> linux-next. I already have the previous patch in my tree and will not
> be rebasing the entire for-next branch.

OK, understood, I wasn't aware you would not rebase. I will rework this rebasing
on linux-next reberting my previous dt-binding: patch first.

Thanks for the clarification.

-Stafford

