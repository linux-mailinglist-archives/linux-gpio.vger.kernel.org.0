Return-Path: <linux-gpio+bounces-23575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62570B0BE62
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 10:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9DC17C657
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 08:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553E5286D62;
	Mon, 21 Jul 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="oSU5Pohl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D19286410
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753085066; cv=none; b=Npm3meQ9QntftwA9/+hhM1n0lh09s7q8BbdOtKnEoaDqoW7cfVRpAP7crQv0/ST5BYY5qKgCYlc6uTvkQgjhnNhUUeJb1eMXMwZhgVj2mo1p5jcVnf4sL6SfEWHqbP4wf3etStl7ouf+qjguMeOPDaPH/qJ/KWiORSk9UGGCH8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753085066; c=relaxed/simple;
	bh=stVoPCv17pb7J8SiMdISDMej6sxzwrmrRshh992eXZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H/mLM+qq24JHc+MNWdMKF+JbmTQ4hN1aCWtrDjPxOjQcqfpHKeSK6vSK1L6hLLoELW4EVgdLUPs15iabV/JkL64A0xIZWCJTwM7p0cBWpmT/2UW5MlrzmeKqoXatdckyCL1d3xbD/ksQ05rBscAmYFwZ00Nqgomnv0bkhLluVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=oSU5Pohl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45617887276so26686005e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753085062; x=1753689862; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4Wn94QJW7lbSpyGTG4Imde+JdblvdieBT1Qdv/YSVc=;
        b=oSU5PohlbEFIAT+F7noS9amCoN82VO4Zdzze4I9hUtmb+Im0rZE9esya6lT7ZUU1Qh
         YyzSoMhkzlT8kE4sp0h/rIYzPq253ywT/UWBL7C6Enp4vmQ+VJxStS+SCtOTj+QW995I
         QI0Yn+cXvIv4eTJS/N/0ThV4Lz/OE50wPJV1p+Yq+JLvpFRHKlHaqGcpufKCCDz5uOpw
         wUe5wIwh9X2ZqlNwEJdijNpk2uMazxOb4JP8EXoBQUyZ7byFfYRUgTDIaCCbEG1EW7Th
         3nQdHMYxDxMrn4xk2fWHAzCZDdrsR4yHX0euqGbtKs+zgfpzwtGjlpFG8x6TH7A9Mwv+
         3mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753085062; x=1753689862;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4Wn94QJW7lbSpyGTG4Imde+JdblvdieBT1Qdv/YSVc=;
        b=w3/1vAUDJEACVEeqZpqDVBn581Li2TFMZlUTvFhUMk7eW6HbHBcqh6fzAS/1SlFVJg
         Rso7hDy0EQ+psCVgoP8kiH3JTqtr03nGLBu+XlNbV1b6zljLOFa5AkSy9dCpWNoE0nZ8
         /yXt6EHuEjimGa6V6xk4Yocfoo987VXYCoxO6TEpSIaINOHV76HBXvQFo6jJ47K8l6Ng
         eNh7cKdp4xjo0MWW0pj8vsLNp7ZBXSmV0rBYoURjpLY01xPzmMV0SGNQ5kl/wyh/V8K4
         PFALJCPtwqlXqw1sZhRU2DWTtHAx622O7lMLP7Nk8jx4Yo1Y5F/dSXj0ZC0spmykGlSB
         1WFQ==
X-Gm-Message-State: AOJu0YyCOt9VBv+P19aRfO5xiHBmek579DYpz8aH8aBCz+kRioOLnJDT
	azfCWdPQEDOznF63mT7U3VidftKwvrFJy32MazmwpbV6wD81Q+RgWW/aYZ4mPDUjc01TMqg4xe/
	yVhDk
X-Gm-Gg: ASbGncswAPROEzfJi6YiMDGs8V7fU8+ldz9wGt8GY2Hy/ac0Cw206R5yFzDVMPAGrWp
	3WtJVEl8w8YjkfFUIo7behrGUTa233jL7fOZjBY0/f7noExUduICzjYK74IkNsMhVEsCvAVD1ST
	CqTytODYz81T34WCzjYEteuG8+xWnX/Ajp+k9SUCIXqMSteA//9e1NqQKGj8C0y0fyBuNEQqXhk
	ZSvOtxYjrvNXV8T4Wye56W6ePjASL+6gVWDAy9+jlVehew2yDsb+zB1vXXE7+qOtuMmjhWJ/kx1
	HWIsyOkbmmAEr3k9B1pBfFQyX8TfmoM/ukG6/y804aiirLzOhq5A32CAY9tqUNuorfKnT5R/1mN
	4VGIOIA==
X-Google-Smtp-Source: AGHT+IErd8b7PaCit8lA/3ORUcXy4aBLJd7pc+2lis1haVb3Jxwx6jh9kvRzAvR3kdJDnj5bo+CO1g==
X-Received: by 2002:a05:600c:1548:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4562e392a0amr153877815e9.29.1753085062243;
        Mon, 21 Jul 2025 01:04:22 -0700 (PDT)
Received: from [192.168.1.187] ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e886104sm155305495e9.25.2025.07.21.01.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 01:04:21 -0700 (PDT)
From: Erik Wierich <erik@riscstar.com>
Date: Mon, 21 Jul 2025 10:04:10 +0200
Subject: [PATCH libgpiod] .mailmap: update Erik Wierich's name and address
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-mailmap-v1-1-ee45b82a01f7@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAHn0fWgC/x3MTQqAIBBA4avErBP8QYyuEi3GnGzAShQiiO6et
 Pzg8R6oVJgqjN0DhS6ufB4Nqu9g2fCIJDg0g5baSqeV2JHTjlmgHaRTxks0AVqdC618/6cJEvu
 Y+Qwwv+8H73eWYGMAAAA=
X-Change-ID: 20250721-mailmap-a580713b0a3d
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Wierich <erik@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753085061; l=726;
 i=erik@riscstar.com; s=20250721; h=from:subject:message-id;
 bh=stVoPCv17pb7J8SiMdISDMej6sxzwrmrRshh992eXZw=;
 b=eRpZJ2vXV4/ulSsJFNR3NibcqluoU0OAQsH0uajfGYDLsSE3ulAJcl6ruwsFjLcL4vPvV56oT
 pt/PlyFoVrABJQF6PqiHDOCOZy9/zwewEZjpj2r8oo2j6kCFm9J+8zB
X-Developer-Key: i=erik@riscstar.com; a=ed25519;
 pk=gjm0pD1JkINoNzvT3vC2WZoAWUld0EyXuhsQ/i5Qz4I=

I got married and carry a new name now. Also have a new mail. So this
hopefully makes it a little bit less confusing.

Signed-off-by: Erik Wierich <erik@riscstar.com>
---
With new mail AND new name, I figured updating this here maybe makes
sense?
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
new file mode 100644
index 0000000000000000000000000000000000000000..53eeaadc95954813c2e9151b016400f0dd5848a7
--- /dev/null
+++ b/.mailmap
@@ -0,0 +1 @@
+Erik Wierich <erik@riscstar.com> <erik.schilling@linaro.org>

---
base-commit: e4427590d9d63a7104dd5df564dd6b7b0c784547
change-id: 20250721-mailmap-a580713b0a3d

Best regards,
-- 
Erik Wierich <erik@riscstar.com>


