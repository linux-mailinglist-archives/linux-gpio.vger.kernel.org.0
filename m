Return-Path: <linux-gpio+bounces-6985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B08D53E8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 22:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730E828328F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 20:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2F46A8D2;
	Thu, 30 May 2024 20:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqRM5LkS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8725634
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717101410; cv=none; b=WERM4yY1eXsMwXYNrEV83vymtqbnAypNh7jQStwyEVItRQ2sb/t/a+WYSmgDj5OFL782EUN2w/2c/5guQQW7wRWRzq0hs7jaYkx42GRbIyFrrpqPd/DMgZc4Zdu3Hxua50NTK8m5EpjxQVMX9hyBtvRJ3DtZAiyE7uT4kEaopCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717101410; c=relaxed/simple;
	bh=iJwEJherlKlOV6qTkyS2BYX8gB3rWYKja6wTdoW8HnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKBZwiRf3SpL9Op/qzvZL2x5PD7VnC8zFFD5LMTWYqgaihmGzxIV/v3ZVBqsHXnHd6JHX4/XjB1gRPsxkiACMhkXme52KkaHgSNM74NKr2v5RU6YbG3zkcGjicjLFgZrmcsoQJZRw/Aa5hcSAuBCK4ke5Tcx3HWFavN2qMQtenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqRM5LkS; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfa6e0add60so403602276.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 13:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717101407; x=1717706207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJwEJherlKlOV6qTkyS2BYX8gB3rWYKja6wTdoW8HnQ=;
        b=ZqRM5LkSADwhH+3ogSw6FzOyQfqFmjhIgb44vEwTX8dqOyPkwH9ZiT4RjQvNATlEn+
         +UbjMXK8ZThyxSuJIEwZyxFUlMDPM99oFUdGrhKVDm6ds7CL3GBMQSyVdKPDUx9WSHGM
         xm4h+nP1E9K/LWKxrUAKYQNcgtxT8ewQXN9ogr5OXMOq0UNZY9ngrCnx//gv1SgbWHDD
         8gSoNQ4ivl5QvHq6B2FP8W7YDNBfPROV2DFrohI00R4aEbxwbcFUFq+dN4fHctWwvOx5
         n8aTIIxTtCSS+yZH7C5lcAmYDzhxDORGcSsfduydfvdLO6tQHRx3zYo4cN/oN3H+cres
         D0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717101407; x=1717706207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJwEJherlKlOV6qTkyS2BYX8gB3rWYKja6wTdoW8HnQ=;
        b=vf0tOJTnKfWR1zT10g0BdxT0PZwnlt0qTSULRZ0VDqancGkvK/kvzWYxN/YIgDv1sh
         qJ/Auq4axjM8Vd5baBo38cmE72PyZR1TlIxpAv2ozJuCp+9eNnbLVicNkfmHdWQeh9Es
         bVszvsBEyES5Ukk/CvLxGmj5JBwPxu/kyFvoEfCQ5Ggdav4a3hClxdp4x9gcn67eJW8j
         hoNKbCG9ZOOFm1f7EUTXX1T7PqcF4k3bxvKDxfRLAdA74FpkX7hDwPOKlSKtnM4mQ57G
         hFlnIci9khcmY0d7x9yh0W52VPz1ulP9Qx/J0iqWWVmIZAyZ2IdWuxlGPvMCACiur3Gu
         fGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOKUmF+FoNdQ2S4G3FkW6zpyQy98OQcL/b3Wy8jGPquJTc7VyJvltpeiGyrjjyYkonalzBa42HO+D5zvmLbiP1kGB+8Uqfi43WEQ==
X-Gm-Message-State: AOJu0Yy8JVZOmOpFoxrzyjT+D57+OVjguvoJSN5eCuaHl2z7GHqPTdsN
	YY/VtUaE0DGd4msGrkfb6gSjVdinnpyQhPcLW0ltsnJ/DnqfV6hp9TxDlsOzjgzYexjKlNq1NO9
	n0s8tDrPouo3X+20N/3qFdgIn5anhN1P/yMnK/Q==
X-Google-Smtp-Source: AGHT+IFyFYEIiP6jhM/fF1lcS4qUV/laMscSSmd6de+DpyxvaYBk9NFI2+ATV+p4QGNWsM3TQN+qTlLODP6Nnv3HFJU=
X-Received: by 2002:a05:6902:1368:b0:df4:8ed0:221a with SMTP id
 3f1490d57ef6-dfa5a7cbcf9mr3468064276.55.1717101407160; Thu, 30 May 2024
 13:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530181737.1261450-1-pbrobinson@gmail.com>
In-Reply-To: <20240530181737.1261450-1-pbrobinson@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 May 2024 22:36:35 +0200
Message-ID: <CACRpkdaVnSHVcAqff7dFT0k0ce5G50y4iCH=e3EBAALtK=-OsQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: Allow building driver for ARCH_BCM2835
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 8:17=E2=80=AFPM Peter Robinson <pbrobinson@gmail.co=
m> wrote:

> The GPIO_BRCMSTB hardware IP is also included in the bcm2712
> SoC so enable the driver to also be built for ARCH_BCM2835.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

