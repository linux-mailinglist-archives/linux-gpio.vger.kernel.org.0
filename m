Return-Path: <linux-gpio+bounces-10605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C898B76C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 10:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39B2D280F9C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 08:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F4519D8B3;
	Tue,  1 Oct 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cDO8HnzX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4419D899
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772185; cv=none; b=hOZlrrR6hhU389JkLgjDYHhaRl1nDj2wa2j7TQ2hG3BhCpB3Wdt0D9dCsN1ACRbJBvqm6KJKjiyZaI2zMA5E9CRdUPmnzmWCklzo74eWq9UvbBdudQ01B2GvKtVxKtUIOuquqNQsro/yx3M0aOA7bsXQE6broXBntQ8+vZL6r4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772185; c=relaxed/simple;
	bh=mG2qgOVsOu3l/TH/gOoJ69QuttE7so3WY6EXyy/Og58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+KJjpMvV41DU8m51W0/KKXJZi1fHD51Ugn4QuKQ/4Hsy2WrvhSXn7hABZ38CzVxivfN0Q9pf/2EKAt0QAZOayYq5Z9u/3Tbaj5jfU/pjxvbQs2xDzpXiO0cPKDBBxTZnCY12s9rEJ/wJ/F5LCy4+6dqJQQ1ZHrZ2zOrKR7nXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cDO8HnzX; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so34612101fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 01:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727772182; x=1728376982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mG2qgOVsOu3l/TH/gOoJ69QuttE7so3WY6EXyy/Og58=;
        b=cDO8HnzXMjjVpWiBOFl1SPQQzMRBxVW/iPSNQe4J9Wyf+cXufa/AkWNopVrAcvWwYh
         zOea0Mr4MbXJmXHMy6tnJKJqkvD1ZDk2cQmldfxjkbH5HvasT0RJBDHDqdd7XSonqMb+
         UVIO4Ah69aGej8sxkTdR+Dx6PDml787pZ9cusdOR/szfzckFebTduGTq282KPF2QcDtS
         Hg5KyOaPCMUiDg0RfQK3Xgy/G1VXRNXXGMKb6VrCsWnT7uZL9cmJDEcn9J+FeoFEBFlP
         tLPusxi12/j4xUcFX+J1tSnXuhmnA9EQV8HAlYdnGgmNk+Gau/87qoHo8IpBEblhZaMS
         0l8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772182; x=1728376982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mG2qgOVsOu3l/TH/gOoJ69QuttE7so3WY6EXyy/Og58=;
        b=kW+6S+sVDPB4O9/jg1NNOCBC/hauhsFi1CZ+4oHO2x9ap5mTtknoMY+BMCWqauu7fC
         a1PU55Sg3vxkytCG5QF/2zOW6fGrfE8NGwee6h5y28CP1QCcztvFDLO8JkzKaC3RDchr
         ZqntkTN8014g1scrB0ja5db0lqfPiCcAtRg/9jRUBwoydT72OJ9fMiTLPnbOSUWKlDQ4
         r74SzUb7NjpAXRqfXWdrwwqLtEJ/XRdtRZ+mKX7ImG5pg3bO4VqjmBPYcjoh4fM/rkg7
         E0Dwgvle4mjw3ZsrXgd5cczOA7hBpYeh/g154FtZ38+ZWVnj06P+Z6Sg6IMnX2fof7V2
         KLAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq2t4xgU9yrsZDlhsxDkk/nyZ1682eIggTNgElk+XLL4K7A8OPZIBMkjPfpyueCl/P4aH3p/qgeNaO@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUP9xhXvWEYPIc5E5cElUFPFp8pzQiiIPjsO0os1UhkiONuXp
	qOdefZXffeDlD0ZPBE0mSsdUC6UJ/InmC8ZiJvRpihdiqwYqyKjtAKEfWSWbp7Jo9wgJfYoIpb3
	AtB+217/FijKrd4vCqLuzFL3ZLGfU2l+m9e44kg==
X-Google-Smtp-Source: AGHT+IHbp2+bB3R7Rq7jfIRrG97PGq9THZvfkK88fAHLlE+mcDau9g91m+e6W53xgNJnxJ+LY8l1/aGqeYZc1eWOv7Q=
X-Received: by 2002:a05:651c:211a:b0:2fa:cf5b:1e8e with SMTP id
 38308e7fff4ca-2facf5b22a7mr34314891fa.2.1727772181942; Tue, 01 Oct 2024
 01:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930091111.32010-1-brgl@bgdev.pl> <20240930091111.32010-2-brgl@bgdev.pl>
 <u7o3fq6b2rlq6e6wwk3axxxpljx5u7o2mc35skg63houf3mhyn@h27t3uubopqo>
In-Reply-To: <u7o3fq6b2rlq6e6wwk3axxxpljx5u7o2mc35skg63houf3mhyn@h27t3uubopqo>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Oct 2024 10:42:50 +0200
Message-ID: <CAMRc=MfK3+piaz1d7UiJmwwfvC=f_FLWdp07gN34varvJo-8NA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mvebu: use generic device properties
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 9:34=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> I didn't look closely, but I wonder if GPIO_MVEBU depending on OF_GPIO
> can be softened with this change?!
>

Yes, this can be done in a follow-up patch.

Bart

