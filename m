Return-Path: <linux-gpio+bounces-19511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E21AA5390
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 20:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EAB87BAEBC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 18:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F588269806;
	Wed, 30 Apr 2025 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mpm+J6P9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A260264F81;
	Wed, 30 Apr 2025 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036928; cv=none; b=nA0xKSrU0AzfLIvlPYQ4fp+jiD4gFREQfa/23zbxAbDRD8Niuer6bdFJxL3WD4uezVCNR2HjGZ2KfniSpwOtpZat17/XOZzFkiG8tjE+LrGDQmXPGlx2eEsrmZbZvXCU22YAgr1bXKhfR5IH/UcluabCAdfMdBEBJQvVcu5cam0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036928; c=relaxed/simple;
	bh=LQK7ATJYL9e453xGrlw5YiQkPyacBR+AanT7imH/Efw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUWxGoQvNO1vMHZJkYjPlZzKozOHjFRRz8vbP16hBqFGyksYDuVWruvDNo3IXln0uYBYpNG0WcJqO83EzYi4S1P0WZR5VcQtBftWSkZx958Ptin5Lc/XYD7rSxpE1EkFH2VOpZphwxGfAQojsUzumjFA7TCF/5VAvksG4cZ44x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mpm+J6P9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aca99fc253bso19697066b.0;
        Wed, 30 Apr 2025 11:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036925; x=1746641725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dSDcdYRcALkJ+3hIY53iFlkhSBYjRT1X+GuwsMkgvw=;
        b=Mpm+J6P9QZKPuvlpY5/R/64Eo1zFBzQ/0AA5DyQfW9pEdfS54xTOYH13PJLVdqUqKP
         Z+ma3TszRGLkZhJJd1o3SQhxU5pdwGB1pUHBG7K+JIJteaoaJ5UqqtV8GCoqkVOS/DE9
         L/p1WoAm2zSRtDOmulLlNuTOmXuGpeJSXzqNZfrG+/zf4R/12kleIPYmF36zzfwp7fEM
         wfmxs1Ixw44Yc4QCvw+Pfwrj5K91dD4zczkQOd4mlH4B+a2IAkSxnNuqiWZd263nyQ7I
         dijfr9AG5uegCUBZhWJ4hDzup3OKoJKhHO5LXpYqLnjHYU6Wn5lp922rT0XYk7AF3zST
         8lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036925; x=1746641725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dSDcdYRcALkJ+3hIY53iFlkhSBYjRT1X+GuwsMkgvw=;
        b=gNg1fral/XcZxPgcXb85VePK/bk4aPCykFOn4ulcfdjsM4C9ur2yu79bqalsTDg8nP
         +8K/XsWgrEvQm5Q73TLQa9CVrgOZLOz4adIW0OjAuweVd+V1VcJz9nfWxdiqXC5JqURO
         ezKoeWmvdM32juKMy+8WbO6pOsqdhIWIPzkWx+NbcRtKUSGXVGsaHJFLUu2xNPNkho3C
         QglORwDr3p6r6//2EOjsWOi0D2Jmgmv2aE0pNohYAh3PKavVJClCVs8xvUXWEGqnaZRX
         aOgY3ehDtRvCXvU24k7kL34j7o88gSYatJwrAkUhql/WDy24xZX6/tE/EJ/p0uUKpOLS
         CcvA==
X-Forwarded-Encrypted: i=1; AJvYcCWo9RWI4JnuYJdn4XHjvuiB3jqzLKtfbKO0aF5Hy/UyCH1iEGc8BEAw8rPaR1ef8HXkHMIY/ggc9IU7Cjm5@vger.kernel.org, AJvYcCXRPH9QM2Gg4SUhrYcxHnteyDh/rhAjY5TGqG6nNEUGWMBZVSHEE7F0q9WaVThKUoc4WOd914fxAeol@vger.kernel.org
X-Gm-Message-State: AOJu0YzCascPHpmNMtG/gff5nuXSlFipK6ane6lEcdGT1kCgplTMdnqW
	5c9Fxjx4vDW05bSDptiLYhVfcQdKRO0dbMLYvD1KQOLEaalIGdLYuZmNplHLyzAhLgh1bDFDMgV
	SBYCtrxdcAlDqMFn/wlzrOPBs6OugsRB6
X-Gm-Gg: ASbGnctpus7PJ09ABLNgdfAOZQ0by2cPSHTmDDThRvJGgmdbhMC6BpC14CvpHEj1lpP
	UWaq8BF5UlUfWDjf2Emr9VBUIaZTFJEdTr/dP89gBuhPm0a76YD7ddjfLlgCTvrZocW0e1q8gE0
	kKVbNyLNe63QqDTRewioZ9Dg==
X-Google-Smtp-Source: AGHT+IFDhBSYiFRAp3szTZ7l8oZ2MlAWLqqkLN7hZXy8W4eiXluAWboNNQ5Ct7ap0did7zutNAEEWe9zN/XRrH4KGZY=
X-Received: by 2002:a17:907:9811:b0:aca:c789:133e with SMTP id
 a640c23a62f3a-acee25ff0admr328805866b.50.1746036924384; Wed, 30 Apr 2025
 11:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430153239.7137-1-ariel@simulevski.at>
In-Reply-To: <20250430153239.7137-1-ariel@simulevski.at>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Apr 2025 21:14:48 +0300
X-Gm-Features: ATxdqUHbELQqHdubC4QO1U9OD9HlxUSTSPgHdL8vE0YrLiXSO2lHwQGyKQhQTac
Message-ID: <CAHp75VdzqoxKwVhSqHVcnjCyBT1+y+020iTADc0isX-kqDJY8w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Document supported platforms in
 Kconfig help
To: Ariel Simulevski <ariel@simulevski.at>
Cc: andy@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guido Trentalancia <guido2022@trentalancia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 6:32=E2=80=AFPM Ariel Simulevski <ariel@simulevski.=
at> wrote:

Technically this is a v2 of the previous patch, but it has been
changed a lot, so for _this_ time it's okay to have it still v1. Also
note when v2 or any new version of patch is required the changelog
must be provided (after the cutter '---' line below).

> The Tiger Lake pinctrl driver is also used by some Alder Lake platforms
> that reuse the same GPIO IP blocks.
>
> Update the Kconfig help texts for both drivers to document supported
> platforms

> and clarify when CONFIG_PINCTRL_TIGERLAKE may be required.

This should be done in the same way....

> Supported platforms:
>   - Tiger Lake (all variants)

Have you checked this (that's all versions of Tiger Lake are in this driver=
)?

>   - Alder Lake-P

> +         Some platforms may reuse GPIO IP blocks from earlier generation=
s
> +         and require CONFIG_PINCTRL_TIGERLAKE instead.

Just list the supported platforms:
- Alder Lake-N
- Alder Lake-S

And I believe some of Raptor Lake:s are also require this driver.

> +         Also used on some Alder Lake platforms that share compatible GP=
IO IP.

No need to have this text, it's obvious from the below list.

> +         Supported platforms:
> +           - Tiger Lake (all variants)
> +           - Alder Lake-P

...

With that, waiting for v2.

--=20
With Best Regards,
Andy Shevchenko

