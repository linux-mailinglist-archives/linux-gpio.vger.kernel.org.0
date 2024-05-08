Return-Path: <linux-gpio+bounces-6223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCB48BF693
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 08:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BBDD282930
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 06:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCEE2561F;
	Wed,  8 May 2024 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQfkb66o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7E23754;
	Wed,  8 May 2024 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715151122; cv=none; b=uCcDAtQ/mhfaZFIlEMgpyqubZEHaUjPimBvfM6zeTit0jAdiMOzUu4VYXSixjv+wDY14PtDhYJ2atIYRXSvzmGkJsQq+JmqqU7QPFaicG4PZgbbsiNmIbnniJAvEsKzBKfdMwlYDqardnM2EGCK4W/REndKbMrIR1MHU9gCipEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715151122; c=relaxed/simple;
	bh=9lxj8u4aDM7kKtk7HKEsPhYcu6NOgcXgkGng+hS9kkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ITt9Qi8H25385JE6KJ2Wca8neO9CfyQbo7T8/1/hAoFTABkKH4ajaTLJosZSwDB9vNtk+rFNCfI3wY92lKX77QiAea7Cjc2QM2GiCNtO6rLxxneTHK37wlouZeN8ttTHFgAReA2mL/MNbczlTHd/QAVxl51tErdbCfxGIr7KK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQfkb66o; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4178aec15so3419896b3a.0;
        Tue, 07 May 2024 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715151120; x=1715755920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XuZnshTHKl9Tg/cmKKixm6682TVpUXXm5RT75oPZP8=;
        b=DQfkb66oHydOCzJGG8Hgc3AnsjgpnUk1X+b2YEpphgcH4VMMxkndp+aK5BHGt8emQw
         NWQwcPMnw/bUsBcAMfwUmYCZgNRtTUfxULxvbkuRYhD6WCmQLulPyHXaQVO7OAQH0uio
         oAwpw9GhhXPequEQrjdrLldiIaP8YHb0Fu+qj8IWAmHU1Fqu8bkVTcS8ekr+tVuKCmDg
         rNXFFP/dO7f7JkE3FMlVJt2fA2jB6hgNZaiiQEeBKUjDyr4AXUTsxKP/DxYF9MlTIXIr
         5AVsmNIhIWrjMBXr2Bs0nW8oMyxcSWQYwad+NBmKnHZVv3pyopq+bl/xQUhSr70sCff7
         9Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715151120; x=1715755920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XuZnshTHKl9Tg/cmKKixm6682TVpUXXm5RT75oPZP8=;
        b=ntz/L/kNKM224N2QZ6YSrAK2NRmTcPnwudEx3ozJoCW11XKXrPnbl9bpF7vfrSfRTa
         4G8US9pMfYItv6Uo8et0tupuQYYGJZ8InhFNhqnnL2+9R3kH6/cDaiaDEuEP46X38edq
         5kxKAqXs4VayUf8Voe05s9IRaX5YpSxMa7U/wbpXk6FRCCa22kBrta/xM+VLYCiA6B8S
         joEXvEn0vDu7MovkmRIycVydi1X3Rmw3Eu0KSrEl6Yc2uteQ6yVYxlqMP6ZXlvEUFuYo
         +SCzBdz2MglOV7O2P449oL/oyD0+smjq9o2OgnHawbrIjggzcf7NuR/ykhp7WYKt7vcb
         PhRA==
X-Forwarded-Encrypted: i=1; AJvYcCWsGOKxZOW6cQn6n7wRjdMW0SlpfFRNvfr61fqWb8QUW30ME7uLGt/g0t5f2L1BmT0IZBpQafYc4xEF23gAxCOjtc328oYuRyEUFp0OAxMe2mEJaHmkZUW+6vUiTZLxU5yTv/+HFEi1j54quraUm9F+4VI1hfnbqXo7KMUWoVknIoJ41SU=
X-Gm-Message-State: AOJu0YwQiU3ETn4g6VY3oATo92rPcmqbKL0+Fpy4O7fpQ2jJnZnpPmj6
	DcMaRJzGNVozaghVlrf4A63XcqDHF83WWVeO4RJR7tEpltAwEFZp
X-Google-Smtp-Source: AGHT+IFgGAPAVvaBE18CsJjFKPjeHfxTXW+4U6MxYAMv7wt3ywMxqY2NLcXaOTrxtIdFS/puAbkL/g==
X-Received: by 2002:a05:6a21:9998:b0:1af:6911:7ff4 with SMTP id adf61e73a8af0-1afc8d1aa73mr2280157637.7.1715151120422;
        Tue, 07 May 2024 23:52:00 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e434923462sm11136267plg.50.2024.05.07.23.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 23:51:59 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: linus.walleij@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/3] dt-bindings: reset: Add syscon to nuvoton ma35d1 system-management node
Date: Wed,  8 May 2024 06:51:39 +0000
Message-Id: <20240508065141.565848-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508065141.565848-1-ychuang570808@gmail.com>
References: <20240508065141.565848-1-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add a compatible 'syscon' to the system management node since the system
control registers are mapped by this driver. The other driver must access
the system control registers through 'regmap' using a phandle that
references this node.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
index 34c5c1c08ec1..3ce7dcecd87a 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     items:
       - const: nuvoton,ma35d1-reset
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -37,7 +38,7 @@ examples:
   - |
 
     system-management@40460000 {
-        compatible = "nuvoton,ma35d1-reset";
+        compatible = "nuvoton,ma35d1-reset", "syscon";
         reg = <0x40460000 0x200>;
         #reset-cells = <1>;
     };
-- 
2.34.1


