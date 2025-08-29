Return-Path: <linux-gpio+bounces-25214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A8B3C4EF
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 00:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D17917A97B
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 22:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1248A2853F1;
	Fri, 29 Aug 2025 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDi4K24y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4172773F5
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 22:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756506943; cv=none; b=ajQeCfHjpJFcgKfOxe4kEeVh82X4+1V5GIbl0Eqhb7gaXJXl+qjLx7kr6q6kzHq2/SKPfmStltk4RluImebuXsx7UIEGOcpLk1e8ENyH4VHBxkE/dDIm07zWjSGxO8W8Hb7bW4ovsU94D7mkM+pVqNIpXC60lroXhJ94NyL07E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756506943; c=relaxed/simple;
	bh=eiqGOOae3EdJGJptHPavb7mxU0NwavWApAugMJCrfOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCMJKZ8llcKaoNxr7OaKI4TsniKNyiA8C/htCSDfcvLN2hvrILwW8zgPqmfHtZYP81Fpv/zOq8LzzZvDEpUE1lJqf03g3gxSYbcELTUN0skbxLIhsehFwaXIf0P806UJsxLBiPZWwF8CX1/nK+mNaaIrHZ1jMx16IeUEc93cBsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDi4K24y; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f687fd3bdso1601004e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 15:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756506940; x=1757111740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCe2nWzQ9f4X+pw3fZPRIrwxw45dAvfUmdhvOQ7ScpQ=;
        b=cDi4K24ycNwzmwVznYlL5qo3ALd62LrZa2cYBVMVMgT8xnOP4lkQvzP7MeaLYK9EzA
         1BD16e/Xi3jq93ldibu3nnbMTnpRB5m9gliIhR47mFP5l5G6eVagZlF6sbPyDo3Ay7zM
         v+TcrXS8pzgJd9kkBf07eIHUPj9WxF2BipRNmd2hiM3m4p6Ophdp3tmWP4TzrEtw/iXR
         2qd2KjjAPKg2fuUr1TFOcAzLJ2jE5131FsOCrtmoHhufbFuzetJDUMhjzdW4SkR+vH3k
         PISJ6V9teO6t7e7WWpsMEqzNvBUsfylpMhqavOLk/ysTAXaqL3ZHPcw1l5bOWvAJBP3N
         JHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756506940; x=1757111740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCe2nWzQ9f4X+pw3fZPRIrwxw45dAvfUmdhvOQ7ScpQ=;
        b=AGHXl4Xb4W7iRObsP+eL7T4X6lWYZ3Tnuo1hykmdBR8qNfrAlBbYAnEr6U2Z35Mjev
         s2ICNoA0EGfl7UiBoitq8yr/B1pajW7RtYDGd5deJCVfWOZS4aluVvYTEt5S9fYy98SH
         GfqCir8u/9XVrzng8oxVsaCQkwsZ9Nit88CH7tkgJrMVPZrBFg1wdBdfhwqaRTnsCx1G
         6lUb+oiWzBio5ZVaA3KSQnL6mwm0F2GexhvHf2XGG91LXkuNXfBMvkaIplOh2hCneuKx
         xqVB36ojrHU5abe/SzizNo1XCl5oTVeSgk61LdAkvX5YntiMjyxZ71HUGjY2MClOoadg
         DkFg==
X-Gm-Message-State: AOJu0YyF8yLtcNGhIr1aBkjy+aAJAl6G04Ky5QjV6PoGpRprPbG2tWYd
	uqTVwf0PWIpYDfJIVHQsI0DuaQJJi5jfgWR7e1NcR/WfgUQGPKW6d61mOiu8D4SdzQkKJ37qpFe
	OA//QaptpA2dlW6wSV9OC3rIfm9eeMP1QyF4I27bf1mR+eRXuanWs
X-Gm-Gg: ASbGncvoN11WRM74s64VUWthX+qzNc8X4oT9cpdH1XGnRc+Xg6peKglwJ8aLSqDLW0o
	4u95BCRI5tPrbRcZSsL5Wwp22nwnp4LIIHoXD4Xxyhxrr2SWRpfzVd0II3hxco2Lqm7am2XJQ9q
	p1JfIAX7+fktOTmjGWWTSTZjjlq7yDwvjtN4z0VQ7w0Z4GMKPfeyiNDbKKl0F7c8oOzSixe6rE0
	XiKOSY=
X-Google-Smtp-Source: AGHT+IFUZXB5zF99B4bAows0SaaIE9uHTrC0VJ/DU5D9kJ5ynkvZy07TlkT8JbqTaxjgObA9xPWlhSjEKOFjOgQmDaw=
X-Received: by 2002:a05:6512:1093:b0:55f:4dbe:1c72 with SMTP id
 2adb3069b0e04-55f7099d3c0mr47006e87.53.1756506940254; Fri, 29 Aug 2025
 15:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756469283.git.geert+renesas@glider.be>
In-Reply-To: <cover.1756469283.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Aug 2025 00:35:29 +0200
X-Gm-Features: Ac12FXy3ikQLGULFNwfosmwWylus5h3T5AoVrvR45r6uOFf2mmc06JViiu4VHV0
Message-ID: <CACRpkdYKqEdX59Q4avn5789gKg9U4wnXCkvns1djydRWiQgxcw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.18
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 2:18=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.18-tag1
>
> for you to fetch changes up to d1d31e2739ff063da1e85cd9b44316ca5cccdba8:
>
>   pinctrl: renesas: rzt2h: Add support for RZ/N2H (2025-08-20 08:56:15 +0=
200)

Pulled in, thanks a lot Geert!

Yours,
Linus Walleij

