Return-Path: <linux-gpio+bounces-24301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B12B22698
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5DBD1B66C4E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C9D13D521;
	Tue, 12 Aug 2025 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mH2zg6im"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE24A21
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000909; cv=none; b=sPgWzFkg8bl1esb5vm2eeSgPG2yf8Dlc4tnSDk/XX8L+P16OTVEuxSd4vJMjBmkVdbdbifPy9ZYKtgL6JbqwNhJukRar4d9+dSUIi4p6gKZme51aVRYvbaM8Mt9WPgeRmneb71uyKTjgw6PxYa8bKQyM0K5CLZCZe+0a50I/mGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000909; c=relaxed/simple;
	bh=i2sB+0qnCRMPqW1KShGcR8PsF4cV+J4Rx38KY04/XIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMwDTy3AJTmGwrGPH4QoKJCuQhFRqu+hsEinXhMBbfjF0xhbKnopY/uY3P6lols/DFIcoPUpAzdf+6ZpNQ9xC5UAiodKUH42GMlsApOzpoXgi09e4kLnF8b49dkmdNhhtsd94li/sCMDyttFhEvs62nJjUHJiV5muLAsgewIDio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mH2zg6im; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23aeac7d77aso45664105ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000907; x=1755605707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2sB+0qnCRMPqW1KShGcR8PsF4cV+J4Rx38KY04/XIE=;
        b=mH2zg6imnTwealhirDV/4vMaQ3B0HQ1gGR0/LpDWos7NjXo+VrgJD5hKcGOfeuSeqO
         XbLyWd7pBfkz+mZZ3UUoClOdz383p+dquGuv5lnu51HjVLGVcawOkE3K1F9ra0l2cWH1
         n4eOJmeWmbON7oTAPtKvzeJoawON7ZPjzBnsbZK4D13xMq6alHfMYULaqLj2/GXkHUaG
         5qf5ECJdK+jx6jpTnFSR9BL6pdHbojBxOm8VpkFhwde9x3FSIP6xu4J0Rvh48DXKnkwb
         LM8/0nCbv4GXirXcpDhYhd3FTuv7xtZNB1rrB5U+gtNXeCIpwL0ePoEUr4VSwTYm/WLq
         ixXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000907; x=1755605707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2sB+0qnCRMPqW1KShGcR8PsF4cV+J4Rx38KY04/XIE=;
        b=nyc1EtiSioEG0s2v+crjTrluPSRh4BO/IBTbJGkGMA0/a8IsZbGgSEgv1G2NM3PYKu
         zxvLr9K7Fx4/id9qxKwNlcz7YD/S5lXVJPBC+mKFcc0e1gX9m0ZtzwHD3qXXaWCR0ock
         KvwPpVwdXwOv3gXxfNT8OWQgavA3pcKuTrgMzD0xd4oXtRjF/w1ou54oplQixH873Z4T
         aIiNTXSXTgLPKvy7hL2JsIkbgEEj9SlpnDrTU8mGWJ3ZOtAoWqV515dE5hUjxHloDdw8
         BjeHRIoNnBBuiUb7roPk+tUK3ok0pxDLmQy+vAPhKsVT57KvRuuR0BKoZ00EGi2/iIDJ
         B2Jw==
X-Gm-Message-State: AOJu0Yx45UO6yigtbcMs1FFojjQKAFBj6eavOfFkvlqQke3eoHO99Osp
	blnZqoB2HoSgt4toJlOgdkfBBhWQjB8uuCJTD/TA6pL7QlNFPk7iyoVUY2B0oX7+YaKLveI7/2F
	250gMdCk2Q6Jx8iZCgoqMrwWi5ayfTJYjvhsNNMcEUg==
X-Gm-Gg: ASbGncsBMyECFtcNQ2BzmCfvMaaM1TYci0msU1D/lfg3Ub+IJPFHYfz8DorkQPcvE3p
	NWoL9lc6G3A4xm+BPmt4sSYdkcwFqsE3edPiZD+wr5ZzQmCgG8ZJHfJcF6qfjW3dofoZB9N6Ckx
	zOuaE74pz6laTvmwF/zyhTu5+LD1XlpVIDIxeKRM8+3IiHYgOHbXiEdhr+wu9Odf0hAkT1Qb/IM
	c/p482vZR46UmkPsKxrDdYqqtdhTanjJXdn
X-Google-Smtp-Source: AGHT+IEzociZzudTWGhuGdHHssA6mcTMWmh60p7KNfXRPqNC0sHerO7a3+ET+ENTi1aHgD3VUTer3FIsMhpz3v4Tov8=
X-Received: by 2002:a17:903:2408:b0:234:914b:3841 with SMTP id
 d9443c01a7336-242fc340444mr49380405ad.39.1755000906805; Tue, 12 Aug 2025
 05:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:14:50 +0200
X-Gm-Features: Ac12FXxLWlDkhK2ok2zf7fTots4VGX5EbCJBNgP5nS_eF-e5_DRefiW9dEXgJdo
Message-ID: <CAMRc=Mfwz7yD0rUKw+n8eOczrg6E0n=bPJ+ng32D=r-rUgp4TQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:12=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> I hit a network error when sending for the first one, retrying now.
>
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
>
> While at it: sprinkle in some additional tweaks and refactoring.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

FYI: This is the correct thread for reviews, I was finally able to
send out the patches.

Bart

