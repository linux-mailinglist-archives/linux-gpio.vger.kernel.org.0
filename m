Return-Path: <linux-gpio+bounces-13402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2A9E0495
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A70282C81
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 14:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EFA203711;
	Mon,  2 Dec 2024 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPoAYwi+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1A1E4AD
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148916; cv=none; b=hCf4WlVAhd7tyE86RgcL4beMGYMJHVZNN6Dp2sBm2/0XgDDqm9iv0lJlba+AFJDhXKOf+mepM+aFKZwBaZH8c9oT3++IFxezTsC/QFUfyjyLoPIpT0YIQm4ZfJi4oerZqVOgEuYes77XITvFu4YBmvkGwXNbhRMmUZXfwvqteb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148916; c=relaxed/simple;
	bh=ErEwmTVW+AJuBhiJwMY/EZuwY/ewg6Ae7ulD+DF5Jgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aqLvbT5e6/qv3EgURTmZwKpEeLPw2mUkMnUZRIjKm7lRh8pSHKDlU1BWq4d3REGIyoKY4Rp1+8HSBwZ0xyTFGtohonfXo4n6vbFYhwFG+7wGDrqUEbOgyvxty7CivsKGbo9ASBlzWF6phZglNwEfF9I0Zt9nGOKy+PVfkCTMXA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPoAYwi+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso65281f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 06:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148913; x=1733753713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4WY1vAA0r2fKbPXY4KjAS2UpwZ8hfCdwU02a05Yrls=;
        b=PPoAYwi+eUePvErxy+KYvdLvS98V7Pdj0Cj7hD2p03ikjT1l5VaKmhtRSLQxidsAH0
         j363wx3YAEEe9Pds/nm+sm2uEDFo+FzPq4fkq353hzlq3EARaYlXcgXYFcCe3jdiUa9w
         Py+YhpNbogB4b5kUIyiKSil59OBIFu9HBJpdTrNSkqMPiy4h/kzIMbhzkWKYfZhJ2xOM
         We/m7V6fxnK1sxEBpdxNmwLw/v+c1rUsE8ZgLuu8qLAyLXx57nNAD3nyphenx9sxLpW4
         us395mC+EMtg9PXwf+swibPW0283mwuvxy0QiyZ0VjBFN1GHmzasKqjySe9alD4QfGS8
         pqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148913; x=1733753713;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4WY1vAA0r2fKbPXY4KjAS2UpwZ8hfCdwU02a05Yrls=;
        b=goMiUILoX8BWgY865XZ57yjwrRI20ujp8pQZ9JQni4xqq/iHvJUihi4trC4IiNuKER
         Vcv0wBJ65W4M2SpnXlflTI1p8kJaY1XNqurdXrzjuRSn8bZIk5HHhg36xW0+u8LKio9Q
         x02QvouFSaOA6CMrosTMdHoHHfrFq2ZaWovW6HgsJjDCdyBD6j7kqnN/RInTAiZy+Ffh
         SHN8q0veBhA4ph6jp3Nan9icYz0P5LvqNPYSEA7UtzkwQh87pUUX/dj0VswRBmNBoAza
         xcepQp5xIuJpy2b79EhzEWS5Ui1WiPP0EicvyMhs360FOlGyKqi+xabps5yRJvKmDxhP
         34IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTNtrl6cP/swpRkU5SDgjXxsoh16i60JeEcqnG5f/8RabVdvoT9vbETqbTdTdNB0cpDWn3juG7d6Vt@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp6gNoSCicM8ipJKjqKWRVbUsmgXqgt5gXuVLed2BGN9ADnWLY
	Lbi2H8vo3R8MBemA59KzVYKilcBwN7MUMSsxP4yrUfAY2/tR2NAKmmPa8SuRCdY=
X-Gm-Gg: ASbGnct8tHipi0a+9msZY8M1KQKyDCNvx+fMg+/AFhLQmBfwgihm8LReOGqhTVoemc8
	e7M0GVZQrcuoc1CFtpgBIomkp+HuFcYDOGRkR4BwQAsXJKejMlH59GHjeADid6TKJsiseYy0qxE
	cLhrBnNOkCrR3QsCR0iZMuMYXBAkV8mDDhGIjGOB/hH48YUtDia9Ao5atSO8dfs84tIZ/qxjpEO
	GoiacT6XhS/0Ar0ty1lnlA/86kFCZqxH9KVu7OZT5FbrqKp5A7c3ooZ2sXHKx1j
X-Google-Smtp-Source: AGHT+IFElDO2xd8mFJCzbrH8EiF3i2wyF8UmcXsrEdAyTq41fa6hejn4lGjAijspgIkC6zPVj6Q6lw==
X-Received: by 2002:a5d:5984:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-385de672523mr4078648f8f.11.1733148912772;
        Mon, 02 Dec 2024 06:15:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbe4ccsm152388855e9.13.2024.12.02.06.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:15:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
References: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: samsung: fix fwnode refcount cleanup in
 error path and update comment
Message-Id: <173314891106.48956.4220732642073324618.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 06 Nov 2024 23:04:38 +0100, Javier Carrasco wrote:
> The first patch completes a previous fix where one error path stayed as
> a direct return after the child nodes were acquired, and the second,
> completely trivial, updates the function name used in the comment to
> indicate where the references are released.
> 
> 

Applied, thanks!

[1/2] pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      https://git.kernel.org/pinctrl/samsung/c/459915f55509f4bfd6076daa1428e28490ddee3b
[2/2] pinctrl: samsung: update child reference drop comment
      https://git.kernel.org/pinctrl/samsung/c/0ebb1e9e1b12ddcb86105a14b59ccbed76b6ce00

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


