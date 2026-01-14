Return-Path: <linux-gpio+bounces-30555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFBD1F673
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8868D3030913
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 14:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA1C285CB4;
	Wed, 14 Jan 2026 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUMwOu5n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26888286416
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400686; cv=none; b=KCi0+PMfwP3ocBOL27GZGcSyUv5JDNlvQhoE+ZOoJlOi5U4CjfXohu7wKMrgrovxEangYbdscxiXE81Vj+hjgUBn0S7Uvff8fpMsXEXj7zJ1jE5hDOsT+jaaexou+VoCBaWJKvoW1sjTjVF64dv+keAFlzWlemWtKV402VzkhSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400686; c=relaxed/simple;
	bh=5oL6AvIqkyKwZjO0mD2/yYyQwRXx8TSv2K9qlKzrIXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qm2bd6VdFcffAv4djbztR1oDspFhGZo7gq4O84J+ieHOmlcAuyyLLxiXhPQDEHbXhBK0GhKrEfkqGEjpbwdqfEX1hxD0PH/epML0hgCuf6Jk7tykSY2mCuuHY9xbQYuLh1SSJXpms8bwt56qeVQd1wUzKwBI/HBs3oDCov3Y4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUMwOu5n; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430fbb6012bso6938861f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 06:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400683; x=1769005483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijENdGZX9Lgu2wTs3qW/G5R3AgDc664xhdb20AB1kI0=;
        b=RUMwOu5nLQqNO95IbNVJgOcZ6Ss/9l89DpfA8Y7a97Qzzr3+pqQOrsV/nAbeqi5MOM
         BueDuyx84ql+bJOsZt8m6lrgA7Ekx3r656bVODYGCjoti+jaYOEZaYLcm23Yvnw5+EVv
         3iDtL9I2VVa2Z1iX2cIA+1sWu3mfh1lQIJQEZQad214Bik4cKa1Dt+Ouv0SrSd93cK5O
         yz6Hzg37MXi5gVLmz9mrm+iwpPhiDaAoQz2KEJJCQ6LCitRIXbpyEzPEwz5XTluzHwpe
         EUjREbsq9ADAtJ8m9UBdl5JNISiFGc0MXrkpuJomoFWkpvS8JMZNbIxyVJa7PLt7gJEx
         m/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400683; x=1769005483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijENdGZX9Lgu2wTs3qW/G5R3AgDc664xhdb20AB1kI0=;
        b=rAo+8Ikih8U1o2U+H72i0FJoDJ4xdMbRZnmAxHCIsrMXogSCuKrP0cHRLRg8Z6pvuH
         bBcC4f1ezENbS7xRYGV3kSQLmWaq7sa+RgFp1/A8SVM4TnlRS3pvaPLNqCFSzofiwkpl
         p7bavOfVC8MK5MBz1Wo8wkC72gb1GUokUu8kTMwlClp0w5ZZjwTGVrYDsD3JwZqWvDKw
         o6PSupAwwf6bXMuBLzJnN/o8z27tpOIO9Ym9BTH06PhVJqcLYAwfbQxQPq2j+/m2+/RK
         n1jaNcgBgNB1hEc51bvAzuXyP493aGoGLKWnJU5EmB+T7Y7w4nL7FCsCJm2pj7f77Hcb
         u2BA==
X-Forwarded-Encrypted: i=1; AJvYcCWRnpOPWrTgnP4EfGOdc2LrByVnnVu4Lf8CEqYLNSbEbxA/RN2O2gQbCkmKJzdHY0a+0XsbK7gvgjeE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33xTmJeEVKa609I664uP0xT//mLzzGWfspRV5+eiSDizSWsJ7
	xrfsszAvz6T9JyXNTwfRTQZWhHn68+HgujES5cAp0wZmIXeYMc7y4X+8
