Return-Path: <linux-gpio+bounces-24557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD35B2C44C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B7B723D5E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F6833EAE0;
	Tue, 19 Aug 2025 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h8Dcovti"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE6335BD6
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607807; cv=none; b=b2j9L0+bv8LbhDJxzknXneUP1vn3jrQKQ8mM+pGRqOv5XNGEymdMQhobpuhKHjuX+960t5dOmIi8z/jw48XtZwzWghE2SB3YGPgyMF5kJlLpGPzH+WZYJ2QesSw92aChON/BZNw8u3qKnTSupF14oQWJ5Lo/a1jA7XZ9fMPd/Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607807; c=relaxed/simple;
	bh=VK+2UvvpL/cCLU3utXHTMH09m4NrnfRk3clo5zecdXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJrNOCivfeo3e3nKGObAXEPa3p6vBYPUniBhwhugkCPFJmBDrBqFcmoIHL9hI3i7xhIqcVpUsnzH0MICwmyH7+cXc1aAV5ydT/gEf5ThzvJekpDQMk9OUibkFJXgskEzLqavWslb5YPR1hGCQBCLUZ8GEVe2Zu1BMEJIRmXzQsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h8Dcovti; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-333f918d71eso36999281fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755607804; x=1756212604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK+2UvvpL/cCLU3utXHTMH09m4NrnfRk3clo5zecdXc=;
        b=h8Dcovtiih6rKkfnPp12hbsbmeHRx5VJqZJ+LQxCpdZZrShrLCh3Zpr50I4pWnQIH3
         hgK5uIy5Vw2ZoYGA/FREUecPEUBqZUT3k6zeMB/iWSgH4vdCC5g8zqFyjydZ85wbqXxV
         7S34aOUN6JvFOKbvKXWCPJDc/uM5sor44P1VPHLM5d4/wcKAFIc8JXSqTLvNjI4QrM8P
         MD9SGk5w7O7aGx1dhQ4W90286eCT+3K6gVVILHK1ssT6oi7MRwzzjXl957BAFJoSlckS
         nGwQEQfIg+T5p1ILyibZ2q5yasxJALGs7KflQ6co4wsmyT/uZmQ+taUCOZL8MIhD+ZJK
         2Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607804; x=1756212604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK+2UvvpL/cCLU3utXHTMH09m4NrnfRk3clo5zecdXc=;
        b=LOD5ifKRFYNnlULv4X7jHkyR4advw17SMOH/oOOAke+2i/FKOtWWeyp2XOMn6whvwF
         xgtXlRnZmrMvi09QxHDMVNEL8rwUZEozwnxj84dFp2mOKw3GnoCkGIZGipbDHKY9aeHY
         9ceBDc8VQr2nTAPVkd21pinU72I13jc9wCOQeKeqznMO50hXk16TuWZGnyhgwBDcbDXj
         L83HV9HcF5AFePIhSaX1Yh/j6wCMCArnKGPwwzKWm6gI9BcftOa37LVJMgSucjuxYJsR
         r/rpcFtZEUM4Nd8gk3h5kz66MVGPGTt632/Tz/NuXISRZofTrEcjd+uMtYJRFwr4et0C
         ykAw==
X-Forwarded-Encrypted: i=1; AJvYcCVHqPiMh1gYVes+aIPZBULrGf7eljiqrb1zOlw6P4HZvWWrfPG8mNCyW19lpJe5NEe5n7TGmn0K7HAg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1bVs0SXh8E0WuVcLNrXsPFKDGh66Ac2/kiM/gL7hSq54cVuSJ
	N/k/D3aa+qIseFXYiJt9PjI2Yn2FJNbvPrn/jSwMTOJqwHk4jgJp2ntpDJRsXPomIsPO3FjVjEs
	AsEfaR8rkJiq+wkHEywID685qpmQzJuLHZtW3Dmjg3w==
X-Gm-Gg: ASbGncsKaKva9QgsQnoEH1wuviXEVDgnP0tMSX3TSAwFbkQCwAn1nKcS8Py6fqOMuYl
	hiBfSTCbdQu4HnmBuojmHdrxFDbYiKOJDEvqv53x8fXH+/4SQNQxUFmVTw2f8UOmuAM/uUBJlTw
	n2Kq72zvkB+/FWS7yFN2NjzY5hryLHALTeiUl19LebLkPp1cAPClyvJHRNDSd8Q/wXmgyjAaS40
	zSOLOSUs/aETRKDGlqkXK4=
X-Google-Smtp-Source: AGHT+IHeICNzId0TeCOa2HwCS057ZaEol6I8kkIJiDlz6bpaH7LQuiJrRfIa3kWPjQ+FO6z3QaESPtE94SzLL8OyVIg=
X-Received: by 2002:a05:651c:20d7:b0:32c:ab57:b03 with SMTP id
 38308e7fff4ca-335304f93acmr4931641fa.3.1755607804225; Tue, 19 Aug 2025
 05:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
In-Reply-To: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:49:52 +0200
X-Gm-Features: Ac12FXzlHx5q_PBstfTvDK3Lfp-tFPZCTH94QW-bgrJdiOv30F24hNuiuM-S6zQ
Message-ID: <CACRpkdZyWYY11akth2RFw5FsbAo2WsiUBPPnnjw7bFaK=y+VbQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: gpio: add documentation about using
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 11:30=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

