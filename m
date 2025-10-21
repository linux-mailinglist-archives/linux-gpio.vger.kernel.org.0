Return-Path: <linux-gpio+bounces-27398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7831BF7247
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F69D546C79
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016B933EB10;
	Tue, 21 Oct 2025 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="toizFAjN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2433DEF2
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057748; cv=none; b=JyBwdKDA0xllBtf/2VulW6auKp0ZL3s+4R9J0q2YcB4/aJFYbfwOPkDxgCJtOO8iF+gPq5Mwn9NALw29ki6aN1X4MXpiETo6XyAcmbP02vSFV7kvgecVzPqhny0IybYcHgISaLoG65hPWm2UlQxJmKtbFAFpqVcZojhcVD6H49M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057748; c=relaxed/simple;
	bh=VGc4m4oF+KXusmvdq7HCQy/1KNZxYxwVZz9pTwsoGlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njLz7FMleOASTTXMPdH+EIxaEuYl8T/Lrz4nXq23aMPYos3hiSfNEGn47+wgx7Jw9SLAaZ8joF+8gOJwBrybp53+lY1qLVR5f6HSFzI3AGTrpXJ8KucMMlYEtqxVJIwIIsB/O8YlVN8mkufeGkjAAGkAUJoeuDbI0wviFsNMHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=toizFAjN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so6316719e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761057745; x=1761662545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZCOMUry8QgJDtmQTlzvKx4nzmcRl8rasbY1MAd0sQY=;
        b=toizFAjNvCxbdmiRGHruks9lNdp+nDZh6F3FBjY+riJ8JqXmbf8qB/h7+Yy/Y+PNIb
         Y1XHXq4NDJJhOOqfxm/B+jydgEWe/9Uh/MXHDM5RbRe8a7PtdrLX+JiHKn4GDYxrYmWL
         cOfNr6JwMpieNDY7kHJyV8HRzkNbtyzGmXnDIK4UX1Mw6dUVgzxMELa0T0vA8EOGLNMA
         jqY7Sjbn7vgOSe5dCIsnGfecudQM+vy7tb3EJjha7NZHtBSmq2u7wekCDL4TLhwGJM5v
         CpjZSkefszox10VDBWnaazFTX1dxZ0auiMh1zf8/hSGuMYXJbT2JkayM2lXFAhtddoeH
         jF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761057745; x=1761662545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZCOMUry8QgJDtmQTlzvKx4nzmcRl8rasbY1MAd0sQY=;
        b=XljdeMb4D59tE+olVJfN8IUR3L6/fQQLBQjYO7cvFlFBPTiofOcyVw5n7o4ucO8itK
         BHfj5H3ca+BKmnfaV4rE+zFQF81/6sbdZJiRuvFrjYimifB8aGC8LPlK1JvRpoAyACyP
         WCYMyKkzBRxcYwYR8V6VndjMvIToNxY4qDnskfk2pexYjh2cT+vdFntc4C1zbDLi5t6/
         uM23kxEz+6m+2VxwENefHHHEVzHWeudXVwuTi2i3pJBYMF8nPq6GMLO5euaFsNiWQkWQ
         B9FbVuDbArlWnmwEVVDlx6+FbKUrwTA2TFYHSmweALJxBsTTk1alJmC5M6KfuwtlLGYa
         CBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeCvSYM4fRow/yRRUW2CfHotLtgkQW026HRnnZSJ5hYiqPJAESAe9Ybm2w9iO0wBnqb+Mz4Brctb03@vger.kernel.org
X-Gm-Message-State: AOJu0YyREnKdnONpahY6SygwhZHIwWnn0IY35chOxSgu+CfZkNsN8djy
	RXghWHca1QbF5znEuRGsK/E+J+c3q9kaBviLzdjsoM0d9148yDR30uuX9dckvj++FiJlaA+oj4a
	ixOywMJLNtMowYqLxIROjCU99EpxES2Y48MTxJ0+Rww==
X-Gm-Gg: ASbGncsILSpRjJZJS1wbc9l+BIpOLMJehbXomncLFXDud1YRpCijO64WS6crWlRxeYs
	vvJAfpEp/2XxYr/QYGVTTPDNsQ3jzGA+VxodwNgahRfbk3+O98gkVs//Xgm6kBEyuhOWJZaJIBK
	GxprcMbwj/ftcKA25Bt32OBoIYKmQRueiG//79cvDY7ng11tYHoMtsynzNi/Hzqt8s6Y4FDqqvF
	GDiIZQaFyR8jcdXr39L+i7WpFSUo8ZY0buBZ80LYxbAgviDo+/3Q/qjmyVAkJkVPNV4kzD/5AM3
	qlCtkN3EuumEugUp
X-Google-Smtp-Source: AGHT+IEAFGsFmUFG/YnJHTCDdPAr/87ZFEb44yMmd6QhcxQ6kY+xN7c3ywaYXlVUOsQLkH0hiixQGCRd64K7uAmIpvc=
X-Received: by 2002:a05:6512:4014:b0:586:9636:6e4d with SMTP id
 2adb3069b0e04-591d85622ddmr6106679e87.50.1761057744764; Tue, 21 Oct 2025
 07:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
 <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk> <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
 <0e1f3a1b-46ab-4eb5-ad05-70784f9b9103@sirena.org.uk>
In-Reply-To: <0e1f3a1b-46ab-4eb5-ad05-70784f9b9103@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 16:42:11 +0200
X-Gm-Features: AS18NWCeEZ0pLB4tS_IEx2MtW9IQz_axw-1Q3NqtyOuzDmGpEP1ZzpOriXTSxmo
Message-ID: <CAMRc=Md1Ve4hnYQOryYEXG6_HSPJrANrr9gj2FMzCwsD+q5Cuw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 4:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Oct 20, 2025 at 11:41:52AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Oct 17, 2025 at 7:32=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > It really should be the actual physical state change that triggers th=
e
> > > event.
>
> > I guess so, but this would require some non-trivial rework of the
> > regulator core. We'd need some list of deferred notifications stored
> > in memory for when the physical state actually changes.
>
> I'm not sure I see the need for deferred notifications?  We'd need to go
> round all the users whenever a physical change to the GPIO happens but
> it's not clear what we'd need to store beyond the list of users?

In my mind I was thinking that we only need to send the notifications
to users who already enabled/disabled the regulator too but you're
right, it seems like a loop over the relevant pins should be enough.

In any case: this is outside the scope of this series but I'll see if
it's easy enough to add separately.

Bartosz

