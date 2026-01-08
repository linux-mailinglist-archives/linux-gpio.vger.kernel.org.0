Return-Path: <linux-gpio+bounces-30292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F3D056A9
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 19:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59B223021A5E
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 17:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269A21EBFE0;
	Thu,  8 Jan 2026 17:37:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E012DC336
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893875; cv=none; b=NrpwOkUPDBpQ1tpRC6GN6VAlfwGA2raHFx9BsZs0mIjULerUEkzmsJaPBdiIOytN8vRuwtz9WtY5VrpZF0k6tacmwflwROLh4TkGQ/rCRFxDClNCz3LVe7iqwgSsMyEPh+gdMrqTuo+NeMsjFvDuHjaWOHcCHB+qmCaeZsh0u/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893875; c=relaxed/simple;
	bh=9u4IBlqSOQ6l3LSQqWSmzbPOCsn6dNCaZX1o0NoAiOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpnzsjaOPVnqcO/hoESg64iSW6NNpBOD3ZAzwnYTB2nbB5+ot/PTkCLLcK+d1j7bm5xmS8YfnqO4WI2bq0rg/0adz+xEDKxMLTaL4SrD6AEClAUxucCufJgRmdF17OFfGRleNigegL47X7nlMlEsOcOoCSasXeQU3VitHrrwmto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eea75115ceso263317137.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767893873; x=1768498673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg/FcISCTJfxkX3GTzaYaJZ+C1ltFuSP8SdueGldqwA=;
        b=QDtnm2R7xYlWjEmpg0SoMGzuATgPpC55g/swLbrMOWgqQxpdag5/oO3oGgfXjq7+NT
         WsgOmeeZlHucVXlTtYR96vpv3kk7iN02WJbNvQvyET9yI23mUkKD0e+qMb9n5q82cFNC
         tUCdqC0vyxt/t4yYjdKULFuKW6NxeaUxfkI6wqOJPSa8RGr4ttvU/1DlvHPdMHrYgBnx
         c/BcvJR/ZabqsxsxiXB+MTHs5yVuB4HbfvUEOUKf+xkbN77KkHmAebBeVTuvv3IYRUH5
         IaiH5rFnkMvWaqcq0AGJ8gKITR+f3w7Q/ldy3PPGK2YyT9jxLEB6pFYBSXWr2u8thM8S
         g3OA==
X-Forwarded-Encrypted: i=1; AJvYcCVif2KagC9fNfQQxdOrplbmGnXUI3bLETtcQWWP+1ji9s3aU4wIZXzQrBDnrz7EgiAXnFv4EZtqwyi1@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuYRbV2sTvuw5URpYr88JKlVquVxjOrdb1CF2+1w2HCt+Rg7e
	qMCsyagN5Db2gfFgM5KEfiYcb+FGNDqYP3KQM4HNNBzDPSDLW55Trf5Dr4R9hH37
X-Gm-Gg: AY/fxX47GpfNwluasMAv28J/yWitD2RUlTzW6Q5jaFx5BATAorBIIluN1XsiPwlesF4
	ZN4BJ1JEdPvFW0VypVthkyPMwXjvn+A7eBaJL6t7M2fRh1zwoyd2mYdw0keA4OxC135jwGfa/G7
	CIhhoxxpWMxF/svnQKW2A3QkC1et6BlL/fjhpgUpZfc0VMdWL8rlkbgIZDYtJA93MOiClPvRm+k
	YXISTPwj0cguaOssyEvTPd3BYoW5S13z67/7ys/Xb9zRJ5Vg6IVlMIA8vuHUxme0isO3ciBzJ85
	yeEX8FGtkxSCxLYy8YKe8tFon04MMvk3Mg6NKQbSNciyIS3ZMLZqd7TwceJn2Suf6c57/eqToBx
	+4MVMqdJdiQspdcvAddwBAreQ/DdnbkzCYjLxnrDmkp9UgGsC60pKmMWQ2W5pQbg0Q2JDwV6iUV
	4xXQ6mtCeBcHaiYImLDIHpS/ZQjAAfymZ9fE+nGlnr1zUfWBYT/dgnwKkTWFA=
X-Google-Smtp-Source: AGHT+IGF6njK4XkKMKYT9Uz8dBocY3EJzI2Xyl8OffnzcZSj6GYBzqFiHL+rPa8ZPV3Ts7G85/k1Kg==
X-Received: by 2002:a05:6102:30b0:b0:5ed:ab0:e5d1 with SMTP id ada2fe7eead31-5ed0ab0f29amr1696564137.15.1767893872454;
        Thu, 08 Jan 2026 09:37:52 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124c452asm6446394241.13.2026.01.08.09.37.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:37:52 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5deb0b2f685so1571613137.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:37:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi/C7xpLanTd2JfzYXa+EM46M1VRAKPxwcAYhwdwB7mw4aYHqERYbahyO5LOveOu1dsg841L5jsJWH@vger.kernel.org
X-Received: by 2002:a05:6102:5706:b0:5df:abc1:e6b5 with SMTP id
 ada2fe7eead31-5ec7573f944mr3993999137.17.1767893871904; Thu, 08 Jan 2026
 09:37:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:37:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXM62yhXRnQZzyH_1piR9C8nVhPNszc41Z8Q2b7EygfTw@mail.gmail.com>
X-Gm-Features: AQt7F2psJvokOqphYS5ymHo0GIXhtH0aEmkgjppDzcUqWuJACKalFIWERnHzJ_U
Message-ID: <CAMuHMdXM62yhXRnQZzyH_1piR9C8nVhPNszc41Z8Q2b7EygfTw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: r9a09g087: add GPIO IRQ support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC includes pins which can be routed via
> the ICU to generate interrupts.
>
> Add support for using the pin controller as an interrupt chip.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

