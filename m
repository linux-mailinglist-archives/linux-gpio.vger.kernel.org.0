Return-Path: <linux-gpio+bounces-24542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B808B2C0A1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC9AE16452C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA1232BF27;
	Tue, 19 Aug 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rIMvk/d3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCDE1990C7
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603319; cv=none; b=pKZv2xoCl9HxwmIQpFChgQQPvoVP6jO2lqVimn8KFr7zL3NtQpGmrFqg8Tb3R7CqoJ7KImHJr8CdJMZNXFfgF+gqs36BdqDq9lm/rInpWVCeVqeLnSVSUeDAP7N19qVXdDg7hjSUQR2kohNCgPvJ3LLaEOZb579q1vWgMcUDPq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603319; c=relaxed/simple;
	bh=x6Jrsf9+q5rYQBpSDpt1N60Ro1EhLpzMzILFRSEyHgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3UdCb0vWC/2bKhqMdOc+KU3kluMaC3R+wrMOcH+6WT6W2ZCi+Rggb4Tpz/j2aItBfjPIRvz1BFgJ20kHO+4tU178VBJAYxPSChqhIuztfYbvh86wq+fdv6MI5wfg+b7QLph8dLG32AbMa1Oto7sHZjZf7uce6eg74kmeEUh8no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rIMvk/d3; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-333f92d682bso43704691fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603316; x=1756208116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Jrsf9+q5rYQBpSDpt1N60Ro1EhLpzMzILFRSEyHgI=;
        b=rIMvk/d3Z7w10Ph/ruGOnhQl0bngfmNlIZsP2dzmYSmI+4fSDb/bNvb47nInv/KHn7
         uTocUYMDQfEUTDTfx5doR18zz1P7IAV4nOxc08EKRkVX6DiKkabelnrdB8uiKnkr3N8+
         yVkxjEBEWIu/Lo2PMphLnJWAojWRvUQ3HiJffUNFUknCeIcWGzfPpCpTCNg5DdR6UzFX
         JirBqAKVXF22nL0+ejjpgTUIJxo8ptwUAQ4OHJCs0CbI49VaWgZwqQcR633BuR4/GGbb
         rzGSqNuoEqBNGPSSvQr0+nUMOk71RWtMw5thEia+GUOGimV9f8L+yIfin6hqjhIyPBm9
         RgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603316; x=1756208116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6Jrsf9+q5rYQBpSDpt1N60Ro1EhLpzMzILFRSEyHgI=;
        b=vtgk23e4Wi55sj2SkNYZwqakJcOaYO4PSbcZ9xMvrDcOn88cmAtpY0vheV/YSFwDeW
         VRyEyDDtdr64TAcennbxBptBHvKvU4iXLjaezmsrIAzXpj93IHdW2GLPTlvLat0a6lmp
         Yy51BQAe37nS4G5nErCu9L4k8DNN4yR3tboOkN8kJtqFdkkVMNDqSKGa8EwPlSxX45c8
         ldVwPe+sHGMGSwivYvce8IXr3YXQn0HqhtAue0LD1c1KFmcS7KLkLIwRHF63CUKhD48A
         q5AsYsd7p+5tAEW5eMp+XuVobP6fQaIE69tvTjFOVglQg+X4BGZUv47QmHRRInlZOUej
         CdMg==
X-Forwarded-Encrypted: i=1; AJvYcCWgxVbxOagI9XCp1uV5a+bzf2IE9F7+YnWqQaaQw9errivGSp/3wpYJmFl+5Q/oUOh98b94pPbbgdNc@vger.kernel.org
X-Gm-Message-State: AOJu0YxzH534o3SxJJVaz0vcD+RMmGTIVRmWz8iFJVPZRAcmwtwzPRnI
	Uki29KAQAho82sRV8UHpY71x2AK+uWipoZbiT3ihqLNDAq6SBPCFYxqOEgZsLIuFxk4Rn+TXg0n
	sITvIZjbW97rDHPwL44BhMyzqY/UhL86s4x1pnbDpOuV+6bm8nBco3dy+7Q==
X-Gm-Gg: ASbGncvZJdHFQBzK6WlOYdsDy/IsikZuB/oD9NhNWqVER0wGmfaszCfSHU1abLeI9on
	hvc/XsnUQ64Z2H/5hBfiJDAJYmYRjEgWyK1LD9GyYQq20SCBjJBLs5fAxkU5WVp7pmeXtdbb0B1
	pXlQQd8b0RUxOxo+hGEVdWuXUKo/oPVx8W041Xg5s4qpsk2rqNj+6L/7ciu6zUmEppzMx6NwlzU
	FdrhWg=
X-Google-Smtp-Source: AGHT+IEZTV/s8J2pVdq3YESVoxrcWbR+ohgYDCXFmZOb9NPVw7MTXHU1w/mPN8qEod6szabX8V8QzaN66b7gZmSscvg=
X-Received: by 2002:a2e:ae0a:0:20b0:32b:6cd3:3938 with SMTP id
 38308e7fff4ca-335304f74e8mr4244821fa.13.1755603315716; Tue, 19 Aug 2025
 04:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
In-Reply-To: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:35:04 +0200
X-Gm-Features: Ac12FXx_8ewgPVQIBBva4gODOmrkgRz74tVeKqNVrWYGb85XhlqlAO3_JUxTU64
Message-ID: <CACRpkdZAjnzv8RCe6tD5Eeko6SNBGC7jJV6KHLBa-mFrajLH_A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: add documentation about using
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 11:30=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks for doing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

