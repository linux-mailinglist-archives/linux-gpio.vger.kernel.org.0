Return-Path: <linux-gpio+bounces-10671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D297A98CE29
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 09:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D76B2849DE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 07:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DB41946C3;
	Wed,  2 Oct 2024 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kq6MHxQB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D54194152
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855763; cv=none; b=FdDVfjwekCsn3PvAykzSmz2/3Ist8T+0ak3W7bx3by2CQ98gNavNwKM78MGMZfSxfyxo+/kb8bVdCnLqZovek+FUxo52oPkMOJdgrU+A4l2mdR+9fvB91bireBinbGQf86TVjU+Y1G4H3knlrvPqSG2IumRYwYVybAZV3nbK4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855763; c=relaxed/simple;
	bh=kU6RM+ooIXXcM9c/jbqH0Uw85/XTZ3Xgd+5hv0PQbhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zz8dwpa3rQSvBzeIlzp6lfV9Y6KJpZTGrvSRRjedJM24LtSKclj6F7ZWXChzkpitATwvW5MqnGpHovo7/GslmCv/PiOwmT7a9yg18MOIQUALXQThgs0cwe5oA3mUPcClt//jSlwTOTh7HT+JuOBRMuXgfNTLRsL3rFXhDvZ5648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kq6MHxQB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42e6dbc8c7dso8725555e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727855760; x=1728460560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdUrO5/+wLUDv1vGiyhZonnC5/peZ4QYzj75J80RoD8=;
        b=kq6MHxQB4jOG1cxD5GjjNvU+5EfKOK2jUEUkGTqnoLvQ0BZAyn61I4FqV1QVclKdhi
         asz5qQKuvs9e3tVp53z6F3f5LpGWqWF/XXCQeuGeU0xMAf3pq61rHbIjkkWBUSS5iENQ
         o47VHfzE1V+3eRkHsphvHT27pwJh7/9VAWiqdE8RHN1A6FiAmkmu+31W19zyPD6MRrRo
         M0XKG/a0uLz8PrU9Rl/TJWL942CMdfVV3EXFiMpUH4iQ9Sbd8sOhueLgQQK2cq+Q/2MB
         peAOteEqaD/s5f8rZuCdeULwXsA/OKWDbymQHu6rMoh1k+klEwLF9SRMnH18Pk9VqVyB
         dSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855760; x=1728460560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdUrO5/+wLUDv1vGiyhZonnC5/peZ4QYzj75J80RoD8=;
        b=d/33GC+5HKpYRfrMd/SDoqqqIfQttLcp/2+c0xzq3w7b/1tcAsFFrh8LwzYJQ+6g97
         V6aIqNgXNsMcQkSMCs8FwRGgM+CxNvKx4YXgQvzAYLmw/8zZ9++y6BgXcMYkURi4HCVw
         j3wqmR3yYLxjTLxr7CRKbV2AI+Ar0YTsbLpoouMIhBtsiDOgPucbC0PnzmAaY6wpLK4M
         k6eWFOEleFVzco0mn/qZ9phCiG+dsj6It1ju2XJKPEkP6+gkdYoHJN1SJM9OfkkdvlTd
         t6hiVuLgq0J5GBjAaSlQAtunqD/dKWNxcHwZO6Ws5AEQlv5Q2yCwbMZuoyf43LrAJ1bC
         rwgw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ9IG9TFEQvWbbI4oWpsncKr/Q7XIJjsSL47h3hdoo0BS2SlVBa/bf6HH5dQeHmtoKW2PHyrjhPeKC@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5RRedFZkO5b4s1CAzQQLlponHtKzNfXfpkPDRfxAJFEiVpSs
	HjPx6pJSa5SBzVsC/OcB/TzVO0SIh8btGj91OhpIg87+/E64JlwnBrYZylOEUaA=
X-Google-Smtp-Source: AGHT+IFXXwUeZK6UR2BLcwewuQ+H5PGWRWeXcyQ+J4runoR7VA00QSHe7mz0Sn9gV/K8lWTsFr7udg==
X-Received: by 2002:a05:600c:458a:b0:42c:aeee:da87 with SMTP id 5b1f17b1804b1-42f77900776mr6649195e9.9.1727855759948;
        Wed, 02 Oct 2024 00:55:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a01f52csm11176545e9.37.2024.10.02.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:55:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
Date: Wed,  2 Oct 2024 09:55:52 +0200
Message-ID: <172785575195.22593.4753948681084660914.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920154508.1618410-5-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com> <20240920154508.1618410-5-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Sep 2024 18:45:02 +0300, Ivaylo Ivanov wrote:
> Add compatible for Exynos8895 SoC.
> 
> 

Applied, thanks!

[04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
        https://git.kernel.org/pinctrl/samsung/c/724d52a3cd33774570c43cff06403b4cdda00abe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

