Return-Path: <linux-gpio+bounces-2032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 768DA8242BC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 14:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFDD91F23283
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 13:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A40210F0;
	Thu,  4 Jan 2024 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fQBLy4LA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C362231B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4b743ca0597so165608e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2024 05:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704375435; x=1704980235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqqTXKOUVwpCgu9BnFin5+QoIMKL9JWfssNZ5mmuC7A=;
        b=fQBLy4LAc9s8+JbCWLnoWEpwO6WJ8HCmpL0j8IC0JqxMj/KQAoh6sTwUXTeHGdPTXn
         Ung+6s9TcrlMqsSsc2+DrfznsF6GwgEKulYiNRDrhjtky6n853kraT1uswCR16K/Qe61
         XiJf6ekQh4BZ2SJ08p3q1mLt7MinH1aVKj4zZ6uFoM9+cIqFyo9h7IjhOC4hBLNxjsmR
         vnPr9lZcG71WKOI5KHgOfLfs972SOoGVamQb/iszOx7CY1dcCwAiJRKXdAfUsVO9dEFZ
         r1xfsepI68TGbJrQfN84b1qi0BmU2iNdQ05E2ozkcXFiUg2GN8zmxA+iy4pXmMs3Rxz+
         dthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704375435; x=1704980235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqqTXKOUVwpCgu9BnFin5+QoIMKL9JWfssNZ5mmuC7A=;
        b=LMqR0R/VfsrODLecqvy0tZ4C2IP9LrDHiFAaK3NFeI6NaIKfNC90MCaPsP+pukJlR8
         oH7bYfCbQHa8uTxKAi5qNiB7bHaqFVJHVn8atgKq3V3KDK7CKOnEagzWyLzIvsNlRqq7
         Tc1v6T/+ryNfNHwXID9/PhpWAzjWT96JKnhubZdasp44g5pA7BlB6bOJrDVpEdPSmibz
         Y191/8S7OkwO/kY3r6cdNG0tX95WLv41RviakUr8vY3DQBYOEkxQHEtsmbEw00j/iJT+
         j6zS2FssCoB5gLoO/9Fy7n2ur5ifmHp5wKCm0Q8+sQqBNJz3UHE2pVLov8+YTDy4+voy
         GH6Q==
X-Gm-Message-State: AOJu0Yw5oXsVkt/vZ7l3dcT68I20ukeWSZ7BIkaVct6MA5P+Ak/tzEnv
	9w2tYOsktHfMVBaoSP8Us5tqFuo7tnngXC+LwUtiRZTv9l9NUg==
X-Google-Smtp-Source: AGHT+IEIrQM9ZW/BNPeTUPXG83heWdHZhwm/OkbStpa8cYII8nwh/9aVyBcdhCGc/lQc36tlwwPMlA8OOe+SEdFMd+M=
X-Received: by 2002:ac5:cc63:0:b0:4b6:da2d:643a with SMTP id
 w3-20020ac5cc63000000b004b6da2d643amr514595vkm.24.1704375435097; Thu, 04 Jan
 2024 05:37:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Pine.LNX.4.64.2401032017390.31157@wormhole.robuust.nl>
 <CAMRc=MeoSzL=BbknUWFZkUD57pym+D9Ghjb9iyrgJJBUhRdXHg@mail.gmail.com>
 <20240104105150.GA68799@rigel> <CAMRc=MeDbWcCOnKYNnVxJgij-qsY01aFYsHiY76xmVnaD05+oA@mail.gmail.com>
 <20240104133458.GA86666@rigel>
In-Reply-To: <20240104133458.GA86666@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 4 Jan 2024 14:37:04 +0100
Message-ID: <CAMRc=Me7X-DhviOCxKXnpG8Mxaj_gM0cVj5B=F0BE5N1C-7z+g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 retry] core: fix deselection of output
 direction when edge detection is selected
