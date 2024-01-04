Return-Path: <linux-gpio+bounces-2031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8BF8242B5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 14:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BDFA1F22955
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6107622335;
	Thu,  4 Jan 2024 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYYb1eNC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107022323
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ce2170b716so351496a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2024 05:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704375303; x=1704980103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ew7KXmnhC1ugw07AYKy2QK85Rpb4ena3WFTe9WRIQk=;
        b=QYYb1eNCPYKyZidViQGqjYhofKJt2sAGWzVLs8Y7wIsQGHFjxf2vrq6RwlDRHu8uLV
         UwlDeCQZNLdqW6FZRNgsn7pvoC1c2iw5SnZDSS4GP2AYiCkxADHvpyN+NGyvjdlNoN6P
         YrjfCB/psMEohPOcKp2e/8Jt2W10TUyculHMMjFCkg7FE7YWIwHEYD7Hu5kNZZk+YiM/
         MBaFiZ4sCtxmsgZYBM16godsNJafWtHripd77DHr0uJJuJMsmD/rKN8TY1sGm9CKGDTI
         w7JVh6d63v5qmEbWG5K7neLI/pelw4KXJt6uZ/XZmGCSZWnjcCjd90xFLFgf2sDr+Z6y
         fB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704375303; x=1704980103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ew7KXmnhC1ugw07AYKy2QK85Rpb4ena3WFTe9WRIQk=;
        b=iMVp0sMSuwUN8f0/3ZerPgUu8n4g4tGXCjpyyxFXxlHNRsWca3gSOjvQkSAE6SQTJc
         27XWAcAgffJRVG5Cn7m98N+qd60+EfnZIZlKEZUFauA9lm9KoVBIJhy/4cnu56cx2erX
         bkwaAYr9dxToYNx5/7iYO86dlloxjVU5cOL33I/7bo1SUGG9llZgnLldw/f24YjzK8nr
         iNFqPFghNOUn/i1I103UtL6Uc/K0utlRW7b+YIVDi37sSXxxIDS5S3L86AFnfOrxvlz6
         41vTuuuOWmPYCyQrNpqLoLV/RsZ5+/axHDmua7j40LMDfrQRn2bd6/Cp/L58KQgXKZ0z
         1W9w==
X-Gm-Message-State: AOJu0YwU3VFpJPQug+sBodwFEbTNzaRakm5ZxJujb4zDf7DjzgSntdEO
	sRnHJk4V0/5ObAKeYzMKip0=
X-Google-Smtp-Source: AGHT+IEKnanevr9f65J7zq/i/I0Ixnps7SWd2KFQNwdeV97v4RZqifnEMxkM5PgkfxpJBS8LQIHZUA==
X-Received: by 2002:a05:6a20:6d90:b0:196:e33:c45 with SMTP id gl16-20020a056a206d9000b001960e330c45mr401215pzb.123.1704375302860;
        Thu, 04 Jan 2024 05:35:02 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902d34600b001d0d312bc2asm25670203plk.193.2024.01.04.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:35:02 -0800 (PST)
Date: Thu, 4 Jan 2024 21:34:58 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v2 retry] core: fix deselection of output
 direction when edge detection is selected
Message-ID: <20240104133458.GA86666@rigel>
References: <Pine.LNX.4.64.2401032017390.31157@wormhole.robuust.nl>
 <CAMRc=MeoSzL=BbknUWFZkUD57pym+D9Ghjb9iyrgJJBUhRdXHg@mail.gmail.com>
 <20240104105150.GA68799@rigel>
 <CAMRc=MeDbWcCOnKYNnVxJgij-qsY01aFYsHiY76xmVnaD05+oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeDbWcCOnKYNnVxJgij-qsY01aFYsHiY76xmVnaD05+oA@mail.gmail.com>

On Thu, Jan 04, 2024 at 05:13:59AM -0800, Bartosz Golaszewski wrote:
> On Thu, 4 Jan 2024 11:51:50 +0100, Kent Gibson <warthog618@gmail.com> said:
> > On Thu, Jan 04, 2024 at 01:13:35AM -0800, Bartosz Golaszewski wrote:
> >> On Wed, 3 Jan 2024 20:18:27 +0100, "J.A. Bezemer"
> >> <j.a.bezemer@opensourcepartners.nl> said:
> >> > Fix deselection of output direction when edge detection is selected in
> >> > make_kernel_flags(). Use correct flag to perform deselection rather than
> >> > a library enum.
> >> >
> >> > For correct usage, there are no visible side-effects. The wrongly reset
> >> > kernel flags are always zero already.
> >> >
> >> > For incorrect usage of edge detection combined with output direction,
> >> > both output and input directions would have been requested from the
> >> > kernel, causing a confusing error. Such usage will now be sanitized, as
> >> > intended, into a working configuration with only input direction.
> >> >
> >> > Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> >> > ---
> >> >  lib/line-config.c | 6 +++---
> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/lib/line-config.c b/lib/line-config.c
> >> > index 2749a2a..9bf7734 100644
> >> > --- a/lib/line-config.c
> >> > +++ b/lib/line-config.c
> >> > @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
> >> >  	case GPIOD_LINE_EDGE_FALLING:
> >> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >> >  			  GPIO_V2_LINE_FLAG_INPUT);
> >> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> >> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
> >> >  		break;
> >> >  	case GPIOD_LINE_EDGE_RISING:
> >> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
> >> >  			  GPIO_V2_LINE_FLAG_INPUT);
> >> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> >> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
> >> >  		break;
> >> >  	case GPIOD_LINE_EDGE_BOTH:
> >> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >> >  			  GPIO_V2_LINE_FLAG_EDGE_RISING |
> >> >  			  GPIO_V2_LINE_FLAG_INPUT);
> >> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> >> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
> >> >  		break;
> >> >  	default:
> >> >  		break;
> >> > --
> >> > 2.30.2
> >> >
> >> >
> >> >
> >>
> >> It doesn't seem like you ran the test suite because it breaks one of
> >> the test cases:
> >>
> >> **
> >> gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> >> 'request' should be NULL
> >> # gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> >> 'request' should be NULL
> >> **
> >> gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> >> assertion failed (22 == errno): (22 == 0)
> >> # gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> >> assertion failed (22 == errno): (22 == 0)
> >> not ok 19 /gpiod/edge-event/cannot_request_lines_in_output_mode_with_edge_detection
> >>
> >
> > Interesting.  So the actual bug is that make_kernel_flags() shouldm't be
> > sanatizing the flags at all?
> >
>
> Yes, I think so because we don't want to silently drop the output flag but
> rather complain the user tried to use it together with edge detection.
>

That is what I thought you meant - it just seems at odds with what you
were thinking when you wrote it, cos the intent does look to be sanitizing.

I'm fine either approach way, btw, just verifiying which way you wanted
to go - the other option being changing the test.

Cheers,
Kent.

