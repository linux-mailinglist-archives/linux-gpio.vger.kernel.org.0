Return-Path: <linux-gpio+bounces-25298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D2AB3DC9E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3A811889045
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7092FAC1F;
	Mon,  1 Sep 2025 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LmJZZ8CU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1425A34D
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715830; cv=none; b=Uyuzheb8ZD2FWgm2IbDzinBAt4pYgx6MhYEjEiQuaGJPIQWi4u6xs0FF2L6RAoVsQtWZs1hkjZ5M6SkoOZrXCXsTihnU98yK59us1iSoqxdaC5t+m+lVKXnhLWFbFXMWTwm0EGLmr++wxCza0P3rEKPEQbyt2I9vsfj3ZFHGy/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715830; c=relaxed/simple;
	bh=FgYfcK+F/Jl8NXSBRyrayj37tEliCWqLwdaU8A4Y/u4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACt9DOHrM1c59NjT/+ljy5Kvo66+cyweKIBFVUAGS88iOBq/Ooj9nx2TMH5bGqcS/D81FuNfK3LWq/e6ydkZyb+jh7NAPoe+cmymNTDbW1dGyVY9hojO1GocOURmbFh3qT/aLkirkS5JMKJj3uzy/ErkLgAvTFNJEF89Aw/i2Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LmJZZ8CU; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b04271cfc3eso107691166b.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756715827; x=1757320627; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yr1dug9uoqsjy9Ng7VRdaYQdcsKDOrIf9XRnIh5aotY=;
        b=LmJZZ8CUv0vYnNZHCKc4mq3tGhOU3pYmuEfFermoxACzfCCT3H880FFPhf6hp7Fcl9
         NqHAoXb2J+2YA+uYx7ZvQo9WRfz55eP+pSAIVADcvqfGc4PywpXgH9CscN6dV6WI62Cq
         P9iQS0osjTTm7HqMqr4GD3HuwVQPS/ESh9GE2eEa9edLhGHkmFAGS5O9rj7vcF1EX9gC
         gCUbspXZM856joewDDhbe918Ata95FjULf1klm3vN1Fib4hlQY75b3uD/Xr/0XBgTihS
         i02XZHPA2hPkAZoLIfCYXi3uXyy7Z2QUCObDVq2wYSaZEwCv2Br3g4jiA7DEjJKdJYb6
         Netw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715827; x=1757320627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr1dug9uoqsjy9Ng7VRdaYQdcsKDOrIf9XRnIh5aotY=;
        b=Ci46tyosNmxy7DxiaChqWhQocpWiBXY80Waw1jhsKaoqhuzwpJMUfg566GfUF8abpE
         Urz5qp1TK7y/+Q/m+u2s4RXIkcfqXb+BIdJr92UxS6MtBJEbqy3ImpD1VkOtLn0zE7DT
         CVzlLQDI9pe6SbOxIpfKdU4nmeKCVcgo/6AKTkgfCD6D0L89v+ChuuG7IX+7eRUbKmzt
         C3964oEggavCVMertzM8jQ8enepdJs0T0EyEeQDJlZaDsUj+KR6Ow+UzpSG9KooWBBdT
         7cmIa5qeBVGHd6OSk3iD+3R3PAaSDzsciKDOEqwEXct7i65KbP4eaApx3on4XSJeiAVa
         3JYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLRQSWbBoQttzkcloQd9DX0SYT3I7U7nKvXcLJzKA4CECcBy95mUFahBTsTET3tymGlxErMeLSV39T@vger.kernel.org
X-Gm-Message-State: AOJu0YzDLvXQvKOOTl59wTD5jwMOX4nssY+FQeHg3oTrnRqndgHf180q
	wfvWTatENKzfdTPbO7DYPpjw14sBWAdWcIsZolJmuEoglfRFslQIiQ0LjS/xny/y4TE=
X-Gm-Gg: ASbGncskx9MpaFgPhGtq/u5Dp+4pna/b0/iMbCnYS8XODPB/mtLBJ2dbb/JkJNtQopq
	1atVEI1CsOu8814fe/okNbz3a2A+PZMC+1n0KI3tBQaNhQ4YO6fBQjk2GPbmVY6UtwXyXYOpgx5
	5N0OmjjfSIULAEHZ/6dZy4MaMxCpit7R93pjdun3cCw1riF7onr7FkewgPwswwqbGzhwc4AdoOH
	TaflHRJWUThs9S0WGuZaUuG15BAbHHMyT5F0r+5eCeZQ6HQTXisv7Rge/LYYmTmE3zjUE5YiKDH
	tQlgh3ddEKo6QNs135CrNTrPZjZInZvqByLpJcFZfNwrnPNcwFv9tlSiCLrtYjMz+sVP2gXrfbT
	ylSEgP6CA8xV+W9s6YncOcaU1fEAnYKw+iye1k565rmDl2ag8QIpIVPIZMK4AL0CitHnFBVFQA2
	oIhP+q05r4zSmOLTec
X-Google-Smtp-Source: AGHT+IG4idgtXWk4yyXo4GDjPHKwPNprzgZph1e8/RSYaT9SzIcOKN/gOowhBxj+9vbOLZt6n+qv7w==
X-Received: by 2002:a17:907:1c0f:b0:afe:b7c3:df29 with SMTP id a640c23a62f3a-b01d8a3274bmr655257566b.8.1756715827391;
        Mon, 01 Sep 2025 01:37:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b018fe7c638sm550465666b.6.2025.09.01.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:37:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 1 Sep 2025 10:39:02 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aLVbpq99bDHWPjV4@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>

Hi Linus,

On 10:21 Mon 01 Sep     , Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
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
> 
> Overall this feels merge class, I am looking over the requirement
> series from Bartosz to see if we can merge it all today.

This would be great! Thanks!

Andrea

> 
> I also looked in a vendor tree for the (by now 6 years old...)
> BCMBCA driver, but it appears to be a completely different
> beast, requiring some magic 0x21 to be written into a register
> to "commit" a pin control change.
> 
> Yours,
> Linus Walleij

