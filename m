Return-Path: <linux-gpio+bounces-25911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B68B51AE5
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 17:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A163B60C2B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 14:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C811832ED35;
	Wed, 10 Sep 2025 14:55:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9332CF99;
	Wed, 10 Sep 2025 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516121; cv=none; b=Hik3rQDxzTCrpilb2oVOI4Jkare59HonCTLnbLLfMGkkrNiD/QclU/cF4LTX3SwcHPclqf+hHreGrEBxNdG/VPsLwNW+UfOFX4lQJ7kBVvP7nyDzcwl9jslFA0EfYBnw0vdVQ5guv0HeXEZuIfcrrtNG7/eYAEx5zKdRc+lyHmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516121; c=relaxed/simple;
	bh=5af/AwT6KfNTGqSpQuQ6FbWKuFRwcE7GyNykJbk1tqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QphENvEQjQit3JiN/D84jrbjQ0hHDGOTmzfM2KVh8jgD2oqTp79T/bhC4W+VlY7RHrGN+KAXXHQXabaSeWel7PMzuYTa/F95FgcyyPOk9GjGok96XueFa9Gokoe8yLXBVb7Z2liNyLGxgCMfqIJ1Zh1UEMDXU43WCqjFUhd67J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89018ea8f7cso3480724241.0;
        Wed, 10 Sep 2025 07:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516117; x=1758120917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//DRGGSnwpkitx6kcZgkAF5a1sMaJ0M51j+GALAjlxM=;
        b=F0UHULU+ftwVTarpB6pBH27tLMibh2N8owEAmst9qVEk2kdK9LWGdvBmvc10aBxMvg
         phQK8KvunX3YjvK36chl2dRFOp1xkj1qEW1Z1bPfNDFFXH+obswIXz7Jf5K+T3nR4IrN
         O4BILVCn+bIlKeGsG/euS9QnrJqMA6+WlptQyOz4UTa0o5zmzbzyd7dEjG5Wh4+rKEmO
         OaB5OoG9ll2e1PaBx1vbUoRlr+sSRLXHG44xYZrI94RDPHrXKEMtaZmwwt7LdcrNNmYR
         gcRqmbcTFKfZwHQOufU8yVL53MUrJmrDCqOwpZ5iDww4RYmm5twsV4JICwNwyFIaU9cF
         +mYg==
X-Forwarded-Encrypted: i=1; AJvYcCWxlGUnF0c3hnFvd1twMJuqh+j4A5WmIXq+lY1+2vuJ3AFLzek12KtMfgYxlD6JKOMlAgloNO8oByb/@vger.kernel.org, AJvYcCX3jYPqtr/rO5Q3TNCIbTVR+fRf0e8XyfbkW8/NM2xrhNtlSP7sAAaXuFvv3LBO2atlwzNihbKUwSlBsxRz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMkBbua1UiL2tfAMmVu8YmZuv74oRx5bd06kGQdMbcKuiXZYu
	TA/l4zG2UtQCbAi5osPSsy/Az9izxgSI8Y1ea9GCs5+wUeTH+vYHuJDXD+DcDKxP
X-Gm-Gg: ASbGncueg6p+ADMsQK9qo1t76ptuF/0hI9vbjnqJN/GiNx35MSqbqo6fdCSYUoRwqw3
	OZwJlrLxbdi8y6YFQL741D1nB71l1ApMXhhEf6uHHhE/sPgGKab46A7QQ5iHIH80RyUf382GTPe
	U3X2dulYMUPxOTViYYSua309mwZtCVaJaM1DVgrRcB5WM1KeGKVKCqHYOuhr1eP6msDrQRw2wkp
	VVBQUxyEl3sfp76tud3p/zzmZ8pBHbOjxABFhpNOBGTiv+BdZPD9DZisB0aJ/bzVNAYQdApT8Sl
	tobjuR0XaYgL6sJLmpRvuP52rIYOXUTqaAKYwzBSlnDkK6F0sbOz/x+jgxB2GTSI7U5JYsvgDBD
	+gFmQZD8u/4JHn6pC1gKhxCLD0BUejZKCtY2lhP1gf3tT8mHjxW5JDyG5i78n
X-Google-Smtp-Source: AGHT+IE5RoLjIKIdN3nGMb86ZwjWs5trEFsksKaaKo+vMe0IY7zKi7TsPzWVuaJYiCAnnLukgQpCKg==
X-Received: by 2002:a05:6102:9d2:b0:526:2d5:6c81 with SMTP id ada2fe7eead31-53d1c2dffffmr6327494137.8.1757516117472;
        Wed, 10 Sep 2025 07:55:17 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89610ad6f9esm8721372241.5.2025.09.10.07.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 07:55:17 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5330fdb9723so3354279137.0;
        Wed, 10 Sep 2025 07:55:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkZah4NAG1R180v7wIp1Vr/b+r2rS2bieXhLPqF1ij8K1EHgcZ2pH575czqUZSEot9JpHwyjNnWTcOTvUl@vger.kernel.org, AJvYcCX4S9X0cPPMk7PSTr63rDRDZ0bVetmhcdgFHsHr96elVuPP2UEbmWcFU50se5zrcEfu854RLVCctkXu@vger.kernel.org
X-Received: by 2002:a05:6102:2923:b0:523:d0d7:b963 with SMTP id
 ada2fe7eead31-53d218dd0fcmr5047036137.22.1757516116296; Wed, 10 Sep 2025
 07:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu> <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
In-Reply-To: <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 16:55:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>
X-Gm-Features: AS18NWCYkdXAqeWrylTZ9OIziMkwB6Yb1TrV7psXDt0AcVru0xgJTTJ049UgE2Y
Message-ID: <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mary,

On Wed, 10 Sept 2025 at 15:24, Mary Strodl <mstrodl@csh.rit.edu> wrote:
> On Tue, Sep 09, 2025 at 09:32:09PM +0800, kernel test robot wrote:
> >    drivers/gpio/gpio-mpsse.c: In function 'mpsse_ensure_supported':
> > >> drivers/gpio/gpio-mpsse.c:211:25: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
> >      211 |                         "mpsse: GPIO %ld doesn't support %s\n",
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Oops. Turns out this is m68k-specific weirdness. v2 will convert the
> result to an int and use %d.
>
> I'll hold off on posting it because I'm anticipating there will be some feedback
> on the actual code changes that will need a revision anyways ;)

Please don't.  The m68k version is wrong.  I will send a patch to fix it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

