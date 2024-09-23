Return-Path: <linux-gpio+bounces-10361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2297E853
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 11:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE7E21C20310
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 09:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C895F194A40;
	Mon, 23 Sep 2024 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXcTn7ju"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49C194A51
	for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082917; cv=none; b=IM3z/Yh0s1Iglm12lG2B36tUTFr/O8Hx48PrkTjAws6rXSrECRes2kIdd7uMNr4LXSvJOGW4VuBDsrjnHRrsucSKGIL0MGY6K6Bl6cGHM7XMCACa851fCQmk0HxAhrlP3YsFY8bVWBOGyWKzHhhzoC3/k9mZbx59IDbgzZqAXfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082917; c=relaxed/simple;
	bh=l9Bx3i72WLmyjAwVDpDo7xamY2Wn7yIoE8/sEWQgZJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwHAOrdcuSytA2URBinEyfGd4wDYz2Zllel+Qr5tDA5yJ6iXcIvJRAIYCljz0CqRgZDD8c58pOFRNC0EeRB1pgJmHhoJYXQU6sIjEwUheX6iHfv4ka8sMSz1AGp3gQ09QnS3yJ2pSLFUR4os4kKbAPzYYyh9P3QaCz2q6GQ+gtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JXcTn7ju; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so4288595e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727082914; x=1727687714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9Bx3i72WLmyjAwVDpDo7xamY2Wn7yIoE8/sEWQgZJU=;
        b=JXcTn7juDE92YK21naA9GWkCsBWZNWTMkpcd8eJWQmuiDJukEHs7l+G4eZz8GIC4P4
         jz+NTJN4zNyAx6XNWiQbkKGhVev2RFMG0nuQq36jrNmkdxMQ10PtIx2FmuUqaXftqPtp
         nqdbcd9s+czeGZp/3x+rEwxYiDPrYOeo9f2C1b3Y71poDI5zcrXpF9veg2ZBuENuJ8xp
         v9enfyVTI8j7l5XhVeeV0HqeHI+Jdq4Q46ZyUjsTPyiOoWl+h5w9yZVX8a5tDrP7gFBF
         QAYgD0gsGXFyn/kUd7Ykjcwrv6K9z+IOWpZCHfBZvg3Pt0BM0ctFccxG6FDu6iNZN96J
         Q1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082914; x=1727687714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9Bx3i72WLmyjAwVDpDo7xamY2Wn7yIoE8/sEWQgZJU=;
        b=mqvE2bHJiHKgtWfgmtObAg/5e7GSddDLM/O9lrV/di8gAl4srdQiwSB7sTLHVvmhFu
         iUk6ewoDXEB10fHblYjuB2Nd5yanL4dS7RLvztjKxRF3zbr11nY5+2Zz8Ky/t+KHN3iO
         hgVdsZNbyWzr0/vwyyOXe9rLVft1WKSe8OU20VfxccVuWY2WLyKYB7DRNlEOnNOnz3LH
         q2ZscpakCzvAHUS5dJuU0nvCXncqfIsef4P1tZSh7mCGtLTeS0Wle3PBW5QWxlX1HpU9
         o72pDxToqnLlRtQTcDQ7sy0r4MOOWlCk2G1KIrBdsZvgUJH/8B4R8woZ11JAVy8Hg9Lu
         FmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvzKVBu9ltt/ORz2t4oDMB440ABjO5pxuWG+Sm8NEkCrsMv5UAwOX3TSh+5aqk+8amrUDxRLwVStgz@vger.kernel.org
X-Gm-Message-State: AOJu0YyM0yFP42PXr40oZ/diYvGItj/984FBMZ4+PpY6DUtiWDeYIDio
	3gqx9CYpgoxCYSMJofcOdxbSkje8dYk0qS+C1xq/elXSNQh7bd4zNfK30WqcNNrsyKsDCp+xN0c
	gsaTDYpQndYjZkvXq5Xu5BLcAJWcZp8gW6pHRrg==
X-Google-Smtp-Source: AGHT+IGm9GYGA96TsHIKMdbS8Ksl+Y69UudH4mPSC68ZSc5eoQB7wn4Q3RxtR+3CXYd3V8oySBmv3CffJB4G3FFeKZ8=
X-Received: by 2002:a05:6512:10cb:b0:536:2337:7de6 with SMTP id
 2adb3069b0e04-536ac2f5b22mr4443437e87.34.1727082913853; Mon, 23 Sep 2024
 02:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906100326.624445-1-make24@iscas.ac.cn>
In-Reply-To: <20240906100326.624445-1-make24@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:15:03 +0200
Message-ID: <CACRpkdYEH+xEeD+pCpe_LPotaWp95X38NHouP4746bww3-hzXQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: stm32: check devm_kasprintf() returned value
To: Ma Ke <make24@iscas.ac.cn>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	bartosz.golaszewski@linaro.org, patrice.chotard@foss.st.com, 
	antonio.borneo@foss.st.com, s.shtylyov@omp.ru, valentin.caron@foss.st.com, 
	peng.fan@nxp.com, akpm@linux-foundation.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 12:03=E2=80=AFPM Ma Ke <make24@iscas.ac.cn> wrote:

> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using p=
in names")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Patch applied for fixes.

Thanks for working on these malloc details, much appreciated!

Yours,
Linus Walleij

