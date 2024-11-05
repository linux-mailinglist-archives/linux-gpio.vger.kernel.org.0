Return-Path: <linux-gpio+bounces-12562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D199BCCE0
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 13:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95E49B2195E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 12:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707CC1D5AA5;
	Tue,  5 Nov 2024 12:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLSISww/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9A1D5AA9
	for <linux-gpio@vger.kernel.org>; Tue,  5 Nov 2024 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810375; cv=none; b=WdAHXp81MKhMXW4/U0a1f6hRSwYLxe0JI9WMEhAAycnPlo9jpP7G2giBSW0BJHyyO3xfquE6RL9yaxChF4uvLcva/xuTN1V1d+QwhOCRzARpDyJGjOZ2xExH3JNqY+86ffukm8JqgBFehFY48fkFgjBxcMsJQV7hNII89gFvPdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810375; c=relaxed/simple;
	bh=r5SkZsfdNHYfEmGaTMrD+j+KnIMUJtNk56yCTKDPjAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNSq87O0oY3w9FpgwlXztbRjkst+UqBel9hfxmQi4f0w50Wj/aE2vaRjCGaATT/+6a/OcmAlpFlFABJzoHZ5uyHyb/Bcwdagh7jdvDntP7LhpMVAJ6bFAHxKmMXbZS73UckshyIhv9RPYxliaxvPvvnLzXbAAFuX6PW2RLF8Kkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLSISww/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso5768499e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2024 04:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730810371; x=1731415171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5SkZsfdNHYfEmGaTMrD+j+KnIMUJtNk56yCTKDPjAM=;
        b=mLSISww/TWKmUgSgej2d/Ofts6S+NGYbs7CDQJzCGxt/QXX/RtHVcS4MXW2BS7dEXt
         gK8Rpbj5v2aZGrkmErWPYd+VB+MTTHNk/G9mlfuFPgoV9294Fpbw02H+LQf1VmWvv7Vo
         EPMdTUfskjSb15AnHVHPW7S5nLOwnFh+Fs2mnp+VRKsbfxdU0HjAduv1IKoO3HHoCYRr
         B47AS7xQm97xpw73nqgHVSa0mBsmVJu668L27MlXXo37nAThXJg/ZDz2RAqHGzKnI+yH
         mEQGg3g/BvqU+w+QE3GB7BvMBEe1MMypR+8V11dXczAba2YBRnXVPXfIimbgHr4SPV4+
         8u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730810371; x=1731415171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5SkZsfdNHYfEmGaTMrD+j+KnIMUJtNk56yCTKDPjAM=;
        b=PJIAJYT7GTuP/aefQ1PQslGIRa6YZHKkNNXPDKvPt0YHJkmsKcGlrqggYmN+qCCFYC
         N1d154xvOtpjHX/KMueI1aG2KeIBggJ7l5RhPCgog+eTVxAt5u+NSkBHrA/HbjMqiGXk
         VFAMUu1Zoi9sgd32AN7p9sq7Y5uUW2UrIpk/aFThbMzVj6zFJmB8z4peJIJwEp1Or0uq
         Y1Imbifi0qqOUYIoe/wiYEBng/LHn3nP6R7xq43u80KOawA/APvEIIvDwgMPDvE7s64G
         ZeKNGGjWU3gyJEsZPvuN+thFlI5eFnTTMoGoV5JZfS2/xruHcgiTrrt2kev4wyKzeZ3h
         mH0g==
X-Gm-Message-State: AOJu0YxFya0r/6HJqM3nt0xjaiyUyNA7g0ZGD2/sy0BTaJNVpW3MWh+0
	ipVy7E3n5roIHeTjkc77J2G/uB9D8seDyMXUrB4iTvfGqer0S2uN94NkS3QU5fK+s/UmBhEajcT
	HXEoRzt1XrBzbc8gUXEpQHF1Si8/Vwcx91zA8lz1JZIdfqCEm
X-Google-Smtp-Source: AGHT+IG/OeyZ74LLP6TA3WeJO9DHYrUzupopzPVIW9alwQB3ukGpHoDWZF83KBiKcfEBgD57FQBCrkdeC9gR2Tq9Fz0=
X-Received: by 2002:a2e:9fc2:0:b0:2fb:4ca9:8f4 with SMTP id
 38308e7fff4ca-2fedb796712mr77501471fa.23.1730810371168; Tue, 05 Nov 2024
 04:39:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-obtain-grandly-1daad5ac36b9@spud> <20241104-tiny-evaluate-9336020b4b6a@spud>
In-Reply-To: <20241104-tiny-evaluate-9336020b4b6a@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2024 13:39:19 +0100
Message-ID: <CACRpkda6NQbkMfWszbPFodz8TNBgWmpRgdTEN1ByadYggCXLbw@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, valentina.fernandezalanis@microchip.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:49=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:

> From: Lewis Hanly <lewis.hanly@microchip.com>
>
> Add a driver to support the Polarfire SoC gpio controller. Interrupt
> controller support is unavailable for now and will be added at a later
> date.
>
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

LGTM!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

