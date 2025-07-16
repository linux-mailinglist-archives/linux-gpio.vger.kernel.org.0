Return-Path: <linux-gpio+bounces-23370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6404CB07DB9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99F191767A3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884B92D8377;
	Wed, 16 Jul 2025 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Edv2ScNl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DC62D63E4;
	Wed, 16 Jul 2025 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694295; cv=none; b=XJNWt4zQcALBTgBYNRmoirTHZOoxNJwPl0z8iDoB2Spp4X3rIJyrIzk3R0pfASz/6B4CWLU/pFGiVPk8Ft4LB2OtUzX7Mplt2Hl/Vve85TghTc1rFdtY5NU01FbmKa5jje7vJKjF2MvAE1Hd5okJ8zLqKCsc4USHffriTFI/SXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694295; c=relaxed/simple;
	bh=Le3fKPFnTnPrgHTj8F78EVXFR3HaOupXcG+QIrk9gZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLVnl75fz2/UiKrc+IsGdVZMmIcAHIJsSF/7An8o3xAWsf52ynLeZs3JxxLvWrmoL1p0saysmC9rIC3flzH1qIatsRIZA5mZImTpvZ/nLEAceQsgio/o5j9x/MaT/RBsienW8tG8IYqLIqeD/Lqc1krC8eqd6UAKQ97MvdZ29QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Edv2ScNl; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so262575a12.0;
        Wed, 16 Jul 2025 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694292; x=1753299092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=Edv2ScNlTmgjB54FHP/IilTCloKVKTy2oFiOjml4Fho+BCh/jk3QNgMNDvWK3nAM0W
         eDT5Nb8dCpIZBNtp0p/C1mKhpLQJXWc956AnE7ZmBe8kc5pfZsa0Uw3csIQaFXd49vgf
         XJ961LD6Qfy4B0Z9VqfIZNOmLmD61AJX9FgYovvPZiN5jXZyOgIl+X/xdf1Kb6RBy9qI
         De4UryiKI5tZLP8aYKvbMluk/66zVcnqG3O1sPjFC0LGweucoijqP3BXrczPESGBKjcp
         Z76gaMXzZllxohYS/vzBOwIOpmUa4evVHnD1kNG6qwfxbRLi0i0/hCCB4lgi1GXmVQX6
         MDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694292; x=1753299092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=m/AfaBFDOyRCWRRKNvsVl85eLpnS7Gz1TDfK60uz3DvngmU8ZYdJ2ph3AOcZqUWQgI
         zKLEDkhhTZkrgKq59AxM03ZjtO+tu9RS95qIa4CN9aScdydB4GQuGlhhnaV6LlOGrXWk
         /Z6RKDoOF4H8+mZ/4hNgI30kmYe5p7E4Q1izmXl/VsQCbhE2iCTudrCg0H7S9SAz2pTy
         7JRfeipWQt3cfNY8bYGxCNqDzOYmhv8lAV2ZxhwcHiH/HLS5P/CCKOqWAJKFoYRgRT3a
         ka9wFJ9XZodSMPOVVrA4VekYZ7sOXA7hDicYn/emmxJJCfJh0xMXE8emPjYng2/ebpiD
         fgzg==
X-Forwarded-Encrypted: i=1; AJvYcCVeFBD/ZD4/ZgBceqfsumt9R/l+PUX2MIFe7UG5AD9+hrg40i/Gv/Y/yGcs4YrMzkvc+w40MJOAe8kk@vger.kernel.org, AJvYcCVw+NL1zwwyHNzBuursA7E/ztiPiB/t2TUEdVcvPvmPv17fYDIfEW11cUotKXYdQZf6Kuswyk9GAc1hUScV@vger.kernel.org, AJvYcCWRqHr5IPwsfQFr9poZbi539WK6aAF74ltIvtWc9HV4qtqSvW+D+R6MDMcIW1YeMPxWLZ6bxuPztXk/Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YykMVIMOfXMfrZmjgAcYzz4ldyGEv7xoDQV2PmGctHrkkjiYkdG
	whadGuPRwVjyZ0XtcJRhKN7egQv7AZMVplbpr2oJIRKo/7DQuSO18EJz
X-Gm-Gg: ASbGnctAMDugFeui271kfaBuVhz2kxtVc0dypnJadXehRf/Pzloecb9fhL7MnX12uOd
	EjVN7+eNt8bVExNDNWCFsrgsCIz7D8WK0o6H5orhiwW2GMPWTuj2N+pJ9wINMaJYMvk7NNFdZGB
	Kd5cMTLXdN4l4hZ5Jw2osM8+i+JagiPgWgKqMz7jQHVUg+kSDWpXIsT8rptsv7pOuwqceO89w+b
	4P4YRIBU1ZnkZZB8PEqXMskeMvG9NHr/AxW1d7Fu4GiEJCMy000aIt20muMZMLp724A4Sv0epe+
	ykN5asbq9cHdxCswOenMrRWQEwFkfPVUtmtuPZcbHe688zZ6AWG4WzNN9LReHn5aKia8iYN8hJl
	SFfMnHr8emJ4jIN01ancGsoHRxA6w4DmyKCU=
X-Google-Smtp-Source: AGHT+IEZMD5Zc3OOnACa7/C5CBcH3nlthXXafeTAcO25bIUK50cADPzmkF5lGfh1XauxfD+fLFBGwQ==
X-Received: by 2002:a17:907:3f22:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae9cde0032fmr402005466b.16.1752694291809;
        Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed, 16 Jul 2025 22:30:50 +0300
Message-ID: <20250716193111.942217-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f52..78ecbab8205a5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.1


