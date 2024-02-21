Return-Path: <linux-gpio+bounces-3609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E885EBFF
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 23:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 906181C22C5B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 22:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79B112A14C;
	Wed, 21 Feb 2024 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T4BGRkzg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4E33EA69
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 22:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708555824; cv=none; b=lxpTflCA5WgR/jr78vPKpcOliYwYDF2FrYlPZ0xy5u8CfvbVDnVjob2SB6WXvKg9z2jAHAVn8RPislHQSQjG3C3saxs1rA02NXBneHmavTos274+vsnLM5OUWFJiB91sGA+tHPvV+16xfnal0C+b9KP0TlB+Ab09Pg5Wsk7Djpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708555824; c=relaxed/simple;
	bh=Pip35SH9+CdhvlajwI853O451jz6n1f18cqP9XQpX2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hske2wFqXi0LopJ+hcRPW0WvmRByVxwzaZys5RlVo6m8XtYUNaf9UBApmmIEn3SXesikINOjjutyJyVKeM4CqRfFGuKTlEDVW3puKOH9E4U9QC3dNnz4eXsnGbXuUDNbTS0Yo9rVKev4kmJiLc3wqQZm7fNkIHSJKC9uXSnsuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T4BGRkzg; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7877468beacso57906285a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 14:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708555789; x=1709160589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kIUQjuesaJXPbW05RrE0sIWWykVRMpIc4Kl99N/9cg=;
        b=T4BGRkzgI8/uzDOXKFcPvS12TTjG0+sP3vHbwK803mgCJqqq6xoTEtdZP37LLDDrIQ
         3aXzRcUnrzpedHIcQPJfC9/xZHLXsKK9HdJcEEfSdYT7Fn4tYxQx4rrf2X7GeUXE8i2h
         kEGQW1tRZw+QdjgRJXzgb5l6SQuiSVjrxJumVcbNGHa8+hfDRS+DMsqMGIWtoWNh6NWA
         T6kBjV6pmG1gTMUi6YmvKXFQxfkMiCp4O6eVuro0aWL7DtdUeXUcOc8PqXOBikC40bAU
         eRWJksh3YtYS18X1X/AsXDsG7FWF/65jVUj1fo3zFXfJOjtQgzCDxcZbGWknbo8OZuWF
         Ly5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708555789; x=1709160589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kIUQjuesaJXPbW05RrE0sIWWykVRMpIc4Kl99N/9cg=;
        b=BqtzSwd5a80Z9W7ti62foWhCgw19T/1tNOmBmS4uj0Lu8hXwFgnRYA+Om6PEltCIlW
         OKY24Krrqf1mhy5kU26ZjBODLbl2JUT5dgRNQAxl3F2oT8gRgomtaZ+K/a4GI/DAC5QK
         66jjR6FoqvDUKy+l4eydL8k4M969o+iCi6GT/yuVdonLVIGJ/ffTF9nDdmits8opR6yT
         PI/8R32yf9CrG3FuNkNcsD64p+cHrHrriCYHEdJ0YoZrY23IQimlB4DMlRy8k/YqPFFy
         fFblzpMrkeTBAWpgqYKukofxA0oVHno2YSHa4z1MOH1MQn/w6QSJbDev9PGRlEIomJ18
         xQiA==
X-Gm-Message-State: AOJu0Yzp8C9NHcAbEqFImn/xajLPADbutIf3sJXUe0MeeerwgrQNyiwM
	rcpMZAVMw4crfDa0uj56Xq6VYuUItLFdqbP4heRlPovn5Mnp9eCWn1GKoygU2kjsyw2CGf4tLMM
	vNhPVlOcJI0j9xOm5XeUSIzMptypnxkQMRPgg6P/EXp0u7Z+H
X-Google-Smtp-Source: AGHT+IElkiaCXsCJBCsUxDG0AfmMhYZFKXDXyel91r1laTg8k0E10NkHbyD70fwtw6ZHo/kgp8Mz8TgJNiCqtyZiR4E=
X-Received: by 2002:a05:690c:72a:b0:608:8582:8a12 with SMTP id
 bt10-20020a05690c072a00b0060885828a12mr2571986ywb.4.1708555768842; Wed, 21
 Feb 2024 14:49:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220135431.22910-1-brgl@bgdev.pl>
In-Reply-To: <20240220135431.22910-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:49:18 +0100
Message-ID: <CACRpkday6DfkxfRNxjh+T+-i2E1=Ty5hSecnK+o_we+nAZ47GQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: delimit the fwnode name with a ":" when
 generating labels
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 2:54=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Typically, whenever a human-readable name is created for objects using
> a software node, its name is delimited with ":" as dashes are often used
> in other parts of the name. Make gpio-sim use the same pattern. This
> results in better looking default names:
>
>   gpio-sim.0:node0
>   gpio-sim.0:node1
>   gpio-sim.1:node0
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

LGTM
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess it could affect some tests?

Yours,
Linus Walleij

