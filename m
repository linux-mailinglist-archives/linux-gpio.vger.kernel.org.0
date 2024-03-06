Return-Path: <linux-gpio+bounces-4168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A267873726
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 13:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B12B21F21539
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 12:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0F78289A;
	Wed,  6 Mar 2024 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CC7gJs59"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EEE7F7FA
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709729860; cv=none; b=lzEdzza4OGWwZtceyWiCFCr6S9cu3JZxQFgWkEKhMTfNsfd1d9ud8Xi+cUSbSgn7O8RXJaFlV8ZTxmv7SXUu2ds3qEwmRjdwDAtrTw/VqPkXlZHvO+zeqsWak7Vl5544NfJDMw9cPajo3aQIjfowV0NMjJQ2Y3vOnsbphBBIV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709729860; c=relaxed/simple;
	bh=lKxUp8iQmr2CFCgCoU8yw4kxsbGfObo9DobLfsZzj/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmxdHZ3w4HdBkE9GMZdg27cDwnrFlKs0b85/1a1KpIILRDVkgUYA8TXEr6VkI4DZb1eGnAFvuAsEnla7lAfht1V6d+jwja0y8bJMzv0Rp3Y6O+s0THyhImJO/8N0wjtiPLYDcplaE2n2d+SoqfIpUImLpPKeWWofgJmCyJXJxHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CC7gJs59; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-609a773ec44so42104957b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 04:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709729858; x=1710334658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLhDkVixqYfE4pnSjrgLdoF6qlywqVJESJHWtblUgRI=;
        b=CC7gJs59d9qNE80+9bDVowdYR9pvc+AgMyQg5M5/hXaOACJaGYAfPw7OXd6Zi1HJf5
         Yqp45GHJevIt5eg6qFc3nxPDrX+kLDQne6bVHSOuHD1q3OdMavRUoE6gSrrqz6bdAxbk
         xtYBVrLSSnE05kDMsOKxOFL81hJk+ptiH3EXkuuZ+xtXcbL0d7lnMJrJNFXC8CtDKKuY
         W4r/auWkB5gkKzlijCHJbo5440YdmkUuX2WLyzlAO2KQjZded+zBBlcBQStyfzJ+8SNr
         Me6TbutCTGQ5tB17SaJs+KBQ44fXpJwOv0eCYzYKObQSPtUry7yzh/e5AjWNFCcrfzQJ
         GsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709729858; x=1710334658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLhDkVixqYfE4pnSjrgLdoF6qlywqVJESJHWtblUgRI=;
        b=Zkqeoe5140YfbnPUb7i83ssFX9A4XIw6EG7AQR+vCL2dfFxu9K191AO83NTB4eFEMQ
         XNIu26yK8SptLOLiXMZ4CX3cxqhzJakIb7dIsewzTUZuLblOSIJ10hZyOKIMxlrd2Pdr
         E69gdA4i0QG45nCEqTxwcCLJJhjx23V6H04p9tO/SC7R7J9dCGaz7PwDqlrX/zxGnpql
         mCuNY+QZtsmCa20mGJCpmZ7uWEBySpcXIWQlw0l/tDqArSnPJsqDlZmQGuCJ8Zk2VGNC
         Pis4zyqaDumuwROnWX+xaa2jfTSFvOemwIPxL+ia/1R97iJd7uOwCGj23ecvBeOU9mUK
         rkEw==
X-Forwarded-Encrypted: i=1; AJvYcCVtJ6V2RyubFco7C5IwG+OlxAIwxYq1Q8Oc5rPlDc02+KjEkldehlk1AyIkL+wnEpihDY+chHZ7fBeP8jqo3W3WRTpAoAPAEeBQnQ==
X-Gm-Message-State: AOJu0YyQYH5rTw9OTfwnkUEeY3YSuQ7nP0iz7gpdiW+yNtMDAPaL6Vrs
	/iiIQ/pQYGMhBM2wNkKit07/6TPCAZq7wGRct7CU5vTsjh9oa0s4Af/ZPIxmZttJIWstxuWoVd7
	L0M9ZEdFBbA2+IbZMwht3rcgBuJR7RmfAWGxYmA==
X-Google-Smtp-Source: AGHT+IFUnfbvik6I2UyytH96nMWqjpkCh4zYeN8ZyrqghEG+E8HsZS3SNVQjZERuyCBIvPiv8XNjZ0khjc5IWnqOCLk=
X-Received: by 2002:a05:690c:fc3:b0:5ff:a9bc:b7f with SMTP id
 dg3-20020a05690c0fc300b005ffa9bc0b7fmr17442872ywb.21.1709729858098; Wed, 06
 Mar 2024 04:57:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303140137.157522-1-wahrenst@gmx.net> <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
 <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
 <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
 <CACRpkdZ-6neizSv-F5jEJPZ-a_emoCbxM9AFqfzYSHTZFGnM1g@mail.gmail.com> <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com>
In-Reply-To: <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Mar 2024 13:57:27 +0100
Message-ID: <CACRpkdbni-oN5mNT9Z3GMueWaCjxDcmvjGHYet3YQubDowg58Q@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: wens@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 9:55=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:

> For the MediaTek device trees, the only two occurrences of "output-enable=
"
> actually describe conflicting information:
>
>     pins-rts {
>             pinmux =3D <PINMUX_GPIO47__FUNC_URTS1>;
>             output-enable;
>     };
>
> The above asks for the UART function on this pin, but based on existing
> driver definitions, switches the function to GPIO output because of the
> "output-enable" property. Hence the confusion.

This is actually also driver-dependent.

It is only conflicting if the pin controller has .strict set in struct
pinmux_ops,
because many SoCs are perfectly capable of using a pin as a function
such as UART RTS and GPIO at *the same time*.

Details on strict mode can be found in Documentation/driver-api/pin-control=
.rst

I don't know which Mediatek this is but:
$ git grep strict drivers/pinctrl/mediatek/
drivers/pinctrl/mediatek/pinctrl-moore.c:       .strict =3D true,

Only the Moore family is strict, and I think BCM2835 is not.

Yours,
Linus Walleij

