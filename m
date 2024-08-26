Return-Path: <linux-gpio+bounces-9157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44995EC50
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E69E41C21127
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE9913CF82;
	Mon, 26 Aug 2024 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8zbRTMK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9106558B6
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662111; cv=none; b=c3HP2qLkqFGB2Eo2THX3KcvCzC6Lt33HEhjpCmyLNoIuEPch9Mxz7b8Q2i4rk9HpSKOHTFxeCqoAUJEUXRYl09xHt83qf/9NlB4eRsWnWxnG5NxWJTxrYV89Pe+lrTz7r2LZX3kMU+0VOmwoEMao1G3OU/kraApdNTx+wgiCNfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662111; c=relaxed/simple;
	bh=2hnjvVAoZ7bwbquiwr7BPEkR48jyp3TjmuaLIQPgQ/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEIw8lM3C6K2eBU6ylS1xpkPEjQu5/Glk64yUraqhT4MTEXtcToCLHAAm7KgZnSLNhhgamsO+7KUGvsSnT6LG8HOH+tiv5FkrT209KZkOBxEjl/ghGpOTqpvJgukkf9tuNirA4ETFZa1o7opwaiO6dqS/V2a2R6+1tkZmzEVauw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8zbRTMK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-533461323cdso4545379e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724662107; x=1725266907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hnjvVAoZ7bwbquiwr7BPEkR48jyp3TjmuaLIQPgQ/o=;
        b=Q8zbRTMKK45g+Q34lEp4ykV3Sa4Y7y/pGePjQ8RYhH8TkY7r+lBUni9BIt1SffNvQL
         CIcTULPIK9PUdqXI6ufkrn7RiQHaiDXVyFPn9AEj/afiTmCG3PIU+X1ueg6mvtqE6M7E
         26pjj5uGgIT+AoLFk/1F4PKdPPOQHoghYXIkS8U2xhvxCBAz00TCkCiI6uLacbBaHBwM
         O2G1JdFy4jm8bplgkEBfHPn4O3qWII5b0Jqa09gVCb06oBgwU359HrG962qPpoQ9QOoL
         3dOZxm2IZT+p0y/cBPpEVAJWELPYWNO4UNU/U4Y7eA7j/9I1F7/u1MA8giVNjZxfD/Mz
         P8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724662107; x=1725266907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hnjvVAoZ7bwbquiwr7BPEkR48jyp3TjmuaLIQPgQ/o=;
        b=sZ75PTlU2FrhDFduMKkr4/99Ajc4P5UY9Rj2781jh54HEUHUXR7ysEn1jc/WXu0U5D
         o6Ixjy8p6nrpuLY2gb3xqrBeNyF3j9ZnIGEk1hwx8Jj8FZ12XZwz4z3P7EAsppYwNL5t
         kmlobYTA9Bp5B274k346UduP9UPwb9jgr+/qCrtdtrGfN2Vz1LsGO1b8RDcgnJjNGQhh
         AlufHQCTMB7uBNiPJNf2tf9I8Ta6MBh6NqWUR/WEzDBQjXuXOHcEp3ynZDQJC0hyZYpX
         sii0dvObOACSOGEAYG6V5XWXtT2O1AXNF838wh5AbwDBQBvH3pj4B8fKWPXh1kQSOwB4
         xy9A==
X-Forwarded-Encrypted: i=1; AJvYcCUbcuHQMkOHkTZO3qYovtMoeiFsgZRjMnJy2HNqnERS0y8JJGxKxViwrUbMtuLtL2MJBddzzveeRsFk@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZ32ugECjDQg/HhkPQRTTpgBLF2YA7ZnLYT7+VYQN9o7s9ViB
	1XtmIaSFtJSASSdicLkr5DEVV7KLZttgVWsZAmSLYZWJZKqF/yzdFkUHYQY8aYdrAYC8uN1/aZg
	fEyRrFShPx02l7/i3Sd8GhiSDw4bPJ0UlkLzhMg==
X-Google-Smtp-Source: AGHT+IFZerPWDOgr4c1WuohxSQ3+JvT1ubVNndAVMth/RrtYH7UChyTMrjQo7sPYZVdcATBDZ05y/rcKJPj98SHVq10=
X-Received: by 2002:a05:6512:3088:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-5343882d1ccmr6349398e87.7.1724662106426; Mon, 26 Aug 2024
 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823105421.50017-1-shenlichuan@vivo.com>
In-Reply-To: <20240823105421.50017-1-shenlichuan@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:48:15 +0200
Message-ID: <CACRpkdb+kfRZE-tJWpxsmYFCzLhnJvCjVtmwrBCAFHbaXVFHXw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: imx-scmi: Use kmemdup_array
 instead of kmemdup for multiple allocation
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, 
	ping.bai@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	opensource.kerenl@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 12:55=E2=80=AFPM Shen Lichuan <shenlichuan@vivo.com=
> wrote:

> Let the kmemdup_array() take care about multiplication
> and possible overflows.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Patch applied.

Yours,
Linus Walleij

