Return-Path: <linux-gpio+bounces-10698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C098D590
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3A1288AFF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EE71D079C;
	Wed,  2 Oct 2024 13:31:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16321D0793;
	Wed,  2 Oct 2024 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875891; cv=none; b=BVEiiN7pIlOhIx8n1KVTB6IcRpUGwRmkoZa2mJxwjtHt+C+NgHXddQRyhUYUMcTBwX3yKSQfWMFv+e19F48orNpiQHPzsCaE0LBMvTy6diWaqk5Oxr4Gz1sClDZEL6V+wBCSoHvg+2QnQ0uefBe3Pakpbn+Gk+RXXmSwpz92dtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875891; c=relaxed/simple;
	bh=UJcPIwri5UHuUVhJ0RzYo6U9Fh/gZ9NGKBjQkjYFhNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROeHzpXAMTwVkZzUbrSokDVQ+2UO6vsxHXrLvOnaLBndbsJp1JkNoms6ySfd/K8IbNkZOvtKZoSM4rsoQvXEkcqzCAHTArErj82HVQoAw4JC0w59/vS5Xrcf1oXPQY2hxNjFL4VG6s+qpqEsGqVakSSuYV5S4xZe8u+Jc/hVSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso6198101276.1;
        Wed, 02 Oct 2024 06:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875888; x=1728480688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEbDBoGYWF+M5R/+/AHp1+KeZvpcoEDuvm7DRN/ZBpQ=;
        b=SIgX5DfL4TkzVs8ABDXqQ7PZAxyBB3ahJ6YTqePEwKX4hBWR0Jmp7C0+S22/Nqau5F
         03WjIAArZ+pd+QUobuMEt2QWdtiyMVx1hxdZbmWLnYQ1rNucbF57eYo8NonswM4UJI6T
         xYU0n8/VqfWcOA8Wp2/C0uhNh9RkpnzbELjwRIeER+pr0UiFSUF9sm5Y1Ts9UT0awNpe
         CHOhKZ1v/WjvKEgvywxD7tT6DkswdffPy1htvv+ikLG/85rGMeMCtklBhf1onSpB/UP5
         DJ5sa5Ftr77Yo+FRSGiVECuEh6iMcurhGxu2y2VyILPJhayWFmW+FuJi97noImVQDZKt
         YH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK09yY5RAp/TjICJX0fMuOHx9dhA2YXUhI/2PW0HZFwuB9H8LHxEnCD/1EnhSrLcLFt96nVpsPKde5@vger.kernel.org, AJvYcCXFNxCWHDTRP966vbOO9xu9zYLfXTUPjpJJ67otRfHyYOKPEsSh8cFOr6KM0eUA8ypRAOtZ8TkDFkf0F/nf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe+0mge2yqbzwyfCPoGOYV7E4P0ad4RUONospYnXH4o3ku2YUE
	jjNmelJ+3LnlrRjDT3gxopmst/7PLqtJcAnhwPkJk1XcpryqxFZgL/T2uTOz
X-Google-Smtp-Source: AGHT+IG010ST3/CNyPcPFyV9JHFxFZntcZ7zwnnwLyiiDNQyxvTxBlrwnbRjPNXng4qNI24mn+9DNQ==
X-Received: by 2002:a05:6902:2608:b0:e26:46f:967d with SMTP id 3f1490d57ef6-e26383b1034mr2668422276.23.1727875888352;
        Wed, 02 Oct 2024 06:31:28 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e3efab1dsm3879999276.6.2024.10.02.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 06:31:27 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e214c3d045so50803937b3.0;
        Wed, 02 Oct 2024 06:31:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3mQ4sW+LEOJ2Xb2W9jzPCkkrseORWwwLxEopKlTVEFoI+d42XGDVxGguy4EBE7utv7tAame7bwTl1@vger.kernel.org, AJvYcCVCOH0TjLe9clm3kKcNyVbxtHYLQWSBX0Ns/jkYLIBNqQA0ODPjKixduC1i3ok3kNseaFtwk2HKqyV8LvGJ@vger.kernel.org
X-Received: by 2002:a05:690c:39b:b0:6e2:313a:a01e with SMTP id
 00721157ae682-6e2a2e05203mr33198877b3.32.1727875887742; Wed, 02 Oct 2024
 06:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930163207.80276-1-brgl@bgdev.pl>
In-Reply-To: <20240930163207.80276-1-brgl@bgdev.pl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Oct 2024 15:31:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgoy=q7i2m4HAZFw20R7o25p6Z-PZaOu2xJ_cG+p1y-w@mail.gmail.com>
Message-ID: <CAMuHMdUgoy=q7i2m4HAZFw20R7o25p6Z-PZaOu2xJ_cG+p1y-w@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: simplify aggr_parse() with scoped bitmap
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 6:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The bitmap allocated in aggr_parse() is always freed before the function
> returns so use __free(bitmap) to simplify it and drop the goto label.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

