Return-Path: <linux-gpio+bounces-15759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6EA30FF3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 16:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93D06165C4A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 15:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25B8253328;
	Tue, 11 Feb 2025 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AnbOpYRx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1BA2505B3
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288296; cv=none; b=tvy67NcPJFD/Us0cGZP/ugpKnAnrCrxpxutAWnBJ5cWE9NHpDdYf3AZbkIpMWw+YiE2QerYSM070Xs7ryFe14Hm9QvY9evLZj43uL14HNg7mIttNlHEsXpe3kJempAENNac/pObIxUdj02mdh7+gFvQNKGM5wYsScBJ5GMsaYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288296; c=relaxed/simple;
	bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQUvkVE+jDvx9pv4NcjZfEgy34BKdw74ZDQ3dtNpXhwx3EHNjw5g7s7V/pQIs0L7GQ7Qnrsivl8/ngZF61i/epIKWcTJHicIgHM/kwewbudp8mlmTfsJarYyntR+nFiF1cOs5jZ3VMaPk8ZSeVxtiBzge3cv3yeMttAYPiRXB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AnbOpYRx; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30902641fc2so1596701fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739288293; x=1739893093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
        b=AnbOpYRxf7oK2fKXP5+HD+qWExDkvPfFxoD+BT5fqzFvFbUL1ZTffudblhH4gRjy2F
         MgSeJ5fS8Lq6GyrY5hwTWMbM051uq2keqs5sgHMKsflfpzB9XzTuqx6MGYBeWpERn5oY
         EiMxK4ZlugMAIO+m0jakOQKXVteVFgwpmO8yAjidELOkBLV9ZPcF/jT8L18I0fPXxbAw
         RwbBtZ2V4Odhc0yomUo5dhl1AMwnuDzHCEZo+uUwNShjPGYboH78utPZFVJaHgvcE+pZ
         +OF4ciBRDzeMkRJqIEcxZl7G/tX0dKEeOAIES3kpFgocECaiq+tupMPK7xCOGeJZe5e9
         tFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288293; x=1739893093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
        b=YPLfqQLe8/qqtpv/RfkGE/qaFFglxr2QCTTCmzAmh19rZjUF4o5hl6nZZC3Z2dCZOF
         MCSgfwU2Sx0wcYzzmScmEOjHWR/5dov+Jq3QXSOhuP8edAm6+AhUHHchsT7erfllU+2w
         dRVRg7hke+0ZHpjwbpuBbRv/C4kVOL+BV1y/O0/PGRctSlfZt98We6HkWcNRkjE0QkRr
         4VIkaHXWxy7l15g3OS8QD6CicH15bk0cF1knES3m98oJkk04XvbHx3TduSunIa3vcGMO
         bLHXG83f2RQenZJBQ6+N0qfvY1LutO7uXN4sfEEJlNoq2+Vh6VW10xeJkczsw8YKlMYg
         n7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUOZEYCejdpZf5mmiKv0dM9vxmt5HyZTS4W/iTKIL/UGCPLz9NXaeHkQcHLADpX/ViSE76SMBgnme+B@vger.kernel.org
X-Gm-Message-State: AOJu0YxrMrHeS8tdDtvlBIvF5Z0/vbPpaEaW/8IOjGLOl0vwK/b9pmks
	/8y/IQTrPKdgd2QkK7lNiBso4eP0dF9j76/0bP6jaMIUwYMBYGFN7wCo8KNI6D1hUnZHLSV+s1P
	W9m3z1gSu9UjAhFviOVv+74ZpUviRmu39SoIm4Q==
X-Gm-Gg: ASbGncv7dTboecsjVMq2sBg4gcwiiTgp12hODarxEiwCdQaFyqy1hmZ5I66zelgQKZn
	zAj1F4v4ODL9Igrkk6RrTlhC6OYxbsO6S5/KJ2g3OtDu2ICb8Am96zhQimukvPfRxA/zfpalJzg
	xHhRZh9lO6oBrU9b4PMnnYvjihrf0=
X-Google-Smtp-Source: AGHT+IErfIT8Go25NkDLkQfR5NhzuzlhLOzheD8LdphohjPe9lEedbA+M9hKeD09JvDHlwEEcEqYU/xf/b/UxeLa/b4=
X-Received: by 2002:a05:651c:2129:b0:308:f01f:1829 with SMTP id
 38308e7fff4ca-308f01f1f54mr26709121fa.6.1739288292563; Tue, 11 Feb 2025
 07:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211144300.964-1-vulab@iscas.ac.cn>
In-Reply-To: <20250211144300.964-1-vulab@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 16:38:01 +0100
X-Gm-Features: AWEUYZleW_jmzFJ6vP032FNVqBGUdDWvspy9Oc7CZIhN6a5pEweY78yBo9eHn50
Message-ID: <CAMRc=Mf+yuM-g1XMVpTvOXfMvf6t+saMJYfKXuCZU8fSfzxdtA@mail.gmail.com>
Subject: Re: [PATCH] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 3:43=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> The stmpe_reg_read function can fail, but its return value is not checked
> in stmpe_gpio_irq_sync_unlock. This can lead to silent failures and
> incorrect behavior if the hardware access fails.
>
> This patch adds checks for the return value of stmpe_reg_read. If the
> function fails, an error message is logged and the function returns
> early to avoid further issues.
>

Would you mind adding Fixes: and Cc: stable tags?

Bart

