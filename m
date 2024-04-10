Return-Path: <linux-gpio+bounces-5274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE489ECA0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 09:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF68D1C20D92
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 07:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D836E13D2BA;
	Wed, 10 Apr 2024 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jIQscl6T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEDF13D2B1
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712735250; cv=none; b=ir9zLI8N3e3v2rTY0LKn2TG9a+ntLK9y5AmxjcjUW+ebbOiBP3Ga/iJ4eQ7dkC0Urb4vznDCN33Ov6JEldkjQcgcqlGmdw+9vTnQTbIngp1VX5TX+jiwG03BDskw2Oec84sh+WMQK5O18yhAE2FVHmUefKtsLvrVk1bQXRO/ksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712735250; c=relaxed/simple;
	bh=ONYMph3tj1fdA84wy1aQLoDfOxoegNYP4GydSWdcrQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMW76/15Irpfbek9dE4p/DQU0TBDbIUz5vOrNkfmYlzYix2gGq2PteWXPUZyXQahVvMUfPiGbTxh2rR8Xjr8lxf9nAvnT2YJb4F+YhZ47h68o/7Szb0FufmkqCTj6jRc8E3L214zDo+QNxu3ufrWq0CJinMcvEjpt6CAyeM9HLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jIQscl6T; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d8129797fcso88125381fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712735246; x=1713340046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cY1vsIAOR7gYmyWT4/x1CauBvYzvXAp05ygDsgLKaBU=;
        b=jIQscl6TD9kACsJPDCFc7CEdqIp+BfhhEygjRvrtyes17XzfoZG2wkHP1Z3IJ5KnBd
         AbnSzaIjstmAP0Pexb+fibMBabKf7cu+8t3e6xW+z/qI5kEZmiC96Y7xo8kAO8Ch930e
         w/8J0LI/uzaC9QifSpdckzr56dOjth4NJG9wrAFeKkYS8t3A9g/N4j253d5g2E1lxfwM
         WyEH39wDsuwTPtwR4NEgmNhvoLcgDMAgN7FVXndG6qUeTV1bWMIMFeRhHDmf3FSzXJKx
         pHQZ0TDzL+RUVbDblQX4SVO43919tzytLT9bitoGXnU2TOgxfmr0CZAMJQy2NdvHr5BZ
         YiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712735246; x=1713340046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cY1vsIAOR7gYmyWT4/x1CauBvYzvXAp05ygDsgLKaBU=;
        b=UOLAybF5oLz+TW8ttAt9lK89nbs1P4EHKSfxLmmtuPXa6VsvNZ4CWZ+frxmR42bwre
         rj4N0yD9owimclDGHTqfd82huEIZf4Bib5jGhOWjRywTcrs8NBh2LEJZXfiwAhRv/dVx
         PteNCylvNgEanQ1ikApyShlNxCmg7PXD9Gld/DBlAYYdOFtVCb020f/OYgaMPkc54IWB
         9I3MzvYG6/uKccyeO0dCoCmVqeFNKJ8YOF8oQ4DPaKPjNbKbLIeHNzlB/mNYIl7rdPKe
         IOZNMoMArI4P9R4c8o34v84+HvVZvBCJpjj71AmYgMV42/FH1ky6+Ui18InmJtoSGkj/
         eg6Q==
X-Gm-Message-State: AOJu0YzKbIb613xpYGdKjryU5uO+mkgqpmDph64GG6YqG4Q5ocNEYKOL
	xW0KR+DoIO1wbWii5qKjQS5dHs5ruD24Wwi/qCEXMI6Kj5AWnzpIY5hE62S1J/WHLF1bbfnxYFW
	Al1SB9hkYKfTZcH/UG1rCAMyqN18lp14Mh69LEYnjOcPlxxsg
X-Google-Smtp-Source: AGHT+IEgff2Q3LyWvB0LrPDXk2epxG6dI37E2/NU699GhnOKrZ98WnaVEUqDTUY0ANeJinA8ZGgdF4e+RsatBT859N0=
X-Received: by 2002:a05:651c:218:b0:2d8:713f:817b with SMTP id
 y24-20020a05651c021800b002d8713f817bmr1385744ljn.26.1712735246261; Wed, 10
 Apr 2024 00:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409093333.138408-1-brgl@bgdev.pl> <20240409093333.138408-2-brgl@bgdev.pl>
In-Reply-To: <20240409093333.138408-2-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Apr 2024 09:47:14 +0200
Message-ID: <CAMRc=McN_8Se18i0d0vJu9_1iJRoVPx5JOwZ2K9HWij5M0gh2w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] build: fix configure error messages on
 missing functions
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Gunnar_Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 11:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Fix three incorrect messages that report missing library functions as
> required to build the core library when they are actually needed to build
> the gpio-tools.
>
> Fixes: 9e69d7552cf2 ("configure: improve the header and library function =
checks")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  configure.ac | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 04787d4..3b5bbf2 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -117,9 +117,9 @@ AM_CONDITIONAL([WITH_GPIOSET_INTERACTIVE],
>  AS_IF([test "x$with_tools" =3D xtrue],
>         [# These are only needed to build tools
>         AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
> -       AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
> -       AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
> -       AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_LIB([versionsort=
])])
> +       AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
> +       AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
> +       AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_TOOLS([versionso=
rt])])
>         AS_IF([test "x$with_gpioset_interactive" =3D xtrue],
>                 [PKG_CHECK_MODULES([LIBEDIT], [libedit >=3D 3.1])])
>         ])
> --
> 2.40.1
>

This is non-controversial, so I applied it.

Bart

