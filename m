Return-Path: <linux-gpio+bounces-22084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9995AE6F42
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC581BC5BF8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C252E763C;
	Tue, 24 Jun 2025 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VASYgr/m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182462D5437
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792300; cv=none; b=O949CDoWCIagI1MQ8ctdCi8pQ6l2Jw5clM37+WRBzSx7PbvGRxIrbwRqsj3QNg2qaiUSkA+e4yAo2W28Fjuv27NY9npzUHssNScaACF1JK2+O/w/xoH5w8ICfoXk8RmA+m5038+vOUWs+V7D/SKi2U5PCw9xYb9EsMUaihvS/h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792300; c=relaxed/simple;
	bh=jU7ham2ZpaXnAos1mikQBqGdMASmlPh7XObjrBZWKb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dw23usrJ2TXyF3tZBa9wnxY1Mwr2prBOrv3zCh8AQonZJSuFQfwlHJNZ2wwmHM2b7ofZ0SdYh1CPYby1A+ZPEav8N2lChehekMjoO1NO6P5db0LKAQvhYtvP24xWUU+5OC4knrSS/BfeZeZNr0KTrLi+PMtcLwRdCU1FEgvai0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VASYgr/m; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32add56e9ddso47538251fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792296; x=1751397096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU7ham2ZpaXnAos1mikQBqGdMASmlPh7XObjrBZWKb0=;
        b=VASYgr/m1Yw2WFdku9uZxMKoy2p5N97xe4QSKPh1yjLJtFNjwJAIXaICqYJRGlo3QM
         ESxjsbxKDl8J70G3dZLu0VuB+L5iaLCzhZnEOajt0HklUI3ZIubXtJNdLE7Ay9aULzBD
         UuqC5ZmoONs5VzObQF/Hl+YvIaS+iXjwMAV0SozfdylXkpbcjn1To0ZkoUhAwOqwPMmA
         av4aSy1eS952MCP9PQhqdafPitfCEEUktJ6rclPGlJzPZvtDAaC8r4RnARcsCP9+CPu7
         MLnBy4az9y5od8D00BCGPDlUoQzSxCfZPi5MKMTcfnjMMWfgQVazLZyXDewYv/7n94u8
         xUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792296; x=1751397096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU7ham2ZpaXnAos1mikQBqGdMASmlPh7XObjrBZWKb0=;
        b=rGNaKpcgBIZX6U3wUnhiLtpLyyKZbJrx7qACz6BwS6G7mqXj9DQHxjRCBY54pT1Oq8
         ZDbtyHOxt0E4HwDOgYHu4AUg6ep1PqF5/Dvb38KSqv8gf5hRTEqgOjePgzVLmccGTvxX
         Lf7A9b9Weaa8aFuWx4oVqIPDjnJ8+5b9bgHgNzYsK4AwKj4EdYOne8ubmEvO5CLCoir2
         WEpjULjRKE4+jR99v12svRVKlZqYVKWzphOiZlAHcOFn60kb0pPZvSK/Ud1PxqYb3yRz
         q9TQCH+a1wre4DlslXs+VQOK5+p6dBjaoKxXVRtBr+vJuyoBuLc5g/X/srt4JTMdqWDr
         CT9Q==
X-Gm-Message-State: AOJu0YzQww+bd4kWdxBnNt+LmXhpkU2H86b44eJ5s/ydQ9nHiyLi4xD3
	miQgil0VOAbCHpJCU694ukoluNV/rY1fRW0XBpHhut8KmzAT8391zCkREenQUK1/OF7442p/jhN
	eQ9tVd2s6HWkfmzr3CgqAMCHSs8/pbRQ3SfhBvAAXeg==
X-Gm-Gg: ASbGnculf1xAz30bgU/eAp0KfcXqDU3W7atR5vZso+6qbe8n1awvYwvJKIE1kWRMsqj
	dzmXBFimMqq4hfSYVC8p0yn379NnAewtA0B2H8PnkJfUTSTOn4kRd156Zc38iMov+kZOLVocWVP
	GgGNI65oCh0DQjiWfJSi7YdPW3LTz2q6bXxUjXDJAVNo4=
X-Google-Smtp-Source: AGHT+IEXDpnYChKc3UImdSr+zJ8YwEKjpbFFrt5NAlDdblQlouaa/RGw1DjssZH/qYmdil/9nF6I3aEfuSDSDliuODQ=
X-Received: by 2002:a05:651c:50d:b0:32b:35e6:bbe8 with SMTP id
 38308e7fff4ca-32b98f16b81mr55858771fa.21.1750792296056; Tue, 24 Jun 2025
 12:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619173537.64298-1-brgl@bgdev.pl>
In-Reply-To: <20250619173537.64298-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:11:25 +0200
X-Gm-Features: AX0GCFsc_c4phLtpzdxGlCxh0REYBtAY2fuDOH_rU0XESF2pp_pRuIm0OUyOk0U
Message-ID: <CACRpkdYY0-W3+XLKt_h=8nBqrdOD3vA8D9coTNY5sL96A5UjEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: fix mutex unlock in error path
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 7:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We must unlock the mutex *after* the `out` label or we'd trigger a
> deadlock in error path.
>
> Fixes: dffe286e2428 ("pinctrl: aw9523: use new GPIO line value setter cal=
lbacks")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202506191952.A03cvn22-lkp@intel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij

