Return-Path: <linux-gpio+bounces-6532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A095F8CB2EF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 19:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF651B21EDB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 17:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1411487C0;
	Tue, 21 May 2024 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kkn1iZbC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2CD299;
	Tue, 21 May 2024 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716312898; cv=none; b=Pw++Zb0/+FmeATbkY+xxqu6c8M62JkB1iUzp+EiKiVfQEPNJOORAYW6Sy8cqJsPqXZd9MSJRawYm1v1XM9kYV+TNmsdB5+gIFvx1bvzZdNAHA5Pg9vliCc7tgxB8igcbiBo/QzJQ+GjwKsTnCzk+nK62SxduId3IvrF2nuPYb6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716312898; c=relaxed/simple;
	bh=IAJsd/t9BtR5Pd/tCIc8qFxrgoJuJLNNL3KpktuZ0PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgplSexKdjvrfkE5ROpsyc6kmsBg7yWgp+aGu/IWOdH8quyK24E5vs7JTbrbhyBmoIUN+4gY1mMbTCdSGR9G+CcaBkJCEkPviqvSvAQNEO+C34AhQ3VRIHaI3XST0ItmX/pjRheaDjRutHZ/9gAUAoX1S7RJ4lbqX1gZO14JI54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kkn1iZbC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a620a28e95cso179627166b.3;
        Tue, 21 May 2024 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716312895; x=1716917695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XcJlx6A0mnMVCBbpQkKvueJzw8KzuVw94CspFbSlgQ=;
        b=Kkn1iZbCp0/xnhHTUmbLBnbM8RHHywwbx1wuV3rJh6R/rp7VMpMaFKu8W5hHIzWT9w
         wefFpytLjbzhG5EWJ40WgyT0smM1X7RWx5cVD5xv06FrulXc1LkQaO8XCPUZBh1kie1v
         6q7cfyh7HybMqc0eSUAUWwhHMaQQRywjv0u/C93HiMUwLcbBch0rRHE43Pb9HGCqKV7d
         6VHLfcS+G7HwG70Sar0DmKq8P9Ve+w2wcrl/5Lfh/x2PFLLNvBbLTZ6PF1jrGDD4HNUP
         Iomu7cVBAN6SHKeT5zwlRAvP06Ec92KAL7yrRw60ZXb4geSsVVty8GMsQoJ94Dbs1KDd
         ybdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312895; x=1716917695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XcJlx6A0mnMVCBbpQkKvueJzw8KzuVw94CspFbSlgQ=;
        b=MlCW/aUmMdA/W7GU1kNjGMsbZX+F3Kf53GriYwJTP0famwPQSRO9NqvX/nu9t5AA4V
         7Gu5RfhCj2l8ldWE2fhV4sX8zYcXpJib7gR1ICMU8AM5FNiv/3ywm2CZa7S/ChoOVrtE
         1JZIloBbpZkVJmKXIlZIpmGEZ5HdOjA6uvWnd7RINp942cc0Wk3d2K1ycr7QhSiXJOPy
         wLraXs8osCDAqJ+DtPBbfFjyVKqiZtVNidgReev3cR6UqzXnaCkrO6f92wy6Y5zKBTFy
         2UpO3a46aLsnA6fxwoXIqdRzp8sQ8aSVj3lRjsLx7n6X18FdDQVo2ZVZbcZhqc/CHkQ8
         Juwg==
X-Forwarded-Encrypted: i=1; AJvYcCVMY2ZAjax22QPGeEjIvGvCKTypuWNri18tvp4gezZ1GkjOrPKxrGu8axxzqvFK8J65hlCOW3GIklZ8BnIO5RvwMgYVwc/L982Cy4cQN5OgZM+u0W60PWa8JnYY4LWOZakDYLc0OCe6kw==
X-Gm-Message-State: AOJu0YwuC5BrEl9/dECo9w0diZCO20h7Iu8PtAJPygTQYKcXcyVbyI1A
	AWmAlPBQpkFGPX5tDXwnuKSUS9EmXffyOqsQfCUtteg5FoncbwNmZyOAaGjm0JyHADgK94eumHL
	FgPknaLbZqDGvdPPEud1gXUSXroo=
X-Google-Smtp-Source: AGHT+IF8kwBtBBnwztGRDoOZ+EocemWgZLSsAMi8KtHCKUp7VsGYkd2xGSLERItgfqTP9MGs05mEoHFuGM88qkVzGEk=
X-Received: by 2002:a17:906:c40a:b0:a59:d133:87db with SMTP id
 a640c23a62f3a-a5a2d5f1918mr2245355266b.42.1716312894867; Tue, 21 May 2024
 10:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com> <20240521152602.1097764-2-patrick.rudolph@9elements.com>
In-Reply-To: <20240521152602.1097764-2-patrick.rudolph@9elements.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 May 2024 20:34:18 +0300
Message-ID: <CAHp75VcYZCr=N_3YNe4kO1Vm95mJcxV4dKkBEz-NqXzumzXa1w@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: cy8c95x0: Use regmap ranges
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 6:26=E2=80=AFPM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> Instead of implementing a custom register paging mechanism in
> the driver use the existing regmap ranges feature.

driver, use

...


> +static const struct regmap_range_cfg cy8c95x0_ranges[] =3D {
> +       {
> +               .range_min =3D CY8C95X0_VIRTUAL,
> +               .range_max =3D 0,         /* Updated at runtime */

This and similar comments are misleading since the data is defined as
const. Updated --> Filled or alike here and elsewhere.

> +               .selector_reg =3D CY8C95X0_PORTSEL,
> +               .selector_mask =3D 0x07,
> +               .selector_shift =3D 0x0,
> +               .window_start =3D CY8C95X0_INTMASK,
> +               .window_len =3D MUXED_STRIDE,
> +       }
>  };

...

> +                       regcache_cache_only(chip->regmap, true);
> +                       regmap_update_bits(chip->regmap, off, mask & val,=
 0);
> +                       regcache_cache_only(chip->regmap, false);

A side note: It's strange to see mask & val, 0 in the parameters of
regmap calls. Perhaps refactor this (in a separate patch) to use
standard approach?

...

> +       memcpy(&regmap_range_conf, &cy8c95x0_ranges[0], sizeof(regmap_ran=
ge_conf));

       memcpy(&regmap_range_conf, cy8c95x0_ranges, sizeof(regmap_range_conf=
));

...

Note, if you are not using --histogram diff algo, please start using
it from the next version of this series.

P.S. I will test the next version on Intel Galileo Gen1 as currently I
have some issues with the HW I need to fix first.

--=20
With Best Regards,
Andy Shevchenko

