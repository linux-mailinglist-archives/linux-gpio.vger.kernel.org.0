Return-Path: <linux-gpio+bounces-10846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDF99037C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 15:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EF3B1C2199F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F141C20FAB5;
	Fri,  4 Oct 2024 13:06:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD45479F3;
	Fri,  4 Oct 2024 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728047177; cv=none; b=I5d2EzplgxMelBvsxspctaRUUWoiSWfDENCaqO+VZIrI7kfHv3rW7zN6i7hC+qRwN5dN4XJ1aF0kBrHaOX8OUZHwpNRBvfP02DsYDCa6lz0us6b88ZWPXHN0j9a3NjEkx9piYnyBmAY/ZkiRHX/rqXeG+vDzCh7381vjncy+DWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728047177; c=relaxed/simple;
	bh=2A3yHjQHzQxZp5DtRP6N/mis7I/BXNuXL6OV7WHAdS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=co/3DlkNSpfhBlItsq5uduQCPcHEotNLqd2hUhCUzO1eVIz7qIKoNGwT8CnZg9Wko0P7FIjzHXYgGsSn/kNSuVUzzVrbMsx8EKybCJhhf48pdPRQ/O2V5yGr1nVROfGrFOhdEkK3Xj5aEhc/+SZ+gxCUjS65MCFR7kG7nsYiQpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6db836c6bd7so20094757b3.3;
        Fri, 04 Oct 2024 06:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047174; x=1728651974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VowrLhQP35lJs0XbSijhLp9X88Dd5JScvNJygm1QI9g=;
        b=riYpvMSExa2jOQOOkO7ZB2/FXnkGGt4XF3E/6i+WJPARCJFtxnoFIHKxymEnqkz2Co
         2NP598zTgC+g0B6LptKAwtKiTZpBsSUwC5nKSIOLV4gxVt2HnsEsYhMbjcE0IxvLolkI
         6wh5METnnA2KGrm4asnqPC4QSCkOOlHhb3lJkebBlFHbCoJuUZWgODDANQaoxcqe+ZpP
         Gqf+9v5NirXg2iiWeolAl7t30vj44svaSG842H/JBkNOuxJaLdpaFjkY0wUZk/Y1ciqA
         uysJflRkNdrOY/DnI4jii+u5dNSb7ZxCriTobD8FSnMLqvYIYHHcc3pkssFiabjXhS3m
         Be5A==
X-Forwarded-Encrypted: i=1; AJvYcCUMHDAwpMZAmjm9rixrg5i9OsnQy6fZoQBFEX3TadKrn+txrISqnKZMwvLFZn5ey5gnn0YhJRtdNOA8NA==@vger.kernel.org, AJvYcCV6i3bF3c1kepPHmIEr1NZkcgMF/UE7QZVd36dlJNwzUgZcYJLAIHJq0+luLh59DYTmiVZaekP+vZwh@vger.kernel.org, AJvYcCWhjHqYYQzR8ETQV/exICABqYjpZ3ohBjcaUJT9a38FJ/ZUgBLBeI3iNYhp5Co/fJBNzDP5vcaiHVZyPrFN@vger.kernel.org, AJvYcCXO1vmu3JFE90ZnO/KQg8D549Z01Do1C+uW9/cpmv89IHxAoYk+kJyyY1tYoHpzxjP5EVtawvyIqw22jRZUxbN44ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEK15HuSqHB7I7Hv3PgW2d3XKp7ZQgnh7VtAACob3Tq7eo/K72
	iQWcFRdQOI+hhwJlPevWZ3u99lZxsPXr08W8VUCSlEK39dIZjIhyH8rC9wJE
X-Google-Smtp-Source: AGHT+IGB+anSEbdFh9t/tsbe+S1D2KzfpV6Pn8a9iIvEY243NqEYADeisol8dFSj6MCdviq8Kzlmkg==
X-Received: by 2002:a05:690c:340f:b0:6db:d5dd:af76 with SMTP id 00721157ae682-6e2c7284226mr21904297b3.32.1728047173618;
        Fri, 04 Oct 2024 06:06:13 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbea21easm6350227b3.41.2024.10.04.06.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:06:13 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6db836c6bd7so20094627b3.3;
        Fri, 04 Oct 2024 06:06:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4geQHc3MCoThz4tQZ68lgCe0JMirWXjCGdu75xEsMeUNm4cI3WkQOCi9wZsTpEhpdVqdjcZpgeuO7@vger.kernel.org, AJvYcCWET2Iors6ajnAfniWa9TF+EuKcgcUwHIxSUVoVmqy2XyHK16ppeAdeNr52G7ZaQh5PXK7KUAYPi6B/2CC+@vger.kernel.org, AJvYcCWeTCTRhiBTOssOZZzJ8Ppi3Duz5XaO+HCOuA4cS7StYtwGIw8+oNhG5ugOrXkirylT24r4stGiUN3tfA==@vger.kernel.org, AJvYcCWs7lQautRDTx0YFjQl4noeH42mnjNsKZPAKal+P+UZSJXJj5cGHGV1n520ac3f7/GZCPtAJrIH8lKedTzkzOIl0P4=@vger.kernel.org
X-Received: by 2002:a05:690c:eca:b0:6e2:ad08:4914 with SMTP id
 00721157ae682-6e2c6fc3638mr28617557b3.9.1728047173290; Fri, 04 Oct 2024
 06:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241004123658.764557-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241004123658.764557-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:06:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf35_fAOC4S3246vhMUipSjDkd9hMowmdd7=ec+5J3Aw@mail.gmail.com>
Message-ID: <CAMuHMdVf35_fAOC4S3246vhMUipSjDkd9hMowmdd7=ec+5J3Aw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Add support for
 configuring schmitt-trigger
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for configuring the multiplexed pins as schmitt-trigger
> inputs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2
> - Included RB tag

Thanks, will queue in renesas-pinctrl for v6.13.

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

