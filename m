Return-Path: <linux-gpio+bounces-28658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E1C6960C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 262394E392F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9BD33DECD;
	Tue, 18 Nov 2025 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B4uYJqkv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D252F6569
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 12:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468881; cv=none; b=oLw8Sa/qZTKVTnE06x+Kdr5bI5D6TWK+vpw4dFXQZ9V0DW9njnzBVjxqkV7EVe4VCSp/uzEAIASChc8o3aYZfHBN92GovWBm8h57QbhS4INNrUgqButvtNTAR6jKr9pq5+RTRObZFl3Tnna1ogpyij02hk92ZcXnkkPA1D4ApKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468881; c=relaxed/simple;
	bh=5DEkD6EzBulinSrQzH4gj9jjI2T7RDQj5F5OtFx2q04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8Tp8r4T3lESUCGJvqAQBqXj4srhPCiPG9VFlfEO/nMxrZ7+l4nlATVOq7iPfzukJUxP+oc8rUFp7InQTOC979Ls0tuqt87BnttkKDoX+oPCk5vuT986t1aHEyTeHqYOH/T/B3PGXH9qhUrjZvUktl/rbaA1ZeGFc05D9eMclMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B4uYJqkv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so59762045e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 04:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763468878; x=1764073678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTg/zFhYq07dRdInsaNPTNhQ1s1RrOcCC4Ij7Sv6vBk=;
        b=B4uYJqkvfeL1R2GE2BQPxD9Qgrxpuh8qIqfnYB/B32ZMI5F+hAfNsI1q4aTZUIIpD7
         l2JylTFabC5jWy+VoNNrttjCtIjbZX1vNmTdR7LsJRWx/hJ1ujWXnwIcBfDIm7RZCYTr
         TBLoWQI3vLrLBw2vXShKS2EPM+hXzJWQ4/trL91Y9Z2ubrAb/YJrw8bF1r+UkHzllG1y
         +ezzF/c5HYn1CleVpXjqGn+9KX8/I1HEIUYtk/pSwozpOmATcu/SCCF0+MyLAoQcA7HT
         UOblYQkPkSMdR3V1brtWg/JMj6cDKnjIWbmV6Y/91frzgqiWmECIeQLROJTgutJmKRqh
         XFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468878; x=1764073678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tTg/zFhYq07dRdInsaNPTNhQ1s1RrOcCC4Ij7Sv6vBk=;
        b=TWcX+2dSnBL+rv0+7SW91kn+DqkUR8FbgiP1KQesLj3oWK1FtBiX4ErSQqRkDm4/hP
         v9f/S8rn7xDOSn/zv51tr5E/AKCrnuMVhWf8d7JJYpDbsg6uOKSKXXZhzGzJn8vlEqex
         eaGKyvl2SSKlctkVocZcK3jjkDysqQKNzua2H3JnanykEJCFx+sHFlGey4ALwjYJU0rH
         cYyLAMr5/u08nN2GObSGqoni6ghE72q4ovNlsK8sHIml7CtMn1dnpIFDVS0fr26RAfww
         FXSwt3j1BI5o91PFlG3IZMA5G7rr5qvSVBNIM7A7NknYsgcPWx7w6QU6jCvQImhpgHSQ
         C0VA==
X-Forwarded-Encrypted: i=1; AJvYcCWf2Cy0QkWPaDoKqKVaIaGBTC6mmr18gAUOQ1Q6fHs9RLSrVyWr2gwX+szuBrOAwW0vrScleeQ/CIsP@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8jo3GqdH9rylgc+KL+6r0nwMEI01+QT/bCpQ5d3AEikT4THr
	ScfGzNptYK9cFcAEkDATKPe6rWUSMcSV4Xi1Nof9FhM88KHMSpzGKqO3kxTslrYmfY4=
X-Gm-Gg: ASbGncttW7QWpX8fz6vrwT2BUGe9Dk12UkYFIho4/qVO16frjbjOHqV4TseHLO0nJPz
	xmzu+xP8MH6g2QpfD4j++9OrYM2AJRWmXzMlmopwQX5pVgyNaFFs1u9fuCIQgA2mO7jQc4nowwl
	KFj1ljdfhHKMkqghfbSL0Y9bY2padzsfNvAsZZiV+LaE3XhQcTIkPso6UxGu3mlkzVPr2OQCwOE
	b2CDFy9i4aZVRF1KHB2KnpgDSFjqbsyVlUMysVcyfxQo3twb7au4HJLDtQoiGJpJVhxrEVu3R3y
	X7CVIEBuy1HsQTxPaN5VN1jdxAv3NfUXrojaSVJvhNaUJHhU3oIPRXNP+CZDMfNLouMNNUbALSj
	cJXrdENBiF8j5ZpJjzqL853aohFuAEQg7+nUmBc/qmCtPGi0edfCDfWXlGSxp0oyEFUE0QRIJHE
	j80E4=
X-Google-Smtp-Source: AGHT+IGwGnIyZlfEO6CUHM/fTs2swA6eepL0DvcJAV4a92k35zE3cM2txOp8KWawxG5WDghBOM9Y7Q==
X-Received: by 2002:a05:600c:35d6:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-477ae3116a6mr9228035e9.13.1763468878245;
        Tue, 18 Nov 2025 04:27:58 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c283:3472:316:988d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477952823d3sm216032355e9.11.2025.11.18.04.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:27:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO compatibility
Date: Tue, 18 Nov 2025 13:27:56 +0100
Message-ID: <176346886857.23977.6496336184922024881.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-grumbly-oversized-2215fe887181@spud>
References: <20251117-grumbly-oversized-2215fe887181@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 17 Nov 2025 15:59:18 +0000, Conor Dooley wrote:
> pic64gx GPIO is compatible with mpfs-gpio controller, add it with a
> fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO compatibility
      https://git.kernel.org/brgl/linux/c/bb7c963d0008f6d652ca7c7aa1aedae3d03425c7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

