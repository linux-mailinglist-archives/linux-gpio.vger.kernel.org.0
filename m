Return-Path: <linux-gpio+bounces-2030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037B824289
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 14:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 880F71C23F23
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 13:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1BA2231D;
	Thu,  4 Jan 2024 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0kK13AfA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A74224D7
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7cbe98278f8so173765241.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2024 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704374040; x=1704978840; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJwo4SPUmE7FGpdb3y/0UP4XAkxoTtmYp7847EKB6YY=;
        b=0kK13AfAEU48F9NDJsMag/7p29OE0IVulFOddF/5nz6gOQ+LgDXB1Siqg0m23J06S9
         8hyOx594h2RnBat0d5MPh1j5jKAFjfrYDN26iMU6xoq1PCANanAxmVdV7+Yf02oKhT/u
         UeWrNre7ouwrLF9oPUL6b6AEtcBzQhLh+wvNuy0DiRAiS0FjlBVP/Lrm0KnSRiO9EhU9
         Gq/OABjeuq08P5kqNx6PFW2p6+MSu9K51FY1MgtG8qaBJOqQMmZ5dPWXrVukUKIcUBWS
         XoBzQ8iCXuwIPmcbheEcWq6HkZtVMc7vAKENb+JiOGgIP/8GGTPRLdBf8iQnEMlnB+0A
         YrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704374040; x=1704978840;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJwo4SPUmE7FGpdb3y/0UP4XAkxoTtmYp7847EKB6YY=;
        b=hqQ0W9SeRhuIsOppnMbXX2qk3usIz16wLyvJVrXDXHmrYdkzukXLopJG17FIOq8IK6
         p9YA4CEZ5AV8yZVZAVkpZ5jDDZu2e1wO+RM3l+qyQHq2Eo8ZNNjngx8ODN++SPUaF41G
         vKPbf9T5NCc/ynE9vM4BWIjIcZxre0+xxdTlQaVvCAHf5STd4Z1sWh5PXnx0s33IKSSj
         q+5PZtzE59ef/XzOoertWVo7SWD7tQ4dWvgq700K+TLmYfmmqdRKeBBsdXGe1Q9FD2lh
         h20Q23zsTQwRo0CG/pFbnxZcHP6fs+oVCAyIKd+qHBT0w/kmTgwA+A84Kd0L4LdSNZCU
         Pwrw==
X-Gm-Message-State: AOJu0Yz3OoDGeknn90weFaXcrLglGUW45sZtB3Temrlv2S+tT7Yj7z97
	S5iea8KB3xV23N/FNtuRb/fVPLMYR1D/6Z/RpQ18UM2HDVdUIA==
X-Google-Smtp-Source: AGHT+IF+ILIltny4PdueJp1LkjKKCr7cGVeD8eaC7Lq5S2TQBja7kRxjX7cHN3lgkWhtpdlltGyB4uMifkvpp04Xnfc=
X-Received: by 2002:a05:6102:4187:b0:466:8cd2:c343 with SMTP id
 cd7-20020a056102418700b004668cd2c343mr357981vsb.26.1704374040239; Thu, 04 Jan
 2024 05:14:00 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jan 2024 05:13:59 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20240104105150.GA68799@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Pine.LNX.4.64.2401032017390.31157@wormhole.robuust.nl>
 <CAMRc=MeoSzL=BbknUWFZkUD57pym+D9Ghjb9iyrgJJBUhRdXHg@mail.gmail.com> <20240104105150.GA68799@rigel>
Date: Thu, 4 Jan 2024 05:13:59 -0800
Message-ID: <CAMRc=MeDbWcCOnKYNnVxJgij-qsY01aFYsHiY76xmVnaD05+oA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 retry] core: fix deselection of output
 direction when edge detection is selected
To: Kent Gibson <warthog618@gmail.com>
Cc: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jan 2024 11:51:50 +0100, Kent Gibson <warthog618@gmail.com> said:
> On Thu, Jan 04, 2024 at 01:13:35AM -0800, Bartosz Golaszewski wrote:
>> On Wed, 3 Jan 2024 20:18:27 +0100, "J.A. Bezemer"
>> <j.a.bezemer@opensourcepartners.nl> said:
>> > Fix deselection of output direction when edge detection is selected in
>> > make_kernel_flags(). Use correct flag to perform deselection rather than
>> > a library enum.
>> >
>> > For correct usage, there are no visible side-effects. The wrongly reset
>> > kernel flags are always zero already.
>> >
>> > For incorrect usage of edge detection combined with output direction,
>> > both output and input directions would have been requested from the
>> > kernel, causing a confusing error. Such usage will now be sanitized, as
>> > intended, into a working configuration with only input direction.
>> >
>> > Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
>> > ---
>> >  lib/line-config.c | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/lib/line-config.c b/lib/line-config.c
>> > index 2749a2a..9bf7734 100644
>> > --- a/lib/line-config.c
>> > +++ b/lib/line-config.c
>> > @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
>> >  	case GPIOD_LINE_EDGE_FALLING:
>> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>> >  			  GPIO_V2_LINE_FLAG_INPUT);
>> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
>> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>> >  		break;
>> >  	case GPIOD_LINE_EDGE_RISING:
>> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
>> >  			  GPIO_V2_LINE_FLAG_INPUT);
>> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
>> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>> >  		break;
>> >  	case GPIOD_LINE_EDGE_BOTH:
>> >  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>> >  			  GPIO_V2_LINE_FLAG_EDGE_RISING |
>> >  			  GPIO_V2_LINE_FLAG_INPUT);
>> > -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
>> > +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>> >  		break;
>> >  	default:
>> >  		break;
>> > --
>> > 2.30.2
>> >
>> >
>> >
>>
>> It doesn't seem like you ran the test suite because it breaks one of
>> the test cases:
>>
>> **
>> gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
>> 'request' should be NULL
>> # gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
>> 'request' should be NULL
>> **
>> gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
>> assertion failed (22 == errno): (22 == 0)
>> # gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
>> assertion failed (22 == errno): (22 == 0)
>> not ok 19 /gpiod/edge-event/cannot_request_lines_in_output_mode_with_edge_detection
>>
>
> Interesting.  So the actual bug is that make_kernel_flags() shouldm't be
> sanatizing the flags at all?
>

Yes, I think so because we don't want to silently drop the output flag but
rather complain the user tried to use it together with edge detection.

The actual fix should be something like:

diff --git a/lib/line-config.c b/lib/line-config.c
index 2749a2a..9302c1b 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -381,18 +381,15 @@ static uint64_t make_kernel_flags(struct
gpiod_line_settings *settings)
 	case GPIOD_LINE_EDGE_FALLING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_RISING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_BOTH:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			  GPIO_V2_LINE_FLAG_EDGE_RISING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	default:
 		break;

Bartosz

