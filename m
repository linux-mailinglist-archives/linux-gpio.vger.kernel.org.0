Return-Path: <linux-gpio+bounces-7695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29591781F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C191B21811
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073DD143C70;
	Wed, 26 Jun 2024 05:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9yJSgqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A014036F;
	Wed, 26 Jun 2024 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719379779; cv=none; b=NlTHPtIavIxit5d1QquSXxc1vdZGyjKlK+6vsJxgYvFMvzeTxtrk+I1DV691VUF2bTikOvmyzHll2s8jofHDIBrek8RrUBXcFgdS5CeuCWr7OI1ClKMVSjeZYqGqzARAFeUnziSsrBpL4bj9tuH47wTRCE0+8Yq6KKmkz+5bmKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719379779; c=relaxed/simple;
	bh=uFUDHfOATdCQfctrUYTO/i+6L8wVIn6qHVPmAPKlvhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hMR0p7RPBxvf8fZQpKZRMwA2j5KJNbwVnoR8+LUVKGAEPYILZzTmmNfPnfV93pHNVUo5J8+rrJlhtCbWv+YY3/qwZOoRoZpZ4klfmheqiySfVTtjDPo4G3fdvsC2guoY63akN7SyLKODcCWVRvyyCAL04z3Z0mfRNonKf4wTUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9yJSgqx; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70675977d0eso2968274b3a.0;
        Tue, 25 Jun 2024 22:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719379777; x=1719984577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1UMNR3lBOm9dLCk3YB9oRVcUY1hRbwOIUju5ln0iPk=;
        b=R9yJSgqxWqzfPB3y7FnOB1LXs0SqE7ax084RjDe/p7uC2bz7k0ccuI9/l+kwl1pw/N
         9Wm35Uq5/Bha2avJM8Bq8pDwDlnZSaspdUyxktyEnP2Pd4DbsdfPrlyB/YPlLa0is553
         yxCY4VxfsD20GQKHDKwIkB4t9Uo0WlA1KAwCPsc3KGv79x5DsLR9VOZG9e+oVqhVJfxe
         t86tr4eBoI9cqnu59b0l4b+pt4j3EKc3XleSoEIak70MxGCuXmKhxXTvjuRlL2G+ajyN
         2zry33/byirllvE2hxr8QDZhTf1gIKt6Rsh0S0ZkXprst3yTTAbRBUzQJYJg7ApI+m9k
         PskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379777; x=1719984577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1UMNR3lBOm9dLCk3YB9oRVcUY1hRbwOIUju5ln0iPk=;
        b=NEg8zu3hJFBIDKlWHy/D81Y4N6edmHVBBzgeOSrghgVct9lojUhRs8jod18fQgHbuV
         1gxc5IEH9ig+uaopb8rjSlVFEtOtS+nUqmzL6ZOQzUVk63RmANkfmFT3rlwzVunpkbVb
         Lan36UVc2n1Gs9kavz61s7YVwFBPFpblLsUZxGXeu7s8s9xCTUsKE4FyPmJL+4YjQE0B
         8SBwFAjw+ZEK79+HOx4i505+1Lq45oa99GKlNLrL/HDC42uqO8S9hyFdQDepZGm5VeVp
         YXz5BeK1gYfCCWKANmDGiLjeAkPzNy2iVRD0dVb1OQqmaAFhbW5mmQvl/aT1Ho95LLG2
         XDOw==
X-Forwarded-Encrypted: i=1; AJvYcCUtp4mNarHQwE0coj/lDxMvNcYu5V8FFFa+S9S4y9AyDAOEWxh+RCYXmELgSAFSea13aVRkvVYAeTeuHRXHTJl9Y+y0ol2EvE+4/g==
X-Gm-Message-State: AOJu0YzzecqOa5vHrcsphB2tsTiQw0jq418j+zbCRtbwbqWtsVbtPDo4
	PJkCf1ssLxdBBpjt//vluXMaZZdT4FR6BfzFR1J5OtyQBMdNVjvO9Ruopw==
X-Google-Smtp-Source: AGHT+IHLo7afNRBB4dWnC4QnsXtYuzvf67ZizJ8Q7nl2hrFrF+F3rv5aZW3KtuJVwdcsY24kW6IxTw==
X-Received: by 2002:a05:6a00:3cc8:b0:706:8ce7:d582 with SMTP id d2e1a72fcca58-7068ce7dbeemr8374473b3a.17.1719379777465;
        Tue, 25 Jun 2024 22:29:37 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70661b9f2f6sm7804000b3a.187.2024.06.25.22.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:29:37 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/4] gpiolib: cdev: directionless line reconfiguration
Date: Wed, 26 Jun 2024 13:29:21 +0800
Message-Id: <20240626052925.174272-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The behaviour of request reconfiguration without a direction flag set is
ill-defined and badly behaved, for both uAPI v1 and v2.  I'll will refer
to such a configuration as 'directionless' here.  That refers to the
configuration requested, not the actual state of the line.

The configuration validation used during reconfiguration is borrowed from
the line request operation, where, to verify the intent of the user, the
direction must be set to in order to effect a change to the electrical
configuration of a line. But that validation does not allow for the
directionless case, making it possible to clear flags set previously
without specifying the line direction.

Adding to the inconsistency, those changes are not immediately applied,
but will take effect when the line value is next get or set.

For example, by requesting a reconfiguration with no flags set, an output
line requested with active low and open drain flags set could have those
flags cleared, inverting the sense of the line and changing the line drive
to push-pull on the next line value set.

This series addresses directionless reconfiguration behaviour for both
uAPI versions.

Patch 1 disallows reconfiguration without direction for uAPI v1.

Patch 2 ignores reconfiguration of a line without direction for uAPI v2.
A different approach is used, compared to uAPI v1, as v2 allows for
reconfiguration of multiple lines with different configurations.
It is more useful to skip directionless lines rather than returning an
error, as it allows for reconfiguration of a subset of requested lines.

Patches 3 and 4 update the documentation for uAPI v1 and v2, respectively,
to describe the updated behaviour.

Cheers,
Kent.

Kent Gibson (4):
  gpiolib: cdev: Disallow reconfiguration without direction (uAPI v1)
  gpiolib: cdev: Ignore reconfiguration without direction
  Documentation: gpio: Reconfiguration with unset direction (uAPI v1)
  Documentation: gpio: Reconfiguration with unset direction (uAPI v2)

 .../gpio/gpio-handle-set-config-ioctl.rst     |  5 +++-
 .../gpio/gpio-v2-line-set-config-ioctl.rst    |  7 +++--
 drivers/gpio/gpiolib-cdev.c                   | 28 +++++++++++--------
 3 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.39.2


