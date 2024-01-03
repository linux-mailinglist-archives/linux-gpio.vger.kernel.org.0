Return-Path: <linux-gpio+bounces-1998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39896823576
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 20:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C93B71F26073
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 19:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE161CA9F;
	Wed,  3 Jan 2024 19:17:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from wormhole.robuust.nl (leaseweb-ip1.robuust.nl [178.162.147.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195241CA9B
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensourcepartners.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wormhole.robuust.nl
Received: from costar (helo=localhost)
	by wormhole.robuust.nl with local-esmtp (Exim 3.36 #1 (Debian))
	id 1rL6kB-00009t-00; Wed, 03 Jan 2024 20:17:35 +0100
Date: Wed, 3 Jan 2024 20:17:35 +0100 (CET)
From: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
X-X-Sender: costar@wormhole.robuust.nl
To: Bartosz Golaszewski <brgl@bgdev.pl>
cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v2] core: fix deselection of output direction
 when edge detection is selected
In-Reply-To: <CAMRc=MeaD6DQq_xph4H+_c=Mrix-Wgcafkdhh4ByMsFi9A2AwA@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.2401032015330.31157@wormhole.robuust.nl>
References: <Pine.LNX.4.64.2401021550390.16108@wormhole.robuust.nl>
 <CAMRc=MeaD6DQq_xph4H+_c=Mrix-Wgcafkdhh4ByMsFi9A2AwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1616093619-1190470617-1704309455=:31157"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1616093619-1190470617-1704309455=:31157
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Wed, 3 Jan 2024, Bartosz Golaszewski wrote:
> On Tue, Jan 2, 2024 at 3:52=FF=FFPM J.A. Bezemer
> <j.a.bezemer@opensourcepartners.nl> wrote:
> >
> > Fix deselection of output direction when edge detection is selected in
> > make_kernel_flags(). Use correct flag to perform deselection rather tha=
n
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
> >   lib/line-config.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/line-config.c b/lib/line-config.c
> > index 2749a2a..9bf7734 100644
> > --- a/lib/line-config.c
> > +++ b/lib/line-config.c
> > @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_li=
ne_settings *settings)
> >         case GPIOD_LINE_EDGE_FALLING:
> >                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >                           GPIO_V2_LINE_FLAG_INPUT);
> > -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> > +               flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
> >                 break;
> >         case GPIOD_LINE_EDGE_RISING:
> >                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_RISING |
> >                           GPIO_V2_LINE_FLAG_INPUT);
> > -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> > +               flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
> >                 break;
> >         case GPIOD_LINE_EDGE_BOTH:
> >                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
> >                           GPIO_V2_LINE_FLAG_EDGE_RISING |
> >                           GPIO_V2_LINE_FLAG_INPUT);
> > -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> > +               flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
> >                 break;
> >         default:
> >                 break;
> > --
> > 2.30.2
> >
> >
>=20
> This does not apply on top of current master, could you please verify?
>=20
> Bart

Some weird whitespace mangling. Retrying a different way...

Thanks,
Anne Bezemer
--1616093619-1190470617-1704309455=:31157--

