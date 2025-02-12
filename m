Return-Path: <linux-gpio+bounces-15868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6CA3290A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFD043A560F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A282C211A13;
	Wed, 12 Feb 2025 14:47:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED192116FB;
	Wed, 12 Feb 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371667; cv=none; b=fn4EfwXE8o9C29OEkueALhE6iB2K4Mck7hXh13hBkvTtDoo7ShPgEzwQEyEK2f54LbhmhCxz/la1WIIg8VJSQ+D5SYjqI/IDCTHKwPJiAD+sJKaCa9BSz4FfTRTw9v39JEhJGj0G83iZ9NIZCEs8KTaW5kmCF3ekAHr1kNNStqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371667; c=relaxed/simple;
	bh=tk/vmlhAI+qMeOZsrOxHEyW5xsEyE6tqWlKGnrjJMXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbS57huWyKVd94mJBgpsPvnCv6FdGdj2ClR5zaioSGbPFTlWCaVbnk/B+HZY0rEo6KmNBDYMlL7yC0BKdfYMvIFvWMH6H7gUZfbY+nKwMoAnSdGcJZ0F+DOksppPlH3RtFR4YyJAiCnHL7GVnP6VINZTSH2SghO2Zt95wgikDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86715793b1fso1279888241.0;
        Wed, 12 Feb 2025 06:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739371664; x=1739976464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki9NWMoxOc/6PSeV96Jx9sM9blTYLQvhD8qv2wzYXRk=;
        b=gCkfh0IAIE3Hz+t7kkJnHs+vNFKP7RFqEb/ZdS1WLnx4o8p9ue1Z4ZCDFBN8wZLXv6
         SVq168bAI5pjVEJVjS6z2lJEDNM8nkAt8ptwqWZbyOyXNpz8VfOZduqKAMxdjSVkorvk
         8zqAhMH0ZI8dNOhpF6u2j9c8TzkFo8bhC1ZnR4XQ7YLVaQw3xSw6nF5MAtDiG8HHgbPP
         Bg1XZMAfg6mKM2+U+kxR9o843ZsK/pCPinIJYLvVYj72aFjtTgmO3H1tD9BNF+Hq/yVU
         XLqqBcUP7gHF0Q4orb57bw9t9eTuogWznH9SGder6OyisbFVP0pnIZIx7P6jCO+A5v6u
         YipQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/P0ek7RxsFFaf8e8SUhzaCKWNGlo+aiUQm60UHbnDkYnwavFrfh9MwnlagxOy9oC7HK6CKQ/27gJAclc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR1+jaF9rf38Mzlhkw6TIYUiR4WHF27twrwh08EYzRjeYwg3x/
	IyLIZrATN+gpnOTg3sEV0aJc/Nu/c9TXtsj9ZC/L0J4bztjYukLWQDqRT9qpUk8=
X-Gm-Gg: ASbGncvbcUpTFzSNDOHXWDAcax8HnYRHveDxkS9sucqJNU2NhXuPTHOA+4jiXwcM4cD
	71RFxpxo651hHu+e+s1ZrBr4GRW0QjlSdWdIF8T68b3lHAVSRW7aefx+OWLWoCKik5pTxP8nxah
	nafZGQneBV2xWhUBw+HIpXrLaJzKzEfr3Q5/8g3YYIbF10EoLAPGpSabYMHRu40PJ+K9XGH8WM7
	rvS2IMkpqiw5O/dD7JlpmLpAie+l0f+fEZyE3dRqZqlQDFNpD8rdLuJ1PMwMXVXXMJPYAV53Bmq
	J1NdDzip1nsVGY9qLO2nMdM/eJltLa9zZWQHJ9CmpiCmLdabwWwBAg==
X-Google-Smtp-Source: AGHT+IFWUs/+FrqPiTMHPNi2WN0/tD2LrS1c+/FQ2SRf001ORPN8lBmM0vdWkoNEqPjlgWmiL7qI4w==
X-Received: by 2002:a05:6102:1514:b0:4bb:edc9:f94b with SMTP id ada2fe7eead31-4bbf216b15bmr3561082137.5.1739371664236;
        Wed, 12 Feb 2025 06:47:44 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9636904sm2312862241.3.2025.02.12.06.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 06:47:44 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4bbeb009101so518043137.1;
        Wed, 12 Feb 2025 06:47:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNgfGeUZGHZt6QswN5xw3IORQ3mCA5UjNq+mZQNrX6vgNXebHn6af5fpsnAYK8UK2zusUtKCA56qmaqOc=@vger.kernel.org
X-Received: by 2002:a05:6102:1606:b0:4bb:e36f:6a30 with SMTP id
 ada2fe7eead31-4bbf2243aa9mr2752174137.15.1739371663714; Wed, 12 Feb 2025
 06:47:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-8-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-8-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 15:47:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaj7Hs6ZpfS=9xNw+WUEiYoWa4B6a4HbvoRfZStJxDSg@mail.gmail.com>
X-Gm-Features: AWEUYZnq-RLpxTuHau4kfhcycRN6kwEa_Uf9PNR5kJZPq1AzpwE8mFRJl9Qb48Y
Message-ID: <CAMuHMdVaj7Hs6ZpfS=9xNw+WUEiYoWa4B6a4HbvoRfZStJxDSg@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] gpio: aggregator: clean up gpio_aggregator_free()
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 04:14, Koichiro Den <koichiro.den@canonical.com> wrote:
> - Rename gpio_aggregator_free() to use the "aggr_" prefix for
>   consistency with other functions that modify struct gpio_aggregator
>   internals.
> - Replace four lines within the function to invoke aggr_deactivate()
> - Move it to a more natural location.
>
> This is a preparatory change for the next commit.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

