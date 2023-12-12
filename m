Return-Path: <linux-gpio+bounces-1324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F12E80F6E4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 20:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF40CB20F32
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 19:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671EC52775;
	Tue, 12 Dec 2023 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hmApa4J7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F04AF
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 11:39:29 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c32df9174so52647135e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409968; x=1703014768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwKNTVPc0zOUyh8Zz3xKu7Ktg/C30/+st0vAzVasp/U=;
        b=hmApa4J7pbcBuglF+KymViFi8M5RyzvmM/Czq1ySHHrMq6TtxqSd4hK/Y+4TrY9nJC
         RMD9izu9ChPNd+jPSy/sXhLQndq18vfVSmF9cWsXz3gKrW0VxCtoeVWQdZ6gnKuNLIwb
         UXh9MlhhyLnYypCHfSdlS8AjZJZwQncsShFseKsrzDSu3Jsc1qr5MyJOdziaGgU5kU7R
         MwEQtM23FQYiaZ0W9i+cnLpIRMsULjRsYHg6ooHmYQ4hUEbAGV++2GUs8EY4pU0T5yUe
         RmJczX81u3u8NaGB0YsCFPg/xaKnoA6hT2GDvWqoQwRql1U8CfSeoG2xvUj93hOnVAq7
         VNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409968; x=1703014768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwKNTVPc0zOUyh8Zz3xKu7Ktg/C30/+st0vAzVasp/U=;
        b=N5l3uDC9sOQNg49p7h0ZZy6saW9CRqs+o4l0b0tWZ1qq9VYw2PsC7sQqRSYZ5qzJXu
         ZlxxTUPhvzXiJmuxMMeOQaik+6JYraqMZ8yUxzwVXJgfKAdpykV1hjI7bH/wvLZ6VEY5
         3LiJnJwpEP4J/HPD9PAPAWtKAdSgrbNbWR4RDMt5CrW2IL2gaEYMA7L7D/pmacUngkrT
         uCV3jiu3FcXYBx2Zub+SDgWawxXFu0/PhSnT+cyirfmQM0LWUAac6GIdvgy/GW0bPLkk
         2Nzo5Lc5OSljW4Il+4FDN0APFHkDoz8igTYQWLsGASm9vROispYGurCTaKv7NAtqjJMq
         LXnA==
X-Gm-Message-State: AOJu0Yx4FoYd/9G1aeB0YO7pwptluq2HGuq9sQevu5C7ofIERw+1cQ/2
	z9nsZGknK/YTDMGkIUpevoxE/Q==
X-Google-Smtp-Source: AGHT+IEuT1YOCc6s/C3exd5OlSd3L+Rz0/8W0qjUZuAgTsPLDmYPGS3bj6AjzI5w3+mefcaqCIIBEw==
X-Received: by 2002:a05:600c:430c:b0:409:6e0e:e948 with SMTP id p12-20020a05600c430c00b004096e0ee948mr2428902wme.1.1702409968256;
        Tue, 12 Dec 2023 11:39:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v7 04/16] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
Date: Tue, 12 Dec 2023 20:39:13 +0100
Message-Id: <170240988143.242356.13785462377089230139.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-5-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-5-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:19 +0000, Peter Griffin wrote:
> Specifying samsung,uart-fifosize in both DT and driver static data is error
> prone and relies on driver probe order and dt aliases to be correct.
> 
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
> 
> For google,gs101-uart make samsung,uart-fifosize a required property.
> For this platform fifosize now *only* comes from DT.
> 
> [...]

Applied, thanks!

[04/16] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
        https://git.kernel.org/krzk/linux/c/2072496129b7d7448f969b6334b4fd2e876a642d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

