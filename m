Return-Path: <linux-gpio+bounces-3492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BAD85B978
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 11:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B321F236C8
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 10:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C701363CAC;
	Tue, 20 Feb 2024 10:47:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406C55E76;
	Tue, 20 Feb 2024 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708426061; cv=none; b=qh+nU+vJt24dbjX6l3eaK+dm0drt9I4IcBEZk9jV0CUdoYVKetE4eR9pcfE5LCb0nd5tnBGcOPc61mNuicQrRy2dFOyDgzOaTotSxekuezWje90F9hifH5mYQqe8BDqrXd/33KzNITyo0JOa02nhkSsP/Lvq3WyzhdTPKJTyc58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708426061; c=relaxed/simple;
	bh=qeKyOcAB2a7P1dc+ulTKGb+hal0PNglXC6IwaDI7WgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr3yh+lzzx65HvNsBdAr2XDDw1HN2hd1tuMFA3WcKa24TN8cCLYg76YRCYxA2SnhPiJLIMlcn3+IGlvbW6Bq4Yy6iMvqHpnZ3xr/BBsEgUQrTv4UqaXyUAU78YmCPylerp7FLbnf/w8rtqF2q6XN0sD24H2jaX1rkJGUE2zCu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso4016651276.0;
        Tue, 20 Feb 2024 02:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708426058; x=1709030858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2F11qoeMVZ6lOGaCvnmObEimhhy0mHqE7z15UHEfzZI=;
        b=STL2ZU951biAn26LWcIrLTrdlXGRNMMV81S950Zn4EAT1cTZ0QFo7KKGnOMdlJWlmm
         z7GRxENklDvdv5EsL+bz2pl/zwMI6yWGzP0R0aN9DX+b3lbKKZ3KpvRc2IptZNGbjEUt
         ITaMaSWxA0rdRxxnzJCMuRjDeGgPI3LicrqYttQmKK6yrgD9ZNn0mxQSBCgUmpXUgcnE
         E0KdY+J9mF2yiBm1ISHvnSc767dfDnj/OZic3R0oPvZZziS9MmOPR5Cyf7VW2PvDnN5E
         f+3FVO9cVL8QayWrZPtXYy8Bbg6r/2G9wipoeAMXo3hsvwQLAwdALG3GlbnTgRjj7IQ9
         0Bww==
X-Forwarded-Encrypted: i=1; AJvYcCU+teE5X4fsrAFYqdCQTbPbtpx+6dI4AusLcOrS8VJu+QH19B9zmtUdGG/kjWLFmynx3PszmAhsCxRdFqzsPsu6Xc6BotvYGuLHmCpl0uEesQxSzM8qSaHMZPhJIgfuLYGWFQx83v/Vr1/ceol2jZEOQArJvy/JpbbIgGR850XfSuVGUtq5W6IcWw==
X-Gm-Message-State: AOJu0YxaYKsOsMjFoUaxtzmDxGzGieGZk5bX/3vUcEGm9DuA2N3hH3Jf
	qoVa8qOQyXyrbZPqfoOvkZnApy+EwB5pxzHtGWBreC6S3TNFNrtZCkxs8fve9IA=
X-Google-Smtp-Source: AGHT+IEAfd/cZv2gOZIcaN13tdd4F0BmfcMqFL/dO5HkU+YnDgoGKlocZ7ny+XKgjXP45igSQYdg7g==
X-Received: by 2002:a05:690c:4448:b0:608:bcb:b43a with SMTP id gq8-20020a05690c444800b006080bcbb43amr10583870ywb.8.1708426058609;
        Tue, 20 Feb 2024 02:47:38 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id u128-20020a818486000000b0060853d574aasm485998ywf.84.2024.02.20.02.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:47:38 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3294278276.1;
        Tue, 20 Feb 2024 02:47:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOEHg7wauNxUHbP3yi5/drKDyiCk5WpdU5ksMs6t/1JqQmZTuZyuMAPASvK+8iw2MJMokXS8e0VYTZdJgPNI67qawCqozyWELFyqRzq/zqU9rNF+exOOLPYXJxEKhLKpr4cCuHLw7MQmLb9wEAH2nP41x12PpnMXPP2NADTj6P5HLwlOiohMby/w==
X-Received: by 2002:a05:6902:2412:b0:dc6:d6f6:cc13 with SMTP id
 dr18-20020a056902241200b00dc6d6f6cc13mr15681921ybb.20.1708426058329; Tue, 20
 Feb 2024 02:47:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1706264667.git.geert+renesas@glider.be>
In-Reply-To: <cover.1706264667.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 11:47:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_nqywH5LiTYeXQz+2PCKY1gEZpyYFat7yuQ4WuF90UA@mail.gmail.com>
Message-ID: <CAMuHMdU_nqywH5LiTYeXQz+2PCKY1gEZpyYFat7yuQ4WuF90UA@mail.gmail.com>
Subject: Re: [PATCH 00/14] pinctrl: renesas: Add support for R-Car V4M
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 11:57=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series adds pin control support for the R-Car V4M (R8A779H0)
> SoC.
>
> Some, but not all, of this has been tested on the Gray Hawk Single
> development board.

Thanks, queuing in renesas-pinctrl for v6.9.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

