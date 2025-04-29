Return-Path: <linux-gpio+bounces-19478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A751AA1C36
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 22:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1664A6F3A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F6A2676CD;
	Tue, 29 Apr 2025 20:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfnUx5l1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586171B043C;
	Tue, 29 Apr 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958629; cv=none; b=VlBB/3ZjILySnvpmaBgU603TpqIstWeXmB5SUGG6YyUF1K02Lf4e4CDrRWv1/GbPsKIufpMmrG5DZqNHGEbWtth30q7lkklXgeREF2IRfH3uapAmyuJKzYI8mzWip1vJs/jXha5NMt8844V5oB96l+oWCOZ961RfQFvjEF2jGGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958629; c=relaxed/simple;
	bh=QIDDEQs1Gmfq8nL4ROK79rDLFy3b/ikbmtUTE8FWJAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnmE4Q1DmQxRZJMr3VzooZjtfw6SFoA6nuKvM7gMy0qCGyzGi1vhiSTnNjwclG/yBLfzWYU8dcjRyoDyK6rWdKfDbHAbo2q7y35Epkb/M8eBAaTmRA+ys2K2REk6bpUFyi58Ntp2T3emXEV/m8F9UH4cZjfhThzMzETVpMfXTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfnUx5l1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so455952a12.0;
        Tue, 29 Apr 2025 13:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745958625; x=1746563425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIDDEQs1Gmfq8nL4ROK79rDLFy3b/ikbmtUTE8FWJAo=;
        b=VfnUx5l1SUiRL2L8Icfi/NK7Uovllt/7SuTVuYrpwbC7W/fV1TvS/gALUTLuskwnii
         bQU1WyiAfY4C8/BoRBOnyQXq0NS+FoZ8YZ/TpxXyfiH4VgoKLC9S9zxYIX/Oj2NWSBzm
         m1gCl+MfAQirOhEZtPa5T8hgqASdh/dcDiKk1Ikwm3j1LSG7k/w5eVb7fjFRm+eHvqPf
         4DHaTusWkb3lkbyybmvsXVuBlXVjX/VqaTXe5iZaUcbVSbXtMvNAFk+SIEocz1f+cuyX
         b/sJOSMIg/oWqG+xgIJcv9mx561tOK5HyBMjue5VAJOzsuDjNLx5OOTwseXG3cXet2pN
         Ldmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745958625; x=1746563425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIDDEQs1Gmfq8nL4ROK79rDLFy3b/ikbmtUTE8FWJAo=;
        b=FKIZU8eNO7R1KBBTmzLPTpwGafn3h+ABqWU0YjFhEz9iMd35xPzeA6kKM7a4COB69o
         eH6yIZlIlDkmw3aybHbzOEwnCf0OQJxwM6XDd9gOJYc3b5kdKQ7iPoO3DuRZc1DAXNCh
         h5/mfKDzE8EVW6tlRkgIMEflMCdDjP5lWZMznVQ7nQOQRKWPXo60tDQcfhbW2W8qwPGM
         hevEDCwE9nIrf825SJiXBUxInGhLjY8NrWsa8Tei/jnaLX6hU199cB3wm2apB8bmdwYX
         usmWfDvFmI+w6BHzPvbsSCBfmPy9GuLzUVRvWtJ7+hMXORPv5jPOVoxLPM/nnp6l7kQf
         p2lA==
X-Forwarded-Encrypted: i=1; AJvYcCUS+5MYWzEyB89iP2Y2YB/OgYIvV0XtjOdE/SemCA+mzEaRBsFOrorWz+sMtbDGRnG+79WtbfBlqNVVJPKa@vger.kernel.org, AJvYcCUuR58fL9UsRZG8LTiT2GuPYISjwLHPKuNRl1yGbMvqC5H8JBzbPItxJ8XPmZGnxW95Vms2yZNVt0if@vger.kernel.org, AJvYcCWK0vHt10HWLoW9A8PsL99zMmLRkJM61srsCQxHvaX8kxky8+8x2D6Q9zbyNx4s8QXwJDoSLw49LVIkRbqG+luN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3jjCzpKuVhgYKl0p9EW23PRtRBGzLlIjU0MMwh+hvqXfqLyzg
	lyX8JW3RPKpApzLEPr1dws7i3b4lnKPPuP/pHpAoYe3FtUsxY24HXbqCWbp1GvqcH1NiB0MVUVK
	K18bWjOGTmFEsfLUVxxmDE0oH0I5evy66
X-Gm-Gg: ASbGncuxqOA1pcoeOdv0VML8L//FfJmd2jNvoZLc+9FE1Z0JPBhugOroAW1yzwWQqWt
	Z/hKGp0tg0IT1k6ktkQpd04FcH8Q1atKR/Y/yrUSpsh45SP1ygur7e1KM2GLiv7vXKjP90ikBRy
	4+06iHYzlKXJaVjl1QD9OjB83YhCZF64JT
X-Google-Smtp-Source: AGHT+IFZ+tPuhr4u0amL2o7GidiSohH6Utv5H0SUA5jmFzCgFcP74FND3D4ktHuU5vmLfiR56Xoev8wi90p9wd9PQ/E=
X-Received: by 2002:a17:907:d64a:b0:aca:c67d:eac0 with SMTP id
 a640c23a62f3a-acedf34991amr31962366b.0.1745958625432; Tue, 29 Apr 2025
 13:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <CAMRc=MfpE6M28P6jxFgs6K6Tf84LRhmaw5U4s8WgciF815M7Bg@mail.gmail.com>
In-Reply-To: <CAMRc=MfpE6M28P6jxFgs6K6Tf84LRhmaw5U4s8WgciF815M7Bg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 23:29:49 +0300
X-Gm-Features: ATxdqUG081dIkUKH47U4BcogKwVitG0L5aZWFuMYNfSzSFmwm44JDwqa1h18v0o
Message-ID: <CAHp75VfkJAG6EKf94NFKVKRgKiRKxB7WER_UXcY7sGMOqA=YNg@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 9:43=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Tue, Apr 29, 2025 at 4:08=E2=80=AFPM Thomas Richard
> <thomas.richard@bootlin.com> wrote:

...

> This looks pretty good now. Who should take it - Linus or I?

I agree, but it still has a few issues that need to be corrected.
I believe the next version will be final.

--=20
With Best Regards,
Andy Shevchenko

