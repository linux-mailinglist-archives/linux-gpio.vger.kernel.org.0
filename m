Return-Path: <linux-gpio+bounces-23911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F24B16D75
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 10:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 883205A75FB
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E97D241670;
	Thu, 31 Jul 2025 08:25:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34021B18B
	for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753950312; cv=none; b=BVzFH8h7F9KOZS3eXJU5VQs7UvBVbHULsimd+TCI+HgqTEenENVeSsAHpZjL5wkcQsZ2gF24nqxqiQsMe/I2/nR0sSNQXKGaYptpE8lSG6zDaRK3vC6UTz2OBCKQm7QF3orpVtz8esrgrtsLdyWcaF9vigUiLbKfykNtVNCFKsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753950312; c=relaxed/simple;
	bh=Jor51hZlg/sFOR/ggmnyiVe/6UxPC1IY39FPzHXc5nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT5xtVvHML22uIuRLKwQQ2wF1/gj5H1iXryCHRmPP4fRf97IknzIXIJytMxrHrMqFkM0dV5L9l5pc65axNkjjUbZvNaJcnZtBd6oizx8RriIFNLaBV3aGTcoVwSgL2qslMzqM00nUwiptKZc1RQsJjLA8LxPW7XppQJrdmi7sF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-539329de448so476867e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 01:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950308; x=1754555108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovpORupikLinJYNLaGaWo8ND9g+4q/fLfviwK0w2eKs=;
        b=MdM3807s9D6qJQIUWSglHuoeELVoyWy71A1vvbSeln87aDxWoSdLLn5nnITdy1VAk9
         VRZmirHKKbbbdYu8I+1/4/AVVzbk/yWkyetsgwjNvF9jvmKMgBXThnqUu91LgRQ3G0Lt
         6styym/3aTp/J0KJXPffSPz6Y8A1ainb21LfgFSLxjF2vhCGmX7/sKpjnQd9Pp8pym+D
         G34BxhigG3/+SriOVLkPiQfloGrIxDttayFKElK8tt8eEEVz6LJDhYv/QSUbOC/jrPFq
         NjAkQnhQJTr//Yq/AtmFabprzBy2ZvAzEXJK79lQccQ66V/dBXILQRotYTk0yEyzSrvu
         80PA==
X-Forwarded-Encrypted: i=1; AJvYcCUGlPVP43J4eYVh/CQBPT0pviVnZDianMift5FqdwldBg5hLm+5MExD6BZzFV0Pzt5+ngQca/jQ77YI@vger.kernel.org
X-Gm-Message-State: AOJu0YzbvECF33iCUPHV10ggMw7JYyyQCrttqXik9Zh0HU72hQdAUc5H
	fR0Jaeq3HLbWj+wCAKZ4/uj4Q5cDZYNlJkBdmysH9vWUjMEjAu8iHEW/pyE/29nB
X-Gm-Gg: ASbGncuHQkj95jgp6sTCxdEB1pRd7WMuyCEICmGqjzb8LcMR5NQK/TcMbcBGXvuZetG
	fumD+M+faQv6JFMuY/S8PrKmsG49UUwxPbpgq6KPsdeVqSJIDj97ENaXUfa8WnN8pjjZz8MkiID
	QwLkBTUJF7cLrNN0fUMgvkNlO+kyMjFrngjcJyhYFBaIeOrm2RIpxkaUpcs8h7E1EM04RbyIRLH
	4g8LIVXttJdBsDxQBElZ5Z6tK44lvW+4uuE0S4BVid8eHA2LPqtZuCMbscwK0BQlLw1iXPP4b+i
	kbeOVfhGrWvC4rQV/jjTMlRgM3MXnSjGD+k+n3hHumYEIkqIUKpbsPDWr91jlbH5MCMYIDeHdch
	b9Wscba50l7Xw6SD+yO/h9dlY+gfTB130Xq0PLkm7gBbZPO62Ghf0S+784Zv4
X-Google-Smtp-Source: AGHT+IFZ2W9qmb/LKeSdTF7hv6Vw1Ed+QYgpGYcKJo7KxhEO8nsdlq4wOJveEMhsIAldZsr8xoXL1w==
X-Received: by 2002:a05:6122:8895:b0:537:8017:b9d4 with SMTP id 71dfb90a1353d-53938899aebmr300941e0c.3.1753950308382;
        Thu, 31 Jul 2025 01:25:08 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f345f9dsm270041241.8.2025.07.31.01.25.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:25:08 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4f2f2f22c1aso366254137.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 01:25:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEl2CQMDHpNTEdwzY1vP5TCJk1rOz7yGv5uuG8iVsfUsWtr3QkbP5eUuI0R94xj2TTELHvrMMLQGty@vger.kernel.org
X-Received: by 2002:a05:6102:6213:20b0:4fa:3f49:a3b4 with SMTP id
 ada2fe7eead31-4fc0fe5912dmr276662137.3.1753950307895; Thu, 31 Jul 2025
 01:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731062129.572912-1-lijun01@kylinos.cn>
In-Reply-To: <20250731062129.572912-1-lijun01@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Jul 2025 10:24:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0EMrcRnxw3eUY70MUAZshmZe00G2g11FCJAT473x4Xg@mail.gmail.com>
X-Gm-Features: Ac12FXwokQZNttUlurFowE8BbCY2YMwNjb7XajneS7IKLUZ2cL1cgq0Amm7pN2M
Message-ID: <CAMuHMdW0EMrcRnxw3eUY70MUAZshmZe00G2g11FCJAT473x4Xg@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix macros coding style error
To: Li Jun <lijun01@kylinos.cn>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Jul 2025 at 08:21, Li Jun <lijun01@kylinos.cn> wrote:
> These changes just fix Linux Kernel Coding Style, no functional
> improve.
>
> -Macros with complex values should be enclosed in parentheses
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

