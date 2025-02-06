Return-Path: <linux-gpio+bounces-15452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB6A2A861
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A881888F8A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E48C22D4F2;
	Thu,  6 Feb 2025 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vf9nOdLF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C81F22D4F0
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844546; cv=none; b=o9EgKrJ9JiHP7S/UbiAT7PXwi2gOr/BbGM3RuBkynjtCWzKKOr943UT+nIs8ZQ94uWQOoeswL4vzyWkcGfkf+6/5IQpDgi3N273c9vGkN/AtmJ2/4vq9RDUkglR4GTHgHv6m41lIYzaS8pmdHTVhiU8RRGWYohXNYq3wqm26zT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844546; c=relaxed/simple;
	bh=YlPGh4pmtCOE7xtDJOAWZkfON+rqq1FB9jCLbTzmsKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFbAxSpQu7I3OG6EIZ/kSFmTNdUNFbBj2eu5uQeCYrAFzJA7Y6ODNBjwMe+UT6aUindfrNDnwfWTdDX37tZEaR9Ipr7r0K9w8DpRo0QuWXXPNXhoyZ9MRLcuwxU15yDbv1h2DBWqYDCnHDVenxcMz8nGm5NhrIOIUCqReHM/ngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vf9nOdLF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38db909acc9so590836f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844543; x=1739449343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd1C+vo1v2WCKXm6pVEB5dHLGqFhuSBFksocLigcO0c=;
        b=vf9nOdLFKy8rTTimBHbERDYVo0wK/UE734WSQOrHc7uMDASMmuMijZSBVb50r2Z+hE
         o6yDZSvaqQRr+TswOp/CiLnQenmEqrRQ0UQ7ivUJrWYyNuN1dKB7GXTCnXMx4obTJApC
         thM01qhsHycGc2FZfGQEclzcMuNwoqGoA3YXrFZSrt48j4nKxhXVB/Bo3oxH5JkQg5+g
         1WcF4J9JTOgR8TwfpmE7y5sfn7V5V1SdKzdzvt0I5bWiuJ+QHTVzGZJfbElev4hOXnDE
         1PPqyX/DpuaEjrEW+kMW8GCizUN0bbzrm1NrSpqoX9BlrAIkiOddDklkbcoB0T30TJ9a
         p7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844543; x=1739449343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yd1C+vo1v2WCKXm6pVEB5dHLGqFhuSBFksocLigcO0c=;
        b=GJJQvm/lhnpm8BVgm9jOCxeHHPNJZ6AvGtZPQzrsIwI9HsK//yHCNh4Z+iZHEx0EXR
         34T5vSn1fkA5FbEFFWZ56S/SLSUnfHV1i+24guos2D01yyChKAkSdjF2V+5peTfGIyBJ
         mKqIM4KBJWX97hIF+onoPQVvO98heF4YKTE4+uL+vvfxx6x6FiI7o+i77HjhbhsygEpx
         lksaG9xGe6CsJA76oxsdoC4wzOR8EkzLQEeYCFXwxnSKTyYQQXDfFCWWR7EGdqj8EFny
         h/dZQf45cILoiL8ewMJ3EOOMuZIGsnF8pNn54UbZ04taZ/7l1ZpaN9V+ONBxP+YRGvgi
         PjCg==
X-Forwarded-Encrypted: i=1; AJvYcCUno/qbJFD76JUv/vJy+Fies8dkgFgGOkUk+TZrn+YcI6vrztMmJ2hkYvuNn9Bi+h5MSQShdY02fme7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdfb/AmEV8UL0Et6wPhy/HHGujN9nwxQ8UAEWSzzZii/xCmYGs
	jE1AMqolZekKrHxQ0Dpm2evx2yLwbTQbdhJZ0oxMGnRLmiTLtSgp7KLezaG52WQ=
