Return-Path: <linux-gpio+bounces-18899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEAAA8AB2A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 00:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB5F95803A1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 22:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D99274FED;
	Tue, 15 Apr 2025 22:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJ5SQiNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD143274FE7
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 22:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755258; cv=none; b=QPajsZ3Dh5hmx3a/vRVwLtosfkphq0RusLLBK3dK86yjN7kdBkNTU9wtH0TxgtQLUPVXl0YrmI9v75ODUSb265orTgEzgSwepL3rjFMTHb2kSohfDubb8BG7P4iZ7WjJKooKd5ytDMNLnFwcCfM/N/nrFRPeY8P4xS/GtSjQZPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755258; c=relaxed/simple;
	bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiRxbOjNph7d2I6SMFUiaLohNDoqdhvGmX9oBz3WjNz/k29w8HWO7/M9hKLxYle6f/tZjgiGE6rwZR9WoY05nP31TPc791907Y/in42AOcacMDgWKzGwKusNQLXCztr1b7K2mthKj/0CO1o3mT2SAAgBYnfymytec/kJzsof7VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJ5SQiNz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549967c72bcso7567125e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755255; x=1745360055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
        b=CJ5SQiNzBkWr7VDwLF4XmMgwi9uA/nJkucF0dbjRoZMF4KOtqHsmlzB8VguusGNL1+
         X26bp2oeqra77NcXY8c3QhJNXCkbRWNKpOedNTWTWd2SBmKNxw10NfN1Vzc3QBjuN7Np
         5jGEK9y34WY4aPivStMFaZUMFBTdvjZ1DZZjPiKI00p3AWIN4J8VSL3uN2DEvLQ2px7K
         X3R5YxCymYV01n0xQRtxL2noZ22C59n4By6MeJ/3FYmDDtJ8JtaW0sqSL0hQvUvAv00l
         6KvJks6pKQ/LLTl46xfAt0c6Iz/xg8uarK5P95NJhBrvaSdGZKC+JoPoXbBesMf4a8f3
         d90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755255; x=1745360055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
        b=TlFF4eV9B32SlUaNezhpHLsBEdvWkxTlXYMzqSU43i5NltOE1LNlYQ60iK/Wv1SXEV
         2Va6hCr7B7LahFytVArNHb65isoWvWE57BL+LvXrzVkirC38E+ZFo3x7UkyOZ/SjfXgJ
         PbgQ1np3Kja7TCXAU3IWunJHMOEZBh1J1wFgYDR/93ryUhfu7ZaXX744BUBSEe/1Gnvw
         Xdsk7PZvvtgDgg650r7xDsIqCbWXELvmCpvsFusS5+TDww3QOra1mV6NPW2ZWhf8k2Tx
         ipYk5CdCIZY60FYZDQCE/waONezwCIjISdR1Yu58VNvPnCQBDyIL5WmYAZZ9h7hGqkQj
         eUng==
X-Forwarded-Encrypted: i=1; AJvYcCV6TrwT+ySJao6pPrELGACQSziO/+ZJ1NhCwPIwm+UcLulFIh/D8cgx4oskl92AfYlOPCjcUqTkOjSi@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/ubRXiJnJmYLG9prVXOa7pIP65EIyKQSEBLb8wHJQhCNrnoo
	QK1gYtKkD+KB1VSOYE939bJMkHabHkHs6QbN+OMUFUirh4VvBV9Y6RkXJw2IL2zEirYCVRwsMdy
	jFCtRUZ5f/+BzJRen2wBu7xwOy8ABfOkzaBZzMw==
X-Gm-Gg: ASbGnctgB3rfHE9U/c+TBHNJJQQG/XEspypECHYVz+0sP53DUct1IZQAwUOMi1crFwL
	d7ej4cTe7BalPedJOKwJELScuJBpyI7aTcFfqKw6ffzi91xT+fiWRZ2ywlMNXQ03jVu/t6w1dqu
	MVumwbWs0T4AbPVTEmYdnyUA==
X-Google-Smtp-Source: AGHT+IGBF5IrLeLXzWpPgufuoRl7LZtgwhRspRq/qCcnRj1V10eVXuTbFOcobeERvTB8phFE0DlLxPU9lGc7Ecpbux0=
X-Received: by 2002:a05:651c:19aa:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-3107c35b9e8mr2073651fa.28.1744755254887; Tue, 15 Apr 2025
 15:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:14:03 +0200
X-Gm-Features: ATxdqUFlFg0lGWI6NSoTSJm8tZcs-_N--2yxo9MXcXcFS8VRrICSZBjqn1olmIw
Message-ID: <CACRpkdZyqvQi8NyUGOhrN97g=jOm5FySeTnL1aZ+TZtX88o+ug@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: qcom: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 11:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. Convert all
> Qualcomm pinctrl drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

