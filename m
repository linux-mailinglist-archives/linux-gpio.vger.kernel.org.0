Return-Path: <linux-gpio+bounces-27012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965BBD27EE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FEF918958B6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA2D2FF147;
	Mon, 13 Oct 2025 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8PdD2FC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EA2E2EF3
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350558; cv=none; b=oTpm/Hv7u/WkJ2eRSzKSu1CCZTSqVn7RIGGNf20MCkrbhdLbZcItURry818y3/hJFwA8AkdkhaFtfq2QF/IFy2ZBTaV4m4MLQ7bNjH3ocHJzKxzMnhEkR+wf4jiG+lUaLXgmd6UkpwcxIg36vJfbkcBUXlyXfnnWFYNQXnJUTGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350558; c=relaxed/simple;
	bh=QJNIF6k+iOR/IePJA8Fl6Y+gEa56kj3NzVJwCbWlVSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ejo2FYejU2Uns3vjwamyhuNbqr8nk2zwS6tO/pWh1SrNRVJG8x+aXAZIXzJRcievqXP8K6861+4D/RPBg0Gq22uLqgxKNd9erDIPsZzpGj51PNJkoXL5SPe+X5Ul44fIbVwzsCI+Kx1EmEtIyhVs03MDUosWTSEIUzifGndgfnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8PdD2FC; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3737d0920e6so43295971fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350553; x=1760955353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJNIF6k+iOR/IePJA8Fl6Y+gEa56kj3NzVJwCbWlVSY=;
        b=K8PdD2FCAAXeFcaGt4C3KpG+JBrYF3fm37PweQFc9Si/k+JpqxgarHua227b67nepB
         GPHDAmcx6z9d83b64iY7LnC/If0QP+oTGVnaELk8enkpOt7gY7kEtf4hPlY1R/BpHYSH
         tag8W0HHVOFgLr94orqk+P6ByFAYUbwmxCuT2LnA6AhaiQtWngII3GSydlX+3ODrwAMH
         2S5l7cwnTKBalaVc13EoWZ5ejBhJav7Nua9WpEmVhhzKK45MvBeZuz/ed/y1W8tNvgpm
         jaL5keoNRB+23xKPR0HYh+N+4caES5Efyi7cDI8+lrbKHQzJ1VBHXk/VuJc8blaAlN3I
         SMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350553; x=1760955353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJNIF6k+iOR/IePJA8Fl6Y+gEa56kj3NzVJwCbWlVSY=;
        b=C/dSANE0aQVvq+AFPeDZgxlxYWv2RoCvXbJAVwUgswQkHZjZJUBurYrXRkuKyPOxR4
         KlabaL6rGKTRPd10OsD/FdG+tfJZUiYr48W6+5ZxofqOwuZlM/1v3iNXm7SBV3vlFGOa
         +zoHrH7dR8TjBFPd4wR8iDe5pKfFRBspnpa6VGVnf8018gE/J5TP7Z6Y4/eWIUY35GsQ
         YYSQR6TnUNahutEAM6O1ZiO+z7y3+YkOmOX+U1B6jfauAbGs4/Upe5i3wd5bc/NREgNb
         ldO/OhwOUoOsOB0sak0dNJuaA74zV8x5nja6fwHMvKCKgtC4zdabJxrCij0+fHOQvNnB
         m3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUXMsdZSfmJICURroXlpkxgr1s2n7erMGJ9BLR8y9xCeE9UL0ZuGPPkoNQD8aSIwJgoCsjyAVuwMx71@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlwb58S4HzVAt8w4nj7Ugcti9FjgOAztFOnRP0GPQG2ZilmTzX
	aUhei55LlCAvhWdddFnUNIBZuOb86fgEy2/p8Z16Tux503nWjixWbvcP4eDvWw0+6Haz6Ms9idH
	wkqngQiEwih2pDBpzSOHse+7AoJHS+iSFpGdJFAnyvg==
X-Gm-Gg: ASbGncsmD78Dngz42N38Rho86D5n8Wfya9jmQJ/htgwMd1xYFTEVKEIp1VUCJzuNQC+
	uaVRx2buRgcBKHUuGWzYWiYAKjG3nZfBgPIAchRwQC0UNNOaYN2eGt6PcDFE1AQNqnD7wcofu9D
	sTcZHgVZigEK5IPJjdlmzZIYkb+2XFMz5VxgKj1i4ZemTKtHLGxnTA1Z8xEkvlcgj9FkwQTK0az
	n8C7kLwlTWpwUZAlL11qK1ZpBD8ksYHq/7yLVi6
X-Google-Smtp-Source: AGHT+IEN02w81G1S5VW/kSneQdG1TOPLVZyWHNaF9kPMKLYqgtaUGWqWUaN5LOGIpSVHxD2qCpvgfmV4mdasQo7MrZA=
X-Received: by 2002:a2e:a911:0:b0:36a:a87c:d139 with SMTP id
 38308e7fff4ca-37609efc71fmr50058061fa.42.1760350553454; Mon, 13 Oct 2025
 03:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:15:42 +0200
X-Gm-Features: AS18NWB-Rj8yGZ3DOyv1-w7k1_8_Txh8yemaMK031WnuKWeVF8Y3K9yfpPZYDd0
Message-ID: <CACRpkdY3Hz1QgK9jDVE6LT5DeNKbvz+-aa3Q9=njkESHmyeksw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: glymur: Fix gpio pin functions and
 clean-up match table
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 2:17=E2=80=AFPM Abel Vesa <abel.vesa@linaro.org> wr=
ote:

> This glymur pinctrl driver is not currently being used by any platforms
> upstream, but once the entire platform support will be merged, there
> will be some issues with the gpios as they will be wrongly requested by
> the pin muxing config in DT, if the gpio pin function is not marked via
> the generic macro as GPIO category function. Fix this issue now by
> marking the gpio function properly.
>
> While at it, drop the useless compatible specific match data from the
> table.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Patches applied for next since they are not regressions.

Yours,
Linus Walleij

