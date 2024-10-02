Return-Path: <linux-gpio+bounces-10693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181C98D46C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4D71F223B2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659941D042E;
	Wed,  2 Oct 2024 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhxxVNGH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548D1D040E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875212; cv=none; b=J/nuvVhYfcC/EWzOTwtWa9eVhrlYK0NLAbEgvWhoLI99EuY16hBalSLNIVfETVXz4V01D9GclJcCOOr03qFShkkFsWFtflfaF7335l51ZAoynk/Cvzy5pNJ0RWy1bmppMNK3aeRWX3eYlLdPRpNmq9ucxPBVlCqSlKsO9aaJ8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875212; c=relaxed/simple;
	bh=/TS3YtOgDIq9KFdYt7+NiJ3dYC9S+WgkbDlinQz4MMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEGq6jgi4YpBOltzdAMKi146QV3By7tJ6baYfclVPP0/B6pBidRNM9ySPeZ/CPEtKvGVFjeF2rwnhgSIJqfFOGfn4KLPkZV4sHAFX1zKIGmIohTwskOdepO5x43iYIZxhMdNlOE+q4lABpUUoXBR77SjMbXXkUZDoibm5/MEG3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhxxVNGH; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e25ccd64be9so5855906276.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727875209; x=1728480009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TS3YtOgDIq9KFdYt7+NiJ3dYC9S+WgkbDlinQz4MMw=;
        b=QhxxVNGH/cnyKBxgk3HJ9+CtUsccZxNIL1vW6mkpeGlHfah82dlSffJ0zC8QgLTwhr
         v0rrBj1EH2YUQS9yTvqZ1mLZnCRzZKOPlbZ58Mj8S/nGuXL0D4DNHA0Nsj7fTGoeg0aj
         s/XyUimY4PpifpOEaG+uiHOJipVi7Zo1qjviPkqh1IO66N2JPN6L9odSXCigCaQmfXYj
         pTDCN0og1S78UfONpmW0dmgdbVzNDKindktUx/qIHYd9vfhnjeh1vTig5kKhs/kqVWIO
         x/YEiAPWO6Z6XhSe6DEnkw8NXNeaqlvK6DTHF8PeyDT3Wea7Ah3zBxQbXQl8NpqJV67L
         5tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875209; x=1728480009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TS3YtOgDIq9KFdYt7+NiJ3dYC9S+WgkbDlinQz4MMw=;
        b=GKQPHHs0PQ7dd2sJVmD5iOqbglkAxWjsEq3+KsOIyupSwGTn5Va3n2AskTOyC1cFfu
         gBxjKIt3r4EzepqCqLZsbkSsJKZfaOWjPhBz7FTg+eVlsXENWaoE0iJEHQ3EaHEDUWQQ
         oDkj/KiZ9u1pusEMO9s8ZZ66C3sR7UiNek4/0P+O+SVSa32NnoLRNSUWx6d1WTfqETm3
         LC6Hdim/cgsz+10JDIjMkHudfcoLjc3tMN6Qjk+cW8ma+V5U9mjPx04XBTNVBfnFXvee
         w25O/K9QQ4Z2VM6Gp42BoFG+3YZAOsoE8+n25qOgE8CHKnjhFxTTQcHgG6JeBAL2gEwd
         TIfg==
X-Forwarded-Encrypted: i=1; AJvYcCWAUsQsmIbN4PKW2v/m7Dlmzk/R1r9h3g0GfpRJBmV/mDMD11Cqr/PkB1bhXu6L4U9ZgkrZdVFH6vEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzeqTp8Th6B5sV2XLAhKdeZuWNkjADCn04Mv71rvO0uomvynRdw
	hjJAWX4gDS1ys97ZCWL+hkeREcHsoOwmD3Wt5oWZroS9Qz16Zgq5Uynedz5mS8MCxY7nOIrGbCE
	fZo+GmLpxLtoTKvizLgBFHtA+OGURe4cd8vDnQtt8PxyEP4u0AUw=
X-Google-Smtp-Source: AGHT+IHEsHmLtoCSsgtwLqvuMmB1LO+BOb0QgvZi4zTxGYHrgj0s6Wseutqk0ZF/zGjWl45Ta+ftNfwhqf/dwT0NUtg=
X-Received: by 2002:a05:6902:100b:b0:e1d:94a7:4633 with SMTP id
 3f1490d57ef6-e26383bc915mr2466860276.22.1727875209707; Wed, 02 Oct 2024
 06:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930144804.75068-1-brgl@bgdev.pl> <20240930144804.75068-2-brgl@bgdev.pl>
In-Reply-To: <20240930144804.75068-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:19:56 +0200
Message-ID: <CACRpkdYrRzg21Uc6FaZhXhqoAhYaYy4A0zqVVFz1es=CbXUi7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: xilinx: use helper variable to store the
 address of pdev->dev
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> For better readability don't repeatedly dereference pdev->dev but
> instead store the address of the embedded struct device in a local
> variable in probe().
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

