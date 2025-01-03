Return-Path: <linux-gpio+bounces-14468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 852C1A00AF2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 16:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9B5318843DF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0D01FA8C0;
	Fri,  3 Jan 2025 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8eH3yIm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAA1FA851
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916431; cv=none; b=M9rsO/JURG//5JcdmOse10L0SlLQ8K9X4pgUo86gnfI6uLD99ACGQ6UgLGdChdEhsnjCU+1Tt7y0n4VG20ZUcgAbmUR62kMx47ZrPm3A9quq5xAMJmhb20r7d9+NjyoVELaqIWeXQfX9AJsEGVr+ykWOhRnew3F+2K2HnttJG1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916431; c=relaxed/simple;
	bh=V9Z1suiMpwD3+9PBbeSru/jiQq43sX8p0ql8y2T8rtk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bATH6z5un/jJ3m3/Bca+J3oiva5+T9bDmztfM2CgS6eMDtzvHKG1DTENMLUYQ8LSM3RRXPGahWcdh6ZdLCfEjqkokbG44uQ9hVhRMyUjgxPF9v/kiHKRh7sJRqznc6kTQFmIptQ7Cz89VCc2GDtbtRGjLlsVHOD4GFRc21sHVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8eH3yIm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaedd529ba1so1244162266b.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916427; x=1736521227; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeF19IReda9iN7KLJ7j7lFtZZIw3aDHlHnVxN3GqWAE=;
        b=k8eH3yImmSP+8Qu0ZZGKaqDGwsiGhPrc6gOl8XEz1JsaPRgzA7c+xxUyr4NFnerxVM
         pIV23hNXDPIu7udcv+7LgFvWRlvBdHyvKx7Yw9H17wdUdFy8bjn7cun2WRZGp0nIQqgV
         omevODc3YfcrzjxEvpmYGTwiW4phTJfGIPUH5n7hNPCRuEIX24Rv0mKsQIhmn596q62x
         u+ncVtaoMvhp6y2NAEiLhum/pGv9lHIMBES9GC2w46rQCYaHCSMUkyrui5gzNHIPDdvn
         GsNDx2lT4G50cBQWjXe7wEdzorXEczAuphnmzbDJ65T2HW+LzemAykVyEvznhGd61L8P
         CVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916427; x=1736521227;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeF19IReda9iN7KLJ7j7lFtZZIw3aDHlHnVxN3GqWAE=;
        b=K5F30a5leECBGbv7igvRp65xFM5/3QHiOa2Tw5w4vWWMqE8Sj7OWKHoRpF3fKIcHkr
         423zVpcWyjyLEgs/7t+OcRBiQkhYsoLottiJWioQckGpwvOKU4/PA4N01dGBECbJJnvW
         elmGILZPLiRrrD5Iq7G9NP5XMgGLmHFe1Svk6i+ne7KlQzl1PZgvE/21TZ9fMrB1m0Nh
         g7J1kr/q9wLRB5Lds9fwJSIXx/xNdkvzzyI5Kc4Qien9vcFUFqeg+CVFMKTafZgGCV6Y
         T8MBZUCw9P8bpRmPI5Z63hrcr//F39BVz6y1ctQIT1OHPY3HHmX+/zu7OFwHdH2VM6u1
         6ZSQ==
X-Gm-Message-State: AOJu0Yx1Oi8Mkakg0ARNDQKVcYWoQBFLMSuN07AuCPRCr2cjbQumKVbu
	ej2sKEwhXD1vyNZK/4J7i4++zMSwcnXCiL+2IJk6436b+tmyYR6G2Mmh9CB+wsg=
X-Gm-Gg: ASbGncvs9ry/4evz4M0LQ/dc0mU/Hhyww+8Ql0oJxaptEp+232yNxKvZX6TbIEz9v2/
	vAXAY5QeQhIvoems6GDNemW6gSt9pu5H5LrhoERrye8409UxEUzb/J93mFjehxp5tBqKDudNpPi
	fHKUQPSOKDw0G5+0jeM8swFGN/FEtKFRYLBC/3MplkmiCwAx+nzPbjizItLvhEDJScPhPEFg9a/
	sIxA0sJQdFglLRsYmbkcs1BKF3gJHqZTLOzH7GxV4c9az3sDec=
X-Google-Smtp-Source: AGHT+IEbUnr1AhkkTO3elkEaFpr4mreeV1Q+tVXvl8rQko5Rj+vzs9qkyBJeWAIhZ/Ivy6SlwWWXvg==
X-Received: by 2002:a05:6402:1588:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5d81dd9ce81mr120443064a12.13.1735916427186;
        Fri, 03 Jan 2025 07:00:27 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d5a1:be00::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm693078166b.137.2025.01.03.07.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:00:26 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH libgpiod v2 0/3] bindings: rust: fix some compiler + clippy
 warnings
Date: Fri, 03 Jan 2025 16:00:14 +0100
Message-Id: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH77d2cC/22NwQqDMBBEf0X23JRkrUF66n+Ih5isupAaSSS0S
 P69wXOPM495c0KiyJTg2ZwQKXPisNWAtwbsaraFBLuaASV2UkkUnmc6+E1i5o+w1k19p9GgI6i
 TPVKtL90Anqdl5+BgrGTldIT4vX6yuvh/ZVZCila1Rk+2l9o+Xp43E8M9xAXGUsoPr4O8q7MAA
 AA=
X-Change-ID: 20250102-lifetime-fix-ccdb8562a2de
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735916426; l=1056;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=V9Z1suiMpwD3+9PBbeSru/jiQq43sX8p0ql8y2T8rtk=;
 b=w3lx/rm4pxzpEl7ysxPuR+JqegLp0fzTb7G2Go8FSNTvzQTNBTdLZ2fI6RyJJMLeIMo4WkxsX
 mgsr4fSX4WZA1nyEV286KU9uTnfsyK2pChQigjsNNGhLcGbxXVCFqgR
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

Triggered by the discussion at:
https://lore.kernel.org/r/CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com/

I also found some clippy warnings that I fixed while having the editor
open.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Changes in v2:
- Added missing SOBs
- Link to v1: https://lore.kernel.org/r/20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org

---
Erik Schilling (3):
      bindings: rust: libgpiod: make read_edge_events lifetimes more explicit
      bindings: rust: libgpiod: turn standalone doc comment into normal comment
      bindings: rust: libpgiod: fix clippy::empty_line_after_doc_comments lint

 bindings/rust/libgpiod/src/event_buffer.rs | 1 -
 bindings/rust/libgpiod/src/lib.rs          | 2 +-
 bindings/rust/libgpiod/src/line_request.rs | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 38adbae195555fae2b9d9e2a37c9507af1114757
change-id: 20250102-lifetime-fix-ccdb8562a2de

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


