Return-Path: <linux-gpio+bounces-30545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D91D1E42C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 710713124C19
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E62D395D86;
	Wed, 14 Jan 2026 10:47:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50776394460
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387636; cv=none; b=C+52jD9Hwp64rb7O4+o2gVUI06o+uFxuHpkugMCgjuH31PDDm/iplO7rn0ak/4+hNv7Ny5n1IhOUxKzVpivrQN5RV1IDGBVVykWYhiTr65qql23536M3sdNAticwAMwtSHjnLAOh0QcP9tjyX0L1W8MwIXveSvuQ+zGdoAGf1rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387636; c=relaxed/simple;
	bh=l7Vms44D7cdWM2JTmvA6ZUvD6bdQNJphB0NNGZJgeu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJ+LERbT92Tz2o+tBOZx+BUV4BEU6OOsAYHJU7LQOG4y+1yHgnSsTLY5LOBNN/tJLKmHTDqZ+CiyAkDTtTMdW2C2ag+SeJ0MXWLXworZnMRZa58bIOs2ojuNddmc5NIlhLSpbhxI0WdDpDDSMUODO9QWHiKn7mqKK0iv0AFOWyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93a9f700a8cso2925443241.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 02:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387628; x=1768992428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eqj4xnVKq5dPU3hM1G946buXrOEhzZ5Yj8GNkLNrprY=;
        b=om+vJ9oCkhtcSzRtbVBgFsiLCWtwC489jS8rjL79Yqeh8ZneNPFYo67XBs6QBhA2No
         x591AMjwlAJXBTBSj5ftcF4bOHSxuj0fUM1VUockYMxUvj7JUZkU8eKGvbzCsEXpCM3S
         CfL/Zj4A5PZPf8/Hu6ji+lHSuh1txjVuDugEB54i7UAW5DLlwYw6RkOl8iKRVhofmn9M
         1mdmjlBnqstOQjnk3HDXe6SjDaD7uYLQnVg/ay8/qsz845xIxc6AC2YDegImn67eFryc
         udbyWApekdNoIYrCeE8dbYmfsMHLfrpFQQmCDTC2MQGRcNjOP6UOpymCmVq2UD5hyeY6
         SQNA==
X-Forwarded-Encrypted: i=1; AJvYcCX+pQL0diy8Rn3MQftKy9NvwG8Y+LVD6KXUwVjeNx5ox4TreQZ4MPbcc+2qYOOvfJwuhcE6Y5aUHEG5@vger.kernel.org
X-Gm-Message-State: AOJu0YzPikt8XQlwTOeWbu0IrAYiD5n0J23QrUp2b0YFl1dYMB1cv9kk
	0zuxoLZr4qpRgV5Mk9/8Cd7M2i8rNx1zGPNPnA09S9UsH+zoLixcvJvbuJNC1Ubn
X-Gm-Gg: AY/fxX7zvwb1aloLA3gcEomLX6b0f9Ti6b+uT9omQeb+RBUYjRD3edxzJXjH22+BXgb
	wvbM9rQ7KejvBjdKCeX+oBRYZ+ypYwpkJd5urgaCSfCvHOjTnRHa85VqEy/CYItktM22f77oBa6
	nsQtEvRKUjv0vrxayvF59NvXbJ0HHmqEqdg7jmILjsDAwnsKDhvzvt3yC4wZZJErqoXQ2TJZVRH
	EisoEjnVTKIEb6vWZS6AXRXyc4zc73Kosd1rsk+NFzjq1kk0yLO3s2yeXdTBJM2tWaMu+UweknR
	xzV8dFADG1POQ8GXCf2HCFJ1OAcGhJvIy52SJhWp+wdUJq5odtFFFWVV7lKz07831ZBrQO/Dx/k
	ERw5b66lHpJJAJp11t+i+uAqpXjjLyGknWyt4h5GZfv+hMsa32EnA+wdzfZQ8z6e+gde7COMtXk
	bXjXqEeDwFNlCl68x21SP9Ivlsupl7dBiSrv0gnKFsrKg7OFTF
X-Received: by 2002:a05:6102:5486:b0:5db:f6ef:560 with SMTP id ada2fe7eead31-5f17f5df0d0mr862418137.28.1768387627710;
        Wed, 14 Jan 2026 02:47:07 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec770644d5sm22921346137.8.2026.01.14.02.47.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:47:07 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ed0b816d76so2464205137.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 02:47:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1Ur/2mq3Jim7kUN2qShOREwZ0WESVSeChCgPPnkfK9OEUo7SckpqAhltdPPoVLWMXD+hUPQPgcRv5@vger.kernel.org
X-Received: by 2002:a05:6102:6ca:b0:5ee:a094:d4d2 with SMTP id
 ada2fe7eead31-5f17f415847mr755513137.1.1768387626957; Wed, 14 Jan 2026
 02:47:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com> <aWdp_jMVUBN04is3@ninjato>
In-Reply-To: <aWdp_jMVUBN04is3@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:46:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
X-Gm-Features: AZwV_Qhqb9GutQaQvQYv5ThIdOZpT1v0OWVzDimT8VJV3ZwAupoboLFYD3l7moY
Message-ID: <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 11:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Rob, Thomas, this series is blocked waiting for your feedback and your
> > acks if you are okay.
>
> This was a little hidden between the other text, so let me emphasize
> that these acks are needed. The other option is to send the irq stuff
> and the SoC stuff seperately.

The irq and SoC stuff depend on the of stuff, so doing so would
delay the former by one cycle.

On IRC, Rob sort of agreed to option A from my proposal (see v7 cover
letter):

  A. Rob takes the first two patches, and provides an immutable branch.
     Then Thomas takes the irqchip patches, and I take the rest.

Unfortunately that part hasn't happened yet...

Meanwhile, I'm queuing the DTS patches for v6.20 anyway, as they
have no dependencies.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

