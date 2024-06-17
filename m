Return-Path: <linux-gpio+bounces-7488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB590A8EE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 11:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBD2A1C22B5D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87678190672;
	Mon, 17 Jun 2024 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfiY+/ix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952418F2CE
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614949; cv=none; b=BALJYJMjkk3ye4pB2Zes4lz/x8qaAfm0Hwy6vIUby1qSoPEHLICAPvR94Qa2XH3B6XniwOD1DbThnz9BCvqJblaFGRMR4pmQ6uMMkV5iQclb27MrG26Tm+R4QqOtRA5VfEdirakQvEbaYXCF/bSCH/hmcFQMPTiP+csAT0aG6WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614949; c=relaxed/simple;
	bh=1qnOahOGBH471qmFiN5a9Hm4ejehkHAVCb/42SLIrHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeWC3iZIz6rPEaeMA8on5Iyl9iny/Pd1+Ey/GsT/VWcBr7ylom9bcGPrzEC9JiHpybaDF7k9xXl7ud+qHdJ2wC1bLYPLqHf6P6gAlLs2bZdQg6eFUnWKtIkTiUobsnfxhrKZwgxD+9hG4FWRnLoE4qi37En/5wvFfHUDN3LLiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfiY+/ix; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cc1528c83so9140e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718614946; x=1719219746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZKVXz9zFkYiCdmxjX5crpO8a9wB/5gYIUl8nRld108=;
        b=cfiY+/ixGJ+iQAdvoVwfqYlZJQlI5kQoCced6EYqKJ5ASiVL60wsk4NsuDg0mAF4pn
         OINwZ+nqcpjbl/UMpEOareooi9AwSvXDSCO4dUVYXU5KlTieod7LuSXtUbXdFWgDftjx
         46G1WFCD0g3PgMc2tCCPNlsLJNOqqwnOuiwb1DHX0D2ITV9dTl0onnwe/G8M/QezAHYo
         Kr4EIgDK5BRadyChTYGSk/snTgEm/SwH/6cRtU4WmjAgNbMdxDz6jAKWprXMvzss7cSo
         5sHvdczUdDPyuRHqsnyl8JqGM3Uxmr7NKJSfaFJ9mxWD5xt5Vmj8ueUYwlngtXd/7ZZ7
         JLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718614946; x=1719219746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZKVXz9zFkYiCdmxjX5crpO8a9wB/5gYIUl8nRld108=;
        b=KMaSO9XFues8rTppJxmIes88dyZ+SX+We1dc9Rj6QCoAcPDOzBX+/53ipOL9raQRz3
         IjzFUoReqepELkLnmSkiGE64bVG2BP+67UKujZiE/jWP5I8MI9vT4nXr/IwXxuKU9qVS
         /lel+4LvLAsiEEBfF6lPJjNfV8heA8QkuTfNKUwARAXtnDV+NLy92yckgEydAelNGBMa
         rPS/2ig8bEHmV/VoDGoJebPxGF6ppXTpTkVrrvEJqwcV+tVO9YXQLz8+x5QTJN/XvAFg
         FgEWNNAD9dregUTz0e544skOXEdyR/lM0qxTQWrpyIBnOInf76Uukg6mVU/sHWBtXIcN
         LXdw==
X-Forwarded-Encrypted: i=1; AJvYcCVIwQmE5dxdyaMuAhKtiFfCaaUPsnnjZr3HIZKiWNjJMnYpRLHShi16FIAl+gvtlQsBKBNhz94N+lq6GYCohIyZGc9mGpoeFWSXkA==
X-Gm-Message-State: AOJu0Yy0cwCcBaQlQ8OwuAsFYZDqwmjn66otLT670xjaezdYa7Hcrcxc
	Tmbwcbu21D/iz3DBaoHni3yhvgywjypvTbDq/AUPO3nadxp86RHqbTWBsZhwH2MfvbXdMVZimCF
	znOjfLYsR3ZB0HUKkTOrcY/jR5KH2JPbAnPjkYw==
X-Google-Smtp-Source: AGHT+IEDbmeeJPP/Lzk+VO4Yf74aqIdgheOGoGFca2Xhj3pvQTusqNkXyG4ZYxSQcu+BAqajvjPvlTSvRaLNcm3T7P0=
X-Received: by 2002:a05:6512:4015:b0:52c:b11a:bfb3 with SMTP id
 2adb3069b0e04-52cb11ac093mr4656348e87.57.1718614945752; Mon, 17 Jun 2024
 02:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <840152f9-d3bb-410e-8164-4c5043e1983e@moroto.mountain>
In-Reply-To: <840152f9-d3bb-410e-8164-4c5043e1983e@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 11:02:14 +0200
Message-ID: <CACRpkdakxbw=A+ri56t=-AF1mr6Y711ouFRfPgPj=qrSfRtZ8w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: ma35d1: Fix an IS_ERR() vs NULL check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:43=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The fwnode_iomap() function doesn't return error pointers, it returns
> NULL.  It's the same as of_iomap() in that way.  Update the check
> accordingly.
>
> Fixes: ecc5bf868673 ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied, thanks Dan!

Yours,
Linus Walleij

