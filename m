Return-Path: <linux-gpio+bounces-5082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9646898656
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638E428999D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F4E84D12;
	Thu,  4 Apr 2024 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jp37XKjr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717FB745C3
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712231223; cv=none; b=oIetWBiHRmoV9bLdnYZfGiAZRidSM1khC4WXlefydLgxBK0gJbgDOhEHJc2D+x2jywZnohoStARd38vp6/LgBpz4Z07hEktVcJ0Hp0G6OKKI5hAYT/pdgBIMqpeozbxwzS1zf68AvGgsT/zpz1YecNsestyS9T0ovY5mSYQv1AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712231223; c=relaxed/simple;
	bh=/cfTb2VAwub8pYQSCzhjTlLFbA/bhq6Di6P54hY2C8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDP5FuRAMsyeDa9bR8IfdLm7zrB3OwuTBu4kNfqqf3pDGu50BHBQLYAq065ZPiSpF6SpPfp1eXtT9BNqHtie12rIn+w4KmI4D5O3S34qfOXVCgFzlHfEht/Sev3JRzvckCducNN9/k65g4NoMsaV4H76t8PdDGbuGA6yqLWAs2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jp37XKjr; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6152be7c58bso9604347b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712231220; x=1712836020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cfTb2VAwub8pYQSCzhjTlLFbA/bhq6Di6P54hY2C8Q=;
        b=jp37XKjrENlOH/kqi52bW69kmslU66UXAJit+oZZ4BUQXWW52NRhLAaWVT0Bx9Av6t
         ANsTmRLh481lUoibpCNoCPp5MmtISgUrAr22B2WldcElTf9Nlp3S0AWD5Rz1VwtsaKFs
         ecSBRTjHguwd3HG/FNBJxRAL9peWH4w+aio+mCv1hW6D6sBJV33Sjn0TgoP4nw0XC5xo
         Ey8e8sCJXtIrfQeWXXxZyefMXIMgLQi+5IOK7WqCcNN0V5Kf9C6xJYP+D/QSAqeM0/gH
         7SRsbXkSqkMAM6d+sNF5ZsQl4xocPAlMKEBBpWlKJLbFywYsQAncqcDV0HaFD0FQ078q
         J4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231220; x=1712836020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cfTb2VAwub8pYQSCzhjTlLFbA/bhq6Di6P54hY2C8Q=;
        b=tChExx+fnYPZQwI1NauSTO32Y51dewt9XIyhMP/T7OmDrKS+UCTqTwJl0pu0rBcF/H
         HWIh2gr9NpMlWxiNJvyGK87KRIokDBgHRFq4bkB44iES+Fo/ketfLN+r3rxeCTr+eNaa
         6hAz9zjoKM3WQs5n9JuTNVRXEKyk4fxlQso+ZZ7mR375FzW/30+xMk8/vhiMewr03Eu2
         +yqGOoyizqGUS9BeP3W9Yk1b+BwXgVsRVIIwsO8itzY7kdfkckqdLe8JxXylz/4bsT3E
         KC75+YOogadB+qxeMLjA4tQWVwkX5iKhnQ8Lix9rgAdzjmaruTCtEGqATOIP2ynKmIdW
         BSIw==
X-Forwarded-Encrypted: i=1; AJvYcCVKMwV6/UOC9Rp+v+SsvofdEWuyE1SRR558V7cCSd/o05hwCksxxfL7WrHSRDUW2CXyhlhQWrgzGVTJTQ3cM/Bzafcs6k04fvrEJw==
X-Gm-Message-State: AOJu0Ywx5ZXYUga1gWPHwjvwgTw48QRih4Ksc/IRTR5k3H4GdBLsIUS4
	Ro9QhQJgOkg6BX06FzXpZeqNurgaC9vLZRY7kfiFzlvmqYeDvFKVZY+dTHTwomLav6rXQ8sPiq2
	mHDyHw8/rQFHs6oBE79AH2qwXB7DI0fUUDOEE8w==
X-Google-Smtp-Source: AGHT+IFFVdVOk+E7MDuKQ2cnteoYCIQKxsAsT5THCCEHiF9/XfDRwbjfBVeXdHYdUt6nUzx6qtMXhLYbOK1EtTJvdqE=
X-Received: by 2002:a81:a18b:0:b0:615:17f3:55e9 with SMTP id
 y133-20020a81a18b000000b0061517f355e9mr2067506ywg.15.1712231220589; Thu, 04
 Apr 2024 04:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6b653642298d35b1e3656e9bfc6d1b322fbbe68.1712004518.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a6b653642298d35b1e3656e9bfc6d1b322fbbe68.1712004518.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:46:49 +0200
Message-ID: <CACRpkdZeXwGoMVCtCC_6oSSACkcu-v5yt7yDi-vSSPrL43A05Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-single: Remove some unused fields in
 struct pcs_function
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 10:49=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> In "struct pcs_function", the 'pgnames' and 'npgnames' fields are unused.
> This is a left-over from commit 571aec4df5b7 ("pinctrl: single: Use gener=
ic
> pinmux helpers for managing functions");
>
> Remove them.
>
> Found with cppcheck, unusedStructMember.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij

