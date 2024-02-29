Return-Path: <linux-gpio+bounces-3992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377B86D0E6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 18:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED012888EC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 17:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405E970AD5;
	Thu, 29 Feb 2024 17:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yr8AIOHA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C8D6CBF7
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 17:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709228377; cv=none; b=pkBeljiyTpT7oTsateHNq9DVB5nTWYnxB0R/Pal5GcGakhVu20UeSNENHwtyxKZkrnH6EZdfzjSqB6lP7vVTFyE6Om5h1QM9Xisue8N/I/kofwd+n4/1Xv1EeSrrD7/gVeKAIA/40QktJkneHjMyWjfVm2qS5zhJ6RK+1Bu0pmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709228377; c=relaxed/simple;
	bh=IAtiPDsmSz7hD3vhPLE/igLGTYY4MMGETCJKNgYaVuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENwwTubxbXNgY794kWLKBiW9tusd8v+GCjcD7hlujAJxDVMvGROC0ZsWgxj6idpkMSdvOIJm0G5Qrzngr98uvs8xxw5dsqa6KEzIbbh4YRlbWwYNXGaBLrkuJsFi78f3SZlUJKpFdZK2c0oVC9avWSnxQHYDUJFX1WphVyhlv0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yr8AIOHA; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7dacc916452so434620241.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709228374; x=1709833174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAtiPDsmSz7hD3vhPLE/igLGTYY4MMGETCJKNgYaVuM=;
        b=Yr8AIOHAyBNbzGWguva4lWdNncaEt96R8bL60P8X3DnCtuE5054AIquijNVFUR748m
         k/CJw+UVgl9dxnmsKXx+gbn2eeLI1NZYG438eQFFjvOtZFAV5UEuXFYEIznMm58DlXC/
         OlN5ePW/DltNEFyGphlyjQFyApnVnYKD5QBr945kB8NkTwRiAxY5ULGzn8tMl1bomSIz
         6YUo4dZNr1CYIsYwBC6ATdjZY8e9QpMt42re6D1B5ToUwjrH+F5eJFulyWUNlsG43Dfq
         4sdYlxNzRuxoBoo4FE6WA2IUeBW4J5MDsf2ZnYC4E9oCWVeRn8aoSQCYhCVHJ5Nzq87a
         ep8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709228374; x=1709833174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAtiPDsmSz7hD3vhPLE/igLGTYY4MMGETCJKNgYaVuM=;
        b=oUXZ1r6Fpt27mxsHO6bWYf3LJIujxkZBEC8DBNbWTpA0OxLejzIERBewhqm5NpWg4b
         KcNDBDEhz4aL8mpQxulYgtelUVjQevvu+ajs4edxEe5priqUB9Lx9qV9z4yFd0T2nVNf
         PbS3DFi0UDlT2bdNFywRNT9Ahi+wYK3ZP0UaFJUuh6fDHzv9008hSQfTRd6df8/k3yHK
         cTqIgrvCPpN6QXNcWC/HkAFVy4EDTmnZKcmaMjUiDSz0k0FqNqsrxUaG4LH7paT2BC8N
         Ot1/6PocXpS/GFSPbEaxVmDlmWIiibict7xlikZvelqs7DtF4Fu36vIVBJ+2NqKDni2m
         TFJA==
X-Forwarded-Encrypted: i=1; AJvYcCXdlil7T8Q6i+GnwTcudFobO0JLyjXHc7n/cUvJIDo8bhY1BhTklIydTekJSiUPMOG/jS8dd4Su9MfTNc/bp+ZCQxauAFnHOg1Hhg==
X-Gm-Message-State: AOJu0YzDozsVpL377vYEytE4fNTS7OYdAKB2yDn+eDyQQC22YURM9LMB
	5hIFbQztRzOIS/NKG5ZTuWgKIg0p/yy401giiKpU6uDVIqwLiJJvRxrkQXGJaiUrhMbetJkVMVm
	igltByfUc/dUlDROCVmL0tRJ0HBidx3sgaTu6wg==
X-Google-Smtp-Source: AGHT+IF3+Ifh+McFCEvMTyUM4nycbbpEpZ12Cahi2H6RdLSrouVmOQ1v6+nsASB2/9f5BsKQYIiB22pbGJw45Rvkepk=
X-Received: by 2002:a1f:e642:0:b0:4d3:3974:657e with SMTP id
 d63-20020a1fe642000000b004d33974657emr2462155vkh.4.1709228374399; Thu, 29 Feb
 2024 09:39:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229084555.43701-2-arturas.moskvinas@gmail.com>
 <CAMRc=MfTo7MnfMhRQsjeFsLv3yjEtP0C3ytqACN+nuGw0Sr-Bg@mail.gmail.com>
 <15e6e45f-7398-4703-8154-35e769bac94a@gmail.com> <CAMRc=Mf__-sbAV0xuC2hsxm_-kQWqgxSLRYLKqt9-ce+8_Kf_w@mail.gmail.com>
 <f9e90eb2-60e5-4ae8-9f3f-92922294e981@gmail.com>
In-Reply-To: <f9e90eb2-60e5-4ae8-9f3f-92922294e981@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Feb 2024 18:39:23 +0100
Message-ID: <CAMRc=MfSO_RbrU672WV8MnfRoPJbkJwa4q+7p++6sZf-x3LGOA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: 74x164: Enable output pins after registers are reset
To: Arturas Moskvinas <arturas.moskvinas@gmail.com>
Cc: andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	u.kleine-koenig@pengutronix.de, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 6:24=E2=80=AFPM Arturas Moskvinas
<arturas.moskvinas@gmail.com> wrote:
>
>
>
> On 2/29/24 15:25, Bartosz Golaszewski wrote:
>
> On Thu, Feb 29, 2024 at 1:23=E2=80=AFPM Arturas Moskvinas
> <arturas.moskvinas@gmail.com> wrote:
>
> Chip outputs are enabled[1] before actual reset is performed[2] which mig=
ht
> cause pin output value to flip flop if previous pin value was set to 1
> in chip.
> Fix that behavior by making sure chip is fully reset before all outputs a=
re
> enabled.
>
> Bartosz, does this look better?
>
> ... if previous pin value was set to 1 period
>
> Andriy, Bartosz, is commit message ok?
> =3D=3D=3D
> gpio: 74x164: Enable output pins after registers are reset
>
> Chip outputs are enabled[1] before actual reset is performed[2] which mig=
ht
> cause pin output value to flip flop if previous pin value was set to 1.
> Fix that behavior by making sure chip is fully reset before all outputs a=
re
> enabled.
>
> Flip-flop can be noticed when module is removed and inserted again and on=
e of
> the pins was changed to 1 before removal. 100 microsecond flipping is
> noticeable on oscilloscope (100khz SPI bus).
>
> For a properly reset chip - output is enabled around 100 microseconds (on=
 100khz
> SPI bus) later during probing process hence should be irrelevant behavior=
al
> change.
>
> Fixes: 7ebc194d0fd4 (gpio: 74x164: Introduce 'enable-gpios' property)
> Link: https://elixir.bootlin.com/linux/v6.7.4/source/drivers/gpio/gpio-74=
x164.c#L130 [1]
> Link: https://elixir.bootlin.com/linux/v6.7.4/source/drivers/gpio/gpio-74=
x164.c#L150 [2]
> Signed-off-by: Arturas Moskvinas <arturas.moskvinas@gmail.com>
> =3D=3D=3D
>
> Arturas Moskvinas

Looks good to me.

Bart

