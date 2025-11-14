Return-Path: <linux-gpio+bounces-28477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE9C5C671
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 546C74F1BC8
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D588306D52;
	Fri, 14 Nov 2025 09:44:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92002305E02
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113445; cv=none; b=XBCousU26ZmnOXXx0hGbeHidjaekOlAaeSRL0lwXJsPt27oR0SGWCdk5FQYPrBbnAS4USb5vMjhaPoTRP9Q0rufaINgnSuT4AaIiAxSbb3bq8BpiIUCWx5E6we+bksI3bB+MBAKkZnEUgpU+YI3FB5DhNVdC7ebNs8sduOIRw9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113445; c=relaxed/simple;
	bh=aJYAANABEoAIUaBHYu+sSW9iWPPXWILQHtV10sDxaJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=peTn8sYJSaf1Tzj7sl9MHaYmVDymbCpjIgf6FsfiiAhk+gRsEdea2E5t7oKhHgptAtV6EzNn0MAqhfwehFEzr5POryHsgRUX8VM3W0lgqM1+vU5ttff5Hv2x5ZtzkDbRxdGWV0ieMhHjLtG2Tdlj0o1pNH24EcoLzjmXL/kYGx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7355f6ef12so260173766b.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113436; x=1763718236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqtFvU4gpaBQABprw6muXyurqIeH68Zg5kpC8+rY5xs=;
        b=SGjB/O5dhvgv1iiwcXljh2WBkgKBJEC4eAAeyc7oFWyzYC+4h+gNBmLeWgph7zCvH0
         /Kzf3zeGN1C0l2/XHJpgg3hn4/dlMNgV+xPR7XNP3KDlsZyU+AL8zhad1XtrLo9zBCKH
         H6Lc0PnJl9JUN4bOOTQ87VecB6FPUHSGxNA8Bf5ZjkdBVN6DmDl/+30jrFoOv/d/+O03
         09eYVPFr9VTqBX94cALnzVo+opqgfVBAQ1bU8Gb0YwAO7ZBJ2gzxSMB0lDFSjM7eTq4q
         wE+L8mk2dS+7cq/nccbiE8DCXULXyLNe9nXQAhWkRhB4uKuLsID9NMrTaYUVyhj6uCtm
         XC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfpct4GYIWosYlicdkgQwmXrMPTY/Z3JDwr+x7Bs75n2nwCwCGwRzy3uXoipOKHvEGqDADUoLr8w1I@vger.kernel.org
X-Gm-Message-State: AOJu0YwV+rcxGqQO8I2yW14Ju5kY7TzlZokgN2U6JQcdExzaqbUbcCHe
	r9ihG5S90SLolxrlkF0+/KsZuKV3W2uSk9PHCW69hkCR1P8fe2dkPFUlGw0yuPgAUvs=
X-Gm-Gg: ASbGncvmkkcZTo/TGpQ2HWruxBS4qnh2UXYHRgCllmlY+anQL7JgDo0+GbWFh5447lY
	qH7J3eEDvBuHXEMlBRoiwRD4PKbOZMqxqyPPhu4juyxmqK/YNm9qqUSiESSHSBsCNBodzkTRBRD
	4ZWWUMB/RnQfzRssHJfaR5ManDsrmO0ut63Nq4VwNa84jdYNEAym0hnrxG82moN3ihEZVtltRWw
	6IWVUOWpoZpvKy8cqaUsJMkQrxnfFHJbu6qo5kZIg+r/09fKsnrMtlqyWlleB6wUvHCuxXhMjlG
	/C8ZnddGjeHHBnUpDgyc6vAAzKu8igkFz4X10OmTQxZM78uZg7m3g0wPf0m1Fa2h8MjgCEyvPr6
	X6s9kCWihn/SAEb8ssS4GGJ08Lnc93wLzwnCS1btAx1T4BaLAy8oFEa7U6aLeRgNP8vjhdaM50P
	NjikjGrmSh82CRVLoTah5uJwMQCW/ZOF0gsDaHJ6DJ0qw1G96j
X-Google-Smtp-Source: AGHT+IHDVF3a0ITxdHubQXQDY/U3eKW45qYdgsKdfNXkvnQS1PvtYfQuhfXRnWkdp2OW9St1Rt+Mxg==
X-Received: by 2002:a17:907:3f0a:b0:b72:51fd:5a5f with SMTP id a640c23a62f3a-b736787dfd0mr190176666b.1.1763113435868;
        Fri, 14 Nov 2025 01:43:55 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b735c879a6asm222237166b.75.2025.11.14.01.43.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:43:53 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so287181366b.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:43:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/HnCng0q8iQHry9ybbG3tW0i9RkajQ/w9XpN8fo/x0JKUyze3GkcDmlM/iApxndXZVp6nfCBbz0j+@vger.kernel.org
X-Received: by 2002:a17:907:a01:b0:b73:278a:a499 with SMTP id
 a640c23a62f3a-b73678adc4dmr231482866b.15.1763113433482; Fri, 14 Nov 2025
 01:43:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251114084122.01a0d281@bootlin.com>
In-Reply-To: <20251114084122.01a0d281@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:43:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1NmeCyNu8mHJ=Pb5WKjLkCucZ-XyNKPS5t1Kmt90bmw@mail.gmail.com>
X-Gm-Features: AWmQ_bnEaFxu73Nj-q2Cezfl_7HYPeRWF2OfC8CAOM6WAXmswGw9ath66GQ6N2M
Message-ID: <CAMuHMdU1NmeCyNu8mHJ=Pb5WKjLkCucZ-XyNKPS5t1Kmt90bmw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 14 Nov 2025 at 08:41, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Mon, 27 Oct 2025 13:35:52 +0100
> "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com> wrote:
> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.
>
> The series seems ready to be applied even with the minor feedback from Wo=
lfram
> on patch 6.
>
> Do you expect a new iteration from my side or do you think this v6 iterat=
ion
> can be applied as it?

Sorry, I only realized yesterday that the GPIO Interrupt Multiplexer
driver resides in drivers/soc/renesas/.  Before, I mistakenly thought
it was part of the GPIO subsystem.

Anyway, it is a bit late in the cycle for me to take more patches for
v6.19 (I am about to send my last PR right now), especially given the
patches touching the DT and irqchip subsystems (with the DT ones being
a hard dependency).

So I suggest Rob takes the first two patches for v6.19, and we revisit
the others for v6.20 (including late review comments), without having
to worry about dependencies.  Does that sound OK to you?

Thanks!

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

