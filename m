Return-Path: <linux-gpio+bounces-6119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B018BC765
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 08:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D396E1C20B7A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 06:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CAF495CB;
	Mon,  6 May 2024 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bs5Fdty6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31447F4A
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 06:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714976082; cv=none; b=EFoRN8mMMlU6qn1Cuf7Yf+OXXJYPUgJmib44nIt6fnNKsJQIZk0/FysXEWFaStCkdg6ZwEmbrqCHUywE7alKPS1UO2e572xkTwTNBMWApCbji1D5lW0UnHGREkFm7f3j2eclo5X9vA0pyHb6jRzKA8FeZ8NhmhaMqymAGUIkWuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714976082; c=relaxed/simple;
	bh=t+8/GL8wb1rWgzXW9qIpa7h9Va3fB5UuA6v9qi8UFBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIUNWRDDbsCYbcfRRC53UVKAQ59Z49UhSw94N+A4WtRrS29l5PGmdbQUg3xulUYpoIoL/Y/4NajJmlnheZR7F5FtCVMU4AuNd4Wwn9zZ6KTSVwnxSBd1sfjBLAjG18kYnzEoSV1jKALGIzQYjSjm7zRftyKHMd+IQu2kXhlX7dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bs5Fdty6; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de8b683f76cso2965877276.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 May 2024 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714976080; x=1715580880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+8/GL8wb1rWgzXW9qIpa7h9Va3fB5UuA6v9qi8UFBg=;
        b=Bs5Fdty6WIX39FbmKhtz5T1VDbQBmnD3P5kPmYT7Rm2loEEPQcQckA7rPHbDwTO30/
         YhpZnRlinG7TFctIjxBq5FtUB9WCgC0OKlBuAs9jBHcAXtdou2iwGk3cxMHIl0UWkMuz
         BiTTmaCYqkZ7KtmmqP9rV5frSHUhkVmCOUcg47FiWsjp0Nc7+mXVjSwQnGNmXYP7GI42
         PPybgT87k2o+nT4eLinYo+am69QUGRenEiMZMY6aQN3NytWEhch2WwwPHd6UzBQaDQAr
         UVapqXlOWtDBBgjrkIjr3z/RpPvW8xXCTHnSsWVgvLoD9ghjLA1ee+IAQEZa0GkCwTa3
         ryVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714976080; x=1715580880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+8/GL8wb1rWgzXW9qIpa7h9Va3fB5UuA6v9qi8UFBg=;
        b=lSO55mucHwjfdcz6XS44LsrfeDzLSKLGcB5CVkrFzUdMyxsEIIb2i3EXHYySquv/c4
         1JcXtBagDOz/AGmDq6SXcYBx8HaJBxTvlYR8Y8QjOA7+9fuZDmoIC41GF8LFZValuvUR
         +S6GyabKVMUxEW/bBZxZQkSuM/XhO4Qx/JLMp6/hS3uLmnyObNAn3Ox2gPP4RcOQKTZN
         W8P5Dl/vawSACML0l+Xng4Umv5PX4hIOibX79Bt1ZfmwQ93IlhC9Y2S2xgse82N4wtVi
         4Sybq6l1aNyf0GySZKTLBHg2AqCTqR4IUqTw/ivgQbEJ+VcAkttdFW3EAG0OVsmVslMY
         u58g==
X-Forwarded-Encrypted: i=1; AJvYcCUfiGZFdoFp1rjtwLfyRqAp8n25aUnyZFJMaj5yZgx0oZcUISHXdjZYuZ2iQTMiLtJu94esJ2yWfF2FSB1zpBZH0FQ6Xvve0miY0g==
X-Gm-Message-State: AOJu0YzySUkL2OrnJantTW3YP6kRY6mHZXxydmcHm959QpUj+gy8t989
	SR0GI6RMRWTQnQ/TcWOjrsGmt/w8+WtgTFz+ZVEbBXyMDKxnlzi5S/rPw7XL0zf0fxANhN+wyvg
	26uvrRU1DHCXDpXOBn32k+sE/uamDsYTBseaBSA==
X-Google-Smtp-Source: AGHT+IHY3o3+eoNeaHZ7hvXy3E8QfkeyfRkUUL4c/xz+kbSP55La6U+KGoaPxfVwfTSHSqJrA9s7MV01x0dRRL54V5M=
X-Received: by 2002:a25:9011:0:b0:dc7:4265:1e92 with SMTP id
 s17-20020a259011000000b00dc742651e92mr6707119ybl.23.1714976079670; Sun, 05
 May 2024 23:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503062745.11298-1-wahrenst@gmx.net>
In-Reply-To: <20240503062745.11298-1-wahrenst@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:14:28 +0200
Message-ID: <CACRpkdY5pbtCU=hFaQ0MmYqMy5xWCxV6HPcEoRMMNEDL657crQ@mail.gmail.com>
Subject: Re: [PATCH V2] pinctrl: bcm2835: Make pin freeing behavior configurable
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Phil Elwell <phil@raspberrypi.com>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 8:28=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wro=
te:

> Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
> So in case it was configured as GPIO_OUT before the configured output
> level also get lost. As long as GPIO sysfs was used this wasn't
> actually a problem because the pins and their possible output level
> were kept by sysfs.
>
> Since more and more Raspberry Pi users start using libgpiod they are
> confused about this behavior. So make the pin freeing behavior of
> GPIO_OUT configurable via module parameter. In case
> pinctrl-bcm2835.persist_gpio_outputs is set to 1, the output level is
> kept.
>
> This patch based on the downstream work of Phil Elwell.
>
> Link: https://github.com/raspberrypi/linux/pull/6117
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Patch applied!

Yours,
Linus Walleij

