Return-Path: <linux-gpio+bounces-19721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D27E6AAD6A5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 09:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0C683B1AF2
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 06:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E15212B38;
	Wed,  7 May 2025 06:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhof3Fs5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF552135B8;
	Wed,  7 May 2025 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601181; cv=none; b=gT9yacGVKYgbi+XuEX52nnGE7gpduyG3R6JIIHcDW+APVYrtV/oxglxGzkRFMed3Pl6Zmzeik0R3YwIcetibvZ41F3egKoJLjD+vsDb+DAQ8ra1mzr0ri1JgaBxTWJQYSdlfY3dN7k1VwzEedKv23m6haeqzi4B0nO0bwaAA4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601181; c=relaxed/simple;
	bh=SwahXcMqx4G/lamObKis0IYDh70MhysmwuIhsqcDBuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKToSDsvRCei5McPE9TVNuTpuZB9o+jomw6MTankFgI+eTm0PbrnCwwEJTMap9jMZZFDCgrNjuZJRqZE4smVRwRBcl8RSs1cBXqtyMvMAGslOH8k5097bOy5K7RKuPYiY5QGpo1K+XjYNqY27zjQRE34SCnEWnpGEQG9ldf132E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhof3Fs5; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb39c45b4eso1028291966b.1;
        Tue, 06 May 2025 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601178; x=1747205978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwahXcMqx4G/lamObKis0IYDh70MhysmwuIhsqcDBuY=;
        b=nhof3Fs5678GQQd3tLsBvoeHLWP+VEAFXKxVcsRGBtgTYWR7Lx6o4knXdcU6DHp6rA
         eC9Gv8nU8QI4nlUta2iFuuGBuPaO8BbhA2XP7Jij0H4QcdpOvRtXEFSmWKwhOw3k4Pct
         VBpr34jXPJ3u+m8FvXgmu2Fi0yUwiNu9Lup8qSoGDmU1ZxZdQwCN+wHyxFSEGk9ynDOH
         Q/TwhlV+SiiyPEbMI2flWbtazbLVSvjvSTnyok42MDD9b52VVGTj2uy9B2TCicANFS6e
         J1yNISF7qYRyupofhMh0t/F8c9YWylBraEATT2M1pwb9nkahiIIt3HYnjAz+rpBk144y
         Hw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601178; x=1747205978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwahXcMqx4G/lamObKis0IYDh70MhysmwuIhsqcDBuY=;
        b=L2zzbY8dVr/9HqDtWJ2f2JMjUO96S7Pd18eN6FzJovW9QFh9cVtUerIIE1ovkbjHEh
         XDV92zJQdghSOhqLeY+VIAWm/PLYnObBoxo+MmwlkjkX6KGrfLntfRQ/0ZIUUD7zdIdz
         qw1iM/Le0q+Qr6xS++Wx/6Mz8A8EGFeUMPIFad6vckqNNEPgBBgd5etLXKyhpjPrUSuL
         pG/nEiWh7TdW/U4RTOtxqqTUfA5tj6WPjnjpmVHsDS7WUj5halifSHu06Pz9tAzuwHnW
         wT7I4XDFU2rrjpMN1aatqQShGzFXEPwQTFT6frvipyyoC3IRprTm7HGRTA9iOZGm2j8A
         oFSA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjb2q7avL1UhpdiRr8Ka5sVSMBO3TyHSYQlqSDDJWE2KyExiXX9CTLdhqPL54YX/8rmXpfWu1tq+D@vger.kernel.org, AJvYcCWta4TP+5Fa7088DymvbwPHJ+ojb9QCoeULqBGXp4/aYaSM0ikb56plgZtqfw68k1he3E305M3NUimD/VPD@vger.kernel.org, AJvYcCXM9Ei78toX6oaXMEqeR9eh+goWJ1UgVxd4oDVojQvZTEFI61gOlqrKwiTK6R5i32HWZJ2GwTtUtQ6Bwpv0qQ8e@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz4tyr3b5iQ2ZZme9WaNt3oYX7oU9EsWHg3kbrv6LmjgMdL94D
	yaGsnZm8NfxU+CbQPNDMQyUiqRxVnZP0gI/oX+BPixoMGLs0RjU5iFHrJGLY2omwCARCtis3mYB
	NyL1QvjHCu3F9tn6y+oNc9fm61yY=
X-Gm-Gg: ASbGnctBrF3BBsPq2BNTnmfU6q8daVNKw0VAoEXR8znaOg3/dGaPw4LLlU6T1oLOl4q
	+FhsSC7iOGSYzN6bZ7/zu2sbPYa4IBpyJWiEwXy6YpJQxo+ivqPYI0QjRnzONqAVdms23kRBS3K
	80IN/kVWqm1VlrPtkInbi0yw==
X-Google-Smtp-Source: AGHT+IE8DKbrimrtdsItEPL5aMaWNUWXC3ZTJTFEXrviI9KZnSYxAw8eGv/Y0aTNLCM02R66GVEGf35ty+ZSx5XGZqc=
X-Received: by 2002:a17:907:c016:b0:ace:ca87:2306 with SMTP id
 a640c23a62f3a-ad1e8bf6a2fmr191446066b.34.1746601178038; Tue, 06 May 2025
 23:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 09:59:01 +0300
X-Gm-Features: ATxdqUEsmCS8k6lrTHepQQNIqW01WadwCjMiJKv-YOeOc-NwT5ZimtrL5nqQhrE
Message-ID: <CAHp75VcOxtr1o+YEkQURYGk+Aisk2nZhx7698hbaOen_5EXpyA@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the fifth version of this series, addressing the few remaining
> issues identified by Andy.

Thanks for the updated version! We are all good now, but I have a few
nit-picks and one small thing to fix, i.e. the constifying of the
driver_data in GPIO forwarder.
(Yes, yes, spelling is another thing, but not so critical).

--=20
With Best Regards,
Andy Shevchenko

