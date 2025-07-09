Return-Path: <linux-gpio+bounces-23027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9FAFEE99
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0995541E9A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7AD2EA171;
	Wed,  9 Jul 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfapYCVI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C672E9EB1;
	Wed,  9 Jul 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077319; cv=none; b=UC3Xp+y7iB7/HgV0cA0uU9OwlNbx63OBgKooTKgy43MVSbWt3Sn9xePNb4Ka3QgCFK0mM5uqmZS+wkTf5+QI8fVB1SApYH+RyR3ii2TU1jfdAiIKaj79swCQuHKEsK4ESDtEc6Kj/Qol29Ce4sHbwnDOXpxB4bSWshJr99PCdfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077319; c=relaxed/simple;
	bh=kQg2I+XJl4ihRUBL6W+xK4p3ztFjK9G4FA8VGAo5ChQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgT5+sbbvA6tZKwB/mx++bCqFeGrWWlH1LvnSU/EGPQImOPm+Sop9ZUJWYbt5ZZb7wRDT7hY0Z5ip9nrvn1m+uOidwVu791zoR22s49nIbWFk1QDcTm+Rz02IQMh6hon97itY1bt8NCkJb2spQnJiL2PgcFm7ecYAUIuvcZiLtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfapYCVI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so80333f8f.2;
        Wed, 09 Jul 2025 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077316; x=1752682116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn1ViZV2LOQQXzFk4XjikcfNiQCWJRxcn9ezMpVHTg0=;
        b=lfapYCVICnB4Ardf5Bgfqa1m/qQR6HBRt92zBh4YbtVDyjY35I4P5PTkBJCloRA4W5
         6QzAWDk9m+xIe5UsWQjkL/fSutSKNUglMfK5F/MRQQlqL9c8FN+sWfJmkCaHQ+6AZJQH
         bzGqqF1x01x5Q0kRcOhkXuAxj6zL9pjuG6r0FBTPP1Oa2t/lr3MkiR7I90YO6Bl+h1xu
         licqXJ6EZ7N22zYx5H3K8OXWtuYcZp+dwmiefKDyW0imaNJoQRNfahwtjvyfETqOEI4H
         X3aW4E0TAXxmaWOV+4rw5SxdYMyXOVDUSI0zYNJwycXcoHWRSScnh1DMUp/D7LNcTT4k
         CWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077316; x=1752682116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nn1ViZV2LOQQXzFk4XjikcfNiQCWJRxcn9ezMpVHTg0=;
        b=uXfF/Bx0lg7wbs7kE7REV/0chGOeHJQOXjK57SxISvU+cPPTv4p8Z1r88OJZpzu/lp
         qzmKvkQ/OvC4J41Pq8CopyHBcPHdJEaf5Y45DA62n1oTTyNvMXJdVAzz+XQrdS7n1MVi
         GFdioLfk/R5b4gixMW/1UwuVd1PwPBqn0CHq45dyyrzKN5MDc0Iff7k2+I5apjadENH5
         uX8764cyF6UJ/TKucT1m1xsBYhA8+76DQRYk6jl8bEG/edqaDGGY1KQlyJSTlb44mRWd
         EBEbMymkpcK99M5BLP60lfJ+hfW4ANKBYYkrZGvqNJnuUItOC/AGQVa7Bn0baPIojLpf
         4WCg==
X-Forwarded-Encrypted: i=1; AJvYcCVS2RluKcgxwjLy7uKgwXvrbQGyBVWkip7BPEkWEYVt99qdIxlr+CeVNt98jFENoyjc9rAl3UwbHXYB6pGM@vger.kernel.org, AJvYcCXI2kMEm/kZIhnK/4oR1Q8dCkpe9xZqumTWB8tJYYg+eVm6/E14bYlIngnhUbk6VJvG2pH13Usu2V33@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZJUT9NO77ueXU/6H5aIUepFSE07Z0qP+AR054UfT9XRafQpL
	uHdowj/dUhb8O+0v3LmYC21dfQhCG1SX4fzSEBvFJ7QYFlA1a7gN2WUA
X-Gm-Gg: ASbGncv9EYJ62qcePHAbVzA9RUlYI7gzNxa3KD9GG58jhC3WiFaL0yjIcPLsWRCq1lA
	kGPX+6OvEEFIbcy2npNnmB3N/ZRg3sl6bVHSSd28TkNDqYinmxS4OMdfmsEpovGh3K1G2KRMCfR
	/oc5PSf442w6jjBlzZkFILh/cwQUpDc+xPgOAyjZH85uokMcMVmeflO0cd7hFj/X99Tq3yYhHJH
	F+Of17nwPyqqGpb1/kVG0ekbmNhxAROVvRtI220My3AaXGv8r0pQHgB57hBdFvxecddqLd6DJmE
	OBes6mht9wWj6s2uIxdWn/kBtLCHlpUFHXtAd09IXJ2UGbA/DHZm/C21g6rYDG6w+aplDoIz7fK
	8seQcS6/xDOQ=
X-Google-Smtp-Source: AGHT+IFSqNDJA1edYUq91XlKZRAF2b1pbWNd8O3+ULQPCxFxTICdsLeKRJ9w4sIIN/31FtET8hIfqg==
X-Received: by 2002:a05:6000:2911:b0:3a6:d95c:5db with SMTP id ffacd0b85a97d-3b5e44eda66mr2878945f8f.26.1752077316137;
        Wed, 09 Jul 2025 09:08:36 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/7] pinctrl: renesas: rzg2l: Remove OEN ops for RZ/G3E
Date: Wed,  9 Jul 2025 17:08:16 +0100
Message-ID: <20250709160819.306875-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G3E pin controller does not advertise PIN_CFG_OEN capability, so
there is no valid mapping for output-enable bits on this SoC. Remove the
oen_read and oen_write callbacks from the RZ/G3E driver data to defer
OEN support until PIN_CFG_OEN support is added.

This is a preparatory change for future unification of OEN handling across
the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 345ee709363b..cf0b92c661d9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3340,8 +3340,6 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
-	.oen_read = &rzv2h_oen_read,
-	.oen_write = &rzv2h_oen_write,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
-- 
2.49.0


