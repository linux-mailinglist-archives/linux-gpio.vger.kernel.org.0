Return-Path: <linux-gpio+bounces-31502-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MnLOvI4h2kuVQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31502-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 14:06:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A13105EAE
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 14:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB87030191B7
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0A034105F;
	Sat,  7 Feb 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaWkzbfe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0519C566
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770469614; cv=none; b=r3DSeNarGcFLx+woiMByN9zrlavWR+EnMoqUOVh70V2P6e7jr6paUljdHZpC47W3kSWp3180h6g2UKppr2Cn+fUJIChGF9G4JijgLa90Rnu21N7bpNzSIivXrKFcWQ6Ev37iahp27kgGw3DAaNuTKozemWHMNFBQzO/lEHOuzsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770469614; c=relaxed/simple;
	bh=PDMpQY9A/q5YRj33nQAyJ5Dibhc3Aog/84i3/fXpMZI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JRn8YXni2efGTFzpw1I2S35yNdXfn15VOfnBlEMBn+sxYSjbfeJ2NxklKRzxPC3jAY3iqKpAdJGoaJf/jShjjRHF0i11FVSFlbBIL76euGIT+AuXWR0fFLBAyCwzclyhPMOJ95n9kTKsQ50ucF/UCyu3yPa9Q5tX2f/wMAZCgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaWkzbfe; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso457924d50.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 Feb 2026 05:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770469613; x=1771074413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KExn54vGdemRSQc8V4xZY/OAPOefDjPGw+AdA0mcHiM=;
        b=FaWkzbfeH+ny5lBzdtL9sXKcQZXYbZA2lJuqaVhDPtfN3aPmVm1AhK0EFND4DMznrJ
         y3H20+r7cchdtN3+brp7wo0pgts7KBz8aRmPH65+OBd3a0MLHgCFJA9MGF5K1X9o9pag
         y/YaZo67Q8xFmk30+ilnDG1DHtlNUh0rUnJ95rqXs3JigpCI47ab/dOHIBk0jwbqdDah
         cFMEpRV/OOz9Qcj8zoqGvjFNbmgIDptdf914/X7BLVCbtVcgEJZs3Zb7oFZsFTkYWjnT
         N/gDd5La4tTya6Be/MjsLjJ8KBnZwT8dma8FEyvfoNFLHxNI6LIP06SuFjQ8KdE9zcU6
         I/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770469613; x=1771074413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KExn54vGdemRSQc8V4xZY/OAPOefDjPGw+AdA0mcHiM=;
        b=ArpjJPBHr5vzE91eCA8gUZCIJyFysVEB19ek0H7pZK6GdPRk2HAzqfJlnrIf6ufX2w
         G/7TPMjE+KoJfWKRQrpRvmpTO6s02cUBGB+Th/fcYYmXkUQDYdI3BNzgfJxbkgwl57A5
         gd3ex77yVe4dV2Dl+evnOyoo4lJObkXIVooVno0DlC7pjA4sdCzAjPatjG3qnw08plpK
         FnQO30EfLQKOEUmecZ7MNf5PKJQe1SDbYmhcfmEpMcrl9gR9PbSvL1AjyJdPlS+Elzgt
         i15jdpMKzHEoqdJD7S9mRtJ0qgOpBuslrKY352VHnuylnbt/Ek1J+TA9nx/5f/UdAa7V
         mozQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnoLVqyCPKUhFL7sqeOv8DAZRvhOJ8H76lvTKArrtBnQF21UTFpcmXevEv0BsoED4r688QJmrUcKkJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzeUj3j6jIM9li86EGRG80GMEBqDwf5Z/0nVHmGbO/JZ/L4TSX8
	iQvPBQzo/4jZE1hGv3jXXEZcyGiUVOCMIILCurtA/nEmPW3mmtvgaITv
X-Gm-Gg: AZuq6aIM/RfjJ1p5CFdPx2dA+bCULzrBkk32z5bwAGPkEfGawu5PdeOyusRu+ZZtrId
	uG9nWbxEzbTDclf8LR1/JAZMHC/O5WIsyGSaxyFVCSwOJvnj4s0FbTVWxhPwYCIULdCTXBlIkUZ
	5b6LzauQQXvlY8S2bHbrfQHu5SqrSa5sfkqi7E52RyHDKx8nBfDhnlXVe9uwHpTJX6prSpDTWri
	j20fUTh0E6iOIMGfeFeaQDxgb4EhpIqhze98l9gRTSMqJwlml4vDT17mUtEp5cnXWvGOfWophWd
	HKh/etNtTEXIDSNyvoodiT2Ix5++eVlI3VMyO+zPgUtnp7mNZ+QXIZjpbuIewSgF5UAovWKBBax
	0qaQhpqX2Ok/B4dHmSxlBf4f1hgu5zWMpM6kXtU0+zMKL6sXvj1BjErONzaT38boRuM9zwF2Uku
	dM+Vvse0AReDU7HILiAiKzKAgk
X-Received: by 2002:a05:690e:1686:b0:640:ddf5:254f with SMTP id 956f58d0204a3-649f2058f4fmr5743886d50.62.1770469612896;
        Sat, 07 Feb 2026 05:06:52 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b1ab:5cb0:a2f8:764b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f248c511sm4991572d50.8.2026.02.07.05.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 05:06:52 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linusw@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	jonas@kwiboo.se,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: rockchip: Add RV1103B compatible
Date: Sat,  7 Feb 2026 10:06:41 -0300
Message-Id: <20260207130642.2833312-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31502-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43A13105EAE
X-Rspamd-Action: no action

From: Fabio Estevam <festevam@nabladev.com>

Document the compatible string for the RV1103B SoC.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
 - None
 
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 76e607281716..9b3cbeb54fed 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -50,6 +50,7 @@ properties:
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
+      - rockchip,rv1103b-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.34.1


