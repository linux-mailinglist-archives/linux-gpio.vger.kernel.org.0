Return-Path: <linux-gpio+bounces-24935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D33B34040
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 15:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72B7A7AB178
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C861DF261;
	Mon, 25 Aug 2025 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mDLyigWd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523E1E1E1C
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756126885; cv=none; b=pRRgAAKgrK9FtNCukASNgH5taPo8YYh9cm53YqYbrQoHOnEHrgUmFZjPbyKLsUFEx2UpMEw5V1gbMefL0upQV2f2IAjUYf3d8OW2o8DXp3G+PNq28lc/cUyV3dWypckXtRdUVXAJWnipxD/qG6QHnN4U6Z8kWSDvARkzMcvmOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756126885; c=relaxed/simple;
	bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRZgdxzf/SmOlIHVZi51RPo6M6BTWe1Ae+l9TCTuwYPGwmroCrdRPohZKmHVUHrnivV6mDoMpWC0rgV5sC5PYnR4EYgPSOJXQVb0Uvh/kWyVZup3isCv4/rvP3Zdwdq3dZBE2WrQYyl2fzWz6h5jsg50Q0+R8MSL56lkUPs8beQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mDLyigWd; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so3430776e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126880; x=1756731680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
        b=mDLyigWdXswkeZt7lRAFvB3o8gZ8PtldTvaQo7OnXliJ+zpKptVJnADL2NscXTplbj
         AwpAwxFKwGRbARZLC5jQbBZpVVL49mpfGuz+QLF12U2RupYkiki0q9/OuVRecJuUcgHS
         OLIRnOq9i1lsDRgIwdzPwjHIRDyciJODikp8ycPDNoGeZJUNqEzrGjgla6a8IXxwOthB
         5Dod/RPvnBAnm1zCIiVYSGM/aLWg3smayGEh4BNDIEKkAD9sy5aqf5/oZNqL1rGb75iX
         NtdlXHOgku9IsOaLH1si+rlh7+9TRd8icLWOZBUaRdETWVsKnGIwf3yZ3z5ze51fzm0n
         j+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126880; x=1756731680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
        b=HkyMkvl2E0er8A1HfQFbzwTRNtdLafhWCQFE7dGwoNaWW/+nVuV5rWMZ22X3lGSVoA
         /kzljKmhZx8FnLM+swVAZMJHF3aXJ9AvYu2f/irkg8/gDfV43bW7YWVSN8vwmlnHpW4C
         dxuYj2iV9LMgNaBmJVWZ35vUX+LdFU9d/rJhiM+iZ7c9flf3zG+0YzMy5XuHvqLvIbLB
         xTLRPN78bAm4WkXPIqB+pW1uL7mivwNLR448t6HPkZv9+n0Pb9i0+1JZ+q4ZpfddEIod
         oQHgu7zyqEojuMBSejzoDojIKje4pd+xwP9VJ9yO9RVty0/CwIkN363FbnaHWcg9a6ou
         LL3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcnTg3yY4oWzOYNg36j7PjZ7yVw2PBD9DZ/3BXJyYop0I5Fn9x3Zb+jLlItuJHcoYsyfmVKCMelQTV@vger.kernel.org
X-Gm-Message-State: AOJu0YzfshNW0y0WJqEeVfxiBvgZPsz/plbAcVPrt9B9KXl1iM16fKKx
	v6d2sWK9O6dpIQ4WeA3JFdZIq+4kgKqA8BMDbXXzTcmdwDkSoj8Pbq4GZB9prgN75WY8lCkACOJ
	lN3mIBvacwZthCgMOCqCtoa4HKZOnjPXRYBHUMw4Uzw==
X-Gm-Gg: ASbGnct+Cr2wNPV5X6JABHdnV0vjssc1AwfPzGUvfcy2MpM8IS/EJ4wLnLa0FhiiFd4
	JLP9H8JJ/3MaoRFMhRpYL4IBTyKHG4qDGo5YdafoLFvOL7lEeJG53cUzlea7nd+caK/athCrvon
	Q6C85NKveG4QR0ggCXX3gOEGLmrT3Gl5igXVo1nthDQkLTI0w+MyiNT5GqZre21JZAF1yjVnM4E
	tS/MMzL/QNgYjsaQ7sOY39+sirGh3aOIOO6mElgyrdF6H/vn/5VIfHmkJQd
X-Google-Smtp-Source: AGHT+IH5N5gh1e2Wid0aMR0FMRyM9pyDqp/u65+mskc935zM8TPlDDSTI+H4ckU5CTPXH5byLfWl83YU1oyPWy+p/Uw=
X-Received: by 2002:a05:6512:135a:b0:55e:11ca:1549 with SMTP id
 2adb3069b0e04-55f0c6b5589mr4032238e87.19.1756126880025; Mon, 25 Aug 2025
 06:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
 <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
In-Reply-To: <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 15:01:09 +0200
X-Gm-Features: Ac12FXwiA1VNOuENMZgX8e0TVhBXubdvgS_jWd_PUQ_1hAXM92SKRJ_pWmQYzEg
Message-ID: <CAMRc=Mcsvkt1OJfVmB2peQJPpEKqFJ=6=86m=fd+VOEoMGf8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] soc: fsl: qe: Change GPIO driver to a proper
 platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 2:56=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> > In order to be able to add interrupts to the GPIOs, first change the
> > QE GPIO driver to the proper platform driver in order to allow
> > initialisation to be done in the right order, otherwise the GPIOs
> > get added before the interrupts are registered.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hi! I retracted my review tag under v1 because...
>

Ah, sorry for the noise, you did that in a separate patch, please keep my R=
-b.

Bartosz

