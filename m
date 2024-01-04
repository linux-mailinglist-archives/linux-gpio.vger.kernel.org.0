Return-Path: <linux-gpio+bounces-2039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79884824982
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 21:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C01A1F22D53
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 20:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B47E2C690;
	Thu,  4 Jan 2024 20:19:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from wormhole.robuust.nl (leaseweb-ip1.robuust.nl [178.162.147.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C472C68B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensourcepartners.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wormhole.robuust.nl
Received: from costar (helo=localhost)
	by wormhole.robuust.nl with local-esmtp (Exim 3.36 #1 (Debian))
	id 1rLUBf-00017b-00; Thu, 04 Jan 2024 21:19:31 +0100
Date: Thu, 4 Jan 2024 21:19:31 +0100 (CET)
From: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
X-X-Sender: costar@wormhole.robuust.nl
To: Kent Gibson <warthog618@gmail.com>
cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
    Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
    Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] core: remove buggy flags sanitization from
 line-config
In-Reply-To: <20240104140707.GA90369@rigel>
Message-ID: <Pine.LNX.4.64.2401042116430.15776@wormhole.robuust.nl>
References: <20240104135058.46703-1-brgl@bgdev.pl> <20240104140707.GA90369@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 4 Jan 2024, Kent Gibson wrote:
> On Thu, Jan 04, 2024 at 02:50:58PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We try to drop potentially set output flags from line config if edge
> > detection is enabled but we use the library enum instead of the one from
> > the uAPI. In any case, we should actually loudly complain if user tries
> > to use the output mode with edge-detection (like we do currently) so just
> > remove offending lines entirely.
> >
> 
> I don't see any problem with that.
> It also explains why we didn't pick it up earlier - it behaves as
> expected and has no visible side effects, so this is just tidying up
> dead code.
> 
> Reviewed-by: Kent Gibson <warthog618@gmail.com>

For the record, this is fine with me too.

Thanks,
Anne Bezemer

Reviewed-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>

> > Reported-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  lib/line-config.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/lib/line-config.c b/lib/line-config.c
> > index 2749a2a..9302c1b 100644
> > --- a/lib/line-config.c
> > +++ b/lib/line-config.c
> > @@ -381,18 +381,15 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
> >  	case GPIOD_LINE_EDGE_FALLING:
> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >  			  GPIO_V2_LINE_FLAG_INPUT);
> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> >  		break;
> >  	case GPIOD_LINE_EDGE_RISING:
> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
> >  			  GPIO_V2_LINE_FLAG_INPUT);
> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> >  		break;
> >  	case GPIOD_LINE_EDGE_BOTH:
> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >  			  GPIO_V2_LINE_FLAG_EDGE_RISING |
> >  			  GPIO_V2_LINE_FLAG_INPUT);
> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> >  		break;
> >  	default:
> >  		break;
> > --
> > 2.40.1
> >

