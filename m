Return-Path: <linux-gpio+bounces-29594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE465CBFBBE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 21:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 219F630557A7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 20:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319FD345730;
	Mon, 15 Dec 2025 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hP33xbMo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421C3451CC
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827285; cv=none; b=duR3cjxgeN0Bqrhfczc4X1tdYerDIjy78QB45W/fic+6BxNU6A8moYc6f21JbHEQwR8tdWoE7OWSDlIFcZ77s2BKsZHVN4r11b9TF+v93aYWXlkxcAigUNbc99l9iKWPp/XiewzqK0PXvtqGOKsBIEuwp7CzVgs1Rv7Ieoo+e5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827285; c=relaxed/simple;
	bh=R9rr7JYAlu4ut1klPHqgSod04bJtytEccLyOYIIOoOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGcs2OcnopocPsIbfmYsYpXYr6ABL3NmKvhpbTzYxJzDS/wx6oXjJvy9iO1nG+T+iF8k6NiqhFqg0coKn8Pgf99P/UJLIv+87B0kZeiwce+iaQHOAdEa9WZpiBz8cO7PL+9oFn6566Tm06MvnSkuNd3yCKkxgyd+LG1rFxukcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hP33xbMo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so24963765e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765827282; x=1766432082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xvsN36HEjkdkzaTc/2dKVIMfjzjS0gkF6l57K40dHSI=;
        b=hP33xbMogz6C+7KYeJ4qUY2y/7SUagcVMZnRLJK1gzaibawRUhT66dJ6GpTu/C796Y
         Rxo4076qBEOjdfB5DJwbxgrMHLQvvtufQvjED7i3vXS3Ksvg1ng44+lrUJVbEudf/kBC
         asxaA7eMuS4/vMz2Rbkq4R8UjtHx7dpKnTtWFSSn6GHDTl7JhQk+jpZItmTkQGmk+5Zv
         7rWDGBBe9WY9AoQ6s8qJ0qKABXDHBzLctwmteSMzoMFTftdVivb8eH7mzSsvGQD/PO02
         3412cSpQ4/Q7Hpop3uUoS4FFZ8vr0HVMsPL2GrnOC7bSp7W/FsyeAyIzC2bbDKEctIoa
         o+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827282; x=1766432082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvsN36HEjkdkzaTc/2dKVIMfjzjS0gkF6l57K40dHSI=;
        b=P4CYgLSDa5y/s/0X9cLhAxFDNiqGlrLoWqZnpBxvOCCvUq7ui9fJ1+pdj9P3uz4jFc
         lwKMdFAh1A5RPCEaTP/NkSQrYrE8t51PqCXfANTY8wddLVOstBjgiyiKcDHRO8I+gUwI
         hZMvVYfZdPBGi0W6F4BIzItUhG6rudtCwZ2qHEmXfUsAtfpfugZ2IYBICYKlxQg7rRJf
         LD5XX2ZZUAEnzbNSBHjQZ3If6mr8CuOMLJ/0egAVYF/UWtkVjX7C0uQZUY0gwIKmbXBq
         LuxpER/JIVfk1JUTDc5ZDiFWp8h4shTyGd/A3eW3HaOAnfy0uOpV76XEw7IqQmy8p4z+
         QAeg==
X-Forwarded-Encrypted: i=1; AJvYcCVEmqEfhDf5MspMAXUa5kmM8c+9Sq/XKkb2hU25egVjsDzIXPoIDAutGKosk3qpIWDeh2Do62Be8Nln@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGz6meWLI+58e+p3TMkECgRA1bkhDfpKW4dGITp6xi768mdzb
	tttfPpVQ06YAL6TxGCIW6K4HwNyHvKMFCIRUwsRdmPgbIqm6lA1gRKaK
