Return-Path: <linux-gpio+bounces-25295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D019FB3DC60
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E4C16DA55
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037E82FA0DD;
	Mon,  1 Sep 2025 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTMtHvp5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18182F6181
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715482; cv=none; b=gI6/0HDzAAMyo+8xOkfi+4glBwQDsje5dzjSpYwWVoxhyzHXScPA3TsrPR5D+N/fdrKDujdpJf6XPDiEClQ/YCsWwcREdCChXbxxd/O7TkRWDvZrICN9c1D/GcD/aLB8cKrIppvbhl4zKRUMO2KITpxSEU0J34m4zzoOyBiEZPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715482; c=relaxed/simple;
	bh=QPt66DDRCZrwGE3OLt9r6bRhgkx900DOxgcmH6PwUf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIlIFF9E78J34eAfDtLT3c8/WaK2aM8T52ORQYvvi75p/8Tm2uoPpFg85gCr/1Ux9KygOMFlbnPFfdl676z+Ns8/u3wtOD3mWl91vqXeMU2OxUQCgwSzJou4TUxO7h4fuqnGUgb7yGkPSf6x7Y01bmjaCfLxmk0wc+2p8nXa5GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTMtHvp5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5607a240c75so439486e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756715476; x=1757320276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPt66DDRCZrwGE3OLt9r6bRhgkx900DOxgcmH6PwUf4=;
        b=GTMtHvp55i13B+etKZsbxyfW6E5dk/LV6ZgFjbnzAjHjEuJrdIyclw0qL57x7pd04s
         og/TOIzO0owkuPO/a9Hk7ZxRpF2j+weB+EZf+CsFFX6P4oeKhdwSNc3XtjzM7vIGO5hx
         3pc+ryrHD2kYjGARuaesSnZ0ONzePStFqUzUcRWCBo+ckUAWuRie0Mb+fIp8uljqJOK7
         /B3mNdYjGBcfHXn+sco261DygUbTDIo9mZdAArWvA3iq7W2I5VW1cmVXNZiW3PXBr8ja
         ZYWxgPDgIIYG735IWedzpRmoNM3tT1h3Kn1Rr2P+/gq1/aX38W3yeR+QazFfzQR9hLr+
         0XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715476; x=1757320276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPt66DDRCZrwGE3OLt9r6bRhgkx900DOxgcmH6PwUf4=;
        b=D5Vz8T4WvasVVexiz1x7qjvflXUnd96hXdRt5pRjJor+wJRh0nWbigWBNPAByQA73c
         fCFfMJFLdjtn4dBEO/86CmOwJnnC0ICpZ1KhcHOyUVacFKlnXNsx0kZv+YL1r5jF4Z8o
         JsEG2bQOJUPGFJZYvIVcRSJCepq3wMn29uTV9SSo8SgZ97BpJZZ1sdbqK4Se9WlIYNLM
         Ty8m7WmYdgV/o6Yg513Yq1PoMKwx75xD1HHe25BYRm9/zmqZTWR2wLS5MP4+v7PWi1xz
         bJdaPh9u4PA7KUEQ2gPXRVe60Tdqf7IqklKOOyM070LKB5z9ag98GD0Qs9+siBIfVIwP
         y6lA==
X-Forwarded-Encrypted: i=1; AJvYcCVF6dIiOYxbqEoehgW3pRykSyN+T973epoLr7qoqGwlu53lUluA/xJeFsUifY+qtePsCYqlmqxV+Aj6@vger.kernel.org
X-Gm-Message-State: AOJu0YwvInXlamCDjILzWbiP/lLPhdw6HOloLx6NCMgEln6TZ5mikcKQ
	rgvmOl59WCGjAT6rsJ8Ox/TgwKs/BkUCq2hPpYk47DiSbUwZrUH1OgDfd5otcl1E4EjzKpmZ64T
	zMZJttd5UA/ILwJ0X8SmBtkT1OxfyXYzqGEDfx9RvyA==
X-Gm-Gg: ASbGncvfGlc4iXkCuL2o1yxpmOhEfVB+S2xKLuRkRDBxQjkjxf4qHKhTV/YN0HGzbt3
	BpvXSxo9wwfFankoCnlpCHRrs+Lw/s5PNJb2nlCJMGXebOifhBh3E37oZvt+eb7eqd2o6B7jCvc
	kr12NUopl3z7rtDpahb3x+bXsVp6IZW55TjrOYyGs2J4RI+qFEOXdpMgg5DSRrTSpR2dn/dN3u8
	CxvbwT9XgGYbeNwRA==
X-Google-Smtp-Source: AGHT+IFjIM62b+Dh591DDQeikYoO0Bq5o+1crRy46saHdttAn7TZIuFwI7LaPkugtAriquF8Dprb2fu78RsgWNwB+M0=
X-Received: by 2002:a05:6512:3b8e:b0:55f:435e:36bd with SMTP id
 2adb3069b0e04-55f70567d11mr1985011e87.0.1756715476375; Mon, 01 Sep 2025
 01:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org> <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
In-Reply-To: <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 10:31:04 +0200
X-Gm-Features: Ac12FXz3bfOtDDl17XLoOiVe4AoZ6uU4YLHPuJBLjzKvzkaSyj8p2a8ItuvhVxc
Message-ID: <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Andrea della Porta <andrea.porta@suse.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Note mainly for Linus and Bart:
> I agree with the patches 1..11, but starting from 12 needs more
> discussion. That said, I hope Linus can apply the first 11 ones to
> make it easier to continue with the rest.

I applied patches 1 thru 11 so we get some traction.

Patch 12 would be nice to have finished soon because it is now
a prerequisite for the STB pin controller which Andrea is working
on.

If it's not serious semantic problems I would like us to fix up any snags
in-tree so we don't drag this out.

Yours,
Linus Walleij

