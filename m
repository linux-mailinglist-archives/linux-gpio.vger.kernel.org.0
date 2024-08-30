Return-Path: <linux-gpio+bounces-9483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF5966CA7
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7561F284642
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03338185B5F;
	Fri, 30 Aug 2024 22:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRSRONkE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3046B91
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725058030; cv=none; b=aXrAjJMJgiXOU8hvxJ7sviU5BnkIvgv6BNEWd0d2W3kuf5IeMU81cBrlDPzESe0w5Ea5+qSFO15IhGZqkIZDAlhCrLC6s9M5KnQ6eLx/IMXwSVDmWZJSu2UadukMmfUwyoKvThpv2KKiuL1Z6puHlGlVa+7KBg+MS40DiqQedCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725058030; c=relaxed/simple;
	bh=FcERWZl1wa1DugmkSLGflqWj3fp23asXRiIxBMGAnUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYuIhTqSeQK6ek3O917FmCdBBBzHGjfWfO56dTilEZYnaVsu71/bU4rIU9fFxZJUCfadLOTkOyS8lbSY8NjFgt0kB5gTkRz5Bjqhu5Rb6pHLx8j6imamliYqRrWXvXRDazOgcXO58b1ilgqeEv+chCE5yNfKAhQA+HsoFVmsbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRSRONkE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so3048075e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725058027; x=1725662827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcERWZl1wa1DugmkSLGflqWj3fp23asXRiIxBMGAnUM=;
        b=iRSRONkEwds+0Z2B3BS/qBG/xWaD4a2ZBX0GqOUsh2h3gHOq4+rGtuJxF2vWURl9TR
         ihi2Hb/iGyPVYYd4suql36XcT6aUz3x9DDmlEzQ/GVpfKEdgsqkpgtneMP6a1CP0Ps1/
         tp5zpo0kUCtFbvSsygvskeT9+DKj4PiltYXZrdmr09xx1JaY/ptv1pSx9hlEBiZqOZW4
         +R0mLhThJJYvtE+/yHmx29mnh9HRIjeFfJA1hrai2jbc7PK6aYIh/rwI3YSeuJGvKDZf
         1Zvgh2lvZHf7Uze+RtVVgVr6F7od7QBVLnlqgZXJFtGgq2ASvaMPmo85nCOPS8lvlL+f
         pVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725058027; x=1725662827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcERWZl1wa1DugmkSLGflqWj3fp23asXRiIxBMGAnUM=;
        b=v0E5/9R9K02WMB6LIz9X0BC56PU681TZBdYIiEGORXvYy+z89HG3OU9H33JMLtrgSg
         4/xy9cXAWw85cg4yHY1NrqucXihFAAxtVh9HLGkzcuuUUi9tXwsdBxc0JN/TjseFLz8Y
         TtRr9Rap7aWMRW4aVAmibCzsBLa/uJPFvPvJgAk96yBoitlJqAPktRCPl0KTQP0VrXCq
         QfWdvRwZCp5HxgCvOpyL57hlqopxxlDG4Lusmt5e5hKGIlamWzvIj/fa1erOifxqR9uD
         iRDhwYcW+oh/3CN9PhQ6hmgksRf7dCLE6axtqyWP+zO8D2OqaIkK9Jz86xkwkySZg4DY
         23/w==
X-Forwarded-Encrypted: i=1; AJvYcCUwTHO5CemydfWIMpAubd+HKCG5l6TNRl8Zzoe+PvDwoCpqkoWpOxC8vJaAhxRRNkhzNHD5dCdVv3G9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVzzA841f3at9OTUNhNxhhwe4BfD/Rekkqgb7nBO4QtmLC+O7
	TDWtKNRYZh71kBJti0URWcE7mVsl+Rh/aMqW1oo1NBmIetMA6lXaTCuK3fz6iK59ukhGUZA1K6g
	EMzdvjxnO6E5dW+HXhPtb3FFx3cPKVHc3rhoj08fXMuK+1Wmv
X-Google-Smtp-Source: AGHT+IE6Pux6xBCNKx6NzrDxkiMvpKkwNksEL+SETGgBL6cWj2r/5BXlHPx1T6w7EQGMUKy947gNiEBsSCvPbrCisNU=
X-Received: by 2002:a05:6512:2346:b0:52d:582e:410f with SMTP id
 2adb3069b0e04-53546ba061fmr2649566e87.46.1725058026553; Fri, 30 Aug 2024
 15:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230113205922.2312951-1-andreas@kemnade.info>
 <CAMRc=Mf4-8AfTHLrvaF14tc2TJatxZJWnMOF-1G8HmDhPKSFAw@mail.gmail.com> <CAFLxGvyX1Q8qGXkWW+JiyQSfP=1dFzeZ7C4OCJHk2pFGX7zygw@mail.gmail.com>
In-Reply-To: <CAFLxGvyX1Q8qGXkWW+JiyQSfP=1dFzeZ7C4OCJHk2pFGX7zygw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:46:55 +0200
Message-ID: <CACRpkdZY5CROs9EeRSYnOzFvr_Xgnw66ziKqYH2LE=MQe4OWLg@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: use dynamic allocation of base
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, grygorii.strashko@ti.com, 
	ssantosh@kernel.org, khilman@kernel.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 10:52=E2=80=AFAM Richard Weinberger
<richard.weinberger@gmail.com> wrote:

> > This could potentially break some legacy user-space programs using
> > sysfs but whatever, let's apply it and see if anyone complains.
>
> FWIW, this broke users pace on my side.
> Not a super big deal, I'll just revert this patch for now.
> Maybe the application in question can get rewritten to find the gpio by l=
abel.

Ugh we might need to back this out if the userspace is critical
and you need it.

Ideally userspace should use libgpiod for GPIO access, but I understand
if it's a higher bar.

Yours,
Linus Walleij

