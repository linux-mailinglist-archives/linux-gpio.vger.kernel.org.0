Return-Path: <linux-gpio+bounces-6256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7C8C0711
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B72528238C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29319133284;
	Wed,  8 May 2024 22:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="niFLhDAd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88466132C1C
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205834; cv=none; b=KLRENlMZokI45VVB9zFwp+WUIeeCcR2tSRfyYM6wDzRuoYVudDtFJ25F9QigXs4nxN4N7arEE4yZ+TL3rxQ/9uWaeweuFFVZ1wKXsB5fpz1t4DeEjpPhC5izCHDe1q87zbUUWvM3AGO6FZk6IjVEWqM4LiGBnJqCQ6dnC3FJffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205834; c=relaxed/simple;
	bh=96vmw9sZP7htVh/QPL6h0Ai8HcoMhL+MI+Xk9QD2OX0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBaII55JXOmleI/YxHZh2YLlaae694bWakrOWN3plvp00yNP6EdVHm9ubml1P3MCOPn7sjyIIcqD9nXvQhVnbC5HdzuqLGx1kcfSG7S+l2+aO0U+gaTOQY2Fla/Eo7lSn4M3vW09BcYvwSLViGKBuHzesylAbKuPDAMCVkkuM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=niFLhDAd; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de5ea7edb90so298400276.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205832; x=1715810632; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96vmw9sZP7htVh/QPL6h0Ai8HcoMhL+MI+Xk9QD2OX0=;
        b=niFLhDAdEWOSfzZEXWpD0nv7vClze8dbf+j4xkB2NgV8q/xCR82TxKPi/b6IcMPbeG
         z0QBMVeIsU8ss/lH/GXDX3YT+wA8LvXuN5/iDAoZR+dS2tvUHx53thGkkWZFpGkR6tLM
         NCwOSbz8wE2SbhGKB6+fKCn2hHAo2i+yVxVlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205832; x=1715810632;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96vmw9sZP7htVh/QPL6h0Ai8HcoMhL+MI+Xk9QD2OX0=;
        b=hhtyyG8CQDIQRUP6LNdH+7QpQacMlX/bFMk54uAp6Wj+Kn3LpVvzsP+KSbkh178YIo
         tBJSodaFsGkiuHqwk8FY+qiOUWvXhjDigI1eHiDmMlvkIHwZvI5j/cGVTF2oiXV6TVoC
         SUa64vPQLnzPDVo3/BXG3VvY3Zp/5xV8+qP2t5Dxy2vJxnUPe2TyAVptu6yYJIhqjGLN
         LArTMVaiXtWQxgPIh/BhYwSsymnVRbElic67ytiTz54oul8dqJLxeZibBECR0f7CFsqo
         pYNk9uwmiVecGenKB+af/1AsWtMGOH9m0eY3XGvY532Xqzy8cUELadlNPIbBHYXR0dUg
         uMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMmHSPu4SxJM1Rfchi+bl7phHlyjMRNyady7NheIvdxggB0na++A5Ri3ifaAGg1OW+Aoyn5BeXiB7a/NWN89QWmH2ADAxBJjAH/w==
X-Gm-Message-State: AOJu0YyYvE5Es/fWYgxay6Ipw4tyVxvYmgO2YtkqQE8mNXYHCnRXBzXT
	dVld32FOUDwEhBgb+PP8c0iZ8b7OD9HfwpXkn9WpAmtvMOLy035eP27LLN+Kwq+xsia6OyMwSME
	veSLKOW51IhA2eVqFK6Smn67xXnYYMXlPboc+
X-Google-Smtp-Source: AGHT+IGV+P68fPaEtQm2PeJISJUIhS+PtZ4zxOJL+5m8uOShfZjtjoYC4aTyUsAJcLofHgE4zkZtzRKSS6k1GmygOa8=
X-Received: by 2002:a25:c549:0:b0:de3:ecc8:a0be with SMTP id
 3f1490d57ef6-debb9d8ce90mr4661286276.20.1715205832681; Wed, 08 May 2024
 15:03:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 15:03:51 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-6-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-6-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 15:03:51 -0700
Message-ID: <CAE-0n53sfgZhmFTE=a0HEp4n=DrfsTPhK865yWYAdji7tsi7wg@mail.gmail.com>
Subject: Re: [PATCH 05/13] mfd: pm8008: use lower case hex notation
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:22)
> Use lower case hex notation for consistency.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

