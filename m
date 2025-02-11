Return-Path: <linux-gpio+bounces-15699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD408A304A7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 08:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69D2E7A1A21
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 07:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9251EDA1C;
	Tue, 11 Feb 2025 07:38:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100F1EDA12;
	Tue, 11 Feb 2025 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259525; cv=none; b=GuCTkSor87MI1G8k5kE9sdQSaKxZPPtJ2RCytdORAyliVi7ZfsunMsrKbncijBmnjjHRrnQgxtTpOsff5jeCSiu5ZX/gnVFB9lj3F5v7aSGdD3yUx5r1clDhJ9z3olR7fJiMD05WFnjO45vrG7ZLuaV7fh/NxL1Pymu0TfKW3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259525; c=relaxed/simple;
	bh=u1NJ1ciVlQws/QcFOQtfIJK1KkyuDVjMomMI59lszVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7GastQf4ldyXvVThOZ5CXHcFo3VAtyOLLSLsEoN2C6O29QTGM2XrvNn9Yx/EcWZVL8NWAedtVDEThu/vCOVInCq7Dcwl8ATbqQDP3bwj37QlYHb0z+QOdSlb7hXiZpaU5qY6EDm+oBaEXpEeXtlErrYbVDWtQSM3JHvspQi+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de5a853090so6171019a12.3;
        Mon, 10 Feb 2025 23:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739259522; x=1739864322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+h2QReZ15bqMLKzGDZ+kWkspjV7JoJpdMRoNWSsRFpU=;
        b=I/L6Ntiat/kDCGW5Kfm+EEqsEX+LmqetnTqnNg5Gyylu/EqEoFDw9RapX8s5vR1RvN
         W9E8vr7m/gM82RzIq/XZ5KQDbWogwH54mp18w4hfmTGm0hhAFG1+u0cNP3VkRci3Jpu0
         bUiH8AgyD+kVhObzXIEruDklncRk5wBP5CVRRdaEm5mryA1xNOhFxyNlzsOBmrmBrxEx
         6euBMLuOeNgR5Q0pAeuZkc122zRav+ebzt3u2nd5Z8IrdUSpsVoUFdHP2Y2ZwubKaDDE
         skkKol00ZYzXBSN4eIlYuRB0QsThD/VJe44q0pSZ0wrIazEVLP0DtY/ROG4056Jg0UcJ
         MUhg==
X-Forwarded-Encrypted: i=1; AJvYcCU926rXmGuV7RTaaNlh8P8RhzV4sH8+N20ZPkGd865GXHWJ5XXk9GBDy6XMwSw+RRyFQ93Pra/GP5rObrwikM3ZafE=@vger.kernel.org, AJvYcCWZjIdbCuTAh9fm67vOLo+fl7l233WbisscxoLWffnWzrqXb2PhLXBOjtv4DFqM5gRdAwLw2reN@vger.kernel.org, AJvYcCWrC28HMPfnwNPZtHlhCU/OOpfiQf1dadNR46X/VAOwTzxKNrrO6SjXNAvEm4+OgbXyqMEKxjNAsH2q@vger.kernel.org, AJvYcCXMwEHi2dHzZuHbbdeT7czvaDcbUSFlMzLBkOiIKoFBKT5SAJXtzwg47Pw30LVZMBYcQG5ZQcJkEI2DK/kI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Y4aq7GY0yIidtXvNSZRkF+5/0o1itCpgNycDc8OUJ2XRcZs6
	kVXXAzNAh09SeREEwRkYw7XalFSLHacGRPzVD0QXYjZ1dNO7YVQ7Q6h5Z5WoI40=
X-Gm-Gg: ASbGncvjVQV8WPVT/9KP2LTOEE3gWXSoBJbmqb0UNMuo5neQwWjIu8Z/hHNgZA+Pd2Q
	vAOvQYgZjOdRpris/RBAGWak+wFxqVuIiLMTTt2Li2DwX1I3OyIKN68KlAlXZv+EJoZh8j80Ofp
	uvcPRaLE8Ep+6w/eaXDY2o+wLn8CidEXdorf/BxrqPf9MJf8sq/iOTPPnJfxIi1MZmfWf6kRv7Y
	KK9jmqSzKKfvJUWTW0uozwhFadxyZug0/pmaUgeW7lIZFn6KPefbxhoa/nK9pCOckvJZrE+vtqS
	Uqqt/pDuSfI7In6euiDGOFJIF9uCVVTF+8hIzefaqn2k6ZlFngEyAg==
X-Google-Smtp-Source: AGHT+IEFWybpNFUF9K73xguzOXbYjtETD/P3ZeG8RbZexjMPEulKDAYr10fGvqyueRM/AtYuo7H+lw==
X-Received: by 2002:a05:6402:4012:b0:5d3:cfd0:8d46 with SMTP id 4fb4d7f45d1cf-5de450d6aadmr18829272a12.30.1739259521335;
        Mon, 10 Feb 2025 23:38:41 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4aa38a1asm7567797a12.79.2025.02.10.23.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:38:40 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de5a853090so6170958a12.3;
        Mon, 10 Feb 2025 23:38:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqibg/c25l5VP0TRHsCOX0J3wJWqTdsC19R6ztY9zuqkuvvX2Fa5oQDdvc15NNFNXKywPjhY4TaAA/zsAO@vger.kernel.org, AJvYcCV0y0nn5eDs3fewHU3dYzfOcZ9j5IVKvhuRhk7O7mgc2uqUWM8tfKZJgOG4E6+DRi9EBVcsF0I0ZZkp@vger.kernel.org, AJvYcCV5r8rB1TGjiRCMJCgTzvSYaN1CWs5gCYAsx7/WiDcIylg3ghCJ0r4SRj8cUDIH5GdcwFiSZlmp@vger.kernel.org, AJvYcCWFyimYx6nDnhUS3HjxCk7GKNxR4nTFht7P9uHbWUR5IVrpxmSFnJz5qc7AhEbTn2m4u/S7R/+wYhUlZLHLJ8DZ7rg=@vger.kernel.org
X-Received: by 2002:a05:6402:40c6:b0:5cf:bb9e:cca7 with SMTP id
 4fb4d7f45d1cf-5de450d6a0dmr15871546a12.28.1739259520331; Mon, 10 Feb 2025
 23:38:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210232552.1545887-1-chenyuan0y@gmail.com>
In-Reply-To: <20250210232552.1545887-1-chenyuan0y@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 08:38:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVoU3UNie4cqm-sD4bNpfiR2xFGZdrFpDA8X8KOf4B-rA@mail.gmail.com>
X-Gm-Features: AWEUYZkevKwcST6SF1HxbrIo8R-IX_Zhn3gxXY4brgnNilTDBjG3uyqpL8i_H48
Message-ID: <CAMuHMdVoU3UNie4cqm-sD4bNpfiR2xFGZdrFpDA8X8KOf4B-rA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix potential NULL pointer dereference
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linus.walleij@linaro.org, richardcochran@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zzjas98@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 00:25, Chenyuan Yang <chenyuan0y@gmail.com> wrote:
> The `chip.label` could be NULL. Add missing check in the
> rza2_gpio_register().
> This is similar to commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
> Besides, mediatek_gpio_bank_probe() in drivers/gpio/gpio-mt7621.c also
> has a very similar check.
>
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

