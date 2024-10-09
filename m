Return-Path: <linux-gpio+bounces-11115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC18899722B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2D528199A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD461E0DA8;
	Wed,  9 Oct 2024 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWTpH/i4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79B1D3631
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492105; cv=none; b=G3AFYPXhvH1S3HZLOMkL/tSRhF0Gear7T0wNORUSJ9PW4atX/b63WPYJau9A3X5PjkG4X8OKrvj7x1E0K+sAH2dGMb7QPvdBqfIdLAiO1eIhFldYXtD8PyOUXgCWl3PRsKM7Rx6p++nOkFo12SZUys81urNBGVzJvY7UnSCXYvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492105; c=relaxed/simple;
	bh=2TI1fb6oBlUcd9qlBFicN95KiJkyQn9bJkQRhdTUXqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBxQSSgfLbKPf0cY7v8MN3ytN98PHmk8qQsij7xe8RZNpECbUteSEgG96vEAbY1V7MuBSYI6sJCO5Hfgx4162zusNuvNFKGgowYXozEo/qAm45AFqD/Va4u7vcpEFQEMtTezIVYo5MikGGwwwby2vgTBVk5wA83pz/R7X+KfvYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWTpH/i4; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-84f9e39fc60so756082241.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728492103; x=1729096903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZGS+um0fDybicZktmnuogZai4gQRh3JmM8vWCWaIBM=;
        b=jWTpH/i4zqTeN1Po90w3983YCCVv6a1SxX1N9iKEn9xT+dXg44sCYMeGr2ZpdBvU3g
         /Yv1202Ebg9gKOnsGReD1Op9N6EewX9M0w/mrrzApPLAMX/XMx5KS8sipPN60p4d7JRk
         Hiwm9nyxwqyOltWCtlFgYTPniFv/ynulu9XEfJ5W6d8yWER+YurrIoyRuhpetrLBNlmU
         m1eqpJDzpdgzUVOohXkI1I+afKqH3+ObzUyQMg4VqMY3cgEpW/cA+ac5RnSFJn1pbJDI
         tLpU4ymaRvFvHJ8Ha6M7/5Ws2P/1cnUhIEafKpHLKwp3DowrQxWkcJpKw5BF/ol8kmiI
         /2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492103; x=1729096903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZGS+um0fDybicZktmnuogZai4gQRh3JmM8vWCWaIBM=;
        b=jTHa16iH6Y8Yt87HWPmfjuYMucxhx5u5xydHF2K3xLnaFBs62q+z+0xG9mqblxf2un
         MbsAWNUdXpZN8S/oCy8xeA2P65V4WYe8BhcPp/NkvU4F6khi0tWTiyFgj5duEdgaKVU8
         vFMExWgWVgbqtfTwRWDIlYhCw1E9YCxbZ7yoxqzkRXk2wajvpTrLZBW4hvvm0R3VKZVY
         JIiQKNrOWd9ERuWnGhGqMSpUY5U1AFjsU8gysI3y0ldqU07kGBas/Dzk8kiYX8h2l3nF
         nkiAn3ur0CiJJNgdvSdCKpt94lsfjuU2zDi04zv+621hhJlEUhDkjTU2TyJY34RJ0GkZ
         VkgA==
X-Forwarded-Encrypted: i=1; AJvYcCVl45QxF7zQVF85+oMsnqe4vvl8IsXBFOGd5EX4y2L3qzFtHnCFCT4g3PoU0mIMP4+ahWRycjgoPuWF@vger.kernel.org
X-Gm-Message-State: AOJu0YzzTfMYT53OqT5KQ9VxC0FRwErv5PmQtxVkvJOyS0sttzZc8HtE
	Mfqi0a9XL8jpHwNkXu1vpkoDBUY3sEE1i+j/Ksu2hk+kD8z/gatke3x69bNHyu+gPmm7Fbwy0ka
	jv8cKLVdWInDysu675Dp5mQIWDsI=
X-Google-Smtp-Source: AGHT+IEbCA2UWHUrl7BQAXpTOXjRVvnAy/P2EZ059GkmlTZELAupXK8vzHODURwmkDK8BgivLCjb+wuRowmqU9J9xX4=
X-Received: by 2002:a05:6102:f14:b0:4a3:ba90:a44 with SMTP id
 ada2fe7eead31-4a448ebcec6mr2712837137.25.1728492102583; Wed, 09 Oct 2024
 09:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
 <20240927-vfazio-mypy-v1-18-91a7c2e20884@xes-inc.com> <CAMRc=Mf8_Opks07HmruFTYvt9n9MHM02ykQYUoFcfofHv0NA6w@mail.gmail.com>
In-Reply-To: <CAMRc=Mf8_Opks07HmruFTYvt9n9MHM02ykQYUoFcfofHv0NA6w@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Wed, 9 Oct 2024 11:41:30 -0500
Message-ID: <CAOrEah7pBF7dzCpPC=5v8CBv5DdUAoD9XBU9r-cFjNePq7Fw=g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 18/22] bindings: python: tests: add missing type annotations
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 8:32=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
>
> I admit I don't know any better but does it really make sense to do it
> for individual test cases?

Some projects type their tests while others don't make it a priority. The w=
ay I
see it, the overhead is minimal when adding a new test so why not add it.

One of the caveats is that mypy does not type check the bodies of functions
that have untyped function definitions. So:

  def _internal_fn(arg: str) -> str:
    return arg

  def test_fn():  # will not be type checked by default
    _internal_fn(10)  # so this will not raise a type error

It seems important to ensure the test cases are either abiding by the typed
library interface or knowingly using invalid arguments to test "negative" c=
ases
(type errors which are suppressed in patch 19) for callers who do not lever=
age
or ignore the library's type annotations.

When fixing the type annotations for gpiod, I used the tests and examples a=
s a
reference for what the call interface is expected to support.

For the situation above re untyped function definitions, mypy does have a k=
nob
that allows type checking the bodies of untyped functions. If we used that,=
 it
could be argued that the majority of this patch could be dropped.

So, I guess some questions:

Do you want the test suite type checked?

If not, a lot of the patches touching tests can be dropped

If you do, to what degree? Do you want function bodies type checked?

For example, mypy identified the problems in patch 14 and 16. Even if untyp=
ed
functions aren't checked, those problems would still have been flagged.

If you think there's value in type checking functions, do you want to use
explicitly typed function signatures or leverage `check_untyped_defs` [0] (=
this
could be added to the mypy configuration in pyproject.toml).


>
> Bart

[0]: https://mypy.readthedocs.io/en/stable/command_line.html#cmdoption-mypy=
-check-untyped-defs

