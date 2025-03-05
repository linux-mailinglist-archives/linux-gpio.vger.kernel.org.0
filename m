Return-Path: <linux-gpio+bounces-17096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD0A4F977
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FCBF7A2508
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 09:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C415200BB2;
	Wed,  5 Mar 2025 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EQKe0U8o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D91FCFE6
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165411; cv=none; b=aedjCGH5azINFbpFVhHps4EfZu8XTAFBDIzScAfOCl4XQsnj+tQr0+v2UTfrYkG+s1//VhAdU+w3CcoY/IpQVXgjdZ9KdXI1Zn2ngyqMGjweqcsiEzSggXEFWIPbfxRLFLAdFh6p5z4ONfue1TOmBciLZ2swxuUU/iSIYZvP48A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165411; c=relaxed/simple;
	bh=7NhqI9lGNIqSxdC22MyT4KoI884po5Yb8rAI8h1IFoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUCJ85EB6oPDxu1q1nv8z9Moe35ViCrfKjjt+lxeWj2M1SHbiQf7YladQq9foTnZC6qvChWiyRNVjBAa9a8yW3bpw1IUI2aH+mlQOX+jtJVeWq8KqYQ/Mlu1/f85b4UH4qn7PaOEqp3hIj6I3LxpeAebyE817dagQg8LzmAgP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EQKe0U8o; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30795988ebeso70365141fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 01:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741165408; x=1741770208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NhqI9lGNIqSxdC22MyT4KoI884po5Yb8rAI8h1IFoU=;
        b=EQKe0U8oC9OSUK3s7+/kpXR02sf5aJyCgNxe+M650bYO3M3vWyZT1S8SY8yN9btF0D
         UdCjq0oZRwuZfrKzqxqccMU22T5T3ZzffDcVcCt5WjhYWUOAtpabZh6r72JZUVsYvcYJ
         JypOS7uROCVEXG+4DH6BWb+AShcP7A+UzdpyIN4TjJPhL7lfkH/5Zov9T1WBM4COVh2a
         RAVJ2rmDv6criTJRMuwC8Gs0AbXUlo0t5oZ1a5Kw9CNJewC1llIGOkpAgOpLkDvTe3qx
         mDg6y6MLfi0R7W9fOEPUhTdeQkcdF5KugUV3IbB/XayUqkTIl3utQ6v/DlWggrimWOnX
         a5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165408; x=1741770208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NhqI9lGNIqSxdC22MyT4KoI884po5Yb8rAI8h1IFoU=;
        b=lRQ/6SsVeZN/qMEWFv/c1qgpkLCj9Cn1X9vQwblPW7DO4W5nYCjifuMoI93DwLyBmh
         tb/6uJzXnmX90oNFaRxYQPyuCPrK1rTykPlBSvVxC6GACNBR1VLTOvILQ6vGVT3jYg7l
         BbB6zTzvbqw/MhcnEJTDKRHvULHabNAUZvXS++xVO1pW9xBihWPDVq8oEYhQnO5p+6nS
         962FfKiaep4i554DtSlwVjiHsVLxF2l9AOtxofa8N4X+T88X/T47mEqibQWy933Huk31
         ps8RaOvLiXW0KvQfSW1kiO27LMgy8ymOvNIAMi0PwN2xioBBKSW990K8MDFMi+cvZvaZ
         mgrg==
X-Forwarded-Encrypted: i=1; AJvYcCW7kdNqgzA/xqliC8a0Q+bgHVAXiRYBVLhJHynthxBqtwVME0NlTnKdg1i0g8PlrxTHJaarVKC37/Vo@vger.kernel.org
X-Gm-Message-State: AOJu0YxZm57dTDobX8w72g9mgXzU4YgPuL8roAhdZHFb6aK2kY3cnEG/
	ir47rbmjgX2ZoIxHiiKHHMyowXJXDU8uR8z4fyH63CmGko5CAF08u57zNHTolID4GjAvjLjcM/f
	ZDhsgk0sY4p2u+vEH5eOYguJ2+dKnP9iBBC6rFzRKxOBWIZqq
X-Gm-Gg: ASbGncvrRwggtdOEIs3nePJLY5etVba8pSxGEsKLke5C7wrxtPV5fDv+eDTL/R91Ok+
	vksX9UAQbiIAXYCD0XiQptdanMsX18nb5ihsJkDI3f96BMvbwRorC8aW5ArFOVpZWtDC6QQ8PKX
	HxOlp1u5iS4Sp2if9e1zfiKehXZ4Xl4EiJeM0ap4IP95x8djBNbRsQ7FqBfQ==
X-Google-Smtp-Source: AGHT+IGtKQFE335JDPG6d6Z1V1/AplpRf7+VD0Zwuc/rOtofQzr73uEh8//00NYOIl6ej7Cs5yeJZAz63gWah/VB7ss=
X-Received: by 2002:a2e:bc29:0:b0:30b:a20f:7c00 with SMTP id
 38308e7fff4ca-30bd7a19bc2mr7662821fa.2.1741165407068; Wed, 05 Mar 2025
 01:03:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740745270.git.mazziesaccount@gmail.com>
In-Reply-To: <cover.1740745270.git.mazziesaccount@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Mar 2025 10:03:15 +0100
X-Gm-Features: AQ5f1JolmXkhJ83vk9N4Gquh-FRFIuW9htgGD8C9kAbfVstompORypD-6XB-j2A
Message-ID: <CAMRc=McQ=92xdn5_J_CdCW0JNyY_wiqSNGh26F6UCoA-wEQ_7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: Hide and obey valid_mask
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:35=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> GPIO controllers may have some pins which can be excluded from the GPIO
> usage on certain hardware configurations. The valid_mask member of the
> struct gpio_chip has been used to denote usable pins if some pins should
> be excluded.
>
> The GPIO request should fail for GPIOs which are masked. Under certain
> conditions this was only done when GPIO chip provided the 'request'
> callback. We fix this to be always done.
>
> The valid_mask member of the gpio_chip should no longer be directly
> populated by the drivers but GPIO core does this (unconditionally,
> overwriting any mask set directly by the drivers). Drivers are intended
> to populate the valid_mask using the init_valid_mask -callback.
>
> This series enforces using the init_valid_mask by hiding the valid_mask
> in structure which is internal to the GPIO core. A single in-tree driver
> was found to access the valid_mask directly. This series also removes
> those direct accesses as has been discussed [1]. Additionally, we
> introduce a getter-function which can be used to obtain the valid_mask.
>
> [1]: https://lore.kernel.org/all/TY3PR01MB11346EC54C8672C4D28F931F686CC2@=
TY3PR01MB11346.jpnprd01.prod.outlook.com/
>

Hey! This no longer applies to my gpio/for-next branch, would you mind
rebasing and resending?

Bart

