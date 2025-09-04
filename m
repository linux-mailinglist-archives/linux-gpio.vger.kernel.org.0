Return-Path: <linux-gpio+bounces-25595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8EB43D93
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 717AC4E5A26
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 13:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07D1306487;
	Thu,  4 Sep 2025 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXFlau1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF42A3054E7
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993576; cv=none; b=bhkgRNeTPYEmxFc77hkHpXgcBhXNN4Ng6NWxx0nEVokL5UdOl8C06Fr9i6IN1wT5Y0GqRX8h4GINXkSNQYndi1jP2jbc5ln5nKqh7fl/kQHcbjnPZjjDhYjLzblexqfsiAKVLH4CzsrSOo4P+k3+7eQvVMxWBjRwgVjmfLNrLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993576; c=relaxed/simple;
	bh=gXxTjmeDzKTB71t19xBb7Wxglec5+6mU41Xm0qtDe5k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rn2iVxB/iIxYzSPJfRehaJHektqk0tCObl/DwKNP9fSAoWTf1sey1GVnaM3SdFAUdIgvrNyDm7+onBOnldDGpB0dVuDu/EJ720dXP5vYYWuQoLzNHNHLsqPsy+6VrloQSDCq4H/VUVGbCxGgqhnm6ya9I+7d9oaKAgtacFL61To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXFlau1U; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61eaa4f6784so180391a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993573; x=1757598373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ26RmHLaQWCbZPPgHAZQdVbT/ghy6v/A0FERV/jWuE=;
        b=CXFlau1UNt/Poc6gW4Z87Y6m7IFh83zTb3QHxjsXqPJP3vuw5FSJv4BhwDOd6L6p4y
         8bElfH/ctsxmfvjebSYnpZ/gTAeeGVrskS0tT/M86O9p7+PkCnaewEtI7/KOctchR78K
         zbH9K5QfI9dqHFy7hoMBqrFcItQbmQkVmXB0xJVT+LC8/hxOiTMia5WE3W3BlbP03Q3J
         jHKshro3NY9BN5b4gkSIgoTetUaBRYiPT0iITII2fwrQZT8Xvcelg5psmjpXKvYVffnG
         wfg1DJAWzvQBYwxDz9spgGHKMAGaC6JlvCmu4rWBgeGMT1ez0rEat8o+oMS38vk9eQZi
         cWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993573; x=1757598373;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ26RmHLaQWCbZPPgHAZQdVbT/ghy6v/A0FERV/jWuE=;
        b=HIDbBxA/W/ool82S73OGR325EVJJVbXsSbe3UzDD3VrNCn1+zqz1qX7+uV5lZnmRrR
         OXiwR+dyjJ1jRQo5lmoOOCKuUR0XjBA6Jj/wDIPX7wXoJhDoXGSIV7RPbGvRvhkTKmdw
         lUE2Plr0h/P2CHZExCfMsEdvpGTX2Ntqk3OZ/5M20IpBJ9z8ZlOJyl9Arl0zUME96GoW
         ylm867J5V2uMJg4SthMVunsoKJp4jVLDkJqA+o5IzbsM8Tf4+ZGy2Saf74qFbbE5D0EJ
         j2zXm6xGVb3c6Kn4NQGAbLFciPf2kunrjSx8XHlK1ew/TCrU7jIasLViKgeQqL1V6yke
         x34g==
X-Forwarded-Encrypted: i=1; AJvYcCVSx+pOjJ35PUrO5lvo++6zXE2woR2cqNbmXYvbHdgZhiM4MzPRO7PmXoKP0FXH3Kr47sRNL5dWM8it@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80RZMRHxgSY5W69F4ZTB3SLNXlTwBbSWg3wfC2g8+gocPgngv
	KgOmj4qtc7g/AOoVmeDRqYFuMl+k6OmbggSL3ozVIOFmCtVZKzbkinOH6BDNSZO7MqM=
X-Gm-Gg: ASbGnctXML1C+CKrIaK7ziIfp/wWisrsF87ES9IDPweTAd/6q1Vu4L7yJjvQsCCJbXD
	C82jN2J3mI1zuN+I7AYOkomHDBMea8cHTnPYPZREsz6WGAsbdM6HpBxEOloZOtLkfnl3jnJVM1l
	b7Y8cyYWxe9y5gKRohJIvsPvC27vx+XQS2Hl+5buFd3vZM9tzQb1BoCjsTjLiQdyCPItlJ7wQx/
	JOzVkn2iYmMPXTS1LqkB8xDiQIApjnbuhMvvkMsu3UV94wpBACzLo5P1Ati76yZ2z5Q+LCQ8FKU
	L6WNFeGPbHSytdN/pdPgAaKWOZvNserGqGNTlW4WQMWbVRR52V2cRo5+xg+v5cAbcXG1TIyJsXj
	3OUO3NpFKgMwhu2vyBjf97k4pE6ZubyE9BEpLWb7lnD+p8Ednfw==
X-Google-Smtp-Source: AGHT+IEQoqOwB2yGHXtT3U5ow0C3hw1fUocrSdNOZukUnko/TRqHkgL5aBTtZ+Kkhn/YxvPmHZWsUg==
X-Received: by 2002:a17:907:7e99:b0:afe:af91:2e54 with SMTP id a640c23a62f3a-aff0f15c2c2mr1210879366b.9.1756993573122;
        Thu, 04 Sep 2025 06:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250901051926.59970-6-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054259epcas5p13dfe6ccb7759af018a07403ceb1e86f4@epcas5p1.samsung.com>
 <20250901051926.59970-6-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 5/6] arm64: dts: axis: Add ARTPEC-8 Grizzly
 dts support
Message-Id: <175699357104.171312.5414348160649999670.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:25 +0530, Ravi Patel wrote:
> Add initial devcie tree for the ARTPEC-8 Grizzly board.
> The ARTPEC-8 Grizzly is a small board developed by Axis,
> based on the Axis ARTPEC-8 SoC.
> 
> 

Applied, thanks!

[5/6] arm64: dts: axis: Add ARTPEC-8 Grizzly dts support
      https://git.kernel.org/krzk/linux/c/9e74b88c0a57f78dfd3017de435ae400d9b659d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


