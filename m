Return-Path: <linux-gpio+bounces-28534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CFC606BD
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 15:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 814984E2F89
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 14:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A606F292936;
	Sat, 15 Nov 2025 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A6+USoWL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2218EAB
	for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763215999; cv=none; b=Lw5P26YQK1MGDMMAG6NIX89lrLtjBmVJX0C7U3fW82UMDIs9majzC3r3899qNUze/Apv506emh9V0d7a6KUovLNhGMnR4zNLi6+EoTXCdu3i4y/YVTgzBUeoR/LlzJwTe+6cnmyqtLCwUY6myxSCK4AGMvmXwG2X+JP0YGG696s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763215999; c=relaxed/simple;
	bh=0mnng56lg1OggPaBaIfPQVatJHf3BOeZtY/R+9TncC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KckjygteUyD+mafK4IC2NXIA922RpTaY+lO46zgomQIlMQ8EW2VXRtPyZNUawJ24mChY2/UrWcgFs49jGzdnsI8D6FhNrro3CUsZAWqezC6NZUE3MU25qGypkLQaun8JjLxkPBpVL7roCmHJuD9bQWf7JGPeZyb6R0eA8YwheeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A6+USoWL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59428d2d975so3245319e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763215995; x=1763820795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mnng56lg1OggPaBaIfPQVatJHf3BOeZtY/R+9TncC0=;
        b=A6+USoWL/MJLpcY7T00enTonv6M57yvdBXW0n3Qjwn4GwF2UoFxXUrlkiTsi6GOFde
         +YDQD3BgUR5Pfp3sQ6DAuKqgR9H6+ybY/UxVdGpeGJnSn42PNaVIWky4rlw6A1kPFJ0p
         xodE9oXpFYpX4n1zuS0eqUKaMA+wLZ7O+oghv1HQXUWEzaYxbo834861Bq9Hcdf24O9H
         dm90N/KaBVFsgrxWDDlMGwK8TdrR7Ll3aG2QlT8b9Plq8XlBTBqn3dvmRgh0lBHFS9Ir
         PKELwsJXB5hodiVqThb5XiQCaFI3tAnujK3gL4SLm85vSuZx2O8Vm0WCbrDpharY9xHy
         rvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763215995; x=1763820795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mnng56lg1OggPaBaIfPQVatJHf3BOeZtY/R+9TncC0=;
        b=u0mR5x/RmJqN1qtARNTVGM219qGfrXe5SeCKCwKXa9WWDNZfVKbZPHD2owAkRIyUAT
         qyoVxfISazJXO1Bt7DgPRdt/WTjvwy+aQpGvF1znMmwhc6TH42ZzIpEMC1ZmGJ3kHOrr
         nf+z/K3uWbYgGTTZwqmE9sB8XQi4aOfL4VN9e5WbfyqdnXUHN4XqtQX+6678w1xy8Rus
         5ci9GoqPCKuxZRAsbCI3H2+oH7a4QYpjlfVYpHGUz/snIHdFQELf5Uskus2SrDMrDrOS
         pryvn9sNA7ywJ9zY3SnP3rMYCO6B2ia9vu2cVek9ZsZdJSqkm4kM/GWnjRacAZMrblBV
         QMQg==
X-Forwarded-Encrypted: i=1; AJvYcCXsTFNlHbYiIbKr9NBAgXL+41NHdmMvC6x3cSavOb6CpYae44p+dZlRqTX5DQO/5vlBLpQXle0xHLuH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz0J4WPZbF6jMi+A3vaCQebwV8SyswKY0JzIhShlLLn/iqPQoU
	ST1aNxIZp1jLHGi2RGoqG+G7A0TByvRNZVb2Z59Lkc6nluz3vc8T6hl3bZfIaD6u3nCngd+Mv0q
	NVcTRL5e+8sdrnH7WBrT4J2JyZsAqRWA+sN0EGexTqQ==
X-Gm-Gg: ASbGncu7zQ/rcv+Rh01TUYyPEXdS7Rj0dR3EPP69mMbDGW+1EcnEq5YTBea+bjH0dS/
	kcp3evVc/PNPmP9yi+GecKfoZBSthTQlsrG9RpdmQuHM9O7xfdIptUqdtZU6W9t221T4p4mdU21
	89UzJHTqVuZ5G8tH3xvY6XFnCETwEqeok0PE6x24hhsOl7z7TUusj/bsXCmhTwzI+cAUeC5nf8j
	EfqtcxrntXQqXOECume09lH0xSohIfXHcnxaODUcRH2raw1hJsrb+2ZlEHXdpoNJ4AkG/MygsAH
	y8ldHtYqZN+4L3f1gMcB4x4kaqin4x89/+akheARfb6lpl0I
X-Google-Smtp-Source: AGHT+IHA1rCs3l25qKkZBUI+7/R6STpJvdu7uFa0/4gdiyXkez4H2YkmTbVgJM1+qAmVEvTCa7aLfBqhXHOyUXvIghU=
X-Received: by 2002:a05:6512:4005:b0:595:80d0:b691 with SMTP id
 2adb3069b0e04-595841b6fafmr2391072e87.22.1763215995201; Sat, 15 Nov 2025
 06:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114132957.33750-1-brgl@bgdev.pl> <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
 <CAMRc=MdFOFiZpjkec+zsx64Ww7MDhT8eSmCrFR4SparxhexX_Q@mail.gmail.com> <3c3bd52678aee5f1d7b93d59ad351c3a304ae8a9.camel@siemens.com>
In-Reply-To: <3c3bd52678aee5f1d7b93d59ad351c3a304ae8a9.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 15 Nov 2025 15:13:02 +0100
X-Gm-Features: AWmQ_bmUThSyRKBn_lr9ORr2-2uflLtju5mMPS005ZmGQOYH_nElLfK-sO7mZQc
Message-ID: <CAMRc=McLiuf6mUKLMbhurehqKKRyJMF1icztVv7knC5XRP7rDg@mail.gmail.com>
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip twice
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 11:43=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Bartosz,
>
> >
> > Is this with my patch though? gpio-manager does spawn 4 additional
> > threads but this is internal to GLib and GDBus and AFAIK all the
> > processing we explicitly do in the daemon happens in a single thread.
> > Not sure how this would race.
>
> no, the above log is from the unpatched version, the original race.
> I'd say that with the patch the race would become more subtle (less proba=
ble,
> but ultimately not worked around).
>
> But never mind, I think the patch will always be required for the case
> of re-triggered uevents (when it doesn't race with startup and
> gpiodbus_daemon_process_chip_dev() any longer).
>
> I'll try to reproduce gpiodbus_daemon_process_chip_dev() vs
> gpiodbus_daemon_on_uevent() race (if there is one)...
>

But they cannot possibly race, they run - and I just verified it - on
the same thread.

Bartosz

