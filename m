Return-Path: <linux-gpio+bounces-26651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA29BA83F6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 09:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 582151680BA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 07:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27E71EF36B;
	Mon, 29 Sep 2025 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TVy30ESf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208362110E
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759131015; cv=none; b=ndsyhR8H8xfhO6x4n+aEMx5iEi5eZW8rHlY3+eQ/GE0pstsPCj/OOiKjC9VfNGz/jC7O/DSoPkWFBt/9D9lZpHpDlO8LVo3JP6X+6as/J2cL0QAGfc0nYSE4HY5VYMV+/h7WgEIAeKyzrEnr/Co4lOFKxqwZkciOgc6m0E665Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759131015; c=relaxed/simple;
	bh=fTNeRBB3ab5KC8YXDAUSH7NxupgTH3F3puUZEojqBuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6vcuuBbGJu8MnQsXnsyMSkzYVXP5/65iK65RuRQUnHAQIGwjc8CFotVz4vr633BGpFkUKu5rZZEtMxjqqHkQgDxQSmCVBD/qc16lmMDdsqPQFBRLbLI9gFD88hmqSvbY3RHR8m7BmBu8q48zyVQ/YV4K9tersRPjCj2rHdoaME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TVy30ESf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-578ecc56235so3972307e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759131011; x=1759735811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0teAQ3hlhDx6jlB78xOPU5yIR55M1GeiRrajurqF4hs=;
        b=TVy30ESf7N4Xi18K0uGavIn2y5YI+4XssZJA0CU8ubOcyQegKLnbXOfpbBRyi6WCmo
         YBLelhP1uLg3EW+QXewcuOh1/RTdGGXJz7bCiPiV7DqthcT9Ku3W6cUydXTdVEi738Gn
         k51q4nrg/eDAlMdNfoAcMR17Ko/ahlhj0fqpFZppyEO0BxxQyRnm0xSxhO0jneTL09bY
         8DaaJmrLDZytIwSgRDeq82ZEx/WtTYq1l/08exVO8cqOJPfzhR9jsrmIfY/p5M5NRnHv
         HTIxGTi5dOJ5OfIPxlBnNeaVufua5TiQyK62ymg1uFaGS0O6/2zzj/JnQDnyJUQcibWF
         XdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759131011; x=1759735811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0teAQ3hlhDx6jlB78xOPU5yIR55M1GeiRrajurqF4hs=;
        b=trOb1e9dDb2J2D6IH8IoPUqxW0gMJPNU39Sx0PoTX8vUJtlGTWLMmRlM7PDU9g8Qja
         ytzmih+ZaiG5muiP0nj94FHUcjpa8oXWyJ/4Oo7Mb54kQG+B8Dui8VVJ6QVHgWn5TNnZ
         hGRow28cbRToCaCC2lKJ4q6COG2jsQabcEsDl1nYKdTTToyB2kdqYROIWNP6QBjsbtUB
         RW3vpGsO9KKdmz+FHJNXFUWA+9F5kb1bFPVvmVXlQ92lTmByJB6OsaVns9+wh1WCsQ6l
         rZ29rDksvHcbS1EqcUvJdF0fJlAbgeBcLs2byNzdzua0jXLDp4DsISkL/8+hcntymRDu
         pBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWHOlFI2x79iR7udnawNZlgNfeSGR5TTW3ywqoilft1u6FS3SRWP7eQWqurO1VXwFo1xQZ0Z7z0OrTR@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMsbiSWHKYxVGYtUCTA4DyVgAMW2+2ECM4k4T5fqeeZgYdWTY
	tW/rfPmk3fgx9beiG3p6UDr9hThuxtR1n/BhtxVna+s1rOQzHgnN4CiNqehWAMbaokYv49yASHd
	Ah+EtIk+rCcWuMdEUZjlPLFWN+6qCC3HGfl7ZIYyhjg==
X-Gm-Gg: ASbGncuEa92tImGhgbSylwyO+xvmogW2LgOBPlhNJ9/vdcV1MeBLraUdCeOVJc4d2yJ
	DgTTMXlS0yet5Bdb2xyBiLE91l/W8QWwt0oZWLQzoZYJhBl5m7/Mn1jntbcRuj5ixwrhEGDvZU7
	gZKzSZtdHmZV5PDb5rDIidFAyEKfyFA63vjdDY/yeZUn9HMYygqHqBpY5mSk32Q1MZY612WzswU
	Zv/9dlFfcuZOuoHINhN9JeGxqfHr8RPBgjoTmCAUNPBkif89Q==
X-Google-Smtp-Source: AGHT+IG2I3B5vfdsaAK3IWmPHcNnNw9FAhdYvFbcUBbXdgqjIt9wRJKVnKWmWFB55xQDL6K1LrmPju0zT6RCc+Ifvng=
X-Received: by 2002:a05:6512:39d1:b0:571:e01b:da9f with SMTP id
 2adb3069b0e04-582d2f27a10mr5496619e87.31.1759131011162; Mon, 29 Sep 2025
 00:30:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
 <20250926-rust-release-tweaks-v1-1-beae932eb691@linaro.org> <DD52FTCTUUEU.3H1VCKA0GZVIH@riscstar.com>
In-Reply-To: <DD52FTCTUUEU.3H1VCKA0GZVIH@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Sep 2025 09:29:59 +0200
X-Gm-Features: AS18NWCav664cOgRAlJ2PG-aVJ8gu4b0oVvWS-sTDQfwUNTiiL2CSwSOVPX7rL8
Message-ID: <CAMRc=MeL4PzZ=95T6NQEq_-CWdwGNmHsKBoRVEAyZ9Fm2=pyCw@mail.gmail.com>
Subject: Re: [PATCH libgpiod 1/3] bindings: rust: complete the unification of
 exports in examples
To: Erik Schilling <erik@riscstar.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 8:21=E2=80=AFAM Erik Schilling <erik@riscstar.com> =
wrote:
>
> On Fri Sep 26, 2025 at 4:35 PM CEST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Commit cd32f27dd550 ("bindings: rust: unify imports in examples") faile=
d
> > to consistently unify the code across all examples so finish the
> > process.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../rust/libgpiod/examples/toggle_line_value.rs    | 17 +++++++++-----=
-
> >  .../examples/toggle_multiple_line_values.rs        | 17 +++++++++-----=
-
> >  .../rust/libgpiod/examples/watch_line_rising.rs    | 23 ++++++++++++--=
------
> >  .../rust/libgpiod/examples/watch_line_value.rs     | 25 +++++++++++++-=
--------
> >  .../examples/watch_multiple_line_values.rs         | 18 +++++++++-----=
--
> >  5 files changed, 59 insertions(+), 41 deletions(-)
>
> nit: Was a bit confused by "complete unifications of exports". Shouldn't
> this be "imports" (as used by the previous commit)?
>

Ah, of course. I'll fix it when applying.

Bart

