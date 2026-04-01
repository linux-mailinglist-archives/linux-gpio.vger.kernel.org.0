Return-Path: <linux-gpio+bounces-34518-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GK6Jf5kzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34518-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04972373151
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B846030977FC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9637154774;
	Wed,  1 Apr 2026 00:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Szy1C4Jn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C618FC97
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002693; cv=none; b=kD9kF0ANWTJ5iQJqcmZ8WSe6pgzg9zrw55bmsdFuspljxYYOYhxCGhv8QVENpYvljcvwHSJxc+c8+dkVu1aJ3Td/oNzYwYYqzhyWYTXJphwCI9t9QJ7gFescEVcxMwQe75O0LDprk7Ml8Tfi/5WH1szbXvmKVNZdaYZycA2Ovxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002693; c=relaxed/simple;
	bh=KFkUW2cVImUyjlhprHCT59klFvET8NGPVtBRHk4nfJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3oklhKcCNczmCxQRhm47E6NIF4qkTbgnPayQmYKlwOiAm96FOhgreOjq2DnqeprtgN2zWmsSNvFPfHbMTxTeMuOu5d4gFtS4rPIDHPeFrT+0joFHRO7JLDysUWjHisEyPMjUwR8SD+7yZiH70qdZvH5TKhGwvRT7PX7IymumA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Szy1C4Jn; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d556c1a79eso6481571a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002691; x=1775607491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPaw7EwmFwAnIEhnxkQHAn8cwP5u+/k4cBjxFTufoac=;
        b=Szy1C4JnWM+DgWLxLb8Ji5KyoV5pq7oIJmaBuSmJSydboQH1u71ZP+ouTRPCX7YoMP
         DpYeyvnPL8bDpChngoCtUTQ819+k9Byq/fL/T4C4gkJDm6OUl8hGh98NGnbMimru0/Kl
         Y1Ue8CJSLOloqvG3+KJkG0XGwyMx6rwRAe+OPSRduQTG9SMsNUc6IVlJNK4SCdMOk5iO
         R+OefymzJ9Yswb88KUIF7E5xqZCNMEE8KEYlfduraUu4dccth01JRilgmjVYwbToS2bl
         QB+fEcVGKkoS8q8o2xYvYeT6OwowMzOQiJJYm2VscrkG6D7JFvX75WbmxrPE+sGCt58Y
         SY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002691; x=1775607491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PPaw7EwmFwAnIEhnxkQHAn8cwP5u+/k4cBjxFTufoac=;
        b=XCdZAAPTz42/mlnjUiIVJV84wTBK/EsJNVnQCEfoQ4qWFwhoD2UAJJIOk37A6+T7Ky
         DBsLu2BqAUaALWZlFqpLVGEifFyYAfzIAN/q8fPP9P1tkoORMX0hyd4Xz3mWS80gcpTW
         kdFx5lghfZrihlbWDxL+r8471ZDV3X3UlRF8mjbzgsBM984V3ut/Jk3fs1ylCz5+SN6y
         vzctAbyf971LQcAFub3A3tfMiUFVJYtiwmkVKFicVM5syI+7Rum2mnqTLvMQVStdFQwV
         8kdXaIgSF8wObEbKHRLo4zK8o7Mnj41ymTP6FHm/PC1GzDlzdHablrJgZ3uDNnQQ2/Mp
         LT2w==
X-Gm-Message-State: AOJu0YyFP4HCHBPFiuF0jlfUrVI568kg0xbs18LgBPH+bpYdIcyKWw7P
	u8n445O1Xd6awIl6O6sPDgNktAiergE/HlucJGupnCx9k/vHa89E0lyh2LugzQ==
X-Gm-Gg: ATEYQzzce6Ryquz/83l/lZ1K1fNyM5qc/cQxGUt/DTlonNNikYBvX05VZpDpUmochN6
	sDPcloILqBPqCSVKtnHDMWWqkfyB4swj+kW2p661/0TiYJ1twn5pXMYnCLq0anHXCCBR/HLjwCv
	c+OrJ6RgEzdf4vkn1KD40YDGJ5pRvgqJkd6aemKwMtFoF5T3+dqlANQsDI2kwRPrFBCQTISV0eB
	t+PGJJdC1+l6wSZLHuXJ1GTbg3U5qHVnXuJzTxgCXVMcyFk1BeGsD7WycF4MBl6wMhljOoUsXw0
	YsJXgpwPIVxT2y14CrL81PfKwIQ1ZUdAYKqfXwN4RKt2Y9Pg9WmY7CJUWEFy3UnAt6uvKZ6h0yL
	BWwqSCTPbtkWvjus3eK4ruZaktWm0/Wh/PvjGcc+1NyyM40UZLA9KSY4c7g72fDJgTyFzyD9Ju/
	+vd/Evuvi/fX6teGXN/2x1ammNAKJ7TstfF8tYPmVwv0Jxbxtobe79bTYI3wFNKQ==
X-Received: by 2002:a05:6830:3747:b0:7d7:ccc7:c546 with SMTP id 46e09a7af769-7db993af487mr1020001a34.23.1775002690917;
        Tue, 31 Mar 2026 17:18:10 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:10 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 9/9] bindings: python: update linter configuration
Date: Tue, 31 Mar 2026 19:14:58 -0500
Message-ID: <20260401001459.19159-9-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401001459.19159-1-vfazio@gmail.com>
References: <20260401001459.19159-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34518-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04972373151
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify linter configuration to check all files in the bindings
directory while excluding files in .gitignore.

With a minimum mypy version of 1.18.1, the `strict_equality` knob can
be removed as it was a work around a known issue [0] that is now fixed.

With a minimum ruff version of 15.x, rename the TCH check to TC since
it was renamed in v0.8.0 [1].

[0]: https://github.com/python/mypy/issues/10910
[1]: https://github.com/astral-sh/ruff/releases/tag/0.8.0
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/pyproject.toml | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 3255e89..98bb44c 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -49,26 +49,13 @@ namespaces = false
 
 [tool.mypy]
 python_version = "3.10"
+exclude_gitignore = true
 files = [
-  "gpiod/",
-  "tests/",
-]
-
-[[tool.mypy.overrides]]
-module = "gpiod.line.*"
-strict_equality = false # Ignore Enum comparison-overlap: https://github.com/python/mypy/issues/17317
-
-[tool.ruff]
-target-version = "py310"
-include = [
-  "gpiod/**/*.py",
-  "gpiod/**/*.pyi",
-  "tests/**/*.py",
-  "tests/**/*.pyi",
+  ".",
 ]
 
 [tool.ruff.lint]
-select = ["B", "E", "F", "I", "TCH", "UP"]
+select = ["B", "E", "F", "I", "TC", "UP"]
 ignore=[
   # Ignore chained exception warnings for now: https://docs.astral.sh/ruff/rules/raise-without-from-inside-except/
   "B904",
-- 
2.43.0


