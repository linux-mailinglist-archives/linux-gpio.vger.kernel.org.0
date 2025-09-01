Return-Path: <linux-gpio+bounces-25337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0FB3EE68
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 21:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D6DC1896CCD
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 19:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448F632A823;
	Mon,  1 Sep 2025 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t900PpJz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F191E5213
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 19:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756754558; cv=none; b=jJaYPunysruYNIGEoJDPsy2mAFsv52GaDVPup2x00cTQfl+hYH/ds4zEXSM/z0ef+vBztXhDLJ/RxkyZFeKqViYUIkuYul2XwmuO4Jjfx2EoP9peVm3IYXqcUlf+2ztma1qmkdbS6HB5g11QtBhBGRFyGftaTOezS8Z6PJN1VwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756754558; c=relaxed/simple;
	bh=bEgP0yvmX9KvAOyKB8kFlw77eqxGqe3qY7fzx2tEl08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxBUSkclh65wnrA++W2TS2RV516z6p7pW+mmk+45KsBSMLDncMtjM2wtHT8IDeZCgk/GB7oJqAX58cXCGR1xjFBRcNH5ugSaW38gkaMz9FM0aOV7Amm0RTKzJ9/BPqhK5MMxnMmTF7cDo8YwjFX2+VQX56jnrL7HAD/qgI+sANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t900PpJz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f78f32580so1135082e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756754554; x=1757359354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=t900PpJzwxzqo3Y1GxMEGOx/cIe6LnRWPfzvbNBzJxqMURjGzVgSFAzYzWdMr16D6U
         7W1w7wZZ0HJMoXPz7GyCCq/BsiYBWRPDcW5htfmxqYhnN8F6mlZGM+gEK1EdJOlHaYrJ
         WKsNWBvJa6cSDSWG5CJEPYfjCdeMTcxE8h6u8zH1OFaPbiqdpDWntKrdNsePjKoODtIN
         i7EjbzVPr6zp+ZOKNAovXYeyJnDfUoATQx54RbmBAOEuC4eAHvTFTxXZfPHolWh5NQFL
         8Sf+gNRnIGv0aTxL4C6dmSroWmqXlYsIh7L7kcBhqrOzxxF+2OV0DrALd7xXf64j3fDu
         MdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756754554; x=1757359354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=jsnv7Q4hpHy5L+tz3He3PmWLEIXxT96uT2h9m4kq0XNoQr0MdRAqvXP4va7ynblSiO
         iE6SS6faAr4Do7Ssn5GrokPvWsjf1DxsWuuBlFD3QmMwsah+P9zBMrcuX+z6YEhI/RkY
         bUaDe4gqy98o2ogwMjOOWTua8PGcZCEANsEbtj5wRzflmp7cSveUwX9H6oQhQzylEOOr
         5ANNEKoaDB2N1xFSbfK/cNAaBY8O7uO1K/3IArw6qxNNhsx5af9lOwIVO+pXlH/hkQTm
         5cL+I7zBVXw79mcfqEHJ9bJeuplXM92aHuXQ9Tc8xL+qNrDJFpv9kIbf/NtlKJbAraS2
         LVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkW6498xm44DMI+kgw/o6uP4RbKHhRpBaZnTgUxNKNrr+BNfjA95suWnUTLN5zgwjQPyx+crg4hY7l@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHV6I0urvylzGnOuKQw8BeWPwpzmnBXw+U7foCxUcRWvjGX+E
	zf0Egus75WW3cSYF8Nx9t5p9hNImSPAdHaZMJesFvbgELb0jC+oCyUwhmi3IJsyRKJwga7JEvtG
	DgQZLUXrLlVdABpaHoskI81Wl1Y76FqcNfy4aTOu0Rw==
X-Gm-Gg: ASbGncsFB8NpJBffDVqilVtQB5SRrR1IN34UOonFH9yoPlXoTopTWOr187HhHDNqJtO
	khcrbkWTceucKbiAwnFlG52sVTEvL7+qvfLwG1huZc6y33jl9qE7tzkDYnhh0wWQbmDhD3qs5H3
	fJqsMA4097knlpU3/fTda2lqa7fYA8jW3N4XF+hZrbRk19qrO+4/lW7GmbEAnUzhIhBtHrsqipD
	K0OVTbXLXtwkwUJHZ89KclhnzpeTbi6aAZeecH7U+Kh4Ndqzw==
X-Google-Smtp-Source: AGHT+IFcWj/MxjmrVdPmxch8QritOIaLTRMlhZkDbys4s6fntW4mvCl/nwD9FPfF52jhBYUT32dL+MvS1Koz6TeQoRU=
X-Received: by 2002:a05:6512:1051:b0:55f:4f46:9f2a with SMTP id
 2adb3069b0e04-55f708b5e26mr2212325e87.19.1756754554484; Mon, 01 Sep 2025
 12:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
In-Reply-To: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 21:22:23 +0200
X-Gm-Features: Ac12FXzmS2jWw7xFpjYhhy0Ln3t9KFQZe_l3JIooPobPNCmkv86DLX_8q8OSWPk
Message-ID: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
>
> > That's not a lot of info but it fails in strcmp() which - I suppose -
> > is the one in pinmux_func_name_to_selector(). Any chance you could
> > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > Is it NULL for some reason?
>
> [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
>
> https://lava.sirena.org.uk/scheduler/job/1758947#L705

Linus,

FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
be able to debug it and figure it out shortly.

Bart

