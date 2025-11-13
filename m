Return-Path: <linux-gpio+bounces-28452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C59C59019
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 18:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B65635B37C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 16:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B570636A01F;
	Thu, 13 Nov 2025 16:38:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1DB36998C
	for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051926; cv=none; b=leJ2ZT4t8dCjIZByBogAjT5FQBvA8bFFhUR0z8Ix/Eh30T+yY9XHq3rj6j9FTKLwgGf0xFNl/zKr9RdwgacUUTruazdr7QX1hwYaQ+JOn8tfLl4u3N5yG+l0HX1MvLldd1TrDn1gHIB8VG6lyAs1bI4Hp+AoinoSctfSjBcb0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051926; c=relaxed/simple;
	bh=6POMRmRsIFBjMD+KOp5/v8EgPR8+GZSyR+y+p1dAs5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVNmkU7RR8hg2AEkuNH4alosWhCM9l6dmTZkynHO7GG+zbXHeEv6+4MRJnZVRS0RXY3tLDSGZpQJXXx60JB7DUhpzexoGuU1We5Yc5Vlaet6VZMZHPZu3hNTRlOe/2PN7spnXtztSt5epX3sDFIBEgyRT+pQrhvAfP5SUnimVfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5595c4a7816so657023e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 08:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051923; x=1763656723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=958YNef+Bt2Q0WGZYn2Q5QLvs3OwYQ/fTXGUrCIU6wE=;
        b=YSq9e+u5iieqFZx4CMVInuYOXxOxcM1Fod04DCCmaYOohHdRAE/kRmJOXnncuOycyb
         RFcErGUc1mkOU5WqYNHFc7e2q2jTuQC4A1k3327S9tOKojb2Egjktpr7HgVpHkvzNpob
         ThfHXUR0u2zaXQXgZeydCLJN+Gnw8rb0/DIrzufe+GAY3sDZ2phql/yqxJqlzPB6fPFD
         3vJQXzzqgGCPu40btOqTWeGRgGmTHwNon5O3S8pGlVaFMXNmPT1r0bpetN+VukZdh2jQ
         IypRB4B+tNMcgrISwVIyYORXKgIlzaoi/bpwF4uC8vjRKDA3rS0g+IEgQCItNWnw3aIA
         5INQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN0KprzjZ8OC2pp1LOJsuc5Ij7zjvUmmTeGtGh64KB+mSB5DygaP0aqfce2JuYY7rCjDwFU/Oq3O7O@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxv80zjXhFonQDM5FuMpajafy2W7g9t7/1CmYjojzQI1rFrYo
	g9LB+UewfumFo7Y5uJJh7iu8i7F0M2C8OGUJkIoCxjBBxiWqp2XYjYjLhn40c5SKRfY=
X-Gm-Gg: ASbGncteF0QnU66SdC7SDqY5mEkIufjnSmWpchRKfArl9tYW8jnKWAbdpSzxV8qs0aZ
	RTNYewE3kvpx4tpcXd2Q34suJwwiWw4CkV+xjK8eNjVh650Ymi3G4i15x3WZuPYd+QwD+HS0aFz
	E2SvJFAn3uKQUUZ/4jKHVhWMyvhYNz4sN+42TLTe2TlRWX9TSZjd9u2JWtLHvQViTIsD2NeDELX
	2qSW9IppGFjc7wp/t+E/Y2/uIGgtHxng8TfM5v0PtwuXFu7URykJUJMHgcZ5WLrz/R2c0fKWcSO
	MxnGqNWlv2yynj3NaxPvUVewUJMwnKQacOv0tMf6bTxQPScQk4EyMJB04Ms9igXWEWEourVPPA9
	qARJ5MyQf6GHE0HQ5PKu9GGAtLm/O5eh+iMbGy35q12pcDFWKWXLOCx1ECaBXvhAFyJX67FKNg6
	8Ptsp04qIC1y+G6T2lKyT1FAVVsRvTOQG/hOn9Jg==
X-Google-Smtp-Source: AGHT+IEtEkItP+nayAqkZ8B3ED+QX7QMMzSRnc2zOkN2Ne9Ip6uzN6OjchIiqS1QT91g4ZI8qKU5Cg==
X-Received: by 2002:a05:6122:83d2:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-55b1bb60637mr226914e0c.0.1763051923410;
        Thu, 13 Nov 2025 08:38:43 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f4986fdsm818679e0c.21.2025.11.13.08.38.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:38:43 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-935134ef989so646489241.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 08:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmgfFgzWqUEUgN7FFsTe+tE/G3mNJ6E1/eZXK9hTkvdQjC/ApfEQ9QlwLnti/7aLlAqUHBG5D4APgZ@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-5dfc561815cmr167985137.19.1763051922603; Thu, 13 Nov 2025
 08:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106080758.36645-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20251106080758.36645-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:38:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmzY24PwTg0=oFU3ZN1wrgDpKvnQJ7=zDZvxpx5y5K5Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkzY_8MEzmaJCoKDY8pOB5ThYiIkB4YoEC3TzmpiYwCpzmuuMs1N6fl8Y8
Message-ID: <CAMuHMdWmzY24PwTg0=oFU3ZN1wrgDpKvnQJ7=zDZvxpx5y5K5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 09:08, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Extract the OEN register write with PWPR protection logic into a helper
> function to eliminate code duplication between rzg2l_write_oen() and
> rzg2l_pinctrl_resume_noirq().
>
> Introduce rzg2l_oen_write_with_pwpr() helper that encapsulates the
> PWPR unlock, OEN register write, and PWPR lock sequence. This helper
> must be called with pctrl->lock already held by the caller.
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/cip-dev/OS9PR01MB16368C765305362F5F4132759FFC4A@OS9PR01MB16368.jpnprd01.prod.outlook.com/T/#u
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

