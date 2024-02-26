Return-Path: <linux-gpio+bounces-3768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE5E867877
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 15:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FE551C2A696
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 14:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A0F129A7B;
	Mon, 26 Feb 2024 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YaxGyCVp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196B0129A64
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708957769; cv=none; b=jimFJVypTfr+gqcntcPRE5n7VUUlegRrwe4qAO2pu+lIpCpOHfJrtJIvnXxyUP4AW86DcIOlBEGRNcRfjLEc067T3lOR0v8PmSqwuHOlbDxO4upVGItx2oDU0oPg+QywKz2ivTczypw/02MK6HV0bJU1I4XK8cnBMKc5I7d5Mhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708957769; c=relaxed/simple;
	bh=/uLxpOLO1j6FDLAFqYCfDZm58+r5Mbfa4yVEIGWnWAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tALPg01tfNPXpcwvpA3G2C0FyKXJpyf8TCvfnixKyLx1w0eKt+pTB5lKUXLdGHt6MPhUKJbIum6bP0PoUdNDMrJ6yn/vODtikjO7teUFWhzYq5CjlJk5RSitK2vFfPYzL/EILAVgZNCWGIXJpqo3V6kZbN0TVobzjIAf87v+Z9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YaxGyCVp; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60853ad17f9so24384877b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 06:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708957767; x=1709562567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F5T8yhzs23v++nMWXBDO7bbMb0OiZ0ptHeCp1LPSqA=;
        b=YaxGyCVppHBulCKVLHol94G6BsbeCNEIoxz63YJqgjrHXyQyO7UvjHRBKgqv5X1J5E
         nzH9H18rZ61j+5J+VdxavpmRi6vAtbkdxH/j47beBLZN4lcjThUT8/SNo5PyE8yw6/VW
         0MaqXt+3fxnnpJRAWnzumScvHziCmjWg0Uxh/B+B0s7Aq4IrCri3iZ3IrZz+qh81Nwqa
         IvfrX3I6qcVyyuweGVbp/TW1DKOBqTQYItDNjvm1ZaxuKrsZdmARu6JyFlugyb8b6AIW
         O2/D+Ir1y0aCY7S2uAVq5YxiTBy9NMmXTqWFzYIutkx3g3Pw6pgcglHuv/FtnxgTg56z
         4PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957767; x=1709562567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F5T8yhzs23v++nMWXBDO7bbMb0OiZ0ptHeCp1LPSqA=;
        b=PuGQ6OLTzNMQkqVh3jRnuG6Gqpa3TgV2Z9zRD1oy/BKW8R0TQPJ2LfrwpQ+VZigM+j
         dYss6+a5ajbB3RI61RQXA4J7U4vwjbLje0EdkZi9Rdv79h6gnMwrf4CrUw+k+HHRx5s6
         9FwTP4kIu/HXJr3LHxGNYy0xdBnyL5dUsYn5f5hLfmJO6u7ecuaWnbD5knx9OMjbwiSO
         Ttbowca2SBH3OAFhkjbPtAN2DmpBxY1aG5u/8LSphDFXgXFPxjqGlYkA+DwuM/lBRxRU
         HNMm+fq37tdfsU9sb+z/Si4Bby7xeSSMgjUnvl1e40RT79TpaTxDTsREznnNvt0mZCKB
         XLXw==
X-Gm-Message-State: AOJu0Yz0l7QQUyWsV5beDBoA0ccI6th5D9ru74m/schjSJSho7rALq2d
	hlfk5IhkyIBGvtFD9SseaExDla2wui23U15DHqc4wu9tyLBWMkpJ6tLjxUGOUDvoiu0e6i5vdOH
	m6qH+q9jQ3OPKE8EfxPvKBvS2ef2fWzAPXRdVcA==
X-Google-Smtp-Source: AGHT+IEtZe/qnAbXXtUFnbg1Zv8vz7uzM8JXNLyuoBa8av7j0M3XZuoXCJuSmdwEFXMRCPbpjqFDWFl7kS4OBvoH4K8=
X-Received: by 2002:a25:ceca:0:b0:dc2:279f:f7e with SMTP id
 x193-20020a25ceca000000b00dc2279f0f7emr4078190ybe.10.1708957765601; Mon, 26
 Feb 2024 06:29:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1708687406.git.geert+renesas@glider.be>
In-Reply-To: <cover.1708687406.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Feb 2024 15:29:13 +0100
Message-ID: <CACRpkdanP4nPDFwcskLP8AQ9mYP8aubK_RqXqMxk-RJU6y-zyg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.9 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 12:28=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fea58424e2523376ece6f734479e63061e17ad=
7f:
>
>   pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28 (=
2024-01-31 14:50:44 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.9-tag2
>
> for you to fetch changes up to a6f06b909fee72c679c565adfa7f080f9595e336:
>
>   pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm (2024-0=
2-21 16:34:33 +0100)

Pulled into my devel branch, thanks!

Yours,
Linus Walleij

