Return-Path: <linux-gpio+bounces-25196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E018CB3BC7A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 15:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35537188B5A3
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 13:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A19A31A54E;
	Fri, 29 Aug 2025 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rc+DDYEY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13102314A92
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756473847; cv=none; b=C8mphjfHyovylvwJWuRLrFJcdfaXzYJhWEAFTKRkX/hoGwrsWTnJLE0fn7IQcCxgLBCUBMQFkUeKdTBpZpw1cjdxS3RmMPu+rD/k5vg48DasbHwbd2xUJ2leAe1oCOy/1lGjrI0BXWPjzmEcOJ/azMk8BDCd1AyyryOvKX1BKSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756473847; c=relaxed/simple;
	bh=wXzsx1MJCiUfMLCiENgBeqMz70ghwQgNgTNh2RP/1hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOCeY7/qvyt4zYn7r+9XD0EbKSiqCBjaICM5iJP8bxLbY4U6GDDuksQYHZWYektG+YKpcJMUa89kRm0U731MhkIEh/Ot5zJzKcHWz0+cBio2Jg8qRcFS+3wyUeoi8oGDKW/NkBx71617aQGKeQepFRP5mzW7MDBzKPNbfSKZSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rc+DDYEY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f48cb7db9so1974791e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 06:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756473844; x=1757078644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXzsx1MJCiUfMLCiENgBeqMz70ghwQgNgTNh2RP/1hU=;
        b=rc+DDYEY1KPNNv8s5+cd6e3z1wS/eRqHzmVhbwJy3Tf99lfKOUbmmI0YNuXLoC2FVy
         OHV3ergW63w8vTUmtrBAfRsn4WSjXiJnQTsHhVeRyI0yy6F1j0Vl1i+3kB20U3KGu8uD
         2d5e24/ucJR8XV4lBGkOGwZVKh8BonubXVq50JX8MPcCXJeMgdZEQINm/ntJrB8vUiWF
         YgQc5CfX2infHjkP487+I4OxRdTdmF8j8pclRPc7Kx5xS2MPyG7iCv30spiteoSqoU0P
         Kqi0SRhU6GGbt8A/lB/ZItq0v4bEQTLOPBjjiJjswvnSwoR50lw69iajf1YuQ/+ING8a
         AuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756473844; x=1757078644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXzsx1MJCiUfMLCiENgBeqMz70ghwQgNgTNh2RP/1hU=;
        b=UWVV7URBVTjdaOxzfUX8QMv/ehkCM/aZRL8lfBy4Cp37VzxdDew6kAOi4gjSOPCKa8
         CB2uZ9hFlQ1mGeA0r0FBZyLQDeMVUtjBypIuKHSrxQTMuwyJgFb+AxPzCivFPmIXIZcd
         nnoK72MbTnMgb0H0oluURyR/NPUsofxXN/PIn1ohYbKEQXszGuR3Ba3zdLnYL42/R2yH
         5uM2FNb1mmVnaMDUJ+82EC/0dO320e/bK+aV1sl5S0NtmdiRSGG7B/vxr6jOcxMuDKHo
         MOe+fzISEr/k8ZfSrrci6BPdVzsUU3Z/EllWn3koK7XRdONUKYMI72PeNVW3NvwWqymr
         llYA==
X-Forwarded-Encrypted: i=1; AJvYcCV/KW9mn9twFvBDkj/hmUmTjCLJfKVm0Z2ENkIK1G7yfA+qZo3ZJCdsNRRifjKPdidFZgdP3zydtn/n@vger.kernel.org
X-Gm-Message-State: AOJu0Ywah5cHKxMrYbz5mBsiTFjF7a/B40eAnHoi9pCT5S6wzqYtz4t0
	PtCiSUcCY2Kt580QNq4OR8YBtiW6jqfy2Pxq3HEnlz4IPntWYFHEoq1MxDxIuOTKnf5W9oaPLYN
	VbF2O2VgqK+rSzYuwj6x5DmQBqf5re77Wpkl/qGOP4A==
X-Gm-Gg: ASbGncs9ZD1Nkve6/lx3Ho2f/j1zOCiItelHQBvg1jHmLg3MS+U2og0ZBjpU/EbhVG+
	jTuSMNilaejRpcIWSzjcd8dxbBkI3+xSaGKsVvnQa4ru/oelaOVlfNFY0FeEX7XmV2iKFcTfkKI
	rHhFUhg2Fh1qGWhNFdpCB/3In5yqVpW2yG3ve+A1JgOwnrpmeJwuSh5y9auMlcPE5EthviFkxDB
	uuYT00ZJ1CJXe4NqSTBJQm7CC1o
X-Google-Smtp-Source: AGHT+IGhv7/RpJqaI0AY3wK8usweTrYHqhSjYJ6Q9pwb+F2gH89aEQL5Rpr/q/UoV1p1Pi5M5AqdHG8LQdEOwJmmU1s=
X-Received: by 2002:a05:6512:450a:b0:55f:4640:5782 with SMTP id
 2adb3069b0e04-55f46405d16mr5066606e87.22.1756473844013; Fri, 29 Aug 2025
 06:24:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
In-Reply-To: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Aug 2025 15:23:53 +0200
X-Gm-Features: Ac12FXwYkYIXdaT6LqG-InMhbx7U1_jxOkrDlOwqo3F__1FroyrMzzM08Kq_zvg
Message-ID: <CACRpkdajq9fHPqgYW+XYVN4TrTes1+94gAVSuZHazptVer5S8Q@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Phil Elwell <phil@raspberrypi.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 12:37=E2=80=AFPM Phil Elwell <phil@raspberrypi.com>=
 wrote:

> I eventually traced the failure back to this change:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d46efdf89306b=
e99f3c8824cf58e35f6
> It introduces a requirement for CONFIG_MODULES to be enabled in order
> to get an EPROBE_DEFER in the event that the pinctrl driver has not
> yet been probed. Without CONFIG_MODULES, the pinctrl requirements are
> waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows the
> probing of the I2C driver to be deferred, fixing the user's problem.
>
> Is this requirement for supporting modules reasonable? If so, how is
> one supposed to get the pinctrl to probe before the I2C driver?

No deferred probing of pin controllers should absolutely work also when
not using modules.

Send a patch for the above and let us discuss this.

Yours,
Linus Walleij

