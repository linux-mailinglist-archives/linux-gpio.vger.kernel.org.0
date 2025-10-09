Return-Path: <linux-gpio+bounces-26936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C145BC9314
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E54E19E8217
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873E52E6CDA;
	Thu,  9 Oct 2025 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqlfJKi3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F972E2F13
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015143; cv=none; b=BalHlRCwGBwQk2PxVn7kHCl1KZRyxpG4Ijtt+zd8f6XZer3CZj4xIslQdQMYFQvS4qh4ZTuSy91I58H8sDRi75B5NZS2FDexoGgVu+QoCsi8Pk4j29TfsYYD+iwvON66VKdM37E5U0vW2oLeZsyJSS4BkE+NaAGzRHA3+w19a2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015143; c=relaxed/simple;
	bh=XQ/yGjbgdK52N4aWcQHNgRGJYz6oVtITah9NkMLLxII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDF0qJVfWSKC8F9tuZ+iK0ZkRrrJwrbyTflJPQVtEoaiwjKJ/PBbhx5peLxype9pnUYkMGWYQ9Fm1m2SsDp2inJVrkUkEGlmIPJVJdQpF9sz0NGBVUbzgSKr5aLy+rtauZy86uUQ8W0yax1eXLe1xMKqlZlNbKM54sI6ReJdn8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqlfJKi3; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-938bf212b72so32039039f.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015141; x=1760619941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGRohN7p2xqxULshMrdlgGrxhdD/uas7NTDYGgpGDSU=;
        b=OqlfJKi3kneClcQYFHSWti8AoaAoZmHqFfOTdueK3f3BD9K2l8jYro0VrIDIbBzWyk
         qvxhDjcNj9Jr+d2zMkA15MWkjGQtwEp5V1OYzhktYHy3f/PjRzjuVXp239cO7RE18Hju
         9EMEtkrNfXgBU8PCBChIua/zVFCJL3JkEYu/feVWobxxBevr8R2gOpZx8ozsXKwAjjqs
         RZ/EKyyekTg/JX+2P8nc6Ho8L4wfsjd3I8vY7Gf3DVL7BCB5P/bCxmYAhKBmZtnju0In
         CpsQTnHkcy7KHTBnHU5n27RALSNf1UU0YIX60QkRZWBslI80X5dSiBZBtjwrJsvrSw8X
         4M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015141; x=1760619941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGRohN7p2xqxULshMrdlgGrxhdD/uas7NTDYGgpGDSU=;
        b=E5IyaSW25LvdqM0ACDz9fCJkQ6oVjj3Q8P5C2jf94fcDf3lvsS//7UvGT8cwPNpcry
         F9CJsGURfLFJX8FE0FG1l6xd8lyWlR1CJvSoktA0WCVIBZd4Qm5OnjdW1vpWvCm/hFHp
         /bQTZcljG4+HFGDLnnHoa+DObwx+C3mYdktR6N6NTdOLHW8DLcoxpExslPhjMmPVCr+n
         HCyjC4ZTroow8CRrAdZM1gv1UFyIjzq3/GoHQeVS0UWvl4jhFdpMb3RKjLvKefflcaoQ
         hWsZwdewVa0OkgSbPLvuTk5bg4AtePblWe/poQTDl2L1zJKV+jNSr8kHHSjVkIb97lO8
         X0EA==
X-Gm-Message-State: AOJu0YwRaiHQQ+NPutkpap69Xbd2rGXESBD25Q8JWYV8YzhLHzp3Abah
	iRqREwGJY/LzAOrfDDiAi2a8Vp9BehaIALwSH9eyyZs/PP6oWt+5oo4cBr0qA6NR
X-Gm-Gg: ASbGncuL7Dy9mLwpgPe+vLD3LsVp8ZLVg1G2bfOnk/QxksQBK1A67fjm5iA0IwVEjOp
	2dqj4St9Wdro34HymOn5wShjGK5LIvFSNVRUICYlZPbBD6ieqvctoZfwh5+pZdnuRLVUy0fUbg8
	WpNSJ9nIplDixd26CSHQNuZnHqYzAhKSxuczKhAcYJncoGAjk8mib+YLHPb3DjW6RyASjGEl117
	MkNtqXkPJcFY5LQiB3j+SuH02MKZFqQnXz/pCpzVEpGnnjHdPrFOl8RvJYvXECGnGqw3osVXM/C
	qKRI7Ai9by6aOV2m7W6ACmDwvJ18VeLE57Q1RaBpkP1Z7LWWk084g7uiOdil4outwCotURjuUk7
	NC10A3tkiWjRhGce2Np8BNqjoe2J4DiXihptnH7BaL7ZSKVcz144=
X-Google-Smtp-Source: AGHT+IH3fwCEv9ReqNR0ksaNYrpSId8Tnvtx0l0k5c4FJiG1KSk3/mDd7A00p6lVp976eW/tVsEiJw==
X-Received: by 2002:a05:6602:6b12:b0:8e0:f662:69e6 with SMTP id ca18e2360f4ac-93bd196079dmr780467639f.11.1760015140542;
        Thu, 09 Oct 2025 06:05:40 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:40 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 3/9] bindings: python: chip: track requested lines when enumerating
Date: Thu,  9 Oct 2025 08:05:09 -0500
Message-ID: <20251009130516.3729433-4-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130516.3729433-1-vfazio@gmail.com>
References: <20251009130516.3729433-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, an offset map was maintained to lookup the name used to
request a line so that a list could be generated that reflected the
identifier used to request a given line.

For example, if a config looked like {0: None, ("foo", "bar"): None}, the
LineRequest.lines property would contain [0, "foo", "bar"].

Now, the line identifier is tracked in request order as the config
object is iterated to avoid maintaining an offset map.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index ba2877d..23662ef 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -302,7 +302,7 @@ class Chip:
             mapped_output_values = None
 
         name_map = dict()
-        offset_map = dict()
+        requested_lines = list()
         global_output_values = list()
 
         for line, settings in config_iter(config):
@@ -310,6 +310,7 @@ class Chip:
 
             offset = self.line_offset_from_id(line)
             offsets.append(offset)
+            requested_lines.append(line)
 
             # If there's a global output value for this offset, store it in the
             # list for later.
@@ -322,7 +323,6 @@ class Chip:
 
             if isinstance(line, str):
                 name_map[line] = offset
-                offset_map[offset] = line
 
             line_cfg.add_line_settings(
                 offsets, _line_settings_to_ext(settings or LineSettings())
@@ -340,9 +340,7 @@ class Chip:
         request._offsets = req_internal.offsets
         request._name_map = name_map
 
-        request._lines = [
-            offset_map[off] if off in offset_map else off for off in request.offsets
-        ]
+        request._lines = requested_lines
 
         return request
 
-- 
2.43.0


