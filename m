Return-Path: <linux-gpio+bounces-7606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C09819120B3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 11:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1AB41C2211A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F20416EBFC;
	Fri, 21 Jun 2024 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKrkwuOC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B616EB59;
	Fri, 21 Jun 2024 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962443; cv=none; b=asr+00kKIEu8l8ocL3puTakvopyMbKfdUse2GbzIoJ3p7tYq4tHzomN3rNUhtdHaeFzjUc2HTfgM8zOw8lWbdJ2VQqoQJdReGtW7I+PDgo4aVf9fiGq/DsVpPxH3rM4rBtR+QoWm2scLlMeXRbTbij1uNz6XlQEq2fEqKxTotXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962443; c=relaxed/simple;
	bh=UqYRi/GaolvudqALEwC29tW05IGWxmXQBo31+fOWj5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CrzyQuWrrz0YxC219DseYGr0umfcA8d3yoQsnjPQok2lZIkysDaKaRdI3jBJByQxbMUBkOCq/PEtSFE4GLxpmvg5fk9qhddxVYhR8Qg8Dy4IXDyA374wwC7WyYuhWNt9b8a4x86OfVg2/vOLQjl/PAvDopxUdDDr06wPqZyppJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKrkwuOC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f6559668e1so13671235ad.3;
        Fri, 21 Jun 2024 02:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962442; x=1719567242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlPyR2DwNKIhgYcJR7RVlheTP0T99OY10zKkh8vPfJo=;
        b=iKrkwuOCC+5e3xjJ54g3ehgzNQWjjKWGpYW+e3w3mKXYcIyQsG9FJ5P7s+Ny2E7Anc
         J8/VuXVV513JnOlwTt0hn5SyNhZnt0UgrhiYPS5fl0tCcrJEU0oS09lRW7cdlBQIKbW4
         SdAvM+oDKEQdd/05x0/4IcY1wvPe+tnOJDlwn4Nri3DyY6eoz4m0F0rcHkc0q5fCiHpM
         4N+yFzQJjdqRtXRDDy7UhMOpesurgJUtkAEKahuIimRl5WKwA7sKjWz/cvJcenYOo1Am
         Kf21fgVRk8MvWWWW/5TMrwrzxZyltJuQfNZt4xdBdbQppMeeB2Oxl1LoBgrnRye5SKvP
         UV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962442; x=1719567242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlPyR2DwNKIhgYcJR7RVlheTP0T99OY10zKkh8vPfJo=;
        b=aIOzkGch2ClGMIQUvkzkNGe/+e0ihq0Q+Ld6Is0W1jTaOz2hsQiThK/9ORnCET+qPB
         k1xqfoxp33e99vVg5MvPKZVP6YEn90IhiuTseqHu9iNfBgaw9jlCm9xAbJG7p309lCtE
         iaDhw7HK9G+mx1af47XmqRSm+ne7TWFGR9m7suJS2uMih49vIiSQi5G7kF4V60U/TFj6
         92m5Bu3y1SAaZzOC3Bjz2bbzkjxdzwjF1qN2lCZpV38cIXGNP3O1pvP/F2aXWFVfTdUf
         I1oDTQuHQOdaE6dn/7qQchu3LXHwfK8s2SJ9W6hGQN15t0jbxjs4n63dNMTj2OpQ2bNv
         3gyg==
X-Forwarded-Encrypted: i=1; AJvYcCWFlFFit5O+CBA3uzeeJGWp/Ec4VqgdV4oaI32gW5Ik+qZU1imcGNg2Hselkj3UZ2sTIpEoMV1nc8gwWzBTF2ddfHGsh+0BOqlXDaLbvodC5O9ODlaWJXopYqxXiYO7QSVBMePOCppVoLpkF+FVApuXRGMWngqVeGqS5y3kaYTiaZ9jeeI=
X-Gm-Message-State: AOJu0YzBu+C8GUW9naspLJxwmKDHpnc2TNqGc6Q8Vb0vVt4El1rz5rGh
	fNXyhVE7gFgmLNdwE2yrS/6GVtFA2PgGIOnw676F7Xgyqt0+fZgE
X-Google-Smtp-Source: AGHT+IFfA7C54egHwv68x+7wV7g0a7OIDYQlMXJVlMpjxHZw9f4QfFjmcMgrvV4MeiBayo09KJSZQg==
X-Received: by 2002:a17:902:cec1:b0:1f8:67e4:398a with SMTP id d9443c01a7336-1f9aa3bcab8mr82874115ad.13.1718962441726;
        Fri, 21 Jun 2024 02:34:01 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc72e9sm9810365ad.296.2024.06.21.02.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:34:01 -0700 (PDT)
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
	Potin Lai <potin.lai@quantatw.com>
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
Date: Fri, 21 Jun 2024 17:31:41 +0800
Message-Id: <20240621093142.698529-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240621093142.698529-1-potin.lai.pt@gmail.com>
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

Add "NCSI" pin groups that are equivalent to the RMII pin groups, but
without the RMIIXRCLKO pin.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 00b6974a5ed3d..80974c46f3ef9 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -19,6 +19,11 @@ description: |+
   Refer to the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.yaml
 
+  Note: According to the NCSI specification, the reference clock output pin
+  (RMIIXRCLKO) is not required on the management controller side. To optimize
+  pin usage, add "NCSI" pin groups that are equivalent to the RMII pin groups,
+  but without the RMIIXRCLKO pin.
+
 properties:
   compatible:
     const: aspeed,ast2600-pinctrl
@@ -337,6 +342,8 @@ additionalProperties:
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