X-Gm-Gg: ASbGnctqiluxCphDRx7oGJK2HNMaSXC2pr5T3XVQgGA/nGViQZqnANJWvPlxZSwOicU
	oVwuJkVzSfuM3trPlS+2jaTU79l4gHL0gQk+RrE6yAa3lg/DimMM/i66ABK4mar5jAkvQblIi74
	jIwifow9z32v0cBM/yuBSBiRmavhRCWlTpWbBhiSv3ZsKCr/fYzJvoOfXF87JBusWImhO1tztYB
	VRnJS4fY0eEfeDzv9yfmZeUy6MacihZeVjA9ExfWiOx21Ze5tleH8CIxDXs2BUM5YdLaOpFjLgN
	+iVYCg==
X-Google-Smtp-Source: AGHT+IFvsvMKBfxHRzcqZ/ayXsoPsc+ctQ3ORl+O7IinL+vgD3xFq8YvN076qV0UhVHgmW+n/6z61g==
X-Received: by 2002:a5d:64af:0:b0:38a:88bc:bae4 with SMTP id ffacd0b85a97d-38db48bdae1mr5006501f8f.18.1738844542624;
        Thu, 06 Feb 2025 04:22:22 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:05 +0100
Subject: [PATCH libgpiod v3 08/16] dbus: client: tweak help text
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-8-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=835K+mlZ6UrS6q/DzaKsErP0FTSHQFLlFsXsvDQEKrk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlys/p5RhROCQKCQEoDXM3eahMHNsIAZTxcH
 5NT0tIpnAKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcgAKCRARpy6gFHHX
 ctD0EADf6pkpBiLFgfTQXDlve0xtdYoetn0XaOnGVvZ1kpezDSpuV11nrO4ksvzf+g+pbzkGqA9
 I9+3Qy1zeS+kFK847EqxlRJigZ7u0Zd220ZAOs5Qr/I3AZ6xKvb4Vd1fXfHrBfqdrsfHz76914i
 ark3GIp9H6FyQA1S4+w8u014NbQ1aooNcE3xk3oCxK0JpYxpa43QSGndrS3SALchaC2w3zWgrAO
 61Rl4MqkcTUjLQ72TU0UKwbYPV8lw6PgqoNekYaBNpG41UStJbnXFiSYspq6ORuGBlwpxTBwCbV
 vBjYBUc/yBH4Koyf0fqfj88T8NVf8lyApfWZ0yX1dyXGeauwZD5uKXJTikeP7/b7mCQUKPL457N
 DQzDU77lLVUH/MPnTA3sfcsnbFkzjWTPhtAmS0XJprY/jLnPSFXXqNaLbDslHsRLEThFN8TQhVS
 T5lFzx/D8aAN20jzAyfwgs6JPHbqNSJQKxSGWyd1cJvB+DqKpyDww0hwOPe2gysO5H4iHuoZtQi
 Qtsqukh0w4WsZ0j16oMcdcCkfX5nQTYxwjVAPm80+VC/Ux5sL6kK2xQnOdCCNxHmjdD30Zhjbz6
 mPDZWHpSzmHlw6D3gopuNgL0/yhOmmzPu+EsAzvdaEQAl11wVFMbCJcmfEceNRM++dXnjo8qhj6
 7h3g4mn89Y6vchg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

help2man struggles to generate correct output with current help-text for
the sub-commands section. It doesn't break the lines correctly and the
resulting .rst generated with pandoc looks just as bad. Tweak the output
a bit to generate better man pages with correctly broken lines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/gpiocli.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dbus/client/gpiocli.c b/dbus/client/gpiocli.c
index e9ab380..26d641b 100644
--- a/dbus/client/gpiocli.c
+++ b/dbus/client/gpiocli.c
@@ -107,7 +107,7 @@ static gchar *make_description(void)
 	const GPIOCliCmd *cmd;
 
 	for (cmd = &cli_cmds[0]; cmd->name; cmd++)
-		g_string_append_printf(descr, "  %s - %s\n",
+		g_string_append_printf(descr, "  - %s:\n\t%s\n",
 				       cmd->name, cmd->descr);
 
 	g_string_truncate(descr, descr->len - 1);

-- 
2.45.2


