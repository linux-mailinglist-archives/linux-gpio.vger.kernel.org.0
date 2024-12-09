Return-Path: <linux-gpio+bounces-13673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 968359E97FC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56D801626B4
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C40E1ACEA2;
	Mon,  9 Dec 2024 13:58:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9949B1A238F;
	Mon,  9 Dec 2024 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752698; cv=none; b=J91nsnL4PFLh8JsgPcIiEpZlwOAEuQqsEBLdp76XQH1zlpoJ7+WcuCJhBrkY74l7/saJfEd0UyptNXzPl25+RY85ajIEZVdf74e+a7bLw7RU0ZBE1YivQGe/oc5I/o0mM/T0k1zhHB/JoBpcs5ipz2UnA4HG/kDOOS8YGUjnmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752698; c=relaxed/simple;
	bh=AJo8kL0H8Z4CRD8RoAa8TcNd8u3JMsHI8ocGAW+ciDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV30lILylggGp11ZA2CTa5JrfvN/MVTY2UdN+GovKa70cIieWif9sqp87SCihUKa1HDfyDL9ERxccWM7TwHcEbNlNXibUzR8PFJQDIW39M/P7dgPgb6uH4b+KVDfA4Z/gvFfQQkEmayPlqHgD7bzudJHoq7QOv5Hy+QfieToVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afe5f6af9eso350878137.3;
        Mon, 09 Dec 2024 05:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733752695; x=1734357495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLkjsOTCbQGkhyDK24ICy+Ea6Qhv/I2EMPhwpTrMFPk=;
        b=p4yOCV/KmYOEIcaWr3QYmiio/QFMStK0ctVMrvh3JNCoAfVBlqoKrIYmB5S8P065Cy
         4eWWZlneTXsh1vXbUtHCAhmq98PGniK6lUbRj1G1TkSWo8GDpyrLuGy7sA6TUuXNcJNg
         YOqpO4WHlkqqOChbhzhZLpIUxfMhjHoNEJ7oqdIxkbU+UWu1midld/eBCl5jQnChkFse
         Is8BDLOGcstshGxw2E5ooh6swuhri0C5qKYKXlyaWrRURooaKFCgJvERwgRYA2V3JAxo
         kKmgJupuFSINyoMewlSZ8XOsr37mUMwxHaJ2QG+mzMbb2h+SBL65eWBO7H3MUPbDhAzO
         crQg==
X-Forwarded-Encrypted: i=1; AJvYcCU0sLQrA95FRsQ0ujWJiH39jjsE10tGnnA6iTJn0SQVt51oT86cMkGw55yAOCo6NTpnsRxZPk+8YHQnes4z@vger.kernel.org, AJvYcCVVRsD4dVk9+49pJtvkSeMA1PQHFZH6FW0qpYXXopy9i5AoXfGNEZqEjLgJB/JSaAXC+8usbkq/E02a@vger.kernel.org, AJvYcCVjPh+xyUx9QeHabxM5AW6Kmd6nQctJUWvfMue78XWgU3Hb9B0QT3z74FN44UNv9qqXkRgbnTd+l9tHzCwobxw413Q=@vger.kernel.org, AJvYcCWX5+SZtQl/67icQDjsN7XaBbrE3h558pAiVjCIZMObNPQ4L/C2uI2NFje0cojhWL1ZNSYFmMDf4HjRGJ8=@vger.kernel.org, AJvYcCWnpyo1d2IXyZQWW6N5FHFQ3rQjJzJG8mhfYrKFsqXpOFO71rdGrfHOgZZrtQDrGQthmz75jPwo630UEA==@vger.kernel.org, AJvYcCX7oSUCH5awZR2ri7x7liHuDQOcLdo5yXzwYxqPLGjpx6L/UVeF8hTQHhSse1IHdyFMtOEPHbX+c/Eh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx51LgaYFCj6JiC9BCgGjenBZWjWsHkGaG14i4lJbTexYTUOyMT
	diQb4nV6RHMumo4wda8ruwEvPCNqL0qJQh3mG5jWHqLd3kTpd/D5GV49KM7d1HQ=
