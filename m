Return-Path: <linux-gpio+bounces-5583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549E8A7CB7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 09:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6CB8282153
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 07:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7D26A343;
	Wed, 17 Apr 2024 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzL6LIOH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2794369E07
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713337475; cv=none; b=N5QNDrBarckAM7FqDebeH9R6FlrJeRPM0UqDNZg5hHW5IrAgyzCHOZJPyYgL6dBuL//f1tW/LQ7MrrJK7ZjipjheVVStdQLLLjUJMZKQzfVyW9LJFNxxUi6JPWSnDFkpZ6dcRdjq8BzOO89AsHc9l4kPhgn68qMbDI38/ABTHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713337475; c=relaxed/simple;
	bh=wLz8abfq3kVlKeTtyEzkglVJzpgzgi5Y0+XvQGzUkPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIk7da9qJgam21XfJ6gFT9Jz2gjvt9sDxqmdS+LKlb89S39/zEAgNeOYT549obPLTrS6y/emyVO5vahWclCrZ5jsRBLK39DopREqImcKtKGUDpjePhTJRiZpHFAzmZL80dTNb+adsaNQhYQ1elINHD09yCQ/bHu5+vKNJobsn94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzL6LIOH; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so5260574276.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 00:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713337472; x=1713942272; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xMFdAdNWn9QA3B40ntn3UH6P170zQmFmd9udvg/kij0=;
        b=bzL6LIOH/ticvMVaK/hybQD9ZvffHtbd1kYjOgf5AwWEq5tKzvWnGLHKAkWSySIDvC
         Yxc0kdvoS/DHdnjud0lJcB9P0QYqxC88pV/D/g/dxra6izLSpjySapEUqi4sVq5Hkwxb
         QgSjop2aKRzcuMuGLDooimPybVa4gwo5ONgaAowWJGbGhMlmZdh6jUz1dgiD9hOumnJp
         FJGzebq442y72GYVKZJUIiB7wPG2RPEpknB7U+bP/f2rWA2EIDPgqzZFKdLgt+LkeXgd
         ruDgAgZs3YRukwbFQ2WvYoYpaYr9561bQljQoR3wOrNKNCtdhzjOIN3nwfnl5vWlnCGH
         NaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713337472; x=1713942272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMFdAdNWn9QA3B40ntn3UH6P170zQmFmd9udvg/kij0=;
        b=s5J50swTZSOhgMPTRKi8lp5ns/xGGKOZs0A2uJp8NbCnJ5rumZPFH49tQn6/vQ5syI
         DBGffmd6nCVNe5ScEGnwAY6iJkRMP7OMSWu38Gu6/ekSsKb3+ETUSm9POpdbFwPqNsU1
         mOR+JhEcjN+Gd9T3VXhXjOMkVNmDXeN1K6dqRz1v/M1bQEJ+I0e8u3c7Xx+Es5Diwvbc
         u3qUhSL/ibPq0gBmo0rj28+Lmi8aOCCXVscsBj50pN2N1lkH05Z/wmCxkwHVlcRdDTVV
         kWJftS4Fon8MKFIpkKZ1kXjDhH84GwRlcQKJ/5AfR02hts7Iz4LIAr8BjZrnv6pqqNWA
         Tlmg==
X-Forwarded-Encrypted: i=1; AJvYcCXRZms0CMMD2ZAAagnPBBPRaMmqb/NiaJQRI6TgVcqyU/6zI4AVxdM0pR44bLqsfGfZ0w0vlBiAvFY3YrnbpS8p6clrZc7CteTGBA==
X-Gm-Message-State: AOJu0YyULn0OfqywrX4GjAZ2xuIs0nhjA4SSQPI0ivtZGVOwsgYk/cNF
	xk4Z57bvljOr0/kin8RNC/6p1NJtlSpjCaF/F/SvEhPEJ8pZZ0x5GhREq4iXZYWoHW1TbCJ8GWN
	85IriNRnDONr6LYYkVWRCmlRiBGjp4XJxDJZI7Q==
X-Google-Smtp-Source: AGHT+IGgMo3eDQxlf11bJcRNOlltLMZRzS9QWPPxupZEHndTAtFDw9DLGVw5mr9dLI78B9QKduCiAvMxBX9xGcuKHcw=
X-Received: by 2002:a25:abed:0:b0:dcd:a28e:e5e0 with SMTP id
 v100-20020a25abed000000b00dcda28ee5e0mr12063316ybi.25.1713337472251; Wed, 17
 Apr 2024 00:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415141814.1983384-1-github.com@herrie.org>
In-Reply-To: <20240415141814.1983384-1-github.com@herrie.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 10:04:21 +0300
Message-ID: <CAA8EJpo6oUi5PXO31j0ZL8DfqiTNLVR-VZ9wVrKxOYxS5UwdLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom-ssbi: add support for PM8901
To: Herman van Hazendonk <github.com@herrie.org>
Cc: andersson@kernel.org, benwolsieffer@gmail.com, chris.chapuis@gmail.com, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 17:18, Herman van Hazendonk
<github.com@herrie.org> wrote:
>
> The PM8901 is used alongside the APQ8060/MSM8660 on the APQ8060 Dragonboard
> and HP TouchPad. It works the same as all others, so just add the
> compatible string for this variant.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

