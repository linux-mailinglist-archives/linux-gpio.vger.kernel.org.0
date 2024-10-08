Return-Path: <linux-gpio+bounces-11044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E905994E5C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14961C2536D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2D617C7C9;
	Tue,  8 Oct 2024 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vWYgK7iS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AF71DE88F
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393384; cv=none; b=rFOK8x+m5paiI2nb0sMvN/ueyGgLcePNOJAKUv8cgbUeQRwlBUn+P+RftcCFM3Y3JcsyeFJUDJ40R0SqPqTzI2tWOjmqB0A5hMXd10GktotI6HpQ5xmcGCxoD/oKHss1bH0I6t4awPu6e65PWWcw7dvsaT49681JbNYm2K/yjFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393384; c=relaxed/simple;
	bh=I2sPTZriVZwdeSdS67/5XyN9+WCHWz/lu06l8oHh/ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMgu/m0/loHE6z+mIW39pxpnm05S0DGPKapCd5UIGnI4sSRI675zX/1wCV36E5irB2mIm5D1c4P6lhqUAHZcYFv02RiWgdExSZDgcwDOwTmXIa/2/bWPEH1OhRogS/e/OTTIY0HjztiEVvYzTHzxaDJ+e2rVkM+TfxbITqa/+x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vWYgK7iS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fac63abf63so54569391fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393381; x=1728998181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiFdH7j9RmMNqlWVEJ8NavJJa+A7EBm6Z2+VLbBOOqI=;
        b=vWYgK7iSDcmOuWwlB0QrSWThdg5TInR+NHqZRlhU0v6OPI1T74zRvc3gU9j9y7CjLQ
         cSu8RQFEMh7rHC2pfbnXfZPfilcBx4TaHmd+3tr2HxBNc8gImtN0qtZVlEs9qNcW1K4Y
         lEe9V+yxSKhXRF/KAG2nix+yUwjyBqnfRTh+3Q237xqLthNdg4lyxhCIVs697Q60Ww1E
         9mW4l5noNn4dAqoETX5Cq1ulDO1v0+u6J9xFi9I7yfdTruXCiiVUPP60g/FRCpLVBjxD
         wivI3dPhBifWmjt+K7JOjP5wzh71vKxtXKjj0mdm9f+q0dpVmwzPDTeNyRVIcJOUhLFK
         FZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393381; x=1728998181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiFdH7j9RmMNqlWVEJ8NavJJa+A7EBm6Z2+VLbBOOqI=;
        b=lMrHvZn9y+y95C+Q1zpUsQNxhtAj3Mv0RFxDXVffh5oEdQiGHxxAsZ2gncU1sxS482
         Oj5nIrA5F7hcqx51W4IOnl5RBB0Hkcq6mVq7bmS+EPN7yh3WxgIaOOrto7oOXI/K8JH0
         CUxCkFpQahI+4eQJktUlXWQO1KeZ38mTFRFSPHMhnyWy3EhQN06pDOQ3+/wU+9nD46PR
         mO9+89lcFv1Dcu8rh2ZKBx8liwWOIStGE5359n51Yk6qHkO5g7avvSY3uL3Jzt1f2coe
         kWeXBMEmshyOWWyJ9Pf8TY5pvBU0NHHs+1X+Zq2Pw5AGTFF2hFh61RW1rZYuFxgK3pGd
         tqcA==
X-Gm-Message-State: AOJu0YydMwL6ShI5mwUmRxShjWdik49jw9yBpjqyqRtOji2oo5Tvz95m
	tvdPw4LXkvzfqGtovhwMYDIm5rTa4Tq2XfNf9VYv3Oqds5vaH7umXgDcbLtW/PJFHSLBMsZoDzm
	GuYdLiE1vzmD/021B/0mLcyPR8AhDl/0j5rJcr57IW8tAvy8l
X-Google-Smtp-Source: AGHT+IFC4RfMNjdkN8Dod4kc2Xcri7zA/zCrBzFSTiSOqERuImV/JnIOOu01ENf2u7EC8PWWLJjmKNU6vwn+7WkIBeE=
X-Received: by 2002:a2e:d1a:0:b0:2fa:fc41:cf85 with SMTP id
 38308e7fff4ca-2fafc41d302mr39398291fa.36.1728393380688; Tue, 08 Oct 2024
 06:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-7-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-7-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:16:09 +0200
Message-ID: <CAMRc=MenC69BPpkqkU_9H5_skdeFP1nHTKx5_rHCaG0U5-v0xg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 07/22] bindings: python: fix Chip union-attr
 type errors
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Since `Chip._chip` can be `None`, it's necessary to inform type checkers
> of the state of the object to silence the union-attr errors.
>
> Type checkers may not be able to infer that an object is not `None` from
> an earlier call (such as `_check_closed`).
>
> Instead of littering the code with "# type: ignore" comments, use casts
> to inform type checkers that objects are not `None`.
>
> Using `assert` is another option, however this duplicates the logic in
> `_check_closed` so is redundant at best and, at worst, is not a safe
> replacement as `assert` can be elided in optimized Python environments
> and these checks need to be runtime enforced.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/chip.py | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.p=
y
> index 4aa5677f94caf8c5d863aa6d75915a5b650de137..fe7bcfe082d6e9f6220093d3f=
c45ff232b5d0d17 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -7,7 +7,7 @@ from collections import Counter
>  from datetime import timedelta
>  from errno import ENOENT
>  from types import TracebackType
> -from typing import Optional, Union
> +from typing import Optional, Union, cast
>
>  from . import _ext
>  from ._internal import poll_fd
> @@ -97,6 +97,7 @@ class Chip:
>          longer be used after this method is called.
>          """
>          self._check_closed()
> +        self._chip =3D cast(_ext.Chip, self._chip)
>          self._chip.close()
>          self._chip =3D None
>

Ok, so I don't really understand what is happening here. We're going
to re-assign _chip in every function? What happens to cast() if _chip
IS None?

Bart

