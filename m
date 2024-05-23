Return-Path: <linux-gpio+bounces-6583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD338CCD53
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 09:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51A461C21085
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 07:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDF413BAC6;
	Thu, 23 May 2024 07:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p8XIHX8P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52A51869
	for <linux-gpio@vger.kernel.org>; Thu, 23 May 2024 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716450674; cv=none; b=tQD8+MQqdkdUzeR6m/edI6ddDGuzs3N3lqmoR4XjknAesax03gNWdKfUWA4grahSdZiGXnD2s/TksGB0sucb+bqWG6H7u7reosSV4GDvRZwONZcc58wuV4cZeX0YiKInY2rt1azDLreRZOCAWqtf2MjSvXmmTxthJBTlHS31zyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716450674; c=relaxed/simple;
	bh=PvJ9F8TNID/PKY6GhCsYgh8VQWw9/wDd75FwfITk+cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p946wYebCSVc7PvSbRS9NgQfMi4c9noAK1K0che/D0v1j5MkPAKMVY8fJTxLp7amNpfh/ASt51r/orhdpJ7j8DqQIlh++20aNnAOBFLz1VmyNFRxbU16+Omva/1HMYoGwgYQGV00q+I6gGbrxFRVPssvNpbqEaM4mfZb8DKFji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p8XIHX8P; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5238b5c07efso6709551e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2024 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716450671; x=1717055471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrdYv7GgC43kHV8BOXpLEhcq5iho4t5BfA5wVEvH0ZU=;
        b=p8XIHX8PBW1JZHpqMGdZl1RnB6drSaILrRkz1c6Aep8lKuuyRaTWyMfZnnzMarN3pW
         gUHC2glwHFLeDzZo+ygLrFiQH/0Nn5gPlqZO5pL9YUgpbyAonPYrXzEwOcGGOs658TZo
         e5j5w++D00X6ZOk8lHFdyQ2WJOXpf45A7ViHnMc7s2ejIS6ttd86cGwJtIcEqv+B7WSN
         nJJmKhZngmFhSgSq5gpJ450qQ5UrCvyBre6AM04uhcTdZ2bKtcm1EH33j9XzWHX04x1M
         P5G//jkfCHmkx8Q5AiENx4eN4+d0LhHTodW+SbKaFI56K+co9cbjAuFkyFTeQxyeqMJF
         uTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716450671; x=1717055471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrdYv7GgC43kHV8BOXpLEhcq5iho4t5BfA5wVEvH0ZU=;
        b=wh6FMr6E3WuIizHRmRQ/cXuYfdHREnDtsc8zyKtvF1FZUHtmKLcEfvIb0Rh0W5qH40
         digKbqJxzheqIgOuMx3280Dg1G8G9OYm+hdwkqRDgWGQjWjdj4i3nrtA0YkPULj1z3RE
         nNcu0Zb63l5kd8CVyXVDJUjUVQN/SgpwQccSLJ9Kc3i58fA061fxVZxn5zOiAdpm4CMf
         0tkSC2td96o2Ao9h0Te3tbxOjfO8QZ5K1B+gfu8TH/wS0t+3wMezszu08BzDDYlz3olF
         JVAfccb9JCb5o1hqoLLPlniBgynIWXOGf2ragM04F80N/UEfVdbVcpLnwGEXPUBEhqxg
         3a+g==
X-Gm-Message-State: AOJu0YwKBjX6oM0H0eynYEYwWlzyRkX6v6jcHjrvAIxP7Z6L9aO7PFgT
	0f7Kytg2kWZ9uCVqW2NPVeolRa+pjlCkpIS8tCWojqmjm9N6wWzxKlE3gTJkbfjEk+GZN4XIdYw
	Yzy6YeE3q5JNcva2rsC+mPiK8wx3ETTj9Muu6TLUhbC7tgbzZMV8=
X-Google-Smtp-Source: AGHT+IGFji94eNpI5XG1lW19QoNGbwzWKuVrempe6nj/r7US6/P06Xs6kwsCd3eECXI7l3dmnFNL5R+sEaPlpc+iTIo=
X-Received: by 2002:a19:9118:0:b0:51d:c46d:8844 with SMTP id
 2adb3069b0e04-526bf26809cmr2131121e87.27.1716450670906; Thu, 23 May 2024
 00:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522004643.96863-1-warthog618@gmail.com> <CAMRc=Mfd_i7uBBJnxkVbuZkiudxcb2N3rM8RmZGZAG-85iAYoA@mail.gmail.com>
 <20240522235712.GA5330@rigel> <20240523003237.GA15863@rigel>
In-Reply-To: <20240523003237.GA15863@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 May 2024 09:50:59 +0200
Message-ID: <CAMRc=Md6fULZkqh1VJfwk6_jggcjRexU+G4r43vjgvp9aq=ayA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] support casting line.Value to bool
To: Kent Gibson <warthog618@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 2:32=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, May 23, 2024 at 07:57:12AM +0800, Kent Gibson wrote:
> > On Wed, May 22, 2024 at 09:22:50AM -0700, brgl@bgdev.pl wrote:
> > > On Wed, 22 May 2024 02:46:41 +0200, Kent Gibson <warthog618@gmail.com=
> said:
> > > > While writing a gpiod plugin for gpiozero (Python), I had to map li=
ne.Value
> > > > to its bool equivalent.  Casting seemed the obvious way to go, as i=
t is
> > > > essentially a boolean, but that didn't work as I expected - it alwa=
ys
> > > > returned True. This is the case for any Python type that does not p=
rovide
> > > > a suitable conversion operator.
> > > >
> > > > This series adds support for casting line.Value to bool.
> > > >
> > >
> > > Ha! Interesting. Do you think we may need it anywhere else too?
> > >
> >
> > I guess the same applies to the C++ and Rust bindings - I'll have to
> > check.
> >
>
> Or do you mean other fields?  There wasn't anything in line.py - all the
> other enums are non-binary.  And nothing else springs to mind.

Yeah, I meant other Python classes. C++ is fine, the cast from enum to
int is unambiguous. For Rust I don't know but I'm seeing things like
IntMap<Value> in the code, I suppose, enums map fine if nobody
complained yet (given rust would most likely not build at all if it
didn't handle this case).

Bart

