Return-Path: <linux-gpio+bounces-6531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 842088CB2E2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 19:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B2FBB2226E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 17:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C53C1487C0;
	Tue, 21 May 2024 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkh2kN41"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C2768EE;
	Tue, 21 May 2024 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716312332; cv=none; b=W/WcYXU9HI4E0yGNwDtP6zvDqX3CLHoJmZdOsxiFfJfUC8LL+iCewchUvAd27sUwGPcsTUAojg4ZcfKfGiqXWYWp/FDQn2oS6ytPjoDrt15Grj7Pw9sz/mnIR47GOVbLh25Tj83uW/RRyELZYhhWvqNlS8L7ek0DJGnC9A4DmR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716312332; c=relaxed/simple;
	bh=9HhYNgWeBT45wSmM/x1CuaRTjuDZftcKSef2n2nSgQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGd+EGvxnoAhNQI7DEUSh3NHq942eWMKF2g/FpN60e2mS4Nrv8r0FbqVcuBdAK4EI0ECL8pbqNfLVF8JyMDwj14fKncbzvlzPzV9mon+MmpNGnaFVdWcMRdagQu4C2hbe3hwLglV3gpOMYukyWR/YB0U+sMr68rNkH4y3RPhk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkh2kN41; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-351d309bbecso3262546f8f.2;
        Tue, 21 May 2024 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716312329; x=1716917129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HhYNgWeBT45wSmM/x1CuaRTjuDZftcKSef2n2nSgQU=;
        b=nkh2kN41RUCs8QHvGvK/jsVR/lyVh2ynIr8YWKmE/TkexnTZGvupeqyc0AMxDgurk7
         1WQMFFo+FDUIcA83nkhv7MKA5kSPEIGsQWK6H228YxVtMTme1aAJ8x9x1Hsj4W0cDGpJ
         3PIt+j9EdS+Y6YnuH2IPPS1Fu9GSirTbDnAo+Qg++bekuwNO6vwlXiATA2QnMiqOprPq
         RHDmXu5DRHmKk69Lsu4OqvXx8Y2MUbzgQnYQU+fgMUJqp+Unp04O+RVDkHPDIFhmWxWF
         R8U+Z+8cBI5pDu0NnHZ2bdie20QOnSTF9E0cXQfHukkYHWFBVcQnSPQ59MwVflD8HUB2
         1+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312329; x=1716917129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HhYNgWeBT45wSmM/x1CuaRTjuDZftcKSef2n2nSgQU=;
        b=EPRzdirLm1aVlGB2rKanfGpOof0Kh4v38tJL73ag5FUPHQnmOsC+yYU5PJ+25H42TX
         IkZjwrfJY6sEoOyNVHSvEA7B7yCFxhh+RyFQpIVyeMMRdkH09V2fss6EvT9EN87Ttw3g
         MyXuZLY9dBwkKG+Sh9QE2KmsYCq/IPWc6R7PKamV7zjfcBlaZPcposHFO89Ocn5l65TI
         HgN+XueVXSzB7VAF6By2mLB9eR0JWzGX1Ud2qL12g5w0ICsSGXzUdqWK3Egv6mDa3QU3
         X/+I6BV1a6VSI0sS8it1apxD+Ovx3QDlgwjX5t84eGZ+FWRmMH7+1DDebL9EubcHvFlQ
         l3LA==
X-Forwarded-Encrypted: i=1; AJvYcCU9h6rD5vxTjX5a4I561xUq/5P9+fr8yfowACptSb3byvSOyzeEN2UQmS+L+E7fcadQh0ZI/1iBCLF4YJtOj6gAMVU7/PPattNRO7mj4EODXF95pdpuDwITrRhVjLPolKesLzT8XMtuDA==
X-Gm-Message-State: AOJu0YyCtPZCFj5SBrXBKNquw4mp7plGsD0jqdSEfnHC76aeMHNdhlsi
	8mgRf+uzPydpynoGA9icNV+6JTEDW9GqBEQVNqe/WdTelkUeadvzKhmG9GPgXHnAvOunHHw9E2g
	fDEGmI7nYHHJskJ9wSPXbR1OjLUxcajM3
X-Google-Smtp-Source: AGHT+IGSoA7QtCRvPyWpNPgLnlL5U2gCn0OHvMM8vUixIBHjD9bwvGVPe7GhYGdHdbzgCQHI9ejtClROxvCqy8jxb6k=
X-Received: by 2002:adf:f8c4:0:b0:34a:5663:40b with SMTP id
 ffacd0b85a97d-3504a630f91mr27108853f8f.3.1716312328830; Tue, 21 May 2024
 10:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
In-Reply-To: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 May 2024 20:24:52 +0300
Message-ID: <CAHp75VfpFtYtStacY68-iu32x-XK3XMn_34N7EH07vvhjwp36g@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: cy8c95x0: Use single I2C lock
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 6:26=E2=80=AFPM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> Currently there are 3 locks being used when accessing the chip, one
> in the driver and one in each regmap. Reduce that to one driver only
> lock that protects all regmap and regcache accesses.

Right. But please consider converting the driver to use cleanup.h.
Dunno if it requires a separate patch or can be folded into this one
as it seems you anyway touch almost all mutex calls in the code.
Linus?

--=20
With Best Regards,
Andy Shevchenko

