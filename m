Return-Path: <linux-gpio+bounces-11287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 855FF99C374
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301661F236A2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62692156661;
	Mon, 14 Oct 2024 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0cI040S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07EF15665C;
	Mon, 14 Oct 2024 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894757; cv=none; b=uwKUjxgDLCLeVRvreh21sZPKpqkrPZa0OiC2f84PTfqYiae6qxhpFypuJ1u1hqHGrNQeY0hzD+12Uked2HAycRHcA+LfAiuwGZ72hyffc55gJ0vqFPfYPEwaiHVUIF+kIJJ4ngZNQhv00T4/XvYsEZuiqu7sYX/hjVxGdNGzsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894757; c=relaxed/simple;
	bh=KVATt5nLnUzL02sWMniCUSmm6UonNL7Pm/uB5eNDhwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj8V1XENHmZVrFp733GYV4u9PVWtWtdGdBZ6wPj8qxBi/pw1IvTYGQDi5l8ZTLz5mfLhFUx/vMqpgACm3sCnT/xxPlTBpBB02I9lm+R6WYFSy6mxVbbyUSR5FJlOUcOO+C6jg8W8h4o5ObXUvnCGa74bX3/nTdNEwZzxTwPwy70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0cI040S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ce5e3b116so5359945ad.1;
        Mon, 14 Oct 2024 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728894755; x=1729499555; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EsvDPw3o74BAYPgiAXCPtb0M4XB+fJDuiSq3mLDDJ3k=;
        b=b0cI040STOKYgRItzzaVzp1KoUdVkqIE0nQz6AnriuGHvN4dEr4+jjbswpIrLFo8R4
         Rr3ESbWi/xBXGdlhlxyhucI25ciz+1uHPvSfEHLD1ZvgvUNUpkiBMXJ1P/lJCbV4Enln
         yey3M2wZq4HUq+MFeLfwDdNu8fNmgXDC1nuoflclyZwZ2hsau0XOia69tG27FY+S14nO
         WsRZuidTINUZ76p3TKwyv05s2qrn0S9rxkIdFnn/op00fkccqkP1mZFFbMTzDyUO5znT
         xz3JpFqpqdqxVQqv+YYWtoayq5rc0sq/9Ca3URMDwKk6woZL6PPgsP395RagS03qUmAl
         yL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894755; x=1729499555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsvDPw3o74BAYPgiAXCPtb0M4XB+fJDuiSq3mLDDJ3k=;
        b=tYsgW5nAVmAQLJmOyyMQrZtFUrpGnLV0GgPLLvoAKT+OWko9/JpC0+4iFEeUUasuw8
         xcjBz1cWtcHrLq0KNOiIifJf67xOY+9i1XSmHFty4d8K+ED0uhXNJUey08AlHjOwsUwe
         zg9Y4H8pHijrKQVAjlVE43epZWqWgvNcbkbk4xV21O5dLhUH/Ci13tkRXL6YqFBWtS93
         GKbsN5WSRnuGfPKY3VexZgmNo3NEHqv6D3ZRXWtFts8xXaR/+ZIYwj8Cu0BxxS7iqvjU
         vZiZZOtCYVX5WtoWCxhjAWCfE4RHV4izj0QmbCQgTXeMglr+Flo62MZlXRytx5LFweV3
         AzTw==
X-Forwarded-Encrypted: i=1; AJvYcCVXOH01DpqbrsOVdl7FzkipDlKPGwHiQZfeVvxKrsx4ehIXR0zc4abYS8QnXcz3J7BuLwIRz1t5402jqbxm@vger.kernel.org, AJvYcCW2+h5BWPJG35iV2ERvvlzmnzPR+xTfdg/bTWfoAHSUJtaS5/eBAug++HdoAliVHEzhq2l6Tk9l4QhE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ovH/+yHc59YLIDOhJ3d5GLUxUdjDoYJAdZfCd25yVq4A1ciF
	lniN6aUKlAQWu+xgsNqBSZdiWlsHi7Jx2rDn6EYGOU0hWVOn+gFLX4BCMvH6
X-Google-Smtp-Source: AGHT+IGoGzp+x13dgRR7Cv1VzxYCLm5KYBbA4NlC4/f0Cte+0k20EiN1whougp8BSRzXsGaPQYp1jg==
X-Received: by 2002:a17:902:ccca:b0:20c:5c13:732e with SMTP id d9443c01a7336-20cbb22ee88mr136082455ad.38.1728894754871;
        Mon, 14 Oct 2024 01:32:34 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad99ecsm61437985ad.3.2024.10.14.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:32:34 -0700 (PDT)
Date: Mon, 14 Oct 2024 16:32:30 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/6] gpio: cdev: prepare gpio_desc_to_lineinfo() for
 being called from atomic
Message-ID: <20241014083230.GA76995@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-2-b560411f7c59@linaro.org>
 <20241014015817.GA20620@rigel>
 <CAMRc=MewhPi3O6qM7E699gpwcegNiAsizioDjREn7cOM1xHevA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MewhPi3O6qM7E699gpwcegNiAsizioDjREn7cOM1xHevA@mail.gmail.com>

On Mon, Oct 14, 2024 at 09:45:19AM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 3:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Oct 10, 2024 at 11:10:23AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > In order to prepare gpio_desc_to_lineinfo() to being called from atomic
> > > context, add a new argument - bool atomic - which, if set, indicates
> > > that no sleeping functions must be called (currently: only
> > > pinctrl_gpio_can_use_line()).
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >       unsigned long dflags;
> > >       const char *label;
> > > @@ -2402,9 +2402,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
> > >           test_bit(FLAG_USED_AS_IRQ, &dflags) ||
> > >           test_bit(FLAG_EXPORT, &dflags) ||
> > >           test_bit(FLAG_SYSFS, &dflags) ||
> > > -         !gpiochip_line_is_valid(guard.gc, info->offset) ||
> > > -         !pinctrl_gpio_can_use_line(guard.gc, info->offset))
> > > +         !gpiochip_line_is_valid(guard.gc, info->offset))
> > >               info->flags |= GPIO_V2_LINE_FLAG_USED;
> > > +
> > > +     if (!atomic) {
> > > +             if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
> > > +                     info->flags |= GPIO_V2_LINE_FLAG_USED;
> > > +     }
> > >
> >
> > Should be else if.
> >
>
> If we're not atomic, let's call pinctrl_gpio_can_use_line() and update
> the flag accordingly. If we're in atomic, just don't do it. In any
> case do the rest. Looks good to me, am I missing something?
>

Previously the preceding if short circuits and doesn't perform the
pinctl check if ANY of the preceding checks are true.
The pinctrl check should be in an else-if to get the same behaviour.

I am refering to the if (!atomic), btw, not the if in its body.
(that is why my comment is placed after the closing bracket)

Cheers,
Kent.


