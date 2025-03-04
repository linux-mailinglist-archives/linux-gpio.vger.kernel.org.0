Return-Path: <linux-gpio+bounces-17015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0FA4DB36
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E199C3AE50E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB566202C56;
	Tue,  4 Mar 2025 10:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lXUofKZw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE1202C39
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084802; cv=none; b=fU0voKzDXjKAQwjzkohbaWh2Ur+/RKKlQQ9aMxyxce196F0SnYepSqsEpcTZiZqXElwqHW0DJfl35TiDjYXaLbfuMOZyrG5ZWobhBBotmI3AH//K/2E1uGhk+3wA3g9MTMsCEORLrSRvrQsTbgUfpP9zt3bBGs+agR2vfguKgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084802; c=relaxed/simple;
	bh=nzgcasT8XlfuMCUiPfV4W/V1AJ9l8OcLLCDvCjZ+wh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AOWeVj70yuIEYcfVAPrtx364GFqjAF2zrHuCQC3FKCsBP5Olzq9ET7HRyWkqJinJdwMpZbtGKDbpY5tT2Nvlc2ku4yUDlf7cVvV0etFpXL2ylpgynO9Un5a7u3nxB+PJULonKn6Hg8hMNHMlcamPIcIw3mHiTJxsiCWU5i9aWPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lXUofKZw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3297515f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084798; x=1741689598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4NRBkDX3tmF4bL4mAlAFQOe0WTBDnxQ2hATnqOky0M=;
        b=lXUofKZwkeg5fvE/WuQp2lxCVJSFmUWajPm+wtvu+oMFDi0Y15yee0mX3AZNSTBkRD
         Djr8pva31HiMPD7CHIP4r2gRjj7t8UY+/Q6gHZab5NjFZm9WWkdlJLDRgQlWo+EwgoSh
         NrKNVeB3ifTsGZ32kv3wWJPfWQO1seOwiD4+E7y5nYGRqZ/IkCccg0y7Bq36LTwj9x/K
         3ayaxs8JJXRmqaceCRa3K8aS7EljOB2kVef+RHXsxB4wHzQtgHznZGCiQosVetVhHw3p
         dpIbKcN7Efob2ZtLvwLmfx5G++/OozelcfHcLLSB3KsqhGVhRyTdzSngyJ9tH3tZLkpI
         eQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084798; x=1741689598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4NRBkDX3tmF4bL4mAlAFQOe0WTBDnxQ2hATnqOky0M=;
        b=oK2hR6LstoWPrDEOqtxkYhu4ToOLiFC6k2xMyEIP+0YJHHiPFXzgTtlj947ZItTm4a
         B/o5ac31Ww4L8D6477i04v14V7vTMVI1pWWTYZdhPq8K5hcT2Iu68JANAKJd9RYUqo7b
         Auka0qziSPjIX6Nk2qrvOX0RjXWpmy5HpMrqMfCGg9W1E4jI9GW6Xa/x2M7GASKYVUZm
         1rmBWlHMwff+Z2Moxq2+tPustyTG0gqVPtuaOsE9cEUYMbjuEacbWEiHhvnMLEr0UREW
         YgTRVj4SWcZQg70BxSRlPYfFgsFIzfvGirfDbs+1+PuxAAFvJiRbjGSdaufmmFHvOds5
         AcpA==
X-Forwarded-Encrypted: i=1; AJvYcCXtl/MHUsJVOWeP9V0rxRjI3YinYEE3AjwNvEW4c1NP3hARIAk78u0wAYtUjrDh5Ty+7Pnc5Gn3aipE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0P67YoXNKp9H2vNvQyJ4bm/lKInn5HynJzIQqNeqR1kJuMFM
	UsBbnjEKjk+AcWJ6NRen+wfxD20Q9xnKEYxa5UbFm12hhxaFz9pJtoGfwgz8skU=
X-Gm-Gg: ASbGnctu/X/LF1ssL9O/qy2WScYScb0K4uw5YaUfhXLmUXdAfn5wniZm5qwzRGgRyhE
	JmPc8UR4aZd2r6dTfRz64DHVZ/hfERLxx7IfvZ2eB27XzP/TysHs3YDBZeghlt6Fn0AkcvLeDRZ
	9FMV6f1Y2ScNgEWaUzNV6ShSGhOc7SlIyf69mPmUCMEG+LeRFJmPSuJWim3k+OOs6XUF5xIIJqJ
	SzcSTOFvH9y4gMpW2nypmUIlHGz/A+/H4RM3+vHJHfG1ztymBRf9iqQqLPCaSfIZ42udSJnDhTX
	uo9KYl1q4ZumegOkGigFGitSe7Ny/IoHsINoxtq1Hxk0
X-Google-Smtp-Source: AGHT+IGI5YinM0Fmil/KbrQRp+7dyNZtKk6Cw3iHPUYwQZ6EfkAXgPjAmvyLHMyqzvMus9tjQNoGAw==
X-Received: by 2002:a05:6000:2805:b0:390:fb37:1ca with SMTP id ffacd0b85a97d-390fb3705aamr7047086f8f.53.1741084798504;
        Tue, 04 Mar 2025 02:39:58 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6018:7257:350d:e85e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484451fsm17602859f8f.63.2025.03.04.02.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:39:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: mvebu: Add missing 'gpio-ranges' property and hog nodes
Date: Tue,  4 Mar 2025 11:39:56 +0100
Message-ID: <174108479375.31979.16946190179335788449.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227175132.3734524-1-robh@kernel.org>
References: <20250227175132.3734524-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Feb 2025 11:51:32 -0600, Rob Herring (Arm) wrote:
> The Marvell mvebu binding users already use 'gpio-ranges' and have hog
> nodes, so add them to the binding.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: mvebu: Add missing 'gpio-ranges' property and hog nodes
      commit: f2f3d5d62f6fbdaef46d1991086265a497b3e24f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

