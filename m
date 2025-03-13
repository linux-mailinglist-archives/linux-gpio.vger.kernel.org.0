Return-Path: <linux-gpio+bounces-17523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA6A5EEA7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD90A19C07E6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 08:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29D5263C77;
	Thu, 13 Mar 2025 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yu+k4P3l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA1726389F
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856227; cv=none; b=lKBdJLXp+kc1IDOB273CLqtvTYwq5+bbzdtP6SZ6LYxxAiz30+T9loF7kqqpr6OQI9byk4J9M0Ttm3d9k+cHsjtszOVLbboVLPJZvjUj2xIr/RBPMJ45zQLYa+RBczAyRfSt1EITdepIeEZAWb+z3qhGFbVkdWJTh9pBLJAMqHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856227; c=relaxed/simple;
	bh=Ivqr80vJYm2WwldevQa3/Plm4RkHZJQ3XUd07B1S0tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mh7kG/c3TtgWKkyXgn3dVhoM/g1r57M6d8hEIRT3ah0KDmC8oRMEGBNH8tFUa2Nfp9Nd6rrzSJK3MPedEw6GxBBkd93RnM2S9YUP13p2CYDmNGw7eexNMUFw0Qx7v7EZubF04sxV/VzwRTdYdiQ2QDNZM3jTqXLn63XZ59f2Uoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yu+k4P3l; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499659e669so787053e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741856223; x=1742461023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+r/LPuzqlWdCMsKudu78IFjhkJbXIXzUEIK1BVnlB8=;
        b=Yu+k4P3lnqOfb8SVaEkB/MxNtmPDcHbktMdKvu4tIXt6PutQQDjpEBSb2hJZO2ZF1c
         oun6GNnsKQvcJavq57y+2U0cZm5WorXrayu1qOOtwu+V25DhNEuQLUg/WcrAx5Xdeo7a
         ndl6fC/91qC/Us7fgYOynBI7OYENhQFV7M5xRuRtOpryEs0/VHbN/VZi9CX1Jh7+7s2J
         FbbriUxTMHwl2X9hqYzyau0ChkE0QCd+ncO/261eM9Ysot9KVZ0VGNOl891WIW362i4I
         zQahd1uND8TFBcGNgQcSbgMPtJeNUhcTLE559uxukhDhO6ierBiBeu9qf1jhIhy8J18o
         342A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856223; x=1742461023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+r/LPuzqlWdCMsKudu78IFjhkJbXIXzUEIK1BVnlB8=;
        b=r3K4Pqo7JCmV7xtqIO955FADQt181P0WfxZpyxDGLFHWF55exJ82O6mdnetDfeHvdo
         3Rt2JSSdJAbcJWTZK95T7SPGd3oL1UPcU1NhdvcrA00gTHaHP5/MDqCJFvwAv+CPL9ng
         a1blCWjEwr0idRc/wRfBZEQazWcJr6ekMkGee638BAm8EweW0iwMCgUYGW2jyVu2TMoJ
         +gAOVFpFzih3QAnf+erGXcWfXuMKAvSc1BuLGtaRp6Ph62xQZyOywgKVqd2gEVxrP8GC
         LK45h83mP00X6v7uwLbyL9/Uu5zNYUmS12YGyKR0vmeJhJDa7B9FLB/kDtXE9Z6ewBO2
         J7Xg==
X-Gm-Message-State: AOJu0Yyv0mX8kYZMtw/vKObB2oPYuYk/NVHdiMP/UdJIV6LZmEAIKlj9
	F+2UAhpUe21SBsC+aMDA5xi41MfrRLutUQY/DEXB8f9gxNx2MeFtQwJwBpDzrAoX9a7SoF0cFoV
	jAbGmfmuyAj+GdJbElbYQlYqVl6AqAXUWvhhwO9cQUGLPLcBVAIw=
X-Gm-Gg: ASbGncvrQbArzDF5QNTCoxK+N8btXYQBBZ/8N0fDOLDFHcwCg/thcusOLdBLJ/WvA/R
	1GJpwRn/X0QZJPuSXLYLcYRsFUBwSxjJmFRjKYAd2rx3+WorQwvib1gg2areiqII19mTMSVtTJd
	7JXoHaMzGdEpTACvy0iK5p1gsPptXLqquAaIsz
X-Google-Smtp-Source: AGHT+IEezMOb+ZdOyknTzT4hCyq2v1zxg996QyXemDqIP5dZLdHUY5j6nqtU6ero+E3TCd/I8hx32FgueCcJj1vJKLE=
X-Received: by 2002:a05:6512:1392:b0:549:903a:1c2 with SMTP id
 2adb3069b0e04-549abaf0a9dmr4589475e87.49.1741856223193; Thu, 13 Mar 2025
 01:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1741362226.git.geert+renesas@glider.be>
In-Reply-To: <cover.1741362226.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 09:56:52 +0100
X-Gm-Features: AQ5f1JpSyrGA1YoSxf1yp2gG6P-ZzbiTVhn0GhGabhXjZqF3z7TfAzZPncNhtfQ
Message-ID: <CACRpkdYcOsLt5zr+MokehEDiej6W7fWsj4UkLJ38nwJ+FMcKLQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.15 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 4:47=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> for you to fetch changes up to abcdeb4e299a11ecb5a3ea0cce00e68e8f540375:
>
>   pinctrl: renesas: rza2: Fix missing of_node_put() call (2025-03-06 16:4=
1:46 +0100)

Pulled in, thanks Geert!

Yours,
Linus Walleij

