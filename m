Return-Path: <linux-gpio+bounces-26933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B0BC9323
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 061153C26EF
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C50D2C326E;
	Thu,  9 Oct 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeJwXoYq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D82E2F13
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015141; cv=none; b=u8D2djN9x8BCXx6exYbvXOXrEesN9AjTFF5ST6z6rg/Li3Y+3KfdSifEbZW+rgBInSFCodck757UbLQTbqdwwOgLXgSUpYcwvEp3h78AomYmQqig+I+JCW6QUl5eDDqVG/vuW0t1mrE2K2PoLSoX9go7U4NfwEKrI/dMfkVwmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015141; c=relaxed/simple;
	bh=GpDrEK6GpVFxVQZY9ULBxiyTT/ZyKzw63gMnqwOzwng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyFpp8XzJhsJY36qq9rVQz6FIsu+jZB6rcU9W9ixeLlk8I9h5VDBMu3ZnJGLnH2L0g6v3zbLwbkPHCUtheYYAnqzkMqRwwaX6tfY6RE6rdT/HOCdC0dNQUyvHYo3bk1w6ylEZJLRDXJ0IzAAilpkL67smMf3j0YtTQCSNoyzMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeJwXoYq; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-42f91d225c9so2843205ab.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015138; x=1760619938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztj6hYYAXPAnhuiJWWESgtdz6hisazTcgBa8+8eCH8o=;
        b=AeJwXoYqk5mVTHBqzr2iV83xRruVXQL1opJvxQY0ibSH8oQhuPFhdJBWDRop8pbjMO
         jTnOE7d8vVB5hq5JmdXon1opK3b3G+2pa7Sf0paGAuTYTPm0WuCvdQbpn1y1aIzuUjVo
         8dKr+zHo2tYriWVsrXGRI6fw5mg0+malWHlrFkGa06zLcsL1ZrA/phxIBp84UwN4vsRs
         dPV81GdvvNIIm4yswJvy/LX6hBIVe2IcGEnz+BMM1t3DDGU+4eSP9erQ8oWL6bDJTn6K
         zX7irjVpQQCnt2YXVl5tIXCtpyS+3SEbM1ryjr/I6XjVcdSZwZaKNf2pNhSLZw7su9EM
         Nhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015138; x=1760619938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ztj6hYYAXPAnhuiJWWESgtdz6hisazTcgBa8+8eCH8o=;
        b=lADJgL2qzqwhwM3YTnY5QJapRuspOXSaGkk++9UumUGyPA2QwdTzDvL2PnhvPEMifH
         JG19oJhztCRu8qM7UQHGXmibIzUHZV2H54x7z0bI+83/rXnFPgya/Tl2UtT5IljEhTqu
         yRVCZmhVLAwnZO3qc0+KDC6ZjJc6Mlny3xFrASUy3a2EZCb8qYea3Y+yqcaMrnzEgWZL
         p8nNr3NN+TDqLUFJrPV8M6PxV9gGRGk4JdNl1jDOgpHhaJu5QumJk8j+Tb39nN4igGOR
         pedA3OUNn2pfr6zqaU2lJ1KPu7xE3jTg3cap2ubeYFtvyZn0CCbYbcJp0toyOZ8fZjyw
         niAw==
X-Gm-Message-State: AOJu0Yyq4M8278vo5j98gKKNQ8EA8murnxoQTajcuUIV3DHAaJk53lHD
	JfLNM7Lf3cDvx2vg5PI2t09uPCNTpVik7Dd9Jt0taYFK8cuz/SNvB5vQqjA2Na4j
X-Gm-Gg: ASbGncuHJyWq42JVFzUlfgme3qJKSMcspw8w866wdsnzyb79lANJxze3OnAgVLgv0/G
	gZr8Fcaq/wkT+x49EMNjfoCVY2fvmHuxWGaZA6jt1Ho4M5o+E8tbKwAWvgtQ3DAYKv1rKIAJ1WF
	Wy/t0lx970/WR4Arh1LLB/BQDytzwodF40Id3RP/2hTPRwTbNiTCAU8O+4GknQWpwxiEA1+L+cT
	iOTK2xiHi3IvJudU4Cu+qDkb3WBeJUrqYbAfSccwMrbg0Gk0MBSho6ZBR0HvWU4+3e8WEO51YDT
	Kr841X+dKYNHD+FKGF54XDWveNLN4qXpXjEGCXk2EiGqdoCzS3KkW8Ci4s8JJPl3JIP8WbZuk1/
	kDfl1mamNsW6dR9HTi4SB1oFjitNp/kIkKX/Yr2PGyT9W3LrivO0=
X-Google-Smtp-Source: AGHT+IGY8dZT9dzcObGlAWH2h0/ujXdjDVkq6AvlUlDLRU2QMNJh4t6L89kfhS5YXqdyLBq0Ip/R4w==
X-Received: by 2002:a05:6e02:4709:b0:42f:8a31:10ef with SMTP id e9e14a558f8ab-42f8a31120cmr42202885ab.4.1760015137821;
        Thu, 09 Oct 2025 06:05:37 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:37 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 0/9] bindings: python: improve line requests and reconfiguration
Date: Thu,  9 Oct 2025 08:05:06 -0500
Message-ID: <20251009130516.3729433-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes a number of minor improvements to consistency, speed,
and code clarity for line requests and reconfiguration.

Patch 1 makes iterating through a configuration object consistent across
line requests and reconfiguration and helps condense code, making it a
bit more readable.

Patch 2 removes an unused attribute from LineRequest.

Patches 3-5 are minor cleanups to simplify and speed up line requests.

Patch 6 makes the behavior of reconfiguring an unrequested line name
consistent with that of an unrequested offset.

Patches 7-8 make lines requested by offset reconfigurable via line name
making them consistent with lines requested by name being reconfigurable
via offset.

Patch 9 updates line reconfiguration to warn the caller if a line was
included that was not part of the original line request.

Vincent Fazio (9):
  bindings: python: make config iteration consistent
  bindings: python: remove unused attribute from LineRequest
  bindings: python: chip: track requested lines when enumerating
  bindings: python: chip: simplify duplicate checking
  bindings: python: chip: check mapped_output_values membership once
  bindings: python: line_request: ignore invalid line names in
    reconfigure_lines
  bindings: python: ext: add ability to query line name
  bindings: python: chip: map names for lines requested by offset
  bindings: python: line_request: warn on unknown lines when
    reconfiguring

 bindings/python/gpiod/_ext.pyi              |  1 +
 bindings/python/gpiod/_internal.py          | 22 +++++-
 bindings/python/gpiod/chip.py               | 84 ++++++++-------------
 bindings/python/gpiod/ext/chip.c            | 31 ++++++++
 bindings/python/gpiod/line_request.py       | 36 +++++----
 bindings/python/tests/tests_line_request.py | 63 ++++++++++++++--
 6 files changed, 163 insertions(+), 74 deletions(-)

-- 
2.43.0


