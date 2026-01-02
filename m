Return-Path: <linux-gpio+bounces-30073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF5CEE735
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 13:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39AE83014585
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 12:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00FE30EF6B;
	Fri,  2 Jan 2026 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfnBg3z6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00702F0C74
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767355470; cv=none; b=R1NrZGMcgqG7I+worxMiVb87QKMb7+svfOhLvV9I20MXEHy+k/Ng+NWuFJa+05WBJZckVXeFgmRB5Y9heTfoV91MnD5t+ApN8EiG9Us4M5CG47Qfgfdj2rJ0ueNjq+1VOb7ujw2zp9OV2udqrhAy30OTmJgt/ytQQCLenL2VYfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767355470; c=relaxed/simple;
	bh=59k3WvNfbtsHGqp3wrH4jG/zkpNkZY4RPujBPr3N4Ec=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=po0+dGHwIH3t+iCO06bKoMA6uG5OXZBGCyXi4K8Y9L1c8YqKt4EPkRMI75hdPJX1GlpXCuZkeleNBA4kLgBO9B9YxypH24HtBuC8yA22UTOJ474na/E+TcbUgBLYbm42DMJ6/HuMdeZmYUmRM4lErDamHRebbuwFyaS/mZulhhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfnBg3z6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E20CC116B1
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767355470;
	bh=59k3WvNfbtsHGqp3wrH4jG/zkpNkZY4RPujBPr3N4Ec=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=SfnBg3z6JXiRoZflPmOVGUHFuruFYuiE+zkZrLeS0AEQTeec4jgW+4ZJJziClTTQE
	 tXZ8fJVnTWbUb/KXHS+l5x8LEQF5LKb9u5iQRQqZgLXMtp7cyTk8GQKj6+Phfmy1wA
	 2Lx0oLJf4/0Cd//JpD7TwLulUvSEWolWSBZJMFveLSX30K5lfjQ2fIoIVgW/ToD3NX
	 UMeVez8z4WOgOi7b3n/tFCiRsH0y+xZr3Sap6cH0I+19WMv7KyWW9eJMHjq9Xnr/V4
	 bVxKz8oG+2sJVFGs1VETgutBH2D8fJlYRWeUwSQpbQPxhBG80r2sYtRPNnntR7wyrf
	 9DFt5+7ZqJh2A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso101092731fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 04:04:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUapjNLmcgtMVO6pU4eSMCNGCAh9A4DIXTObq/jzdi8uA5YDfu13REa3ZVwbrVkKP5h6hRsEaGoozA@vger.kernel.org
X-Gm-Message-State: AOJu0YysacgblLRlwAAAfDHtuV8k312jkJSwcV+7YjJWzP9x+KQ+GKMU
	ePzhCNSG8PD6FI3xNY1N7VqDuyPALn2kKx+OZ7/OzTkGaMvMNB8bXO8D74mltVDSwnkh59fNjdk
	VnTQg4JfK+tO4XpevBbw+YsCcM2gTA+NHPY61zU593w==
X-Google-Smtp-Source: AGHT+IFUiX6/gBsxHBbe8XiBBJNLN4AHx3ry+rnXue2rQrXSZAdwUQSv/gaC9bW4w7uNTZPy0KYDhnlDKOZnmPqAmek=
X-Received: by 2002:a05:651c:241:b0:37a:84e5:a1cc with SMTP id
 38308e7fff4ca-381216b59b9mr125204291fa.22.1767355469012; Fri, 02 Jan 2026
 04:04:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 12:04:27 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 12:04:27 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260102113643-GYA2060252@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org> <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
 <20260102113643-GYA2060252@gentoo.org>
Date: Fri, 2 Jan 2026 12:04:27 +0000
X-Gmail-Original-Message-ID: <CAMRc=MeHbod4CaUX7aff_guK531dwyoYhqPOP0rP=i9ydAKmmg@mail.gmail.com>
X-Gm-Features: AQt7F2rbDr8PJDI60jTnbkM-CN_H7pZqQh59NrJ8eglG_7JODhy0DFRdFCZvpcI
Message-ID: <CAMRc=MeHbod4CaUX7aff_guK531dwyoYhqPOP0rP=i9ydAKmmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Jan 2026 12:36:43 +0100, Yixun Lan <dlan@gentoo.org> said:
>
>> >  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>> >  {
>> >         return (u32)(gb - gb->sg->sgb);
>> > @@ -60,13 +70,14 @@ static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>> >  static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>> >  {
>> >         struct spacemit_gpio_bank *gb = dev_id;
>> > +       struct spacemit_gpio *sg = gb->sg;
>> >         unsigned long pending;
>> >         u32 n, gedr;
>> >
>> > -       gedr = readl(gb->base + SPACEMIT_GEDR);
>> > +       gedr = readl(gb->base + to_spacemit_gpio_regs(sg)->gedr);
>>
>> Since you're already touching all these register accesses - can you
>> maybe provide dedicated wrapper functions around readl()/writel() and
>> avoid any file-wide changes in the future if anything requires further
>> modification?
>>
> can you elaborate a bit further on this?
> I don't get how a wrapper helper could help to avoid file-wide changes..
>

Just create functions called "spacemit_gpio_read/write()" that wrap the
readl()/writel() and its arguments.

Like:

static u32 spacemit_gpio_read(struct spacemit_gpio_bank *gb, unsigned long reg)
{
	return readl(gb->base + func_to_convert_reg_enum_to_offset(reg));
}

Looks cleaner at call sites even if it's a bit more complex. Just create an
array mapping the register enum to offset and assign it to platform data.

Bart

