Return-Path: <linux-gpio+bounces-18094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E106A74D1B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 15:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304103A3B2F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 14:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374A81C4609;
	Fri, 28 Mar 2025 14:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEaxdXBM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F44B5AE;
	Fri, 28 Mar 2025 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173305; cv=none; b=ZFW5c6kxPsbof/mEA/9An6/0hD6PCCOtPimdtbyxZJpSWOZSRbH0TA1Zs0Xy3u0Yz8zq0sFb9rqlfU25JS/QWEKUgy65mbvCwUGGb2u+vy9BxvfzOOHp559TGtBoYo9s0lR1H7U6xGLJITQXOfOyqBYUw/2lpdFrVYXZiNPw3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173305; c=relaxed/simple;
	bh=W7R2gZBzWBuPUH9E8mLgn5iH+bIAruEwVlJhbgs2hj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEXWsR7BsE5eXukrP97vKjW5qOSkyTCQ9GwxpjeBYxgnpmxVOt6/UTECxkOspsKvdEhZkVtkSlNLbr6uLPUYTQzHa5/NuSU+kkSvMI1UyIyhIJamOtt//WkaMEikbQq79wqtulWduS8+M4PEedgJ9T7Gl+AApItvBNYNBiZ6DHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEaxdXBM; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523d8c024dfso923280e0c.3;
        Fri, 28 Mar 2025 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743173302; x=1743778102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7R2gZBzWBuPUH9E8mLgn5iH+bIAruEwVlJhbgs2hj4=;
        b=fEaxdXBMHI6Tya/9qDx2dRPCnIa6J43/9+EYLLDgHFQl4qMspEClgm4llYgrSYCLGJ
         W5045Coc+Nxj4u9xoaibYQRHpCS5yOlCRT5D0a+zy0H93V98FxNYgRnjrCoqKfQIaW7F
         UW8kQ8fWSilj9tlU4iOGEWwsnhch+Ed7PAqMv6CTAheKiwgLGG9cmK3fQJmnPNvCnT5I
         zaaa+Nb9ow3J1qBeTvMX5FWsDYJHr+YgTv8MfGakmV9NFadm4gI7RFtnS1BC+GReRniV
         fvKzq+OTRnSG7NDFN9YmAKnQMaDOBCaDfahw6FKeWFwozTwm+AqvK2ALzydRByLw6+oI
         dfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743173302; x=1743778102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7R2gZBzWBuPUH9E8mLgn5iH+bIAruEwVlJhbgs2hj4=;
        b=WCeAk4xT11R77IAEwAQSa6BXY//9OBH226NmljWzizNxOiU+ve3TrfaGDZt5uWngiD
         bGCaNXQ9KEF1wSD2JU8OpTiFysB4eY1qBhc7KcgYUDuGVuqObTihuldaeRoM7mAP7nSa
         zRe/CRUKVFhj0X3+g8P3n6+K/iSmTKVvX0tR1bTNjv7tl8jMecF6xYYheaHCt+GXDLE+
         Y6Kuaj6jKVhyHaVtmQEroU7MJC5vVXQ1Hd8k4Yv/RCLKmizn00Dk7Vi35eYoGTSbYGTn
         r5Q5ZhfqcYEW6DyF66Lof28d5TpmoKYd1lAdm5Que1qwQb3A0KUWClgV/g8tSLLm/iKm
         Geqg==
X-Forwarded-Encrypted: i=1; AJvYcCU/MxYVvYwHHH7ylatz19DBBUk/LOI7UwgG/VnvXDsgCQH20lD09MAA1jTAGQEYtj09M6qVkkwEGNTrxv56FhdlME8=@vger.kernel.org, AJvYcCVCMSYro1jl0cubRDemWmCCmHqmOUb0Fiaarz4b7bFBFrgX/TC+dkuP2x7XD88mQEA8maoUyUxHT07JJUM0@vger.kernel.org, AJvYcCVqa8pHK5yAP/RQIEkWwx4W5IHN7h1ILf+ZY8ju41XJVBhu/mEyyUYrO+uZC7jq0oedttB63JLBxJCf@vger.kernel.org, AJvYcCWUcwOp3V2FoHnL3uCkJs84sLYS3AIh0oia/CBiCX24cXVW0uwcs/5sp0x9OSlN0Qoc5SgcqXTUQLm7@vger.kernel.org, AJvYcCWblTKUnNgDNy1B7wPhGYP1y7tU9vDv9KMK/ivAtR51cHZBcy+xrbrypmN5B8VbqKbttf44mIiElYr6pC40@vger.kernel.org, AJvYcCX1c5iRtkyqo5+J735TLwPWpnmMl9/iqSGyle9+yWkMjX7wuCUm24R/To6JAPMzi2uhgHFHOpKQ3obJdw==@vger.kernel.org, AJvYcCXK1vO69tmDot6oBABiI9wnTuRtpyo+h9aB0GAN2D7hve63lAN5i8WndUwqcWJosOdLpOJ7AMi/luAR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxexab2UG7SJk8fSFORMVFHcMuiSBZa3FHctQU8vGx8ollPlEHj
	SkoQdnQu6Nj/Drkbaqe+viWB0BtKleHh9zfABZTDdsD7DGuOFJGZNgnoO2KP/hn5BNi1OkbOAXY
	giEjPO+PTbMGzqWkyzprnIB6smus=
X-Gm-Gg: ASbGncvRWMIWeYlOrH6aozR509CIv2fZtbrGmAQY/8kxQEy8n0c6HBiAYgHqTyWa7qE
	oeE4PjyGGdaRsQfMIWf8kXH7LVqqAdrmskPSUefkqEjA4o1oPDYL5dh1bMYRBBsz5Q08rXhPJow
	zx1zDHtje2on759CpWaBcDYWUyII+9560F1Nwz/mIXmZDV5MoF3+mZ37hp
X-Google-Smtp-Source: AGHT+IHouldgTyP6Q/w4w6vBsXV6nSeyEMfHGqZjhRlDBBXFbUfgEyb6My2WMEzsfSI0GSy57EiD1BG9iD1i8bsYjz8=
X-Received: by 2002:a05:6122:3d0a:b0:525:a70d:3110 with SMTP id
 71dfb90a1353d-52600a8712bmr6248996e0c.8.1743173302143; Fri, 28 Mar 2025
 07:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <f03c3a6a-aa6c-47be-8a03-7486131f6d32@kernel.org>
In-Reply-To: <f03c3a6a-aa6c-47be-8a03-7486131f6d32@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 14:47:56 +0000
X-Gm-Features: AQ5f1Jr8bCu5jfB7gzVdmCLWSNd82UxgDWDDpWjIQfNCBC-6gPx3a_B0ei82wkA
Message-ID: <CA+V-a8vx2VKoADpw5rG0jH6773=QiHB=reNYBr4ncYZGS-H+XQ@mail.gmail.com>
Subject: Re: [PATCH 02/15] dt-bindings: soc: renesas: Document RZ/V2N EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Thu, Mar 27, 2025 at 7:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add "renesas,rzv2n-evk" which targets the Renesas RZ/V2N ("R9A09G056")
> > EVK board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> Squash, previous patch makes no sense on its own.
>
Agreed, I will squash this as patch patch 1/15.

> You, Renesas, already received exactly that feedback!
>
I truly apologize for the oversight and appreciate your patience. I=E2=80=
=99ll
make sure this doesn=E2=80=99t happen again. Thank you for your understandi=
ng.

Cheers,
Prabhakar

