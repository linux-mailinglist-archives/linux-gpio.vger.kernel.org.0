Return-Path: <linux-gpio+bounces-18012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF40A7190E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2B9189DAC8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4F81F63D9;
	Wed, 26 Mar 2025 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5N0hj2m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A71F5423;
	Wed, 26 Mar 2025 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000008; cv=none; b=HwG5XfDlZ3+0d5/5KxR9eF3aKoJl4UyukhOdi8WkN2hLFoo+mfow083rwMWCXuMMyooSZnku1P+GWiUl/02e+TSyEOSjTnc+zptjSD9HvcDu+sYv7iimYxOsy/5BU5hbqZgZC2p8brEG7+YD14kuWyM1ozWAipFnSfhnRrA8AnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000008; c=relaxed/simple;
	bh=CBjahAx4C/1ROi+dFt27DdZY43Juz4Iuu0Iih0QWN8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvCd3K7WiXOLgkhm1OaHIAgtKnz7icnePaw/6aL1aAgeJAZzW2oUWejpVbUqVQEu2zIGDpvIfFDMWM2T5hcHOdxZw4tzqqrMqTETgeSgsqrG0HlP07OIHD9g3v1gcIX2myvfXK6Ys2ZuIbMphSEPmOblaCFyrwqlg5F8atRd6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5N0hj2m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso45183595e9.0;
        Wed, 26 Mar 2025 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000005; x=1743604805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBeXjQIPHX/DPtw6MHzZgLXu1uaUvVTtJA5pM8jD9SU=;
        b=K5N0hj2mafa+G++tAyEbG/IJYwqK8fSUPP5IlSHTjASYVyh90co7pJ39HK1iinC52+
         6D1WO2km6ixPDmKvu/x0iPoWQ8LH4rxYvNIXBFYQABEp5vZy/5wn0AEdWhO1nFwLnZmH
         u8vRvgzz99ztbKXYj/tQM3X4td56i5li8xCyIZ9N+fZOnYEVPPkH4MQoMZdMRaSU8Lln
         sK2LM4JV5X48jD1p6ljARG7uyOhw/Z/dPXH3eS+FvfCro2kvDHq+dOIWw6f6wk4AuOR+
         PP5Vc4ILT4S4LLi2hlYdEGicpTh3S9/HlrsJXcYIXBjNmb6uOL87KEG2C+MHPWKktHTE
         en6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000005; x=1743604805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBeXjQIPHX/DPtw6MHzZgLXu1uaUvVTtJA5pM8jD9SU=;
        b=EhOQiAo+zOT5niYCSorW/b6kDL4aXVfbXC9xFggR4cKgu7Qk7q1IQBWCLz60vcmpkl
         ocLnZZ3tBOjck/aXp648q8Ranhmk3O3WDBnKcGs3cqZZreYh1puiWzYItdTkt0pxqKHK
         o45fX91TM0IExTM6ZVnDCM+YgxdJqLzabBaXlEpRnr1ZnHJvYls3p/6KervDEo0bwg/u
         C2g15bwPqsbgAfCXjeT31EIaNuve9d5gEq9VLjj3FVziyI4H2zPPcjAS+E17W+tkAoQw
         DzsRC1XP0YvJ1i2XbHEEW4t9NbAPDI0eF8QIzs53CXIQCvTa4Tw104A1aQR5QtgNc0Cu
         P21Q==
X-Forwarded-Encrypted: i=1; AJvYcCU930iiavgSEtmDuPbRhxKqRhVvZb3z75ct2XWD3/kyts1o0AoYtjUViejinA/5Hm39D/6R+cIMFk2Pgz1M@vger.kernel.org, AJvYcCUHE3RAI4LaWQ4i4zRIgZWpwMDJGAFufGzxTO3BSWwfLVbkvfeF1Jce5wkm1kdHTCQPu35Nf8oY7rdK@vger.kernel.org, AJvYcCUPI6BmjzYuwRsdgOJlqrkFBS9NZfh0OHFlJ5b3AARLflQvZuLSKN9NM+wUQ8z8GJLEe8NUgA2/m5//@vger.kernel.org, AJvYcCVVTaQUboYm1isIre/sFU/aHN9NXhngeycvHJnQPlMhsNGqAexAjR4iPSWhI94OSiYtXXvG+GDIQBk/C6LO@vger.kernel.org, AJvYcCWUb5MQwiiOVlvkj2uUL8+tX79qE8vKgE0qiKUcg1dgLRmTUTVPTNTN8VSp2TwqOt4kKVem+o0usG12@vger.kernel.org, AJvYcCX0sqxSHxTES24NIZ3Siryw7y19Re0MJPeyP0AJJgihvkuRJAdp+agRKdCNJYGuGxCF/+BRWwSCtXsltQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRcRs9j4mSQGuvdTgECNkq8tNRlUw+nPvL6q9yrvdvj1/M9rKc
	h1ub+duayc6naND4FmoEHtLY8li0LONQQnzDu2xAnRHi+AHPO77i
X-Gm-Gg: ASbGncusm52mF1/z3MVn5d1eY2luM0DoezjuGhcusMSKk+iqz7niLxum6kytbb+B4tc
	96Uyb5FvkwjPont09WCRLiw+OmaCfwT68Kt7+fw7MpHnACBoPdAi0Ux5KsTG7O7FMq62v7uoM8s
	d8tTebaliHV+mFilKpr2dg4pQ3n6cljy4f/IpzEmAGfQ39NKRIcfHau/xMvuOrRR5CRKJ5UdWTT
	mb7x1yYxOcOTSeXkc3vddKgjrpsAn4WrFm5l9XsvCcce7QDpE9Ne3hjkKg1pUOe9OI+Om4dDWYa
	vCRIPWqaF6u0OlDVo9+sk64MsESYtTBSmBi9LTXmGTZWJ/bWuSanTl+Mr43pn9ImSQCp
X-Google-Smtp-Source: AGHT+IHGBMJEO8+R7DqUEz8hzHGBbhkdsO5wRHl9G7dczHcBO14XnWfcboERE9FalZfCBAPnpCJUfQ==
X-Received: by 2002:a5d:59ae:0:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-3997f9336f0mr21916870f8f.40.1743000004776;
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 06/15] dt-bindings: serial: renesas: Document RZ/V2N SCIF
Date: Wed, 26 Mar 2025 14:39:36 +0000
Message-ID: <20250326143945.82142-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


