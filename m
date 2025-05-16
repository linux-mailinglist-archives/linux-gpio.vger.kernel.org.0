Return-Path: <linux-gpio+bounces-20258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9FAB9C1C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 14:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8E5502373
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 12:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89B823E335;
	Fri, 16 May 2025 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3ZGU2PbG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8E23ED74
	for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398789; cv=none; b=UTplle/Vq633Z73zfkelhcfHdC8K2K30Qmeah9ouNOIxY8SwgactrCu6A3Z+RIdyM+GWcc0SOu8kfWP4j9uEpr4jIkrbrEBnv+4lyPt+o+oZjYxOqMFXW/wW8IOVpLiv7H3e2NVi7gl+95Hy1VdIZj2skrMlzy0MH7NBD8tJkP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398789; c=relaxed/simple;
	bh=0tAXt3mnsy+2oybe3qYYZC8YhgHb4GE7oyn/jQHPSxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMhGFhLEPpMnjE1HZtFa+OyuofsP4jg4tnlyNJQywnxujxQLyJbb+OZ/fvFWiL2JqqA8/90r1xsFxo+1Xp+vid/uUpYw/bgVvQ89yfMdrlE/B7XBrxCqifNPaKigWAeEK9OFyI2uJfb4AdLlTsW+qk89+0EKAbmQVMxuyVUYarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3ZGU2PbG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-550ef1da73dso13117e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747398786; x=1748003586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tAXt3mnsy+2oybe3qYYZC8YhgHb4GE7oyn/jQHPSxA=;
        b=3ZGU2PbGiDH7JBxrJpoSsiMQxICvwt7mUzdwZcxANytUv7VxMGXWR2tuEyUTID/CRo
         4VuqIhdfzIHzuf+Kt8ppJU44PPHu3NPuuggr5oGqcbrNYmt9rHJHeSpY0X107WuNfYoR
         WfvAwPgRKCiZ0ChmSznttfLuZA5UCv61W8CjMTkPCajdyhnwqfqwO/4qsUmaR+jGN3Xy
         fhx1Xa0/fZQ08s5e5za5LwuC7dS11PSgBM+hHvs8gXqRY+HlWCymVAa1maQhwjA8ppS7
         fx+XNaRP2hoYKxPdzBlifed9kYIaw2jNMgMviqUPGa4Szd1o56goJad0/Fl6fEKXhemj
         9b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747398786; x=1748003586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tAXt3mnsy+2oybe3qYYZC8YhgHb4GE7oyn/jQHPSxA=;
        b=YKjCm+VRke6QicGoXWwozFN3KDhoR14Fzh7pFIZu6nMSAX1FP5D5MjhY1vgQHpsNNW
         iiQ5PguOMXbaLwjM5V4JdgRSCkAIu9Zct9BnTYpZPrYj5RQnPGDtPknLyKjvh5BuuuCO
         2dMfJyt3Te8qWxyjqZSc4AjC6niFkDzFgmOD/+hgHAovgJr69B4DJp6W5I3KpLdWWcX9
         FC5o0b2/KujVB7iKU/8DcnHiFfo9iYxcpcMIZdkCSXJv5IheUgS3i7SzfP38xBHK44i3
         JKxnDtioZSCoIe1yguv0AkktRHxKRTiqBp6TxDz1WG5Tw+oOFpXe4y+rOoqqlDQZCAN7
         /zkg==
X-Forwarded-Encrypted: i=1; AJvYcCXyYlKjZWRgBF2zU4qF+Jq9MZFZD0aOkXo6+N/U11325mnD2/N0SnCQbbtW/5In+i/pQRXOp8fZKXQp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6xjG0kcoe1ypmcvgKXjn3p26A6uTp0tibB/V9Zb4zVRK0R/CJ
	w6jVanpvEpQQFrHYiwdDfjl2sKBMSMMXo3+cFjwd4EQmJB8K0TVvOVv0jD4JpiJqrLxfnNbuxwM
	fpVqqL757epn7E0kH6qXYNIDzjAH3YEKQktvCQfRbYlLW8rmQroQD
X-Gm-Gg: ASbGncsxbVwa1qvKx2V54axc4LTU35lmA5idQrRPAi1VZdvRJU6i3j9UbY0MsCvZya8
	MrJ19r4l0xOiTm8IK/1qtKS0Ns1P6/gM/5rB5/jrqScFB2dXYVOhjSkUrlYmt0kVU78sXde4xKa
	L3P6ephc2JDCjYB9TD/d+HAkveMl/BYPw=
X-Google-Smtp-Source: AGHT+IHDRCpxLBD4ciAXOEsbtKSxPOvDHMDc/rr4GKx+Mm0MMW/Jvf6eXKQOYFOADgDXdhM2YfIXxALJS+NyEENhTis=
X-Received: by 2002:a05:6512:4387:b0:54a:fa58:a6f7 with SMTP id
 2adb3069b0e04-550e97cc2d4mr953395e87.24.1747398785922; Fri, 16 May 2025
 05:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516104023.20561-1-brgl@bgdev.pl> <aCckl9cC8fCBhHQT@hovoldconsulting.com>
In-Reply-To: <aCckl9cC8fCBhHQT@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 May 2025 14:32:54 +0200
X-Gm-Features: AX0GCFu5kkLp3T0MfIjd7ZcDhu29GuDKlrHblkONIj2lvZBjQLsBkle6dM8L9Hs
Message-ID: <CAMRc=Mf=xW6HFVYOOVS2W6GOGHS2tCRtDYAco0rz4wmEpMZhmA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: add missing mutex_destroy()
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 1:42=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Fri, May 16, 2025 at 12:40:23PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We initialize the data->mutex in gpiod_export() but lack the
> > corresponding mutex_destroy() in gpiod_unexport() causing a resource
> > leak with mutex debugging enabled. Add the call right before kfreeing
> > the GPIO data.
>
> No, there's no resource leak and it's perfectly fine not to call
> mutex_destroy().
>

No, there's no leak but with lock debugging it still warns if the
mutex is locked when it's being destroyed so the change still makes
sense with a modified commit message.

> You can't just make shit up and then pretend to fix it...
>

There's no need for this kind of comment. You made your point clear in
the first sentence.

Bartosz

