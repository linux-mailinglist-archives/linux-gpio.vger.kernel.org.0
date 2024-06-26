Return-Path: <linux-gpio+bounces-7714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4AC917D63
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C38FF1F23CF9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF1A176ABF;
	Wed, 26 Jun 2024 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKwa+czO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53C176ACB
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396630; cv=none; b=t5uu0JUsaukcx0jzRNokhi3vdIrF52f/wk9DKh7GlxvSOhtoOWPGT5cNvo0Rz22zRXfLcGQ111s2MUMIdwvkIqP5YvfNVFVvk7dfKKdDtjaXZYIX61zSzYmzP2PHpsqg1RFTkCLZIQOHxita8evhMpXv4IS9IW1Io2TBDYh0Lyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396630; c=relaxed/simple;
	bh=CODmxJ7WAi/9W5Zp49KBekEucUyPOe+eyV9ajXeTHL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEVcB9mu312W3tZ876GBaR1t9xUcGlGd+wYasxm/oQID0p4eIzxQrshssjhk79yTRzLklTvu/S3cMvZO7ewDIkjwmPYoRA58+ocn0IIo3qCGnEO5H9uTL7sDZOUUG/6MM1a2sTf9W0Cbwv7PNGUgcqrebD/Bnnif3k2PCsxbqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKwa+czO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52db1a5b3f8so406954e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396627; x=1720001427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CODmxJ7WAi/9W5Zp49KBekEucUyPOe+eyV9ajXeTHL4=;
        b=xKwa+czO2S1UKeBnZL0YLRshQ9tZZNqJBOUbRE6tNVFcbVPfoK/Sbr4JS36MmbX4W5
         Pge4TLbFjQPVxShW7Nuy7XbrzZmu9lDYhgQzSHgd+gUk2AJ+BSP2z+1wsx4bW54YXPdj
         UZWh0A4kpM5WqeYEZxTV6EADmXrQVtQrDhZSrurwTTkJBM8XAhkwbRIeSulusW2sy9HD
         y+L9Xxm0zHJjlGpVa6JfMubdSBzQ7m7kdwUpyd0RejVE3mNYbgYrbMyQEnylllanr+b7
         SupX5crLzCto50jfDCmP7cQFYabQNNtL4GOjW25dZdodm1ZVGSh67BuEJrpj5I2Z2mv/
         dUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396627; x=1720001427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CODmxJ7WAi/9W5Zp49KBekEucUyPOe+eyV9ajXeTHL4=;
        b=siehbzI/af7XBD2jxQlLhc6xVZjBea374KjF9dcORQvyrT2fVaxIBMBn8PMV0zrUNl
         lvbu6arxOQzON77zVqFnaNsrzB6rkGh6bF6R8jTITvJJSkSqFTYa9kck5qiSwaR/G+ZA
         zdnsXP1+BBPQT2FXeRdvdn7MxHxTEFCL4eYkjmdArXDUGsgVEhjTG1kthytLKgW23Clh
         J0dvcXj2l+1QSm8IVA1N7G1bhmsXcv0Jf1pAAu8P0LF4n8KD4bUA590Xu6ATqalWhzjy
         uR8pvkPl/YrVgm3PGInT17sSlsF/UoKHZXULdGTvSnWUDevJIPqt483tiB1rCiXkPRCc
         1Z6w==
X-Forwarded-Encrypted: i=1; AJvYcCU1RD6h9iWfDAITBpgf/JBWa5sEwyHJknfecj2NFzsA8c3cx3TbdHVU0FTzjJEsvkwn+z2bw1s2SYd1vUtRMNp/Bbz6X3wxNN1QyA==
X-Gm-Message-State: AOJu0YxOLlzz/fnvnRwR9l4OyH8LbBMNwnYQm+tjVEEJ6NMh+PFivTjB
	oWvyn17HYdR52/NBn64418+UjpcArLmc1mK1qXE8wKfE89bzLdJIejxDU/C+Qjj/Le94LuarJfO
	CYq2dAGUGzz4/twYKRwmHwb012vlALwpz0D88wA==
X-Google-Smtp-Source: AGHT+IF3lbTV0RYBiE7R5YSmwxSMLcsLF95dsDrDNlAyhnScJgGvl/+e2exCY3OLJZIBn9r5xOXG/EzI6V9+H38zQ2A=
X-Received: by 2002:a19:f618:0:b0:52c:dba9:55ff with SMTP id
 2adb3069b0e04-52cdf15b006mr3296922e87.25.1719396626376; Wed, 26 Jun 2024
 03:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
In-Reply-To: <20240621093142.698529-1-potin.lai.pt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:10:15 +0200
Message-ID: <CACRpkdZ4+pJTSu+GZ=BSfY6G-3Pj=81275AMEewAvoDFpACYMw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] add ast2600 NCSI pin groups
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Patrick Williams <patrick@stwcx.xyz>, Cosmo Chou <cosmo.chou@quantatw.com>, 
	Potin Lai <potin.lai@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 11:33=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.com>=
 wrote:

> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.

This v4 patch set applied!

Yours,
Linus Walleij

