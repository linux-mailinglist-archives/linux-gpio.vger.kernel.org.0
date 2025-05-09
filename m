Return-Path: <linux-gpio+bounces-19845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E208FAB1073
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 12:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F932B229ED
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4448728ECF5;
	Fri,  9 May 2025 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W+H3IKFf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4762328ECDE
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746786129; cv=none; b=QGRrS+QJRyNRhRHywpec74vXyINvSQiBFgG88fKmY0olaTagTnTftRR122aov63OgysXyaQPKEJuvm7v7OT3Bt2cHJT8q7mUAnCSmb2VxgQmYGJE6CkMiNdscnQTk/qjGfZKQB0v6Micz85y8THZ+fSXMYQnFP2Tu2+F2RNKkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746786129; c=relaxed/simple;
	bh=/bYJJlUc/RGCIZMAaFct55Db27XvE2N75N9404EUSA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWcF6sQFxL9fC6i+AVgjv9mcO4KNiMLIf4qXyo5LtncqN/0oYacEk/AVNL7V4EhpjhlwbVmCkltBtTZ7h/y4mrnHjZoxc2LQABy7BfNXzTAYRpsBOuDS03uhlUQtWldRv6uJxz1nEzLec6qj+o0++KYM04Pr4SMD/vLnDD1ZH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W+H3IKFf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30ddad694c1so21086821fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746786125; x=1747390925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
        b=W+H3IKFfcf3XN4S/V83lrXaGIOOEcljpl8xLztNm9ZDzuiHt0LqoNRxI72xsVIfMrW
         /57B3SmwGeXYclQZMzhvb1YCbJ3TZ7K2XyPDP5TNeD7C4FOXqRcoZbuw+EQkjeGQxmTZ
         IY71fwmuQti3n85hwBEG1ZSu5Qeq+rbMTSwv/F7o09QtgpAaImxSvzGzDjFiMR/gV8e1
         JRz1SEaQ60FJW/3Lwv7I3N7DarfFv8kl/KDF1tKVOdwLR2uqiAlbZAQrX5JtiXogJDqc
         wJyDSZWiMi5J861sfKhsFDg7I6s8Tj77kexZrvEumVRaZ710pxyF3nm/q5M3UHd5nx33
         xX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746786125; x=1747390925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
        b=ei1P3QlnJTzrcSccrdMkP7ZEFNgAXO88S4FjSu50xN5AUVA4jebckXkQ/xNuv6KQJR
         nUp78MGcm++csDgZp2mcVTIb2N/3nZ7YqfsjPsmhpSmkoxbbDcwSR/wtZj+Bi5S1i2NM
         H7+3yCdbzLsA70agfpYq7Lq4HKFp0f7IRHKJRfADAI74taenaDI/ZZ7d2cs39YEDZ1LZ
         J07ApFGnRVwO+pLSRZQVEGfsvdsPsimDeWf7ZPETWUw667UWZ6/S+TrwiISsyOpJbB0r
         fb6gPT+DmsOMsOH6JW2oUcxcGunhlEJPOo5EDByupNPD5MAw2DWHzRsnJCOjn0ZUzhuV
         thDg==
X-Forwarded-Encrypted: i=1; AJvYcCWbmFGlj7kyR8eVTQJSDKoq3NnI5oO43h2xyn41DtfkBy+7PqtdADpj/dHlRzWSTc2L8+sVyxY4tc/i@vger.kernel.org
X-Gm-Message-State: AOJu0YwsEOhkRSyz1cvphHgZThCZNVuG+cHM3XGeLjUln8281wpjXGIp
	NpberAzV0liWuAtzVd1/tCjbecapJDfJuRtYaYZcwMZbea4pW8FQWnqYUe2qznvTMeKbc20xNrq
	n7D41tgqirpIjmx0Cuhsa4MKx1ot/sLDHHaGEqw==
X-Gm-Gg: ASbGncuWr5suAvQTZqChaOOzNmUSPrd0jEt1tDAVcJNMuNXENGbwzxDILV5gz2N+2zt
	I5KEx8w0fy44orlHv9feYDCg7eX+rlwdR0C2VHqGdSSprsMt1FIhSKN3RshIlPVepiC7HHX1zsd
	WxptS/WcOKKWI/C66zl1IoXpKoYcQZLqFtBS0flX7wP80R8yi/gKKliQ==
X-Google-Smtp-Source: AGHT+IFFnckVfV38yiKm/0tyz56i3avYrl46Y9age8QQDJkz0vCUqheVLftkCKucDo9t25Jxqs4Ykbmgz1ik3/urSi8=
X-Received: by 2002:a05:651c:2211:b0:30c:15b:1268 with SMTP id
 38308e7fff4ca-326c457e7cbmr11457661fa.15.1746786125175; Fri, 09 May 2025
 03:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508130612.82270-1-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 12:21:53 +0200
X-Gm-Features: AX0GCFvERxh0VC7uLRRore07epYkHtQUe6fy6V21pIoKxIz0HhJctMM3W0tAElY
Message-ID: <CAMRc=MczDhGpxwbGCUoUxGm19dqNH2FzXVrbXewy7yMP=SEieA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Fix potential out-of-bounds error in some drivers
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 3:06=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Several drivers are using debugfs and follow the same pattern.
>
> A buffer is created on the stack with a limited size to copy the given da=
ta
> from user space. The copy is performed using simple_write_to_buffer.
> This function limits the input according to the specified buffer size, bu=
t
> it does not write a string terminator if the buffer is truncated.
> Therefore, the driver adds this zero terminator afterward.
> Unfortunately, the original buffer size is used as an index, which can le=
ad
> to an out-of-bounds error.
>
> This patch set fixes this issue in all the drivers I have detected so far=
.
> The fix is to return an error in case of an unexpectedly long buffer bein=
g
> received and to use the effective written size for the zero terminator fo=
r
> consistency.
>
> Changes in V4:
> * Revert the decrement of accepted size by one character
> * Added patches for drivers with the same pattern
>
> Changes in V3:
> * Decrement accepted size by one character according to feedback
>
> Changes in V2:
> * Use effective written size as index instead of original size
>
> ---
> [V3] https://lore.kernel.org/lkml/20250505203830.5117-1-markus.burri@mt.c=
om/
> [V2] https://lore.kernel.org/lkml/20250505045346.29647-1-markus.burri@mt.=
com/
> [V1] https://lore.kernel.org/lkml/20250501063240.25295-1-markus.burri@mt.=
com/
>
> Markus Burri (6):
>   iio: backend: fix out-of-bound write
>   accel/ivpu: Use effective buffer size for zero terminator
>   iio: fix potential out-of-bound write
>   gpio: fix potential out-of-bound write
>   powerpc/eeh: fix potential OoB
>   powerpc/eeh-powernv: fix potential OoB
>

Please, don't send this as a series, it makes absolutely no sense.
These patches - other than fixing similar issues - are completely
unrelated.

Bartosz

