Return-Path: <linux-gpio+bounces-5190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7655089C83B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053661F22E9C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 15:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A52140395;
	Mon,  8 Apr 2024 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJZvJAtx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3513E88F;
	Mon,  8 Apr 2024 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590027; cv=none; b=CCB4s/HZb7hc5dupaz18mmaCign0etHYqyshqWno5zVBLNOUIoGhimtC1+dWLj1jS+ewu42/NXSQ9kl2NnYjLPmPR2VeyGLw+auMlhqfcs8Au5nOFNPmpCw2G6qKxRuSgx16MiLymmSMcqbwKAMTX/6W6TeKesWJyeya+leF7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590027; c=relaxed/simple;
	bh=GJFH3A3srJqmRI/dnGWrDKh7vwXm1h9Hr2dW0w8XJ3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UreSHn7bkz8PzrKcLNUKgZuPgUwli5ADjSjmRm1f9q95K6NuB7Q/3eYuPrDwpZGfAa+Wyv93AFIJc1bExFc3l0O9rW1Pr7FF7kgkWo25HW9LkHJJDPVh6wG/X7IJPWtAX4v+VPOqkJ/EYvZnvGTbwHb1VEVlOUbqymVl0j5f6S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJZvJAtx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5199906493so439214766b.1;
        Mon, 08 Apr 2024 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712590024; x=1713194824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJFH3A3srJqmRI/dnGWrDKh7vwXm1h9Hr2dW0w8XJ3Q=;
        b=LJZvJAtxKWNxvV5DzmAYcw9qpGoqQPTUmB3JSo0OF0rUQu6zhH1aJzQVWCYmnEeSob
         b6s6leWykQDy/i8fMPPtKh5SuglvJsoK1TJb90C+Q0Iy5fS7t0mwO+AiIk6NTu5B082r
         zonq3/DDK+M1bLcmFQ9TIIOJnePl5H9vYvHNY7YXTW3gJhTPYsmQj1jn+A8PFqvFXdDa
         iYQLfjaf3w/CMbCuACmB+b9Na+aBMqhJNRzO932+VtjsMEPqdiJZTpvF1zI+zmGHNvY7
         Mq8iHsjdF1ieQlm6KSkyg9IG4FOiwo1G/awcr99Q+uRMLkoQqCv0gzTnhLM70B1IJ3NH
         o92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712590024; x=1713194824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJFH3A3srJqmRI/dnGWrDKh7vwXm1h9Hr2dW0w8XJ3Q=;
        b=iaLVDrjwaNHiSnYzX7HNrmBCOMo6w47wUptvhwHDrXtHbVkMbcYFzh14wOcFN6Cdkx
         GAkFP7cIauGBTnDqqdMH4PnNISb7jVeck2224vZDXgVDhHoesmZQWEY6mqFva661mGNU
         +5xdLhC/TJvVSin1K5mBRK7ESfiR9SAxBBAq1S7KvGddkTcoCKTLw373sx3dlbFk9xuq
         /6T+Y+xiWeOeGBAI56GJdfxr1Nriphlu23dfzcvgjddDc45icaUgz/RZMXWalea3xgUl
         Isz8znCwBO1xrLW/wdF+wKSRXXXZSuhW6B4IBHMLkvV0PCdiMor2PIRz5KqNNG5pqHCs
         2WJg==
X-Forwarded-Encrypted: i=1; AJvYcCUuaVV/SnRZWG4+REwP2t+EJr2ftRQSm7KiBUfCaGwxCzSe/KD4ajshRDD9LAHyA3K+n4W4y77n0hWpkLt/nzNmemVP7w/r1ib33ahHF4dBQgo0tzbLlxm6YPP6kFwY/wiNKbfsAA==
X-Gm-Message-State: AOJu0Yzsu0PUWQxtgCcE37dAs+a1uKHBMoVAN/3wOMRSkVmwwMYug3al
	fz51Ny6uxYXhrT7OSlm7sw51NpfpodaEvWeVVGxlVaw/f0HEqX2Zo1DQ8UUpZFNePm+sj9EslWH
	PVvmy0KkjVxxrqBbQoGz4U5eFUVjCeN8KgSY=
X-Google-Smtp-Source: AGHT+IEIgUg4sTnYa0BJHujrw/Gi44sDrshVy33yYzTu+tPhypO22jdVh5W8QlRwp1fn7a2+a1E1UFeBKJ5A603UR58=
X-Received: by 2002:a17:906:ac7:b0:a51:982e:b3f7 with SMTP id
 z7-20020a1709060ac700b00a51982eb3f7mr6320564ejf.37.1712590023658; Mon, 08 Apr
 2024 08:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407200453.40829-1-hdegoede@redhat.com> <20240407200453.40829-4-hdegoede@redhat.com>
 <ZhQK6K0OUrXmrtWQ@smile.fi.intel.com> <8e1e561f-3d34-4023-bae1-08bce71ebe55@redhat.com>
In-Reply-To: <8e1e561f-3d34-4023-bae1-08bce71ebe55@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Apr 2024 18:26:27 +0300
Message-ID: <CAHp75VcJJqSOPUM-q5vNbM2X1vbZFVjTmf6z91YYtkRDnmyN2w@mail.gmail.com>
Subject: Re: [PATCH 4/6] mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo
 Yoga Tablet 2 series sdcard slot
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 6:22=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/8/24 5:19 PM, Andy Shevchenko wrote:
> > On Sun, Apr 07, 2024 at 10:04:51PM +0200, Hans de Goede wrote:

> >> Since sdhci_acpi_slot_int_emmc sets SDHCI_QUIRK2_PRESET_VALUE_BROKEN
> >
> > sdhci_acpi_slot_int_emmc()
> >
> >
> >> I tried setting that for sdhci_acpi_slot_int_sd too and that does make=
s
> >
> > sdhci_acpi_slot_int_sd()
>
> These are not functions but structs .

Can it be spelled explicitly?
"Since the ... in struct foo is set ..." (or alike)

--=20
With Best Regards,
Andy Shevchenko

