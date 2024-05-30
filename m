Return-Path: <linux-gpio+bounces-6950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6F8D4BF1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 14:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79C5C28433D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D207D132128;
	Thu, 30 May 2024 12:48:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADBA1E515;
	Thu, 30 May 2024 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073291; cv=none; b=MQmrE3+3o5CoZiNXqIPVCKeYtsK/A2QIQ1r+6vIgXHLxZUs8fvCilwR+EEKUDVJH3gKH++1iB4kCjIdvGynR20IcuxW1GhutTr9DddNUnaYGGrsbDxKJW8ZbhpigiBqC3CaGgl24tvNM/DxiatDgP/NGLhA44w/w0j1dZpmM7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073291; c=relaxed/simple;
	bh=8Tpa2UifMKplXpTbrMd4Foz89z0hWoO5ZMVosaocsac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amEQFJSib7W+cAaxbWAFZBWA/Ojen/xCKJoVmpca/XVlPDBjKN5UqYaoaTGRtksVXZ+Y4vf9HqyAVacAnEXdzOj7v/VIQ5oUHH2o2Pnujs5/dBD6J1kLK9yOtcQ23FYc3mms5bAc4zoPboQ8z6nOleob52jrbyeypv4z0e7zDXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-628c1f09f5cso7284477b3.1;
        Thu, 30 May 2024 05:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717073288; x=1717678088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bjFTQ5FA0ZUbYPMdPEv9X789dR7gzTPPFD376qEwI0=;
        b=Hllr2KNgDhRg3HYkmPNBr2qenZSZ+as5hlSB3JV7SUyld95dLCRZA526dVRhJ/1HBL
         xphXNTpqDB0qBLFk0gcxa4YgkGeFiY3jYSKWZm0lw+SegYLG9k9xzcJw8f92u9EcfSqV
         yS7YDvZYJnx5jibsMpEik4BQLVxwNRQ9ClbDKow5w2grjkWwxYYIF0GY21BePn6uJh+v
         MWobtzzD6KKv/1o9jk2gk29wsf89pDtMWh852mPGME+RiqzQ2FyzoucnuLT+7RGspNDG
         29vUb9HOwbldo3AW2ZfIJTz3WMOXv9QMTGQgweHhHwwq9Z72ixSRoKWoXMV52SwM4fue
         01wg==
X-Forwarded-Encrypted: i=1; AJvYcCVWzyiR8InXS+iqKulYToIfOm8XMBcLHzS2XuvgfYD/K30r1lMSkyF3q1zMWsnWhPkRw4IpfUu+hWwvDfFyMdu5FhFKzqs1tpkYgRCPe4cVy3CEaQk8IM5bOD47C+KCS2uX5Kay539QejtAdqLVgJRX7gYVsq+jViAWJidhsD17fYzOVjwmlY/kaT9tPPaPHl70C7v7bGjM2mlvhBcLzhJ01pq7Gpeqlw==
X-Gm-Message-State: AOJu0Yxq69WzvEfPA11GH5OHs+eOL2kp2NAqlJCk2KNluxhZPCek4tka
	K3fWYm8HLEupFRxlWoT+ik4/RpgInguJWaqsEwaTei9cZGTTBerT478ekx8T
X-Google-Smtp-Source: AGHT+IEoB0l42AYow5tt9IPmrAizPvxsL5NMzau0vtSu5rLDi9410qmliT7bRKUfw+M5+AyYwhlQqw==
X-Received: by 2002:a0d:e650:0:b0:627:74ee:931b with SMTP id 00721157ae682-62c6bbc8b42mr27447877b3.6.1717073288384;
        Thu, 30 May 2024 05:48:08 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a3bf74esm28034217b3.37.2024.05.30.05.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 05:48:08 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62c6dc63880so5931127b3.2;
        Thu, 30 May 2024 05:48:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx8giaVFolIdWrAVGpAgJpL+vZJex/RFFoIEG9+set5TpCxzQ4+4ooGids48KQ0/UhC+BsB1z7dKfqL4eiN7Pugt4nJGPyHJFY+7KzTCYNlm0yG1FNTKJVM037GgJ+IQhs6VC6jePRQKISsJR39s0xVWT94GdzXmUq2/+pE3QeU5etBYUCQtfWzZs1sOqgifccaxiOey1RBbT9Kniq10S6nd200yd4jw==
X-Received: by 2002:a5b:d0e:0:b0:de6:1a66:3e4d with SMTP id
 3f1490d57ef6-dfa5a7cd26amr2691878276.59.1717073287803; Thu, 30 May 2024
 05:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-2-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-2-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 14:47:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkmMGU=S_6B=h+TLH3E=M0BhVCJn03axGsq_FPOKiDJQ@mail.gmail.com>
Message-ID: <CAMuHMdUkmMGU=S_6B=h+TLH3E=M0BhVCJn03axGsq_FPOKiDJQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] pinctrl: renesas: rzg2l: Fix variable names in OEN functions
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, May 24, 2024 at 11:46=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> The variable naming in the various OEN functions has been confusing. We
> were passing the _pin variable from rzg2l_pinctrl_pinconf_get() and
> rzg2l_pinctrl_pinconf_set() as the offset argument to rzg2l_read_oen()
> and rzg2l_write_oen(), when this is not a register offset.
>
> What we actually need here is the port index, so that we can compare
> this to oen_max_port.
>
> We can also clean up rzg2l_pin_to_oen_bit(), removing an unnecessary
> branch and clarifying the variable naming.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

I think this makes sense.
It will impact Prabhakar's RZ/V2H series, which demultiplexes
these for RZ/V2H vs. RZ/G2L (G3S).

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

