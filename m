Return-Path: <linux-gpio+bounces-22471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93EAEF483
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 12:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2B6B17BA51
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 10:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1921927055F;
	Tue,  1 Jul 2025 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGQkKZ2y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481EE24466E;
	Tue,  1 Jul 2025 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364361; cv=none; b=mIf6jYhmAL1U9f3BdHUrWpyyF4qbGwpmXP3LrDjs5m2DOTJhOQBUjLXDpFW6fWKxoZVGjedWMxKJAlCriZrz3WvsvVQfRLe6fwxuJeU2jozxTUMpj3n8453L1xAyaTGP6xTSeyu6QSjSmeZX0MUK01tlwIW4Tx0Y/8HSkfm0wV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364361; c=relaxed/simple;
	bh=431mVV38AmwRWs9AhD2EOxQ+yeHfx1PC9TaLuE9GKSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+5JzTsp+zsgRWCpJdN4ttxG5GvlAZMoKMPHxjrX8ab1j+xoZuFGcGRvcnbQMGEgWWB/nCjPSXu7MnRLpYMbg1s3svJo/ZpX7lbgL+sgJDFxkaPhCUvYWGog1RQZQ+2acSIm9g+mdwbH6JOtSF0r3+tU2JlOzxL6ruRYGS0t+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGQkKZ2y; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so6403256a12.3;
        Tue, 01 Jul 2025 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364358; x=1751969158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRzWTd31z5NgMVNxrwWmldTdV4yQ0MV+geV1WHPLNEg=;
        b=TGQkKZ2ynzxftEbjvAHO+69zGl2LJST3zJhx3T1+/CLcrfTBWwG98+NGOlbwBiFCBF
         LKDJwjA37PVXkCK9zkpI2nJybsPa2so98XsqyLqVzFBP1hjyj2Uz+1EvxKbKVhW7x8Kf
         dowz2s1zXg5FgLeHpeCPZ6joxbc3oq1+R9Ry1FGImt41Ll0DR2sKVqUx+/eHkmRpAgWk
         kn0KSybQnRl5S34Cz9M31pfUZX+rstrfXw3rKiZmzM3TY20s0O+9Cr7yl9+Y8mijQQgS
         /khkDjLlTqtCi/pjmnQ+hxkBvsVBD9aAtv9OSLaJg7XTYw7MPKUo2d1SBeI/sPFEQLmC
         kogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364358; x=1751969158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRzWTd31z5NgMVNxrwWmldTdV4yQ0MV+geV1WHPLNEg=;
        b=vh0Fsm+SplKStOkaG6MzF8mAXWhyPdYPnMYRYHXuhlX3TKMKUrM4oAXbhhNufLrPuE
         OScjsMIvaV+f9TMwxUPrBEu/kxgkzcdzbwWmahzZf+ET6ndPv8CEt58C09CxbwunRyg9
         L5GS2eweDBoiFynDk/rxU2ZOTJ1cUNiUiDIxooGPETQBSYINIK1UXCnnhsOG92Rqjdmy
         lf6/45Qz9hmcObpdjXvZn3cfSNjKOszfxi9MEcjWVnOVwsEZ3Hw0YsQKGWeiSS5m85Wr
         qeJvGiXwDSGSsW9nrYHAkaOfdCnYSXdUIiCEwUFpmps20sipC3e0djnSsFyWihUtttPH
         Y9oA==
X-Forwarded-Encrypted: i=1; AJvYcCU7h9tfmo4DUeTmgMb2Aiq83fF5ubanI2b7ql4y0/kk3MXb4o+Tay70Y9ohpQkNjJUNkVO/DoxG42CL@vger.kernel.org, AJvYcCVMYsZJp0mJVXMmiZExXCrEYusoUXUnB5jtL4YebuRr2ta8brHdF1R57941o11tj5fyK7mI/JPaoewlFCAj@vger.kernel.org
X-Gm-Message-State: AOJu0YxAYsavsziVFlNeZGQqp9lY811SbZ+pEX1v/Pbh3GuTynGzfz66
	p2nzM5owc7SQZ84+DdlGYs3WIyGoPx6wtz995tRJF2NiVSwuBAqrbtIdhNjuBdIMBPk=
X-Gm-Gg: ASbGncsAgTwiaanQLvtM8Cha8MqebZO+/10ah6FquFeiELNGmQbksDnAU2Dlklo8BUA
	uKbU1cwEXP2SbTw2fDHyypUe+yLZifzWwvQPHyuSQwMEHoRzC+ekpg9rEw53iimqJYfcELryZS6
	xjuOCg3SRu/eGo7QRBkvlbrOBg/90soj6OwHRxvf5KGs4uZb72okvQXe7UwC8PHeERk9r6G8fOW
	Ovs9W3YqYHPIVQkmc6OVMkssDN9rawDSWv/PGVE1UfwS8W0nmGwCgvEn0SNrksp2zXXub2cWkOi
	/pCrwgrwH3kgiloW1eoHlPFp1QkoqW/iUtluK0scKTUxDkUcdBqgsj4jziXUidb9uFoFLrh4/84
	dI3p7CAp2+L6E8u/0fw==
X-Google-Smtp-Source: AGHT+IFrjWljQzlYwYSLPauhXdqTs/Lh5w2oGzwdkYJIvNXAkrZsA4YpW8jXteoeqomOnHHABuVvWg==
X-Received: by 2002:a17:907:9408:b0:ade:316e:bfc with SMTP id a640c23a62f3a-ae34fdbb622mr1612568666b.21.1751364358156;
        Tue, 01 Jul 2025 03:05:58 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a15fsm850718066b.55.2025.07.01.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:05:57 -0700 (PDT)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Maria Garcia <mgarcia@qblox.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 1/2] dt-bindings: gpio: pca95xx: add TI TCA6418
Date: Tue,  1 Jul 2025 12:05:36 +0200
Message-ID: <20250701100537.91491-2-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701100537.91491-1-mariagarcia7293@gmail.com>
References: <20250701100537.91491-1-mariagarcia7293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TCA6418E is a 18-channel I2C I/O expander with integrated ESD
protection.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
Acked-by: Conor Dooley <conor@kernel.org>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4d3f52f8d1b8..12134c737ad8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -68,6 +68,7 @@ properties:
               - ti,pca9536
               - ti,tca6408
               - ti,tca6416
+              - ti,tca6418
               - ti,tca6424
               - ti,tca9535
               - ti,tca9538
-- 
2.43.0