To: Kent Gibson <warthog618@gmail.com>
Cc: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 2:35=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Thu, Jan 04, 2024 at 05:13:59AM -0800, Bartosz Golaszewski wrote:
> > On Thu, 4 Jan 2024 11:51:50 +0100, Kent Gibson <warthog618@gmail.com> s=
aid:
> > > On Thu, Jan 04, 2024 at 01:13:35AM -0800, Bartosz Golaszewski wrote:
> > >> On Wed, 3 Jan 2024 20:18:27 +0100, "J.A. Bezemer"
> > >> <j.a.bezemer@opensourcepartners.nl> said:
> > >> > Fix deselection of output direction when edge detection is selecte=
d in
> > >> > make_kernel_flags(). Use correct flag to perform deselection rathe=
r than
> > >> > a library enum.
> > >> >
> > >> > For correct usage, there are no visible side-effects. The wrongly =
reset
> > >> > kernel flags are always zero already.
> > >> >
> > >> > For incorrect usage of edge detection combined with output directi=
on,
> > >> > both output and input directions would have been requested from th=
e
> > >> > kernel, causing a confusing error. Such usage will now be sanitize=
d, as
> > >> > intended, into a working configuration with only input direction.
> > >> >
> > >> > Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> > >> > ---
> > >> >  lib/line-config.c | 6 +++---
> > >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >> >
> > >> > diff --git a/lib/line-config.c b/lib/line-config.c
> > >> > index 2749a2a..9bf7734 100644
> > >> > --- a/lib/line-config.c
> > >> > +++ b/lib/line-config.c
> > >> > @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpi=
od_line_settings *settings)
> > >> >          case GPIOD_LINE_EDGE_FALLING:
> > >> >                  flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> > >> >                            GPIO_V2_LINE_FLAG_INPUT);
> > >> > -                flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> > >> > +                flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
> > >> >                  break;
> > >> >          case GPIOD_LINE_EDGE_RISING:
> > >> >                  flags |=3D (GPIO_V2_LINE_FLAG_EDGE_RISING |
> > >> >                            GPIO_V2_LINE_FLAG_INPUT);
> > >> > -                flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> > >> > +                flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
> > >> >                  break;
> > >> >          case GPIOD_LINE_EDGE_BOTH:
> > >> >                  flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> > >> >                            GPIO_V2_LINE_FLAG_EDGE_RISING |
> > >> >                            GPIO_V2_LINE_FLAG_INPUT);
> > >> > -                flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> > >> > +                flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
> > >> >                  break;
> > >> >          default:
> > >> >                  break;
> > >> > --
> > >> > 2.30.2
> > >> >
> > >> >
> > >> >
> > >>
> > >> It doesn't seem like you ran the test suite because it breaks one of
> > >> the test cases:
> > >>
> > >> **
> > >> gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_reque=
st_lines_in_output_mode_with_edge_detection:
> > >> 'request' should be NULL
> > >> # gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_req=
uest_lines_in_output_mode_with_edge_detection:
> > >> 'request' should be NULL
> > >> **
> > >> gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_reque=
st_lines_in_output_mode_with_edge_detection:
> > >> assertion failed (22 =3D=3D errno): (22 =3D=3D 0)
> > >> # gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_req=
uest_lines_in_output_mode_with_edge_detection:
> > >> assertion failed (22 =3D=3D errno): (22 =3D=3D 0)
> > >> not ok 19 /gpiod/edge-event/cannot_request_lines_in_output_mode_with=
_edge_detection
> > >>
> > >
> > > Interesting.  So the actual bug is that make_kernel_flags() shouldm't=
 be
> > > sanatizing the flags at all?
> > >
> >
> > Yes, I think so because we don't want to silently drop the output flag =
but
> > rather complain the user tried to use it together with edge detection.
> >
>
> That is what I thought you meant - it just seems at odds with what you
> were thinking when you wrote it, cos the intent does look to be sanitizin=
g.
>
> I'm fine either approach way, btw, just verifiying which way you wanted
> to go - the other option being changing the test.
>

I no longer remember what I was thinking at the time but it makes more
sense to me now to not sanitize and complain loudly about a clearly
wrong configuration.

Bartosz

