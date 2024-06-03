Return-Path: <linux-gpio+bounces-7062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD08D81B4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A170B20EBC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9BC86AEE;
	Mon,  3 Jun 2024 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBTnxg/O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E300686659
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415797; cv=none; b=bX3VXEgm28Nf+tGkhUbI0X6zveOtsqbmk2FIV3pQA3bXawpSUWzUVN61t2bSu0a9MqsI8m/1BFccRZJTpZVz9JJpBqKH0nf4El51EVyNaLZS5y2OaLu6/C0ReabpA/ETruaB5UzaYPykdBxuaqSwHTFp0sELAyQZUZouaTZR3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415797; c=relaxed/simple;
	bh=8d9I4b2EViUardw6aEXsiY1Larq+I7qNw1fXb8crTuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F0WzykyECswmulKdKR2wTr0MEZGkyFs5R/MuTvlq2DwAin67dUHeX97iBoa9wC7yzN/1NQ8qbNfuEuqLLZgfl90mxgwlfWsjWhXsNc6FnHrWwlZaRnuD1IJ9u4FeSYSnfidQu7OGZya6r+Gktvn25Sr0skdcIi8sp/LxbDBEtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBTnxg/O; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-702621d8725so1381924b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415795; x=1718020595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=um6byQm43TRVUlaCPAc3bRKBhW0LArnmOVq2/wOjV4c=;
        b=YBTnxg/OdwtCsGatg3BFTV54PvHYEKwwKwYzmWAmfSXXcl6SudHZXjNf4ic0G05DJh
         nFpkW9/IKgAlTFh5O6DuGh0MR5YN8Rr+5DzwOVBufNDret/tC4RtCavFQ/uEMNLWgecl
         TUQigczNvmkTrnVKbCp1OZtj7cYh2bhZSbWxANjUZ43K8cf2b/SSlCnGsw9Mz0L9CQ+F
         8GyUBh6gaFVbUaVkd306PN9YG0Wgaceyi9DifY9la+S+pAnYwlvuTakgJPLZwnHZgtPw
         XRQlEXQZ5doZUEKPHcWWMM/9RHq5Tq/e4LW+4yOSRICs/dHanumebnr7qaA7TaVtFmGj
         QWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415795; x=1718020595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=um6byQm43TRVUlaCPAc3bRKBhW0LArnmOVq2/wOjV4c=;
        b=kmUL20XqT/S5OfBIyAtzgyRp4bhEPYBbit8/WQ4poG28x4DTUZzDriD2XoWRi3NQei
         iFgpq8UciHvM1LrGS59VrvVWACoocCAH8fLFL3MoQ7oumg3QMMzTOsZCiewoqWRqKubE
         9lu0JGrc58RyXy/kh22ELN3MKXhEsFsFBEFeOgYstfzKwGeW78ZHZY4AlZSMQ6DCPnS2
         BzNvbiC6atFDi446J4nMsNxIwpLh+GUR3XorBe9JgIiqlxI1FmV2/tTQcWW0B7wNc3Fe
         2MEh/ns5j0gI8GQ1G066IFgwldZjyEFEeanTNIqe0zQiuBeIzOCDvOk+4Q81SiuvDYuQ
         JgXg==
X-Gm-Message-State: AOJu0YwWf0zvByXQ+EMlX+vWOvgO75o8Y9Y7Hw234FL1yZEd+xTEto4X
	gbx3f+HC5MMnQr0uLjx/X2vHEj3ovioFs8YPvlfiHsQOlP98IgILjNh66w==
X-Google-Smtp-Source: AGHT+IEsQ2Mv2EguIeuyW7i2+nVCa3CE6GOPOzXUXO1GJ7KF80a34k2VzBnV2YttXHHGLrlSzCq+sQ==
X-Received: by 2002:a05:6a00:1383:b0:702:39ef:cc24 with SMTP id d2e1a72fcca58-7024789bd82mr9685831b3a.26.1717415794857;
        Mon, 03 Jun 2024 04:56:34 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:56:34 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 0/8] tools: tests: fix shellcheck warnings
Date: Mon,  3 Jun 2024 19:56:20 +0800
Message-Id: <20240603115628.102616-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up on recent discussions, this series fixes all the warnings
detected by shellcheck.  The resulting tools test script is now clean,
at least from the perspective of shellcheck.

These fixes do not correct any known issue, other than shellcheck
reporting them as potential problems, the intent is to remove common
shell issues that may impact future changes, and to simplify checking
that any subsequent changes to the test script constitute "good" shell.

All the patches other than Patch 8 address a particular warning.
They are reasonably self-explanatory, but each commit comment includes a
link to the relevant warning(s) which describes the issue and the
appropriate corrections.

Patch 8 addresses a number of warnings, all related to word splitting
and globbing, and those constitute the bulk of the changes.
Some of the earlier patches also address trivial splitting/globbing
issues where that would prevent a line being modified multiple times.

Cheers,
Kent.

Changes v1 -> v2:
 - fix links in checkin comments
 - fix subject of patch 2

Kent Gibson (8):
  tools: tests: don't mix string and array
  tools: tests: declare and assign separately
  tools: tests: fix unused variables
  tools: tests: use read -r to avoid mangling backslashes
  tools: tests: don't use variables in printf format string
  tools: tests: check exit code directly
  tools: tests: shellcheck don't follow sourced file
  tools: tests: avoid splitting and globbing

 tools/gpio-tools-test.bash | 459 +++++++++++++++++++------------------
 1 file changed, 234 insertions(+), 225 deletions(-)

-- 
2.39.2


