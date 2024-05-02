Return-Path: <linux-gpio+bounces-6013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEAD8B99DC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 13:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2DF71F24464
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 11:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C95605CE;
	Thu,  2 May 2024 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1yLlJaI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC4604B3
	for <linux-gpio@vger.kernel.org>; Thu,  2 May 2024 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714648554; cv=none; b=aKSBSlaLGiLBwzG8A/ukLyesC51JxmK+IXsng+WAXY4WJJTuf6Dou2JRktab0tutksEe33WH1Rvgf0XJCab0XPKvWeerOw6QC+tzEbJc3ky+/z072lrz0vbIshpCwqFdJqGEkyzaqQsqywFs+1OarNHO3G5NMmexAlHtti41FHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714648554; c=relaxed/simple;
	bh=ohV0Z9E45ADZJuzxvwK5Bf7ZoJaLObTY3x+HLVKVPk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsCidLIZ5Dum8nMXfevPsEcfxzYNX31OsExcHfqeI7sE/dU99sGOi0RvJO2WbRSSbajtso88N0ty9MYUN2I/zSfHFg1+xxf2ZiAQIIviqyZmaVXv5TUUoRVQzr+PIfO3/mi3UuAmcdSEAoZPDXFXi8+aVz7VOo7CUo5oAD7p1l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1yLlJaI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso7143247b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 May 2024 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714648552; x=1715253352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CGaACSE4MwJ6Pe+hdX/NkfL8aqvU77wkScT/ddvgb5o=;
        b=f1yLlJaI3NOP+1x95oYo0uzzPeJuSMNm88/wg6aeh1hKGRsM7fwPO0k+Pz2H6KlwEe
         DdN2ZXc3hM5rJK4BQq4/bmAr4Q02+dMUN+ut6LvIylSLfwnFYnCYGTfIdy4CK/y242gp
         AyeqXagMXaNmhG55+Yl3DeRatC7nl9YoBOTs8P/f8hQvPAawlrKBpfr2rvm5Lw8q00k5
         5Nz5NX6goAAftkiRpW1SkVDi+nnAlRaq8fA3a813qbxAoUVDwpOswwS1DzRL7xsnIwKc
         pNvXMzpZgjUN8qILFuZbu9MNWUG5SqFYEWo4z4tqnjXNwhL+zgXahB0uxt0zadsMo4m2
         EpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648552; x=1715253352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGaACSE4MwJ6Pe+hdX/NkfL8aqvU77wkScT/ddvgb5o=;
        b=tJJr5e1j9hPbQeQ+LfBLkYWEqW73ddg5kENnAwR+wiyUOungpDYyLN0XWrO4QSDkJu
         yKgQi+07Zvh4swSVQw5qRihOyFQI++HIPhkWwjHPed4SsR7YVm9gTUuPjzF6He68BWez
         nWfAoDWPTgbGkZBQS6eA7ZCi96pBj4j5e3p6aU3ZDZ+hi4n5KBN7ysRrktg6P7tLmpKk
         jYI9LyPF7tc9ZyO1LKXySbGEV8W4db+xtOMdJIZsfBxAWYiIhLsw7Je3C0oRu2PzGUj0
         nQTVJAlnRGRSgTbiCBG2n6BdKAQVQW8/DJFA9IB2+quMqosCS+emzzSuKx+VUyKLSIuP
         5YKw==
X-Forwarded-Encrypted: i=1; AJvYcCW0mpUNR1Awn/msTCzb9PX7GfBKSGrngsrkeuuerQa9ag2CZaLYYIm0fPFPvNO/vUcJmOlcCR5khzDbTwnjlbGZnEcPvDnBKkn8mw==
X-Gm-Message-State: AOJu0YzECiMh56x0fnsStXES9iyMmexQh/CCVZFCZUkPGr0zLUmL/uQP
	zxKVkJSaYJZZEYtz3Xgi3LLlEGbHYhZLDkYkJ5CGSKU7wSX55ukf
X-Google-Smtp-Source: AGHT+IGZc80GHFLBZllCWwlzM6EGYuEmy8SeDHLVi/ENP3PPdYt+o9q7ax4W2SGhgt7a308rbnkMpg==
X-Received: by 2002:a05:6a00:2daa:b0:6ea:c3bc:2031 with SMTP id fb42-20020a056a002daa00b006eac3bc2031mr6430186pfb.7.1714648552406;
        Thu, 02 May 2024 04:15:52 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id m22-20020a056a00081600b006f2e10b00d6sm980877pfk.41.2024.05.02.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:15:52 -0700 (PDT)
Date: Thu, 2 May 2024 19:15:46 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Make pin freeing behavior configurable
Message-ID: <20240502111546.GA325017@rigel>
References: <20240419204057.86078-1-wahrenst@gmx.net>
 <9a7fe0d8-ff44-4904-84cd-7b133f40a74b@gmx.net>
 <20240502110442.GA315256@rigel>
 <79627aeb-8151-430c-98f4-5689fd61413f@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79627aeb-8151-430c-98f4-5689fd61413f@gmx.net>

On Thu, May 02, 2024 at 01:11:06PM +0200, Stefan Wahren wrote:
> Hi Kent,
>
> Am 02.05.24 um 13:04 schrieb Kent Gibson:
> > On Thu, May 02, 2024 at 12:22:07PM +0200, Stefan Wahren wrote:
> > > Am 19.04.24 um 22:40 schrieb Stefan Wahren:
> > > > Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
> > > > So in case it was configured as GPIO_OUT before the configured output
> > > > level also get lost. As long as GPIO sysfs was used this wasn't
> > > > actually a problem because the pins and their possible output level
> > > > were kept by sysfs.
> > > >
> > > > Since more and more Raspberry Pi users start using libgpiod they are
> > > > confused about this behavior. So make the pin freeing behavior of
> > > > GPIO_OUT configurable via module parameter. In case
> > > > pinctrl-bcm2835.strict_gpiod is set to 0, the output level is kept.
> > > >
> > > > This patch based on the downstream work of Phil Elwell.
> > > >
> > > > Link: https://github.com/raspberrypi/linux/pull/6117
> > > > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > > > ---
> > > >    drivers/pinctrl/bcm/pinctrl-bcm2835.c | 20 ++++++++++++++++----
> > > >    1 file changed, 16 insertions(+), 4 deletions(-)
> > > Gentle ping ...
> > I can't comment on the substance of the change as pinctrl is outside my
> > wheelhouse, but the "strict_gpiod" name could be better.
> > The point is to make GPIO outputs persist, right?
> Yes, correct.
> > The name should better reflect that.
> Finding good and short names is hard, do you have a suggestion?
>

How about "persist_gpio_outputs"?

Cheers,
Kent.

