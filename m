Return-Path: <linux-gpio+bounces-142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F27EC2BE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 13:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B871F26B22
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 12:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE771428F;
	Wed, 15 Nov 2023 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTzIJI0v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97902168C2
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 12:44:23 +0000 (UTC)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CBB11D
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 04:44:21 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-da0cfcb9f40so7032242276.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 04:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700052261; x=1700657061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDeEkereiAIAe0FUqdP5N5yF0qKzFi4/lgt4oMPVPJ8=;
        b=KTzIJI0vyEipdbl3RkmUBghLdhKIxCGjx08IvDLQGYLSXpiLWzV4zsn06xPqFp6Kul
         x5MVsLJNM6FjzzPIahMYN7P6uXvPDjN5e5nlkDwCikUZjqpkamIVPmwdaRIcFCt3C1cK
         YXnG6jpFSR8GlA/XbjeTJb2DRkgZfLYPfXu8sVA3WeEAriT1k7WFSgu7CBO4rF132lqE
         dbLUlkACf0Cqoc9XHcR1S8+lbOZtCfl12k1PUqL9S+fwvZav4ynkEkhyOniWf0zF2mlS
         TfJvEeimiXIokpbiG2DjyFn+xB8teNJMaAUgZmmBErDq2NgKdmGT9hD0IT7ayoIpr3MO
         X8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700052261; x=1700657061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDeEkereiAIAe0FUqdP5N5yF0qKzFi4/lgt4oMPVPJ8=;
        b=q0gZ7fJ1X/37m4Rf4XSG1fo6VOl+mxitSwzZkWhruJsFshuDAxnt9x3Z81B8TOxmYZ
         OgMiMuQ2wFI38gYl0rOaTlKYal2MIY5pIEyyx3ie54k9nWY9nAamqwDutaOIPS6J389n
         cN6O3CBStrBhBGVz+q/C6sR6QvMdrr59ywvU7HqyMZh84RqcKG4GYPV3W1kqbheqHSlg
         +yGLRtzacIYjA/P7vXfGD/8fmIR8hNQeS1apVxcIVnFRiUMWhoORR6VanjVX8rxchSap
         awzdnQ59WUsuHKbAy1mytDboZBYNC2o8sPiBl+4FwZA/OXgV3CFGpBf+N/YwsZ2Z/0pb
         0sIQ==
X-Gm-Message-State: AOJu0YwbAIU6ufMEpp1opxV6cbKaZEKc6tD34KWA7zRbYYam2y1jrKWx
	fHqGAIFybgxA+3vytVsS360ZxA==
X-Google-Smtp-Source: AGHT+IFfGb6mZX8mGeMVlXdfJR95sgELctz4H5+vZhgwUg6VNMf7lb1HDhee3lSbcSQuhkvaW9Ckxg==
X-Received: by 2002:a25:ca53:0:b0:c4b:ada8:8b86 with SMTP id a80-20020a25ca53000000b00c4bada88b86mr11872481ybg.64.1700052260882;
        Wed, 15 Nov 2023 04:44:20 -0800 (PST)
Received: from krzk-bin.. ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id pz28-20020ad4551c000000b00677af708ebfsm504920qvb.126.2023.11.15.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 04:44:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaewon Kim <jaewon02.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v2 06/12] dt-bindings: pinctrl: samsung: add exynosautov920 binding
Date: Wed, 15 Nov 2023 13:44:13 +0100
Message-Id: <170005224375.13297.8512275766999804911.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115095609.39883-7-jaewon02.kim@samsung.com>
References: <20231115095609.39883-1-jaewon02.kim@samsung.com> <CGME20231115095854epcas2p457e0eedcd0b4a001eba8fba012f73920@epcas2p4.samsung.com> <20231115095609.39883-7-jaewon02.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Nov 2023 18:56:02 +0900, Jaewon Kim wrote:
> Add compatible string for exynosautov920 pin controller.
> 
> 

Applied, thanks!

[06/12] dt-bindings: pinctrl: samsung: add exynosautov920 binding
        https://git.kernel.org/pinctrl/samsung/c/fe8741faa3d9b4dd187708fed937da2766b29da4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

