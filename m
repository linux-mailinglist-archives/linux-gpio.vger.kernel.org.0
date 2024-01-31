Return-Path: <linux-gpio+bounces-2789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3780843A5D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 10:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D638C1C27B31
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A496996D;
	Wed, 31 Jan 2024 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4Hdxe1g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B0664AE
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692023; cv=none; b=dB9pA1lpVKPCeEjDtaEwhy0qqlDvPBDs1ZH5Df9d4YkBmt8UIkopPtFQ+5BhTZj4TLJc+8VzYzgRpf28VYzpSiCuEhPLmdPywN+aG0bKmCOv1KpetxjeyA6Yh9xio48hIgjH1KAfk8DgSLgJLSacndGDfZilOaHBRj0XV+RV4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692023; c=relaxed/simple;
	bh=oxgNymcs2LHMT7a99OhfjwHqo/ckBAFjCo6CZnsp21w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j83PAwKLR6kkiZY5FRmiDXnMtazF4zPqyPiF01X1SVxH9DPvCXEfZ0+Hx+kJ3F3nRk5Fzdlcc3QiV9y92MStOpD9dkudbwVRUWC6X+4IqL0r5mM21ZO9bqSV3QNUcN/+Znmu1RRzRESwn7qlaP4oKjNfjjqmtuMahsrwpddn4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4Hdxe1g; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6040a879e1eso5896837b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 01:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706692021; x=1707296821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJd1d7Iygxt5liH5/uAuLMqXNf2/RDy0rKG9vrYq434=;
        b=U4Hdxe1gGbDKVQHucNE5yRlwi4ftddpT6yqDHpYEZVDiFAGtqJfmZNABEoBMPkjma0
         vAGdWzzaMusyhcE2GDpNNSkQ4MBSZKcHUn7DhHk03O9WsJrNV8PlAKZpdt0wT40597Q8
         +cr10qX8f+xVCYsExUV6dYhJ4CxUMKm9+a424Gw79M3LQLSMDYwFcTgLLp4yk1aKXxNG
         az6WiI/S2RyW3oy5sPPFAhQQVLhoSnR6jioeTf+M0u/2b5+suSfabI/GnHPaeum5AQTm
         yNPZMVdLaPbvsYp5E0HMWV6z+Lyn8/WSNUotY8NH1H4o+WSYzCcMAnm5EjNaIXchnr+g
         k/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692021; x=1707296821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJd1d7Iygxt5liH5/uAuLMqXNf2/RDy0rKG9vrYq434=;
        b=jyqDQfHmkNBGz9cH8dEy6SUkIeGmcn9OwHKNunfCMipsYQej2FXlHWobiW/xOHwQAX
         Moe1T8fGS6CRRTN6p8ijreAYJntOuMiL5DvY8uNYaDiV3IU13LXRFwSsVy8xxYmmW6qZ
         q3g2/y5fISXLa7FUqiVe58uv0a7x5Gw/qCL9ypL7xjc4XK4MwMQ0mQhlmdXhTlQOzxz3
         9IAnb3tcfD86njXLMlDjpTYmFeqbjZg17cK1LTuB6OPEpq7TVUIGl1dZv2/mUFMN4szZ
         cCApCHPkM9+r/TaeFMF1ZJmmL845+JIcPDTFbjDlRZ5t4vUg2vzOs86VKtmM5gm0Aeoi
         oXGQ==
X-Gm-Message-State: AOJu0Yxb3AJX09T4iIrLyRY5olXTRg9I0KzbSJOYjPT6F5RpVm3FK8pC
	r2ZOIBxdZSPGNuhvz0RwvBAalNPw07s0TQFcz6+D9/rhwjKvHcGdhe+xuBoUxs4i+R02W/N+1RZ
	KxwPzmdJf4MG0WUnG1o49xnXdFUQ5IjQW+4ZYBg==
X-Google-Smtp-Source: AGHT+IHtxghYqklapdMskeCjagfQLJmYYzv2N+Nrny54JoXQvG0QOhicxvt0LmPD2tmvUsJ1FOsoyUbBR+1WEU1IFz4=
X-Received: by 2002:a0d:d4d2:0:b0:5eb:d94d:4300 with SMTP id
 w201-20020a0dd4d2000000b005ebd94d4300mr850819ywd.19.1706692020767; Wed, 31
 Jan 2024 01:07:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123180818.3994-1-mario.limonciello@amd.com>
In-Reply-To: <20240123180818.3994-1-mario.limonciello@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 10:06:50 +0100
Message-ID: <CACRpkdZxOovTOF0rOjyU1WwaRLZqML41hfYcC7z=HsAQjY8BsA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Add IRQF_ONESHOT to the interrupt request
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Christian Heusel <christian@heusel.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 7:08=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> On some systems the interrupt is shared between GPIO controller
> and ACPI SCI. When the interrupt is shared with the ACPI SCI the
> flags need to be identical.
>
> This should fix the GPIO controller failing to work after commit
> 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler for SCI").
> ```
> [    0.417335] genirq: Flags mismatch irq 9. 00000088 (pinctrl_amd) vs. 0=
0002080 (acpi)
> [    0.420073] amd_gpio: probe of AMDI0030:00 failed with error -16
> ```
>
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> Reported-by: Christian Heusel <christian@heusel.eu>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218407
> Fixes: 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler for SCI=
")
> Link: https://lore.kernel.org/linux-acpi/CAJZ5v0iRqUXeuKmC_+dAJtDBLWQ3x15=
n4gRH48y7MEaLoXF+UA@mail.gmail.com/T/#mc5506014141b61e472b24e095889535a0445=
8083
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied for fixes!

Thanks for dealing with these issues Mario!

Yours,
Linus Walleij

