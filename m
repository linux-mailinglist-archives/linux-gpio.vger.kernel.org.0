Return-Path: <linux-gpio+bounces-1310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF380ECB9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 14:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73910281659
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 13:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D8F60EEE;
	Tue, 12 Dec 2023 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PidR5qto"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CE7B7
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 05:02:02 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d9d307a732so4279603a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 05:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702386122; x=1702990922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkmdTdUIhKOmIGQCExswTfbSNugAMdoXPPb1idwAVKw=;
        b=PidR5qtoRAnQlLDxuUozehK7Cm1QfguX5CzvpGSWH/tfaibJIRyx5BGdwCE+73lRUe
         yswmHTJo+u0tOHP6qmVJsomDLLxzF6Xq158oWgL4sbfvWloyUmmTeUUb5gItkE1QUUgw
         XO00raYmdrpczMHAABq3vV9xZ5+if/d1/gM/iotRlCMuLOydq5SCdgy86Arif5Fv3JSh
         JgzXmC8hPt2b3fvYXYCNLWk3tSsidxBAOM9Uowz1SDKBs5JaIMd6b+HbsOJuk/Va7l08
         2ub6mLrVK8MakTznmkk9DSsimYlo5+fYIPAaYSb13URwyKGyCw1CVUlBu2KdMX+BoTMM
         FpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702386122; x=1702990922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkmdTdUIhKOmIGQCExswTfbSNugAMdoXPPb1idwAVKw=;
        b=t1nViE0dCaeN1S6VCsaH4zIb+bPu1lUMwNV9w5jIcN3WYX1TddXQeOIsCMIVfQWwyi
         ehMfQzv1eHLnVWiSCxDvQhaHA9kOsfwNniMN7qgwe7YQENPcdDo9uSwXIE2DFBQB7N1p
         du0GSrkGVu3ttev8ZKvkDFRxID7PIyAoxUuuA5llcHydqQnTA2FqDi3kU2gAy8bCVyRQ
         +Yocd7R4fWEhKZVhuRnqwxulfOnfVwgXsHDTgJdipVT9eWR19eBhZGAkjH8j9NFI5rKW
         S34BAvcfee5EW7tZ9WRmvXrWpIrxkXX+2bBbOBEmGpR91cBGd6KZ8RE5NUxDQ+A2eTTh
         O/Mg==
X-Gm-Message-State: AOJu0YxX9GdDgBBe3LV3pUScJsohdmC7kYJgJ5zAg5OYvCuRq6jxtOmX
	RN6sa4/Y7Xcfy534IWiF7+2SkTVZfPugJnkMNKWNFIfdplw=
X-Google-Smtp-Source: AGHT+IHmFVmv3w9ayYl8YbD/3sxxMK4UaCHoziG76q2UikT/pFx2pfX3D1ELhzzzkVbySQ6Xb1ad7EXCzBIA5WWaaVs=
X-Received: by 2002:a05:6830:20cd:b0:6d9:db78:fea1 with SMTP id
 z13-20020a05683020cd00b006d9db78fea1mr7062803otq.26.1702386122078; Tue, 12
 Dec 2023 05:02:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Tue, 12 Dec 2023 14:01:51 +0100
Message-ID: <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>
Subject: Re: [libgpiod] - fast writing while waiting for edge events
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bartosz,
I am writing a libgpiod 2 C# binding/abstraction for the dotnet
community that I want to use personally. My use case is to monitor
edge events from a hardware PWM signal, to react by reading some other
GPIOs in a relatively short amount of time. This is likely a very
specific use case but my goal is to make the binding cover as much
uses cases as possible. And before searching for an alternative (like
writing a kernel driver or so) I wanted to make sure I am not doing
things wrong.

Regards Mathias

Am Di., 12. Dez. 2023 um 12:12 Uhr schrieb Bartosz Golaszewski <brgl@bgdev.=
pl>:
>
> On Tue, Dec 12, 2023 at 10:55=E2=80=AFAM Mathias Dobler <mathias.dob@gmai=
l.com> wrote:
> >
> > Hello,
> > From reading other conversations I've learned that it's not a good
> > idea to have more than 1 thread accessing libgpiod objects. But this
> > raises the question of how to react to events and let reads/writes
> > through as quickly as possible at the same time. I have already played
> > around with the file descriptor of the request object to interrupt the
> > wait for edge events, but this solution is not good because it comes
> > at the expense of responsiveness to events, and requires complicated
> > synchronization.
> > How bad would it be to have 1 thread waiting for events and 1 other
> > thread reading/writing?
> >
> > Regards,
> > Mathias
> >
>
> Are you bitbanging? It totally sounds like bitbanging. Have you
> considered writing a kernel driver for whatever you're doing?
>
> Bart

