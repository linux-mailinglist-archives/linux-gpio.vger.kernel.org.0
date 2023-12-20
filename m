Return-Path: <linux-gpio+bounces-1709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF5819E08
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BFB71C212B9
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3DC2136C;
	Wed, 20 Dec 2023 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBFSbaar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15C320DF3
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbd532e6e8aso1627807276.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 03:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703071775; x=1703676575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8kxF8LUVYhR2aTsvs1flqh7HbUt3/a+ia0Ngdcr6Ok=;
        b=dBFSbaaryiQ9yjLsLcLMszwbWI6GKbqkGGjBZiucTGVvp58WoZPlVpxk7cKCOCqEGv
         EWXjoDX/AsY7d1GTbGcqRmRSZpI2/GVeCxQIggpvSNhzsHkHNDJTdo08sqLx3SQ5DXqD
         dc21aDFtTztraNBVjySqkpL7ubSeaBBk6u0+TXa6KaBugHdPS+lmDnxT9JZviLXIJF6R
         ij37uFbDTJ0nbHaFUdQRnrZ+keVLntQ+16GhTqGSftntN3s2SDQk3N8PWkFcSNJU1tuf
         VQTJMDH42ec1oXbg7z6DssiRnaHHbD2/m8Sciw5K6U63VZN2el6luQxH9SU3Tlneisxu
         odhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703071775; x=1703676575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8kxF8LUVYhR2aTsvs1flqh7HbUt3/a+ia0Ngdcr6Ok=;
        b=iWo6OPngX1SErlB2Z+GfcT62QeVl7TAIQQqChpovVEpioBqlEVA9PRhgf7ScvClRXx
         T3nU78K6KsRSueP0RJ9XQstYj/lR4+bkAgtoBMVBsDYeZXXXyUMT6YkfRjXDz5gM3ZPR
         BhdeAj+LnKJJ+YhxlN8lEb7+qsDeU9QcADcBIxcJUmFyfKpGX+HIsm0MvX00nbOnEcly
         DuvyHLPj9PVILW4t/G8aDmKyuLAPGpq8x7gQtJVLnYhDysZeWHe5sWhGGyCT4EbEBjKZ
         S0EQYy+Javp3Z7FG6jPT8PdiU4h6OwGnIuIHpUGw7jKas5/RLu2MBXkN7IM8Eb1BYlg2
         Z9tA==
X-Gm-Message-State: AOJu0YxFWPG24ARe0E/qKJJhivACzt6a+q2T6L/LJZc1I6KVxLFPkXSo
	ENHDyeXgaTeShAWtF2aI01HTfb5Mdex8E58vIRdezA==
X-Google-Smtp-Source: AGHT+IFEILbPSofwXJi1nVG2FR851hq+WQps6O0WExCpGnchqqyCMig+vcIB+eOMT9ukErRIzCdi+DRmnoTbp40O6/A=
X-Received: by 2002:a25:2e4b:0:b0:dbd:38c:e612 with SMTP id
 b11-20020a252e4b000000b00dbd038ce612mr4396939ybn.84.1703071775603; Wed, 20
 Dec 2023 03:29:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219004158.12405-1-warthog618@gmail.com>
In-Reply-To: <20231219004158.12405-1-warthog618@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:29:24 +0100
Message-ID: <CACRpkdYq_zfBoWVhRHLD3WH2GXi1f7+DgFnZhmp3L9KwuVo-2Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] gpiolib: cdev: relocate debounce_period_us
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl, 
	andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 1:42=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:

> This series contains minor improvements to gpiolib-cdev.

Sorry for not reviewing this in time.
For the record the result looks very nice!

Yours,
Linus Walleij

