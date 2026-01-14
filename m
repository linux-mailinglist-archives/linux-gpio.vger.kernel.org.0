Return-Path: <linux-gpio+bounces-30544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A263CD1E2FB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D4923053297
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7E7393DD9;
	Wed, 14 Jan 2026 10:40:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D038BDD4
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387259; cv=none; b=YuFn9/wh98uxOjZL6ok+jFbpbHw5Hb3i7POcmKgmhKmwJvTqhUQ/uSz7suwvCRHvadY5xT/JmicTddwL+vMtto3KtCZxXWLMj3n3lrml1l2sVy1j7CRFXuiqK0fa9lO/cRe1XxQ5RC9TvpcT9bSfkqUjKE57bI/c83fOKqz3Xc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387259; c=relaxed/simple;
	bh=+CpkI+BgHc6zaB6k60VnTXT0jloiPS7gjdxb71LJsAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDL7uA/LyBdpmGreaDxIfbsLIcu223RhhVj8Ku2jb5vjlSNSIoiQzgFVSBrQIr+1J6Bu2PJhGu7dJrLPe1dFIseP1kH9oVLVVQW3g/FeNeCh25KiFu/f8xwfUJnIVyI9DMb8u9N83moFwtTGrpAbO7o2ZC9WRO6Jp//ljDsvrFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5634d866615so4676169e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 02:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387257; x=1768992057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyHAPthnDWEMy7Xz8e1fs/6rcFrRy4CPLB9pLiuxF3I=;
        b=eod11ZR/CgnShnK3D7zzuFjRHUN5X7A5/y2kkthCT388oIFU9Q/tvLoyu/bWDpkTfZ
         AXIsNE5YrYIHwF7BURjqXkLoUE87oadbq/F3opdemYSr5N2vcXh6YCElUwwKC+sPtOPG
         I0IqMa3eG17p4SL649P/psFLHm98on6E7cOfnr7WiFxfitICwKUN/ik4aGj8l3abNlyV
         BxA/ZJ6T8wEFY55k66NxXRS7VuNbCpzkX5l/UlYc9JuTI/Rg7oAd/OEm6s9KmibFc4GQ
         3gN74cRr4XHfwnJTvOibniyKjJjgLUcn00advkRmVvdU/tmF4gUsxA5BwZClQyoPm5Gl
         Kn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJqCWe00xokSLCMy25mWWzOzLq3WtE44OCmV08XbX9Pn6Tb8JllkJ08aN1R5o8qUKjc489yrbviBuA@vger.kernel.org
X-Gm-Message-State: AOJu0YxY98jYxVLwWBEcBiM/NFXxBjDJByEv7fDJn+HGxEY3wKQF5sEr
	/41SIq7Za7p30oxbugwrGoYJ3u5v7fPqubeRmQtG+TDQ16V8EPEkxdmdhKwHEArS
X-Gm-Gg: AY/fxX7558qlQpUpZ9nqlWOKB7xsR8eAV0fhEHM3/iqlh/uUz9jspXJrCrJWS6IZSLr
	W6GsGV2J9Ez7C8GOUg4OqkxBO+ZZY5RAg4DzaqPkl7RdDjhaP66U1YRnzG1puylQrjb00Zq50Ej
	1sygAbHpXKn1OGieuN0dKkOlugVmwJ3wkZoZJnJrJj8mlqdtK8LP8vWEWGoBEQvfJOvr6ZfDzLs
	9AAKoLzusIVSrPR24w2fYJdNexHL2F/dnYjyK6YnEipXxHAmMAox9dmL92ZQ8y//fplj+24iR4y
	urn9A5p+rmI47i1WBoP1OB0/IRUx16kx8TOCZrucQkVN0YHjPCz2SXUUWJ5sTq466G0ocyY2PaI
	0y7nwXNIdTp9PdZyzUPC2uRz/IQBnOMiAy3uKViaG18Nd+UCkDyY03qB9CBs43oZw/vig3+aitO
	5Hh3aPrJxwxAkN09KgKQhTLi9C/Rjw0b7C8bCIm/IEYw94G0vt
X-Received: by 2002:a05:6102:508c:b0:5de:31b1:1ffe with SMTP id ada2fe7eead31-5f17f644aaamr1034919137.32.1768387257220;
        Wed, 14 Jan 2026 02:40:57 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1578d3887sm7677086137.14.2026.01.14.02.40.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:40:56 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5eb8f9be588so7861320137.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 02:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdAm1+O53pYuDX/B3uiy0Bb5DXoCT4awQATGfa7/Wrc0C/lJi6Dd1n+DGo87Ec/IB0WIeevTa7wJp9@vger.kernel.org
X-Received: by 2002:a05:6102:149c:b0:5ef:a4b0:bdba with SMTP id
 ada2fe7eead31-5f17f4325b5mr758488137.8.1768387256797; Wed, 14 Jan 2026
 02:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com> <20260114093938.1089936-6-herve.codina@bootlin.com>
In-Reply-To: <20260114093938.1089936-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:40:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBD5W8GSvSJt73PXcTD-pbdgR6LvR37ESzEx5s6nrQgw@mail.gmail.com>
X-Gm-Features: AZwV_QjGV8YAOz6mJPMHZ_hZCfKnrX7OINnAGBUggG34taCywTbcQHE61jaJ6l8
Message-ID: <CAMuHMdXBD5W8GSvSJt73PXcTD-pbdgR6LvR37ESzEx5s6nrQgw@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 10:40, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> Add GPIO controllers (Synopsys DesignWare IPs) available in the
> r9a06g032 (RZ/N1D) SoC.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

