Return-Path: <linux-gpio+bounces-24752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3CB2F901
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 605A01CE5BD9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A7031DDB7;
	Thu, 21 Aug 2025 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buDC3VUv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F42DC349;
	Thu, 21 Aug 2025 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780648; cv=none; b=l0KwkCfXdZP3Q605lAinfx3bvKBvX8bPYP33yuw0c3FqRspPOQZ4cpubosS0XFlYnEVZFuyqftCne2dfi9IibSqCgKBin8aTvzAGMKhm8dqEaYaF1SGF0LeNvvcdmm6XyV/IknY8YrTWQ2P15R4KJYrie9vNNDSERkSTPQsnxwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780648; c=relaxed/simple;
	bh=rXNuKnioQFz3rtqWC/tP7w8NaCHmc1EB5yrCK1qULiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUxmGd349BlDaqgOeascfVnyOTqmQKJNHSzGfhF4LZYIur4V5RDCOitfgtEBwr8zWARMN7JU2vMwMHXvtUE5myRJ7jFE5ph6hpOvaGArOFBX9ljXrKdrlLRmFIUHTow5QWg3fOUYb5uHf29M5eSQGEdFheba5k/EGbr/VtL8Wrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buDC3VUv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ace3baso154749166b.3;
        Thu, 21 Aug 2025 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755780645; x=1756385445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXNuKnioQFz3rtqWC/tP7w8NaCHmc1EB5yrCK1qULiA=;
        b=buDC3VUvrqr7NJTCBpgToqs75kFMPD6NtAFw59w88S9swopOW4OJtETBLp2UMEpcGU
         OfEf7dmkMmWG+IqjJp3+2IlwSx2dmDenxFdx3f4YjP2Gh1B7XGcOcDUz5n8lPSaz9QGF
         8EjKRg9YzUBDYuMWk7qwWFCXm7HQBEDviJnbzrCkav6DdwsppNq+pMASVY4rFOeXg3A9
         qgxVMSAFXYJV5pF0fAWeajRkfX6Z2HD6/2hME9NvXE/jlJfTSvTMpiIjRJr2WYiZ+vOX
         csF/Jrp1c/YCEycfWXTbJrFmob2345V5TO4RcaaIid4p/OKpY5vI8eyc0zQaNqPuscnV
         o9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780645; x=1756385445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXNuKnioQFz3rtqWC/tP7w8NaCHmc1EB5yrCK1qULiA=;
        b=N3TAJYVi6L4Wj+rXKc6tTitiR2GVgm2wfrood/wmqMDop0sTpo9Jzpwq7s6ZM6m/wk
         Dd9j2tkvoRvnBU7M5z7ufRUBw4DmmAdXLwYtq3kkf/u52iTmPHHzYJzv5nqYCDYFenAe
         Mf+Y+LdO+2CBuyCgyZJse+bt6oN2rG20nEllIWjZ81TPTkqSNrK0cxTUtBvoGGdaw3W6
         JpHi4RDOpw8sT5j1n0MiOqHQb8YGZIXfi5rWOB6P3onNb/p85bdQcPgHhU9OZC/u972s
         SRo9eajHIPp7/AoXkI8tX/fxMJ7QyBOa2Rf4zugsYetHH1NUDyngt4cyBxgcSxNzzFf2
         aq0g==
X-Forwarded-Encrypted: i=1; AJvYcCVrQ+QE6xUSn/uAHZYIAJ2Luv+GWwxi2wuk8A/AptNC9UAx/GjI+zr/BoMIUJFMUNabKGHC35+vAD/tZw==@vger.kernel.org, AJvYcCX41En+8FOkNMyhvwIUOrd4TlE7KjReIQlxdSIsuMaEfj0XcD/PYVXpdLUUnTFrY9Bja6k3fzaDegOYsqh1@vger.kernel.org, AJvYcCX4ds4rSu+eL71/eknWbeSzMaH/yLuMdZ7q0DifXsjxEpT/Ess2tXsDswhQ2uMKliEgTLGIWjcFrp7c@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5XbG87H+Zb7oGuOjIcJ5wRFjE1FOZxvmA85NdUjfDHcriUgw
	tDtDuaPxzGBFJl0QrF67XedXR3IVNzhS9HrNa2O8pN5Q7+w4g2gP2sNRiHhzVy8lZoK4zbw9uF5
	/KXINJTp89z2EnWltC69NARtvM1f4LTk=
X-Gm-Gg: ASbGncuCWW8/bPdEF/QHF2Wv6pVKxp1h7fpo4HH1t/Eelpl8ZHyK6UZ4DKaYEr5OBDe
	WD2pkye5DNC3s6flRxrWCmRHVEFc1fZj/5/Ve2fazPgsSmznBkRCtfFGyph8fq9zDd6IcZDTMhf
	h2+C6Y5GwFW9CL6R/97Kz25/sDtdl+f/27gcL40asM47mPjZZtM9RWDH1eGQBZ09WowWaqbCthk
	rwyBjROFA==
X-Google-Smtp-Source: AGHT+IFqLJzfxlE9IzrL92NoVUr6Ne6ykptrtie8d+0UYuYwU8A8dTBLaLR16KfvelH/Vi8PA7WIvYgckc571ZyT4n8=
X-Received: by 2002:a17:906:4fc9:b0:af2:91c7:f2f8 with SMTP id
 a640c23a62f3a-afe07d3fba2mr219920066b.50.1755780645163; Thu, 21 Aug 2025
 05:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-6-jszhang@kernel.org>
 <CACRpkdYQLqDxh=zqrZ+wK_Ky2wD5AUoVLmCV_JDfmaqJC4Yzqg@mail.gmail.com>
In-Reply-To: <CACRpkdYQLqDxh=zqrZ+wK_Ky2wD5AUoVLmCV_JDfmaqJC4Yzqg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 15:50:07 +0300
X-Gm-Features: Ac12FXzttMVTUGZEGb0vWnktV7PySLes6yhjoNd5Y9rUABfh--T1PQfOw84YMT0
Message-ID: <CAHp75VfauP9=fkoZd8D-kGOXye_uE8TE0k47YTogPDSk18gDNA@mail.gmail.com>
Subject: Re: [PATCH 05/16] gpio: pl061: Use modern PM macros
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Michael Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 2:52=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Wed, Aug 20, 2025 at 5:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org=
> wrote:

...

> > The pl061_context_save_regs structure is always embedded into struct
> > pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
> > for !CONFIG_PM_SLEP.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>
> Hm true, 8 bytes is not a big deal.

It's better to double check. This data is per GPIO chip, the Q is how
many chips can be present on one system. Then the calculus will be N *
8 bytes.

Knowing gpio-dwapb (and having even a HW with it) the commit message
(there) seems like a slight manipulation as it doesn't clarify this
detail.

--=20
With Best Regards,
Andy Shevchenko

