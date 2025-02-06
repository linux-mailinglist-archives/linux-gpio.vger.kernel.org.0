Return-Path: <linux-gpio+bounces-15422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F494A2A3EA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9E2F166F9B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB22D214818;
	Thu,  6 Feb 2025 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+mW8Vch"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2061FCCE4
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833316; cv=none; b=S3sTRkreFL5mRKPrUlWhH13eWyF9PaoOvmUxIisIVjSmTJeyxLOHExe/hX1PempsI5PLXyRKKEJKgsfsyfpw4NgnLofDKzj1UHk/eMS/ISZj768EfIll7ff8ayPzz23Qd4vf0p5So8cEDrPyABOdZ/SjXQKpx06t6u8hGH9veE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833316; c=relaxed/simple;
	bh=tRqJLc+O0FDbedoqglzuXzm6t6RtebcSpmdqWw4IkkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDLj3cvCz7JuMnxM0IAGU/9NsNh4qlGmPgMCktKBH3gnpT3SRQ3WedWMUid7OuKXXBTtVZvqe0OGp4/1lXi6mozIRVvdh9nC9i0ZWEETSJyO5sgpp2HKNwE/DoCsHAM6ahy3n08qClvP9gtY8bcESIrbVjH4LpvKoIG5Lb7L6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+mW8Vch; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307e00d6b09so1797061fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738833313; x=1739438113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRqJLc+O0FDbedoqglzuXzm6t6RtebcSpmdqWw4IkkM=;
        b=c+mW8VchR84wTHE4wz976PiIhW68sVJOmk8hjTs0OslgqjGgeYaf/sl6evTmncWqa/
         5E02ZOU0pd+Hm9VPO2Cx4bSKO2UEqANmERWWpzdko7lXdbQOi/x8z76WdDrLwfXPdmRs
         MRmLr385wOd8+U7coxDYpWM3QeS4Lr/iKtApNH5+cv2u3Kt3OklBseSp9ckkaDl5ls5b
         qtjE49Y9HqoQkRz6W0k5UBhV1dUtbMHtefoaiQVAm/biZbVG5cNTf0czRj45FTuWcP9T
         no3EJlWg7nw5PJXtad/WtPVFt0d5AdjvR3xQe52UfGqyIpw8AMg7Mo0AaIqH6Xy3PPFN
         6yUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833313; x=1739438113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRqJLc+O0FDbedoqglzuXzm6t6RtebcSpmdqWw4IkkM=;
        b=M4I+DAAgJBIPtxNHTls5Qkk8IrTimFNS8DQORZNt6AHxazG7TUKouOttDuMhzuKJOM
         vw1v/bvGq/5AB6A4NL1A4hL7WVnQ2nru3zqldlOMmjNtTq0dce3XAMyBpmz3jKIn+dAW
         EyUZsFgrL86FpHK33dNclJ4n9X746xOMBcdsDpJk4DlMf5sIR/3lEc0FslpVKGGMt6WS
         OXbyvE1pPcuqEEwj68vzGL3h/ajymUaZBjf8wDRw6ihyniICybQ1pE9w9rCtzW7m17xA
         LzZ9NCr6rY/V7LD3mXb/WXCiq9P9F5/kwHPn68/uleUSzs2TC3Yb9lvZueuP9j5AuYNO
         b9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWti5fpz0YabMrqVCweYlM6a+P3lDNP33ZLEbSqNVyAnBx8QmrZv0vNznHKb+6p1+5snzuUVNUW1bYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzit9fihWx8NZZaPvzdiDDB2fj/AqN+kKCQ3zePwVwVGL/JeBIG
	g3/adFmU+whMrfpVwnkXRb1XhQkP1IEz8pdbskA4Oogw5R0ViqvZR7MUlKcG3G08RCuWKACGtpE
	47q95On+k1PU8092OtQIAK7OVLD7FhKJAcM6vXw==
X-Gm-Gg: ASbGnctFHOJCLe6dBOFbZYpzd1F1VZbaWnlUpPE7QmHUyl/3Vh80uSGC1CogosZW0CH
	5pFhP7tHnYR84ZEAH4eDb1n0xmDFSxuV9/3qhxa4ZTb8/BR+qv8I89anjJ/9vQRclHwEl5hE=
X-Google-Smtp-Source: AGHT+IElLnUlOzbE8Puyjhx2m9fT2KJol5uqVVtfoRbXKJQshctEXy1e37MJc99UBpwywse23HEoui4DOzqO7+aQfjI=
X-Received: by 2002:a2e:a912:0:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-307cf2ecc76mr23223341fa.4.1738833312724;
 Thu, 06 Feb 2025 01:15:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205101058.2034860-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250205101058.2034860-1-claudiu.beznea.uj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:15:01 +0100
X-Gm-Features: AWEUYZmZ6IZ3PcFl2s36i0IngD6WlXx7rnFQanVdV3a5Nwbe940ogp6JHOjNsb8
Message-ID: <CACRpkdZh0mDkob62k=_v+eMqn-mKNpeetS3h38wpNHWyA+Eijw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Print unsigned value if a
 format is registered
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: peng.fan@nxp.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 11:11=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Commit 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")
> unconditionally switched to printing hex values in
> pinconf_generic_dump_one(). However, if a dump format is registered for t=
he
> dumped pin, the hex value is printed as well. This hex value does not
> necessarily correspond 1:1 with the hardware register value (as noted by
> commit 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")). As a
> result, user-facing output may include information like:
> output drive strength (0x100 uA).
>
> To address this, check if a dump format is registered for the dumped
> property, and print the unsigned value instead when applicable.
>
> Fixes: 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Patch applied!

Yours,
Linus Walleij

