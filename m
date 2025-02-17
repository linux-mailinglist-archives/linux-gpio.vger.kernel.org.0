Return-Path: <linux-gpio+bounces-16136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBF1A3843B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 395B53B7194
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C46821CC6A;
	Mon, 17 Feb 2025 13:08:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89AD21CC59;
	Mon, 17 Feb 2025 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797725; cv=none; b=OC/X6sZrVzJFeQprXR/eXmV8mLaRHmejbfVNq1CQPOWThVG7b7wSfKXHp0wiuBUdPnXDK3tXeJC9BVoqFRkWVEMsd9UDDrlqzZpMJqQQgVN+O8Y/7F3BO/6dpI/RfYVeRmSMTdzea/trIZTcSsNBmHZeZtLo/jgbsc/sf5bfDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797725; c=relaxed/simple;
	bh=9itlMG4VipCqg34LawzjG8hG6gTShShEatPS4xcWCdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFLKJ6BcnBnTaUQ6t1Aau+rDe6aU6GIwh4JpzPQO0mRc2gH3HOgMXtIkKLb8XMZ1iOfx2RIHQ4A1MBlk290LME/ydGLbpH+SM3RenO6lhzpCF4Z+xNOHhugzmycNpvOzr/sT7lxOBEghYlXdzZnCMofIiFKNlUUuRZxCvUtAlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so3130353a12.0;
        Mon, 17 Feb 2025 05:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797721; x=1740402521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsQsq0G6kuOvD9LC5dEILUwIa70vql8OQQH1JFjxz2c=;
        b=RU0/icB1pWaYNs3sEXDRkkncuEa3wf4MVPVOaXdN/eeD2YtSub1amfCH2J41Iknntw
         DyyGHeWFcQB5WbEWYny0fYrva/FHtqTjZ9rFhmKRG4cjpEGSeIhPRmfvvybyorCDALZM
         mA+7WljjnGFNBHF6lMihRbBQYbX08s0OfI+Mr9u/JfV/MdcIVOy4lfLwGQEKp4nWcCAe
         LTxZ3FBFFGBsk8Ww03yEoD4TvZ4pZ1KZdJOflHQytRB1GiNV4+aE3jwC+nJ4avjq99ca
         M30fEm88zxnWjPf7OPsgo0yoP9XhBZkNWzOK4BG0B3wfwUzs8xb8/8v5OJIJYLDJmhcY
         WFjA==
X-Forwarded-Encrypted: i=1; AJvYcCVQlubsV/7RbGYayYaW2pbrRVw5Fq64R3jFeNfCQi02sbknSBFraekpEHKb0RmGhVV+UBe2KZU2NtNl+aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxciYy2vSejVo1UL+1KxTt3gu4cGGC79dDXaPOWuhPnetfmvjP
	swh8t8jz7Hi8oHjdhCSJFJsLBpyfDRlZPbPCoweH4SWWFfbNIgnQKDdVdLeIc1w=
X-Gm-Gg: ASbGncttI18GDvJt7EE6VFUVoFx7aNZggx0p2AtVv3+lN+WKrWoEhzzB5tDWrkoCA8u
	m+YCG6JIIIZpAtlKOiq38qSM0pMCLDCx8zkbPF9YNQVVhfnzyPQpwQ7c5slyfrlVsgJPbUuHuP6
	8Hz8GWaKpNTcp9nnqLMcz/cwPqpegPV7fb4VQY/hWhR977O34+2uoynmQCEmCZvmc+CVm6reBQW
	5xhSuQfa2muDSgZ8fAd0nFt3p7LNKm6kT5PAn2xFYVQCA3j7AcfWds8sFSCxslXBkRKpGkgP9L/
	V5vH3TsBaEQK3fKmmzTPIkUCXdmh0suxLVbDO2HmaCQyRS1cQ4yssg==
X-Google-Smtp-Source: AGHT+IFvlPB05okv2zu7w/TQpvCyUhsivVACxjX6U6oRWRXGSZTIGl42nOueR6xqiwreWKhS0VE6Jg==
X-Received: by 2002:a17:906:c153:b0:ab7:c3d4:2551 with SMTP id a640c23a62f3a-abb70dde461mr1014877766b.33.1739797721038;
        Mon, 17 Feb 2025 05:08:41 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9c9b653bsm185902966b.166.2025.02.17.05.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 05:08:36 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e05780509dso1563050a12.2;
        Mon, 17 Feb 2025 05:08:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg8BqgLRrjJ+UXB/NOryQ+NmgLFd32dnME7qrIkdbSUpqagTxt6EUyjR1TV/qBUfybUs0XeunLOuqBjbU=@vger.kernel.org
X-Received: by 2002:a17:906:3895:b0:abb:b209:aba6 with SMTP id
 a640c23a62f3a-abbb20a31e7mr6274866b.3.1739797715966; Mon, 17 Feb 2025
 05:08:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250216125816.14430-1-koichiro.den@canonical.com> <20250216125816.14430-11-koichiro.den@canonical.com>
In-Reply-To: <20250216125816.14430-11-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 14:08:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZ54GJupQc2nz2nh7Myh6eUdwJw1+90smRuVyuJx9PPQ@mail.gmail.com>
X-Gm-Features: AWEUYZn1fYz8cb1I-zBku3cHDH6DyyJZWaZ8UgZkRlG7QVDNpRfE_L-suKnzX8Q
Message-ID: <CAMuHMdUZ54GJupQc2nz2nh7Myh6eUdwJw1+90smRuVyuJx9PPQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] gpio: aggregator: rename 'name' to 'key' in aggr_parse()
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Feb 2025 at 13:58, Koichiro Den <koichiro.den@canonical.com> wrote:
> Rename the local variable 'name' in aggr_parse() to 'key' because struct
> gpio_aggregator_line now uses the 'name' field for the custom line name
> and the local variable actually represents a 'key'. This change prepares
> for the next but one commit.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

