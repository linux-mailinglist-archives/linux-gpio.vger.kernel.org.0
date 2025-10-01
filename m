Return-Path: <linux-gpio+bounces-26709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B62BAFB72
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 10:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24842188FA6B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 08:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8670B1C28E;
	Wed,  1 Oct 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DUkVxDJM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B92222565
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308399; cv=none; b=KqSdMq7sjNROu9n81ASixVDEd0kzb2H0Nh5cfgWTdIuiLP05zzaRgQTyCA5R3/ZMJpNM9mz0ohSlgJUp3urjUm+f24sf3zoi/8wFsIPKtEFp9NnDALwI2q4b5XSdk/7pALNpycJ94H8qKhbOTPthk/GjZsV6noO+mYhULe2hXmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308399; c=relaxed/simple;
	bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJseDoqu6aqrPrq5LRhBMm1tDM4azilNL+1+6pNtWY49Wr9tvpJIUuhfsBwfBwTZ2oo48/qi2VDF3q0GHSWJt/JAZ459zzg2xniUUa+owvO2yHWHxkY0nbvdlWc9LLhX3mBMDMuY4MNLQF0+BcB8OMGS6X+37UAfo/D/D9+w5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DUkVxDJM; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-586883eb9fbso4566008e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759308396; x=1759913196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=DUkVxDJMjtSd7JQTplxvjXnLL5GY+6orOou1AZZ0x9DtcMzEXZlDDUO5+eaD501CUS
         mWP3Q6Meo0Uj6Tm0E1RFkDgOph56cUABDKiKZp5Puu4pYuNRnEA6VhMZSPzA5BtD6xcu
         gRaulkg2Et3G9SRp+cvL3yvghxsJG2pzn60aqXgtyBLGv5sUvqvrGCicylQZzXRbDn8Q
         2UNv76kAcKAGkcDPbK3+CaMGeEfi6M70Ghen8FHS9PX8q3wyzSfrrzz2tOGSpIhATlQM
         2wVFLE+1pXs7exuilmjKhe6wQ68O4uZs8ShdL162BqVZ9AYXdCfKVxaI/NAtogJ9skVY
         qtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308396; x=1759913196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=BtkwhbjdvQINdUsVTMOD1JYQcQVcaAxCs6Nq8vMx82aBgih06HdNiwKRytC5VVBb+7
         4m0ZSJ6vRWX+ZJbYpj6WfBYxM7YmI3hNdYvHoP3hTmqE9kXqEoRNOjvzo9bcr3+KgA8i
         4kZ1Hb/o3KhRNKmghdKbQ7B4qDSmSNUpCgGsnj3H5IHwv+xxk5mgSb5LPZoXUOf9NwFn
         O24BV7dFjO7Gs6EFXbTEO012saJOtVXrlZsH3j2iAZRgbSQrZKL/8jj2OwCKg5jcFAt2
         /4G96rklC/HS9zI2slQNjdkFj47VU8V8jgCXRtvwwH55If1YcRs2kHWrOG9olPI4F7Tj
         XlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkrzTR2+upZssKA1oLR9NXtDUJ8AiaVgnJh2HyMaPMffQ1Oxk56rQl3dsM7Q7w1L3VRWFA4bxDClsl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzes9WhH/7aRlS3WajHFBHwKjVzSFwK6LkWZDZNPR+sUl9g7s61
	rIH8MREsykBI1qXF2NfrbqkFahThGNl+ngcam0CvYMHjnBpRKcRSmYCyxXFrcCpN5HN+GsdisyB
	eE8bsjk2J1t+prr59cmyXeqFblpkeC1YERK8W71M+PmWy069cMZrcOck=
X-Gm-Gg: ASbGncufmJ4CqDnpnE+w+WXy7GNzj01IRnoy9xQEo2rqZXnmxzbFvbpo6lg8BeA8KOL
	xuYr+/mVCMnR1/h0QYgdCU7+m6GH4TnnT9d2hfELFoRb7KKty7Vf2EYH1H/xG6nbOokTwsnC3WP
	b1/mF4n3wGgWF93akRyyBYkCIFXrUCnnoqJP8ylBypWY7bIX6vEzvlxNAQ0M50vy4pO2ruLmNko
	3mRfTlkasPpEoP1CzpUr60KBf5/XVe86ndlQD8Z3rMcdGJzitA4hWPGky84XRI=
X-Google-Smtp-Source: AGHT+IFOdBqQ3obnIdTm7ru0JPzklPYFIUGqCI693FKE/9RlmuM5kKhUigWL4UNHwLKwqtrOVDs8F+QH4ORLFYFhoak=
X-Received: by 2002:a05:6512:ea7:b0:57a:6d7d:dd7b with SMTP id
 2adb3069b0e04-58af9eadd86mr760851e87.8.1759308395621; Wed, 01 Oct 2025
 01:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com> <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
In-Reply-To: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Oct 2025 10:46:22 +0200
X-Gm-Features: AS18NWC0XlksXBppS2yCvWpBaDAShYUzQK0jJOB31RgrqudBkZ0MvZktkc5Xz8w
Message-ID: <CAMRc=Mf4kv03+cfB7up==PUJyxHH6U3hHF3q6iKYZWVOZamSTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Lee Jones <lee@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 10:36=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Sep 25, 2025 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > This is a link to the discussion with Andy as per Linus Torvalds'
> > recent request to use the Link: tag to point to actually useful
> > information rather than just the patch's origin. Linus Walleij doesn't
> > use b4 so the origin link you'd normally expect to be added
> > automatically is not there at all. That's probably what caused the
> > confusion.
>
> What? I use b4 for everything, I don't know what gave you
> that impression....
>

Ah, sorry for this. I assumed the lack of Link is due to no b4. Should
have looked at git log first.

> I have however removed the automated Link: tags generated from magic
> gitconfig hooks as requested by Torvalds in v6.17-rc5:
> https://lwn.net/Articles/1037069/
>
> This is also mentioned in my pin control pull request from yesterday.
>

So it is a policy after all and not a "please"? Let me remove the hooks the=
n...

Bart

