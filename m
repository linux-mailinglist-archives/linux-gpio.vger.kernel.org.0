Return-Path: <linux-gpio+bounces-7995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88134925D11
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 13:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F32D1F216C7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 11:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B35D17A5BF;
	Wed,  3 Jul 2024 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FH3FneX+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA1117A5B8
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005305; cv=none; b=ChYlnTUbq5ieu7XtiJe2crggWgM/o2MBmuq6RA9mUyLcLNscLCyTeiib3KApLeTjZPN7TSjjhIeCK5E8vjQ+zqboUvI+Uksz/RwCBvJOkCuNp1uoCzKIPcWUzAS1geDDhBdC80WtC8z6EyR5M7vnCaeoYygdV/FulhSBgEbrpDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005305; c=relaxed/simple;
	bh=oS13niY1OPM2cQkE0TyZ30Ux5vtnCd7wymXMRQiBKBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epuEv+L5IEndFR3suGpe81jghLrlxsrAekcz+QWaWuAUqt0fq2b9nTQY37UC6Xrlx3/O4IWUAOQMaTwC3LUMJr9ne+ECKKa0lkk56+2P9mJbQ469RQYrcgco82b+6eANiybiarWwC7hd/Z29vqfcb6wdgGztZZj/gvtqqRZjL4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FH3FneX+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52e991fb456so384173e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720005302; x=1720610102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS13niY1OPM2cQkE0TyZ30Ux5vtnCd7wymXMRQiBKBU=;
        b=FH3FneX+B3SShY8Bf9wWzxotIg63IdJRkrC0mO2nFpG9IDEWq5/kR3F3q4BzH3OQNE
         Qiwn5IazW2KNp1Q6/1cWFr1d2HRrc2vR7z5LgjBLAXPQovFQS+tdJEGMe9/gxh+wjzUU
         IrdQHJ4bjIk4157m83tA90Vwzfve6O28aYQpnMO59qmkXiVQODUxW2+/L6DFeutdY9qm
         SEUnlxUVZkBxdPB51Uu1TGBWHdiiQS4wjigp73UwX81o3b3G/RPXwpV03FuTmtooV9Ee
         jZQp1dVdA0QHCuwNBkUGKabeWPXH3WEdX3F1Ge/wbpA/xjXD4EzAnvheCOz2u/gm8lrn
         wn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720005302; x=1720610102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS13niY1OPM2cQkE0TyZ30Ux5vtnCd7wymXMRQiBKBU=;
        b=i4GyVty5hcv38Jpujs2R1a2tS3gzd4b1TyXPMZ1CLDAj7TWloAD8o5eb4Q3l8org11
         fLqGjHnjocVULEpS7BZax1njmkQ+rXMr5IJOaJ9ghuvHprTVgBOMBN6aywWZX3Tm3HhU
         51PaXwugx66XCf5WzN8LuE0MaEFY+m58e7i79pNOkcQnrHSusytDikD0/67XEtGNRF04
         z5C3QCjcRDbUhwkpFUdI8pK7cLAJViNpAQfJGB97GHJk/nt9Y0+Rvv3p0onlOz7Jl+Oy
         AD9t0Twgj/irhOa+EYIXXOUzYo0IgSRsi8MHF81G8kRUWUzF6M5ic3cnB3L90I4DTTNw
         2pXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBk+1n5MPfBPejQJ3SgdFBmiGp4Yctesh8AudE8tZsDMwI8U2Lst1pi5c3iui/eqG3kb5cLXRweZkNRtMW3JnsLtKP4QmJwznmSw==
X-Gm-Message-State: AOJu0YwIaPM5OlxhEGeyhudwxjTPzWP3kcXYJ08Vs+1kFY3MCCoO6ovp
	WIKmSH9PTrAD93p4NANryJ5GfGXoxNyM+uF/HLD1wCAputr1Wr+pmaCUdYFR7RGAJ9F/EI4toQR
	DgaL3M31N+3gdKqb0gV0KNp2lL1syMcGauj+e4g==
X-Google-Smtp-Source: AGHT+IGLLGRsJzP4TVX/YdVdgjTjmyZS0ox39TjArSEl8rewH1yfYWVCc/kcx3Ie64ZqBpu9kD5oHwaVj5e3ANOuGKo=
X-Received: by 2002:a19:4357:0:b0:52c:8a6b:6071 with SMTP id
 2adb3069b0e04-52e9807c1dfmr433839e87.30.1720005301780; Wed, 03 Jul 2024
 04:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626084525.787298-1-patrick.rudolph@9elements.com>
In-Reply-To: <20240626084525.787298-1-patrick.rudolph@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 13:14:50 +0200
Message-ID: <CACRpkdYHGJWjQHpD2BOpEXUF73xkbVFsrLrd+VawmJkqt3CtrA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: cy8c95x0: Use cleanup.h
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: naresh.solanki@9elements.com, andy.shevchenko@gmail.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 10:45=E2=80=AFAM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Use the guard mutex from cleanup.h to make the code more readable.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Patch applied.

Yours,
Linus Walleij

