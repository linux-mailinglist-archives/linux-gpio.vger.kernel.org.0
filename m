Return-Path: <linux-gpio+bounces-27529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F987C0119D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 14:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD0CD4F10D0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 12:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05493128DC;
	Thu, 23 Oct 2025 12:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBpogQtZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D031352E
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222069; cv=none; b=ajk334zXroAkeipzzDrCa/baXJnsXgZcu91ls05VgueKD5qFugotdH1C7U06AFY1MQbX+Qt+94a+nA5PNJZZiToBARrQh1LDC1S94jqT4WQ9MYwQ6MiFBiOogItBAvSBoRIB9mVLtJcaWd+9zDG74yVkmUZ7Dud2LtugSFv+XpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222069; c=relaxed/simple;
	bh=IsrehhMvsrqu9lFsyjvZapoUoNadoOE7Ma0wSKKAINM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJK+jNtCAYb19lK5HAxIWAjqZH6Vn35qoHxCnpwHbvfwBkCO6dTcZOyvTXi6omNdILK4lwkIHLDQ/hhJCV9q4rEdLGnb9zimAxknyV0bZuivEQQzwcmBbg9eOKDgw0etdHWfsphAS670XgWCMPLxXoSH2F/B2Muo+bWHn4Ykzys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBpogQtZ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-378ddb31efaso5590071fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761222064; x=1761826864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsrehhMvsrqu9lFsyjvZapoUoNadoOE7Ma0wSKKAINM=;
        b=DBpogQtZSrqHb091qyZ58R0nqddiwVu0K6bdVFB6tyFArMXqjxU7Zxuz72OOg3PfsZ
         7vIwQ0MIUj+CbbXxg5b8/9fW2aKxlcR+XGQ45WCKqa743Idcu3wKINZQHLWVFn04tHx5
         naLgQv/WP2C8k8NF6yhb888loyOgklt6N7NoYSbrwa0zckGg2P0ve1bKzZ9SOKWTYUWM
         exmzga/ylC2LkzetZ7GBV+jqYjgUCt5UZlgAXUobh3pUxsfbWFzPN0qF8v1iipwqNvnn
         m6ZCXFEcKk+Z86C5ZcguSDuNmF6vWjrHf/CeBseyLpbLY6Oy70rHdnAOQtkDbgpbS/xO
         SYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761222064; x=1761826864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsrehhMvsrqu9lFsyjvZapoUoNadoOE7Ma0wSKKAINM=;
        b=ec6iw1HPV/t+nuyZD+tKFqq9o7f/8sIfeFdRccN/bT7bd7/QwppTu838byXRvnqrx6
         MRVFe9L7NFsL05KI49lY/ulU/ynp7h5ihi3PEyrIOmQiMFxi1FzGE1vsurv1is5kJSO1
         33FxsAyOjPSfhdeeesCtN1ZKBvOUzBYASXpMGHX6C5DlCPpOYUypJLDcF9QpSBnJC91B
         96hcdL2iAOzoqAi57pQROTOdUvc1eD84HmbbCahOeADu0+R5hIVkOg4dWaLoPpn3AEtN
         aX5z9vGZ+ZiMRNh7T0na4Cz/q6osNUdB/U8ZTag7zuohWEdSff6WI6gzDi31QJVQGOoJ
         eYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtod35ZpW7TeYUFYrwEIiWhV5Dzb4LDSFzCHLQx06f7ONkpngrlcBiC+Sg3NRmgZAOpaieT6CaXsrY@vger.kernel.org
X-Gm-Message-State: AOJu0YypSxH4xG54iZx5wouYomnOoSIgRORHqUkcG0JbMbA3eBSowHJZ
	fxsUH7lRcLODSq7ey+b59CGXPppH31fMCRloONkK7EJn6TJZiNUgm0Uq2vrwp94O/ClA6ZDLiKd
	YlXzWbnF7xfNDq/Kojsa7IOGa5rirn5CoU6k7N5hooQ==
X-Gm-Gg: ASbGncvtxBYACZL7QnWbcE11q6r51uwEdyKZlhg2/YP0+akN9XW/z6D9BE715J6ugAX
	qkKC7tkEqlfP/7aZVAzlKFXnb5BZnVMn5zfm003LWiA/mh4Fp5NzZfSxE6oDk5e+LrQ855Juk37
	Y/M85f7a1CnPtn++Z07kPNvphiySk5GkfgRi9McyrtnS0Jm4VbWvixOEsld07EIAco5wHbUnYZO
	B8PEym1rt6b2Wgj8SuCTVvoh8BVWLMrMTrEgtzGrrbdq8meEFP3V6zazG/UE4eFzHgS36I=
X-Google-Smtp-Source: AGHT+IGJDKf1Uen//0RZcCPTXktSRMtt1HNpyZJcWUOPP0zlmgwvqRWYrmfkUyl6vNlHZ5TMcW7bpMrzIgjpQW6J08I=
X-Received: by 2002:a05:651c:1595:b0:364:f7e2:3908 with SMTP id
 38308e7fff4ca-37797a1439bmr69500261fa.26.1761222063730; Thu, 23 Oct 2025
 05:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
In-Reply-To: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 14:20:51 +0200
X-Gm-Features: AS18NWDVMpeecJjv0cRW3F7qI1uaG9BjtPpGzNd6sonk6qBJU-hrZwRAkfMZn8E
Message-ID: <CACRpkdbwnzLT5jNtVCLUmadNt0FBaihg8VRGECdht-Ystpqd5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] reset: rework reset-gpios handling
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:41=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> This series does three things: extends the software node implementation,
> allowing its properties to reference not only static software nodes but
> also existing firmware nodes, updates the GPIO property interface to use
> the reworked swnode macros and finally makes the reset-gpio code the
> first user by converting the GPIO lookup from machine to swnode.

This series as a whole look completely sound to me!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

