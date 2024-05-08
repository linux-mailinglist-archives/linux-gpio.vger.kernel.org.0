Return-Path: <linux-gpio+bounces-6257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE08C0714
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CD992835B1
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9007C132C3F;
	Wed,  8 May 2024 22:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ffkh6TDt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86CB132803
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205865; cv=none; b=H8VCGC0nKputiWiB/OBuJIx3WXGEjhCThEIf4XTS1c9twq2V6ZQshCON+pVggPjv+1fm0Jyo02Ih6nMu6xMJkQ4stnLIeqt2NSzBWZ/47QfKq89RVUI+jaZy4MI7Y2T3bCme/lXek2MdeAu36KOIxtQnv48XHen4V6a+JNYi+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205865; c=relaxed/simple;
	bh=qhiu1ZoqjVzMKdpVSz+tH1AGO0ixzx1LZClfO6+1N8k=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQ8MmMwrBa+Dzsg/8iu4D47BhLWBXRctVQY32iWAaBsEPPN7NA5wPbDjCffMrigaREfLhHOU5LAJBHXhuHnZo3nzM7osDIv5EcMzfFnkr4qvpBy6GOcqlXmHLrVAQK4rkj1zgLlKt2SYDcvDC8Uk3zsraNIyyGUWZeW+E3XUvt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ffkh6TDt; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de46b113a5dso224982276.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205863; x=1715810663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhiu1ZoqjVzMKdpVSz+tH1AGO0ixzx1LZClfO6+1N8k=;
        b=Ffkh6TDtNJxRiQzhkKqFgYKMDl8LaG1wF37URp2c9pcjhUftVdYOrwUxlosojIdCnW
         kfIm7Yez4o16DZTSjyObrs94dOfdm8gRKZmCR5xgjm97lH7a6fHKjZHQ0QwiPo+buL7+
         KWMOQwUgYEGXUtsMEUg0sxoveOELRlrxrT0Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205863; x=1715810663;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhiu1ZoqjVzMKdpVSz+tH1AGO0ixzx1LZClfO6+1N8k=;
        b=oxwepimXTdzRYQZqwI9k4yEwqwkPuRFKRr+jxrdA2WtL8/+lLnPArZ7BIaAs4ovpzc
         7XNUazovUMSadlRafozqzCKMxtMGrguHezjJayBMdSQxZN6rVdI5zZFoaxdAS4k+NzVC
         oRP2ntOXw2BDmFeI8cFO6IFzku4CmNOTTp9tPiuDuDvQppVN1TJxIf6lvyLwpdIULeQT
         Ff+3tNzdvVN1aBr5EOVQfD5wGQ2s5OwEJqxpFsEPQ46zH0GnbfTU8p+tZ/uPyPcbifm3
         6cjAYsOns77YHFYIRZFJEijMmrfW1sPbdfv5A5Sz/qHe+UsI8YPDuDyRkd1D+7NKj5+W
         ZPTg==
X-Forwarded-Encrypted: i=1; AJvYcCVRMhuTkywH3ipXFcPuq6aQdkipShHyiWhr7P/dLKEQKoLQkDmIKN+9mRu4zYoAD7gl2aC/AOeNOuEkN3syb47ZhEp/TN6BStRCFw==
X-Gm-Message-State: AOJu0YwKtrWWfJhwvuQL0H/Q37eqRwsbSWh9HHtjsHrZuc7pSO+L+ONg
	e13uOA7n3xuGYCR4tq6olCaMwBnuOTcsy8nnQtbzE3EMy1LxHSQqEO7AreJelTicOMyeKVDAeAz
	shKJkLCiXbdN2PCvRHpD6STKMKPVPNpNu+Jzt
X-Google-Smtp-Source: AGHT+IGNx5y2BY9D4mJMH83J8PD0rFPl4R1+a2ILIuqwXXx76mZzGSaEjAzEBuASx0Sxf34guJveW0UaaWBsvsBJ1t0=
X-Received: by 2002:a25:3041:0:b0:dd1:7128:617b with SMTP id
 3f1490d57ef6-debb9dba556mr3866366276.38.1715205863085; Wed, 08 May 2024
 15:04:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 15:04:22 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-7-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-7-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 15:04:22 -0700
Message-ID: <CAE-0n51B+czEMznAqrwzGyUpK0960q-HZDVqTUprvRwwnXuerA@mail.gmail.com>
Subject: Re: [PATCH 06/13] mfd: pm8008: rename irq chip
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

Quoting Johan Hovold (2024-05-06 08:08:23)
> Drop the redundant "irq" suffix from the irq chip name.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

