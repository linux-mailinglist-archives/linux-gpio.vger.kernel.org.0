Return-Path: <linux-gpio+bounces-18817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D33EA895F3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4168E7A244E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28FB27A124;
	Tue, 15 Apr 2025 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOuuhxXS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF5F4ED
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704192; cv=none; b=rlhOBsVUisxgnMJfoOOlvnwCog5JCvgUnE1hZ5+4186mD6ysfnQQ9rfXP+FjjA0rKacyLa8hcC2a2FuTjkJ1J8H8i4HuVFNaj7hnhAJXprqNL+eKUdlyWA9BLn73BN3Z11c0kOS6LU427qIO6gqtM5/qMzQIyZUbNRLFJlf83Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704192; c=relaxed/simple;
	bh=+V55qGdz3nFmdjae2o/u6EmBjC6s05SCXJObXnBOuI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NelSX+Ji93z5NqSIWiqb3tijEundmEz0E9bhJfxZXKbC+lwLQJOVOtACbIy7JZCPrf56G3wcxK7Zr+Cv8bAnIQ5MbefUqhdBl/5Z1ynXLeZoTAlj1X66VMqOsDyEh2ASj8MYjEYoTE/Eo+Suy4PNICh/TuheEwfVjzWuh4of4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOuuhxXS; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-31062172698so22826391fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704189; x=1745308989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V55qGdz3nFmdjae2o/u6EmBjC6s05SCXJObXnBOuI0=;
        b=WOuuhxXSM+lfvvdenpheaDc29I8yIZJfYlbZyIp/fTjHaC9Jkxrz8JNGD1CfUvsSWk
         i1MbPL8s6XszMsqVhiMtiDD/ULvbeVY2cqB4qbC69H9QrXLBhFx6/ysOMhn5dDUZBk4Y
         p51kXoCZYEflXvWL+ZlFgsdBTH1/FhbX/fFG7Dcvx1C2O+eQr3YbJIv0heUUBU2q5bPD
         bU7NFvYSy3yt12vG3bxPBSQOglByRYbSD3Q/YDE8vy6j7ot+tszb2PwD3jRKaQNX6Jvs
         sSh7GFP2m0FNg0VqbJpgx8X2jgDR3QHUPgLhEwnpcwD17BqthCzkv6zP+29ShL4Hs70t
         EZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704189; x=1745308989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+V55qGdz3nFmdjae2o/u6EmBjC6s05SCXJObXnBOuI0=;
        b=Gxx1Y0/IlwgCSAqvHEp39a25Tcp+Yygr4wyCbXypGuMSI8VTxza/ERGKRsdr9nOV8U
         qypHljp2STpLFNokPTvjlGt34z932eCrF3vlT33xjpy0FSBrv8uMLjl+81ejOG+KxuV3
         ysyrn3oOyAqJHSrQOMLsOUsOM9rqTGrglhCfwg6aGk/kRW4Vijf9mInh84cHpbkSvFFu
         W4YUsi2cfuuvOrExjzR8S4UQBysBsx/ugek3Wc0peKAVwGP0Be+NuWOmur443caYKl6s
         SlB4UlG+E/6mKvvYerM2v+3DcS8B6MN2Efv8LW6IIX/8feyGycIb16nKZD9kM5WNbxOS
         Gx4g==
X-Gm-Message-State: AOJu0YzobET0kVsNiPDDD3RDTU0wUxjeB7MsVuuPv3opKWj6ii/9yNXW
	v3IUWS1Q4/qMxqWwmnh6JNEGHqPS0YWU095ewTuaZwdXSeo7v/iIdBY4wX/QcsJlNG8CnS1i/Bv
	trbNTrjW0bLxdjJNYn+9kTi9Z+J0orKqy7DBS6g==
X-Gm-Gg: ASbGncuQI5Ev8wsqcnrcMU4Iog+j19dpLxsRO2q7DmbmUFbPVONESjTcJYFMounl+bD
	RcPrcj3c8Ri9hqAIaW2uYPXEPr7ZU9sb8Udy83+1bb7Z1kDCeLG8QFWlnPyV66pZvxENxlZho4T
	QRn9ck7tSKyvxjqdPm0lGnZyqJLXWB4XhV
X-Google-Smtp-Source: AGHT+IF8B7muO3z+eK2QnDzSM9ONUyOn1pOPX9ugb37B1zPs9RhHVBq4wiGGWi/LmGwDob0ku420OA7XLCJpPobaI30=
X-Received: by 2002:a05:651c:210d:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-31049a7e5bfmr59334191fa.28.1744704188733; Tue, 15 Apr 2025
 01:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com> <20250402122058.1517393-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250402122058.1517393-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:02:57 +0200
X-Gm-Features: ATxdqUG8QfFP3eJEKd-SVmIh30MEixKKcvWkROjudjJnuccbbmELYQ8FlwuP_As
Message-ID: <CACRpkdbrRWVOkwU932qehOK8QOZvWAuo1hsnAtV3u5uJeT-Gdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: of: Fix the choice for Ingenic NAND quirk
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 2:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The Ingenic NAND quirk has been added under CONFIG_LCD_HX8357 ifdeffery
> which sounds quite wrong. Fix the choice for Ingenic NAND quirk
> by wrapping it into own ifdeffery related to the respective driver.
>
> Fixes: 3a7fd473bd5d ("mtd: rawnand: ingenic: move the GPIO quirk to gpiol=
ib-of.c")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

