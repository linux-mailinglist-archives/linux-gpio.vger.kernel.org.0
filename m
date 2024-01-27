Return-Path: <linux-gpio+bounces-2656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E583F108
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF052830EA
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 22:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424FC1DFFB;
	Sat, 27 Jan 2024 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tW/hJqkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E2C1B7E5
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706395405; cv=none; b=hBQvTsyL5icTKn+45344vJFyRBefcKlx7Wg79AJsqIJUOH2dJ2NhSZ27ySBqAY5xVIv2y7Fiw8GXJCxqafZG98j8V1Nss/uCyfpDiQR+8puBuB4KxqdLan/oTe3MtxvZrXJmEdQ8JlzfuNBvE3EROtbtfdHYKclzDs3II/WWlG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706395405; c=relaxed/simple;
	bh=mWjXtlhzxJ0HumO9EQxiUCzJoLvCZ3auqmtfLpgoNWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpre4fxFKADYRWUAjxGg0QIvlcgVxyKsA58GqRI2X4F4Wyi4LqrD/BkG/rE8Vprfi07s2CI+cgCKIMqgqsSMP67LB4cBgdLiTjEHvdGzBhpUOaAlj39yHnaYHASOltV/80DbULtb+U6b3zHjAX+fP++9PIGL7AZMa3O3sXf+llA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tW/hJqkx; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-59a3446fd4bso64209eaf.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 14:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706395402; x=1707000202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mWjXtlhzxJ0HumO9EQxiUCzJoLvCZ3auqmtfLpgoNWU=;
        b=tW/hJqkxhIwsPSPb25FSMkxaJcNfr8wPiN/bfhpt0PoE9+RVCGzFg9t+PkTVJsuThF
         T/JxL/TGDKsnKKXVqHV+aYYiKdLXdtv5dveTI90c+bS/BGs8pzNrsjEy6A2Ond4zMkEZ
         SxRd9UZIdnQ1JuZiiQFoWEas+Z2mtD6sB4IXYw7nc7SYUg/DgS8Xh40oyys4weZpPnek
         iQEKbsWLjsVOUvebYnl6gXunj+FAUGICscDeUm38LIku5YtpLGvD2ced25D0Hg5gyFCE
         LHELpYmqijcA9kHqefgP0XZB4AGDTTH7pyW5TfiYnAfnMh4hBuXpfRfr5ir1U4cWuXHy
         UqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706395402; x=1707000202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWjXtlhzxJ0HumO9EQxiUCzJoLvCZ3auqmtfLpgoNWU=;
        b=ORjoeu9jovUVzF04Foz1GEUsJp45JwSXCVTyim03uzXr0w8e6S7HKEllQOWAZZ444Z
         4LPjQdOvkM2pD3SkrpjO5LWpGvqy3tsO+Mt08EREQHMZMOdOypvuyu8WQIRNfa3hnrAN
         lQUSCzX+0tTzUNpxyC/wtL9BdEy++ElZux5Bre+tiv8WoO5/rH53/wvU5ZPPwxui4K2c
         DF7byd0y6UYQ9sCuCrKNk8jT7vCUxzK22KDv6PhjKP97s9oUXQqhPT8/swHZyM3yoW+Y
         zLJn+L70yF0WPxB207IQFJQXCKwH3kUU4NeiJemW1BxnNzBkPjzP2kXUEfWsD5IbqAhp
         w9hg==
X-Gm-Message-State: AOJu0Yz4zKAkxiGIEvziR1z1VeP+7VCLh/XyC6kDkVkFKCCEPqgO9bw7
	yUkrpdO5/6ZAGToN9YXeZ/6BebqvgEZQMEkM0gNBgYxxMD1OcWddPOngf1KRzwrPyBdVb7VyVxF
	2nEiOnEohMv+8SPf5mCAgg1M4KJzRxgEiVGe/DQ==
X-Google-Smtp-Source: AGHT+IFXp7NCE5mHliI2s6UcPGOQOOnMnagfJsrWiYKpFAZOLGMz3u/gyVvCJTLQGIRgnARNlVJtzQilk+9uP9DVKEI=
X-Received: by 2002:a05:6830:10c7:b0:6e1:eb2:aef7 with SMTP id
 z7-20020a05683010c700b006e10eb2aef7mr1371438oto.10.1706395402752; Sat, 27 Jan
 2024 14:43:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231225082305.12343-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231225082305.12343-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 23:43:12 +0100
Message-ID: <CACRpkdYM5=55m2ywC981VXVzbCg64Opbh4yEw2TLja998cES-w@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: Add lock to ensure the state atomization
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: andersson@kernel.org, kernel@quicinc.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maria,

I wanted to apply this v3 patch, but I can't figure out what it is based on?

Could you rebase the patch on v6.8-rc1 and resend?

Yours,
Linus Walleij

