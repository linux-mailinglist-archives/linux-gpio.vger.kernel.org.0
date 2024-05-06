Return-Path: <linux-gpio+bounces-6133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 012828BCC24
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99261F239AD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 10:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25E07580D;
	Mon,  6 May 2024 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVV0Bv5w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32756CDD5;
	Mon,  6 May 2024 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991985; cv=none; b=X95MlX9OZil6Nq/aacxEJLTAiUwgPscYhUk+YOJD7fPHVq9anAg75JWDeVgOsXeuaw1jJtk/96RQLO+XxsO/VWNIN2XFiK0Yz+XUpI50OxktRUYVdLwHviZwHIubyGhZuMmFvQ1o9T2PhY0c84HJ3NpBOC5bd/T2ghXYdvrPfd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991985; c=relaxed/simple;
	bh=0ygOfuHcKTAjGrt3dK5IOAMjgF/u7Ilyp6ywR2Hz+hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Am3PLxRtT89xrkepZ4/VELc0JkJYfvAokFz9WyKF1+hSFMIy71ODyCG4jOAuoJ0bdFlJM45b+tZ+LJsBwj5HTr35TOjzHXEftheEpCxmpkPppqrqMGZRqVpfdZoalAjltdLEZWTiqVZykC87VvdRtdqeC+6fr7SP9na7nleXumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVV0Bv5w; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59a934ad50so356739566b.1;
        Mon, 06 May 2024 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714991982; x=1715596782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ygOfuHcKTAjGrt3dK5IOAMjgF/u7Ilyp6ywR2Hz+hM=;
        b=FVV0Bv5weUFrqhkVZIOAl+BFSEC08/b9Co+puy+lfwvBHmofUvMjzxwJgT1PGIi1lw
         K1oDT4OsgJqllp9gGOA1OWB50rvHV415VrXiTfmf41BCyltM+vzTPfdDZvNGAX2q0Szk
         Aw/r5XtfCBPmCgzfy2HNhAuIBSGQmaDYMYSLtCv5AY860I8m3c57qWoTAyWN9z0jQ/Te
         +l28THA+Ae/wk9g7yhj34+vw636AXH7CESyaMB277kAtzKs2j+/g2qPTwCiRpHtjU/PM
         uTb969hD/FwjmJJDnC6fRK6EWCFfJIKeXpKPLz9dJIQh7CcERuOHQ9WD8towYETsC29T
         ozQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714991982; x=1715596782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ygOfuHcKTAjGrt3dK5IOAMjgF/u7Ilyp6ywR2Hz+hM=;
        b=f5YpMVdyMUqgifr7RNNZx8Qbc06CHbsHS3/U/yAmRxsl5VCZ/gGL+RFugHmOLwSVUi
         RxO0IlSUDPI4WtNZkAa/ImjkO4nsEjNtK2SwQu75cYDJ5lUuqH4JemMqXLXE6Cr2Wedh
         aXZ/nTZHnqNmVgXiB93LGQ3FIjzqU6vVr3hmxSy1cx914xBqpooG0y1W4HkLdLo3T8yp
         dZj0IMkSiFNw+Tvz6OI2jQvh61JgFjC7luVxJRWcZZ6i5A4FjVGZ+4AodhO/ZM44zdf8
         Iu4yBEtN11ZkY8YwiXgJtu9XZKLGYtm9Q5m7/uD8hqoyQy9c8ud++ia/Sgb/vTqT6dM4
         RogA==
X-Forwarded-Encrypted: i=1; AJvYcCW3xpgbNrYgRTnm6TbKQBhY/jUFa9E6e210ymBhx/KVz+2jaBcpEi7Qt+U6dkIKu0I6jplmrF3zFI7HGHbJC8FAE/KZR0Xl90SeQHIiQKtm06wUlREHr73dK+TRf7YcB+wHrGd9klbfjQ==
X-Gm-Message-State: AOJu0YxPxxS1iNyeNpsQ0QFrxjesKX3cSOEXuzYKvjizL/Pb3eNmRKRp
	jqQM4I+49PKlDKHdjT52j4+HdyZsec6jzUYSn7vSCCUiRuFXiIPIHWNR0jvnbokm7UABuP3ijw0
	JSAsAF4bA0ASOOk0FYkcE7OjYNvw=
X-Google-Smtp-Source: AGHT+IFWlpSza0B90xtieFTysHeSSjmprj5O2vUNxjTFvDcsxa5MOgdmgv7mFPreTceocazq5GlEmH7DneLovikeDqo=
X-Received: by 2002:a17:906:794c:b0:a59:cdf4:f938 with SMTP id
 l12-20020a170906794c00b00a59cdf4f938mr2045728ejo.37.1714991982211; Mon, 06
 May 2024 03:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240505141420.627398-1-andy.shevchenko@gmail.com> <CACRpkdap=KXuyoCjWt_v53ArRPynDQndAjjHfvapLUM7VWbbdA@mail.gmail.com>
In-Reply-To: <CACRpkdap=KXuyoCjWt_v53ArRPynDQndAjjHfvapLUM7VWbbdA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 13:39:05 +0300
Message-ID: <CAHp75Vdn+F=MMAyguOFup5xyOCEVZowOordiEG1FQ9Y22kLdDg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Discourage to use formatting strings in
 line names
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 10:19=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Sun, May 5, 2024 at 4:14=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > Currently the documentation for line names allows to use %u inside
> > the alternative name. This is broken in character device approach
> > from day 1 and being in use solely in sysfs.
> >
> > Character device interface has a line number as a part of its address,
> > so the users better rely on it. Hence remove the misleading documentati=
on.
> >
> > On top of that, there are no in-kernel users (out of 6, if I'm correct)
> > for such names and moreover if one exists it won't help in distinguishi=
ng
> > lines with the same naming as '%u' will also be in them and we will get
> > a warning in gpiochip_set_desc_names() for such cases.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

Meanwhile, Cc'ing to Kent as well.

--=20
With Best Regards,
Andy Shevchenko

