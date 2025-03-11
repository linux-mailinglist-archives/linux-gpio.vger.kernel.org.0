Return-Path: <linux-gpio+bounces-17433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E9CA5C3B2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F92F16D49A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750B225B68F;
	Tue, 11 Mar 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Nb9rqbhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8425A653
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702933; cv=none; b=nvZuVEth8ocbf/XLNyFCM6Qxjdlx3rxOKPgiScU4zXJ/G/E+FxUM/iZWbdXPbsUuReFhtlm9AHYaHCS3cApvTnrx6dlzmiI/HZszo0RxneOIi1S5ya0P4z/xjcHVbbt9ErXLR3znkEdSx685kyVWwfM2b95obWAkZGMijvOkwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702933; c=relaxed/simple;
	bh=Yoe0EetL2HTzRcyD7RhgBZqgnaMXKmtHlUgH2pP6HVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5StTEavRrLx72nKBn6zG3TqOaYrBX0wPBZztFZ3hsUJ2DhkQCjq+GGhNPmTCRemGXSPhQMYl7W6ogLQxLCChn2MPEOUlRwOb6FvjBuCYvZcOqYP49vJUf0O1wIBhT2bwfXSyVPvgLjjwWXQLJUZdUg6W+EW6zGbcu4TnutaMxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Nb9rqbhC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5497590ffbbso6272126e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741702929; x=1742307729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yoe0EetL2HTzRcyD7RhgBZqgnaMXKmtHlUgH2pP6HVA=;
        b=Nb9rqbhCwCXDKIUeqf6QTaYxINsqPuggKPuku+fcxasriZmEEVYluUHQsL0poPgldc
         8kcwtpSuF45VabDZ5jIcrGb6c1NhPIsQ3dA2eqVrdMQ3e4KUYgo56Rmu5jd8vFUQWVjx
         m1/1ydmtIEd9rTgEP1wjZK1cLC/c3l9cCqZo5VeTMjvbdELCt2OkyR8lCCZwx7yuCm+2
         gZAg+kOvRKkQmke0YIhs0XatHBIKUMMhs+WhwRXD80xWAoPyEWPPDG/4BAlOqRUnkIko
         5bLLv83qjpov5Ar33nGyVK1tKnEw29MmZVwIeBhMavlSi5G/kv9lsqTTI6NzhOhBlTmi
         gS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741702929; x=1742307729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yoe0EetL2HTzRcyD7RhgBZqgnaMXKmtHlUgH2pP6HVA=;
        b=LPrb0sLwhOfrAW7p4bGWtsAhAtnAr/W8D85HUzOR4u7CYLhucNsh5MgqekPJIEof9l
         /o4xyblhSwvh8Xh6ZejhVj3BgXl2olJaSLrzur5WRkrSfgSKQnOpnCoggdZBYbj9fQwO
         fuRXS/XfB87191bVz65v4+z+mJp1Fl2SyWA8BOeaFaUqKXLJlQFRHtYPr61K/rTvp7ob
         aO9chwp7tkryq+K1qXhbVWYXvfIht2padHKvNroddbPDsac4G+xEb357nCXU3kVbHG4X
         BQuS0ug6hKFu8RHWmsQ0GgAfZNMN7eE81rgtoyQ1aHLBteTsoLtXcZ4p69wGi8uezlZ1
         0v8w==
X-Forwarded-Encrypted: i=1; AJvYcCXZwEFu3HQbSKMULCoqvNCcD7D9wMW4ag9nNxqDAX7aau3kxg5u2AHrXWSDBsCmYvLRyTryK/BoukvA@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPz26ud/7zL4cfyDRPJG2P+q1KcbsfWgcqvvjsK8FV7nvG1H0
	mCulUiUiSiwCiQ6x+/MeZXlrawuAxKy0NdaC1Q2PvGek2dGeTi93MZo16KIFFUy2fjHEhmugqsS
	+yhvp1ZTvArDR0irsCQCAiPA7GPj+ziRssXvccA==
X-Gm-Gg: ASbGncvPVvGnXFwEY3XQgGeIH+oiPbjFVEG3DwMAG0DoM3ukiw6fLi9NbfyoS1tOgA+
	jdeKVMRyHnekgqQexlGxgpc5ndy1/BIIB7sEHGEgCrAAhs6ZMRmnUu3fwhN0aMh+HBTnrnYRsIV
	/bqA6d8x1YmUuiA3ru8Se+DdTxSYaWzV0HJ16cUk8CSZNQY1T0DkAvdY4h
X-Google-Smtp-Source: AGHT+IE3LgkrUS30nZJ2ZL9kzRQ97qlgQWOSjI9T0R37yASZGbgrQ2va5A95+qBJFrkCCE8JA49DbZg5SOm7a4n4YYo=
X-Received: by 2002:a05:6512:39c7:b0:549:74a7:12de with SMTP id
 2adb3069b0e04-549910da821mr6192297e87.48.1741702929498; Tue, 11 Mar 2025
 07:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-gpiolib-line-state-raw-notifier-v1-1-d0fa44fd67cc@linaro.org>
 <20250311145407.7e05b5d9@erd003.prtnl>
In-Reply-To: <20250311145407.7e05b5d9@erd003.prtnl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 15:21:58 +0100
X-Gm-Features: AQ5f1JolU0bmcAi1zO0R3geoJIVzfPF4SSeLlCp8d_ghGO5BqfOQp5s-WkYo-_s
Message-ID: <CAMRc=MfESnTFU1mRDs8nW7BE+y=xTWGuN8s-yEg9ningmsXpvw@mail.gmail.com>
Subject: Re: [PATCH RFT] gpio: cdev: use raw notifier
To: David Jander <david@protonic.nl>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 2:54=E2=80=AFPM David Jander <david@protonic.nl> wr=
ote:
>
> On Tue, 11 Mar 2025 14:19:40 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Atomic notifiers call rcu_synchronize() in
> > atomic_notifier_chain_unregister() causing a considerable delay in some
> > circumstances. Replace the atomic notifier with the raw variant and
> > provide synchronization with a read-write spinlock.
> >
> > Fixes: fcc8b637c542 ("gpiolib: switch the line state notifier to atomic=
")
> > Reported-by: David Jander <david@protonic.nl>
> > Closes: https://lore.kernel.org/all/20250311110034.53959031@erd003.prtn=
l/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> Tested-by: David Jander <david@protonic.nl>
>
> Thanks!
>
> Seems to work correctly under some basic testing.
>

Thanks for testing, I'll improve the commit message and resend with your ta=
g.

Bart

