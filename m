Return-Path: <linux-gpio+bounces-8553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6F946B61
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 00:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AAE21F21DC5
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2024 22:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB7658ABF;
	Sat,  3 Aug 2024 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aG/gNvhn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E53EEC3
	for <linux-gpio@vger.kernel.org>; Sat,  3 Aug 2024 22:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722725537; cv=none; b=XRIyyIzzbMeSUl8qIntCQcUHkQh9zm8GriAEbFBLvv5YmqjGpMA41LcKc8TbitTVE8tN2ZjKMwNUahn7XqewtFoDAQNjW0pPoIvs4a/oObJo63W9oJwy7HDuJpZvqtpJm3AK0nY6qVi4tVMH9txyXBzrLt61YX1E14+r9JfMhOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722725537; c=relaxed/simple;
	bh=VS/k5v1QNh+3vyYqhg9LJgwdVa5PJldl/+U1/qKG/94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqy/fC4vQEVdLr7BFfBeRHCrfoXr15ATMuu36wpssmcCktFUTpKTDcU4PIb6Uob63YRhhEuR1Z6PfiAFGUDyw7ThOkgWoWAy2gHFX+B1+lM5Z5oW+s4dTMXhi/HxO+gkafiVnLrh5lELUkq7AqLEr2T9M5IQXF7z3ZlKcXJJpqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aG/gNvhn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f15790b472so41416761fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 03 Aug 2024 15:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722725533; x=1723330333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS/k5v1QNh+3vyYqhg9LJgwdVa5PJldl/+U1/qKG/94=;
        b=aG/gNvhnhPVXdVIbUpb5vM+gjqnnDkbGjdaSXiGEZ9IdwxFb1JMgeOscKyKswlhYI8
         ZH/zbOjetAcvnzyYbIXEcXyT9xmdcqD29i50eUciHnqsD4J68vzY29Th4REvH1GHvRp+
         OMdg6Bwvqy7jwNyt38JgGBFKBEuu/rbTDQP3nnjq2YdIX8C4sr0Wo/5eNBSkiwLSyilL
         yPce+2Nl9CBwf0LvS4HOLH+59ABHICHZsj7fZ4EUMVo3HNsq/3K2EpttMRgeCCrhIsRS
         r9/ccDCRJLwEid+zyXOqIIFh5LkPkwsWLJ1Kiv8fabuVVIqul+gnzyvRZVlIn5iTp1Wi
         YdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722725533; x=1723330333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS/k5v1QNh+3vyYqhg9LJgwdVa5PJldl/+U1/qKG/94=;
        b=XHlCZcA+t72OwpGmq3zbuOPCvXLzZ27ChQv4Kh1IXbCSXCEDInJSqyonx1K5K1oHhn
         JRd9Xk5FLHwV6CI+WSvLrnHtzcJlnuDgUiOwlKmHtaonDgDVyyhhe6U9VaE6B3QCaK4n
         LqMm++84GMiIXJtkkqKG8AwvejB9ObHAke+xc1HDOSoaLCoG6HpHRVxbXo253SJLRoRx
         PiXRsvMnVlcsYA1k7vJSv2u/6nHyqspKgYfaVf53eoLURvD/8aWn73DTHBlhxYoO2Uon
         tZqGWODJxPWwXT/ojcDibq6hJJQmEAUFceQtzShfNeVO0wvRnzbFB//kI4uNeOBeUmjE
         Zs9w==
X-Forwarded-Encrypted: i=1; AJvYcCW2zZXZDRY8PtkfwjgDXeW0vKFWHmBQL8EcOtthadAKeMsfEgOQgLrGQ2q/itldURUkLd9LlUImLrnig4Ohws3VlBj9q/4j5aVOOg==
X-Gm-Message-State: AOJu0YxYZwMJEigqrtno20IOhKCL+9hH18mWuAw91DGBtoLIm58dWUNT
	f8n99QAvfus7rMYvZxjyh12OoJYcQmV5tzIagmfUoiKHonCrOwvEgNozy+gKrGvO7uhuQenoCL1
	rW3w5ec1WR8XwWYsfGn+jzR1suwq4lQpTwAVCnQ==
X-Google-Smtp-Source: AGHT+IGtKbqnwPRPd/X8SX60v5j4Xq35XV3AX5MwZR7GvVw8lAT724joPpRICFpM2WIHSkOHDQu2mGHM8Arm0D/qCKY=
X-Received: by 2002:a2e:2416:0:b0:2f1:59ed:87b8 with SMTP id
 38308e7fff4ca-2f15aa84f4dmr51196711fa.3.1722725533354; Sat, 03 Aug 2024
 15:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-mbly-pinctrl-v2-0-d470f64e0395@bootlin.com>
In-Reply-To: <20240730-mbly-pinctrl-v2-0-d470f64e0395@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 4 Aug 2024 00:52:02 +0200
Message-ID: <CACRpkdbM2CQdgCq916kdObXUH3_73Yd897QxmY13mPWAzvHbHg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/2] Add Mobileye EyeQ5 pinctrl support
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 6:08=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> This is a new iteration on the Mobileye system-controller series. It
> used to be sent as a single series [0], but has been split in the
> previous revision (see [1], [2], [3], [4]) to faciliate merging.
>
> This series adds a driver handling EyeQ5 (and only EyeQ5, not EyeQ6L nor
> EyeQ6H) SoC pin config and muxing. It is an auxiliary driver being
> instantiated by the platform clk driver.
>
> Related series are targeted at clk [5], reset [6] and MIPS [4]. The
> first two are receiving a second version. The last one has no change
> and stays at its V1.

Patches applied!

Yours,
Linus Walleij

