Return-Path: <linux-gpio+bounces-24504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C9B2ACD6
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7A945E5FD9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 15:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACC025A65A;
	Mon, 18 Aug 2025 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKGlARi3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC2725A34F
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531110; cv=none; b=pbZU4jlAWNdPGhHaLikRGtOM44vPgOrK4/5f6vaqMEXWdK1+hXCFRMvxllm6w+ttUe2rIrXnws2ghFQ1g5e6Oi1OrZgv74QxKOvts7jD0qb0TOeO3D3N7tB7PR4mjOuj+S2HDoRaj1BcgaMl8IlhrZuXNatpc+oQfdcmN/FmrJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531110; c=relaxed/simple;
	bh=rZ0dwCAQY3J2oIRCeDvzc2CwT76Cq6Vb0Lwbbf7BnKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEMblWtbM2J3QSlheQ/5t2qK/TcfTRDx+e9jOfuEkn0lx5kJEIl/f6pnJFgDJQ1/GqnpiDcwlcV+JZp+a8MPEQmo8TielEQuS08VnKy6daHVr9WE6Ui2Gd7GB67GpaG3PPIo4EBvFGrQW2/led2VVXjwbktRJpktiT5KHiumWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKGlARi3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-333f8f0965dso35980791fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755531107; x=1756135907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ0dwCAQY3J2oIRCeDvzc2CwT76Cq6Vb0Lwbbf7BnKU=;
        b=dKGlARi3a7MknAkUpQxCZ00y0dMS3gUPn3qhsB9gs+ltYthPlTNLhVIfm8dSqqEcTc
         0c5blBM6B2ay7Tn79tfy23H+KUfWPsD5hKZ7rkMsw7VQeaswl3On2rkykzoUe0HzoUpB
         2jsHwL0BocnXgBQGNBCuLn/HBgecbbKMAiHMfpb3dImF+epLr3/ohpyMZcT2kQbz0ZUT
         e0Y0k3VNCawJvLsX/sal+uwML9XdrbsfD7Xm2LAXnFE8TvlhqN197INaW8L5VMtf7iB+
         rCF9tx5kgpwCY3BJZT1q9A7U1HdWBIH2LN3WBDcP2w6Bxo18OWbvW/HVAbxrcJkdnZjl
         Mq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531107; x=1756135907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZ0dwCAQY3J2oIRCeDvzc2CwT76Cq6Vb0Lwbbf7BnKU=;
        b=gU5i4kTOWs9KbItU7wHAisCFz/HZ/G/X59QwppTu+tuRoJjpzc4gFpj03u/BQy/gt1
         nzveCRlpnGvYWY3/+4Aq2djnITmO1rRb7CLvs21jWnOsWcXgi7PD32dL1z3hPmpQHjr5
         aBc+/rLGX9LkRVSe6xHnuswLo1a2UguTmHc3EIsPcc6Z0PDpWISkGL1crgNz4Vt35DQ2
         G2QH4TuzWZ5aHPOhv7DbzNPvRpLptxPqSxDnNZoUZkm+wTB/qCj7+RvABLTXXlhWsVyF
         pK51kN9hKtz41vvm4+5jmiyHQG0MeL39Kn5XY9OmkvjVhaMyA2Z/IAbr6NXNde3S0MBt
         EjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkWTlH8JQ8Me36lWDL9EhYgfTgkQGC144HjaJ6D1C3L9Nmh2MHCRC7lB7671Eil7A7L5bS2obHJVnk@vger.kernel.org
X-Gm-Message-State: AOJu0YwNfX6qe3+nE19w6kbGvRcciXqBoRwr8N+ww+NNw9z0hrdbEjKI
	UJUsV8PconsA31F5MW5nyOOYq1G8jVG+6xY7xWNmAdLXBMxMeWLcEYywhyyxZGJtD4tr2sceHRd
	Q+dD7KzitY44oka7yQ5tgrvrM1KQanJji4IfcsOKNEQ==
X-Gm-Gg: ASbGncteT47/PNJ3ejQvN5Mhq9dV54KYGeMGrne+kgU1uCTkTPWlrFXrruzyN/uKghW
	w+ZiC40WeTc3eg/yuXKboXMb9HBPyrW3omYg4qGzEPafkRWSc6NmvGMB1ZssRq3jyl661LIB8M9
	se7+ER3jaK2Gvtzx36ptmhXrjMIpAX8Ot2XvYZGM1Chy/bRGhL+Rugw3pklP/gTQr51PM2Nw6ln
	eTOqkjnqQNxr0MxEw==
X-Google-Smtp-Source: AGHT+IFs+u+QQ3aTG4A/OJjJanOujDjAB+Wl71F0SifIFYHpU0A6WvX6Ba+2IJZ3wThNNKqqP6l7dqXLCYXQFACA4ts=
X-Received: by 2002:a2e:b888:0:b0:333:fb34:9b52 with SMTP id
 38308e7fff4ca-3340995c145mr34976401fa.35.1755531106744; Mon, 18 Aug 2025
 08:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813081139.93201-1-christian.bruel@foss.st.com> <20250813081139.93201-2-christian.bruel@foss.st.com>
In-Reply-To: <20250813081139.93201-2-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:31:35 +0200
X-Gm-Features: Ac12FXzzIQxz6KyrnD-BuJV_RkrIckO1ITh9kqtOp8xqM7oYrs8HIMacwPvpGKU
Message-ID: <CACRpkdbA0OcAv5kKJTzm-piRt5eTP_pzHVAZFuR_LCgOA0q9YA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Documentation: pinctrl: Describe PM helper
 functions for standard states.
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: corbet@lwn.net, bhelgaas@google.com, mani@kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:13=E2=80=AFAM Christian Bruel
<christian.bruel@foss.st.com> wrote:

> Clarify documentation for predefined standard state names 'default',
> 'init', 'sleep', 'idle' and their associated PM API.
>
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

