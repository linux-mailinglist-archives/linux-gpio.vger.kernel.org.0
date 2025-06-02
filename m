Return-Path: <linux-gpio+bounces-20875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C3ACAB07
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 11:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EDFA189BF44
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 09:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135CD191F6D;
	Mon,  2 Jun 2025 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="odW6szYp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817AD8BE5
	for <linux-gpio@vger.kernel.org>; Mon,  2 Jun 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854904; cv=none; b=BP4Lkd61Y3TymNVShhFweUn+AAEkjFZ/iD2FcpCPCXeFsMlKRdBNnYcYgiDAxcNgAA+Y+Xg57hS+1wLGZNOif5WRTY2Ep3pj9BHNuAh2wmUJNHFVsjGDtNJ5a0Edz3SnVwVgy7orhQoL1Qu8q6KZQKAb0AC+VcV0xiQxiSjfztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854904; c=relaxed/simple;
	bh=5L/HO89i91CBOEvIwOi6CpU0lXjQdG3dUBRaVby2iuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDEa7wrY3diGHWe338Kho/rLy9fdehAtRKzmmC0/PLStlu9Z4lNTzEOz6gLfk0TLY8oc0YiA+NUP77ym14ndDuj7Hvq7uRJnO2j9BRkF1BhcBb7JzMvdufc6FQfjHMAxCLC9n4QW16uUpSD3sJyfsf0x7TF3oy5xF2w+yY3ZIcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=odW6szYp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5534f3722caso248825e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jun 2025 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748854899; x=1749459699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L/HO89i91CBOEvIwOi6CpU0lXjQdG3dUBRaVby2iuA=;
        b=odW6szYpRI3EmFensdcwnVCYi3yEt8zG78135qjRh+kWAeOxi+PI9fcLDXoUgLHh9/
         sn2xpJ69JWEH2caRUD9kBJBpD+2dRXElfYtJKYZSBU9HqA1es1/vKR+EeMJ0s2zdMmWe
         yxUnHjEhlWpurBd7Eh2iqcZPiLac5jzSXrocSRGzTzLj49h2Q4VbTDswE2MZ+38XsZ1Z
         xUqfRfbVFnIgBr//N1HgTmwiAzTLWMGRah77WftglTRCBbsxQc9YZzs1MqSjG5A8xwjR
         XRHtJH2kQOxsGYtwrsVbFprGW0u69kaFLQ1iuyv/YdiNOy0sBYSCeb6XTAM/YSC/WK3r
         SaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854899; x=1749459699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L/HO89i91CBOEvIwOi6CpU0lXjQdG3dUBRaVby2iuA=;
        b=u153OVNIxFtenI0VIFpBiG2glMpxMcXuSJIAdaDEEvPpRXV4ZV+BdaJMlgF30SOZGj
         qUnesKDtJZDej4cawyVo++wff4wAGy8S7+FTzXNTF8yN5FQSljn+6picevFQF2xml/jx
         LTe78dlsg3O51Sn7QuC8mQDOtBJGJE2c0D0ll3/eNujVtglnHv4rw5eXV+2ITPRuKlVf
         Md6HBRhhgpsOc1974kiaEAnapey6K4Y3Lx+0Ukt0nboUeXWK7Ij03G2nJEHiiSeiBWL3
         zkLw4huRXWPt1W3ddWAsgYi8/pYqtazbVYoT0MIiQCM3YASUlL0cGqWTDFujD7z4ttxD
         iWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpqf2U+iXHXs4Z0DLqpJ9L+A1LjfmYku4YQR0GD1TbSVW/kNZ2p7cF4FER9egTiXfA4HgIxBq7svAx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf1bRcLveqSv+i62Pr+0GM2Dmp2cEhRX7QST7SXkCvyHjJlj25
	Jv+GzT+V3mXwc7BqPYcKRJvrTx/uoDxWnYxYr6c2w3N1pbFLKMFezOd4yo07SvXL7mSqzVsqwNp
	wdxnoH8U6jUxCfy/AZOoAJIfk274SOfSaXRQr/xUze2RnJHCkGZJB
X-Gm-Gg: ASbGncvEr2TGby0EUys6+hCubFMo1R8hAQM3G6Q642xcVKQwO0sUUPHeSCXawqvuuNi
	qVWMunRYQaJ4DFRB5xNtRI+lrjBhfsofCja1g545QL/I/+G6h80oSCcbs+T/ZckeTK0On2TAf8Q
	asJb2Ke59tDIzhm8c9hQUqLi0i8RapxCOsRkBklxEDBrcAHFwuSjK4++JphtTcWyBu
X-Google-Smtp-Source: AGHT+IF7JzftWwBtbdxn3eRdY2g5R0ABLfyCCe/FWeTYczv7PUkyVOJRx3e2k3Y8Pc2+u0CtYYyLp681MfBoTrjlx1c=
X-Received: by 2002:a05:6512:350e:b0:553:2bc1:e26d with SMTP id
 2adb3069b0e04-55343183e70mr1314549e87.46.1748854899308; Mon, 02 Jun 2025
 02:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com> <CALHNRZ-z4+a-h4GZepODbqcmcPKkvGXvX4wpJSinr_gcZptjrQ@mail.gmail.com>
In-Reply-To: <CALHNRZ-z4+a-h4GZepODbqcmcPKkvGXvX4wpJSinr_gcZptjrQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 11:01:28 +0200
X-Gm-Features: AX0GCFvQfCgbCs500n43zWgfaAQRPWyohpTKwcUG4tS-dFrmVzQQCaFyT1e44NQ
Message-ID: <CAMRc=MdJ91n1TU7gaiwtQiKFZXKEFwqyNHzhZcw+qXH4KXBdKg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: palmas: Allow building as a module
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:44=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, May 22, 2025 at 5:22=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The driver works fine as a module, so allowing building as such. This
> > drops the driver specific init in favor of the module macro which does
> > the same, plus handling exit.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> Friendly reminder about this patch.

Hi Aaron,

We're in the middle of the merge window and you sent this patch at rc7
(too late to make the next release). I will not be picking it up
before v6.16-rc1 is tagged. Please don't ping me for at least 2 weeks
after you send a patch nor during the merge window.

Thanks,
Bartosz

