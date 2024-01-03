Return-Path: <linux-gpio+bounces-1974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DED822920
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 08:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402551C22DE8
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 07:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8591803D;
	Wed,  3 Jan 2024 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrmdEvBb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3918040
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cce6c719caso51142531fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704268354; x=1704873154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51pgvH2c22PJ3N/KrU7cqRwztHnhdONq6BzXqYY0mAM=;
        b=mrmdEvBbqrFvk5lEuUoZCwF/sXBy8J/lPK+n2Qu4kqprPLCPZUAvevbUjkwfJL6lB4
         RGuBhdsqEDn3ZjTreKXLWEXiF6QcW5IDgWpB+aIUugk1lz6XnCJuW832DLiGdmOnO1jh
         uXdSHeKp9KXAprektMlGJhNWiRcJ7ngmzvggFVG+NvF5AuG5B1VU1a2K37Wfz6d8Dwal
         nZ86qnLt8XD1ncEw/8VCzEL4XEeE3aCgx24KLE4CEKHt5dY7y7g91vZ8Jb8GXIvbEq76
         ZlGhmaxAPHsqreB5BarS0utEo27CSQSIeBgLOd2U7Q8bjd+DDvefgbOeSe0iHXB4MZ61
         SE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704268354; x=1704873154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51pgvH2c22PJ3N/KrU7cqRwztHnhdONq6BzXqYY0mAM=;
        b=BQBTjjP9o/yyJndZ0UBLChOpl1t1rtjtbZm1oEaRF0xGyoLAylqnq1zuGXQu7b7w6i
         y/BpH2mW6PcnVLpyJVkbH9/gbOLfF9HGjmv2kF9BBE2A797UUJ/UfxeciOSWoGeVcBDB
         6XqxsGxT8dKp8+yrxzdQpQQseDyvr7WJu8SzFO/KI8W6pwc3/MIgwPdehTGqssfI9yuA
         QJqsq63q2GDySSl9ZOb52rZW2VsdPAbrR79XQY2r+1vTJWGfr4bY32KxgJmRWAri9Pe6
         nSrPk69Praz+OsdXCCS73/tevK2tk4xxWSGh8IbheAhpLiwfDKW1bvWwNAscPwT6Tqxm
         KdrQ==
X-Gm-Message-State: AOJu0YzCojeFK7q6b1086zrL4V+8rnKVXX4prCIzsob1Hvi6GC7Y8gRk
	XPdchD3RdS7jtMYWGQi+lqL2Vu3LzQq081Tc5EEMHhI+
X-Google-Smtp-Source: AGHT+IFNkmQkhfcXDcD5CPIz/OfOGGLyDvLq/aFV66W2AjGCklZ8haKQKRw+RtQ8l0qTw5rwlo2FCEJCuSkPjzBwLB0=
X-Received: by 2002:a05:651c:2059:b0:2cc:80ec:5dc5 with SMTP id
 t25-20020a05651c205900b002cc80ec5dc5mr6953172ljo.31.1704268353499; Tue, 02
 Jan 2024 23:52:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel>
In-Reply-To: <20231228092915.GA67274@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Wed, 3 Jan 2024 01:51:53 -0600
Message-ID: <CAJ8C1XOP+h9iptC2gB0-6+Loaxr3Ow2MXYUjAxqr_t2EgBmDew@mail.gmail.com>
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver 2.1
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 28, 2023 at 3:29=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> > Hello,
> >
> > I've done some testing/evaluation of the 'libgpiod ver 2.1', and I'd
> > like to share a few thoughts from that experience.
> > <snip>

> Then you might want to update your kernel - the kernel device driver was
> changed to support peristing [1].
>
> I get this on my Pi4 running bookworm:
>
> $ gpioset -t0 GPIO23=3D0
> $ gpioinfo GPIO23
> gpiochip0 23    "GPIO23"                output
> $ gpioget -a GPIO23
> "GPIO23"=3Dinactive
> $ gpioinfo GPIO23
> gpiochip0 23    "GPIO23"                output
> $ gpioset -t0 GPIO23=3D1
> $ gpioget -a GPIO23
> "GPIO23"=3Dactive

Yes - the device driver on my bulleye is current; that change was
committed back in 1Q 2023 IIRC...

I hope I've not already asked this, but:
In ver 1.6.X of libgpiod, gpioset exits immediately, and returns to
the bash prompt. The GPIO line remains set at the value designated
after gpioset exits. AIUI, the driver change from 1Q 2023 was
responsible for this.

In ver 2.1 of libgpiod, gpioset (without options) does not exit. This
means there is no return to the bash prompt. The GPIO line still
remains set at the designated value, so there is no change in the
behavior of the GPIO line between ver 1.6.X and 2.1.

My question is why does the un-optioned gpioset ver 2.1 not exit - as
it did in ver 1.6.X?

Thanks,
~S

