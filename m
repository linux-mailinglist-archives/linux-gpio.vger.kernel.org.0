Return-Path: <linux-gpio+bounces-4616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AA88AAF3
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 18:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C221C3D4EF
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 17:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECF0144314;
	Mon, 25 Mar 2024 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Wo8KBzsZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8881428E3
	for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711381722; cv=none; b=tF/096e/2+cVbjwk+4nwiTek72bCMFwQc0mdVoiRZovPbClfMm9Sy0L2jv70za0yON0ga8gA3LwGVHb4KmHt/dKpIiaknr++ESWUyKRO2L1dA/b7AHJf32546X5hRj4GV1/B67cnFGqXUWWVxu6aikIN3S2H/YcxGFDxG6STp78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711381722; c=relaxed/simple;
	bh=aJbqtcT5Qk/lZjpWEh1CyTzQTjAlrrxanun/S9rh2UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPee1xnMs0xa4aUXwBSDJLx0LOO7v4xHKU9a7SPmNu8YuX/it3Q7Kpf5zymBAVUDKfJuB4nJDvy7zeFWnTqv1Ei3dqCqHusgVRSHK6LSbPk/vQV0cvmBsRgp3CWET25NgAsF0xMKorD1BWcSA0xrHRKIo6Jn4Ny/+94wCkpwSXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Wo8KBzsZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so59915591fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711381719; x=1711986519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJbqtcT5Qk/lZjpWEh1CyTzQTjAlrrxanun/S9rh2UE=;
        b=Wo8KBzsZ4Gp0pP4aIZYmkX4rjd42Ohhr7qxZqL7NfDUjHtw8M14bk2mRKntgOZo0At
         D+/JH/a1Bg22P9ZvpCUASp/LxtL1L03unlVbVr41TynAqE8zTOZJCBcSRA84ww5VTC+8
         o9IzArw06Kizh1dnK3Yx/OnWBBsG9X5DSvejO74H4NNJ9KTSu6ZMKNgZnjGNBbxM7/dd
         JVOtkgLSQzTTpFUl4xeR8hiWZZsepgktlit0i+yOVROmDtLdLbN4TPYnMDQNmqmAJKQH
         QsAF7N2j45rGbSpr0eAgEfxyh1yqI1aKudjMPs8KCQ3nV9TY5waZixZeZE1zWSha70MK
         p2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711381719; x=1711986519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJbqtcT5Qk/lZjpWEh1CyTzQTjAlrrxanun/S9rh2UE=;
        b=qKzOf2m/bXJyAk+gme5ALdqPfhHL0Vgsu1XmU6XnWGkkXMXpYH9Eby8Zsp94hJNmwI
         MkJmlGMizz39yVYsW8IMBLeyHrAOR6j2mLvGtdfxVKLE6fyYnGPLxb0KmP4Tl7hhDs/L
         OkY71R0T3vx9Sut7DSbj3/QgpJyCTgbfhYBkdniOqUeLq5aECgjjQwDnhfPHfzADrMZM
         rSi2HuLyzk2PIQmZiL5uChCUXkgxaAgei9uiGHJ9wu+BGGRXr1VnGoQ/L3CrHZzZ9pNN
         EbghQEUFrFCMvfgVe2pv6zRfflTNDhLKBT16rew3rr/CMGShCh3JpOmb3GDNTS1FyWGu
         CDlw==
X-Forwarded-Encrypted: i=1; AJvYcCUv6f5aZb/5+edqMJAsn9FaHQBzj9itOtEJc7Cg2G6CIA1KmR57iM8gubYTUJmkDLKHB4cFWNZ14Frwi4u8+zpe/dkIAITFKTTlIA==
X-Gm-Message-State: AOJu0YyJYyJjE39BXXoK+nSQhh6BmYorpP79pBtF569W1AnCLcec1gzA
	4/IhHpsJ+NPv7TkqxC8/YWn1jLF8UPTms77cNGvVwNNh9KGkjI608echTGN00hMk72cvXn6v/pA
	retZqL5JstfOgBuChBW3o9TnJeOPmaTqk10yZLA==
X-Google-Smtp-Source: AGHT+IGvFSA/jIJoV8X4RKk5N2K/yc7CSyNykotDctEjLqK49e3F+1X/RkOnddLAvw547/5xInAWacgzxKhNl5GWIqM=
X-Received: by 2002:a2e:b7c7:0:b0:2d4:764f:87d9 with SMTP id
 p7-20020a2eb7c7000000b002d4764f87d9mr4708167ljo.32.1711381718862; Mon, 25 Mar
 2024 08:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322073725.3338266-1-peng.fan@oss.nxp.com> <CAHp75Vds1dmjbaDa0D+Xxoyt_9CgHhoS2j0cR3EQdMp3sbwg5g@mail.gmail.com>
In-Reply-To: <CAHp75Vds1dmjbaDa0D+Xxoyt_9CgHhoS2j0cR3EQdMp3sbwg5g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Mar 2024 16:48:27 +0100
Message-ID: <CAMRc=McYbsd8t1_6PDypGBme2OSyvy8erdjR51cUzVhM-qQXZg@mail.gmail.com>
Subject: Re: [PATCH V3] gpiolib: use dev_err() when gpiod_configure_flags failed
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linus.walleij@linaro.org, andy@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 4:59=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Mar 22, 2024 at 9:29=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.=
com> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > When gpio-ranges property was missed to be added in the gpio node,
> > using dev_err() to show an error message will helping to locate issues
> > easier.
>
> Bart, are you aware that this will add yet another possibility of
> scary '(null)' in the error level, which is much likely visible to the
> end users?
>
> I propose to apply my fix first to avoid this happening.
> 20240320165930.1182653-1-andriy.shevchenko@linux.intel.com
>

I think you meant the v2[1]?

And sure, I will pick it up shortly.

Bart

[1] https://lore.kernel.org/lkml/20240320165930.1182653-1-andriy.shevchenko=
@linux.intel.com/T/

