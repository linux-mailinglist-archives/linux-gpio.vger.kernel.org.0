Return-Path: <linux-gpio+bounces-24047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C9BB1CCAB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B423B171F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6D629E0E5;
	Wed,  6 Aug 2025 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrrIOPTN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943F2BD5B7;
	Wed,  6 Aug 2025 19:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510165; cv=none; b=dEKtIw2YE2ip5K3wqlIuCBg0YM3m5TEVTRhSEKuYvohz1lqpRAPGg/UH62un+1iBwHxUqcwge18O4fcF9RnV3GxQXzychrosy7NWVPbywuTfu+9efhZLFIV3eXdKXnLamYCo2c0VCGGDdi7xGyklq0ckEID1LR0D7HvwNbe5Zvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510165; c=relaxed/simple;
	bh=fMxs2XH9usTvZBkqrb1FwF3VaMiNoAPxEV/eTR9V/58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lCrRcZQCtqZnEDQq+UH1LU62gcRxXS/iajs23yKXd1/1Vosv9AHfPOKEllW1YrT9Jt7/+o23LhCH+Tl9xbX1cAZX7bKjjpOeEs0GRxA4+inS1RsDQSUEtnSo50NqKIz6UqkhUTRwdnAL4188YslW+hWVvlJ5LpilvfAZbH/V5E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrrIOPTN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b78b2c6ecfso101418f8f.0;
        Wed, 06 Aug 2025 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510162; x=1755114962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2OMy6D73QmOwbTMN9YSHuz41/CoJS0bmLQe3lktguU=;
        b=FrrIOPTN/hzoVoF+k8CT8hlo2Ue5dCDeNnSVV8Ptu6DK+aWp15BIPU1mPPhx4zOpEJ
         OHUAFr/GvO6st2NrdvFCt1KpvTkEMa3jo6kZHsuL5y7NR1OPZGHrFG9SaT3DKg2pL2e/
         syEj3iCa/xpaPGosOL5d6LMeaxOdy5DMVriPsMJ4F+aa9tJ6l540FRtCDHvMi/jZT9eP
         Kc29d5brHODDV3IT16L59DQR5N+lXUZBZjzXwLiZt2AsAbzjQAUpV0WDrgpSRZrwgFQp
         kt9g7zgQWNPQegSFkLYKVm0aUVWQ5VbCahdhksgbqCROmBEOK490vfSn9zHw9t5WUJTY
         pVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510162; x=1755114962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2OMy6D73QmOwbTMN9YSHuz41/CoJS0bmLQe3lktguU=;
        b=uQdk8QR7UEA/1OEmm/0E4kFL9duF/Vo2LMKNZ5MtyxvwtfooixiYJ0i7FUiZ9nsozd
         g/gfcZqCdTbYJr5ARf1Dx52jYsXy+89WF4UosXabCeLK+7wKQXIZR9fLrtlOc/s93i/x
         Ffp74dvyHPJYjoYxkHpKBikZSDCmYxy3H0u/JAYRZjlVOQvoadteWmEPOsU0SKoDDOYR
         nXFw/xVrno1zf7vCSfWdXyCr7SpLux7rVDVSw7OrtUNx7RhyOL8yGqjZcje9Axo1VtbE
         +piQGXbxUkWNFjjorG7pawZmw/hSzX94jkoh5LKNw1nKoZjmJIUiG+GgvQfbvTl0Z/7r
         oUfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhYmPHQz5ITneksuYmiPNs9rkAQLGy0ux4vd3BSYCyHAb31Hl7hEBsxOna/2ofCoiP6MlpRR8EGF8hIag3@vger.kernel.org, AJvYcCWLUqi22AjeQ6306stH9Ra6kfmHYXbX/Qz+dZvGZlOXBh/8PZPNouOS1Sq/H72hXPLBjvaBodtlJ+ac@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYMhxA8xOy8hKnxYAep5UmEVLy+TnhTenh4beWsrtsiKoqxb+
	C7D8ks0VBhKTKpKxb7qPtB5Plokj5zyWGDCLrf/9DJ6X7g1G36Ak6KqK
X-Gm-Gg: ASbGncsZhSQEMR4KEYFnkR61xRl+QYxHCac08AI5WOXVCvN5AyUXYB8PdouI6XKUd23
	W+7bcocsZnEZnL8E9IQYPG9rKOtuEromoK9jdr3dYA+aE7IWoT9+M/ZPKr7facX1ZrqtHJ6ZbjJ
	fVltle14VaOzjgjAVrWCDg0FT1R2goLPsYpbSGNyTF4EGCb0JaV0yPpfc40+EJVQxQi1pk2peOn
	/HEeZTMU+CtWhpTZzu0dq1n3/QcJsYRdobXGm8ECKP8uWcIG0399QDmvOh4xg6qtWAmw+T7Rf66
	mXW97qfEnl9OGiO3AvQ6GQl3trhmyQ7gM862gCjUNp/tdg2FFmnQ2VgVHndubxGpKVLc0IMjaah
	CPHH6G3jsKCCs4UsIDig60KlyKCbp20/zZl01TsF7RUPFkNn8uZ8qbsQIizLnuxu2+DCOO/xTjA
	==
X-Google-Smtp-Source: AGHT+IGOifFPqdA13Pmcr5pau3UH5CcU2Pvm9mAEwY+DUrw18XRNzJkaTEevHl94DlCcY6q7zDo3bQ==
X-Received: by 2002:a05:6000:3111:b0:3b8:d7c7:62d7 with SMTP id ffacd0b85a97d-3b8f4165f9bmr2477448f8f.16.1754510161973;
        Wed, 06 Aug 2025 12:56:01 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:01 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/7] pinctrl: renesas: rzg2l: Unify OEN handling
Date: Wed,  6 Aug 2025 20:55:48 +0100
Message-ID: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series unifies the OEN handling in the rzg2l pinctrl driver, allowing
support for RZ/G3E SoC and removing redundant code paths for RZ/G2L,
RZ/V2H, and RZ/V2N SoCs. The changes include
- Parameterizing the OEN register offset to support different SoCs.
- Unifying OEN access functions to use a common pin-to-bit mapping.
- Adding support for RZ/G3E SoC with a new PFC_OEN register.

v2->v3:
- Added Reviewed-by tags from Geert.
- Renamed `eth_mode` to `oen` in the rzg2l_pinctrl_reg_cache struct
- Added a if condition to check if the OEN register offset is defined
  before reading/writing it in suspend/resume functions
- Updated commit message for patch 2/7
- Added blank line after if condition in rzg2l_read_oen() and
  rzg2l_write_oen()
- Grouped oen_pwpr_lock flag with other bools
- Dropped redundant checks for OEN offset in suspend/resume paths
- Updated the commit message for patch 5/7 to reflect the changes


v1->v2:
- patches 1-5 and 7 are new
- patch 6 has been updated to adopt with the new unified OEN handling

Cheers,
Prabhakar

Lad Prabhakar (7):
  pinctrl: renesas: rzg2l: Fix invalid unsigned return in
    rzg3s_oen_read()
  pinctrl: renesas: rzg2l: parameterize OEN register offset
  pinctrl: renesas: rzg2l: Unify OEN access by making pin-to-bit mapping
    configurable
  pinctrl: renesas: rzg2l: Remove OEN ops for RZ/G3E
  pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
  pinctrl: renesas: rzg2l: Add PFC_OEN support for RZ/G3E SoC
  pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 195 +++++++++++-------------
 1 file changed, 89 insertions(+), 106 deletions(-)

-- 
2.50.1


