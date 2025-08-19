Return-Path: <linux-gpio+bounces-24539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF7B2C02C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75978163505
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D187F326D73;
	Tue, 19 Aug 2025 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+W+8ykB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D8D322A23
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602486; cv=none; b=LwSnrGLdJ3ojD6q9Wfgi6AuaZNyV5qGiPuuLKzEzgnjfSXF4MhlA9xqvy18qHwjAVXO37GpBey/ZC1v/36OUctheom8+jAfgF4COuh7A2UpuTt0tFAauNFIc/46/H2vdvCobDqS6ukeJ0g3YijmfX37z/xpy+d1AmcAW8sYwJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602486; c=relaxed/simple;
	bh=ykjYNDzNtgnJKupD3/EWV+NrnYl1HExXSP5IMAiM4Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUBFENF+BSRe76yOaCguOllOjetNOLUxEIWiulXinpp2Q3cwPV/v5pCvGkhfCoD3rsVHml0CdrnrDUJ2Ll8KNSH/WMdY8+5MPUN7ef5pTpI9S4b4OBFmsUFm+MegLqMvOs9sibgsn2OcxOQFUrLFoB61S7s3cwDyAOYJX4KazHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+W+8ykB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55ce52807f8so4815370e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755602483; x=1756207283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykjYNDzNtgnJKupD3/EWV+NrnYl1HExXSP5IMAiM4Cc=;
        b=A+W+8ykB0FB/jDRAE5MfpjH0f6vK/hz0UsLSn32HeM307l8kLO/s8DrmBgIlx2kdnp
         pIgrDM+z19oimRitPTCn79x2aJp7mJUNnXy+xz+fjo4fo4kt3RJHn7rpKw+2Z4rCNZFl
         NJcIaS+8hTOB+alRPsJBbKX3ZDEHJ/hiYyTYDAO3z9EFhFjQSuZvVx5bQ/tmbQ/9FQcf
         Y2wlF3++iw2J+mLbqEnfuy1nNE/chVE4B9MY46tKSsD1NV0nkexEdaRiIUvdGZ5yqh/k
         48njEwzStB9D8NIf4q4Pu3EDYqZHloyQ2N0JCiea8cdIBHV+Qi3Oigk5b7zogICSqPPp
         gpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602483; x=1756207283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykjYNDzNtgnJKupD3/EWV+NrnYl1HExXSP5IMAiM4Cc=;
        b=aUx4+4RNvBuSNKRK9N0MYvtnZaVMfLyi9hIA0vJv+Lc3UvE68205M+b8Q5utuuNlSs
         NbVfgglGyULnWfqg+6u0+D2OJsAis5TsasQ2MtzgtpfDdiqByLylXQigem0JXbXB7ut9
         4Z5PxTjmWTIXdMd9eGnDEjmhlyuDu+jd9RO0qFvCIOiVAqCanRgbMjxQuT5nlQki/j/I
         +cU2UkSyiFYthTKSRJpEiLX2RkB4CBi8FhuN6FkYVdb1BePTmiPtF+LsMuEiRx60mPoN
         z2RXygv+XJGtayrQb+dWUglmsVntbh+M2tnU2oPwxt9iduBquljPARlu0e/5eIaPoCeq
         QlpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPXLI9mP0cKQeTsy/iPmqeH7xDlrrWfy/fwxEeub06ErcyNWuG9dMMI8+D3sUqVPuvJJ/pvFQzPJkK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8CqFFJExj2xaRBxygxtbZg0IF7v/lng/FUMmvkEA+pIGdjA8
	4UfBNqVsGbcxaux4Aak/WvMWzGL49Gt6ivOkXsvJLQ4AyKtxAjIUOMo88MK0ibWt5uuWuqvNglI
	04q/na9mX/j8JM6puede5HeehlJF4LlIV8DsQgFqSKQ==
X-Gm-Gg: ASbGnctJhoowd08mJvLb6WOkX6f+YIap4o4CPfMmym5otFsMjihqZR+VfMqkTVRsPqN
	JNubhrsWTEkF3T7/7V/psOLs43/dFnsfE5iNRQVbVIEThRhlQ5fkHAvUjSY1gxDMvqXAJftkdFB
	3kTzgrks/1+Ma1Gj5Y0QMj8TAg4taNFNbHUQMnV0RT/a5R5lQE9EQVYNpaN9jwApIjtz0vnaq3U
	Mqt1wKi1Z+xMVZ0Srildrw=
X-Google-Smtp-Source: AGHT+IExSkHu5Fq2TPJj7mig+2UITCL5Nuo8n3oMZX7n14jJ1Ur8U/ZDpryXYMDT0yEbKr7vKt4NOQD/r2E+HVIENcA=
X-Received: by 2002:a05:6512:33cf:b0:55c:c9d5:d347 with SMTP id
 2adb3069b0e04-55e0083157fmr656989e87.35.1755602482535; Tue, 19 Aug 2025
 04:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812203337.731648-1-robh@kernel.org>
In-Reply-To: <20250812203337.731648-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:21:11 +0200
X-Gm-Features: Ac12FXy0UOxQIJg9zQs_ZT_Mh0mUXIMqwTPHMZ2w4ECrF-44gBtOF9LLtv4UU10
Message-ID: <CACRpkdZGD6p_QDRHXQSHWPk0E4N37RQ6HQXzBAGHo393ee08-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,bcm2835-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom BCM2835 GPIO (and pinmux) controller binding to DT
> schema format.
>
> The structure of the child nodes wasn't well defined. The schema is
> based on the .dts users. The legacy binding is a single level of child
> nodes while the standard binding is 2 levels of child nodes.
>
> The "all banks" interrupt is treated as optional following actual users.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

