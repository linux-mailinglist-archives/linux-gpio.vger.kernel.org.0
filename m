Return-Path: <linux-gpio+bounces-5717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D58AD3A7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 20:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92BA28280F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 18:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A709B1DFFB;
	Mon, 22 Apr 2024 18:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pZtITX0e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D9153BED
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 18:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713809084; cv=none; b=llt7kZgvZGndnBkKpT9H21bmkYoErV4ECT5DvEbeAEoRBUBTz+a4AL+mS4gU4qH5W+duPT5ApCTM5Jmw4ZZuew3kclLcVtrRRLd8g6WQHIgFhiwzG4eprs7+LW6wpOhM04H4v5Zqt1hmI2bMKf5XWNatm0jR0a4O/6XDvpEi6EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713809084; c=relaxed/simple;
	bh=M4/y7pfoqwRtT98UGvyh9liqJ5osAWBZbF3Piu+U/RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzXKwuo66QQsfgzkICBFRiyNjwTRJlnTYiygoO8hGqDMgNAkGBsZ/wh03G+JMbi9utBbmXqXRDrfSh8hCUHKq1hZ12OaRX2vGNqlmQjesD2UVz8mIHwDsDqqz2t8PPykyCc+AAXS9RYKvnnw9JGPCIgVv2M0wD080hMFmAhYVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pZtITX0e; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so1306751e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713809080; x=1714413880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4/y7pfoqwRtT98UGvyh9liqJ5osAWBZbF3Piu+U/RE=;
        b=pZtITX0e1zbuSafSwljfWL86RvoE71QCd+V1iF9zWFCPdTPamDi/lE+lDdFnpfbr2+
         UZlB0rvfiuNVR4eY7mmhKfW4E8ZpNTDHtHrc9mHEL0Qpzi70NycHAzEndd8yeHU+W7Z4
         42bnoiD1quw5Z2ecM2JzGVp+zeqh/ypZZP685FZvlXnVdJtXvrq79wPIhaD7QSd/y69l
         amUtj06JA3a1s1d8ZZtVQkt4WLYiIMjWRRFPq/H/Bq+xjf/9iLMZ41c7PFw5suTj9tfJ
         o0eoNjhTOZ8B1/qmJarBntmVZX9Qv6JWw3IYqwe3uD2Vk2Pvof1eVwsdFslaqY3EzdvS
         zj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809080; x=1714413880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4/y7pfoqwRtT98UGvyh9liqJ5osAWBZbF3Piu+U/RE=;
        b=A7RFCHnFlNMa8w27SKK7/rASj6MI6nY/YCRsYfwP0hfR65N49DDHCmRiTd7TM72q+K
         MQCG8jIh1Fxz4ucMRgRV2QNFTgLY010pAV+ZWsgIhY1mQ1t/LIhz5+YGCgss7Juaa4/j
         YmFjjjzC3bu4O5dzV/AS/QAOe0uHf+h/066DhaTC6v0/Qf2yRni3rokkNDvZUOy+rHW2
         tN09TpUhBNXR7+EHxTlBtof15W/NZNMdo9hjkDwDkz3rEcdX2jduhA2V+ixkpeo1k/9k
         s/bM765Fi6ALJSW8zxaf9ahoWl4zlP+1gaM8ONnM3TTG48I5XtSDjgGqcn4kHdMeKoFr
         ecmw==
X-Gm-Message-State: AOJu0Yy4TaXKycMT+sSU/7l+jb7/QE/pOluCoQyrgdeJY3rWtn8gcPUK
	Bnxo5PfXaRSvrKxwv9QAZkFCxcDgaZyiQfoBpcK4FjXBzqdyjNfOhh0k9SmDvPY9iIY8kRT3b7D
	1pntSYM/2VAGKP0FIl4mRYw4EzeRh898YmguclL7V7bdCN3cx
X-Google-Smtp-Source: AGHT+IGXxFpUR+9G6/2amcklUGwPdS3Kwz7aKXHl/vU+qIFaTA1nWqa6QufUCcnnSwZBQk15tqXsH8COyOFFBUWzgYs=
X-Received: by 2002:a19:5f4f:0:b0:516:d448:b42a with SMTP id
 a15-20020a195f4f000000b00516d448b42amr6167635lfj.26.1713809080457; Mon, 22
 Apr 2024 11:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com> <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
In-Reply-To: <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Apr 2024 20:04:29 +0200
Message-ID: <CAMRc=MdeCYS=mbn8_ek8bLDyy0R08pTCVyTgi72JwtJTyszgQA@mail.gmail.com>
Subject: Re: [questions] : gpiolib and gpioset behaviour
To: Gilles BULOZ <gilles.buloz@kontron.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 6:49=E2=80=AFPM Gilles BULOZ <gilles.buloz@kontron.=
com> wrote:
>
> On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
> >
> > This behavior is driver-specific. Meaning: you're in-kernel GPIO
> > driver may actually retain the state.
> >
>
> Which method should the driver implement to restore the state on GPIO whe=
n the
> last process referencing the character device exits ?
>

The free callback in struct gpio_chip.

Bart

