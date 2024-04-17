Return-Path: <linux-gpio+bounces-5627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DB58A8AEC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 20:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 045B71C22245
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 18:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1042D17333C;
	Wed, 17 Apr 2024 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2I8vo6dq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDEC172BD0
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 18:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713377993; cv=none; b=aIc8/vJoRLlZP6HNOVw1wqK/HNHhxLFFWqW7OKMwPelwv+NUgXf77g0Hy9pZNJba9E1JNQP8T+fdbXgX3DqL3Li/jrBEL/ncR9lE+GThTlMxOiie7uA1TWuCJA710thzrp+IabHXmhqGWb4ZJwkF0X81a8BKvqzgZy6C2ZC2Hr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713377993; c=relaxed/simple;
	bh=E5Lt+ffHfRg8xmAsCNmgFbUyro5LbYYD1lfR4zsupLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppf4dBS9kYtnjp4Hsjq73PvwwXJV31RcQHc2YBYb5GzVKjIaEWmv6rvaHLCYfEjcz54ik2O9Hc8Aunl1QS1rbDqroHu9VnPAaJBccuaPRp6hSHTu5uaFNBmtP2tk3Pmo+yZuJR4/Wnr4jB2yKJI/HmB5VfFPkUCMdDxbhoKYj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2I8vo6dq; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2db13ca0363so277211fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713377990; x=1713982790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5Lt+ffHfRg8xmAsCNmgFbUyro5LbYYD1lfR4zsupLw=;
        b=2I8vo6dqpHYJgCyKvc7dwSSaxfeax4S90sVL9Y+AX2Ah10np9gzQ8HA51ZMGTFiZvB
         jmi04F0pWpnJEKHDm+X2vRQMMwYTOD83eJhJSF60dJUFwGzFmy6NxuKmWZDrvom2J98F
         EMJutou7dT/pUkD1KQVNEnx6qVkT1sNKT5lggRRJFzjkD0HpE7ShXVdDHfyrpJwdSSUX
         kB/HMBOi+YePp9mnPYvFA87sZ0Y9hhYFRzu/lF71osZZ9+HBJHHOAopnnofP0ey/G8M4
         5OLUmy8D9ckZLReb24ONklv077bTm47WIXCE+MsFCizu6RYYZARHibIcDE5HbyYUHoeD
         d1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713377990; x=1713982790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5Lt+ffHfRg8xmAsCNmgFbUyro5LbYYD1lfR4zsupLw=;
        b=a/gQm+B5mXfpeJe1sOG9yJEng6KbedDD0dxPEro9O4bYlKXEg2yQaFW2PKR3jjJPXE
         4linPuNa7OaanpG0W2yu5QyzRpGi5AYsGd4FoluJgQeCMm1Cg4oiVjkFJXARFqHhsyz1
         g9eoO2mrPlHuvHTbVBlH9ismOerHpuOlxXDAN0yCVWxnft8L5ZxeqafeqeArspQHiT9s
         Dule8B/D9kKn7I2grOADTtnOGv9be6kpUsSMThjmANYfRUWI7/fB2MiQN0+WqXVW+hEx
         pE9cPFdp3K59bTZKUeMdpXbi+G1guHKPs1f3Qq9Nlkk9P1ZengipuZ8hdl5hQaw1B7jV
         2xzg==
X-Forwarded-Encrypted: i=1; AJvYcCUStq3up6nhnv94h9OeLyrEaAfsA9HN903nH0YE3v6gUAbYBE6DLRQar3iQCt5d9+xYmB6Da79t7VS5aLnWWYsRdwLo4PvTPiPMVw==
X-Gm-Message-State: AOJu0Yxx7VpFYBU7N5mW3H7ObXjIUEGutMyp4wEvM9Msyc4ET2bYqwMp
	CrIRR9Xvu6PDG+5UkYod02UcUmyUsWNnZte/0PHkTIVP0zMwkM2h+3e2hFa1JE09SbRggVB2FDr
	WZDLOSo8+dADHMDsdFd9DbVmf+qLzd4uH81iWqTbeYoES2OxDBiU=
X-Google-Smtp-Source: AGHT+IExB+6UnFXh8LvppjsLRD28Zb6Ma6bPnzodalh1mlBjN3At7SXOwFqlauJ21IgBLjClpCHrPxVMBB6VsGrO2nY=
X-Received: by 2002:a19:9148:0:b0:519:a55:7ee7 with SMTP id
 y8-20020a199148000000b005190a557ee7mr60964lfj.26.1713377990047; Wed, 17 Apr
 2024 11:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410072102.1200869-1-andy.shevchenko@gmail.com>
 <ZhpC3lLD-BHqJEZz@ishi> <CAMRc=MerqbYue_uubSkr0ta3wr+yQxfFMfk+vAUZa+C2oR+udQ@mail.gmail.com>
 <CAHp75VcofgAQLFVLdsA-A1AkjVzQBJWtam=w00+z9-rueZyv8A@mail.gmail.com>
In-Reply-To: <CAHp75VcofgAQLFVLdsA-A1AkjVzQBJWtam=w00+z9-rueZyv8A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 Apr 2024 20:19:38 +0200
Message-ID: <CAMRc=MejJTnawn1=_x9Va-QJRctjoc3TJanVqQ0uZbpmDzpyjw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sch: Switch to memory mapped IO accessors
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: William Breathitt Gray <wbg@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 10:05=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 17, 2024 at 12:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Sat, Apr 13, 2024 at 10:31=E2=80=AFAM William Breathitt Gray <wbg@ke=
rnel.org> wrote:
>
> ...
>
> > I applied it as is, if anyone wants it, this can be sent on top of it.
>
> Thanks, but I assumed this should go via my tree and as PR to you. At
> least I have it already in my for-next.
>

You didn't respond in any way about picking it up. Can you just drop
it from your branch?

Bart

