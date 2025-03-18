Return-Path: <linux-gpio+bounces-17725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46931A670D1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 494BE42120C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E928B2080DA;
	Tue, 18 Mar 2025 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXikAOnb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F792080CD
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292672; cv=none; b=t//qrViw/SI7y5attDCXIhyDFVwUC4ZSAz75RlUCqtvn6bN8lggc2pWPy6A3jsVBEOWarvrCW2Ldj7JG/PHWcZUJfmWNwTCzP9BDnTGwxAJI1d1nWOVa+wTki5JD65mw5ZIAD+n8VPOneNyldHOcLCkCK+ubO7I1IRnVvWeuTz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292672; c=relaxed/simple;
	bh=yKQqeVn0btUdtS+qPzT5gdetvTkb3UZO+pyG1ZeZ+mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bnkmo/JCre/mzqvmck9+hwBwrH6um8orjq2JjCIwzHCedGRqxLCaltxKEaUqAa0OeVt7D1xi7rarIrLuRQXSbWATzDoxeoylNyeCPtLHpw9PG/Aexd0KnKg4rQem2FojPWym0JY2mF1OPPM7VDnJqGKx+8Tni6tApiai9Hn0AP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXikAOnb; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54998f865b8so4798880e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742292669; x=1742897469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVUpvtTBLHRQ7RrqjSGWWvP5ToHEThWrbkH7ADEWZ7k=;
        b=UXikAOnbm8TH+gFEHGyCBEvUGM/HaqI6axbdWnHLn3fyHyBj9MoFp9LMdEq6pirp9X
         x6kOfOqeediFjUcwlkumwAklWCmmXh3A7Cy11obEaf0AEhcqLAdP+o6nP1rFkyKejdjz
         UIoq8tsWfsTz9xaJPRV1LEUp8ARev/47Id7BQtooL/c5eX+otuZUqBCSCcbK1Y8o+Yau
         unW0JUcBVa7UK23weMWrk68j5p24dBoeRgzqXj4VXf58Y2DxeLFT0HbQLc688Nlje4L+
         QsLG09iy37qXf4xU89EiJsNwX6Tlhx5TAogG6gtb8AiPIeapfNDp/e+zHufjFmcEKzyq
         /7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292669; x=1742897469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVUpvtTBLHRQ7RrqjSGWWvP5ToHEThWrbkH7ADEWZ7k=;
        b=l1jQGAYVtgNkFWpEZDBv7sL2EB9CrWTpySfRRNd0ErXrWQDApCdi0vlTXophQ05hor
         5/ZPuucNap3Qbt1iOd9mdE0t7/kPdG5w5LXVXEZrPPNjnQnR1ijIFRi9Lo7VQFQpZXvi
         l7esU1gJ5T4gN5PymLdld474EwhKcwvqmGi5rGfdUBpT7CMXKENClzaTX7vpb5QX7PYy
         U2WbrFqoID+1Eyc7o0rSdq/rstoRXeI0ZWzUEtaeHxUb7ki33cjMCJHwvLN9EPeSsmE9
         ZAO965NqDrSaylBNSftOddG1P1JIo8XzSD9/iO/mRcKnpihB5SGF0DKg03Synuo/kwfM
         D5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVeEGuvwrktsgw8xrw8V1sIwKxQlzR77SBCldcXAb302kgGnL+JKQEqynwA2dzTV3shD56GmVEt1AS9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TJXpf507IsBZcOHOAItqmg9c19dtIhghoQT3VvR3KSwsb8Hx
	F8/bWVMMVcYCeEmB3YUtrJatv6BsloI2REqovgjC57owP1YP1ko0OI0yFxZW9cejN6OpXLerVrV
	0ZawO3IJTvK5cLV4NfJhRobh/BrormKJJK1Ac0g==
X-Gm-Gg: ASbGncszeWpNyujoti12tSPABNHdhoaXi4n73d2hJkUCSkC+jBKcV1MkCnmFOGQlrhG
	HFN4HAlCPVaUuTWhWsHthU/0SG6BglacgMl6RuMxfDwF5IJNbcqKjqRzS6M73J+N9aT+JLhFTx8
	ldImdNkj8m6b7U+W5I2fSrBNxH9A==
X-Google-Smtp-Source: AGHT+IGaqrncYYUr4sfyRfLFzOEWIoUn1i0mOansd4z1qNbCCAzVBUKQPVLdXhHFFByp6tsLCBEDJwkAWjabnBVbVpk=
X-Received: by 2002:a05:6512:3b99:b0:549:b0f3:439f with SMTP id
 2adb3069b0e04-54a03ba664emr2114093e87.25.1742292668868; Tue, 18 Mar 2025
 03:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 11:10:57 +0100
X-Gm-Features: AQ5f1JpKJfFS7YVV371lRPx1Y2xc562AW9pLo6dBt2VW6OJo1Hlc7eGeR9sMzjI
Message-ID: <CACRpkdac0zZtB=85Y+Fu=TYwf9qTjNog90-P4SBjQ-oB7X5Vag@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.15
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 3:31=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.15
>
> for you to fetch changes up to 701d0e910955627734917c3587258aa7e73068bb:
>
>   pinctrl: samsung: add support for eint_fltcon_offset (2025-03-11 20:37:=
29 +0100)

Pulled in, thanks for taking care of the Samsung drivers!

Yours,
Linus Walleij

