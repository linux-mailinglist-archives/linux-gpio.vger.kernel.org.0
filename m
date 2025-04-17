Return-Path: <linux-gpio+bounces-19017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD0A91C3B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 14:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 424777AFCEB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 12:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C801F1E4B2;
	Thu, 17 Apr 2025 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zo1h+Odg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FB1156CA
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893080; cv=none; b=PsiQ7pMb5fqFQBpnuaHwwgimMQiO0WyhgbsR8HQaxNyU0w/oOen1bDTlNTjaZb/Y6Q7edD1Gild9HxbCaNBlmPNPUbLFke3c4fFXfS5hHpwS+X972QP1CfzN6S7dYLVSq68tQbtKOYu18dfmxpRMJDtXXk+1vSJQ7lG5n1dc71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893080; c=relaxed/simple;
	bh=/028alYvfCoTc2vQjwYWmnSIHtFEfMTsk65Rr1ndCoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYp2gwKa3Z98bcgLuJe9jo+t0n2fkEyYdsr/Ha3bhKavmSAvpsMx5Qz6ynPuS9bIal3fhUdXM/cfcNgfolheUYsjiy7dLl3PCnKkBJ2TfxjzcmWeSCrk38Rnb62h7ngJ4EAGAwW2rqMK7giS9eu0LGMcKdnNWk5I4dWQ6iDLapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zo1h+Odg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so706120e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744893077; x=1745497877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/028alYvfCoTc2vQjwYWmnSIHtFEfMTsk65Rr1ndCoY=;
        b=zo1h+Odgj2BjI1UvpP/fyO4DOMPHo3KHDOQkg/ojISC9lpbAssRL/c9WW/uS4hCKNz
         0L5clCFLqdQNKaxUeRXSiS/zRUBOSzcjF83jJ0ZNQQM7YTTo/GmSRo71TUPKhW7Rz+Gc
         rPR1OoASftp1gQ7QOoPVwbIAsrkgfoEbdq+g6do6bALIt+s65q/PYlEHdjcpSjnm+r7d
         7Jr/mB1tRJehjhpDrhfcvofgYviJYvdjpELb6J18hmDf3+4rzH2a5P9DZiqJpjeF9qn0
         w0N9JvcXeH8G1W/+XFa5OYAr0JFCLCb6IkTplok8bS7a4SYktS1xGl4PxwTf2/1mSJOM
         X6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893077; x=1745497877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/028alYvfCoTc2vQjwYWmnSIHtFEfMTsk65Rr1ndCoY=;
        b=Rm47pboVz0FwRzn5E0dYxpfk9W1V63tvmrqi/xo5CVzKFPgF2uS5jis+Ag7qwtPygl
         Ll8ypwtJ34k7qw5HSk+Oy0rsB2sVOK0Yn/w22bNEvZZPzok788aa45+L/OnAd0lbKEi1
         ffZQSxN2E61Jdd94m5m/oud6D+zNHrTr57bJLP0S7ZNpjMhtYbqnhuMmduiIPbfttlNO
         K7a8WFT55izHwN+CW3fBtEXMRa1OuncvzYyzsqOfmqwhLgInOrNEgAI0vgsH/aHc0Yo1
         BiFKeYlh6KuA9pW677VK/xEoeAvDc3yXdwKeSK6Xc7IyW4ywtn4us6AgMhtAjPT2EIvF
         pwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUUz6m7GdwsWIXSdrqEHsDP8EuLAQLjUl6izH1/8oynVGGRS5xR340sgkFZ/A5P1r/J1iv4CFm4YXM@vger.kernel.org
X-Gm-Message-State: AOJu0YyiG/Ufaow1YOpgN7FSO7afp7bmgUDqzj1M5RuBgw5tcD9lTV2Y
	m9NtHpelY12ef3G4fq7wgi+nOe0IPRydQ77lC6JpHleAl8n+p4XAUAW5xTVAkhCTZWLo6S0+pDA
	YoiTamomEKs+4MKWIqcy50vVe15eiWS7cv60oAw==
X-Gm-Gg: ASbGnctT4tnBmiizpGHDpIYLAqXuU2Z0uO8caB/CAzB/Twcq16Pz2QOdG5H/J9s2gNJ
	5n4Q1Eih81NFp/ntX/xcKhtl25rBSyVtH4lGqG2J2v1gzqOGrBZm8/cLD48YDeEyj1TF72yO+5p
	zG0b2itpAJ875/9ewUEmfRrva67HmCaDjV4g292Rj8aT0XuL/9/3cHhHQ=
X-Google-Smtp-Source: AGHT+IGP1dApfllXXDsCObAfwGkahvUpSVf52HT62aS2XIJAu1bZsKQsEyFG35E5DVrCOKXX4YAtzdOvl6nhDbntla8=
X-Received: by 2002:a05:651c:2209:b0:30a:448a:467 with SMTP id
 38308e7fff4ca-3107f6cd11fmr22495631fa.21.1744893077166; Thu, 17 Apr 2025
 05:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
 <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org> <4cd7b1ea029f7cdb6312f61b1008116b58b85efe.camel@gmail.com>
In-Reply-To: <4cd7b1ea029f7cdb6312f61b1008116b58b85efe.camel@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 14:31:05 +0200
X-Gm-Features: ATxdqUEAzNwY5e_RshB2yNn08iuk9w64m9O78zyE1xLCj5YCYSrYuzRw9BJIhYw
Message-ID: <CAMRc=Mcd=6tgk-NwqrSxes96tkV1PmxKFNwDV==XAUkLtDKj-Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter callbacks
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
>
> On Mon, 2025-04-07 at 09:19 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> Let's maybe drop this one? I'll send a new version of this [1] that will =
drop
> this driver...
>
> BTW, I can already change my v2 and use .set_rv()...
>
> [1]: https://lore.kernel.org/linux-input/20250313-dev-adp5589-fw-v1-13-20=
e80d4bd4ea@analog.com/
>

Sure, as long as the new variant is used, I don't care.

Bart

