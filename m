Return-Path: <linux-gpio+bounces-3923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B4E86C518
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06DBA1F22422
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0555D73C;
	Thu, 29 Feb 2024 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0idNWCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5425CDF2
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198861; cv=none; b=acwcNt3tdUL5sT+JFW8GId04dNkbeqvf+64YXE4nYSbUhv28YDVc7PIFn8l0hcaJX7634qo3VGNU6sMTR3Hjmo1TL9NsYUk3StucjrbAMzboH3nP7LMbCZRpHoRIw25emW/BSDn3nU90Hzv1DQxXfU5y16JjvBDyFCG7oVqZ7eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198861; c=relaxed/simple;
	bh=9l83ZE4ey06A4aJUaE5TydNkbGb2JTcZg4fYmpIqQjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5QGfk4AX2zamCwkHNM0Og7KJXfs7jX7176QW10qxB9lZ5f9+XEI3dojNBUxGocAu6+s+fDL+h4pToERoRltdy3GLr7ns0xAUGGXdevfZ5SZn7v9X94hYuUXaT6Q9jX8r8+6k4rHSrCZD4/hLrp/fAPeDgVk2AmpLdZdKNkyKZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0idNWCx; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1797702276.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198858; x=1709803658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ghXUJywXB0o8Ao8Lto8qx6tKwebHI6KHQ02iVqyJxM=;
        b=F0idNWCxZT1KA4o+8Dr631l8VSG7op6cdrKuV1WZclez2ctPF5K49no3deuej5UJtR
         ef+ZhB+cAy6MlFREv25SLVTxc8W/4pqGBkYPKHq6h4yNtzZs7rXVUKN1XLzVPBKWvW2Y
         b5dj4MFmuMGWbF17JM6v8idKZaay+mv+t2cpAjg2pSJ+MuctpKiJw75hskIW2uaNoo72
         Pke1ka//TbQfl/ibIsuNTuucP3mMWUiqOGLmMBQhmpEKX6QM3xIUCD6EcLHgzMB13TXK
         k7PKNkrLiEX1wQOs7ylGsQtrwGvEbQxf2/GCboM6ovajWqph37DHUXHqrnFGhW7Dmz1E
         1q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198858; x=1709803658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ghXUJywXB0o8Ao8Lto8qx6tKwebHI6KHQ02iVqyJxM=;
        b=EY3T3GGHyThpyJy2X56nkNRF/RcYkjFo9EeclcXQHD8CRnCvmBwkFmksnXeTrmfGZC
         +oMNkT1sTQMB0zeb0M2QuWuBDZQZYnXqSU9oV4RcsrZW1btEIQQlp8A8uXv4Na8ofM/+
         GUXz2FC/NTCsxjLv5GIfyiuejR8iyiwi3eBYSQ+9tLUGvIxN/XHXAT6zE/6Od6/Aqjre
         iDyjxh+zTujMssqiohNxCHfJYNyP8Ptpt3T7xGdDoUTRu7sDI7DYAw99mBP1IYrQ7dqc
         wNYwx7qmTVz0hof3A0UorN4sNueWVO4D2ZbxZi+ge2VtJ/Ck4UqJx4RfDWW4AJLyX1bd
         Aj8w==
X-Forwarded-Encrypted: i=1; AJvYcCXDaL3LygtAzSbvVkiyTyAh8kf2H7JYZGAASTzR1K8iUzjAg52J3X5cTl019QovPlk8LmchFfOiYH2EWIHg/FK1GoBTefQ/FHBriQ==
X-Gm-Message-State: AOJu0YwpSuNb5SwvX/vtmTb8w8yR2WqbTMLJMl0YTYlF/5JCgiaBLeKK
	b3HIzTXOliXTXZlWgYdyGIt4ON+dI6KkGcgjbzCU6+bU3C9bo5UR9HplBcbMifugREEZo19wMG+
	FtF3XlUOWALSWrtIO2Qv/Bzd0QDNDHyQNLfrR4g==
X-Google-Smtp-Source: AGHT+IGoPzsbTEYQbm0Bgw5eNAytfupdCPSQYRU3O2aSe2gHtzuNCVa3avMijfwZf0rqmCyeFlYWcJh/0SzzVJMMSCA=
X-Received: by 2002:a25:e482:0:b0:dcc:fe98:368 with SMTP id
 b124-20020a25e482000000b00dccfe980368mr822149ybh.19.1709198858403; Thu, 29
 Feb 2024 01:27:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-11-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-11-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:27:27 +0100
Message-ID: <CACRpkdaTv2C_T=TkrdKwJRnD1K68LkWrXzpejhZgzohFKjktBQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/30] pinctrl: nomadik: follow type-system kernel
 coding conventions
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Fix strict checkpatch warnings relative to types. Warning types
> addressed:
>
>    WARNING: do not add new typedefs
>    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
>    WARNING: static const char * array should probably be static const
>             char * const
>
> Total messages before: 1 errors, 40 warnings, 39 checks.
> Total messages after:  1 errors,  2 warnings, 38 checks.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

