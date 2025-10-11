Return-Path: <linux-gpio+bounces-26991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1459BCF483
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 13:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D42BF4E9540
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20896256C88;
	Sat, 11 Oct 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGLMg5bH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9D1D435F
	for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2025 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760182339; cv=none; b=ExE059ncohPtnUGJMWSRLzZ9K2M8nIVVl227wSCQrgZye0FV4Zwv4biShYwr7o0bjQrjxOi3ReMx+DCnVW9RUt4koRQIPgikn1o5sinbQCCYJ/m39O3i7vuFbtXr9LtDohtNjkMNsV9vw7gcMEawNeNz+cU4gRTOzXGORIhzYg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760182339; c=relaxed/simple;
	bh=ZpdfRoBap7LNXkf5zLdbDNb3gQIfNj+XPTaqjYigr+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLRXv/MpBkbgLI51rMZmBPp+PL/fvCsvybmeaEj7Iak0QscllWnaF4mEctCagIH5guQOL5IzAHiGFbMqVWSIB2E6g112VqhCe2oyYI+gW9xeM6g6PecBngtgUqlQCIUFP6A7yrnD5hCAWGqBjsUYYiEPqtXqXeNIpVLFtMAPyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGLMg5bH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so2471426f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2025 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760182333; x=1760787133; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/WhtfIdoyiawysQgDo2chqo5YvMHlXM3yb3ox9uDzOo=;
        b=ZGLMg5bHZxPrHPZfZWcK2S87Z2xCBD0g/VOGQ6mMCp0A6K0yq15Rec1KimnVGKyjeg
         3qMoT+9NaYGra17GIggBdqpNpRsj6iRn/OC647KCo78fxKooNf82ZO28RGlYm0p34g3V
         FiZVLN8MmMRgrc/fUtu6QgoS++yLUks4tnspOWG6XB3o1V5DYeHhDJQ0rh7kem+WEDXS
         ziEMqDncVfKmFOuG8ywTFT+Veoee0XlHIBfB/izdcIVVvyJrU5rPZreB32krjbIn7eZY
         Kb3m4DA5SADsmuCd148TQsy5r4xfJ64/D6AJ1BLH8/KSw5o/onGXTgDpO1S2LF8fa1aF
         Skug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760182333; x=1760787133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhtfIdoyiawysQgDo2chqo5YvMHlXM3yb3ox9uDzOo=;
        b=xBqvkC4ukZr+BQAwZxwq8VCO9L96PH8d92hlRN/n+xgC5bGGCnR54vcRDySgnV7UTx
         DOR/9vBsA+X25vnj0G+ZOyFZ9mgNmtFruJnZ+mseZ7xLdAiqXzDsETDqL8MvQGoS8//m
         h2hY7VGf6gFQn7z7O+jcRlCM09YMDz1nQhz8GgECAeM5rVZPaj5vJ+JqBuQTarnxj2VB
         l42brqzpCyfu0qLswg6RJrCdxO7CQw0BCfApNH1jXTzDKEj0LDF4IDZzpKV5IC8NEkPg
         2kgqaxV4k/FF05slkdPAgEuwWpv/rfdw1eaVVjOlcwjFK6PtHGv3iFaLxi13AsouA26d
         GmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOEZTxhiNExa9Wo43eENZSwZHDeADVey1c4dYPKCvmsMwZZzHeyh9ZAE6/I6JifzET39BUX9968ukH@vger.kernel.org
X-Gm-Message-State: AOJu0YxNIJvYiqpDJP7Tqvk76PqxPMYDyPVRl0N8uF2KBbB7SIjuKOg/
	5xFqBUBUy4fv2wcXxcnLIaNsoSLQcxYNNPUZfCnIPwjJdIHAnKF6Co/a
X-Gm-Gg: ASbGncuboUXBbW/B9qr7QZAxBaIBJSYpc9PeLxzTckfnNgFAsEdRouMIOhL8hqHi0g/
	1A/VjdWpWBzKdVzKczQZxpz+7b8dE8qwmCS2ktSHzBDForcGVgzl6EfDK8rJUY3Twf/04TD5pYO
	E9WMw9KIqeEKHXz/kaKW5R4mUd+NfFMlENAh4TiaLF83hFdy/jEK6sRotlEOHSLY+fOLmmQJXQa
	RQBDZEkDMYQneJwPjbSwy2ij32hDJQ3e/ddq3BUUAMzx3NdaF7NlhCaoa9PMcrMDnCvudb5Ae/U
	K7A/gI/Zfdou/NNs+5oE8ojZRyagZrVNjz55PI457Xf8/ZfdB9w2El0+skbxE0/NTlvNtl+8Xbr
	Mg23FZuJrX199GL9g2N7p/NFOMtXN+GemfoZWG7GeOEtIhbCAnIcc
X-Google-Smtp-Source: AGHT+IF7DO50xv43OfmrBovVOqHhm6Smo19LkroOnjaPG77MXlD2olVAe7mIm+QWfvK5CGw0ung3Eg==
X-Received: by 2002:a5d:588b:0:b0:425:86c2:7b4a with SMTP id ffacd0b85a97d-4266d0da0a8mr8912169f8f.24.1760182332662;
        Sat, 11 Oct 2025 04:32:12 -0700 (PDT)
Received: from gmail.com ([51.154.250.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582a9csm8676910f8f.12.2025.10.11.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 04:32:12 -0700 (PDT)
Date: Sat, 11 Oct 2025 11:32:11 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aOpAO7j0Uyo6FPcu@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011122612.4fa7c97a@barney>

On Sat, Oct 11, 2025 at 12:26:12PM +0200, Michael Büsch wrote:
> On Sat, 11 Oct 2025 09:43:54 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Vaibhav,
> > 
> > kernel test robot noticed the following build errors:
> 
> >    drivers/gpio/gpio-bt8xx.c: In function 'bt8xxgpio_suspend':
> > >> drivers/gpio/gpio-bt8xx.c:233:19: error: 'struct bt8xxgpio' has no member named 'saved_outen'  
> >      233 |                 bg->saved_outen = bgread(BT848_GPIO_OUT_EN);
> >          |                   ^~
> 
> 
> It looks like the
> #ifdef CONFIG_PM
> must be removed from struct bt8xxgpio definition.
> 
> -- 
> Michael Büsch
> https://bues.ch/

Hello Michael,

Ah yes, this macro somehow got overlooked by me. I will send a v2.
Thanks for the review!

Regards,
Vaibhav

