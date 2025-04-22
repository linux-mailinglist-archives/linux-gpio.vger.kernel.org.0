Return-Path: <linux-gpio+bounces-19125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42AA963A2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 11:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9257F189FC9D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 09:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC851F03D9;
	Tue, 22 Apr 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="027B8Z6j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690121EA7C6
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312535; cv=none; b=nvKx+H6oCNKv2QaKMHFVWbjS0nDuYF1ogSborJsUxZwhoruB0knOHz3b9fXj8FjkX5X44m9+0O97cl1WUaUTyNkUEktX1kRucE5DsNI3j7ujmmee+1zJ606qb6UyFztKRk9ObKE4hiU1FwPf0c7B5YVGE3XbfvY/ypCMsspubbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312535; c=relaxed/simple;
	bh=dc4xZ3axdxlBmzoeUihfiSwNKtoX4SuR4oNDF5k5NTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJjzEuTZFmENMtzdUN7NhYuYn+4gAEiddFGUUBnoYgRUCaSpn1E8+xv1SjX80iFS+308KXFglJVqvoDFrB3guhTNQhGgRRZ7N+oMtwwiiRT9P23zhPyhjWjvrUrFMiddowBqnUMMVEv2q1fkEXBKTwJjFXdgITTbZ4Ih6v9OZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=027B8Z6j; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso47689971fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745312531; x=1745917331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc4xZ3axdxlBmzoeUihfiSwNKtoX4SuR4oNDF5k5NTc=;
        b=027B8Z6jYlj4S+ujHVi12BHBpykJkHuSDloRBE6V5FhH8FQhOdPxTp+ucpj9IuVIkv
         DpcSTQbGIAYL+Lfo6zWNX3n75lSD95HF571XLTnDyX/2kH8J7uiMbHLI6c4oP3jiN8dq
         vGujJdt12N8Mik+ZdyAalwD1jgtzH6O+xS/0Xwj7PgIt7rx+EZCfrbMjG33kXD82SZPi
         ekY1k9itD53wLASNI4EdePI7psmcF8xeFUgH22qez2v0nOT4CXEPtEWbpXoUkiBcoE6r
         9Kh+rg5B4qz1PwFyHpZqyOW2li2SqCYMMhh94+0kfNN6B6IE6zJiQdoYaSe/jFZpwDTL
         /cwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312531; x=1745917331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc4xZ3axdxlBmzoeUihfiSwNKtoX4SuR4oNDF5k5NTc=;
        b=NO8pz3xjOPHU15Y9bd6yGv4Q7pSu9z3Tr3iFU9280k+ujFP9NqxLdOwNmTbUFmJ//J
         FPIQWdFCSk0JgbzobZtKmZzUoKk6EvibKB3hIVAfEtlow9XnJnOeD91nOzQ6QwE/KmhG
         wt7ab0swD8QT3h7EOwKI9cX4QcCQbQHuT2g1yVTWmbFhCSL0RTU6cFYLslj854TWdlM1
         lRm8dmEjPvP2hmgy0JJJ/pWKsGQ2qTWH2zkadG2bBs06jWa1iKxmORX8663Dvawwulqh
         LsCi3Hwl7VSRQcW5ouW2a9Kj+N74ykFDLKu4b1xSCxUl8LWYAPt01T0fHjyJwX/oSrIt
         gfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTw0cGKDRKozHXQ+saPqOnY++MYXQ7vU8Q75f5UTTny/DvQxnfxj+qdJlxdykncxAI0IhoOUqTqn6t@vger.kernel.org
X-Gm-Message-State: AOJu0YxcaJl02Nxhbgqn/vsSPDpwgbTOsBgzw/A0ZiVzI5kzx7MXp3bz
	5Css5QWolX4v+Q70DkRYFwP1LzQOUNkqKny3TJ0oeidE9OPdu215+DKHQ56xigQ4Bo1fhNDVlxO
	nuEdl77F99Rjk2wRO5K/aP3we5mkDT0Kqb3iKzg==
X-Gm-Gg: ASbGnctgXvoihNtHc/q515ojFMfefAUMFpfbQWmblcka0YOx6UK7w8RA8ZZq9FYeWFi
	Kbu6Qdrj3epvkhUkBLi4JaDpBWfhA5gD3N4vjgj4z/n5Z9NC2b3ODs2IKgepLFXysWH5Xdp1UP7
	qTW/iqxBUFpb99Otp+CUPCksOMfP5WirUjTVAHVA4K+EK7cigQbk/c+Q==
X-Google-Smtp-Source: AGHT+IHXSN/8gRyaTry5GtiHwesoyr/kZzwfBfVcH37VqAhFNMUYYlznpyD7bdjOzOI5Q3wO1WKwnhzNohwl7Ztd4W8=
X-Received: by 2002:a2e:8e8c:0:b0:30b:f469:47ef with SMTP id
 38308e7fff4ca-310905bacd4mr38362531fa.23.1745312531271; Tue, 22 Apr 2025
 02:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
 <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org>
 <4cd7b1ea029f7cdb6312f61b1008116b58b85efe.camel@gmail.com> <CAMRc=Mcd=6tgk-NwqrSxes96tkV1PmxKFNwDV==XAUkLtDKj-Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mcd=6tgk-NwqrSxes96tkV1PmxKFNwDV==XAUkLtDKj-Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Apr 2025 11:01:59 +0200
X-Gm-Features: ATxdqUHl6k-99FjEYSZJEDU0K_B9nBaJmH013ky1sQlNl-LzWnGU-Cxp14xGbos
Message-ID: <CAMRc=MfBsyovZ6dVLZcDC37aTG1XeGvTMaUTRGfUcEhkVXHyng@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter callbacks
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 2:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Apr 15, 2025 at 11:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.=
com> wrote:
> >
> > On Mon, 2025-04-07 at 09:19 +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > struct gpio_chip now has callbacks for setting line values that retur=
n
> > > an integer, allowing to indicate failures. Convert the driver to usin=
g
> > > them.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> >
> > Let's maybe drop this one? I'll send a new version of this [1] that wil=
l drop
> > this driver...
> >
> > BTW, I can already change my v2 and use .set_rv()...
> >
> > [1]: https://lore.kernel.org/linux-input/20250313-dev-adp5589-fw-v1-13-=
20e80d4bd4ea@analog.com/
> >
>
> Sure, as long as the new variant is used, I don't care.
>
> Bart

Dmitry,

Can you still pick up patches 1 and 2 please?

Bartosz

