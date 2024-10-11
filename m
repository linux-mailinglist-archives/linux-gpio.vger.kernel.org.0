Return-Path: <linux-gpio+bounces-11221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5036799AD58
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 22:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1129E28204F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 20:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D811D12F8;
	Fri, 11 Oct 2024 20:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l4nqFF63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB071D0F46
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 20:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676979; cv=none; b=mjlJnp1diHTyaCwvw9Mcl7c/2wKCGQPvWEmIG7V0EpgF8iy64AMX8pHVRkcRu+7lR1poKbhI/UBCwJK0MkCS+LSS6D61lpHUy+7slcGa7K68LxpKvNkh6hAdkvEX8VqWv5mjPdEthCtFtyOPNnGpPwmZdXRVpvDDfl2kKscsntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676979; c=relaxed/simple;
	bh=ODV50fNLCFdjIqcFnpP2PNFAuAzMtDOje2NXbZ7Egzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doX5lhitfH+kdNaGo9uXr8eUd1yykS1QKVMTOoQ0ttAV4MsT8IiiTl8YV+AvQO+FTQiOtkjG+DP5CZBAnHDHCbkX4Pq6BRXyaUpq6dHo59d9YSVAcAG4/AC/obzJnz6ZQlQpfTVDxvUqpcR/183b8VGxEvg3LFluhmEDMFbuNvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l4nqFF63; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6dbb24ee34dso21566747b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 13:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676976; x=1729281776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SECYkR1tH36IRXjV2hBFD0fayx6FhMErprkUBOQsJ0Q=;
        b=l4nqFF63kCxQXyOrk0xe+vYNuFRT6J0LNqI+ujjIkJDsuuCkGWdiRVxp7P50rS2M+r
         j9J0UTkOufhR1x4t9qMcLdh2z1dD/+5zm3XoOZVp+GKEaxuh4f7DlsnPPDWwF4zPahAO
         LR2J+a5yVD11owkiR/weuoPaWj4uPyUVD+gZ3Lfg6iXldpI4c2bKeEsWfWdLvgAPyR2Z
         TGfdM8urJ8VSZi62cLvHsBGMAoPwIo3w44fyShIA7RbRaZfdMZvJuub5koZ7MXMmTYnH
         H+VcTDJQVkYRwAcpdUuBhcYvsogGxa/ckvvdQ+oFAqcK/P1QjflGMgFUQpzuMCi1/Vze
         aV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676976; x=1729281776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SECYkR1tH36IRXjV2hBFD0fayx6FhMErprkUBOQsJ0Q=;
        b=aiDKgNoW8f/MQDGZ20NIl56aCty9M0vvR84kdXoS2loiezkAFpNTNx1llIgwgGTG7o
         mkBznjHTjvIDmmY/kLZ+Q+LT5ttB9BCjjhU5TK5W1GCggdd4+6U4j0luNaE8qVmCaRjC
         jwy77aVwFSlAzJwuvkgvlkUVFmfiTUB/eUhPAorstOX28hobP9UULblTXb5fIQmjheMR
         FivVAMTnMaEm5UosCumHRKXPMoqh49YyFNvrosBRs9/UbWe4fQ6GVtfo9C9uKFC6Way/
         yPrGUXMYqjb7VjKtKY4zYL+upB4E/AsvNZjgGnpQRSGE86RqL7cQGbsSLLOm/oKO5jQ1
         +x9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVBWCFKb2Dht2u4s/yiB4Sj9vKWL2zxC2V1q5xWf/W4O73GRpsbqm+OHUC1kiQw8Zf0EKLaV+yiLRB@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVyGMzBCho9A0Ehmy4AgJb4cfDULSMCb8ASs17MP1/JfbDQTh
	q9qFcHju9nZvpd32y+vmadYAYqu41T50SPfqBuYPN4hlb2/HeLaNgQdSk78cNFPSITIEM4BUn+H
	+yzNSNPf9RTkY8vDb6CjK/53C7wrkVPwUw3lkMf9NI0ZQC80i
X-Google-Smtp-Source: AGHT+IEX50nN7GvXdtMOFV2ls3PtiyNs6ga7VtHfFp++1qOGXYlxqaeLTZx/eo82ScV1XRb/2oK53cLuuqtVKJnZo+4=
X-Received: by 2002:a05:690c:4286:b0:6db:4536:85b9 with SMTP id
 00721157ae682-6e3479c297cmr29587547b3.23.1728676976485; Fri, 11 Oct 2024
 13:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006181310.181309-1-matsievskiysv@gmail.com>
 <20241006181310.181309-2-matsievskiysv@gmail.com> <CACRpkdbJ7xh1qOYaZOh+s+Tj_GgE4LXMFuOgL1zpxBRqJQVx6w@mail.gmail.com>
 <ZwlG9AKToZFFPAvi@KILLINGMACHINE>
In-Reply-To: <ZwlG9AKToZFFPAvi@KILLINGMACHINE>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 22:02:44 +0200
Message-ID: <CACRpkdZh_XZOKJa1Ga5vyh3MvY_yb7hDowbuJv-LG47AoZ+UCw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: ocelot: fix system hang on level based interrupts
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: alexandre.belloni@bootlin.com, quentin.schulz@bootlin.com, 
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com, 
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 5:40=E2=80=AFPM Sergey Matsievskiy
<matsievskiysv@gmail.com> wrote:
> On Fri, Oct 11, 2024 at 11:18:55AM +0200, Linus Walleij wrote:

> > I'm a bit puzzled by the patch because I don't understand it.
>
> The current implementation only calls chained_irq_enter() and chained_irq=
_exit()
> if it detects pending interrupts.
>
> ```
> for (i =3D 0; i < info->stride; i++) {
>         uregmap_read(info->map, id_reg + 4 * i, &reg);
>         if (!reg)
>                 continue;
>
>         chained_irq_enter(parent_chip, desc);
> ```
>
> However, in case of GPIO pin configured in level mode and the parent cont=
roller
> configured in edge mode, GPIO interrupt might be lowered by the hardware.=
 In the
> result,if the interrupt is short enough, the parent interrupt is still pe=
nding
> while the GPIO interrupt is cleared; chained_irq_enter() never gets calle=
d and
> the system hangs trying to service the parent interrupt.
>
> Moving chained_irq_enter() and chained_irq_exit() outside the for loop en=
sures
> that they are called even when GPIO interrupt is lowered by the hardware.
>
> The similar code with chained_irq_enter() / chained_irq_exit() functions
> wrapping interrupt checking loop may be found in many other drivers:
> ```
> grep -r -A 10 chained_irq_enter drivers/pinctrl
> ```
>
> > This needs to describe how moving the chained irq calls achieves
> > this effect.
>
> If the explanation above satisfies you, I'll elaborate the commit message=
 and
> resend the patch.

Excellent explanation Sergey, just put it all in the committ message
and I'll apply it!

Yours,
Linus Walleij

