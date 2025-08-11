Return-Path: <linux-gpio+bounces-24213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F2B21548
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 21:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AECF1A20B90
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 19:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A582D7810;
	Mon, 11 Aug 2025 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CerY5KrD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB82311C13;
	Mon, 11 Aug 2025 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754940117; cv=none; b=REospKGzssVVTlEM3WRTMEjyugvrJ3t8eBJzSd1pjj7EG4HZQ/7RLvrclf8MjeE5pVqL5NG5+/roJXm0HTi4VRPaozhJ0NSRh5Z58Ma69a3kU2+lQ6DMNQMt9DnkiQkOP+tmjoZ4c47CEkfEcvfI+oqHRQn1TVbVhjULRmcUENU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754940117; c=relaxed/simple;
	bh=q6vUO1LUw1MQiS0jp/g9fLsU/SLKkeJqnk9YMwD57BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+tIouXr4DaIQ6iVkeUm/VWRFNt1IgeqP/efzsnsOTFLTpVQjwU3td+ggR7j8G85bhinvGkk/myAPvwiP5kRQO3zqnLLrQeShmCvJ67kWh6XzU2Z12QQZDNiPdTnFy6j3uXPyOOZi8DKa6hP23JLfMGmDocBixCln6oQf4tvfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CerY5KrD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76858e9e48aso4161797b3a.2;
        Mon, 11 Aug 2025 12:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754940116; x=1755544916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5X+m1D+29cxcS9CDLMiWrMU592qkoFKmt7du6+JeuBk=;
        b=CerY5KrDgJNCNKtNmdSni20w3UY+cJs1RBQmg7VHuNZLM/Goi4rSsW7U8/fj6w5c6q
         2kvAhMsG3+IUxkxgpfpH4ByuTf+lska5ygH5xYzcm9KnWj48I7cSuwBeaWw7mdWEaFgU
         SxdRRACEamYaOEPh4bPIlXDFDuyR+Wo99zoyGWR54kprvXuDigBs+f0sflp1tlvNI+l8
         H2BpCH7bBCcPxIAYOkdk6VWZbxCAnsPvljoIkVgX4UavmLWyILKKUMZh4vYCKZFbgrsd
         +kZZme6+xl9b8/fzkLSInUK1RyWVZNuZVttxzvBw18ImgqU8JIunt4oasQM+vSdeHKTz
         z8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754940116; x=1755544916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X+m1D+29cxcS9CDLMiWrMU592qkoFKmt7du6+JeuBk=;
        b=EKB/ywbawJ1FoqSL5vER/tnqvqv/O6oONCvmh8YkcWiG2pK++snseZ3fCj4kqzIkuS
         5pe8kF+goj7TawKNcqZBeewCLa9xapVGCJciSBrXsxC6jRbo3ouFNFzjMV05P6qE5Aig
         X/lJyXlElE99gtVMwpGVB/OeQMte+DS3JSNuWjCzFbc13Zm5sgTxQA0m8Qr86XycfbTs
         bPrA9B6pfMAOLjC4VNP+f/BHu4p0ABzyWn1sB3a71xt9qLBXU7k09opIkkNeyWhX60j8
         UVa3Ghu1znpBIJoDSc7QEKtuzjnM5T5Hi+LO/J0S+HTmgInXfqc95x1vL/Uhg06NF+Fe
         tCPw==
X-Forwarded-Encrypted: i=1; AJvYcCUpDdrgEc2QlZ2qTnnAgI8CxNjWzxxc5aQiHx9tkeC5WivUx1WlnlRE20/rRwPNgJPgAtqi6kbfEwb7@vger.kernel.org, AJvYcCVG89wqTJ1JNtdLX2vSuRljfManpCpDA5WoV/6prXNTA7vyE6V9LHx3aMwGjaXQAlCWXF24IYe2ROVMols=@vger.kernel.org, AJvYcCVqZNxNTta1NYB8qkFUbanjAwJZBJwzeg2UCk4yc4y9RTgyU8pCcwtIrMWa6jvg2lrsag6+cXgjUIZzxcWA@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqLNoXHBk9ZiWgjuaiOMyZw9f8DSN/NS4no37HLYFarwEwFEw
	UB0htbrJRHeW1sXC2JCH+XmgihChvhJZh+FLm1PJFO7Y9pe1Y/aFrlJc
