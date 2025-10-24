Return-Path: <linux-gpio+bounces-27592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBEDC06FB4
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 17:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB33D3AD516
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 15:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DCC31E101;
	Fri, 24 Oct 2025 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yCrc+9CP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B428D190477
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319647; cv=none; b=gvwaESSngvCZ5W2OXWBDBGXEadIZuCF8yx2Bg6BS58nrI9ct6z2lTkeBNF/R6GruTeG+fPZDSI+0N/jRsDizMxfUzqiDJiaecu9rxcKLAhsJ6JvQ3CwUejcxLK12K9aNmqCuTV/kYdn5DuJrw12ZqzioXn0x7295uoP5IOb4Crk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319647; c=relaxed/simple;
	bh=1XYvDvnbFF/TszPFi0vSCsxsrGAF0jNL5hclvwK3V4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfnJ5tck9n3pZScsV0n2dkrVLLAcYBOGLeXSISbrPj8t7IA2EGwIgOq9tq/2KxL9RqfCemGSQafddwBX8xCSUFPHLGynFccSXqMQjnqJzAHTAJ8pN9WOjeWDw59pYsceyZkD60Hj0PIV8KeWxtYt9TubIIpAjJajEEsE3wbKAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yCrc+9CP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26e68904f0eso23947125ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761319645; x=1761924445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XYvDvnbFF/TszPFi0vSCsxsrGAF0jNL5hclvwK3V4w=;
        b=yCrc+9CPuRj3S0VDiKd0dyZY1VMg0zxkUWkqw1mCRDAqCJekFepfvc6pmg70rLZFPY
         BrtVNavTpbrqza8uII7vb2FtTekv8ow24SiYIuMc4qN1Cb7rOwfnyvwsCOlWDsaONSOl
         B00tnCJTA3p/1OXS4/m8KCQzQKlkoRHbyQkN67ik2rSLedSarnB4PHqbOgwcuVXcXZ3U
         0hQLGZxLK7InjHaGAA3izbDwxgckmjVdJkP6Nj0pwbCeNXJjuyiX+XnyrWNLO58slFnn
         aXpk4LKiQZzP7m0NlkEnL0uur2eXvxFPmX/5WdHZ3XNSHahJLBC6IkMnpSvYFIHHBtiK
         yX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761319645; x=1761924445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XYvDvnbFF/TszPFi0vSCsxsrGAF0jNL5hclvwK3V4w=;
        b=F+/38siaPMmHsTAcwXifX7HmYWoENQ7g8yLrrzTlcwjqliMhnp6VPV4oVtJupdSKXX
         ZmlUpkCX46TTOIMhgxiwDKxwRYvRtdCjVp77KarwdkK90+EDQBIGjLjP7bO4h5yGAOXT
         VZtcJ440j9LrNDFTmpYCu+wxPW4dqN8mY7pqHjGFHopIgt6od8GikwuOXPG7CIwMdPzi
         g/FVADI8L6JWj18yP/TL+XwHRILp4cGCHSI69A3UcIpjZDMkFBDQ6FWXQAsVS9HeLWgi
         zy7SSmoE1YIJlS8Y1XvvLXoc7nFAnLafpKF3jySlH3o1iKBPWEn6KUc9NCRc9xGNQ2By
         cQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCVkNiY4f80MIiizKvmPIDeO+o40j4B6z9HVoK8nh2/lt3Jcc/hyOfXO1eKOU+JTQ9VnYgHGUxo6yVNG@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOiaI9kzojmaSaONjN61UyeGKSlbSE0hboXlzN7B0y/dIQzFJ
	/udEw3YACxFo7lYFbm4Sn0j/KwiwjtQdyhGTyvSbGklqB2K0tfgw2vwPXUkFYHsKoedOIIOnKlM
	XfXGD/o5AIkwIwoNAoTuRz3HgrnfG4X+uhM70kfjoJQ==
X-Gm-Gg: ASbGncsG/WqKZ09wMBB+3bdtkJe2vbM/zB84xIgyGQBfmp2GKzu1HjGiCXFKHoL2xZx
	J/x8HgcOYxG/GQkXTa5td9YF51CBJqt3oYon6VeaYYoO5iYFXp+EjwHC2LiUgc115XhUaCOO7Wm
	69j8HbBL7FaD+VmToj/Z2x7fledQPe67fYTNA8uKmnYTkSHSb2txTHpToNWAX/jzQEbHMrGc8Or
	8IeSi2JtcVa5Rr86X/peVsG+Ne7txo5y9R9hCaRNKMzdtxuUF1pUHQ7gzDKsBVKwqT7waF3Yo0x
	rin61Ko3GyPrX6U=
X-Google-Smtp-Source: AGHT+IE3ievDsUOrEWWRlev3EL7B/5BDY1VDgl+stdkjFTeQQMz83r5xV0GQ4imramVbO2gEuzsY0GzOsNiz+9le5Qg=
X-Received: by 2002:a17:903:3bc4:b0:290:b131:31dd with SMTP id
 d9443c01a7336-290c99aa9a0mr353473585ad.0.1761319644954; Fri, 24 Oct 2025
 08:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
 <20251022-reset-gpios-swnodes-v2-3-69088530291b@linaro.org> <aPuYg0ws8Q2sp7Wv@kekkonen.localdomain>
In-Reply-To: <aPuYg0ws8Q2sp7Wv@kekkonen.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 17:27:08 +0200
X-Gm-Features: AS18NWD66neXy4pA0EykICaxP-IPYvUIs5btM5R7nrvoWotj1uaZi7dUGJ0akYg
Message-ID: <CAMRc=MfgGSExksz6ZwGEhv3yiL+Kfg+YKX-p2Ox4m66nYor4hg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] software node: allow referencing firmware nodes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 5:17=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Bartosz,
>
> On Wed, Oct 22, 2025 at 03:41:02PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > At the moment software nodes can only reference other software nodes.
> > This is a limitation for devices created, for instance, on the auxiliar=
y
> > bus with a dynamic software node attached which cannot reference device=
s
> > the firmware node of which is "real" (as an OF node or otherwise).
>
> That's not entirely true: you can add a software node as a secondary to a=
n
> existing OF or ACPI fwnode. This has not been used widely and it's not ve=
ry
> convenient to set up.

First: set_secondary_fwnode() API seems to require a struct device,
what if we don't have one yet? Unless you're talking about a different
interface.

Second: are we even allowed to modify an existing fwnode from a random
place in the kernel? I mean: I'm module X and there's an fwnode Y, I
don't know what it is. Can I just arbitrarily add a secondary node to
it?

>
> Additional properties in ACPI or OF nodes will still need the secondary
> node, after these patches.
>

That's not the goal of this series. Being able to create software
nodes that reference real devices. In this particular case: a software
node for the reset-gpio device that will allow it to resolve the
reference to the physical GPIO provider.

Bart

