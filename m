Return-Path: <linux-gpio+bounces-4179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA98740BD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 20:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FCE52866E0
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 19:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141AE14037C;
	Wed,  6 Mar 2024 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXHniHiA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDCF13E7E7
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754476; cv=none; b=IznSbMWjgD4vtVkopVJwEyW4d2fdQvwkBr0olyF/A/n2JifqtrczhKfQxTIuv/h1cR7g3n7F1n/Q/lE70WtZSjvhTbzLZb0O/MoQruLGuBY3oxpDrQxzp/OT07to1KdkbzXtx1HGDOJVQtYOUZP2ZQShSgJLAoCdS+2GDyUKGws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754476; c=relaxed/simple;
	bh=Yh2L3pOmMN4EWnH4pJdps7BwYg6YzU0CzxYNc6LP/D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnFZb9gzTrUR1XLvOzZ4bwPfve2oP4QzrJJNuWVtUhwIz0qKs9aLBHH33aeogd0OhmapA3IpmD5TPo+7DowMrGV+RIRu6X8qXZ3JEJMoHf3Uq9qg8efHsRMbCtAtw8lyoOyLGffm0/8BqGD5fIyG+T2Xfs6DqOhCK9lfcwlV1qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXHniHiA; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc745927098so40596276.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 11:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709754474; x=1710359274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh2L3pOmMN4EWnH4pJdps7BwYg6YzU0CzxYNc6LP/D4=;
        b=UXHniHiAp24HuV52efzvJWPwJcECB6M8xZEYSIcXH1uCwnUw5YYvbEAZITB2P4ATCk
         w09jAwqS+j7RaQHcuWeTMLgzp3H5DtkAUnQinqquzJVlBM08CZBllOk9XO4eeoUUlgaN
         Xan+tusw9L0tunW+q2C6S8tzJpH/YeeP2hV6X07yZqohr6UvgdiuOaU20wT+QtkAH4GA
         CB7P0oAS36G5hwkwN6tiiJK1VpQdwXeX+hYNLDJ3UHVKRbwtGmZYXL8BEJv5Kblu2obn
         nKRYOAYqojdNQvpjCgRtb/OS1uukr4a1IUpVIq93Q/X7UTFL7I4N92leOs9yPV6TCgoW
         UGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754474; x=1710359274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yh2L3pOmMN4EWnH4pJdps7BwYg6YzU0CzxYNc6LP/D4=;
        b=G9T5OH18aocKCS7PLB7+fz7TWY9mNPfOv21ESM0DgA3zuFLIG3FZi2DV32q6h8r0N8
         Rs58o3/sifSTTKoySokwTXugzg1YEDNZAojSJ7XQ4N+cEpYGlePEfwN6NiIfmaLVktKj
         gDtDpwUADSqoicDJ4L6GB/PirDaU4+6z8TdVTCZK2s5LFAucPwfEBE9AliKzzCkK9fjP
         RQXO40aLs//eL3V4YRDdEY6xny9CKljtZcw+4NFRDY17qJP+2f0lPwB76ttUi/f2RTLM
         8dgXVN4woamXfbhzhUOK9QyvABC8cYl/4g9m7cbbRvoJFA4N9hEMCzQHqSUsYidJALGj
         y5Zw==
X-Gm-Message-State: AOJu0YyEpmnR7xY9drlABEfCjzvWquLX4SLxb94iGOZBjLx1DolA0aQ+
	tN7lWtoiYeFZrUL3muk1yVbly+HuS9Okxm/EKVfh9+Dfqre8dWqzghLt6Qd2PV231FIbVjMpzYq
	P8pJBchG0sDCLx/GlNzZbCplEddlWbU7neRe6ZQ==
X-Google-Smtp-Source: AGHT+IHzvsVS8gdKXC7Poss/KiWmvgSxAwTv1LyF918+bw/LOPsyLs/sQwyT8rKkkhyR5dQK6lCJaAp+oDLyVtnX7KI=
X-Received: by 2002:a25:ac9b:0:b0:dc6:fee4:e889 with SMTP id
 x27-20020a25ac9b000000b00dc6fee4e889mr9923807ybi.13.1709754474341; Wed, 06
 Mar 2024 11:47:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-mbly-gpio-err-fix-v1-1-a3605ba2336f@bootlin.com>
In-Reply-To: <20240306-mbly-gpio-err-fix-v1-1-a3605ba2336f@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Mar 2024 20:47:43 +0100
Message-ID: <CACRpkdaCyMntZDntbDufMQc8AvCvJvN5hk1n=ipjW+DmVXeSww@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: fix dereference of error pointer
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: linux-gpio@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 5:19=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> If nmk_gpio_populate_chip() returns an error, avoid deferencing its
> return value.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-gpio/5ee722f8-7582-420d-8477-45be6a=
cde90f@moroto.mountain/
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
> Fix a smatch-reported potential bug. Thanks Dan for the bug report.

Patch applied!

Yours,
Linus Walleij

