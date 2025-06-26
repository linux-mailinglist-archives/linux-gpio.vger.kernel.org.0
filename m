Return-Path: <linux-gpio+bounces-22256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3298EAE990B
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 10:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E60445A067F
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 08:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE06729615C;
	Thu, 26 Jun 2025 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uuUy6mmD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D71F1E25FA
	for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928017; cv=none; b=MBA7QDzRiHFhBxX4u9jmR66bJHx+C96tn4j0NVzcmrPnyVAzT3rAzMxI3Orwe8ReMw9L//g7FuUC4RcSNqounormIJNujqDPWg2Lf0JZILdye/+PHuEIw5X7eK7y3KafoAq8KNK2ST4x9KhtdNyxaaKxAkL8DTAm7071K6eRLXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928017; c=relaxed/simple;
	bh=V+Sp7fen2qtQZs4jIVXJToPjVuPycMR9pNG6QZbuznU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQmLVgQeMBCp8XXniqTzjt8j9qPeymh8hpLEceEJ0uxLIFyozUKF35F6vz/+cZorsm9hAKyenvQtspSu76IDabfsUqSmvIY8ZRrz2Mi3lylCQ/bubf+dKw5Djy6MBxAVSxrgj6CEcelLxB5K6nXhTlC6q/hM/q8CnGXk5VRS+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uuUy6mmD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso666967f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750928014; x=1751532814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHFSivCg/spytmsC03nloc7zaZxjmdS54OyFvtvWpeY=;
        b=uuUy6mmDx0T6es7fu9IALBG5qN/L6R+PSicW0y19hdNJ7u1EVtDtHe45M5ReDuP+oQ
         u3/VqovNf6IiYIqWyyoY9QFc7mwlCCxRsFN3xlqFJFVNXPYObWPkc9w6dQV6goz31fr5
         Zlzx5nY17bp/VynUiLjckCOU4WuBkR3dzV3QLdwimTfVToMGNCkNjJp0EJQpFqmCOjnZ
         DVjFHeVYzZ+BT4rYBUdcpT6iXQqiOwrC4G1c3p9k/v6C6W+0M2lshIDaWswUFfA0X7En
         RAlK1akBvdTs7HbSelaeJfaqaXywPN4AqGaC+e0mQgBmvOVxgup4SQ2VlIsGcK7SPvF/
         rjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750928014; x=1751532814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHFSivCg/spytmsC03nloc7zaZxjmdS54OyFvtvWpeY=;
        b=cSvJJYLcK9i63y6yU5NyiKZF4upANDHp/vnQPTzZLN0rpthclAXUsxoCgyou3v7PSf
         gpyZYdt+K3Q9Au7ztuv8GYRLNtSvKdqqoC1tBUMwwb+IBr9CdcV9Gna3DOXbOcGNx6AJ
         iWx76P56ddqFiRTO/Jzo6W5lnmXsBabgvj6+XiU3p/MMpMDoYCjTTxiqxVFe3x8fzHL2
         wqOnWVdDSuTRxWLUBYAnWXaQZmHtuP2qCeygVoG7GaQuLfWUvE417BjLxcgRLU5GtPVL
         X+k6VDnSwpjIZsLoSbRMZg+/sxoXIE+XYAhON7AKYz9CpkrVDZxTq8m04p3yHsnkZFFD
         UOrg==
X-Forwarded-Encrypted: i=1; AJvYcCW304OR6i0e8Dsx6jrwBJzvVikhcVQY0dBS1tIb+QbFUPsiFqRd+9OoywVu8OBQpKihk5M5jydtfTMq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1d02iiXJeseRj0d2IpCIUg8v90xQgZ3brDu3qiz8HjntzV4u1
	/eh5K/YuiofidGBweHwSvdnZvD63xdavJA6Na+Zrurscpp1idvDphxCFtSCyMYTPv1k=
X-Gm-Gg: ASbGncuy8iVCQgi5u7kl3krD/MkPrcTozOC0BAWm1lOKN5GumiAKRPAZ/qwvMmiw327
	29R98KyuRbvPq+2/Uzmo3rT8Fs13GsTadNtRddLfKWRunBrH/BDStWnzeQOLvlllJy6CCJtAi2F
	8v7iGctsq7cTDroU7mqelXz9OFdshH3e99SWWv+4drQ9qxsHbloi/ejkmusMTkV3sEtEvghXEAP
	kCPcSn9NlBpDiyT2r15rcESi903WU967ru79n/7hYdXoUwLpKOz12pQjrzaSdu0pq9wmxLg3/0q
	bdq6qzfmjITJ33CTYyh+xgK0WuwHTy0RoAnhdng+BWh7abhcKAxw/h1tY1CS
X-Google-Smtp-Source: AGHT+IENF+K1asS+T1pwLUr98Oz5aclWqP5A7IgCOFSxouvNv74nb2b4HyqVL83k4pH1phQaYMyNsQ==
X-Received: by 2002:a5d:5f92:0:b0:3a4:d722:5278 with SMTP id ffacd0b85a97d-3a6ed646577mr5688868f8f.39.1750928013671;
        Thu, 26 Jun 2025 01:53:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e29b:52b:8f3d:6109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm43261615e9.22.2025.06.26.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:53:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: rcar: Use new line value setter callbacks
Date: Thu, 26 Jun 2025 10:53:32 +0200
Message-ID: <175092800962.17393.17614855967697488644.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1750838486.git.geert+renesas@glider.be>
References: <cover.1750838486.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 10:05:45 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series converts the R-Car GPIo driver to the new line value
> setter callbacks.
> 
> Changes compared to v1:
>   - New patch "gpio: rcar: Remove checks for empty bankmasks".
> 
> [...]

Applied, thanks!

[1/2] gpio: rcar: Remove checks for empty bankmasks
      https://git.kernel.org/brgl/linux/c/28a9ab01f6ac87afb78cb18098bc37a74db0d8f0
[2/2] gpio: rcar: Use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/3315e39e5639ac770782b658e499d45f68ea7d82

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

