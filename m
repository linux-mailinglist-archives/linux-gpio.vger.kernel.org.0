Return-Path: <linux-gpio+bounces-27830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C0C1B112
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B68581317
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887B02BDC34;
	Wed, 29 Oct 2025 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUmnKqAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944929D281
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744384; cv=none; b=T8V9rc3J+TPUiZ73MGjDUn+RxmEpiEAWige04ZGIdqSmiCbkAgtaSzJSMKfgG3Tqb9As8LO4ahscYzW+NjKWb6dQG6nFBB5jatP3su1xGXRWDHswuiKDK4J41HsBIQQiP8j+9BPNI2VcIL6/0KGPybWiKy/0Qkmz0fFXcTTyCto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744384; c=relaxed/simple;
	bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUaI9uF0FqOPJYhIedowIVEE8FWS7SYvB050Ettx9f3tJW8PYNDHlo6CBQoqrt3WSKL6JRDqTagQuT5W7ZwHcvmWmcK6Zts6PsHddmImPhUSPQ1AOdZxJJeYvHVweLDTPHdDVK+wnVQ38hJOhZukGcvZW1v1pfY8sdg4vgM6/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUmnKqAV; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-378e0f355b9so53797891fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744380; x=1762349180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
        b=iUmnKqAV2ZqMdwnarD5Ij79DsuDs8d9nv9eDEmFWWJiu41QA9o1q9vb8Pkbw3xbwmL
         c6QCK4LsJtvpN8Y7BhbLijAl1jzxLs/rlhWG9ZVtfRggaPEayDKQmSSxpfpjumVUz0H5
         I8GBQUEMGUmH5HGOvkZB47Y6tPmwj/vITe7gdeYhYEY9X5hUMk4F8RQ/Hv0XqxijV+c+
         nb6NKK0uARBBlJV1IRx5XEZ8x3KkQqHeyeRmN11znwsMl4mZwxGKDovmKAqV81udKgkq
         VTaAMZFkD/rpE6QxRLyak22lIf8mIBCRZqn4bUBxHJiRW7plr8/Hq7YjCbztGtpv29yI
         C6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744380; x=1762349180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
        b=GIlf/WOxue7UaSeUZQvCkn38AD6FP5f883ure97IAnEsnaqABXi0mnPN9MNv4dy8gi
         VzzeFvWa4cGgqTdm8xhoO5W8BKSRjzgmiaSBmrrcBVUB7PjEN9vu1QsCkkG35V3YatfR
         alZcf0QdcBOCaE3xP1YavgTKLiJ2cM3hBzmQT6ZmAogHF84PYzn3fYFZtpervS8Md91g
         +ITH/C48PHgmmyklFcVqVVsneDw3DhgYLSOa5I1JnNqY1uCPqh41V2pGjGhP1myHUZJl
         7AdNAOAy01Xye2NDssXKZQsjKMM1HXQYvo5YmQue3RuG7rsmh8nIg/T4LfAhzvItlq/5
         6KxA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Bzu7u4QFw7a6Fbi2VJd9jCPaRPcCpoSywToSBU0AMlzYFubkWsL1lFpgO9MYJsRXlk4m2EnrVK/x@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfbJTMa7fG8isdatnX8huGCRcGvoJCWY+zzfcdOshO7RJ/XCy
	L22O7/3cfU9cuW+c6tHgxjA4gzJsf+osjDbGUj5rRGRi/xBk4sQb2s7zHUgDdchpH14SrZMg2Xt
	VZTgSl2u2tXJgahqZq8VcoE+QKbdnmdpHskwc6S4dgA==
X-Gm-Gg: ASbGncuREE7D8u2rROlF8fZvNFcH6RtgBmj+M6upBiQ9yhujm2fyU4kiaP55yxb5dZt
	nM3p7w/GXsnmqUeU/HxEgPbXo7WrU9MgbfrBy+1SUZy8oo0J9TEl90uluyelz9l86jeNIzvV1OD
	LHM6WoKunThQkHL9lWprohCJJZq4Bl5/r4TwHTJwF7yiC6QV1KlNLs3+9GgGv0OoXLM/pOfEUBN
	mAWSO1KW4bg4vtuyHKJ1w7NV3tqc9KLfvS+Uov7DkFkEB9LiEnd0Nc78sip
X-Google-Smtp-Source: AGHT+IFc/hCvDE1Zso/0IxQN+geIgWUqlAHmVbZSzAYj2L1gPzKHQM2rtOb3cVJ3wqFIdmrbO8L60WWStqgI5NAbuCE=
X-Received: by 2002:a2e:9a12:0:b0:36a:f4d3:82e9 with SMTP id
 38308e7fff4ca-37a023ba912mr9579411fa.6.1761744380200; Wed, 29 Oct 2025
 06:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <b13b733e7e0fba05652f49f727412fed9e0ceb02.1761564043.git.mazziesaccount@gmail.com>
 <20251029-adamant-mamba-of-patience-cddb65@kuoka> <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
In-Reply-To: <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 14:26:08 +0100
X-Gm-Features: AWmQ_bkO8UFcogwNBcRXNNMdmHiXiiZyPgTHaU5THyaD5CILTj16yxOphtBr7r4
Message-ID: <CACRpkdZcszMZEU2Wzx8kaoR46ytziqtedmCrsjEL3QOrDtDgzg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: Add trickle-charge upper limit
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:22=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> > But I believe this is wrong. Trickle charging does not switch to
> > anything more, there is no fast charging after trickle. You have some
> > sort of pre-pre-charging, which is just pre-charging.
>
> There is trickle, pre and fast-charge phases. Furthermore, the
> fast-charge is further divided to CC and CV. Finally, if my memory
> serves me well, Linus W did explain me that some chargers use
> 'trickle-charging' as a _last_ charging phase for a full battery. Thus
> the term 'trickle-charging' is slightly confusing - but it is already
> used by the existing bindings...
>
> https://lore.kernel.org/all/20211116001755.2132036-1-linus.walleij@linaro=
.org/

I think we need to refer to a textbook or IEEE articles to get this
terminology right.

As you say it appears "trickle-charging" is ambiguous.

Maybe what Krzysztof suggest to use: "pre-pre-charging" or
"empty-battery-charging" or something like this is needed.

But we really need a trustworthy academic source here.

Yours,
Linus Walleij

