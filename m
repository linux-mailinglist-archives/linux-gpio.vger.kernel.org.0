Return-Path: <linux-gpio+bounces-30574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D0D1FFB6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EA7A30B6A9B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4C339E6E9;
	Wed, 14 Jan 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHqNHHoD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0F93A1A3B
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405826; cv=none; b=drczttIsQAxkXWxdvcv/gtUu+q07kK5NRyoibyZkDeBy/loEOTv47TJxu2yWKLNEuG/oQvwJEutlatNC96gZuDv5AdLyNA4Vpy6qOgAwK8WUMpkrIExLS+OVXW25f36xluynV4vN6CI91opCl6VuIpAKMtcX/5eZVNxIfOa7oCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405826; c=relaxed/simple;
	bh=ddQehrH3WSA3nGxMiaRyAYUbIlWNzS5C9Jp+zx+8H8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp0OQXts6atI6mSGcMBASSnr7L979jXeoWvrmwiiWxbC2qaewA/d8TF8ku9eRxjiYuajSCOvUAepaaejwTyN9+aX6vkVmoO9SUhhFtSwU42HdH6jyjxgw0FvfXwI5iZoAQ7WI5K1WDBh8Tyb5YxG+MAwMrEJXQp8hynB5w0/0QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHqNHHoD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fed090e5fso5126617f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405821; x=1769010621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOiuVPrIXtE3jtOHLTY4+B/ZSnvL+yz9lGk8+TFFzig=;
        b=fHqNHHoD7D5VZmBZqNtYp067LU/SrgHKWVBJi4y0eNECXv/XPcOHnqDI+xgib96fbi
         UxrYOxxtwtKMGAK26ISfYunfWRjykjvxD5Pmycz0Ndf6HHj93XFG3PdobFh+yEG1aysu
         Y+IWkT7zBiCL4bBbL7xT/9plnWH/G6fkwlDm0cD/tkpjRfhkF/yxATVKSPu6bDDHtD3G
         LP6SAd9gwHx9Xzto76YC9lq1V1hNHIDNOzKfp8ngvoZe/NV286Fmu8e0GNB6ucMbhMwO
         5cHx0XjJZngKJV3zGMLYE/4PC1xwGqqMxDbnyeH4muNON/NrbSqSGG3d1+NzUDvEWjnM
         hoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405821; x=1769010621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOiuVPrIXtE3jtOHLTY4+B/ZSnvL+yz9lGk8+TFFzig=;
        b=rvHo3RygGza4TtPDckStFwDFDUtzZ3kSqBgBJX4YD4aMzG1hU6tJf/tMpUFd/OTenl
         G/EayNEUv6tl3Xkx7qjS8r4AfJI65lbBVLLdtGNPA4fqW8ywCTzB/avAtvLG3jLR0zTj
         ewOpJtTwnXGImBjUFTqp2yq/Fxrp5CgeIDXUnQuZxyiz/Hz6H8sPcwoEDQr5MAc8H10g
         JSbfl/pmrorWnCzoAl+xYxiPnbtiif0tgbDK105UK+vD+rQb/gng048pgi1vY0xZVxne
         lTp8CsN4r/E/bDuARP3BEZwc2Y+UbdJjwQ2/9752hu5WhCWnyMX810MCny8d8B+46rEK
         NwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsY/mJcbsti7AsgsBczZ3IHtcn88Fs6/7KITY06GEdI9kXxwCeKhA+D2WhMlStnssw6KbFcrDWcpZb@vger.kernel.org
X-Gm-Message-State: AOJu0YxjEnFA3yZXb1rOpGVZS6u10Y4RrykSU6GAmwbiayUB0n85OO36
	gA8WvdZRANdATvDF9wVyMBFSSZpbZ5VzUakH66VvugePbfXNjlL4NiaM
X-Gm-Gg: AY/fxX5PHylXsvZTgfgY2IwSZTDzSiofMnJ7UA1s0l4TY3/W5zXLWbs41X8dBFFrSaf
	4z/OsVTrfDRp5c0Xksl6FRRjMJJEi+inpVj15ImPTODNwsVMdLwfSFyvRDwAurEH75r4HPCKlno
	a6w6Y27uapo0Skf+27lDIk4DZcYZTRnT9H5NAeQm5FW3iU3YisPuFMVkedDPUHqsEZvQe+KQ8yi
	ViHko9wFuPowqygsWS9JDSiDsZZMxajetkJgrDy6bY2TRx6Fm/pPNQAa7pS3l8+VQL1shz+kNsH
	5MvXsqNxOdJnbdjr9VJz1/mC3ug4Bqe7mgGjglNa0LG+ztLCDuO28PgHBOORkIHimksca70hQwf
	uACgCgUkd+4zg61otU2mw/n2DKcpSrmJKuv+B3tEWQJZJOd//hwU16zvjP+kabfzlInxrrO26G2
	bVAobBmsxTHcVrXBlNiUtz9y8VIQ0tJcZvYpYiXHEDQnGDQNzmgN51Q61DgkyC6lce
X-Received: by 2002:a5d:5d81:0:b0:430:f3ab:56a1 with SMTP id ffacd0b85a97d-4342c557659mr3494985f8f.42.1768405821138;
        Wed, 14 Jan 2026 07:50:21 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a650sm26077f8f.4.2026.01.14.07.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:50:20 -0800 (PST)
Date: Wed, 14 Jan 2026 15:50:19 +0000
From: Stafford Horne <shorne@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: gpio-mmio: Correct opencores GPIO
Message-ID: <aWe7O7njC1gTIUcA@antec>
References: <20260114151328.3827992-1-shorne@gmail.com>
 <20260114151328.3827992-2-shorne@gmail.com>
 <0bb9de0d-f811-45ff-b673-8811540b5376@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bb9de0d-f811-45ff-b673-8811540b5376@kernel.org>

On Wed, Jan 14, 2026 at 04:43:35PM +0100, Krzysztof Kozlowski wrote:
> On 14/01/2026 16:13, Stafford Horne wrote:
> > In commit f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible
> > string for opencores,gpio") we marked opencores,gpio to be allowed with
> > brcm,bcm6345-gpio. This was wrong, opencores,gpio is not hardware
> > equivalent to brcm,bcm6345-gpio. It has a different register map and
> 
> "is not compatible with brcm,...."

OK.

> > is 8-bit vs braodcom which is 32-bit.  Change opencores,gpio to be a
> > separate compatible string for MMIO GPIO.
> > 
> > Fixes: f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible string for opencores,gpio")
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> > Since v4:
> >  - New patch.
> >  - Rebased old patch and rewrote commit message.
> > 
> >  .../devicetree/bindings/gpio/gpio-mmio.yaml      | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > index 7ee40b9bc562..a8823ca65e78 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > @@ -18,16 +18,12 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    oneOf:
> > -      - enum:
> > -          - brcm,bcm6345-gpio
> > -          - ni,169445-nand-gpio
> > -          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> > -          - intel,ixp4xx-expansion-bus-mmio-gpio
> > -      - items:
> > -          - enum:
> > -              - opencores,gpio
> > -          - const: brcm,bcm6345-gpio
> > +    enum:
> > +      - brcm,bcm6345-gpio
> > +      - ni,169445-nand-gpio
> > +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> > +      - intel,ixp4xx-expansion-bus-mmio-gpio
> > +      - opencores,gpio
> 
> So if you are changing all of the lines here, you can as well sort it
> and put the new entry not at the end but in alphabetical spot.

OK, I will sort the list and mention that in commit message in v6.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks,

-Stafford

