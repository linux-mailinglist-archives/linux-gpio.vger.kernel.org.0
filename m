Return-Path: <linux-gpio+bounces-7700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D423917839
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE71E280E07
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E051A13A88A;
	Wed, 26 Jun 2024 05:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mejWBfHp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13B14534D
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380302; cv=none; b=Ug9yRPEbX62mf/wmda7KewlUpxPbDn6Sv6V+koqqeaUR/1QaTPixMbD59vaJ/LEmQCWnnX8XoDVS7BgHFR8doZZBepwinESmpUuLG5Bvm6Ro7LqxWSlRWQvq+xnHxFz5LbqTob9D/Uwf3ENIWWL84a4wS1wP7cXYIgTmBKF7Hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380302; c=relaxed/simple;
	bh=OsOhuH+qaJU8su7wj7zrmwMsC3hVODZsVMeFz5u7s7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hmKy3WtFJoYjm5HfcWQ8aQvBoMc5uC6dgIOLnOPXvPe1lGScYQRAeHou5SyHwF1D2Ip+1pYSw389/brbiaepfeZUAONgYUceqjN3SSjF15IJ51fsukRT0ZQUYYPwS7ztuQNHjjU0Od+14Z6CPN43tKsKO2Db1UBg1/EDVhFxiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mejWBfHp; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7066c799382so3758343b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 22:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719380300; x=1719985100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yM8601GQItb5bO28ImSgOGV7VPLdtqzWUrQb8GOSv8g=;
        b=mejWBfHpHWDCMI+6mnnSDwMJaefaHPK8csEiMv/4kM3Grx1cMRUEa7WOf3vLW3AAq3
         7U1wsTF7jc4pgWIfAYJ9eDsx6uVnzc+e8NWj62zz7kG4LIBIy2A00ORTVymzsRv1qi2d
         V55hVwHj3Y0sVYIsbr8dXV4RQQhyDv+ATuY6Y0W1SaHJo/s5XYCS0JEZy+Ap11v4Ihgf
         sL8SQtVFSyuZGxQ5a66vOrb+/GI+MTaYAKY02UBT8GhuZhp0EoZnzLm00QE3H37/F7dN
         z2kd0YAt7VLQAz98dR9QlZm9HyUhfEGdyrugDZEjfBDkQUyM0YUp9CIQgu2co1xjsFTi
         TgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719380300; x=1719985100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yM8601GQItb5bO28ImSgOGV7VPLdtqzWUrQb8GOSv8g=;
        b=lc/FKBUZpUycU6dJY2fHQpst0UuCpUXASd9HxoJf/H+QUjOAuMXNXbiE0cfnXUge6G
         ZOBbkkruEtWGoPlPKrnAJ7GGZyPKViy7ZbwPHEZvP6kRfR0DkP62XSs+WLLyunMbSmqu
         5JsAMRl6QRpGnzwccreJqjvjopeG6A3Wwgx4t7xGaetJvtCwBs6cVjin/INcwSxElkNj
         ngi7xH9mdVBnBagAKEnymG+B2tGJKd+w6xQb/4wjxixRZozkCm9nPZqW2UqNch/IrgOq
         plUAtKc/lFqzXxI3uxoB4Gu8IrTJDSdoxHhOPHky7A0LnT+1ls41TCfkBOW8qejr8Ldd
         /C0g==
X-Gm-Message-State: AOJu0Yysy/FhhC1zTb0/sFUJyL1EmdgVwICMIWqvbSJwKuHhrwha4u5j
	eIW86064QwJ+kOlYa/50mBJRO/Wh2R4/auzbv9ers5QUG1W+Py742vQBNQ==
X-Google-Smtp-Source: AGHT+IGxyRs5Ip9r/GQbgR+8YX5mboDqaTFF3RB/J3QLsPA5TTAKBl9V67yOpjO/RRZ4Gp3OkTAhxQ==
X-Received: by 2002:a05:6a21:33a5:b0:1bd:be6:af28 with SMTP id adf61e73a8af0-1bd0be6affcmr8466652637.52.1719380300456;
        Tue, 25 Jun 2024 22:38:20 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8d7b4f821sm674370a91.0.2024.06.25.22.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:38:20 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/3] bindings: python: more flexible reconfigure_lines()
Date: Wed, 26 Jun 2024 13:38:05 +0800
Message-Id: <20240626053808.179457-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses issue #54[1], making reconfigure_lines() less
restrictive in the configurations it will accept, allowing for
misordered configurations and reconfiguring a subset of lines.

Patch 1 adds a set of tests for the new behaviour.  These all fail with
the existing bindings, but pass after patch 2 is applied.

Patch 2 is the change to reconfigure_lines() itself.

The reconfiguration of a subset of lines works better with a change to the
kernel to ignore reconfiguration of lines without a direction set,
i.e. a default LineSettings.
With existing kernels, if a line has been requested with flags set to
non-default values those flags will be reset to default values, though
that may not become evident electrically until subsequent operations are
performed on the line.

Patch 3 extends the tests to demonstrate that kernel issue.  A kernel
patch addressing that issue has been submitted[2], and the test passes
with that patch applied.

Cheers,
Kent.

[1] https://github.com/brgl/libgpiod/issues/54
[2] https://lore.kernel.org/linux-gpio/20240626052925.174272-3-warthog618@gmail.com

Kent Gibson (3):
  bindings: python: tests: extend reconfiguration tests
  bindings: python: more flexible reconfigure_lines()
  bindings: python: tests: add coverage of kernel reconfigure as-is
    behaviour

 bindings/python/gpiod/line_request.py       | 17 +++---
 bindings/python/tests/tests_line_request.py | 64 ++++++++++++++++++++-
 2 files changed, 72 insertions(+), 9 deletions(-)

--
2.39.2


