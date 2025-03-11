Return-Path: <linux-gpio+bounces-17442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98422A5CC68
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381A83B81A4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 17:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20652620FD;
	Tue, 11 Mar 2025 17:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SxDAMjvo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDD825CC65
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 17:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714818; cv=none; b=rXD0Z8gTaNNcPIZIQ0/k+8ZVhLDGEwF7+o3Tm40/qDzz3i5oycYWoh0Km6A8nzz6Rh3jDenlIu9Ivyj5F+7ZZ2sh5HVQ/IqXEGrjlGRrdLava/Z05MwDXl0byzsWXZqIH0kT39PvDytdE7g0R6QXv5HRUoCMt92PCaz5YiYcsDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714818; c=relaxed/simple;
	bh=VbYGUSmTNnixdgEmt/1NNCr6xbr4Z7COQFtJxnzbH9g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7k3Ey9q3tbBuuLPeg4bTq3YNe9kyBnQowM1D/Wl2PAFbW5eihTaNCWbdhDjuLbj+eFjpwRdKL/ZGED+QbXWhomnPVi7rx0uKzUe0sXpEzbt3cquBJrsMk4PlD4xOpnv5VwAd/IJCsI1D81hA9o2cm10LNT216ej+JKKl9+rYtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SxDAMjvo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30b83290b7bso63130441fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741714814; x=1742319614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IV4A7FjIIXcGVbxkl8zUvb0+9rn4w3FYp8bGnJNScNA=;
        b=SxDAMjvo3WIKUP4bwAwhZtMcxS+0ltgduzeSHZEu0LMcnc96phgqa5ITcGkC7upfQb
         LX0HqTxB+5z9DGFhXzbxWbilu072H+fGguWAURYQFbErdlVvpYkFttWdkYkNuht8ydoB
         CoFIZfYfv2/iwC48Ah2y2cog6hy4iFv4MSZdHWquV56aglqYZ8BmLCv+Hrb2QuFTcecu
         hgPNkG/8I6L1+8wt7P4j95vZQLShH0VLcsFvfqOC1dn2f4wfx0evmsSrqKn0bxgki80M
         xDU2bJA8Yq05dSDtVdg9TTgmF25FWum8eqgQghDKm6j8nPLEoARVmWmGd/BZnPapxP+i
         N5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741714814; x=1742319614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IV4A7FjIIXcGVbxkl8zUvb0+9rn4w3FYp8bGnJNScNA=;
        b=b91lUyobj99eHyHhxlOD1D5FD98VBJqU7/36ckb5ZSfeibBPk9qo4xztzWPWrHaKJ0
         xW2xUYdpSjsI5UfLNSBaZ6s8UCXyO9vgnZMBnDdQMhgZ97DVLfJdx5rA+mrD3aQFJGyr
         awtw3m5Ocjq76CBa2X1k/NJkS/EbzMiPNBBK0Jt5eh+7E4Vc9CpGMcdsmzqiATp2NY+x
         RQwfC/mor6B6hbLQGQKWcplk1GWR2opseIPz03Gs9SEoDTtlj6dFo5DWKL6jndp6R9EJ
         wUaxN0ltULn/Rw09AI4wX4a5BbF7Hb9pKsEVRpLz9G1IUNqU6wnv4ecmwK6ioj2db2qr
         8L4g==
X-Forwarded-Encrypted: i=1; AJvYcCUo02BRP5lUDUCb84My6VhJeEE1vOwkcibTZ5fq/3aUK8wmLBbKNKbMe3OmyYd7CSUS0/AvGaQ5eRbV@vger.kernel.org
X-Gm-Message-State: AOJu0YyktlwZW/WTNElEli39r9InaVdyn/Btj7MYK6ost/g+lsiy/D4j
	rlQO1veCpNC9pg4F079WmBQfwUKtBwenzoIfpr+s6fwHUKN4yGr5aQENKER0ML/dTnzCC0p0uLh
	oSHv5qK4gxPm9ZSw5AoiNyMuyKe+EeK/S2JL7YQ==
X-Gm-Gg: ASbGncvhv8dYCfWmZ+Wj5/E/0wYlfg9MP0x4ugegiUCTV+qSxdQ4jb4rRbVf9NeSTZa
	xJ+OfzOgvW7L/vo1u5SRZA5cpSBkYtfPb3CvRciqk0Efh45nBHtLtHFN68wPxpOKbJn55s5ljrE
	pkRBQzpVVXrNpoG4FQMU6sLGbwSZHfImUclQin/f29rGmiZXFKMEq2SGbD
X-Google-Smtp-Source: AGHT+IEuvtQ2Aa8ui5v8Z4Q9x/5NwyFYRVsfRfQLj8JoCxwI4zy1ZLtoE1lE4K+gMizXriyAcSjBDingm7foPZ8Yzks=
X-Received: by 2002:a05:6512:2342:b0:545:1d96:d702 with SMTP id
 2adb3069b0e04-54990ec5d23mr6740859e87.48.1741714814422; Tue, 11 Mar 2025
 10:40:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Mar 2025 10:40:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Mar 2025 10:40:13 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com> <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
Date: Tue, 11 Mar 2025 10:40:13 -0700
X-Gm-Features: AQ5f1JpW6vLa2FpoSUhjiNksic-uLUOCauiwaR_RX--eqjWOKs7E6VFVS8y4a1c
Message-ID: <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed
To: Genes Lists <lists@sapience.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists <lists@sapience.com> said:
> On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
>> ...
>>
>> there are now 194 lines logged on boot with:
>>
>> =C2=A0gpio gpiochip0: gpiochip_add_data_with_key: get_direction failed: =
-
>> 22
>>
>
>
> For completeness - same log noise with rc5 and through commit
> 4d872d51bc9d7b899c1f61534e3dbde72613f627.
>
>
> --
> Gene
>
>

Hi Gene!

There are two problems here. The issue you're seeing is fixed in next but
not in mainline due to my omission. I will send a patch for that.

On the other hand, the pinctrl driver in question should be fixed too.
Can you try the following change:

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
b/drivers/pinctrl/intel/pinctrl-intel.c
index d889c7c878e2..0c6925b53d9f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct
gpio_chip *chip, unsigned int offset)

        pin =3D intel_gpio_to_pin(pctrl, offset, NULL, NULL);
        if (pin < 0)
-               return -EINVAL;
+               /*
+                * For pins configured to functions other than GPIO, defaul=
t
+                * to the safe INPUT value.
+                */
+               return GPIO_LINE_DIRECTION_IN;

        reg =3D intel_get_padcfg(pctrl, pin, PADCFG0);
        if (!reg)

?

FYI: This was uncovered by commit 9d846b1aebbe ("gpiolib: check the
return value of gpio_chip::get_direction()").

Bart

