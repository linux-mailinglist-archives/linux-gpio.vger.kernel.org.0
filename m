Return-Path: <linux-gpio+bounces-6258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3208C071E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A79F28271E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D63132C17;
	Wed,  8 May 2024 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lSauip+Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747B823B8
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205941; cv=none; b=FombMLyRPtCfjJAXS40jWDUtq0ICtCaqs/cNbfH0mtfQH3Lg8qFXL/n1ewIAAsgT4LAfdgnpF2vWaPzhDfYYByDWsM4U5lsmZhOR7zLe8Td4vd2uo05EgyD4z7lWpzZ8FAGpoRUdptlRKP6dtTlImpAgiiuApM/94QqT4ryk7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205941; c=relaxed/simple;
	bh=xXJXTX+AXl31YNYKpCfQaCakia+fRsDhNq9CD9DPan0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7n1yf6uLmZBDTMUfkWWSMHnZmOWI316fQ13XiKIBqCpVlyFSr/rXs7TKjSBNfgJjX30Lpk3UaXXXoCucGBmG3/0N8aOeRzziYoqnh7gtFe6G24siPW7wwzPT6RYImGkx/s4wxZEiINW5IepdYAt2sRJ4eEtA1srE91S/Lj5fDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lSauip+Q; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de45dba15feso293503276.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205939; x=1715810739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXJXTX+AXl31YNYKpCfQaCakia+fRsDhNq9CD9DPan0=;
        b=lSauip+QEVMvJYgAjrNL7aHJDKYdz7h7x/0PNu0Wwi4oAMaSgvBj2TjIblgwtBO7+S
         6K+Z4xnIod/vIjM+nS1NrwEssn2rKJEnBJqI1LL78EfKeMZBQWchxCPC6GnGfVR3uoZ9
         2rfDVGeVaGtkqhc7zmZwo1cgw3iDTw8pTmBlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205939; x=1715810739;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXJXTX+AXl31YNYKpCfQaCakia+fRsDhNq9CD9DPan0=;
        b=ozLzh3XafXW0C0tcsvZmZWjkq0Ub12CdIksDroMUuq8BHg9RCFr4tPyL8p0rvBVYz6
         vErwE/RSAAOhg022qjJoFLsONinv4opnfXyIbBum0yr7SSBhjFM4Yfvnw79NFSrcfRXz
         lY4Ls4IOFztwC6YO8vXsiWfG5rOymBjNjXR6thrIti1RzHPGnTmkWYQXYGul0hRwxCKK
         NYP+sLYWDVLQtuiKWOWmgpvmI7uCQAuhuwvOT2KYquAiUaMO9F1x4vWiAnYrh2FGKgLx
         5rOdnPD0EVbUECFvi7haLH8eP7lfXq1ii6vChIHAoBSKdDKG5+1+LA82MvtOgQFYL7bv
         t9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU5mB6pcxDnt+sliE1Fh+YIR6v3qC/TNHZzceyxZtPUdQqxJUQPa3De0S4GWb6P5vHBy41UesGETlNFgRljb18OdiSN6G8W0q4YvA==
X-Gm-Message-State: AOJu0YwdClAUgmGISM50DckFUqDmuduKpUrp+0n8NaE1w11nhWFYbe8Z
	vpSWDUwIEr2VWc81qw5xRKMloPH6AHQiMFWJZnI/uOnsKw3Bly6qGPjpCIMMmm/PI7vmKvyJpQe
	C/QBUCPdLezB+aYMsawyLY9XxS6XAUB0K+iCy
X-Google-Smtp-Source: AGHT+IFOzlvTP54gRhOxc+z5MQ8WG/MPd7EKLY+wd4h6GfQB/rKrNwQ8ChHVKkeDh1oaX6WWyOIU2soq0jHzKU8OGwY=
X-Received: by 2002:a25:ac9a:0:b0:de6:d0a:ee3d with SMTP id
 3f1490d57ef6-debb9db5a4amr4379276276.30.1715205939465; Wed, 08 May 2024
 15:05:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 15:05:38 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-8-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-8-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 15:05:38 -0700
Message-ID: <CAE-0n51CUjWD30BbyPDqspg3-ZX3QaguBEtR9tBztGxCxSa4eg@mail.gmail.com>
Subject: Re: [PATCH 07/13] mfd: pm8008: drop unused driver data
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

Quoting Johan Hovold (2024-05-06 08:08:24)
> The i2c client driver data pointer has never been used so drop the
> unnecessary assignment.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

