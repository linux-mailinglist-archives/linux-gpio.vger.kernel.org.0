Return-Path: <linux-gpio+bounces-24716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868FB2F199
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 10:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED7A816F1C5
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F172ECEA8;
	Thu, 21 Aug 2025 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+4OQlXJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC82E8DFA;
	Thu, 21 Aug 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764258; cv=none; b=el/k+YKJhlv7Dil8kdS4VkGk9reLOzmmsgchrurr6lCnReIb03U/oGAUeHfUKctWCMYianEVHI7+6GGcs8jlocDiyL1GIhM2ygWUUgVjxT2FHAH9nvMx5AtkrY0a3ILTTKoclz4cpGtq5XVVSUoSJvbiRXbLRxZQGSV7LAe36mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764258; c=relaxed/simple;
	bh=jA8IdkvzC8CLwvkvJxl3VTUOEO1U63oW/l1fT2bYNps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rrgTayEprO8l6izJznxhTXXdwunnvDi8C0mfDtXo0SALm00+hYYjGr23Y0nXdN4EWJw/2J//rhRgTJ3N0lKtRHdJUHiGOyqbXtKV7Ze/9HabFl4q3oflbuxlUvfdKyr5p9RqdHBPcqVeI37sBVPnnLH5ax7TwImkEKR3R3Oqjvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+4OQlXJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333f8f02afaso6079081fa.1;
        Thu, 21 Aug 2025 01:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755764255; x=1756369055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPnVumqWQ223sHh8vBItVvRtYFf+eJEtr9i3KK1SjC0=;
        b=D+4OQlXJ8VqIHY6+elx8BAv6vqWR8s3k9b9ThX+GuxHCN9hKwrjs+zGY2GACJxaErY
         UgmNvMscm6JwdWssW44DXO3ihL8GwL67jRa7DYjlGlfP+QPlQ9Z2HjTAynh3aMaeFYZe
         PIdSOKBwWrfkwLkyy0b627ZO9nE5o8ZFBd5pnmdgfZ6d4EzKc2SKbaltiEiv1DTBvjFu
         ZevXfeNRxZn1coDs0o08ocRXH9GZObST12y5zI7XjWDoOA8Nkss3aqBpJopEmdEzB2FV
         vruwAN9fifatYpTW9YoZmSQJBe4HNW62LhHq6jedYwrKoSnvcz4XMu1dgSeTS8A1ZoQm
         LfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764255; x=1756369055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPnVumqWQ223sHh8vBItVvRtYFf+eJEtr9i3KK1SjC0=;
        b=AoeI4VbSUAuKXNBckFw50jwawY8z/Sz2Pb4hKLc/4sKgpiTS1JjLHmZGvJEcO7bTVX
         KmJMQ/n1V4FhjaYzeQNJjxx+qUjs+RNW6s9Z7TOAbw0g3dOhHyYcpkfWLZkqgdtUsLlq
         IIqciahUrNcX4QlmVJmMzafF0NVNaT7GqWeUIEZ5Y0/uFsSJ5S6Z56xAmR88nygGVhWH
         j9z//hwUvkyfUHBoI8KbwjQ6EchQ/n9irm7lPCRkV/UU2ghMmEQ36HqSWBR+jOCN3e33
         OrfdHYxWsm/6CvpmgDYHnYka+gd5L0j4rF0MtbJrrW2bQUq7+Wx34BMRqBLvfboa0+RK
         fDsw==
X-Forwarded-Encrypted: i=1; AJvYcCUILRM99+bNrIIcmE4RWBDb7oV0rdJYMxcXOW26j4JZwu82mO0OMvg7Nih2kc53CcwYCfiCEE+CL+Bg@vger.kernel.org, AJvYcCWqtYdQv3NWG0/zN7h/5GxXFvuCAGUIs29kuHPDaC4fl47ETxgGHyZRlHxqW5grmXlnMLqov8woby/DjXeS@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeY8lB+WAOu0JoAhjiRYem6YpBRB/WgjEVZiGT6sHPh4B2fp+
	yapLmd37T/Sh6pazn1cGHz3Df5BSERmNZrFQtlOoqLv0zTPBxJGq+Ge7
X-Gm-Gg: ASbGncu9vWNPBEtoRkdRCXLyi7lmPglHm2sbDaLjWVDPk0AI8Okns3ZCGTf0g/KkftJ
	MDWPeEu/G2L40g/m+t/5VxV2Fx7F30tca3bAMHG4FmC07HUgWFJcj4C8G42e1NYcBvLJ3FY/riO
	h9yq7rPBLUpkmJs+XN0lY+Oxd7ONz+S+ULQ8AMeOwgxo1Ozp6zKXFhvUiD3F56jCuxqqV8RDGgD
	M4bUGR+x3dAco7UbCycjrggueqZimTRY+nilpkm4mmvrUuhy4xBCYS65jz5IsT95EmMAFJzPR3e
	dU3XtSgLsdVX/rRpDenSSWC7+kua7jnpjUki1yo95i/v/brR3pxsNhVCj3IRNrdC8N/ZefqhPCj
	RlPFKzqwtyBKCDFz/EZ3lCsHxUSnsRuI+gg==
X-Google-Smtp-Source: AGHT+IHxZ7LiYmOPnV8WSyL9zx/Xh0P9wTicckLYiaPLyKwcU7r+WegAHe28lYL0GgCTH1/JEgItRw==
X-Received: by 2002:a2e:a541:0:b0:332:5fd5:e3c7 with SMTP id 38308e7fff4ca-33549f757aamr7127131fa.33.1755764254607;
        Thu, 21 Aug 2025 01:17:34 -0700 (PDT)
Received: from NB-5917.corp.yadro.com ([89.207.88.242])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a604776sm30713311fa.47.2025.08.21.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:17:34 -0700 (PDT)
From: Dmitry Mastykin <mastichi@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH] pinctrl: mcp23s08: Don't change irq trigger type
Date: Thu, 21 Aug 2025 11:15:32 +0300
Message-Id: <20250821081532.3084159-1-mastichi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IRQ polarity option "microchip,irq-active-high" not only sets polarity in
IOCON_INTPOL register, but also imposes trigger type to interrupt-parent.
Trigger type must be taken from device-tree "interrupts" property,
otherwise:
 - trigger type in device-tree unexpectedly doesn't correspond to real one;
 - it's impossible to use inverting level shifter between mcp and
   interrupt-parent;

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index db3d616abf93..824c3cc6a6e6 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -572,16 +572,11 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 {
 	struct gpio_chip *chip = &mcp->chip;
 	int err;
-	unsigned long irqflags = IRQF_ONESHOT | IRQF_SHARED;
-
-	if (mcp->irq_active_high)
-		irqflags |= IRQF_TRIGGER_HIGH;
-	else
-		irqflags |= IRQF_TRIGGER_LOW;
 
 	err = devm_request_threaded_irq(chip->parent, mcp->irq, NULL,
 					mcp23s08_irq,
-					irqflags, dev_name(chip->parent), mcp);
+					IRQF_ONESHOT | IRQF_SHARED,
+					dev_name(chip->parent), mcp);
 	if (err != 0) {
 		dev_err(chip->parent, "unable to request IRQ#%d: %d\n",
 			mcp->irq, err);
-- 
2.34.1


