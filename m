Return-Path: <linux-gpio+bounces-6572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3EC8CC1EC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 15:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A4B32817BE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF84C13EFE3;
	Wed, 22 May 2024 13:17:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084313E05B;
	Wed, 22 May 2024 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383864; cv=none; b=mtMsgB7ArEEuWdCKi9CLK8L40PLLbJYLWfwkw7Uz9Lun3CNBPIsVuDxeDRdrTSkYd3SXZeYAU0uwG9gQeIALvwbOW8uXdzqO2qs7yQy7riJ+byzQuzgVx2kRBJvYTalB6LKae2FY0RaHJXUvC+SQdShUzdBYmd3VaCnnpsBpC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383864; c=relaxed/simple;
	bh=GAQYHO0lj4u08LVyC67iDqUMXyq/uPxvica3BI5Pvzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iw0kyPfOtd4b04UUzvjNxBHjDOA7p+QYi+PrPmwKQOiuJpOcotacWDp9wJDJQfjr6on/hOOQzyJqAWqlo7IekLPwttMlNL5Uw1WITcZL3bEepO2zC3ERmArH1ALqF8nyVA/VJTOWeW0nb9kHVsZR1wZ6v48T55ZyZyyN/99JfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61bed5ce32fso49923677b3.2;
        Wed, 22 May 2024 06:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383861; x=1716988661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErPNR0jUCafLZc9Zpf3hil3WONpquDa2yqfzYbF0OTM=;
        b=hoFF9o8bjR/9hh5yVE7B80d7aHvSks0NNaWD9b0kunFjUXlhFJIEJe0nCFtex5/cW9
         ysNUggd2spAlisnOy5t6GbJuC7etOe5IofN0skJwPuGsd5Laoy5VsmAuXgbg4J4TLdI0
         snvBBS2W9krBo+D3EUPL38Ohs4OFnXbwWHjgb6Nu6aGwlt/4gi3MouNZejAS+VRhmIkL
         EA5BX9G1ZHPyhDSetxR6Mm/WFux++o6Y9i/AqpWmKYj/pVMPtcSUhXp/y2g7Xnv1jLGP
         blRWZnCIm7VjfG4eioaqm+3Yd3LlfC9O2kLouIFKT3UBVnboc/o9dhs5iA05lxg8iJW3
         IP3g==
X-Forwarded-Encrypted: i=1; AJvYcCXINYOKW58HMOvuIOOrCRPoQZOH3ryrtcOQYAscH5i9e0EMm19Xb4m+eMIy4tiBfwWJdZolNCh/rrZ0D42ZpkwAtoB1qyxoZmkYkTLEAuMLw+KbZyJbqUG+Ls6+wPTOiyshQiiDDvtIEC3z+eNR+XSM1pfrF094rBONUzaHV4R0hCcRSVIyl1v4nZSMvpx/bsbwo7EUK10qlrnUiYd6MgKiQe0AwCMsjQ==
X-Gm-Message-State: AOJu0YwSAfVUwIdjvZx7c/7/G/ioglqus8Hw/c2sCDWCC/lj0UBa77g5
	XuyuOq4f4UAvHqrjDAGIxK0azE1s4aS8VzGKwm3Sde7GV17Xbh2l9YtFwe0D
X-Google-Smtp-Source: AGHT+IHd5Z95rBDk2zh/TUL4ImGYnFT+/HcVjLVCiV8fS7ER0CsDEfgzmuTIgtievA7LNlvCKQtTjw==
X-Received: by 2002:a0d:ebc9:0:b0:61b:349c:817 with SMTP id 00721157ae682-627e46c9e15mr20732417b3.12.1716383861282;
        Wed, 22 May 2024 06:17:41 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e26e94dsm57949757b3.69.2024.05.22.06.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:17:40 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df4eb08fd9eso368672276.2;
        Wed, 22 May 2024 06:17:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8t5wsKP1K3etitmPLgNn/ipboL6ht/8KuCYbsHgn2ZFzfNUMNoG3rLMFoB8T6W1bwEfHRZPV6lPQWjmu94NNSuoVzcaQxolXtvOYzXEfrwNqFsTaY+QCtQx4csgG6N8qcRfjBclDenFDjhK1tNi1Cs0mXQ7Q9dZofnsX5vfVgWp6HmegSNEpt8/Y0o2PA90XnClz5zXa9v7pYpDhHqkZesC1ipCEuMg==
X-Received: by 2002:a25:7409:0:b0:df4:c510:a072 with SMTP id
 3f1490d57ef6-df4e0a88497mr2164282276.5.1716383860533; Wed, 22 May 2024
 06:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 15:17:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiKT+2yQKkGHHmT2WdKz0PFfuOnCOgNv8p=gr0qESQKw@mail.gmail.com>
Message-ID: <CAMuHMdXiKT+2yQKkGHHmT2WdKz0PFfuOnCOgNv8p=gr0qESQKw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] pinctrl: renesas: pinctrl-rzg2l: Pass pincontrol
 device pointer to pinconf_generic_parse_dt_config()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Pass pincontrol device pointer to pinconf_generic_parse_dt_config() in
> prepration for passing custom params.

preparation

>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - No change

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

