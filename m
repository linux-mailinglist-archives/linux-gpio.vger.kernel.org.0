Return-Path: <linux-gpio+bounces-14033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982B9F80DF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 18:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9978166CA4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 17:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11B219993B;
	Thu, 19 Dec 2024 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iZ8I+07N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244CA19B5A9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627625; cv=none; b=ZtN5CAjjOYA/nox3SCYsMNNaqMuZL9GxVVIbYPm+rOgGLuvVq+rWJ5OFHfB5mwgwNnRhzTuxsojwtlPljIGAsPq48lExGkjqK1XXYqODECQiesLPc2KGDDjGiFqoNdZTbDsyl3UYDsJhtDOIPhpXFyeRDxzVbwF+E0A3+7aChG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627625; c=relaxed/simple;
	bh=SlDL42jtppWCYliQfKsZ2JJpvhkLxJwALa1J/wG1uU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjHf7h1k4abR7YiUV21NcPYEjVu3lfnKf9IJQsl1n79od3fT8S3qU2D+tvhlUbcskayQ8NBHQ17K0VJEgC8ubREAeSqFnigIoF1wZJyNmmQHThEaXFb5EkvEan6jvCu+40Ao57IqPOY2RPB8Q2ZpC0Xvafk3d7NywIbCZAuY/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iZ8I+07N; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so944828e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 09:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734627620; x=1735232420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlDL42jtppWCYliQfKsZ2JJpvhkLxJwALa1J/wG1uU0=;
        b=iZ8I+07N5BUITXJrjdFjlXkYlERTmSwfGkZq4TxPLeSXnh7OKpc48DlsOa8dVIM4jk
         MuaItSnlZDyRQoLhoK4XTCYsz1r0iSkQUPECAAJYdffmoxdu7vMfxC3M4s+HB3bur/TS
         yRTb+bmKKvYCQPpGOPQHS0o7w7H5dF3zCMAh3GZuvwo7FHw1oI7Dfn1XmNfnw3ltu1LL
         XUZNORbQuQ6KmKYLE8zNUTItyM2vEIraw1xNYSNXiNvujaZbSURSsjKBO4Fx+yi5ThWx
         IdahA3Khm7d8RCkl5vvSsfcYcTwc4ullcN/yFmHtn/d9I10nU3FSVjXcSsAYimjmgI3U
         74ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734627620; x=1735232420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlDL42jtppWCYliQfKsZ2JJpvhkLxJwALa1J/wG1uU0=;
        b=bWwZ8Jkzxyze0vTbCthDH8114RDyAfu9BLtLy1gf1Mvjd1frt8IbxzCe8KnjWHymsK
         ++6ad1b3bH4bQJjuEJZFv+X1vANb8EH2qPs/xOVIsd1cYnMGE9SV54cG+gNlNMUEJS2g
         EY99NQ/LZPSflUanmBWbk15jZkKcTiOjrpavb7VT3gl7UVe2Vr3ji/ePDjcpeOElCvFQ
         NRdiWqz8pwJwait0vY79MTjOtlP/4Jm96DnthbRNo/r7/qCVJOAznYseqHP76eQJieD8
         dKkaH48q/qRdu2TYQ3HNio9eSiCT3i/LAfaOWQMPcNNXZG7Q63O9zRyo4x8YFZ8cz8di
         hWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4I7IVbEK3freMsk6RMYyjeGgkIjjOx/vlSurNLTnug4s2RwHUiia6NVaiEs+lnpIM2duF2CyO4DnK@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNtsekgP+f+0+ny9RfQ4yaI5u9xjd6XMMFOPMnGpzAekWgzyX
	WaNdJnZ81gU5O0G9Ha30A/RjNq6z8EoOs2zU+UvQ9e7kjDEXZAKhwmvm812Qr3RSEPt1BkBffEx
	mjwntdprBLP8JjDCl0HjgwqCEzFfmO0kx3UeaMQ==
X-Gm-Gg: ASbGncsKPneZexlDGH9THIf0rXkfuoGkVwOkraudWCRyHjunB/nir5E4r9liXWiz8pk
	ermaY7PeYPEXN3Cs2xUmjgErF74iqg0ZrEqIG6Uwj0WHzvUbyVvyj4xo6YR6qb9GR/kLg5w==
X-Google-Smtp-Source: AGHT+IEMCWhaSxKopzjkAGSCNeAOjZ3C29l5VLaimu6UnUO3bK1CrIJdaBc/22lubAakvhREND+9bbgXtaYM5qb9JzU=
X-Received: by 2002:a05:6512:3ca7:b0:540:23af:837e with SMTP id
 2adb3069b0e04-54221025ccemr1277379e87.39.1734627620136; Thu, 19 Dec 2024
 09:00:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
 <CAMRc=Mf7=9N1Wo642XnGJ+nzqBY8N3D_cHb3TnsG93y+KTqBKQ@mail.gmail.com> <20241219163802.01a6a7b4@booty>
In-Reply-To: <20241219163802.01a6a7b4@booty>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Dec 2024 18:00:09 +0100
Message-ID: <CAMRc=MfDbS53m1YOu6zicXQfcs1HfoO+rK0=4QqkQPnYqj9q4g@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: log an error when failing to get the reset GPIO
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 4:38=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> >
> > Fixes: and Cc: stable tags?
>
> I haven't been considering my patch a fix but rather an improvement.

Ok, I'll pick it up as is then.

Bart

