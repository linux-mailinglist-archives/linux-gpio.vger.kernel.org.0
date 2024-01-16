Return-Path: <linux-gpio+bounces-2280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F282EC95
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 11:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E98F1C2306B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EF5134C0;
	Tue, 16 Jan 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G4EvU/tq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6B13FF1
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4b74a9a9d4cso2598214e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 02:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705399780; x=1706004580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dorDUP7rGtmzwgDwjpAncnF3LARh5KM0Ycmte04vbBE=;
        b=G4EvU/tqjj7jDUEJruBRoG39wNgkNCueKFaNol9bid2LpuX8XBqDauiWKnYpfhSY2l
         T2urY8ZgK8eNZaEf4yfdJsArJphn1aPW1PowJDWfSDDwGnfw6ooa7LiRtpqIIhc+Qj3F
         /pdfkr1o5v+calqJjrBc0aPTiRKClsG3LbRU8OtVphxDy/RqS85s0+wIo1L7C+b3VwwB
         IPH6XDfRo5Wgx68HLqpY2+2GrUk/NSuMyuTmWYdrsVXXD9SjFY0zOd11GfKueKguCk11
         bkRjNbf+Nx6TWugcS9dLrHYUMjtv5xuaY1Pz6DRChs7GJJ3Kb5syFQXURUBxjwF0VxkL
         RPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705399780; x=1706004580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dorDUP7rGtmzwgDwjpAncnF3LARh5KM0Ycmte04vbBE=;
        b=DpEtz5+1iNdwE12G1gL0frnUrJPa3sxDj/U4RueQ7GbRpICdBhmluL/Hh3Bh70t630
         v0ncGJPztUwpeJzHnULsHtwTvO9LJAIpEvV9QLFJOl6FhQUNoAqSnSFcWA5ZjFdSntaB
         NbHYaG7Lc/N+8UPYq6H4FG0Ui4oUO+Mv8Xt1bnY5oq5LC01L7hpwpGqwRxeyt7+NuGO9
         fj9+eM45uuLdoMtpt+//pJ4zWFeX1Bl0plzu07BAqOBhQygNkkkO1C7Et7lxDSocNg+m
         5f96+rfo/rlCYKYEmic2rh9Zhhtus86/Ivxhtc6h1oMigX9Zq6dlyZwiIQgTDF2MO9yC
         LsPw==
X-Gm-Message-State: AOJu0Yz6wTeXvpEuK5RqXq55MjKp9Kysc0NiMLttcDpo5ciwJzjpC8E0
	OCJAWA5LkqFOceQ1ftnO2AXcS39FvoXl59NRQFqHCHbMSqeUyg==
X-Google-Smtp-Source: AGHT+IE2BJ5DPlgFzJLna5dV5QJbjE0xnnzKZNSmvDEr5uinYafarpiQaZIjHOw0GcupeoqEDe7pKFpHdpwlyiBausI=
X-Received: by 2002:a05:6122:2392:b0:4b6:eb5a:ee98 with SMTP id
 bu18-20020a056122239200b004b6eb5aee98mr2784209vkb.14.1705399780364; Tue, 16
 Jan 2024 02:09:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116094057.10533-1-brgl@bgdev.pl> <20240116100834.GA3474@rigel>
In-Reply-To: <20240116100834.GA3474@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Jan 2024 11:09:29 +0100
Message-ID: <CAMRc=MdnOhf4x5i4SfjHMxY2ZOM_GYEFEvrhwXGnK2Nda0wjcg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] README: mention the Linux 5.10 requirement
 for libgpiod v2
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Erik Schilling <erik.schilling@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 11:08=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Tue, Jan 16, 2024 at 10:40:57AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Major version 2 of libgpiod requires linux kernel uAPI v2 to be availab=
le.
> > This was released in Linux 5.10 so mention it in the README.
> >
> > Suggested-by: Kent Gibson <warthog618@gmail.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > v1 -> v2:
> > - reword as suggested by Kent
> >
> >  README | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/README b/README
> > index 632aab3..6063f43 100644
> > --- a/README
> > +++ b/README
> > @@ -8,8 +8,9 @@ libgpiod
> >               character device (gpiod stands for GPIO device)
> >
> >  Since linux 4.8 the GPIO sysfs interface is deprecated. User space sho=
uld use
> > -the character device instead. This library encapsulates the ioctl call=
s and
> > -data structures behind a straightforward API.
> > +the character device instead. Version 2 of libgpiod requires GPIO char=
acter
> > +device uAPI v2 which was first released in linux v5.10. This library
> > +encapsulates the ioctl calls and data structures behind a straightforw=
ard API.
> >
>
> Minor nit - drop the "v" in v5.10 to be consistent with other use,
> including the 4.8 in the same paragraph?
>

Sure, I'll change it when applying.

Bart

