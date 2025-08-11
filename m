Return-Path: <linux-gpio+bounces-24168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75192B2098F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1385D3B1221
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84AA2D8385;
	Mon, 11 Aug 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ewvpb9m0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E902D77E4
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917455; cv=none; b=WX/J8KyUuVLcjkKm9l4FcQONDRoKDgexvuD+7dZeJ/iZz4W/f6C2l/wOKY/6h7Xhvxv4ZVYvYJEEiKKj2sPOgvtYFYScQT93ammXDYE9HeQjR7fsDUQ/g8KZfPHZx7rw8oVqPJ1c7OKD1x9c3P6AnxfUleA3t8nexbjlU9ru/Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917455; c=relaxed/simple;
	bh=UIAv6R7dgXimPGt0N+vkLUJHGcilgggiS9Tp1RgoP0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ku94EgZtFL2ViFFldaCvPshWNw2OlQf8/HU7Z6o1+bPwUAWd72tQ7rv27vX2ae05uF+dT8dqzfmzDQYibRexI4RO1AjY46+6neitsO2uW/mxYdbPmt0ncUabGhmlucpmOTY4tKBEDWQUsZ/uFKdTIqILt31lFbSJrIfmWA/6x+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ewvpb9m0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso2658002f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754917451; x=1755522251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOGdI0qcS1DuMMYIZAl6Dd0I+M+1ceI41qmsPEwfMrI=;
        b=Ewvpb9m0Z8/E1qlANN2o/B3QNu9ISTxk5YUVcHPVIkQxfjSzHG7fnZWfFfvHBkkS4O
         IfBDURXG53stH0EKRG5djXNStBn5LjOsvVWLNlRMs8RkSYd7Szb52NpRLWMLOfnSd9Mg
         uECFk6W5OpsOKBNeCRa29PRAETn+ZGEXb1fNViJFBbffxhuxEDOXBPJR93Ea/aDwQF+x
         gN54bkZkTQZ/julv3XIdRPeEyuyTUuUq/KdkeX7dkb95j7TlPEgONKShRMId9IK+6W1D
         dHNbWWUWCYF5sgWmsum/bTfxlbNXpGlKg/oIinzVtiD4V01zzH6v27cOeTNlwGJcwcy7
         jThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754917451; x=1755522251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOGdI0qcS1DuMMYIZAl6Dd0I+M+1ceI41qmsPEwfMrI=;
        b=Tx2CppnLgKkVhbtSCo4lax4OUCR4x+ZD4FzxMPLl8sJOebxmxu2k/eQnSpTeJRiJo/
         gWRfazUN6rLyWq/wWfp6Th14MkAGCqcK+di1Rc1OTsN1pouQ4Nlzv/fwn0ugZkYb75+Q
         pdlfGDaaFdX/RCPPrbj7ppc51xcKDmefpa8fnSUfSw48yqzGPNzNvtUAg6+xFer0/PXf
         UIgPeQj9KDc9dQGVh7vIimerAiZRDgFAFwNlB0jaJzNgjRqGBzR1TnNCMw889hr+yMAn
         UBFFxtIMp7itJWQBbbnDKJ73kGaLN+pVcvY1AUFbZqzsv+a9CN2FYx7MwSc/s7/TxnIg
         KDMg==
X-Forwarded-Encrypted: i=1; AJvYcCVeTx8at05E5iihdrkeVWCNNlvnoyZBHDUZFItBw4AuTT/vbSDTf9U5AUQNCqwxKcEysvzq3g200cZk@vger.kernel.org
X-Gm-Message-State: AOJu0YwKX51bPYHhZ94/iLY/rXBXWZEYmAFIIShOmoVfkXuK7vlM0JJW
	j3Ib94rm6sISy3wdVBdaG5lSbfGKtd+fHNYBmQ1Ms2W9qNFLLZzsWq/dz5rpxRBZUwjWe+9xcBa
	CWGmw
X-Gm-Gg: ASbGncs8FG5BGtLpvDC1cWJW/85c7Am57T1Cz4DrF7axaOdmejpzC3SATwzao3dcdcN
	FLJdOOpIHoPMdexBkZJpJEd2W+vV5GMJwR6ja5Ndy2bDJPX9kOrgHSsDc3ktEuPH97gw5Fadm/N
	sjKD4jiATmgID2y2zC8+JXGk/GDD+oSm2jSHaWiczUq1J0LWWWzu4c5uwtp0hHsxi7+UpDYL8U4
	M0o5G1uprOH7NkJoUF2YBGtEAiNwer6ba/Hnj6VUga0GeE/3pvSoB29w8ZsGTimYfYxGEyoONqC
	ybf5JPGQpvROadX1rf7z2t+NBldCiV5Rc+hgwJfppA5HGMJNG5wlSQlw7gSEaJ/vLOXKDDEyEA/
	gVgscgoIz5FZoyynvhoashByM
X-Google-Smtp-Source: AGHT+IHtUbLqpcg23VCQmTvH5m2lShmq9cFbBS5x0r30qI8afvacXVE3h1Mdirh1FpDghLktqygdCQ==
X-Received: by 2002:a05:6000:3111:b0:3b7:882c:778 with SMTP id ffacd0b85a97d-3b8f97e1b4fmr13538412f8f.17.1754917451367;
        Mon, 11 Aug 2025 06:04:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b90a64318fsm5400195f8f.21.2025.08.11.06.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:04:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: TODO: remove the task for converting to the new line setters
Date: Mon, 11 Aug 2025 15:04:09 +0200
Message-ID: <175491744673.53661.12726233261625402174.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <417af7e5a110c527eb759289bd5d2fd6885f4e01.1754917104.git.geert+renesas@glider.be>
References: <417af7e5a110c527eb759289bd5d2fd6885f4e01.1754917104.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 11 Aug 2025 15:00:01 +0200, Geert Uytterhoeven wrote:
> The task is complete, but this was not reflected in the TODO file.
> 
> 

Applied, thanks!

[1/1] gpio: TODO: remove the task for converting to the new line setters
      https://git.kernel.org/brgl/linux/c/6ec4b94e8e959b4201ca0bfc43fa50dc946d10cb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

