Return-Path: <linux-gpio+bounces-27135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A545BDB00E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 21:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0291719A0E3A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 19:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48BD2C17A3;
	Tue, 14 Oct 2025 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoNMO7gE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7552BCF5D
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469100; cv=none; b=qTRJODFlkUbgj35emt2WxZwWxBdrjZIjNZ0BlF5UXJUBwxy53Q2a4OhZOd9XU7cXH2pZur0cHa7AYSVWKAjuMrN7NyuxVzhtWBZxgHLouTdGzpAF4msiGC3qYYWjie9xl+SmqC/iH9R1F+N48EYLchsuRbTyK1+eRKdTKyZSrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469100; c=relaxed/simple;
	bh=S+PaKb4dQqXhsbGRU/uKTbWTAhncSD2zvQfzn4XNbaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqEDt2KjaZNYksJcKPdPWPHmWzf572/JkWBMAbBv2wevyqFZtrQIquXqoQrvs93cg7nBwC+vXoUyVtpfWLREblkgjO9qCzg4O5cwNMISBpsbPvcqcc2nMPibV1gJQ+3s5uWdLUFh2iIL8rMFDF0u6P6e9ug+j/nXBBL78rBV8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoNMO7gE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso2326110a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760469098; x=1761073898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwe7YXxDoU+cIzHCYhHi5EBndZPOQECM5/AlfPL09Ic=;
        b=MoNMO7gEFJpfhT0fJmnqe8fE8uaO59YuIZXtSdoDHDb208twu/1cJnqPqcQmbMgeY5
         Ay2x5mueKrDvQV/O6w/CdmdTI/qTDxgxb0UXet9SzD7Gd6brvIBcnHjzzzZcA9HxjyA6
         xwPKXa6KXrLccKYyKTjHG2TlF35Z1kupvgWOZXoJpvC5R+J6mai3bTGfOTdSBqmbLZSL
         FDzdkMBd661JSRZ5EuUhWw8lZweWNc+pd2bulKZ/v6OBLG78ix5bD1ozJ1N1d0/1984q
         WzIeF1holATdocVUwNfrNfIwBuAnI7OWENnKB5s1PNORwvvvS12uNhK/QZ9x3l+XZy5g
         1e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469098; x=1761073898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwe7YXxDoU+cIzHCYhHi5EBndZPOQECM5/AlfPL09Ic=;
        b=Jtx21AjV1VFYfSQTyr667KeNFRixzgK9HloTlM0BOaQ3iizzbjCnWWoMGciXp9HYQ3
         R7/sr8ogeNXIcEeWop/EtPr70veEqfNcYBw87SoVDsruIKu5jupGdyKdk3ydt/F4xc+S
         VPWhCiIX0IHl2x0mECjVpub1dmcO+HOi8LCvpb4DqJ8bF1nuyHYGbJjEdw+1XHb1BPjj
         vnIk2+qkVD+m/JLbod4WMk7IQ4CuVGO1Mrq7aIj+UgJhULp/VFDSQWqF6qg27MqoH0jl
         jja41iofn5+XppkRYGY0nxZJmUZPj2W1g1R1qXzMla6FblFwqSet3YeqzIHnlJgjZJkG
         w7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUFUN01HJxZbosbNKI/EuVIx/u+UvgVWx/Pcrl8ompYMwc4iYeFJtfXZQ8yF1njse/x9NyV3PPblRQb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8A/MUk1xkyDYNlZMS/K016PAiQqnLdW7I0it2DFNjKlpufJOe
	YaKXq8jLtX5Dmml14QVb5r0uVTqh7zzW8ThEUR9Phl+vwQ031a0GOt/l
X-Gm-Gg: ASbGncuecK2erlL8aqd+WqbB/MCJ4Zu4C671HDuyjumKY5AfK1jG4Xw3vcUNwgGL6R4
	MAvM3SaSTWPhYyCsbFFiMA2Xi5zsWG3M+9UoWZ1CvfixfprUun4Ah7FzWW4toeqH/qEo+JRKvr6
	KihMmaUmYgzCv/TYHidELW9G59zmVO/doFDR4KxNvxqEqQnOeVAUM/McWTpebTHZgQRUogZiTur
	sMBmaLOl7tE1sdhte0FQgZ67Vop5Nh6IVH8hYqhGWQ5YCUWEwvKh87XmN4t63d3Y83DGIUr7BAS
	aYIBsqHtvnURdzMdun8lMzfOI6TWffnmUsETYp1/xUGRGOIGjMq4xtjFOzkoN1of2NWVqevqb3n
	bdzLNxqiGtTRvp9o0TTBCurCegyJMB6Zy4dYJExQqlAgk8eayJDGb/onOFnr/txlaOGKTaf8=
X-Google-Smtp-Source: AGHT+IH6L9b+RAsdBPIs/9RaZ2biO3IFLWe3hSdfFmc60wanjgFfuMqCTaW562R6ttOdauQ5UDfmIQ==
X-Received: by 2002:a17:902:fc4c:b0:28e:a875:f7d1 with SMTP id d9443c01a7336-2902729036bmr315973415ad.10.1760469097611;
        Tue, 14 Oct 2025 12:11:37 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:9987:bec4:a0:deaf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm172402755ad.22.2025.10.14.12.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:11:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration properties
Date: Tue, 14 Oct 2025 20:11:20 +0100
Message-ID: <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the pin configuration properties supported by the RZ/T2H pinctrl
driver. The RZ/T2H SoC supports configuring various electrical properties
through the DRCTLm (I/O Buffer Function Switching) registers.

Add documentation for the following standard properties:
- bias-disable, bias-pull-up, bias-pull-down: Control internal
  pull-up/pull-down resistors (3 options: no pull, pull-up, pull-down)
- input-schmitt-enable, input-schmitt-disable: Control Schmitt trigger
  input
- slew-rate: Control output slew rate (2 options: slow/fast)

Add documentation for the custom property:
- renesas,drive-strength: Control output drive strength using discrete
  levels (0-3) representing low, medium, high, and ultra high strength.
  This custom property is needed because the hardware uses fixed discrete
  levels rather than configurable milliamp values.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
index 36d665971484..9085d5cfb1c8 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
@@ -72,6 +72,19 @@ definitions:
       input: true
       input-enable: true
       output-enable: true
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      input-schmitt-enable: true
+      input-schmitt-disable: true
+      slew-rate:
+        enum: [0, 1]
+      renesas,drive-strength:
+        description:
+          Drive strength configuration value. Valid values are 0 to 3, representing
+          increasing drive strength from low, medium, high and ultra high.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
     oneOf:
       - required: [pinmux]
       - required: [pins]
-- 
2.43.0


