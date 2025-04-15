Return-Path: <linux-gpio+bounces-18821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4BDA89631
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 988493AB735
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8803E27B50F;
	Tue, 15 Apr 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCIx/Jit"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92E275870
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704810; cv=none; b=BXB0vScbZ7AheVBZPCT+XEj4YgKsiJFCRn4T3islhK14tzh2foC6sd1DOJfugmSfi6tiMhdHLX64FTnB1vZOaBvqySxaYGMrnZOINVmgdE7h92v1ehyuAektUJj/lwaKtBZbgevOZhg6PDU/RSEJJA1EzBnY0m5gobE0Ek75fpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704810; c=relaxed/simple;
	bh=G0SXbcSPD4eKG170yt9sFXLWLNU52miss6t6Hiv5iPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfRHgY4TnS4rJh/GO9T/tKfqV795QTJ8oX9h7nI9YwO8TY6o1EjlRhw4ZSGjaBJSqgr2V+qPYTCrtUO5ujw7ImrLzhkurarqYr1w6F4jYjDbRuYBzNNff0BuavtzZ7Mx28Msx2OP7fubETo36/QO7c4+Y8ip5I72LqSBZbwVOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCIx/Jit; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6575629e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704806; x=1745309606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFY4iz2NkMkn82wtqK0wu6zYdnpLwKWjcxUnTT45RU8=;
        b=ZCIx/JitnnaWQJAXvBnCeoXK2NNFa/Zgpi6Qw9k9RIafy5HnXqtMrzx38HnO0NbbIS
         pUJnVbm+kRFoRchhUAum0QhtLzCPNmE9V2qOSj/gFWbfzXtFHOS0eqJpQhdJBvDMTeni
         ydC+DZQxnid3SSKK4R+aH9t5qX7FT50KHDC/NCKZpH8MEWfHtoFn3c0TnzNffLX2jz3R
         bsNFC9So1H7uJxxep8yHt/i3tDTt+tj4bAmRbyiju0c5CqCVs5CV+CPV2V9CankEsQ7G
         3RORjGh5YWxYxlSjDgAGA0xUS1u0XndaTwIl0FOCruy9PM/qSx6yV6Nl4wyNhMMYg4rf
         UY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704806; x=1745309606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFY4iz2NkMkn82wtqK0wu6zYdnpLwKWjcxUnTT45RU8=;
        b=Tgfopk5H5wOaGivbYzlS/qwwzg8Owuk4nVMMvEJ5mfDYbebjQcIOInBpXNLGYncb1E
         fVSBedUnZb2FdYxuasy3qiJxXOn2Vn0KaPhYDSV7pJJxO/C5vyKVkl+XMC7Ez5dYAbv4
         nVT41yUsQ5eCnZO1PiNV8weySOxyui/DTLa0/KLyliuj/kzFGX+B6oMchWl7SgAacXUM
         ombUApSBvQHNoA4GVYIt8oVKKFy96nJNrJdE+NEU69izwssR0hvrRTsvpW1KYaLEPGhg
         GIsYWJQr2mCNde6fc0sncIFC/6qZGGDJvNXPoy+U0e57qZMsov1d4VZkbH4a3QU0rzBq
         HeXA==
X-Gm-Message-State: AOJu0YzKaZPBGltVTCUbqpApLrmXJFZa3AggAfzPB/2arPK0706bWDow
	r/0BuQp1GVd43zUEFbcUwiljckR7glQcY1Q/znfq3Z8oR9UYe4S83gUT+uDWIiSn+ciCiEIKChR
	xZzxkLA46fQ2Dy8YDlSN18Z2xQw7abRrhn377sw==
X-Gm-Gg: ASbGncu1jxx5MEJJy4wyVFDxfSsywucPio5mwOpG2Yl7USTSua8kFeNVhjLFZ2ogmra
	n3pcgUYNlp215A01FU4OEA4LC91smlK1sfk6k4VNuLs90Bln10HkAt3LAOIfuMJJaYhtVDQ3HOt
	MsMMjiyt/9wVFmapw8aKZ5uw==
X-Google-Smtp-Source: AGHT+IHxu3L63YU3X/OHUffJLZIcNuZL0P4GMbc/IZR6G3djfSF3hlUGgCuVWz6iHBq9HTYYouQFmi4C+M66/YtgIJA=
X-Received: by 2002:a2e:bcc1:0:b0:30b:cb10:3a20 with SMTP id
 38308e7fff4ca-31049a7fe2amr53834191fa.32.1744704806469; Tue, 15 Apr 2025
 01:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5879304.DvuYhMxLoT@lukas-hpz440workstation>
In-Reply-To: <5879304.DvuYhMxLoT@lukas-hpz440workstation>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:13:14 +0200
X-Gm-Features: ATxdqUEIY8Ee1-V3nQ_ndtr9ZjLOof5UyRNAsAbubag6b8OmUtmIRFDymqGDsXk
Message-ID: <CACRpkdYbZfcyGUUCe2NomFHAoaychOTBjr+k6Xyqe3AjEq0+wA@mail.gmail.com>
Subject: Re: [BUG] pinctrl_mcp23s08_i2c: mutex used in irq_bus_lock causes
 'scheduling while atomic' with matrix_keypad
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 1:48=E2=80=AFPM Lukas Schmid <lukas.schmid@netcube.l=
i> wrote:

> I'm encountering a "BUG: scheduling while atomic" when using the MCP23017=
 GPIO
> expander with the `matrix_keypad` driver in IRQ mode on Linux v6.12.20

Apply this commit from the upstream kernel:

commit a37eecb705f33726f1fb7cd2a67e514a15dfe693 (tag: pinctrl-v6.13-2)
Author: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date:   Mon Dec 9 10:46:59 2024 +0300

    pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking

    If a device uses MCP23xxx IO expander to receive IRQs, the following
    bug can happen:

      BUG: sleeping function called from invalid context
        at kernel/locking/mutex.c:283
      in_atomic(): 1, irqs_disabled(): 1, non_block: 0, ...
      preempt_count: 1, expected: 0
      ...
      Call Trace:
      ...
      __might_resched+0x104/0x10e
      __might_sleep+0x3e/0x62
      mutex_lock+0x20/0x4c
      regmap_lock_mutex+0x10/0x18
      regmap_update_bits_base+0x2c/0x66
      mcp23s08_irq_set_type+0x1ae/0x1d6
      __irq_set_trigger+0x56/0x172
      __setup_irq+0x1e6/0x646
      request_threaded_irq+0xb6/0x160
      ...


Yours,
Linus Walleij

