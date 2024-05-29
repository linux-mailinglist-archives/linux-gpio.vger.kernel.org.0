Return-Path: <linux-gpio+bounces-6830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1BD8D35F0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170B72878A7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3929180A7B;
	Wed, 29 May 2024 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EPcWYr+x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC60819
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716984230; cv=none; b=YjakQmTGDlzivgidUnJsSZLo/aVmFAkq8ZboyvWb3/7i0Oon8uY1lH89UpfJxA44OpqfmJ+mrm5I+vOMgWVYadB4PXxR9LiwEnjy9/4Sl4VVWqHqepjMO3Dih8ZRCk8+AK2LtuN6UZHpBNSn389bmUmm9QfXRlpavEf+1ZKq8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716984230; c=relaxed/simple;
	bh=fv1yq+b8Fa0zizeYZwsTuPk1aDZTv0z3x5xDzjMhKpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAq8G3k+P/G456LrNVKvxuh7VOlLuDk+Ntw66MD/jDXktECRnruYYt6sgZ0KSPIJhsViSijwCtUVbfiXCw2NUJR0JHyQU+SO2l7TX0zMPrXCS4x7xVgd+DCUuT2awfrXguzt71jR1itKKDAn2ZUMPL04+eNFkh8JyrAMQw9r4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EPcWYr+x; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso18907001fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716984227; x=1717589027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv1yq+b8Fa0zizeYZwsTuPk1aDZTv0z3x5xDzjMhKpo=;
        b=EPcWYr+xhalJP5SNZlWIuX4d3NypR/N6n3itvP+3Ul72jQBXdnM2nGrCMXJ34MzS6j
         s2mt2am/ivw45LDcNn9e+IF+3Ur2Fw7GK8aKSfXemJGAE/dmOw5ckVGhq1hR2C8abfNt
         ILbsWN0Kx/8s8knbM8mAljWsAZ74Q0AhLFBPQgn6ijPaFSg2OaucTGpE8fNSqxuIRyWf
         AQzxgxAp1GUDeerpmiU7rojpB05r86HjVf3PWvy7Zra3bR3wQAE2LRa44qTW0TKXd8JY
         CXc1O5202jnG8ymgX/QOH/qxIP4YguZ83xwIfFB+BEXrWZxJIQjIXVLqs1DJrpk5Lykh
         kPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716984227; x=1717589027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv1yq+b8Fa0zizeYZwsTuPk1aDZTv0z3x5xDzjMhKpo=;
        b=LqTGBsfo6oYNoumTEKeHBWc0gGwTmxmTn/8E0WaX9x4J1FWyPf1ydxQPDJlo+QIl94
         4yiCd3c/uBo+5fvHYpAMM5acfkmNl6gBt5kbnvMiA3cXPsIid7RfDkMmWeowCA+iXnf6
         sxo/+X+3ILwvcEpRRUR1rEHHmuhptnl5/wyw4MF7F7qJJJ5vMXleeHKGwzaNAZLcPki6
         2+A/s7uLoJSdZOF1yw62VNV9+YYKBm7hTTeuVobVMM2HvzP035qiNXSUg/ALYIhmyWPr
         gpwCP4Et4OwDEUWnXJIMjg87uISfJkKVuYwt4AKAeiHhS6lIUexgF6UNnlNtOnS4qYrX
         UDDA==
X-Forwarded-Encrypted: i=1; AJvYcCWQkIgm7q9ttOrvBYbfEBmNDa++OYb8Ihrfuk0QmiUsLXQFgovyZxe7u9C6y8GX90QRo3SjXRWpW+Rp6Ac+UL5vRLhARKEO3Im/ag==
X-Gm-Message-State: AOJu0YxTa+T2/YhYRqNszxEm4lETmWMEq6P6gAmmcAHZLeY3OhatIj4U
	NcVUdG6KQKLz771x/7hkY93uS5h1VgTa3B+uFHib0jlh981vrHmQ/eluJWQ18qZabaLYuFTcqha
	VFr0wIh0HCsEPa1nqlTE75SBVxKuxZHFGXSxeZg==
X-Google-Smtp-Source: AGHT+IGW6Y1JTq7jxiTaf3GJCoqW86C0BmTISHbEl1PyYE6+lvvfHlDg9UjgH3WZhsxNA+9t6gJf44zVkSYI0Jz9jM8=
X-Received: by 2002:a2e:83d6:0:b0:2e7:1b8:7b77 with SMTP id
 38308e7fff4ca-2e95b0c163cmr94367011fa.22.1716984227064; Wed, 29 May 2024
 05:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com> <56cb8a4f19ac0596318d740ed14091d6904d3f7f.1716967982.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <56cb8a4f19ac0596318d740ed14091d6904d3f7f.1716967982.git.matthias.schiffer@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 May 2024 14:03:35 +0200
Message-ID: <CAMRc=Me_JMjp55VYLFH_gX6+fdCR+3zpsWtds1W+hCmf+k70KQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] gpio: tqmx86: change tqmx86_gpio_write() order of
 arguments to match regmap API
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Gregor Herburger <gregor.herburger@tq-group.com>, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 9:46=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> Conversion to actually use regmap does not seem useful for this driver,
> as regmap can't properly represent separate read-only and write-only
> registers at the same address, but we can at least match the API to make
> the code clearer.
>
> No functional change intended.
>
> Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller"=
)

This is not a fix.

Bart