X-Gm-Gg: AY/fxX56Y+yl4iFnKCX+rh/1vcRKKAAUxwtDFMjSiL0EHaMu54CafBiDGr1hiZuR5nn
	1UTCqNchIgM/iTxtgxJ2PZeETkuIrVoMbXs8IbMb+PjhY1ij6AYRfazJRNgUWOk6x+p+mX5LVrU
	1LFa0ZqcmOiysJ1WsEPsV2V5HS2aNBcH/XSI23JAb22g4HB0wCEf1OXCARN53eSXnpslvX2cLM/
	DO2CCNPUZPG9Lch/JylTvznhoqIS2Q4vG6nJQvXhyRYVXXIUczmhnddAc//NLhDfO/tGwpDJEQ7
	oQKyyqDxCSjeB8NytWIQasW2DQIoeXVOv97e7nwmSU6kKV68p9PHELQ28Sf0clyOmjT87d5PA75
	IViFnaymHITzRRSzsQa3qu/PkL1Tsk4BeEybjCkc44hsTEd8OVo8nPocVvjYxcopFCyzzAS88oW
	KCaYm/e47gDXuWeX3BaABNDmjrzyrZQeHF9gRLj2Xr9TOT6pL5w3tKhVidQ7/7Q5Bx
X-Google-Smtp-Source: AGHT+IHqMmTrPYwvoqeuDlvMpEDl0MXgKJmnwWH2vCQFY8SiusRi4m3bCAkknOzdZ7YPRYj3LhSsRw==
X-Received: by 2002:a05:600c:3ba2:b0:477:97ca:b727 with SMTP id 5b1f17b1804b1-47a8f907d9emr138780595e9.19.1765827281485;
        Mon, 15 Dec 2025 11:34:41 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fbc6e3392sm19493062f8f.13.2025.12.15.11.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:34:40 -0800 (PST)
Date: Mon, 15 Dec 2025 19:34:40 +0000
From: Stafford Horne <shorne@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: Add compatible string opencores,gpio to
 gpio-mmio
Message-ID: <aUBi0Fid8vF-G8Wl@antec>
References: <20251214180158.3955285-1-shorne@gmail.com>
 <20251214180158.3955285-2-shorne@gmail.com>
 <20251215-skillet-perceive-2b564a29ed71@spud>
 <aUBWMbKLMWO2Wv_B@antec>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUBWMbKLMWO2Wv_B@antec>

On Mon, Dec 15, 2025 at 06:40:49PM +0000, Stafford Horne wrote:
> On Mon, Dec 15, 2025 at 04:57:45PM +0000, Conor Dooley wrote:
> > On Sun, Dec 14, 2025 at 06:01:41PM +0000, Stafford Horne wrote:
> > > In FPGA Development boards with GPIOs we use the opencores gpio verilog
> > > rtl.  This is compatible with the gpio-mmio.  Add the compatible string
> > > to allow as below.
> > > 
> > > Example:
> > > 
> > >         gpio0: gpio@91000000 {
> > >                 compatible = "opencores,gpio", "brcm,bcm6345-gpio";
> > 
> > What you have done below does not permit this, it only permits
> > opencores,gpio in isolation.
> > pw-bot: changes-requested
> 
> Understood, I was not familar with the new schema. I was trying to follow what
> was seen in some other patches, now I see where I went wrong.  I will fix this
> and use the schema validation tools to verify.
> 
> Thanks for pointing it out.

I think the below is correct. But, would this be ok to put in one patch?

I do:
  - Convert compatible from simple enum to oneOf.
  - Add items: for the openrisc,gpio compatiblity string.

 properties:
   compatible:
-    enum:
-      - brcm,bcm6345-gpio
-      - ni,169445-nand-gpio
-      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
-      - intel,ixp4xx-expansion-bus-mmio-gpio
+    oneOf:
+      - const: brcm,bcm6345-gpio
+      - const: ni,169445-nand-gpio
+      - const: wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+      - const: intel,ixp4xx-expansion-bus-mmio-gpio
+      - items:
+          - enum:
+              - opencores,gpio
+          - const: brcm,bcm6345-gpio

Thanks,

-Stafford

> > >                 reg = <0x91000000 0x1>, <0x91000001 0x1>;
> > >                 reg-names = "dat", "dirout";
> > >                 gpio-controller;
> > >                 #gpio-cells = <2>;
> > >                 status = "okay";
> > >         };
> > > 
> > > Link: https://opencores.org/projects/gpio
> > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > index b4d55bf6a285..0490580df19e 100644
> > > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > @@ -23,6 +23,7 @@ properties:
> > >        - ni,169445-nand-gpio
> > >        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> > >        - intel,ixp4xx-expansion-bus-mmio-gpio
> > > +      - opencores,gpio
> > >  
> > >    big-endian: true
> > >  
> > > -- 
> > > 2.51.0
> > > 
> 
> 

