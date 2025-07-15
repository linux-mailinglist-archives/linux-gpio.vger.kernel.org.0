Return-Path: <linux-gpio+bounces-23262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3029B04E76
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 05:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFFA21681C4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 03:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A0D2D0C88;
	Tue, 15 Jul 2025 02:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROoDjuLn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB51DB95E
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 02:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752548364; cv=none; b=TapRo5osF2x/wSuer46zvyJB75qePrtqwNjBG5hYBA9762Y0JG2CGOSiee/j4ejj/KGBHogJr4epGHk3TlUttlSWmC1Evx9BCVEH55W83j/ns9neTg7dbdBzk+i+nXpiJ9iqXJbt1sFqMO09/qoROJHmst9K0AtzFJyTF+J8oR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752548364; c=relaxed/simple;
	bh=FT+EPaJUCg5EV9ubB6H6SXSr22pcLbbvsyVsPlvk+nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hr4cjQqnd5wCFry99aurRVceCUgfm7oz9iiF6xXuADIL5Wz2kpliaBfaJskSHgTPXAdsRZ66kQoAHvdfMl78sNG9owhOwcyCn6PJ/ONsweBdIuisCsMAe5BSea94VRoU7OHjK4ywIFq3odPNONadSJNSZkycfvXG9iiww7gVP4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROoDjuLn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23c8a505177so46326115ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 19:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752548361; x=1753153161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ThaBBFxLaan5ycPDg8RZ9c/uzgLc+qAqUCDLCkQe+E=;
        b=ROoDjuLnLdm3VmTvgbGZFv1wj1tHtoTDMvjNaYvCyKJwpj2iiXucpmBlWgNTVuRB2n
         Memcj6IRM9p4Gs42fD0Hw7QEJbc8lPaJGp2LUh6SOQaKOD5vUbj13IWHZvOXMREUaTnR
         nx7SZfOwJjS/XVSeuxOBQ4EqApMFlvGjCBIxQkAOG3qWO+/XUOPvT76MTShzcp0qxKtt
         S7krRpk10vPBgWb8y3kk8p9FNZD0of5fQ+xInJpvFQvvrULKJg6Swj2WPsMuiGXWgxJk
         DyuX0cM4w6O3Y/D4LLr8jKLua5yp4RZF7SEs58crtds7tF2RhrL5JffLch+UiP51xOfN
         kddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752548361; x=1753153161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ThaBBFxLaan5ycPDg8RZ9c/uzgLc+qAqUCDLCkQe+E=;
        b=trwg1ku2E3K1WUO6yAUVkFu4zvoak6jUWV0JWES9kUlvyneoe99ie/ID7H/Wb0gbxk
         gUjNDodKf/w8HITYaHXA0ElVRnZvnhxViiosvXayZ0YZ06sbKX/IYUqpwP0RTjE4JvCB
         dcwITmb2tIXqCDr19CjxWYmdJdEZZ9cjacITFXEKy0I5CWM7Q9K41/zXvom92YJbI/Q2
         5mdUL9J24KjtSDBsP1bQM8frRV4BzX6PW2Ic4SfS9rH1AjiGDnAIGo0kYvUuylzgK3XE
         Tda9ynKQ4xz+3So5xGaAMOLcTgKtG6SVUbrwKndgOJD19Y3egYvqCNw1gfAzkC1rp8Qf
         tgSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX+6iy6tEeRucZkB6XIqbSRyZ37XHkR6uV32qfDCvgXpqCzuNtcYKXBVb26aFGK4z3w59O/qecm6CD@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQIOtKmLLPlBULhX0CQrbq4ia27G1s2lD6bTx1tbBifw1h/Dk
	14M9I7c/pkHYt3UgpPhuaYqPCwGjsZf9Ne+uw32hqRqJGcJXNMFkvCHxm+R1CEEMagI=
X-Gm-Gg: ASbGncvJuVfJDsepOUsUvgWDh6tZf/0Y0DlIDcBrgq7mv6YIoVtDT9aXRX65gTCbHr+
	Ufp3/+clbxLkR+w8H2DQUdKis50+4WbwzGp1eniffYmiEyqU3iS5TzcaO3z8P9ierspnyY2vMI9
	EGcA06OtJVWOAWyC1e0yRKUoFzwbjO2g+V9lr27oQA3WG0nDIJBJd7AjXl7+kUHl8kVAo5+eLYP
	ja4afhFwdwl/qrCxakfTTUHQ1SiyOd6kmJRm5JNG7b/778JdDZU+FqW67+JWZlCAM5G5WGaJ+oW
	GFL0ewDfS8bXfmkitZYs41rZ3SrdBjp/l0/2JSdhPEy0A5l4BfXY15jsUbFcGGl2bOvX8G/fi7M
	AOgZ/4OZc0avhf+JLmGyAbm0=
X-Google-Smtp-Source: AGHT+IEZK14JKJx9vQBh1CtChGZSB3DAOZGHhBBAyJvUIa0qYVZBJe8EfzMX4gC9v2p0KEXM1ActbA==
X-Received: by 2002:a17:903:230f:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-23dede86060mr202149485ad.25.1752548361221;
        Mon, 14 Jul 2025 19:59:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4332e61sm100432215ad.141.2025.07.14.19.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 19:59:20 -0700 (PDT)
Date: Tue, 15 Jul 2025 08:29:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert st,spear-spics-gpio to DT
 schema
Message-ID: <20250715025917.3yrffj422v4ggugq@vireshk-i7>
References: <20250714202753.3010240-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714202753.3010240-1-robh@kernel.org>

On 14-07-25, 15:27, Rob Herring (Arm) wrote:
> Convert the ST SPEAr SPI CS GPIO binding to DT schema format. It's a
> straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

