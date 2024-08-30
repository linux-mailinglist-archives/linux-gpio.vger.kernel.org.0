Return-Path: <linux-gpio+bounces-9484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F571966CAE
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EEFD1F23E5B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8865418B484;
	Fri, 30 Aug 2024 22:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Et3v/1aY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF346B91
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725058133; cv=none; b=pDnHhNvDeP7XKbB9tavxPBGemEThCfaRjkh8PumNMAHGG9dAGH2omBVY/us8R9sKyLI/R+Ki7ctQYrgPghm9snwh5WFomAyDkvM0SknOviZgojVpqUV7TP7TkSMTlP3DkY+DTIX2KRSx71gtWB3ThOm9VW86bZ9/xvoqLjCgUEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725058133; c=relaxed/simple;
	bh=JYUyqjMtyPycxjQHE/amwVFlyjc6VQU5XnqwL5FD0Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpiZhDhXuC8Ryi/E8kyw9yJLipkh+vCwdqeKNRUgITduaTpzkLE4A+gZBXGSMU1RSU1JhaLgSQ5OrsVAKm5aNVlcXNEGDuSTIkn8KbyS3LE4BXbux80fFVJWNpKIy4gzQX2D0SS3BZDDwcCUYkxXFFWYIaYHQLy6CRWdKnHJVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Et3v/1aY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3e9fb6ee9so27507251fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725058130; x=1725662930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYUyqjMtyPycxjQHE/amwVFlyjc6VQU5XnqwL5FD0Mw=;
        b=Et3v/1aY/P/GL9+K/j4z1Fha1lb2+soZ8EARbXIYUgXwYMZp04V1QDqmNr2frUR98e
         HCiN7rjn1/ryu4PXAZsQ710rlChcauOE2dqwlMrdIe4Yh2CO4U3ZkS0a0EapChC3XZ3A
         mjqZNOOJxQ2eh5eAzBsSevqhNggg6mWmyrCePo03pKbPuZnqZ7Bz89anHDEbYJxJekmf
         TytTz0kLEGXccVyZXGstpaZ80CpMhNY/PKnUQOGYiivhuEe5unoofuCa7sJLYMNlT8k0
         xARND6J3zhr3L/N5eiY0De/l8RkA8kIeuWYv0X/Uw8fcsMz26MvamfRu4P/XLPK57XAs
         iF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725058130; x=1725662930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYUyqjMtyPycxjQHE/amwVFlyjc6VQU5XnqwL5FD0Mw=;
        b=YIdcWX2lZ5Gtb+GKpoymdgnqLZRfxJbowuJ6RROrzpF2LuTGt/xIOKPeDp9GABFOVF
         t0zQ0oOKVrePkdp5QbOju9Je0tDlggqQ8Pq0W2egEwwhMavQRQnwPDfxu2QBtXv//7jt
         kSSvF8T0Xl6FNgyHKYRBFGceNBnxhko768/u3PoZFdV4uzHnD3pTdPQe+SN4oXW9ZzDz
         ocbMMO+1WPtygoNjPc6Ym4uQJmTJDrg28ufZHtWWIKwZbdcfPt1R5BZBxJWLe08gN2fW
         jIxnSFLRp7fTpW/Fhdb2wD9Bj8IScMsXqbADJ0s5rqmKXJnw7Oake0tzGvUvBSok93Vn
         6H1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8WenUvHTG3scmmnugpaM/QNv4KEbzRoQr8/d0fznPMctnTIYHfV4wO8EZMeRnFeUazIg/MJMlwBZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YzfFK4KUpQXyl6tWrc0+MYuC7aci3m8WpRUTI4NXIpajWMCp/m1
	9H5c0FxN3xlJXxqTMabexARBTS0vBE42h0a8R62DF01b0cUQsQjhEQV69F4S5M3UYHtg4jj2/8I
	B02He1FKX2vZ9KThwsQdhx/JRF+bJrf15lhVqUg==
X-Google-Smtp-Source: AGHT+IHb8yYNqKvXobOLtm71pbJH/2OmtII9Yv4T1KNsEkIknUIBZXanlwk7I6MTZZWDZYu7FBbkwa/j8sqao3IiWt4=
X-Received: by 2002:a05:6512:1294:b0:534:36bf:b622 with SMTP id
 2adb3069b0e04-53546bc7f40mr1908506e87.61.1725058129075; Fri, 30 Aug 2024
 15:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829131051.43200-1-shenlichuan@vivo.com>
In-Reply-To: <20240829131051.43200-1-shenlichuan@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:48:38 +0200
Message-ID: <CACRpkdYhi1syb+-PO41q18=rU0aykgNKzg2j7zmGQyH6Vbjqgg@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: stmpe: Simplify with dev_err_probe()
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: brgl@bgdev.pl, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 3:11=E2=80=AFPM Shen Lichuan <shenlichuan@vivo.com>=
 wrote:

> Use dev_err_probe() to simplify the error path and unify a message
> template.
>
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
>
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

