Return-Path: <linux-gpio+bounces-15470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2D3A2AF35
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC381663CD
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 17:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26A218C930;
	Thu,  6 Feb 2025 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB9QRO6q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D309175D5D;
	Thu,  6 Feb 2025 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863969; cv=none; b=SgHWuAjMyzdrn1L6aq8jIttZCoMuMRQ5ukrswUZKjsVK8u+ZL3gcUq2AcM370imDr2mt7QiXazgNJUQr22yoSto493CuJlEEh5p3l2xfZ6tw7DXvKSHzf2meR7++lemcV3BwnSfjJsWwfyhUvivR2eRlOrKjuMcD8z+swCwKpvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863969; c=relaxed/simple;
	bh=4cH3OF8DwU/eQ2UEPX2bm2kZTFQqV2u8XRjjaXF3oqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SmQTL/cNBTsxtaBj5RQ+OD/pBEVkVjpI45n2qnZln4nwnzxNvzzj8Y9xNJlYSSbVbHO+9z80pjAnWpqc8/jJK9GudZChC+bwsAi8gmO08U6C9FRuINBPLeryVTkZHIg4A8+xv0SzgW4jmgEpwO2z2E1QMOnL2JCBv1CZdr5W/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CB9QRO6q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab69bba49e2so170009366b.2;
        Thu, 06 Feb 2025 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738863966; x=1739468766; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHroXnN6+A/qcPmY5/Cul2N53JgpzBlhK1vjtF6DIjM=;
        b=CB9QRO6qm5Zz72Q0LeqMkn9LCtvClZPD9QxJ3P2VFC/InkebI6jC6UQKMXC1CARHyH
         lOqFsdbSiL8FzYgV9vhpPCqiG1kzzZ8urjYoBhco45mAVHL/7qHuWyFWj1WPK7MvjtgN
         pnElz3CUOXJPttZVJVh/A2YeBXWk3uvwltq/Zij5lmkIF7sv3s2gAmaAKnRB8+z9jnfg
         TV56JPQ9oHmOnpqHRQB71YVVoNt0kqm6gBtW2d+BKVDZ/a3bPkP+xdW76b3U5lqpzLIT
         UWfFypkuNidib5qK+fynaR97cQheJY6or22OYXSHi49623p90MfKK8xJLXu8Pw4um/0q
         YLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863966; x=1739468766;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHroXnN6+A/qcPmY5/Cul2N53JgpzBlhK1vjtF6DIjM=;
        b=eEufzRwK0aAcTGekN2REVs04rm6gm1jySSlXWeowgFq1IKTNynjRDX096C5E7I0v34
         whIjNYPlDWf8mlpSGEIxPQ6ei7/6ISaCQTgYR6vKDBAegT4U2UT4+8h7QG8Af0pOMSi1
         a+sKCM+H0U+33Xfu1OCvvOUj1I7tiXY8IbPY6GNiaS5BM6RbgZLMKXIyRm3e1XgMQ3Zr
         OxH7PPX+2rsJHuFpNVvc5de4bOvdHyC4zfI8/FxnEnLz4TmBIAoqgJ7rUJFAaBiV5Wme
         PBp2wbW6n+jR5yyhs13NSEFtFuv46n71sHMSqYAqjI4WcLj8yVGJLJFLrSMPYuFzTgpa
         PwjA==
X-Forwarded-Encrypted: i=1; AJvYcCVNOQVTR2Wmq5lk/XTHOtYZxi285DQMDhVEhJXWrQVAS3qKb0lSccM7gHvNH/fP22jZxjMnZ3f3bYsxLdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YykUN5cG8ZJOFc8gg1w0j115dCfgC06HvVSyH+bZv4DYiBjER3M
	FkfpSQGLs7BTJU5oL/HptTNQla0ubLPeIOWERTPH9ddabSW4tDt1xCRp+Q==
X-Gm-Gg: ASbGnct5+60WgiCQTjHt7sGKMRtpXrHDIYmuvlC69zJiShJAuCICgapu2JOsRReLZb6
	X7TDE5N03GVnIGz5NjdO7vFxuC7p+JQUuwZnwPsEfttsx1m4axwA0quFB9q97QrOV0yp99q9ccu
	Skfv5T5FoGhqR90Wu8cXENV7LEyBqsvSrbRmkdwTnBh2chEGwDuRpSnTkGyt2Ifatuza8hAY7vD
	8wuueiphwC2kyLCn98tfcMhFWyHWN5Plcmk5diQ0MEeIsrZgUr74oKqlo1rA58pDU9Mp+3EWXAS
	pz15hB9aW6cUchzYMc7DVNKImpSBfHCl/wAYD/aChr5XLO6v7+8zmzlu
X-Google-Smtp-Source: AGHT+IF3onXW41tRVMGSbGVqiCvz3SThQKFAV169eltGjsmHzjLT8SG14Bpzi6xOv+XVLU2LCYo3zA==
X-Received: by 2002:a05:6402:a00e:b0:5de:39fd:b309 with SMTP id 4fb4d7f45d1cf-5de44fe9488mr730840a12.4.1738863965573;
        Thu, 06 Feb 2025 09:46:05 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fdb84esm128911066b.80.2025.02.06.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:46:05 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 0/3] gpio: bcm-kona: Various GPIO fixups
Date: Thu, 06 Feb 2025 18:45:59 +0100
Message-Id: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFf1pGcC/3WNwQ7CIBBEf6XZs2sAhQZP/Q/TAylbutGWBgzRN
 P13sXePbyZvZoNMiSnDrdkgUeHMcamgTg0Mk1sCIfvKoITSQl4EPuLiMKwcceQ3ZTTUXrXVZOy
 ooFproqOo0r2vPHF+xfQ5Dor8pf+3ikSB3htJYhDOUtuF2fHzPMQZ+n3fv+f9VrGuAAAA
X-Change-ID: 20250130-kona-gpio-fixes-6e74595e69f2
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738863964; l=1396;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=4cH3OF8DwU/eQ2UEPX2bm2kZTFQqV2u8XRjjaXF3oqk=;
 b=czuWLu9j5rb0D3wa8rZ0GP3ivT+Y3wDHkw7xV3ghBFsUTAPHY8z8aNmdY/LdO1Rf+boHRzfDr
 sedowbaLbmuABBfujAKr6IiK6Ew2nQxFp3WAiy1RHWrGaDYhaxN7Awm
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Fixes two issues that were preventing GPIO from working correctly:

- Lock/unlock functions tried to write the wrong bit to the unlock
  registers for GPIOs with numbers larger than 32

- GPIOs only initialized as IRQs did not unlock the configuration
  registers, causing IRQ-related configuration (e.g. setting the IRQ
  type) to fail.

Also includes a minor fix to add a missing newline to an error message.

Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
(DTS not yet in mainline).

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Made the unlock count code cleaner by using increment/decrement
  operators (-- / ++)
- Added extra comment to relres function to match the one in reqres
- Link to v1: https://lore.kernel.org/r/20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com

---
Artur Weber (3):
      gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
      gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
      gpio: bcm-kona: Add missing newline to dev_err format string

 drivers/gpio/gpio-bcm-kona.c | 71 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 13 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250130-kona-gpio-fixes-6e74595e69f2

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


