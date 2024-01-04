Return-Path: <linux-gpio+bounces-2027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7AA823FE9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 11:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96BB31C20924
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 10:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C0F210F0;
	Thu,  4 Jan 2024 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RF4cHw9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F2D20DFF
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d4df66529bso1522195ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2024 02:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704365516; x=1704970316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yy8JRb9c6nBFFh5dHnVQkM6jaDliEuQn5ZDdUOz9hhY=;
        b=RF4cHw9cY8shn8YmkLAOi/owYyzgMqjEVAnY/ehXHPrPaEBbP4SuFTQmbPM7AtRzLG
         tyaM3SlNrnYXt5fJhMJ64ZTsKmWD9c9zvH8DIP8nGK5RRq0biR9G/q2F/AkrkkdefCE7
         ZleGAQ20W4Ntyg/8jNnrYPP7zldVXpCqhbnAWYgQPRTP6a52JalmvdXiuHEMHY0mC4Zv
         QB29/QmK8EvIDJ6OKWCq1f58uM9E16BrRDAijzlgcSA2VNCqfzqqJtctHitzPNJtbnJT
         +fR5TIjpNbe7XgHvPZOYvc7D/4MahWy0E+7JJi02PmCSezIes4brv553YlgkrRNG9AdM
         VHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704365516; x=1704970316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy8JRb9c6nBFFh5dHnVQkM6jaDliEuQn5ZDdUOz9hhY=;
        b=AdAfQFZhQpNdGiRYf2WXYMSdKv9dCSAefm3qtPiDFMVBiFAOQHnzX/2JqZ5JsQ6wc5
         7jEy54ETMW6bSY0dsNZHzNoiD0kKl1lDlnz34+ZycC9jVYQOh60APTAsMH4CqLQ/k+GR
         +s4tjwVuZIJhJJsjdNThbiotdewINDL7S90XZpx7+Pz4XaPO2BhiW5p47obFKaQIALJx
         DSTBuLURftg0knqj3KwC4nmC1bySJGrV4aO5IWUG34j4+n6EUcyVK1xRAW1nxV2d3Wjc
         YI0LbS3maLBOLnLRffcO8jM7tv41M17oiuEa5X0FZa7C6NVmQRhyl8kSK6mVru4eC0re
         xqIw==
X-Gm-Message-State: AOJu0Yx64fKX6Ou5/NjW5KtZNzPtjemrmslTQ9MASdylnnXxIO0rhl9p
	+OsRu+LGfXMkdQ5Bwh6YUIoFRIWMFzjZmg==
X-Google-Smtp-Source: AGHT+IH0XiwXWcme0QodyMPqXxqO0SeTC234VaOAF+RBTM6BHC5y/Q63KFCDd8o546NoVrxO7FQtVg==
X-Received: by 2002:a17:903:2447:b0:1d4:326c:1c89 with SMTP id l7-20020a170903244700b001d4326c1c89mr344217pls.10.1704365515913;
        Thu, 04 Jan 2024 02:51:55 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b001d45f92c436sm18504213plg.5.2024.01.04.02.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:51:55 -0800 (PST)
Date: Thu, 4 Jan 2024 18:51:50 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v2 retry] core: fix deselection of output
 direction when edge detection is selected
Message-ID: <20240104105150.GA68799@rigel>
References: <Pine.LNX.4.64.2401032017390.31157@wormhole.robuust.nl>
 <CAMRc=MeoSzL=BbknUWFZkUD57pym+D9Ghjb9iyrgJJBUhRdXHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeoSzL=BbknUWFZkUD57pym+D9Ghjb9iyrgJJBUhRdXHg@mail.gmail.com>

On Thu, Jan 04, 2024 at 01:13:35AM -0800, Bartosz Golaszewski wrote:
> On Wed, 3 Jan 2024 20:18:27 +0100, "J.A. Bezemer"
> <j.a.bezemer@opensourcepartners.nl> said:
> > Fix deselection of output direction when edge detection is selected in
> > make_kernel_flags(). Use correct flag to perform deselection rather than
> > a library enum.
> >
> > For correct usage, there are no visible side-effects. The wrongly reset
> > kernel flags are always zero already.
> >
> > For incorrect usage of edge detection combined with output direction,
> > both output and input directions would have been requested from the
> > kernel, causing a confusing error. Such usage will now be sanitized, as
> > intended, into a working configuration with only input direction.
> >
> > Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> > ---
> >  lib/line-config.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/line-config.c b/lib/line-config.c
> > index 2749a2a..9bf7734 100644
> > --- a/lib/line-config.c
> > +++ b/lib/line-config.c
> > @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
> >  	case GPIOD_LINE_EDGE_FALLING:
> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >  			  GPIO_V2_LINE_FLAG_INPUT);
> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
> >  		break;
> >  	case GPIOD_LINE_EDGE_RISING:
> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
> >  			  GPIO_V2_LINE_FLAG_INPUT);
> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
> >  		break;
> >  	case GPIOD_LINE_EDGE_BOTH:
> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >  			  GPIO_V2_LINE_FLAG_EDGE_RISING |
> >  			  GPIO_V2_LINE_FLAG_INPUT);
> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
> >  		break;
> >  	default:
> >  		break;
> > --
> > 2.30.2
> >
> >
> >
>
> It doesn't seem like you ran the test suite because it breaks one of
> the test cases:
>
> **
> gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> 'request' should be NULL
> # gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> 'request' should be NULL
> **
> gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> assertion failed (22 == errno): (22 == 0)
> # gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
> assertion failed (22 == errno): (22 == 0)
> not ok 19 /gpiod/edge-event/cannot_request_lines_in_output_mode_with_edge_detection
>

Interesting.  So the actual bug is that make_kernel_flags() shouldm't be
sanatizing the flags at all?

Cheers,
Kent.