X-Gm-Gg: ASbGncs1pAMWEXq7MmixQi9Agt7pm/6McBZK91LzTMiYX3hJPRwqUe+hu6pGgd58ywP
	AIx2nFGAq2gGPL+0j0pn0lDMDRjgVQypi0Lo+3xU360b/RISZdxD7TLn4vWKU/94m22NuXfzOhr
	nUFgTLrSTxHoIDZjH51bdW4wZqTJRDwrmgqu9U3LK0n5n7FFDUf4e0p22H1VC17P/kcV/q319cR
	BOhtMes9V9CaLt/5DJ6mL/5tfXMbU5+SyRMDCG0enpciqUKRHnV+Lw2GintLd8NJb/FZgu0z6hi
	94px79Os3vcC
X-Google-Smtp-Source: AGHT+IEaJrYG6AB0Cp90Sts3LqH3OS/tu7fU7ApM9EQNqGVaUcTouqkGEkmRA30CMKW8iAy0d6iXPA==
X-Received: by 2002:a05:6102:26d2:b0:4af:3973:6b22 with SMTP id ada2fe7eead31-4b1161b6d52mr693177137.22.1733752694693;
        Mon, 09 Dec 2024 05:58:14 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4aff6e96b0bsm291279137.14.2024.12.09.05.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:58:14 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afe5f6af9eso350864137.3;
        Mon, 09 Dec 2024 05:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMJHntN+wGak6t2iJrJ3BfdoElqBZF6RMPC3JnMnRiz8xT9tX1rmGtjQIWISslKlBbL9ceqn0nJHdEjA==@vger.kernel.org, AJvYcCVSJ2AAB56YImP2SOGIgAqCL3Wy8aQM7ghAbEtBhPHcTAkhBpLS8zQThfMlp8mfD0Dm3zmHXxA5BIJBQmZ0ADLrB5o=@vger.kernel.org, AJvYcCVy/lc2x+j3CBOYqi5Bd1UsqkwjDGJKEWkBtVDucd6TJo+JZ3Ss5WfCvBYV3OrUSM5YsJBxOp68DNQM@vger.kernel.org, AJvYcCW0uZ47Xfxv4Z6u7zswcADVel0/bTENMyAzxSpEDv2/X4e3sJ4YaHWCF3AcO4OQibHXq1jxi6mH+FjxoBuc@vger.kernel.org, AJvYcCWoDL8r2//D0jYQCr/TswGMYONfvfxoxsDlpebdSzRsxHk0dgWBMkSsFFgZWCSLTtgXoS6wLgJnclW8sjM=@vger.kernel.org, AJvYcCXdMlL7QCBXwg9HeMP1679v9p0jivxw6AVM7q1do5eUHAq4IeBMH/5gykHmOh8T1AeAQ2Po2avja2Hx@vger.kernel.org
X-Received: by 2002:a05:6102:f0f:b0:4af:f32e:ea76 with SMTP id
 ada2fe7eead31-4b11601d4c4mr639446137.5.1733752694184; Mon, 09 Dec 2024
 05:58:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-17-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-17-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:58:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWc-zPHwYLkOos5hujCeAKxHb6O7k-KB0GQKtQjSoWEfQ@mail.gmail.com>
Message-ID: <CAMuHMdWc-zPHwYLkOos5hujCeAKxHb6O7k-KB0GQKtQjSoWEfQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/25] ASoC: renesas: rz-ssi: Enable runtime PM
 autosuspend support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable runtime PM autosuspend support. The chosen autosuspend delay is
> zero for immediate autosuspend. In case there are users that need a
> different autosuspend delay, it can be adjusted through sysfs.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

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

