Return-Path: <linux-gpio+bounces-8146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF992C35E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 20:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6D9B1F2325F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C6C180046;
	Tue,  9 Jul 2024 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQbqTxig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A21B86D8;
	Tue,  9 Jul 2024 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720550368; cv=none; b=VicHInCUEfOXkFfmPY4fn2fbuuO0Ju1VJ8+t0AuuPIPsMyk9FCTwHV4QdiUNBWKAkL0DFY3FHF2D32y1C8jfw2IqE47ec5C+kffOcSR4GjtfQGmp22byeJ8emBGGclB6DGsqiNke+DhVttENDta+QvoBEqScMDRWmZwVRGzq37c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720550368; c=relaxed/simple;
	bh=GuVzNLsoQwJbKQVwyFFDE4OTya1MyIR+LWxxvZmGsxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZNP379GMfBvvR8vhapnP6Ba2vexW1h/Z7vUyVNDpDoNOg+MvJ7aS1wJoxyxBjNOrg2CWacXUecY8Cv/AjbgOnYn45ycfk1oi+7tpenmngv1Ym2+E7Xh7/0ATxXCsepZ7NpO3HiA91azt1ha732O3pR22k0r+50dEg+RNBQpBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQbqTxig; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-36799fb93baso3714459f8f.0;
        Tue, 09 Jul 2024 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720550365; x=1721155165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnXLCo5LjE1ZlgJSfy+TjflOFTnxFUmr8lQoh5O2fgs=;
        b=RQbqTxigpDah2lmQ7GIkq2mNrol5WXoT7Ao/AxmlsBn6Qmp+KLNQjRcT2oSA6ZWOEe
         Ra9+zBOXU0VuTbBJ7fr0ylrepE35D5XTnivZWz8HOPlFFIiLphOxUrggrD66pl/PJhmT
         h8gSQnrknc24xJOSK2CosMTdD0B6n9eHWx0mGRozJwfJShvbbCDfet6D4t2RNm+WgJlq
         DlXZz3OXFrqdtN5EhAQru9UAY0T/lZuW4+wbG44QbAVOUzkPTR31jzErhYx62LpFUTvt
         D6E8eapHpFVkJgi2DsKZGruKRQaHu8Zxa3QiSAJgTX25tmJAXYkjz99TGEhJP3qj1Cg7
         90Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720550365; x=1721155165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnXLCo5LjE1ZlgJSfy+TjflOFTnxFUmr8lQoh5O2fgs=;
        b=Ba0P8XoLnjMw/oWFPS0XRsQxJvpfSEDxZZAjf5rz9SmWIR/rFw5cNoGilEWmTkeJZF
         neqrLEiTY+qJLuuaqbD6bDFFIM1az99wzIP1SbNXhz5+xWqMifUDWfo8f43csulL3Esj
         w4kO6/kp0Jwvc+FXtUb2zgIrmEDjqkhKlP2u3oysrcJU+Y4RDG8NjhS9jpnz8LzqYxWU
         hX6CaJ7Rhfj7mil4HVn0777GHefzUbhD+ZjxZV1uppxDa98taMXg/ccdvBjWa0M1f4ST
         PHHGm9V7v70XkZiuano7HMCFl2wBhLjHTjAt0NMCQg5KCzBnCQCIay7ZlwpOK9tfJQ9X
         BzyA==
X-Forwarded-Encrypted: i=1; AJvYcCWSg3VcprNAyC0+cVb2RpvRSAp+AaKJ4TKVQOlHO4bCtn2irGzQE2ySzhyviCG0j81TJ53tPFC++XWmft4rbskb1DZfegSJ4FvY8QXf127iooqNLwasAfsV1a4kQetwJpcSpQ+TJ/Oqw2gjQS/pfX7wxHNcmhCeg7C66/drtPD8ZRlDLA==
X-Gm-Message-State: AOJu0YxD5j03/UbMEGRONFKwyQagvPe7SkqWpEu0usmrpi4bfmt8kDXb
	4KMNPg1zN25nrMSd+F1fZH9HjGdI5V0FWSQsgBq3pkZfm3IdV2Qu
X-Google-Smtp-Source: AGHT+IFd7bwx5sb5axX5KrYBbNNdY99ASqrFU3SwYaujqk+tOLXKqRPB78vy/SeE2h37i8kPZdFH2w==
X-Received: by 2002:a5d:62cb:0:b0:362:8201:fa3 with SMTP id ffacd0b85a97d-367cea963e0mr2147186f8f.34.1720550365011;
        Tue, 09 Jul 2024 11:39:25 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367cde7deeasm3325993f8f.8.2024.07.09.11.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 11:39:24 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: linus.walleij@linaro.org
Cc: corbet@lwn.net,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH] docs/pinctrl: fix typo in mapping example
Date: Tue,  9 Jul 2024 14:39:19 -0400
Message-Id: <20240709183919.3337131-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marc Ferland <marc.ferland@sonatest.com>

Small typo. The device name in the example should be "foo-i2c.0" and
not "foo-i2c.o".

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 Documentation/driver-api/pin-control.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 4639912dc9cc..27ea1236307e 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1002,7 +1002,7 @@ it even more compact which assumes you want to use pinctrl-foo and position
 .. code-block:: c
 
 	static struct pinctrl_map mapping[] __initdata = {
-		PIN_MAP_MUX_GROUP("foo-i2c.o", PINCTRL_STATE_DEFAULT,
+		PIN_MAP_MUX_GROUP("foo-i2c.0", PINCTRL_STATE_DEFAULT,
 				  "pinctrl-foo", NULL, "i2c0"),
 	};
 
-- 
2.34.1


