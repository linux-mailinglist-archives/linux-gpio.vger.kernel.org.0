Return-Path: <linux-gpio+bounces-2175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3293D82C345
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 17:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B646DB227D4
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BFF6EB79;
	Fri, 12 Jan 2024 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UXnyKuNE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870F76EB52
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3606e69ec67so42668975ab.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 08:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705075541; x=1705680341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggpCVhECgkwzfrnz4URc+1fRD7+HZq/171oeATZ99ek=;
        b=UXnyKuNEk1ojqcsyNFMh2sm0C5MajkOFSEoTrDAIE9hf/e8UvbT3mf8HlFlfXI9e0n
         +XrA6bXsfsPfK4FmmwZYHfVFGb+NWEZRkU0ScocsEV+LAG6fVi94fCM10JVJzJFb38qK
         Fif48X6wy0QEjSoxoz/9GN6707M6AsFxw8Rm4IjFfseEq3/brx6+Imr8Z/x6wI7Qtmk0
         NAHv9SlxsiKnTkRA96J01PTv1jo+Icayye/k30PIjuPtqY5ZuNHMXzyBW0PzLMMeVtL0
         bDrVwaFFzK2qtY813BRoGVi8UGaZSyD7fF2dNBNj3MgtV/tE4FverzetRpiN14WchAC0
         AztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705075541; x=1705680341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggpCVhECgkwzfrnz4URc+1fRD7+HZq/171oeATZ99ek=;
        b=kcnJuvJLDAj0tzLbIDiQkiukRVqKeTzQIrUI9JMz26MyInacwIooGbNp+MMonJ0vOY
         jK4QGzGXay9gFtoxmjaNIS8uS6bhQJX4xrZNwDsZbu90CA2jlXuYBDmSoXtmxijVpEoy
         QvBLF1N+HNee30VZgTHEOfhH+yAJRHZT4qlgq2YPFhML7GZ0w3IZcJyKSaqWoctXpZ7p
         ZV362t8iu87ouO9nGzXOlScTGJ0rY4masNCGuMclEfIE0G7pjI7KI45OUvSOy0smuy30
         uIWT189vmbrq14/jcXFmYyceTPQn0ynOcvuFbLdL/ueIZS7g3mOKaE2BhrrYJqhhYYi5
         oF4A==
X-Gm-Message-State: AOJu0YwGw/OU9qR2OKc9fq2ObvYFJvXIWbhCTNmYSHDDjwYzmCt7/1J9
	DMIrh7M1s2z3mS2fJ8BFipuC7JfVVfMpqrCWpLNO+9SLun5KUQ==
X-Google-Smtp-Source: AGHT+IFgJp6ltYaTcoIo7jl7umT3F6KAgeBhBGwCId/JIDMPjP/BHgaLerMjt/9SrzXLxU0/AoXqxdgjJ4JEzDmVSfg=
X-Received: by 2002:a92:6904:0:b0:35d:6211:80cd with SMTP id
 e4-20020a926904000000b0035d621180cdmr1132904ilc.14.1705075541613; Fri, 12 Jan
 2024 08:05:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112150546.13891-1-brgl@bgdev.pl> <CYCTZY7PE9TQ.1SJWALQUCVPAC@ablu-work>
In-Reply-To: <CYCTZY7PE9TQ.1SJWALQUCVPAC@ablu-work>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Jan 2024 17:05:30 +0100
Message-ID: <CAMRc=Mc_-0FiB16afOgUxyX3ic07EKbH08Z1Y2aUSoPkzBQm5g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 4:26=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Fri Jan 12, 2024 at 4:05 PM CET, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The github page over at https://github.com/brgl/libgpiod has been reope=
ned
> > for bug reports and discussions. Add a link and a mention to the README
> > file.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  README | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/README b/README
> > index 69128dc..41237f4 100644
> > --- a/README
> > +++ b/README
> > @@ -294,9 +294,14 @@ Those also provide examples of the expected format=
ting.
> >  Allow some time for your e-mail to propagate to the list before retryi=
ng,
> >  particularly if there are no e-mails in the list more recent than your=
s.
> >
> > +There is a libgpiod github page[7] available for reporting bugs and ge=
neral
> > +discussions and although PRs can be submitted and discussed, upstreamb=
ound
> > +patches need to go through the mailing list nevertheless.
> > +
> >  [1] https://github.com/kward/shunit2
> >  [2] http://vger.kernel.org/vger-lists.html#linux-gpio
> >  [3] https://docs.kernel.org/process/email-clients.html
> >  [4] https://docs.kernel.org/process/coding-style.html
> >  [5] https://docs.kernel.org/process/submitting-patches.html
> >  [6] https://lore.kernel.org/linux-gpio/
> > +[7] https://github.com/brgl/libgpiod
>
> The repo only seems to be configured for PRs. Issues and discussions are
> disabled for the public.
>
> - Erik
>

Should be good now. Should I create a wiki too?

Bart

