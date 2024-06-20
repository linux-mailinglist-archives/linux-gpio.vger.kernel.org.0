Return-Path: <linux-gpio+bounces-7579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3290FF54
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 10:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60F9281D8D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 08:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E54D1AB503;
	Thu, 20 Jun 2024 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlQlZJSZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA9C1AB370;
	Thu, 20 Jun 2024 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873157; cv=none; b=Icz6kvw7k7YxYHRm5MXHKzCZMBCS/Zpj8O5uok1B9IspGZDpJK/cFTkXJdOvMdQio4bGu9MmYu4Rd+3NtkNk2kxyzOcG4u+1+gbSagIzuCvCer1rZ8bMIuMh4z+rnrzkzYtn9gMnyy+tyifKSzxa5n2y7QdTdhJmI0bczrjp5Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873157; c=relaxed/simple;
	bh=foGbT5PlwOKStFDkWhOUHnhpSb2Zj7QEu8lIzrDUS1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GlxxrdAkc52EDnYXv8c+pi5Wj00MnWKsbBwBdDqxvII6htlvdcy3pkWbyi5Ry1f1zqAiW7bI0KGx0aKZnsT3Ab3Ccer57/tQiIeAtaO3rtOLaiqlG3pmksoOo03frM09DfGLFBT6jnivCF0Hg4hShrb9MDLIlD5dVjNhTEVYagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlQlZJSZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70633f0812dso582983b3a.0;
        Thu, 20 Jun 2024 01:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718873155; x=1719477955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fte78PnOfBiH+sJHP9JZR7QJmPh/4n6xzLMPWhbJ8Gc=;
        b=VlQlZJSZM2CC0y9QhWXZ8OObJBmpSrLHeO+Z419L85rsppT7zvI3jgHxD4z91txEiM
         BFzt5vtmhjHwpX+wGzE6SQc2/5JxwEqipkM62X2tiaW22j8PiuglmJxRD9Q6k505MAVt
         BQ5TJp1M6zkKXAKOktOR2zgULr823hlQAfm4w0JEIPIegWhO6Q8119m7dK4liyAMl3rf
         3BkLMKrA1vrP3hvRYwNJbpYBT1NcpayDIUoK04qX2TWGcKkp7Axlz07GzAyMFRsHXYNW
         32N/uXAoK4xGDbz24RRqPBnSAGJNwDcYPLCYN1pcGjjh47HD0nhpK86FVMU0oZOj2PWg
         08UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873155; x=1719477955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fte78PnOfBiH+sJHP9JZR7QJmPh/4n6xzLMPWhbJ8Gc=;
        b=wxZSiPc/bY8JsCShRP94rYw5/24SyKfizu2kzJLL88xrJ1DdmbDXXAuth4yo+ZjjmT
         zAUmf3TuKGHStVCBRI95YKUNIookeJRWi6O3PKBKOucV+1r/wW+FHX7WuC8MPIjWQQAP
         tBDjDwPoIJdSyeWbC+utO8FCYD37UyOl9k9aBNuD6E5K2lVoryaD9x6ziQ7bSNOWXQPq
         LG/6fhBBWfEX7TIyjqm3iHXW7BpYOu217QFQ1v5ffpNJC35Wby+JpnIcjNrywnLDI/aV
         KdXzn34mTjwTwVNxfhvmofqxwtV5SlRIWHbHVS/XWXiuQCskmMrQz+xdyetU2Olrzh+F
         HRIA==
X-Forwarded-Encrypted: i=1; AJvYcCWorKaGaSL9iXb1utbHJMymuVw+wd1Awudg+fyKyeU+cvTeEbiCoitvDU5XwAOoW8czU4Oy2DsVwOa57pobmRMg+iXk/ta6xFqZc+IYLN/ZG8+paLlm+ZpRt6LLUSaZ0Uqj9uBzxMi3CKmQNUtWs7bryLOu8W2v74gWgwAtAeZkZzDzXEM=
X-Gm-Message-State: AOJu0YyegQ4vJ+4CpYAhrs6o91HkWPZlB6ILRwUKiWPO5590Hchv4TLa
	140DBkuaXSAgXSyjHSEKGhCbm5OzUdLYW7N4U/IwQct9w00HJYpc
X-Google-Smtp-Source: AGHT+IFxym5JK2ZJ/HsMfJgwaJm993/2O/e1hkkImoYa+PVFsL906eYHSVqcL7DY+taWQyuSWfH3Bw==
X-Received: by 2002:a05:6a20:968e:b0:1b8:a13f:3a39 with SMTP id adf61e73a8af0-1bcbb5cb26fmr5082372637.38.1718873154815;
        Thu, 20 Jun 2024 01:45:54 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9besm11895592b3a.165.2024.06.20.01.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:45:54 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group
Date: Thu, 20 Jun 2024 16:43:36 +0800
Message-Id: <20240620084337.3525690-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

Add NCSI group to distinguish the pin group between RMII and NCSI.

- RMII pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXRCLKO
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

- NCSI pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 00b6974a5ed3d..3f02dc94a7ce2 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -337,6 +337,8 @@ additionalProperties:
         - MDIO2
         - MDIO3
         - MDIO4
+        - NCSI3
+        - NCSI4
         - NCTS1
         - NCTS2
         - NCTS3
-- 
2.31.1


