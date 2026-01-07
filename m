Return-Path: <linux-gpio+bounces-30204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BCACFBCE9
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 04:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 388EF3041CCE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 03:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63BD143C61;
	Wed,  7 Jan 2026 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="PwkMHhty"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0E2253FC
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755268; cv=none; b=luu9YuMPdwja4yX6XUHs035HjGrgq/Hv02fcdSRH7SnkcUtAAa2O2GJMZPH4CBvXk8SJK96moHgVpg0iHEy5CRU74ieWGt/z4Wi49TDGt5FPgTEJNd0a+bdyIk0AQdLOOoZCh4fe9sNg12Wk+jQYwFBiOxtYAmZrJI4v6Zxiu9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755268; c=relaxed/simple;
	bh=A0Sb/c1+3nyw7j95RoY40IXeaUFjCzQ8wLUD/WKWUhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0L6PbslO6KhKjwKHAcJA35zQri9pJlu0jOb7Zfqs63I7cwZIPythv+hGorrkUC/oSS+Hmt1QDgs2/q8CdNHyZ+DdcVuWM7xNjrnyfWEPud1dRjyFltQ30tJGXB/DsfmL7QPD9Y9hOOBi3buxKHSM6VoVJ+XcDhR9lvVZODwEaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=PwkMHhty; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0a33d0585so12611205ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 19:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1767755265; x=1768360065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6Wp5tqQ2i9bGT22Xc5qD8OYwZmiFUbdcsOrP4/XS+c=;
        b=PwkMHhty09WwvMXPNrbeJ4v4BaOvVJbOOiB8NFy2WpffWg4fLBO9kZZZ07nbfa4MGo
         965cgpFvx1tSlfYtHUfdW+TefccBKnwSWm4tVSyPJRNiOs79040qxOGp/SuuMiKmYUV6
         T5xuLjCKwANkMICTQO7VDXzTeiRV1mWUakuRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755265; x=1768360065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6Wp5tqQ2i9bGT22Xc5qD8OYwZmiFUbdcsOrP4/XS+c=;
        b=bY/m/jEW7wOzMO9/kBOSilhBdrxd+K8BG5Zp68Ldx1aGp0K6cp6blBm0GIJvhSxKjN
         v/we4XHVVKYEvilBlXff0tYgJw6Wv4i47nYiwauqKddPCFFdMVfGce7ntCkS9adqvhcz
         mu4cqBVo9oE922Jdbs/9Q9+6L4rv17TOHECpNDvxgPxOz3/9b10dcMHmTquPz7IGeD+a
         xAY4lhquhwybzwmHmHEh5ET3BxpQZN6RE+DDiIkSyp6uo0G417HcVtNom5lqVt7qq1os
         KmdTbZIo6GFEPkaOeWJRLWCHraUTyx73lQc+26zYKUShrd6Skwld3WXUvFChUot2OkY5
         Lp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmeln5BoQMjiIwgyjyb9h/fOrM+208MBs7VtslD5hU+CfFiN3f2/2yQ2vuo3XtPdgt0aAleKHaGbzX@vger.kernel.org
X-Gm-Message-State: AOJu0YxelXNiDTOvSTlvHIP9CPkYhmIiHYHSqIp+LV1U9URxeuPkfzZk
	ZmlvooXI7kV4rH+s8AVF70QnGp2Ju2dKLb3Nh4C76VL5JCLKV5IOuQVLWNxQ45vFMQEb3kPxmCp
	kAskLACU=
X-Gm-Gg: AY/fxX4jns6ncP8PzncrEQQnAlDK/1/RTnHWy8CpQJvikXv1byWECM37g2cCUS+ZD1t
	uVkT6E+zB76g+CB4pAtuxH528YbSq7qBa75p9ECWYgKSxeGcDVZgy8oXS/0HbH7MFPJZ0Xj8BHU
	GqX9Sr9ie42BYRoCvTT8M3vbuB7sQo7e7e9Kd3Gf2t1I5lakIu35eDUpkwQHG2wHsuB+GG9iuBf
	9tissyAozQvRC9exZJmIvoD44qSHuR+9+l2IONBD4GqL2Ee0oB5hYVXheyiLsuZYu3G4JnsF9Rr
	b8qmIBLi/n5BBCv7Q4N/V53cQty0e2iKvvm/oc/hLW6YwHMlRaK1C20E66ormkQUzt8hLUL4326
	l/znI//zHNorDU1i70Nk0AVqBXsOyVyIQY4fhnly2Bp/qinvfP3xwlGsxmp6+nXoUx5cOJwDoxo
	7NtvUvUgaBtXAhVceOfAkx3h4eWqbg2lc5FgefrYYLP0lB0HSyH2rXL1Vq/8DuX8UZs51x8xyf8
	E3BP976Onv4mg==
X-Google-Smtp-Source: AGHT+IG+sB+HojVoVOexYxe9/ikvcdN1H43dWusvFZ8jXjOgBaiHrSIaofUJWLWvSYbf3jeY2d+Z5Q==
X-Received: by 2002:a17:902:f547:b0:295:8a21:155a with SMTP id d9443c01a7336-2a3ee48ff6cmr8697855ad.35.1767755264788;
        Tue, 06 Jan 2026 19:07:44 -0800 (PST)
Received: from kinako.work.home.arpa (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm33694165ad.102.2026.01.06.19.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 19:07:44 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: linusw@kernel.org,
	brgl@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 0/2] Let the compiler remove unneeded compatible checks.
Date: Wed,  7 Jan 2026 12:07:29 +0900
Message-ID: <20260107030731.1838823-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I like devicetree but I dislike the way it removes the compiler's ability
to remove dead code because the compiler can't know what is in the runtime
devicetree.

One common pattern is checking if a node is compatible with some compatible
string that should never happen on the target machine. i.e checking for
something that only exists on a very specific PPC platform on ARM etc.

For weird people like me that want to run Linux on FPGA softcores, processors
from 1979 etc it is better to have the most minimal kernel config possible and
for the compiler to strip out as much unneeded code and data as possible.

The following is my quick hack to add a way to hint to the compiler whether
a specific compatible check is even possible or not so it can remove deadcode
and then an example usecase.

I think this is cleaner than #ifdef..#endif all over the place but maybe
someone has a nicer way to do it.

Daniel Palmer (2):
  of: Add a variant of of_device_is_compatible() that can be build time
    culled
  gpiolib: of: Remove a bunch of compatible checks for spi controllers
    you don't have

 drivers/gpio/gpiolib-of.c | 6 +++---
 include/linux/of.h        | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.51.0


