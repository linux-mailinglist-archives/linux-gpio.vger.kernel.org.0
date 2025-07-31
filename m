Return-Path: <linux-gpio+bounces-23912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEFBB16D89
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 10:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609E018C6594
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 08:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B00529DB96;
	Thu, 31 Jul 2025 08:30:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F2C29E0FF
	for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753950607; cv=none; b=E4i3EMrTfYhS7jisJ8IyfpxDEGNMZt4bScYeqUEkkm/G8D98mXxwBdSN5I3mapJi9EH85bmr1a8zPHOo0xSq7P2W1CAcLdwzHLGiRx03NH1pyFnAtqhHUd19kBz6ffiaMWMWx0v/gruz1brHG37aA6ydu6qeZsETwdR8CXsnL8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753950607; c=relaxed/simple;
	bh=Xemq1QJKLUDrkdJ+Dajea4QZHrDCwiaul/lH37ExobE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpKJKhnjYsFIzl1Rx+BtlOGsnAjSyPdpkn6aIAHrArQ3PoEGiH8XodHxP8j6HXiuh0ehq+BGw8CXiIlswqr7B/NftpqnYle8QhVs2r7gl/Rwd+oQo0mc+fWRCvb4mMoy8clFQCt4xQb8GK6fAixXWAeJ7KVPSOzCCHLGv9W9E1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5393776550aso67368e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 01:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950603; x=1754555403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3p92ysKMVz4YffRfmK5dylLM/J8s0CFG9hKBO8UjY4=;
        b=YVHrvvOgUsTYrJbCCJ0Bj+dLOUMS74Ui9kqRWWtfA+EIGDIQt1oJD3a4bomuvFcCUF
         w2Qp0WjFljBXkJd+flKHOEOLO0dUN/aaJPMMKooQCPu59FkexpoCoaclGmTOsblhdTze
         2v8qKLK8Dsgmt6KjvBoVWzw6QVuon52lSdDxYC/pwCaH1diDuj1Xlx5n6LFz2s2ohfVn
         8q9cXTISizajTxcbJgafgfx8ToH+a8mweYx5ycCNcuMeMaHhTQz2QHD45warH8CRf8Il
         bzmhAyrDi4blWqBfL9F8iz8zGNt+ieewhDoXC0zmPlphpswAXQ9Fk31wujZDYiEwtiIz
         Sc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8S6vh2nKMuBOVfT/adYpY1af6MF580+MXF6MvSldJW9DYPYwUjPQD1LZFTpRCliZyrz9ingfJwLop@vger.kernel.org
X-Gm-Message-State: AOJu0YyukEzWwxEDL99jvNMH8Lt+RSuIFLgTgEIDdvKyrYIht2ZqYL9J
	0sS4PtCiIouIshvPq9UjxG/Bd0JQITbRUVL5poMuK8kY8o+sNURSYf+cBRgIcAFw
X-Gm-Gg: ASbGncsJcqrGonqR0CybqoY5uUPra7MXZ8f6Acb4lOT/HlMffpD7UudKFElzczCefO7
	6YQtaR4lHA1UwTE5lO4r+8JWiqUUm8bTTkfQsrNOYStwv4SQhGE/tO8BEnGB8l8ypIarywWiaAa
	WvBWj0wtn2Mk/0/MvYF0hzeLvgpY9D7ylGiI4qLWnihdGFVtTet+G8uQAYV48NntUyz/3y53/Cj
	HSgxB5owP5i6FtfrpzZY0Z7CMC4vq+e3MM+QayNpwcAuaLUj/FceS4ERiDQ18zGcQ6YXV+J/Etg
	inFhljXvVjii3oOidTEn314PA3vitw/nQR+GxpiXMOGjvWMM9N7EqOxZFtKNC1WvNzu+/nhn7Cy
	f6Dwnr2umyz/DBohhkKjSzHCX9K8lGTfKheb/BfXG6MSTlU+BZFiVfDYO0DnwQCzIRQkQwmA=
X-Google-Smtp-Source: AGHT+IHA0Nnvl79P0GtVCnmd+bk/+aYXS8S/3ZevoGHK1gfsNBQhUmVtXoLcizHJN3YYlcYfxb2aXw==
X-Received: by 2002:a05:6122:8ce:b0:535:aea0:7a0a with SMTP id 71dfb90a1353d-5391ce97f02mr3914041e0c.2.1753950603474;
        Thu, 31 Jul 2025 01:30:03 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f3f0291sm272690241.16.2025.07.31.01.30.03
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:30:03 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e9b26a5e45so125217137.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 01:30:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtTj2zRG+BQPC+PjahNDhNLlBlSkrfWl2XUDXQwriYvt7A2FfhVqDo/9KgIm6oia7aiufE7Q4KjL3e@vger.kernel.org
X-Received: by 2002:a05:6102:3e06:b0:4f3:36bc:554e with SMTP id
 ada2fe7eead31-4fbe8766f7amr4602633137.16.1753950602891; Thu, 31 Jul 2025
 01:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731062129.572912-1-lijun01@kylinos.cn> <CAMuHMdW0EMrcRnxw3eUY70MUAZshmZe00G2g11FCJAT473x4Xg@mail.gmail.com>
In-Reply-To: <CAMuHMdW0EMrcRnxw3eUY70MUAZshmZe00G2g11FCJAT473x4Xg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Jul 2025 10:29:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUB=kkcWRHSc0NEaXSKcSC03k1E6Mu7wiL_rvnct5jbBQ@mail.gmail.com>
X-Gm-Features: Ac12FXyszo5PlTM1eapwArzj5axMVwW3uiqrTCu-Zoj7u9mj9HQUHqc7n_VEv_Y
Message-ID: <CAMuHMdUB=kkcWRHSc0NEaXSKcSC03k1E6Mu7wiL_rvnct5jbBQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix macros coding style error
To: Li Jun <lijun01@kylinos.cn>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Jul 2025 at 10:24, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 31 Jul 2025 at 08:21, Li Jun <lijun01@kylinos.cn> wrote:
> > These changes just fix Linux Kernel Coding Style, no functional
> > improve.
> >
> > -Macros with complex values should be enclosed in parentheses
> >
> > Signed-off-by: Li Jun <lijun01@kylinos.cn>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

s/gpio:/gpio: aggregator:/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

