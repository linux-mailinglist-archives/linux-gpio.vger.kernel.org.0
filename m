Return-Path: <linux-gpio+bounces-30286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B39D04BCF
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 18:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0DDC303C10E
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8563C2DC322;
	Thu,  8 Jan 2026 16:50:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D921D217F2E
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 16:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891045; cv=none; b=O2f4e5VMl8C8i2LMBWIDiXFZICsf++8fYX6NwVBLkv6QGc40xEJSbAkxxk2W77gtAJxeCishEXuUcZlBqhCGmxjKzQhMJ89XJd2f2bCVGcn8+o9ZeCz5IztommYUvQk2mdtMRg9AC04Q7rz/ikNxEWsh8WvFrMUKxsXPMdSSQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891045; c=relaxed/simple;
	bh=7/Taf5CwvaYEOCNOJhdbHbsMsm1VSLNTMWyH4dTVXlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojD9xVzrGwX5WWkg/BqmCEpnQ7V8hWzWQF1aAULBRAGfQ1mT/Yv3oTTygr1XeJjWWi6nBsEa2OylnkuDYElKaQ/RGiUK2D1xla2AMjE294aGaWieQ9XfJTXHkofjPveR0liQ300dQ5c1XJGegUhoTukR61Bpv/OhNTPi5rXIj8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93a9f700a8cso1147401241.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 08:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891041; x=1768495841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjpM9ymjUwivlVyTiA/MPU+wu4L18L3+Ii3s1slBXsE=;
        b=pK2T8cPGY+teuDcww3ugmd0uWZ3/RTbk4hcftTnx/IlGd7H+YWYQR7/582ZBP1k2m0
         RMiQoCCO5r6JYbBgUDWHxA0KJHJgTc76pjgAoGmSsa3ZU7YWJOEWmVRpFcggnhwi8P9J
         s7KnFAu26bAf9YQLNPnncVOK2Za2tipTWAn9pzQ8pxmcBUUDBJxj4F679dx86TEsMJhf
         hAVt9CRwZTCHB1Jc2EVI/nAraRcHeZjH49L3a//rns8roWF+uPFuDWKg7ywnhSZldT9j
         Q88oyniN8VMwjMkUyXaE72XH3JFoCyYsruEc2SDwjgIkLGJ7qRYIzzexlwF3n60C1xDo
         /wkg==
X-Forwarded-Encrypted: i=1; AJvYcCVMZsgaEsnsaDxw0dCvXQGDCmfRKlm9f33f3GehQWxU4V1wa9TADS7Bi7E2z3zFj7tm8FhxCD2ubeVW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpE9l8xh3ZLjB6XicYNMce5mjnt4bv9Wi/qFtCU8EsWvHzjTBi
	tJGT1c2OT6Ntsc9mn6xIhc5g4oBTKFuVXrVnckD0oobIcpRSOrG+f4mOv8Imh0sN
X-Gm-Gg: AY/fxX6oR2Q0OT6Z5PxioYn5KfDyoy3hlvdkqE/vcZT1/m81haIXJ1tBynIGOaAFc4w
	26GUAzGiomTgpL7lRjJZwUN9ChofNZla0AD4L2tLl28YEWXTa9pbG4IddKCiWyatl+11uOXn6FG
	79AKGDnkOp/PtFlxoQO9fGeLpCySJhbzJH8U8cDoNbOjnuumF71prOp8AFDov3AShofy8J1WSsl
	gajVnSFtHFYXonGPokyNRMlszWQaIiShaibwiv20kKvrFMkftAbnr9rHLBJu51ow7gdxfpi6BFe
	60elwHuTWRN5rGJX5hsewsWa0dfJehh1mokW21UwKcnT8CvfUKYxzBCHb0B/jWRsCnNamlcTdQf
	Yu4YGsDGJb/0F8t9MNrf+yIaDpZKb9LslMMFyVv2nZsq936oQdPdA4xRCUBW/WQNkMmRtL0Wc0/
	ByqmXqOIgzvWQlca7oo0PFAJADJoozo+eEtCkjpodv3LTo6gJWaZr65UQHpQo=
X-Google-Smtp-Source: AGHT+IFVjHMhL6UqOtWCgrLWQIF/FT6kqgpdqzM9c7JHhKM2QW4CzIRI6odurQVM8oFdoALwzTyH3g==
X-Received: by 2002:a05:6102:6a96:b0:5de:6dc:2296 with SMTP id ada2fe7eead31-5ecb6955564mr2452746137.31.1767891040854;
        Thu, 08 Jan 2026 08:50:40 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm6885466137.7.2026.01.08.08.50.40
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 08:50:40 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eea35e808dso184472137.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 08:50:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUa33amco4MwAofUSTImgeZiK00w8DX+IwjcAbKMrZGxJqMl0P8RxjfMHR3S+RnbRGu42NOaxCa5foo@vger.kernel.org
X-Received: by 2002:a05:6102:3349:b0:5db:ebb4:fdcf with SMTP id
 ada2fe7eead31-5ecb687b063mr2554646137.17.1767891039245; Thu, 08 Jan 2026
 08:50:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 17:50:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXTKVzB1LhOp2jHima+_ZWHCZZYqrExpLjfuF2KV3QZmg@mail.gmail.com>
X-Gm-Features: AQt7F2qEe-jh4MC04jZgvw61EVfKsP_55-29gu7PCGMB9-MBqtO4ZeaLC4gjeeY
Message-ID: <CAMuHMdXTKVzB1LhOp2jHima+_ZWHCZZYqrExpLjfuF2KV3QZmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] pinctrl: renesas: rzt2h: move GPIO enable/disable
 into separate function
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
> GPIO is enabled or disabled in multiple places, simplify code by moving
> this logic into a separate function.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