X-Gm-Gg: AY/fxX73xvgxS7vzWFv0nRFHQCAYzsi2SO/Utfp2aj4Dsy6O/k+1h2qcjMPqt1nbsib
	2SF56+lT5m6zeR6wtjHpt5X+u7E2wwy655mybnDTDsK9LLhitlywQa3uGMAgPLYiGj4XHl5VJgj
	NnKBY6mqc6/O1Oyk29WvtmWZmxHmtRDB8LmVnEP337fzOLIDO7N4NNFgqTKyRj8DF+ZZa5IEi7N
	P3idGlAjAe9ofaYIaZoS+xJuZfHvPyL4h/LM3TP2GDyRdKPDH8zy5zrKWg6FLFj7U/JGyMyVO6P
	UNNjY7sABZcjKRtx+iA84p5FNanKjQc+ePx9ApXv5w2NqmLOJqSUNKiOF1T0F0sq34POkcmd4mg
	tuRCitc3isI20WxxDrIBAW055qNmpPFbqYcSnFlm8rf5saA1BELr1KmUG8fu/P+aEQivw+gNtmX
	eC1wXJnTP2EA5LWMlv03ypgo/xpigB4pBBZ+NJEOwN0prvEsMZgTfrXIPW19f9ffhz
X-Received: by 2002:a05:6000:2dc2:b0:431:66a:cbc4 with SMTP id ffacd0b85a97d-4342c501145mr3034386f8f.17.1768400683257;
        Wed, 14 Jan 2026 06:24:43 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe67csm50308328f8f.40.2026.01.14.06.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:24:42 -0800 (PST)
Date: Wed, 14 Jan 2026 14:24:41 +0000
From: Stafford Horne <shorne@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: gpio-mmio: Add opencores GPIO
Message-ID: <aWenKb6N6mTJDipT@antec>
References: <20260113161152.3688309-1-shorne@gmail.com>
 <20260113161152.3688309-2-shorne@gmail.com>
 <CAMRc=MfLqoPvCiEtunvfidaRGAfZFbGM98y8vjj8R187ziUtdg@mail.gmail.com>
 <aWZzZWTjctHasCHh@antec>
 <20260114-agile-kangaroo-of-honor-963dc6@quoll>
 <CAMRc=Meicads1OAYM+bRN3B8P2Jt9=D=VNSL-KQytsUiBLaAbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Meicads1OAYM+bRN3B8P2Jt9=D=VNSL-KQytsUiBLaAbg@mail.gmail.com>

On Wed, Jan 14, 2026 at 09:36:55AM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 14, 2026 at 9:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Tue, Jan 13, 2026 at 04:31:33PM +0000, Stafford Horne wrote:
> > > On Tue, Jan 13, 2026 at 05:20:28PM +0100, Bartosz Golaszewski wrote:
> > > > On Tue, Jan 13, 2026 at 5:15 PM Stafford Horne <shorne@gmail.com> wrote:
> > > > >
> > > > > Add a device tree binding for the opencores GPIO controller.
> > > > >
> > > > > On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> > > > > opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
> > > > >
> > > > > Link: https://opencores.org/projects/gpio
> > > > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > > > > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > Since v3:
> > > > >  - Removed example.
> > > > >  - Re-order this patch to be before adding compatible string to driver as per
> > > > >    device tree binding patch rules.
> > > > >  - Add Reviewed-by's.
> > > > > Since v2:
> > > > >  - Fixup (replace) patch to simply add opencores,gpio and add an example.
> > > > >    (It was incorrect to specifying opencores,gpio with brcm,bcm6345-gpio
> > > > >     as opencores,gpio is not the same hardware, its 8-bit vs 32-bit)
> > > > > Since v1:
> > > > >  - Fix schema to actually match the example.
> > > > >
> > > > >  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > > > index ee5d5d25ae82..a8823ca65e78 100644
> > > > > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > > > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > > > @@ -23,6 +23,7 @@ properties:
> > > > >        - ni,169445-nand-gpio
> > > > >        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> > > > >        - intel,ixp4xx-expansion-bus-mmio-gpio
> > > > > +      - opencores,gpio
> > > > >
> > > > >    big-endian: true
> > > > >
> > > > > --
> > > > > 2.51.0
> > > > >
> > > >
> > > > This is not a follow-up patch. Please rebase your fix on top of
> > > > linux-next. I already have the previous patch in my tree and will not
> > > > be rebasing the entire for-next branch.
> > >
> > > OK, understood, I wasn't aware you would not rebase. I will rework this rebasing
> > > on linux-next reberting my previous dt-binding: patch first.
> >
> > No, you need to rebase, not revert.
> >
> 
> Just to be extra-clear: take current linux-next (next-20260114) and -
> on top of it - create a patch that fixes the issues in an incremental
> way. No reverts. Also: add the Fixes: tag to your commit before your
> SoB.

Got it, I was doing this but preparing the series with a revert.  Good thing I
waited a bit before sending.

-Stafford


