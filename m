Return-Path: <linux-gpio+bounces-3053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9884C90A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 11:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07715B243F5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 10:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A325171B4;
	Wed,  7 Feb 2024 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XCG3tJA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0B17BBD
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303393; cv=none; b=PoOSpoUWtWkMPPWftWTJKtEqxoGtWuafUMg2u/7fdrCNKxB7hoG61wRK9SaPGRyyf6cEDn1EWifIL4QXRQktUCwdZc0wUdZ1CAyVYx8nMxCLR0rHk4I+ho+ipTbJNF2ba9Hg9w9SquEtfT3AdOsSlXYsN+BlWIDej3R2ZgJnqSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303393; c=relaxed/simple;
	bh=4AUeUAJBjmhNgP3HSPGmFNNt9I00EF32i67Ieskzmwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9wzZiLCjgHbpa9MZ7Qp1lnmYxaZBK9O7w2se796KSHrVo79f3e9fjulgVOwUD6g3jwBRMtDqylG4abZY6SN4cna7+IvWwl+B1a0OMb8xc1M2z7+W8ZcVYS3mn2dI+/ubAH2sJyMAMKBN0ayv5kZLPboawlrIPUtGQyU1ESFqPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XCG3tJA9; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60482b91650so5239287b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2024 02:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707303391; x=1707908191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfNMu9yYQSlt+ahy6TCysrTzsaeAnaZUTlIsY0hJS40=;
        b=XCG3tJA9y2E7XCL1CSeeV8hMQp5sOmiYkrNIOVSXVZDRj8dAFRJV0BD5lgjsgRPEX9
         JxMKuXyJc25n0YreUx1f0p6waWCPdajSW+e1qjzroeRiqetf452a/VQcTLUP7pE0dNap
         Z6U8J8Q9obaw4RK46ZC2FB57z6PrrfSp1VVaVztiv7jggK6TNHhFhe5fWkdLlX9FXvgg
         37Q5XuJ9KYrU5JNLyuRqPzy7aHcXAiAtI1foQTluBbybsUZ+Of+mIqAKcArQi8MsHob3
         +h5/CKuaMVpxugH61tYDMHKm/7EH5oub7lsNEZI9qkT0eZbrtsjJcp8HD2TEZnlRoBcA
         HYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707303391; x=1707908191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfNMu9yYQSlt+ahy6TCysrTzsaeAnaZUTlIsY0hJS40=;
        b=gIqcg94ofsZnA1uzN7KfZ7A4z3S2mOfRETB5VFy63kMrVAVzKBV0zbgUUc50Yboh/K
         Mg1J1JbrW8VAPiAdooCJ358z9z3a0Tvz5fs6B/3k5CyMKlaerosSEyz/VAqzVzpkCuUI
         /uxfCQKnkWfpp4NaAxvu4hwDOXhk8kmEGE6FOGbLVMTmTQKNvZNqzDswcO4LKXkZo0O3
         H6FAtdRoh8nMehJ99/SUdikWt+T/od6SPO9Y45qShBfWHLN03evzevuNHCaIbKXfBEVc
         UB92dCMaxBxLEkqNVEE/4fkjoni0/W7xKzRCk6lWZUjkRZUz0o8LGi2Czcda6PjhzLKu
         afew==
X-Forwarded-Encrypted: i=1; AJvYcCWfPJSZLXcVwdLvqCkteiqDNMbZnwgn+9U08+8w7jbKUmpid9lO3Thk5pXJvj+51Ze3HPUnpyTRiyp87548Zt4+CNXNeVQFsyl4Sg==
X-Gm-Message-State: AOJu0YxY18Owxn0SOP+QGBpk8fbJRhKMJkln9wJzPXyiTPcpm0c3KSRS
	3XUDRLzzQoWdzb40757R/Dbo2I8TqzX/UD2WH6SBd+kE+HKj4I783b/M/YMkDjpnnQ0JLLc0bk7
	k0tYdNy15jklY3gkFwMVRPNNoCm7pRJb0oYF2VA==
X-Google-Smtp-Source: AGHT+IFYqMCYPn30DzA5X1yyV6nUvOn7dJG7d+KrM0BNAkB8R6aaJvb19ZZnCvQ6dPfrTVPDb72s/4WKJeWSOslKRQI=
X-Received: by 2002:a81:a8c3:0:b0:5ef:463c:8eea with SMTP id
 f186-20020a81a8c3000000b005ef463c8eeamr4311058ywh.20.1707303391239; Wed, 07
 Feb 2024 02:56:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204165852.166157-1-wahrenst@gmx.net>
In-Reply-To: <20240204165852.166157-1-wahrenst@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:56:44 +0100
Message-ID: <CACRpkda=VsgiH0-iJVLry4hy6kLeJ_20mzMs8OrqR6Fr8eAp-g@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] pinctrl: bcm2835: Implement pin_conf_get
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 5:59=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wro=
te:

> For years, the Raspberry Pi users relied on userspace programs to read
> the pin configuration. In the meantime, it has become apparent that this
> approach has reached its limits for various reasons.
>
> This patch series now attempts to improve the debugging possibilities on
> the kernel side in order to reduce the dependency on these userspace
> programs.
>
> Stefan Wahren (2):
>   pinctrl: bcm2835: Implement bcm2835_pinconf_get
>   pinctrl: bcm2835: Implement bcm2711_pinconf_get

I don't see any problems with this, can I just apply the patches or do you
want to first resend them as non-RFC?

Yours,
Linus Walleij

