Return-Path: <linux-gpio+bounces-23565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D5B0BDCA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7A418863DB
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92E6126BF7;
	Mon, 21 Jul 2025 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BrZXcSW6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A5427EFFB
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083418; cv=none; b=bxAhZe4REZbf/wGM4GpCuwywnDYSXGNDyDlBmdA3zXPIFIZiv6D9J9tBlCKdDYK++LGXkQAXZ4JyUI6UGuxFna/6LrzT431JidXEAzdxSHMg4mSQzBvFcxPUtSWndh26z7MG2O51f9dsu5Tb44XYqAigxqn0GPV0sOiQbQH0M2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083418; c=relaxed/simple;
	bh=W+3BVDyzmvGdFa1u6nD5JHSqNEgN5FIwnW/EGkuAndI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSULPcu7buPl5Ict5TzY/FJB2paeOHdxGh0QBtmDdMeBmj5mTYtZZTTVU16oIW8dvMfSXioutbUPAJ8SwwmRyRcYpI5jr4UTiTfz/g5q9F1V+Dar+Vj2Ro69LOmiHxL2IXRZRGMkcOrHelHKV3k0/F2TdwOy/EWzPd29R0cdXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BrZXcSW6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55622414cf4so3480836e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753083415; x=1753688215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCcRznh7VYH4gZd2/W4WmK544xl9J9/zt9MYaOBbOVE=;
        b=BrZXcSW6renMKdMZVhOGVSA+oxx1oOYcmyxurQ+pEJwjptvkMpOAlnfoAAwLWyDgE9
         848rE+XTgX1+Sg9cJP2B0i4QilQ4bYR80yv4duC+71Hdsn3QEdn/qvXofaJepl7mQ0vr
         gEIAHAoh7wIaJGdy45rcZRGGVCDuPDv8ks3IezsN6UCxasz0IVU2zDHpXtdUE1GKbEvl
         t/td5JhyiSEEm3S+/EA/K/GrswSDGJL8F4HTviGnLHgRNT74+1ntxrpIrbwzbuezoxuu
         pKyYFwldrU/f6krH4/H1VIeCci+E2fQpn66IU0EgKs18XBSqYIcV2TQ51rAOqEZQxQoT
         0YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083415; x=1753688215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCcRznh7VYH4gZd2/W4WmK544xl9J9/zt9MYaOBbOVE=;
        b=WFtkMZttvclm8iVrqcN1mUgQrpnBSMXcx7JALO6KlMTbnPvagqLxh/tP+3rdeYY1zB
         hjIW3+DUe3M+npC+ZAoHj/SWqrGmxpwgL11M7zMxYuSUMiMNlUQ94Cfj8acA1aBpj53B
         ha2dhokkk5EwLicBWtv8dziaf0K2ofk+DPZBI5NCcPXb0vFp11Lk87nyXh88mgYlr/BQ
         1dS62TsyRY4ivK2gRYRxL1NKZlT8ekGuQndewZupjPaGMC/+KUPvkPPt3lueoisUuHHw
         q8Tq+CbqPVL+DYFSxwAJrGIMzzLqpuYYz0eYsN3CmwRCrKJhzu8+LhZQdH29K2OV6b+C
         Y5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW3w3gSg11dHtTzmwcCAJzB0m/Z784BSdt6pH5wWsSSCS30bKHGiCWNmO4H7fWmg797TtWRAMwowQYI@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQTkG7XDzNQd65K0USmH7G9b8/NufaDqxlkUZV5YNtVRqc6Lm
	C+awsyJj+aNzjKW5NmS8LSNuy1cQHxdrG+fXQqttmW6hxGLv4TEM1Mkbxa5ebIvHVPHTgaQi3AE
	+6Xr535mBWxRux2YVYNEPNSKpdvWrk4ULFLU6b8F8+w==
X-Gm-Gg: ASbGnctq8dVzxiDNaC8y05rXDn5TqGZY4H2dG55TXqtH32KzbIsqSHdu3+1AxD0RYuW
	R5iZN0JuRfryyFSektOAkOhrSfVWSVsyeXVp5as04FIDTpODqbk3i8jLjpgqXaRa6dNqaiCFenH
	i2FVUxUdInda4eCRUCt0xRuBEK7HV4RHr84tcDMx6uof/XeqGElfzenuQYS9xn8x5dew1nRowPk
	n/NStx0E25Q85PZtNKYjLqJSaba3zT6qzlcrNE=
X-Google-Smtp-Source: AGHT+IELv+QneN+tEu5OAmEa6/FLWzyGRa+zJ5LL19ln74h8R06F2aaiEp4Ksa0u2amUfj2fyyuMy+fewJdHo86WykY=
X-Received: by 2002:a05:6512:3b2c:b0:553:d444:d4c4 with SMTP id
 2adb3069b0e04-55a3189eeb8mr2807153e87.50.1753083414855; Mon, 21 Jul 2025
 00:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org> <DBHK5WGFR034.SME6DH80HYRV@riscstar.com>
In-Reply-To: <DBHK5WGFR034.SME6DH80HYRV@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 21 Jul 2025 09:36:42 +0200
X-Gm-Features: Ac12FXxVFPq3KA61nqAl8ITktzuhIR_zuk3Aa8pTBGnvKLoagEP3XQTb1geTb0E
Message-ID: <CAMRc=Mej2oAp7B3obnBv-pB1sg3P-1EQnUkpneoVqu2wCEwwCg@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: rust: make Settings:new_with_settings()
 crate-private
To: Erik Schilling <erik@riscstar.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 9:34=E2=80=AFAM Erik Schilling <erik@riscstar.com> =
wrote:
>
> On Sun Jul 20, 2025 at 8:16 AM CEST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This function takes a libgpiod raw pointer as argument, is not
> > documented and should not be part of the public API. Make it visible
> > only within the libgpiod crate.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/rust/libgpiod/src/line_settings.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Erik Wierich <erik@riscstar.com>
> [Changed my name a month ago]
>
> But, this should also be `unsafe`. Will post a patch for that.

Feel free to supersede this one, thanks!

Bart

