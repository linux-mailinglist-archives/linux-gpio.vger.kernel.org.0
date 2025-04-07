Return-Path: <linux-gpio+bounces-18389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF660A7ED41
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F6E3ABD27
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781DB2571DF;
	Mon,  7 Apr 2025 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVHqofeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F743255E4D;
	Mon,  7 Apr 2025 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053411; cv=none; b=bKPwslfxww6NiGEDLbcqL/sDQaIHYF4HzIqAYGyyXLhpMev3RprdGU2aBDHYr5VepPaGxA1J0KyoC34PnMs1BZ6PATpR2XaSIEJB/FCwp54EG0l9MZPkQ+QYlJo9a9Jk2qJtSJsa9uOagwx0nwz6srpNnuC/ELCTOdpPzZptsH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053411; c=relaxed/simple;
	bh=SmTuxc2HGOzfxxNBRYMYd/IeC5sthujMGb1ZgFuEZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwsD3yyyTESai7J5AZfx37YCx9/hyn42aWLZhJFUuRNCCHUwPTwqv7je+qx2tLF6DYjMJY52lKmwSj2w9laZywjGfii+xv029kmm1XyJ00/9AnuxDWN1vOuoKmgIKnPFURmybmv7sxhbdRR8/4CjWyeszbljMCQ19D4mWgBDW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVHqofeq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2717306f8f.2;
        Mon, 07 Apr 2025 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053407; x=1744658207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA6ZUvEy/4+ltDUb9fT4BjjBeieA+DxAavUGPyAkjIk=;
        b=eVHqofeqlcjR9GQIRbRa2298uwuM7N6WprSJaGwbx6+dzCYeLs5yq+gYf1DISh+2IG
         pMzmKBwWFbn2uAzECBGQsMRRJEA8rTKjPWAj+LskI6iVginsemUdhPFKcthaI+2xpImz
         5LdquQSGYXfQJdgo0otszdehqS4B2VC6HyMYgx2EFM4gWykuO5J6nMQc+WUUdNyOoVnX
         a5dyFWyGh/PPooL9NMaScfT0Vg5aztvbMvn5Di7h3srTlluRUAn9RU96AVSQAKcvMOCl
         GqHwTA3TJkqX3fsbQlNJ42CH7QnnSdIfB3gLeBqcps3BY15Cxf7mk+iCoJiCAxstD43N
         KvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053407; x=1744658207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wA6ZUvEy/4+ltDUb9fT4BjjBeieA+DxAavUGPyAkjIk=;
        b=WZ0kMw69HBzmtUJRZxTqrqc02WDJoxtuMmjVs6RrbKTr035+3ZBx3sgduTfHcKhJry
         CeCOshirdYNxAiIezJaEmNhRh5sG5Yx2stgCpK00wJGGMCCK3gQ5Z9CDtppIEhpcHoTf
         t7qvSz2tA/Xmvf7mS5rdpYbGE8MyWFzFFH6IKG5V6Na1/Yck3GsPgJhZhRjV6nx+rCH3
         xCRABEbCII2FOOXHlsyTUUzAQ118n2+CEtew+KZCML7cliHDWhhWjh2zVen+GJ0uA7tD
         O3qy3tjCVP39A61RDNDuhpTUjGnx6SYnrODTOXY4Z1O3R6PhgiHIiQ7SACG542swzLNp
         J5ww==
X-Forwarded-Encrypted: i=1; AJvYcCU8q1ibFtfZNn2hNE4iy5cHoZZlxCPgpAiNInXoc3VRiIS4cERt3tvYnFt967KAOZzE8L1kc2rc8Pzy1Q==@vger.kernel.org, AJvYcCUilxn1qEWCTB0pfZWbhHttwA55YLwaXCsxYYADeZje8ONYCOhTPJ6jexJxXV6Gb81YQEKsKsGXKeD4lMOs@vger.kernel.org, AJvYcCV5mFM40DfIWpEuEgchXK4lEbHI5A/sOEW/jqECywf4PFzuxk0e0g057LoOW5110FyfVduPdiL+LvpN@vger.kernel.org, AJvYcCXD3xMDbuJfL1jYbfn6reBPudGyWP9yTBOd4qax0h/JfaJ6ObBonWNl0YrqtByz/fa68FzObVhbI78X@vger.kernel.org, AJvYcCXmpYAIAzJIRBNqJ/4y3M0oRoxEtMdI7uWZnwvuPGF9LhJ6iQKQqKfDgU10eRnr6RPllZDA2EBFILh67D1B@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVBR59SNy7Y4iG9WrjDZ/bFuyuenqsezdIQf+oZmXuTDiob5I
	JdWj9OxpMawEMoSpooQMIaioSepl9f//Pc34XXumFSmCgxAx4l7j
X-Gm-Gg: ASbGnctyu51d9mjAe0flKk33pgkVdWllW8DMos8lJK3Isre74Q+SQ2/PHOMu6Z/UT4l
	IsnO/j/13We+ThW/LMV8pkkdRg7RoZJgwE7OQWEGJ8ITEyLW/aOb49mgqiyyyWFjvmjzO3y5eGQ
	pxn7/PfNe/KOY/Hn890YUFH7dzAcPFb7033sATsg5T4CC8N7uTPPt6PlzpxFmFRx/Miy3jcncPZ
	sTzFK+5iyyDXFm9KqDTuOwWTesTEs7KT4V7OHFVnw7a3GN27xHOimjBeob4vkx4phsF9wlJqP5n
	r73bTy1x/UWhRx2r5XL0DXZF76+80lpr9VKQtqjDR6oFCkFjYHXTGSuBz+wo7C22xpPjYw==
X-Google-Smtp-Source: AGHT+IFumSbFscd6T07THL7XjBoLWFyTAUJ3VH++zkKA5BX3YNUXrSLlr64sUnNMzrS9v717lde2PQ==
X-Received: by 2002:a5d:5f93:0:b0:39c:30f9:1dff with SMTP id ffacd0b85a97d-39cb3575865mr12032263f8f.3.1744053407409;
        Mon, 07 Apr 2025 12:16:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 05/12] dt-bindings: serial: renesas: Document RZ/V2N SCIF
Date: Mon,  7 Apr 2025 20:16:21 +0100
Message-ID: <20250407191628.323613-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document SCIF bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC.
The SCIF interface in Renesas RZ/V2N is identical to the one available
in RZ/V2H(P), so `renesas,scif-r9a09g057` will be used as a fallback,
allowing reuse of the existing driver without modifications.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v1->v2
- Added ack from Rob
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 8e82999e6acb..24819b204ebf 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -86,6 +86,7 @@ properties:
       - items:
           - enum:
               - renesas,scif-r9a09g047      # RZ/G3E
+              - renesas,scif-r9a09g056      # RZ/V2N
           - const: renesas,scif-r9a09g057   # RZ/V2H fallback
 
   reg:
-- 
2.49.0


