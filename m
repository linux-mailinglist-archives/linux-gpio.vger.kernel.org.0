Return-Path: <linux-gpio+bounces-16907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96427A4BA53
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 10:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94423188FF21
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD36C1F03EB;
	Mon,  3 Mar 2025 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHNc38pM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5DA152532
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740992936; cv=none; b=U3fHWoaB+F//Y2HlyfDd+9Ty42IX5jOcZhOhkiSUThEk4CHsEnXspAuzvRUWYOsVlCz8ztDFBSqbr6YFoeZIKG1tDAoUX6UbEGKdxVe41a/9KNZo9ULoJfKkI6lLUmJC1L1700+NiGRzI119jW0VUO1WeB9MF8NH5pSwmz4wN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740992936; c=relaxed/simple;
	bh=KwdK1hh0pwYXDznk8CbHQleQFb+lcYppkzN3ytWbS68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YixwE+8hpw0worPe4ZT1E5czzYkcWvFUdd/oC8ia/0GiGS2n8t8WGBI0m+hAJIMpMIhssUuVfa3SMYTXkIuC8HDOQIOG5xxIEu6xjhVPQX1uYWKVoqsQZ22W9hnCx92wxp5XU5hkkU2hUetndApX8h3N4xJ+xvvcTOGxZMdwnUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHNc38pM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ba8bbeae2so3086205e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 01:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740992932; x=1741597732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NArLzMGeHWTWmPFGPl0UFGh/ozAvnT/Ug9Z5Z8/7zE=;
        b=HHNc38pMimubHaZpr+UKZS3T0okpzMFBJmnCIQ2bmWOS69L+TMJ9xt8WLw1gmzvQaI
         kXuEhoZFN4kX9728RUxJ5b0ycwNDWYvayEvCKqenQJzBTXpka+1lk6/Njlc3r3Svvb/h
         ayVJ+XbPC9T9OBg8yXa0tQtLCntt5scikVg+xwrVENXGEzshooBRhCCeJ7KNYNozrRre
         9AOzvlgYLL1p8SJ7eZkNlXVHnb3jQ7joY0KDhIfhoXWz9v7FTebmEDPzkCjuIAzS1DmF
         8Gk9Dd7MwgPMKSJZOFwT0DwCyIycwtmV8S2MLi+rU/mF/UCJu1wy/KDW2ArVcBVKj2xw
         vUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740992932; x=1741597732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NArLzMGeHWTWmPFGPl0UFGh/ozAvnT/Ug9Z5Z8/7zE=;
        b=uTaVKCpC6sM6xoq6UYF2JiA4/7WGaKTSnXXz3cfiNBvGFBdHFdPppVyLgCqhaFs0TW
         D5QV/oGH2ub6h6PLncrBQ4S/5bN7Rn9TKNB0XeA3LTn53dGj9aJmhUDtd+EkmpqZi6pk
         929yOPcf4krKnsIuiNxZaV63WTM2SQywS84Ccq05nbzDeSR6aYGCFtDQkZMFgbUNZdTQ
         XXHAxlaLZKiaB7DUNj/Ee0i25T+ZWwDuXy0+tGUgSxRQ2+/PEhDTZ/E+zC78EYjo+trx
         sJyWw/2POBvOrUi5r3/21/bwIc5vLHJwIk4KpcG7JICQRE172BYVQU7xVtsRqVClAmmJ
         4WMw==
X-Forwarded-Encrypted: i=1; AJvYcCVpEKfr5CYy1XijelKq5HMaJxmn5xP+UgSv5J67hlVANbEEo3cnJoZa31TlJ+1qY70cu/nEwCWQEMOR@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmNrkylhbPbbI+zeAHmtAFMTBgHgyfqhwECsTxBqbko8VFHo1
	ZiuFuiSbmO0asDLrVu3mQYtVJ64hYT9r/Tq/ZSpHoOqfK+kIIrtVsfs854b6VAo=
X-Gm-Gg: ASbGnctOZgXHmWEo/UTAMNoeS/9yIM+WmQhGQEBv/gEQrnG+zi/vuUAHsw3LYYkCR0w
	L2zpPhjsM0l0MIU3yfVPUaI4lN7u/aQMXHaWIqmHS4XrWasZ/MMJ6digmr28UKMGCQjVY8BY3tn
	uwOLToc3rd+rgQIgj3o5UQ8LVZpoMJsBiaL6PmN63Afxv1aXsYFaQQ3B3RbTPQ8e5oxg+Y0fjqG
	ShTE2/PtZgZwzSGv6e4ImdL/WclrMlgUQYQywecQcXiBABU4yKS5v4NuKvXYQqe6r73MpmDkFDL
	U4SOvK1kvwn9yHKt0kkhvZnVUgIgLS6j1sIjmeiWcVbu4nzBymVeTsoArhM=
X-Google-Smtp-Source: AGHT+IEFwQNruNu5mTaT+/YMJCqOub6ua/xucOR8SE1iPMFTevfv7HuPeLZAAmqrMseXFFEcLiiaaQ==
X-Received: by 2002:a05:6000:1f82:b0:38a:8784:9137 with SMTP id ffacd0b85a97d-390eca88f78mr4072087f8f.9.1740992932006;
        Mon, 03 Mar 2025 01:08:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm14058418f8f.12.2025.03.03.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:08:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Introduce pin controller support for Exynos7870
Date: Mon,  3 Mar 2025 10:08:47 +0100
Message-ID: <174099291728.28792.4499836839323841404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
References: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Mar 2025 01:05:16 +0530, Kaustabh Chakraborty wrote:
> Add support for exynos7870 in the pinctrl driver. Also, document the
> ALIVE pin controller's wakeup interrupt compatible.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/129bdbd05650f4c11fb8995f8b6e63589ce4cb33
[2/3] dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/c1ab2297bc746b07b96205dddc45979feac22f4d
[3/3] pinctrl: samsung: add support for exynos7870 pinctrl
      https://git.kernel.org/pinctrl/samsung/c/eb76dc973cef741f74ce17d3bba8a7c9f2cc6113

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

