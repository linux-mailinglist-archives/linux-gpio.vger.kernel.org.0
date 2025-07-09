Return-Path: <linux-gpio+bounces-23023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77221AFEE90
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D111890527
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB472DC339;
	Wed,  9 Jul 2025 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A22rOxGQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710F74059;
	Wed,  9 Jul 2025 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077316; cv=none; b=hcedx3srXENp2sBVQe3jTW4jkMhtBRzvZ4aaq9KM8FK8jhNDfkoHlp7sojsmODKrJXHmc/8XXFR0OGpi+Fv/JcE2ZkYYtYcMIZF9e/odhtdiLnDX4E65upoYNb2uOppIbH0T6XEBfDK4WuyqxLCIEAvzOI30s57MA8DzF18e1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077316; c=relaxed/simple;
	bh=nv3o4hh7pxIJ0AsyLDGU1qhdxiyzuJeE899Ov8H8xKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1we4RPuZ40IFlLOBNzXQk7UjgoVQYEhwTgJBcxzSDTobf4NLTgmyEO0h5/UA3Qfrx+An6tNWJ+e8V4naOlxkUp5HTIRkuhL7NijeAuLfOYX64UT78TimHqiZQvK5QDftBV+ja98g89o5GyyHPiZMt4xcJ3M8iT+O8n4RInNsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A22rOxGQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45348bff79fso142235e9.2;
        Wed, 09 Jul 2025 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077313; x=1752682113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn1Ia4Fe2gy7SYFQufa6rdVQFZ/jITGDbYtxmnLlr/I=;
        b=A22rOxGQU4wVaU7SCPzIB0QKmtEJIriQsselMtqjHO2RRKaUwVzwIo3XH45Bv+b3iw
         KmuYKXiabZiFF2V1P3jJjM3Cw5blGtxnpBoGqWsAhDO1nB5uIRGeZx6wzZwZGk5lTyFj
         roxYjbcQyBp/R8Ehsg2AkkSGlTkhteRmTe/uZC7yVFBT96nuTr5jY+4A39g3nnpKiVKz
         8i1FMCwRx6jCu3IKPgjCkxCv3Jk1dmbUQ6gTXS7ooKNYuLaYhb2J6a7Mz5vsg/P5RwXD
         l81MT+yK/eSwCUSz73Zl6GunMysNIPLDreOpUDMrzllgo4RFj8O+ZTtV2gcxYU/GbGZ6
         GAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077313; x=1752682113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn1Ia4Fe2gy7SYFQufa6rdVQFZ/jITGDbYtxmnLlr/I=;
        b=mRJsdZMkKSL/MDaPOdbJXj0bVWraUC2yFwRNIrgLRIYO9mXXwQsQlUpwZ8A6WArQD9
         C7zCVHRW09R0P27ENBckxJgKm1Z+5NB70BVadC5yFNnHXi0+3nNhW6PplFtlrJ7ail4F
         bJqz4nSecAq3D8LLCG+QMzLJSiJkv9hvhp7LzDhJMruJFYQv0IDFQ524VMSH4MMKT7vX
         cLlpyXwFSIbqGXss+bXhZomlLQSkfOAIcNz9oDECTBlrPathmaRNgc9lb0GIeWCRPFmm
         nCjcRDrTUiAtwwB4EKr9/4+3fbV+PWPWUbr7eGLMy86ZBowebx0z4ubDUElPPqBCSII+
         GGew==
X-Forwarded-Encrypted: i=1; AJvYcCVrerBc39jVdhzUrmItKBJMFjUdhbj7YRIoZhFPEse/EnYxzOQf+N3SRAk+/VZ3yj2O/KKuRmgzlamhRMXi@vger.kernel.org, AJvYcCXO7Ffiiu2UdXHhF4iEOrCJfC0tZa2s55Nw4zJ4vbdJtcZB0kcWOyuavKO0eCZr/LctE3lzIe1Ki6k7@vger.kernel.org
X-Gm-Message-State: AOJu0YxMppMnaRosW3urAU8Mc7CalRiGSPSjtQig/Aa3YGpm1J9gQ2Rr
	pSE7++z6SZLDjBi3ekTLNEUpXsyJ5TcCThT7xV5nJvAhHswCmH1FieEg0RqVHQ==
X-Gm-Gg: ASbGncsJgg+teFeLJCN098QLbcIkQpVK563P/wIKBCc0phxKEG1VNG5cDjN+anAzfMO
	QqVT2UBMyEcnQjLndCwFat020uZCCjyRV24uJfN3dgiG3rp1ZRhO9NIpygqD4/5DqVRHE5njTjQ
	HC5gJXTyxq7y1GCYtZkpeVlg3k/kGhOtzPG8i8t/xiYSnHqbiP0sfuZXNdQHFuUxpNi6E8wS1m7
	O8UiEwMMMvnXDVSfsrfWzjmh4PHJ+Cnau6nMbG4QuzqxzFlz+mI7l3lR3aUvc3QXkQ45B1Eh0b1
	/c0kiSYrT3dSCFfSUGJpofZR0+7aGmeYh3D7QS1kSP5Don3/Q8IW5KLQHcagr07Q9F6N72DdEoM
	nBxAui0CGOi8=
X-Google-Smtp-Source: AGHT+IEBrBn+Pf9Xxxz2YDUuaHH2INn/FVl+bL1gLVy9LuZGTmblH0P6nxV4nQP0xpUg7bxlsIVOEw==
X-Received: by 2002:a05:600c:8b73:b0:453:6b3a:6c06 with SMTP id 5b1f17b1804b1-454d53ef405mr30907355e9.29.1752077312308;
        Wed, 09 Jul 2025 09:08:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:31 -0700 (PDT)
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
Subject: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Unify OEN handling
Date: Wed,  9 Jul 2025 17:08:12 +0100
Message-ID: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
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

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 189 +++++++++++-------------
 1 file changed, 85 insertions(+), 104 deletions(-)

-- 
2.49.0