X-Gm-Gg: ASbGncsM3nPZGe31leH+MttMx5KQrzcIhRWRIRTrflVtwoAw9xIeovyCD5ZiaW3rGUQ
	Fq+afuW8dxPsiiriSXaeBUJSDhYLArykyBfNfHsUVMlG5bB4G1Kmmtv4ZFo0clP1kbFEpQFokbr
	OtFh6mRnl3cVEofmYj7eQMh92oO6ySLVx308/sE86/Nw7sCKcOWLjp6ItDCVKSsESZZpqROOPeT
	D2u6LDjVaPQHeXXXzpt2BEcOUbTEwsObDmUrSIw77UaR1faL8sVa5J5QfUl0VJNb1iKnb3KJs7t
	aGCX85gZMCTzAfmbnLV+sc8tjuss00/+XO3cDoNun1yIW9ek3dKczQQv/cX8R6m0efna/ah+ENG
	Dit78AVxNzDFFHR8dBt3AJic=
X-Google-Smtp-Source: AGHT+IHTBePaeMogrxNHoERLv/u64P5eEMxy3rp0ld4rJBrJHJ1JWgcnxDhX7J/c8Z8e9gplqP2gog==
X-Received: by 2002:a05:6a00:39a1:b0:76b:f260:8614 with SMTP id d2e1a72fcca58-76e0ddf1eddmr1126933b3a.3.1754940114735;
        Mon, 11 Aug 2025 12:21:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:69d7:30de:b05e:915b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bdf61d182sm24617278b3a.119.2025.08.11.12.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:21:54 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:21:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/21] input: gpio-keys: make legacy gpiolib optional
Message-ID: <mrqxggv7vhclnranoc3uacfyzccod6dmc54kip4f7wjdpngjzz@falnsjwnfcjc>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-10-arnd@kernel.org>
 <b7e97aa3-8f2d-4a59-8a38-577717404865@gmail.com>
 <aJnng9z9pUTFI49x@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJnng9z9pUTFI49x@smile.fi.intel.com>

On Mon, Aug 11, 2025 at 03:52:19PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 11, 2025 at 01:34:43PM +0300, Matti Vaittinen wrote:
> > On 08/08/2025 18:17, Arnd Bergmann wrote:
> 
> ...
> 
> > As such, this patch seems Ok to me, you can treat this as an ack :) This,
> > however made me ponder following - is this the tight way to handle the
> > power-button IRQ? I don't see any other MFD devices doing this in same way,
> > although I am pretty sure there are other PMICs with similar power-button
> > IRQ...
> > 
> > I see for example the "drivers/mfd/rt5120.c" to invoke
> > "drivers/input/misc/rt5120-pwrkey.c" instead of using the gpio-keys. This,
> > however, feels like code duplication to me. I'd rather kept using the
> > gpio-keys, but seeing:
> > 
> > git grep KEY_POWER drivers/mfd/
> > drivers/mfd/rohm-bd71828.c:     .code = KEY_POWER,
> > drivers/mfd/rohm-bd718x7.c:     .code = KEY_POWER,
> > 
> > makes me wonder if there is more widely used (better) way?
> 
> FWIW, on Intel platforms that use power button by PMIC we add a special driver
> for each of such cases.

If we can make gpio-keys work for various power buttons that would be
great IMO. The MFD drivers in question already are using device tree,
but they do not define/expect nodes for the power buttons. If the nodes
were there then I think gpio-keys would work out of the box?

Thanks.

-- 
Dmitry

