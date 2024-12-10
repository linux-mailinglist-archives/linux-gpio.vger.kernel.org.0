Return-Path: <linux-gpio+bounces-13714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B499EB4EB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 16:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F701689A0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 15:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764A678F23;
	Tue, 10 Dec 2024 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NHOpQ367"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5AD1A0BD1
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844527; cv=none; b=igctmRVQybCEbXROp2liTAaCgmscQh+Y9IR0ZMXZvIV2OFLVOWyyz1FZ8oyy9kCw2vL8OsPGFnyAHgQUMLJ4b1moaiRXTa/3TyBe954eBM6ZrpLHC4sccQpGLQVEljo6BBIMhfihtE4yP3mii/RzlZQ883iqN4SYXX4Oz4rkb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844527; c=relaxed/simple;
	bh=LTYocZL5oWsf2YI5ZS44VP1gP5ltjucZDav0M7je+jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeDDP637Jcmur2aATDMAer+nazT4BOSqGuiwm5xVzE8Gx6lQRnCGOGIPWcteZ4K8aWhvgT2J/Zbv4+HiSOyCQe8N4s7ko7abs+3+BVrje9srAnQsPi70+PIvi4oJiDIP1QHxl2zJGFvOwhNb1JwE3qJwx6th59HwtIDzV5SrLcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NHOpQ367; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso3171732e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 07:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733844523; x=1734449323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDKpYwanTCXkaNZLsUiajAa8SFN4AmiEMF5THo0ThJs=;
        b=NHOpQ367qNsUn7PC7LXG9GjRkVXA5KOT7DKfHeMs3AAEehVMZWPANk/Sn8z7gpaeXm
         w0PJr34moDbS5ss6erCWL7DOglFICylKKcnkTdTIXQfBxf96nch9iHcV0iild+SR1T9t
         XGtGvZreXPMdOinYYOTxYUn4b8XnD9TZfsnkvcqC5Q7O9D626wkJ3Qxe57HYREROiBhA
         pod6FwsonCZms0hc+hHtBIFUniVQnFxkyi79CYgKoLbeGaChcv1XcHTHdCg2XUCcyXk9
         NFK+ofTYt4MyTFc2aq+YRfHXmkWDaa1Si7PhsaDy7u6AVG+jQgQMSfAIFp16LyrAx571
         9Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844523; x=1734449323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDKpYwanTCXkaNZLsUiajAa8SFN4AmiEMF5THo0ThJs=;
        b=FStSNzo47TpJ4PF1qbV2p4tsYDCnWutazm4poQKTX1mmj+NhXsW2MhRsve54r5TJL8
         TgWOBBdK6WWY3FiTylOGIb/Yie0gEqYYaQbrISU/wctrNr/JMyN8oSvz0NNJYRVV/ypQ
         leQ+MsbjjfDp6sWz/ebvwGAhg1GjK1mMT+CUzP1oI6R+AzhgiiP9DcFC/D1m1TMf1SYK
         0mbhPE2ZHX9p6YAzl7PRiwgBgYW3+8y1itJ+uJKxKgjhi7NxgYX0vPDl9MN9K7/CZW0F
         Z4oHtT/dhl9F8pPxWn0GgpNNGn31KoM3isbTtdwkOLYMeco65AfU/Ds8/asLNIKK89LE
         e2+g==
X-Forwarded-Encrypted: i=1; AJvYcCVfT8dPggDih22efZXaLotNaeJwLG9FFyNR+Osq3Hvd9dR5j7TaRLAx76BrwVgGmcWm+23TZ/g6yWJa@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/lja6I3dLIVX/b5GC2XgL1wiWcaf6UDSnjYjTAxTYrToHdTW
	dB9N/zd/fP4Jnv96DKh8reZTCOpGeUa9XHr6DBbenRYxCENcslSCdh64BGGy7jTEJPok5QSRAEp
	qDIQqe0FuiKY3uW6wDQQT9LgxbvhsM+hGPbR/gQ==
X-Gm-Gg: ASbGncvSVynRnbmPltUnwuaKN2m7nGs6DueUB73wNWHnmeE1+3mNSLHHiz3nz9SLsKp
	B1f7HfKdZQMoawugFo2QQM0nGwZeIhU15msFeTqKb+jWDocNhVXNLuB3NtNeaO96qA0M=
X-Google-Smtp-Source: AGHT+IEl9NToaw9OH3mU8Ko++yXj4paFr+RIVag30QwFkcKgeNwggmBDK6AasAbZQ+A6GkPzhuTv39CicpK+WCYtyVE=
X-Received: by 2002:a05:6512:3d89:b0:53e:3852:999c with SMTP id
 2adb3069b0e04-540251e59dcmr1417953e87.12.1733844522959; Tue, 10 Dec 2024
 07:28:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB160324C826F703A91F39BE7C9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <PH1P110MB1603ED35A156B907BC8177EE9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603ED35A156B907BC8177EE9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2024 16:28:31 +0100
Message-ID: <CAMRc=McXdu8HHbn8yYjHB6PmDdy-dXuBmf=aSRZZVQ0okoPuCw@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: python: provide fileno() for Chip and LineRequest
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 4:04=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
>
> > -----Original Message-----
> > From: Vincent Fazio
> > Sent: Tuesday, December 10, 2024 8:27 AM
> > To: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Kent Gibson <warthog618@gmail.com>; Linus Walleij
> > <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; Bartosz Golasze=
wski
> > <bartosz.golaszewski@linaro.org>
> > Subject: Re: [PATCH libgpiod] bindings: python: provide fileno() for Ch=
ip and
> > LineRequest
> >
> >
> >
> > > -----Original Message-----
> > > Ah! This is why I didn't see it, I missed the --strict switch. Thanks=
.
> > >
> > > On an unrelated note: mypy --strict is giving me this:
> > >
> > > bindings/python/gpiod/line.py:19: error: Non-overlapping equality che=
ck
> > (left
> > > operand type: "Value", right operand type: "int") [comparison-overlap=
]
> > >
> > > for:
> > >
> > > 18     def __bool__(self) -> bool:
> > > 19         return self =3D=3D self.ACTIVE
> > >
> > > How do I fix it?
> >
> > This is odd, because I specifically ignore this:
> > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings=
/python
> > /pyproject.toml#n57
> >
> > How do you have this set up?
>
> If you're doing this outside of the bindings/python directory, try specif=
ying the config file:
>
> ```
> (xtf-py3.12) vfazio@vfazio4 ~/development/libgpiod $ mypy --config-file=
=3Dbindings/python/pyproject.toml --strict bindings/python/gpiod
> Success: no issues found in 13 source files
> ```

Yes, this works, thanks.

Bart

>
> However, if you run it on `bindings/python` the output will be noisy beca=
use it's not limiting itself to the "files" section within the mypy setting=
s.
>
> I wrote the pyproject settings with the unwritten rule that the checks wo=
uld be rooted within `bindings/python` and not outside of it.
>

Got it.

Bart

> We should probably document our expectations for how these checks are run=
 and then update the config file to respect those expectations.

