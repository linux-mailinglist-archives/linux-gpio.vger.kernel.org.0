Return-Path: <linux-gpio+bounces-6357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1618C4E2A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C26283709
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 08:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5BA364DA;
	Tue, 14 May 2024 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aRROseLO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F22E636
	for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715676691; cv=none; b=fpMGkRyWCfkaIGvTTqddGOXu2N7n5I4lR71TeaKa0g0nOwba7MfaC3Q5VqwcWbMkLd1Jhn9EA/LakyWqpVrfYzyt7Pb9lkSkRKmijATQqQxl4AgbaGQBbJUKqKX+z8jnMgh0LpleX8Lm01I3gYTzcHC9iF1S+oeweI/kEdsqqAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715676691; c=relaxed/simple;
	bh=YpuRcNL1d/RZc0lAH4iyWYQzjYTZObelGFbgjEqMZa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=si36xau98UVNIN+k8tYEh86xQqcT7TTlwt1ymOm1kUZo0NSKttrXiiydTSbqwDYu2VUxNqWS3iOIi630DdwYrroDIbxfuF6dzhO4TjSzju5Dl6UKCV+heZTzBsvMPGFPYG7EoEezE3LgBww6inkv3xG9LNXaT/wgeglVkolhvvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aRROseLO; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6153d85053aso40673237b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715676689; x=1716281489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpuRcNL1d/RZc0lAH4iyWYQzjYTZObelGFbgjEqMZa0=;
        b=aRROseLOaMavXA0W5FbArPt54GVcGw2KyvkFMM3HFHdY6mACaXTJhq8t8zbq+vn6w2
         BfpffEqbZPfUrVabsn+zmw8bM+6BlU0E1V2z5ecE0yA8wsk9m/9w/dUVz548CwFaQ6rd
         k4lgsEV8Wu3VpoWWCvfKfRsDHiB5gfIbRNulki3sFNRHLnZB4fFt7AG9v7QbJhA5Rbr6
         A9Jz50a0f244tlx/aMQx9q/M9QfYQGvMRITJ2syn1mDd/IdftNvx3wipW1adTdUfzAPe
         v757RLhfmoY1/rybimu+7VmI7AAuGosrBymG/oroajTu4Ty3iZJ0jIISwkdlr9RD6q3y
         YNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715676689; x=1716281489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpuRcNL1d/RZc0lAH4iyWYQzjYTZObelGFbgjEqMZa0=;
        b=Ogqh0XL3lbeRRhNzLJ+PlzQmhgsFN62sYdb067XBg5Bix1eDJb19MUeehu8KS/qtU9
         aQTwQ2HujeDGtqEgKBrC2XWwrF1mAASPzH/OZTvulg+x0oYs2Ycmw0VZJ4b3nwCT3Ju7
         sZwFQ/sLVteWE2YmLynXrKA5KBR1aFJ02g+2GxDJQLE/WSuCUXy9mYRdWP7emeQw+SZN
         syh12/ValOny1pnxo7rSftulF7qiUrDP/bUBxz//axO/VuwhLKpNnMG8T2wQ28JJcT2z
         Pr4zh2W4CgrjmVOoYqSvpmdMOkfIsVvFvBB/pyjcXyKpEUfZn5nSsN6DDlCsfisVPtsC
         +vQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvUB4WlegDC7PVb9t6Jy9EIvmVzgAd3QaDL1tjCoYPQ9jy4tdQDVyGl+KpdhDQYTtoqtbQCyqsCMVlC/JNSkDXIDXn4apGWLH0AA==
X-Gm-Message-State: AOJu0YyRipS7LGMPVjKSj17MZ2HsLXQBEwUSMfRoz1zfJqefhAOeLEyP
	zLQeT8kvzNe+pdqxtEKQLYs9OLGxr70GwuYTYSFNrtQcwX7TDBvkfhiSfG01pMxJKH9J5eXBKoI
	Ezp2xFs0lT+x8CijoMugU854jpNUS8mQiM9XsPA==
X-Google-Smtp-Source: AGHT+IEEXncSLeYlRp50wZguJ1swNJ7Rn/eiIzeOU7YbZYMQO/MhNJglXYcod5TE7cTXRGpqohgHa7iMGT7HvYhCpa4=
X-Received: by 2002:a81:7255:0:b0:61b:748:55a1 with SMTP id
 00721157ae682-622b7fc3cc6mr111470377b3.13.1715676689254; Tue, 14 May 2024
 01:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain> <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
In-Reply-To: <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 May 2024 10:51:17 +0200
Message-ID: <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Patrick Rudolph <patrick.rudolph@9elements.com>, Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, naresh.solanki@9elements.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 10:39=E2=80=AFAM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Do you have an example where muxed registers are used in a regmap?
> Is there some documentation available explaining the existing
> mechanism? I'm not aware of anything.

The regmap is sadly undocumented I have had it on my list for a long
time to document this gem, but I never find the time.

You have to mark registers that cannot be cached as volatile, then
enable caching in the regmap with e.g. .cache_type =3D REGCACHE_FLAT
in the regmap config, then it pretty much caches itself.
<linux/regmap.h> has some cache maintenance functions if you
run into corner cases.

(Mark will correct me if I say something wrong...)

Yours,
Linus Walleij

