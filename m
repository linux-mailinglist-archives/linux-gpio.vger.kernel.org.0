Return-Path: <linux-gpio+bounces-13018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C44CB9C8D53
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FB41B2CF34
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28952136658;
	Thu, 14 Nov 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="w0aKWPES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68196F2F3
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595894; cv=none; b=otj2/7/t97fjlyLsnXSbrg3cIyIWdY8NIO0jb+dVRKuXPmNGMiv1f7BCIOLyMlS+hZ7gOvjGG2J1TxOxfL5wb3F0AkabBEMCWuzpr+e21huzHaEEXz4puCpmQibHKGKNYM4gjQjVpjuOTEUpRnIHgRz0TSsQPk8oSG3f+VIjoZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595894; c=relaxed/simple;
	bh=h6aB99dT/vAmCz4535pHREsxBEfHYHJ+OD68VRVBLRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KC56uLw0jgZBfRxEKUW3yXWFzGg7NW6sZ7VWjxlyRYrgZyvNYUYYViJ8KfKr1hm09riNLDWLwiGdCfgdAJi3jeEHrd6L7VjC5SfDrnJDUIyo9BCCtI/H6RLiFK98I7cmkFhvNnXcJoOAbjf25NNX5k1xWu5Lv4S5cRXkXFKbWiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=w0aKWPES; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id D5ED520AAC;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=h6aB99dT/vAmCz4535pHREsxBEfHYHJ+OD68VRVBLRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w0aKWPESzAuoPzJ0u7AZI4UOUlfPsb3FtZN5NaA3A2d3N0Zq4RRAPgJwK4NzqbiXr
	 QJV/EVVF42OTCyigV0pqiL/m7LFVIJ86TIFXMrhWyFE0MDZCsj2jHr0qw7JM4IHSQb
	 h3KCaJLdtECRlHzyPQU9FNNBawehljX/dL8MD6KY=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 08/23] bindings: python: add type hints for Chip's internal members
Date: Thu, 14 Nov 2024 08:51:01 -0600
Message-Id: <20241114145116.2123714-9-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add type hints for Chip's internal members so type checkers can ensure
the code properly constrains to these types and accounts for scenarios
where the values are `None`.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index bf38c7f..69ea777 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -61,8 +61,8 @@ class Chip:
           path:
             Path to the GPIO character device file.
         """
-        self._chip = _ext.Chip(path)
-        self._info = None
+        self._chip: Union[_ext.Chip, None] = _ext.Chip(path)
+        self._info: Union[ChipInfo, None] = None
 
     def __bool__(self) -> bool:
         """
-- 
2.34.1


