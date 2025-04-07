Return-Path: <linux-gpio+bounces-18387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED430A7ED56
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD5017F010
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1D1255E23;
	Mon,  7 Apr 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPs/AV4R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECF522FE18;
	Mon,  7 Apr 2025 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053409; cv=none; b=BMRzUB9ym8tofHIhhDD/+VluCr4Kpj8Y/RdMVIU16jZiqD1+LKmVyT9JQdvEFg3kr/M+eiwRt+sIx9PDYI9EBCvsJznJvKyk6f8fAIkCw5ojTrGGzZBhXnAasBdYGMhanuhp0TxVcAd+dopZzsi57uqfGeh2EWS9iWVrZV1Awrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053409; c=relaxed/simple;
	bh=imOuFohnKgH66S2bWXUSrPwtsnw5SdFHL0mYzvWwtY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaLKzSdTI9yRcXNcT0BULlmNEl3ILaiHIX21nT7wS1+KQOgoPyp7q5N6hk1V3GnOH5eGEqoe81VV50bNJZcs+2HKjDkx0rf3sXAk9ezWgWCo3Lu1e20R91pQ0SnTdIdBFVx7kVYSDrm0e1Ei0La1C6+u/fWpvJIen3zPiccS0n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPs/AV4R; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3996af42857so3726658f8f.0;
        Mon, 07 Apr 2025 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053405; x=1744658205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYNxwsOXV61ZIb2V+AByCyO6GoIgzrYrBHxopDXUNTM=;
        b=hPs/AV4RHKcxkQJTj1e5aIHlpbMZYUk2EiZ7G8+Ir93urIMq9ZS/j1pcfsKjqHXAnJ
         v5FwW8VdLwwwzysavBglx6fmVfYQRuhgnOkeng/psUscINkagZD/GGn5Z4IF0IbyMyDA
         WtheeLKQ8Eqm8XLZLo3z52SA6N2T8Qr/I9sy1VcjR+lzgtxkPQmVUd6TT/e9NngzTkC2
         soGwaHC6adRrbzEd9OKc09p7trK2/FZdmzPBQXi3rwhvQqBF2N84Hd0t1Se/TqXfssp4
         HZblmg6dcrECM8ReVn3ltqMQX/7kBwfvoV0aNLCaeHc1GsEk6l44rWrRhL37+bj2P+A3
         vpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053405; x=1744658205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYNxwsOXV61ZIb2V+AByCyO6GoIgzrYrBHxopDXUNTM=;
        b=jtw2RuTYFL0BzTT+B9QbaoO+IOQC/kyjQ9FhQ62IH0DERKq2/xz/kuDNEE5B+gaGpM
         NcsuwU7xcFfc1LJ2OPtaz/1Xs+f2P8E17TBBWOyHUvi20AYnf91FoU0hCg2HtFUnCWJZ
         IkfO7/fBD9j0I0zsC1HvsMrYX6oNUP8PSzv9CK0iVIzSK1aSly7RzF99NDDKNsNRSPiL
         p33MFfzptWvXCvkZJRrSD+31cvI8APiNX+w+tN0Mze65cdackcDj08JduMPmEpTqVz1p
         j6niGOkP9uvyoyFV+lIqXM0hGOBb4FV9xoFUbcs+yJsbdG8R5CLAwhoAnDtXG77SRCFn
         wSnw==
X-Forwarded-Encrypted: i=1; AJvYcCVyz0XXqNsMsFIP0udebbJzTYdvnZYRKqJMq4PbtHPxnlfd6mfSJQ9fOx425cEnWrivWCB8SvaJ70pHsQm0@vger.kernel.org, AJvYcCXF2Z6+86QVoL5LwpneB1mdMQflYmFsHny3jryxxI4M/Jlhh9uejrtVqJVl6TletziZda9N/qJYB1B/7Q==@vger.kernel.org, AJvYcCXMx7992KCVhSFAUwqecUWF+kogDkfcb5JNkvPdfRnmdvDQY1lmhLaJu0VNHe5IwwvGKQg4WQ+l+nqb@vger.kernel.org, AJvYcCXP3CorOaQTkoCU9opHTyaLrRANEUUQBWtZhquT9gW9q4STGsLGrPHBDz1h7Gg46ty+BgeQ49MI4HVO/PjM@vger.kernel.org, AJvYcCXeNkVdDuq/PO4npaJ9UtLkrnxPzfvUkpJ7dnfACVeeehlSmAtgnVoLDEY2DbR9ThBqTnHm0xX3lsp0@vger.kernel.org
X-Gm-Message-State: AOJu0YzQn2LMSAoYjN52UOYuBopR9JU66eRn6jKksVzjg02SmDbpKPox
	KlUjapAyHD1bdMFniAud6r2Ic444IxDxwFmPohrnrRHUkiT3pom8
X-Gm-Gg: ASbGncub+iJUpWjtLCkgSJMGalyKH49Y7TeuMFNCnyxxGKu8W8zwwSs8woapK5ES1ps
	/MYvr+kcItxjb4lvu5RQl556vXIGoSdmGT34tL/J78sCY+4AUWL4Qro5QgP/QQqTHBqWZMfj6TU
	evrAO6sz8DvwsNcICc7dnxaa4Fp15tpV9lTubWRXqZRd9tRlEynagNGE2dLX8kohS9FEc9mUx+h
	ic6cV4HBgvzrpYsnpG75raTlovB6dcrex6w7O5tnW5Ud+cE6/gXkOCu7lppg7Zj0zHLxCl/eTA7
	zcTrn244z6e+LXolknUynaH9lQaelfUO34SErs+GJ0+BPw5wwnMqKvAJ+FjnhzKphg+/6w==
X-Google-Smtp-Source: AGHT+IG7ICPPTHu+cp/DiHodwopL8iqd584OljfQlkAEqpWQ00cRSTSRsix7Y3A6IW3ZiUru9eR/Bw==
X-Received: by 2002:a5d:6dac:0:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-39d820b0a1bmr542685f8f.10.1744053405018;
        Mon, 07 Apr 2025 12:16:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:44 -0700 (PDT)
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
Subject: [PATCH v2 03/12] dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
Date: Mon,  7 Apr 2025 20:16:19 +0100
Message-ID: <20250407191628.323613-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add the RZ/V2N (R9A09G056) variant to the existing RZ/V2H(P) System
Controller (SYS) binding, as both IPs are very similar.

However, they have different SoC IDs, and the RZ/V2N does not have
PCIE1 configuration registers, unlike the RZ/V2H(P) SYS IP. To handle
these differences, introduce a new compatible string
`renesas,r9a09g056-sys`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v1->v2
- Added ack from Rob
---
 .../devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
index e0f7503a9f35..c41dcaea568a 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - renesas,r9a09g047-sys # RZ/G3E
+          - renesas,r9a09g056-sys # RZ/V2N
           - renesas,r9a09g057-sys # RZ/V2H
 
   reg:
-- 
2.49.0


