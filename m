Return-Path: <linux-gpio+bounces-22572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E765AF0F4E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A08B1C26BFD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878C023D29E;
	Wed,  2 Jul 2025 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0wZpanZ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62D1EE7A1
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447554; cv=none; b=ablPE5iBwPBuIfx/iN2I0aFZR2h1QsxZDHkgoxFBY3JQL6xYh52+FNLhtYhbWDnu6tw5fBxxK4gUjJn4doa9cPL2/oCzeS4DyszsQ6M/i3vrUcYkI3th0O0lPq7ZX6Zc/t6qPm76Zzvrh63RDQHV5NX18KatS3Qlv0T/BV8wSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447554; c=relaxed/simple;
	bh=xDQ3r+CVA2MvW2DIbPjmzu6pJqc9zfZSPhLjDhnE9nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhzqJ7G3SRJAPZ7ojRDYiQSNhLwTgtExUhI+chMac1sWvriBUBW1c5bSv90weGpLZhNK6yNioeSHoD+EGmhfBDy+PYa4new5HoFfLsq7d7TeNaRvs4q1JXvdCawc1yI5BGyEwV7jevgLTg85SsaCCXnzhwKYHnCdWBPjpimNqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0wZpanZ6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553e5df44f8so3566357e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447551; x=1752052351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDQ3r+CVA2MvW2DIbPjmzu6pJqc9zfZSPhLjDhnE9nU=;
        b=0wZpanZ6q4w5lghJ8+oCTxIPZMMARJc+e8MjWGx1WFpdr+AkdO1wHfGWkSj+88yKnT
         0MBl9PlRd5Vr2dSdEennUL7Eyn75y7pybyK4t1iU6seBt9n7Ga2sVTA+OWN0qrHXkIj9
         rRL6AkZQLbmPh9uJTYMWLvm0ji79TEWGOp0Y98DDp/bRoX3inaY/KUD9Q2j3Q3m7zDA+
         6fN+Je6hxy9LwBnJQXq0ClFrNaYRFLJIWIzMSuJ5WZkpyZsw08v6aF6bJF5Mz+X2LDxT
         nnorS3ZcVBXXBsRA0eoCSujT2QoOFO6as3D9oMVGA3WP8UyxfzxB58okxDI9qSMhM7mc
         Whfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447551; x=1752052351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDQ3r+CVA2MvW2DIbPjmzu6pJqc9zfZSPhLjDhnE9nU=;
        b=ptVhWp4/SVNd0Hz6SEjPQyEFJeBup6ZMD/+aPDNi9JO01fM6w0Q8YMUnv8Yqkgojd9
         E3Nuy7F4kebDZYQbGSubrQ1jBsrTy/OXgTHHN7h3XMn0lLDAvIsWf/PE4emNWSdsSAMb
         11URMj+yoxM7yWV5Is9UPBYhLy6ZlVg3x+JLgK4IzdUzaUxeY5VMltBO5DplFqzVxZoY
         BTyoZrKcOeRrK0+ACC+rAzpW1Ix1U15TIIPkGkbUOqWxmUA5C0fGib7pytdGPqEAlV3l
         jnRLtKbOan17wA9PPtVvcLsMlbnc1xXFKULaFje9EVTgbH0GE/VZ+tAyGBUvSK8Ukgmz
         RHMA==
X-Forwarded-Encrypted: i=1; AJvYcCXKAs/fUHWGGKC0WST7EyQAcTkI4uxJ+BsZ3YhwwGFdENyAZUOtDHEv7dwMs5FHUIjg1CrZKuqvbNAb@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXGbuK3zliYfXsshkyoJUL+r1QjaXY+emL2VnfS8WLRo7+mgt
	GsgtYUFvRlA6TAwZaV5j3zEIPgHSoO2UViylX3IuGgGkj+iRXXv5BvlXnGpTpYUPPHtFrxOL3Ib
	dlUUfa6yTTxEGLtOblARVj57GaO0QA22jFCVEciqhnQ==
X-Gm-Gg: ASbGnctSuz7P4ZEIv/iC3B5+cwA6+7p9Jv8Q31737f+p+GNZ6I/UzPTd6CIwmE69j3r
	wEt9X/hiccU79rU4nxim/cwj4VsD5voFUyvNJj4yfkiRgGEKFpD+bOJXs1aTmx28nuE9uIiFJgs
	IZHY4SQoP+30C5YnA/Vey5XHFpje241HTn7Nmsqe+yKmamk9KWVaGKKsb+7vzEbGtiYROn6VmQv
	252/fe7wB8=
X-Google-Smtp-Source: AGHT+IGOZzkO1OwG83M5R7T/iwIIt03xBqkgvGbvumPwq6cTDhbG6uhpfE+o6LLXo7iqTTlkfw6EIY/MkRt2Vf2gdSE=
X-Received: by 2002:a05:6512:ad0:b0:553:3332:b661 with SMTP id
 2adb3069b0e04-5562831e686mr655555e87.26.1751447550548; Wed, 02 Jul 2025
 02:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-gpio-palmas-gpio-v3-1-e04633e0bc54@gmail.com>
In-Reply-To: <20250702-gpio-palmas-gpio-v3-1-e04633e0bc54@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jul 2025 11:12:19 +0200
X-Gm-Features: Ac12FXyhL6sPoysjJZpRI7EGiwwFIYaEf3nOZTpdrJft6HPxNUo3LDKY5pf-H74
Message-ID: <CAMRc=Md4YP6fp5fnFf5p+EkSamg15dDUgxgeY+E1OqteiEPRJQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: palmas: Allow building as a module
To: webgeek1234@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:56=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The driver works fine as a module, so allowing building as such. This
> adds an exit handler to support module unload.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

This doesn't apply on top of linux-next.

Bart

