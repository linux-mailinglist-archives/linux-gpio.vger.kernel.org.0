Return-Path: <linux-gpio+bounces-13962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A81A9F4CFD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47FC47A7507
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AC11F471B;
	Tue, 17 Dec 2024 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fa+hsAZq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C911F472C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734443905; cv=none; b=YLNr0gflX2wRRdrqlcWTfZo1b4rcwxKhF7v+TjTIwTqvcsowIPuypcLRXXnGNiqp/WeKGP9Zd/NRCQ1GJcuQLr/SfjSguOLwJapK4NzRMMTtg3nQhdrOuYqRZvgHsaQ1bhaD+BmS+/l1RCGg40GbNpkNhktNZR5SECekkuoHk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734443905; c=relaxed/simple;
	bh=kMuWfQnRormK6Ps2tPKYK6JxmEozVsabAER7DIY1C1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRlnv53E9EZGOaGe7kzpWpYJGYcEE7tx19pS2WR/AdWREIAD68AXXxoxNW3Q+j6IHhTf2yTy4GNEoSquFoy8VSF1iOb/TRbzwdY91t4t/gzKfBYzFIZ3FzvbpJKdSXaFkAi8rfRYzN1/vh1UM1S3x+PA1wNSlzSRnMt7yxTYH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fa+hsAZq; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso4639050e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734443901; x=1735048701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMuWfQnRormK6Ps2tPKYK6JxmEozVsabAER7DIY1C1E=;
        b=Fa+hsAZqhG100CyApC81ZNwzVAMIhbiE2eyhTpVbDUW7Do+f6afDUF8cd/ypBBxgvg
         doPDvCDRtBsLsEOY5gnU+PhJr9xl8fUL5k11duu2YC69R4SN9ZAoxkQT7PcO1J11yrC3
         3LVoQR8jBaEmUjfGb/s51M3TaUBV6fKknA+Qw0b2XIRTWzxbBS931ky2/mejWa/j2THx
         Q4IjRZb2oF7e7GcNm4oJLA+0HGf1ZjC9ysNLQ9CelXqAWJucvPMclugDygb0EXztmL7B
         P3SE4YtWyGG1P+xL0peG83gA7AGT3LXwomugZcw4/jarMu9oVLm/h0ndiFTHlqlsbY/E
         HreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443901; x=1735048701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMuWfQnRormK6Ps2tPKYK6JxmEozVsabAER7DIY1C1E=;
        b=Z/VLcuyr/eZ6x9lhfkKNAgT1wC95EKJTHC0b1EEeVQYh97ZwY6KqQ+llRy/J53DwB1
         LQopjmIM6+WKijmrUUDYBI1vNJaTusHtHBbwLciH/7z4c92bh24yGWpyyRLwLShEVEQY
         gk5QxAP/kFVmGDCJfGrtalbfLqijJEWF727SgwaQTj/1FF+R4BVKPAkPp0cVUKF0Mo93
         R7hMgRgc5zqpRjHtQBLMQas/AIVpQ/yCYdzyi0wc7NTmzMem0tGPMfkGLvap6X3bXOhP
         9lHJuW1aRZEFUb38nW5ljRIF0EeE2z16e9FcVKfli6HKHoO/sF/3QG3+tUf2C0m9vILv
         GYOg==
X-Forwarded-Encrypted: i=1; AJvYcCVp7OWC7ksgDBcScljP8cbZ4YDbmuPYm13RIboYb+h3ccBDB7DIfZNvqeLqGBLPxpJVubfmAw18AK+b@vger.kernel.org
X-Gm-Message-State: AOJu0YzHJAwnGoDpowv9wOctWrqGSyjWWchODnk++Mbpi184xXwSurg2
	gvyAcRWBDt3EvF+NjT59pNmtDeG5rdssrVt+QKOqR3KDwVR0a8EARL8HT4dL0LsLfFRB79PsLBZ
	06kMjAiloKDgltzdXm5lw0EEM8EMrMsHSWbsl4+sBrtLjIUvZa0o=
X-Gm-Gg: ASbGnct3ucvTxb4KDzRgLuCZRVEBJvkpZsyJmcF1fHUUJ8Zv4fBl4xf8iA9MqVB6cWv
	bgNESTTLFfi5uHtqN2SQyxtqOVqlSsZQzb07WwA==
X-Google-Smtp-Source: AGHT+IH/9Tb92jrnZIg/TBGrbg4bI20QwqIZed3/NmrjDjk8EJamXNZQXG+A//FMri3HGs5qzQON39JcdFZ7dtiiqiA=
X-Received: by 2002:a05:6512:2203:b0:53e:2f9d:6a73 with SMTP id
 2adb3069b0e04-540857ff585mr5866585e87.0.1734443901223; Tue, 17 Dec 2024
 05:58:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9a5b38027ed674ca773fe28a3b3246631eae8834.1733404358.git.geert+renesas@glider.be>
In-Reply-To: <9a5b38027ed674ca773fe28a3b3246631eae8834.1733404358.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:58:09 +0100
Message-ID: <CACRpkdYG_v_4mrZBzFVCRSpjg4SojeZ_hmoHTvMzf8k96tb2mA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Replace seq_printf() by seq_puts()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 2:13=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Simplify "seq_printf(p, "%s", ...)" to "seq_puts(p, ...)".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

