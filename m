Return-Path: <linux-gpio+bounces-4092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41886FEF9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 11:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6A74B2314C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 10:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BD92574D;
	Mon,  4 Mar 2024 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RXUrc1pb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCDB250F1
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547746; cv=none; b=mdO2sRi/F1qgWgnttK75NgVxSgYh+VLcsBHTFK2vsaeHTY4ZGZIizQ9S7nHeRBYG5a8f+7syAb+53YqQPl1K2n97e8tro28oj/lv0eW9tXzQ6SZoqGjhhs4A4BZUv6lf5APL2ZTLk5aNS2HGH7lcyyCckn+YxCOmGFVOG8NA044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547746; c=relaxed/simple;
	bh=YSFO93jw3tL7yBDt9bC7BvQt0VDaYsOPHGNL4HB4+Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiVKvTZXJFdKgT9a4rD+eF31oZFQduQAdVvaCApIamO3P4VBRREpon6eezYnXWmI0unA8Q0l2OfuKX2L3bl3qcrWIzSpEsYoUivHEhXVU0WY7MSxW7SQ71T4d3Ss0QVoN1aLpXBM1KoK1XrJ5btHsSs3919bLHFX6rQDyixxPeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RXUrc1pb; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3757486276.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Mar 2024 02:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709547744; x=1710152544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSFO93jw3tL7yBDt9bC7BvQt0VDaYsOPHGNL4HB4+Eg=;
        b=RXUrc1pbI1hK+DVdAJhZdfjMDhTQQK6hQgL9yhj8HeWpOx++5JTkYosV0A0+1b/3ni
         deJq/DEvVl0jcFro6/v2rPVnfm5fK93gjQOQq9PpoINDZzw6xOQnzBK6IB/2FEPGuZDW
         r8ImqAuqsen3N4OvJAEo6WLCDAwZF5J0jAxgJolPp1utGukDX0/RuMwGIJ3U/0qmrKgK
         VeoCkbwyyMRRAdzx2DhonmidfF3YVx9ORw8CQrifIXih73wR0ers6ZB2FIAnixG6kakW
         ip3G0x6SqjkwfZJ1jlH93KeA6wIF+UQhRCS/6vduPm1PZc8oRImiFYfN6cRKvy4B3Spl
         C4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547744; x=1710152544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSFO93jw3tL7yBDt9bC7BvQt0VDaYsOPHGNL4HB4+Eg=;
        b=iNspZEmUGU7BVuVaCOtTv8noMCv3Hv6QIDzrPqDO2Bgpzsw+NAfayQ4KmuytDCQLje
         OG9gzflf/UHag+ayypmqqGGkiIXHBPon4zH7zFXLpmYxMmcUDvTt8NZTdl1Vb/Fj49tv
         v4GLAp0NwOI5kUdrvRVjcTAh4Cweq13FBY9Oq2VQS3YuCnoEcq5falufNJFxZbPiaGUK
         yFXWN+KPh6TiIbuz4tnlaLOJPRj2EN+2ZdMRI0KQwsb2rOrU/Q8SY+XfGcKfaSMuC3iZ
         upe60ArzI7K2Pw6C1VBdQ92HmW5W5jkCcIStxP/n2Xscoa5AcU/8wL9uhayp8aiKTqqg
         RuAQ==
X-Gm-Message-State: AOJu0Yz/QoYRg2SSgucDzvJL6yY0C5T8LQMa16zsweI47/GC1LGykAjz
	wiSawOiAm3x+dqznYaCgBjt+FIyv3dxyyjD21IHnEEOr7MjyS1VxCbGnf5ivJPynrO0U57nxVoM
	ZV8Uh8ALqlF5ihi9SrBfh+1neHg+mf44Vs3gd/4aGCz7yOIya
X-Google-Smtp-Source: AGHT+IE4b27GDCsXDObk0BYrO5rt8jnYvcbKgZyfdhcqHryS7J8JyHcmQbqfswsg8jB9Mkor466Yz6NO5oHGCTK6s/E=
X-Received: by 2002:a25:dc87:0:b0:dcd:4d96:741f with SMTP id
 y129-20020a25dc87000000b00dcd4d96741fmr5763328ybe.10.1709547743815; Mon, 04
 Mar 2024 02:22:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdbCniO7imk3+EfhAqR11Wj9NFnR08d2+Hf_oXks5QKzqw@mail.gmail.com>
In-Reply-To: <CACRpkdbCniO7imk3+EfhAqR11Wj9NFnR08d2+Hf_oXks5QKzqw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Mar 2024 11:22:12 +0100
Message-ID: <CACRpkdY07F=kq=MZq94WJdf18VXFpsO_SvaDvF_B4zPUzUiVrQ@mail.gmail.com>
Subject: Re: Immutable branch for nomadik-gpio rework
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 9:38=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> I prepared an immutable branch with Theo's rework of the Nomadik
> GPIO driver, including some icing on top from Andy making it a solid
> rework and cleanup series.

Nix that for now, I discovered that it doesn't boot on the Ux500 anymore :(

I have to backtrack and see what the problem is. At least two patches
are regressing.

Yours,
Linus Walleij

