Return-Path: <linux-gpio+bounces-19004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B0A915BB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245501906510
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2929B221554;
	Thu, 17 Apr 2025 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2bwkqlp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47D2206B6
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876339; cv=none; b=bVfiFkLyVC9WtKLx9CjYHn0H55zpUB3jU++TykJBTSaqUT2iUoJzBimglisxk2m+v47Mjj/vdQRwSyKfyJ+8OU7xg+oB9RiKIWy40AhBHwdLI/jrPF+cijY5hhq2rDebi5sxla0WsUewGWPNW1/+BD9G20b55xIZUkVgXNX2Ibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876339; c=relaxed/simple;
	bh=SXMciIpogizc4tBQaQQyNO7iWTL7anFQVWebf4a2WWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otPJdOw17cicZMLdIlIsYtyjO3iKH2+s2nfXarfeO+zKCVdiDBbmBT0qBqMmIRrr8+pfdMp1CU1ggJlLCmrPWf/RqHtn7gZmGhR15lVVM6e1CcD0jGWFD+YsiqPwec10RIlyGFe/nqvMfCevXmBI8VM6O+U7Uym2ZhmCZEYvMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2bwkqlp; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3105ef2a071so5525001fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876335; x=1745481135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXMciIpogizc4tBQaQQyNO7iWTL7anFQVWebf4a2WWM=;
        b=C2bwkqlpq1LXBQFWZcVLMP1vheGoGAhIwCt68k05aHMLxKoEYWem24ysdjCARGkvtt
         zZ7ZAuC1NpfqN3DRa3n8UfLK3mZxUKsPgxeRFAckxaDmnyc/mSPfWkjyo9NPYyFe3Iwe
         Iafy0RwDYRyNLKYLAoV1bsnUYejO7bT0voBrFUWXi35qFsuxgdRi1Yf48iCd3Mr5Xgsv
         DWML2/d2xpcM8SYj1Nz/49ALHFYYwFSP/Uzs2XE+eM/JYzD6Ot7YyqTJtXO1EyLqYbd+
         JlBejyKVQND7yEDR+2ckwApNmfO5RpNJW2WjPfY7MhFBKP+9k7qW/fHbXdAgpCuZ2spt
         d0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876335; x=1745481135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXMciIpogizc4tBQaQQyNO7iWTL7anFQVWebf4a2WWM=;
        b=KmdclxYMWfoSAn2cnfr1Dyc0lvOvEFYSBtFBwWXE34TnNDCxxyllph+eUENcwj7t7K
         y47eM+PjEe1FW+10K6fMFu4jNA0vYAcKRNBDtB0on/AhhCyQgFSi71hAmrcVqQEVJF8X
         /bDxUfXtWlpUZhYs3AAXf6dboQfaY6IxBsJgfwPuDcZx0neTzi9mRzwOgIT75eReOxnv
         4LreOGyR1wlAzTpz+Yq3JmNsehwPJC7VU18cHZni/C69ol0l+Td4T+akyPcOpS2wXlP8
         iE9lGW5v3qHgqH6CkoMLxKtG/RETDuguUs3Aegx2h4HJi/kWjEFJ+ainhRJZQaCQ3jA3
         x8NA==
X-Forwarded-Encrypted: i=1; AJvYcCUTfB+IfIRyzFkpRLSLcPD7eCkcFLXAq8nMBuT3NSadniRHPbrsBmT4BYy6CndCReEAywsK64wdBasE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6K1VqTJf8Ij1YIt4wTqcDuiWUhgOMNjL+MxCamhvRkNw7OGm
	2jLYYo0DB/rIANM5WT/2MVBZc9STpgadeQANWJKLEsS7ejK70zF2k4HRondLuDxMsLRpmzi68Nq
	XcPXQ6rU3fvk2qiDD2KSjBMgX6PEyKNVE4Qq4Kw==
X-Gm-Gg: ASbGncsHPgc3zIWqXWwHZgXcyoWLAqsgySn+2HkkQz1FsH79zm+vzocKw3ZDRLD22zS
	0Hp0SxQiIyPM3Setgt8KhjS5LDaX6adEh3Tzkg4e3Sl1b9ZR/Qqz+hCV793xhIgGcl1d4D94tAn
	AZAON6PW7Kugp0ixLoyTwdoQ==
X-Google-Smtp-Source: AGHT+IHJ9+FIBb1TWyrAVx2oUDniSfeXB/Oq3HnfMthWO0+aKUi8sMZxOnwo3TSSS1hKDknErn0vN0cWBKLzO/nllow=
X-Received: by 2002:a2e:bea5:0:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-3107f719dcamr21044461fa.32.1744876335142; Thu, 17 Apr 2025
 00:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-2-9ca13aa57312@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-9ca13aa57312@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:52:04 +0200
X-Gm-Features: ATxdqUHuW6BLizFBmvxGJmtIAMW4yS0uo1YYLPFOyB_Zbz8jQMgx6GMVm8Zfpi0
Message-ID: <CACRpkda5om6Uik+YnN4i1ePJr_NLGskdBe5GmYkrzU9bzN3+XA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: core: add devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Using devm_pinctrl_register_mappings(), the core can automatically
> unregister pinctrl mappings.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

This is useful and good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

