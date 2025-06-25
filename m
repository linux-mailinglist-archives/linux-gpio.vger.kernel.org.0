Return-Path: <linux-gpio+bounces-22156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BBAE7C93
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD85170C7E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D993529B228;
	Wed, 25 Jun 2025 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="q/Q929zu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CE29B226
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843102; cv=none; b=qKG9T1uDzDeksiDmoLdKIv5yKuS1JxGnmHL5sDUOKACufb733n7Zum0WPjeUbfdvCMxcU1ldS7gC6R5996fF7RUBfV+oBrkGSZDdfwurhZWnVy7N9E/1iDqmktogA5ToDHsjeMPa8kygCXMz8dR2X8Qoy6TUxfzCL9t/IAszD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843102; c=relaxed/simple;
	bh=Q3TGw5jKUPEUtYzxcKC8T0udP0qtpvhm4VtR+KWN6RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeijXPDfYl3QQt9efxTr2WOWKxC54iV8nar69nmBkiUkJqou1JhfR89tUPNsYre/dObFvYei6Ai7TE1KQtXZ+PVUSwNa1mB1Cvbg97Cr5RqX1NBR01mozUxXVYiBHoKWsrQUzjQyIffr0YtmHCev7ZsD96W2MUMwnVgBiKvRYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=q/Q929zu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so973976366b.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843098; x=1751447898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQxJGrv8Sfeyse/iafOS7hEMMX9eU0Fpgldk2ORUTk0=;
        b=q/Q929zuX4RKUnUDTWrhdJzrNbhP0slBnLwSKFEsHRQJxJGQ7/dpn/+XtWETDqZO8K
         I/82l2h8J5uiCVBQXeQXeX0wyjZhjoPqap2J9lFCblWdQ/g1XAyYaxcd1Eq/RRZ9G/gm
         4XxFqai49qg82ar4ehgBbxmnvZ8OaQcU17NRMQHUxfRaxwqlqc95xbV8JtIAtk0+ArYq
         qXJyI1QWIOm+YHGua20i7d9xkxQdtC2VFDRwrYL9BvDivKBp897Zu9CqKgm2pDENaBtg
         CWlZYqRZC3EIL5XACiw5CtkfCskGy+swsDR7mX+Qge2fORD0dSmT8xvUOxkt8XvVdP+N
         z4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843098; x=1751447898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQxJGrv8Sfeyse/iafOS7hEMMX9eU0Fpgldk2ORUTk0=;
        b=BFxz7O4ssyitYSmyttU7c9ULIKWZw5f+ZbfE7pCKzPYb40aeItAaZVwG+UKWmFtMRS
         Up03KiTcNYibv5o+N1gWVSynKT1cGnSLg5FllT5CAiKZug8rWKfN1p8PmvYknKrQiRR6
         IdHjBQFKTUVSYU8yR4D4D0Qt/YYKE3+Fpz3eMhp0ZzZDQkjRnaVOpjnnfPpISypAXWvg
         IWCJ6z8S7msIQS3kocmn2GvVQ1B18BBnJ26CYu4UqLDyDEWQe9radjedKzMngl1vkHSF
         7+OQKi35khRusjE3tsfRw+lFbfDC0bjUbrdNOUal2shH0qo/wI8zg0+2Ped51XGSTWU0
         g4nA==
X-Forwarded-Encrypted: i=1; AJvYcCXEuspcHRDPzdII3+LOt+zq7GQudBHxas05yIsypjQlgpiLklbmUz5nD4kALfRPhXHhBqGc5UUlXrJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKZk4zHlECCL9mze9p2EV+7OVTJH6F5cUb6CZS8+QCtlfI0FN
	1lR4QhGig13d38WbQxO/tLvJSwufeM0hxi8E4Y/aAhXY1SZtIvu4fVYi7NNCwK7L3ys=
X-Gm-Gg: ASbGncu+/+8yOU+Ysj2lGa0wasv7j7whqbMaLOhawIj5crIJ6JPslfvfi9iTQ8SzlKS
	MTO9ER62T+CNfeL3YCQlU1pssoFhRQMMsAEEbNaj87IVjkz+4ujxsNswN6x50XD/PdBy5XCcIPU
	YnlnmDlWuGmXoMGJ2aZEQ9GQoD+vG2D55WfGByLRMLV0D6o1FgIhsidxWHAESQ+3RGc4vX+L7Ne
	0Wphpx4e/MQoahdTmHZK/w3YQ/P4yYfsD96dgJKrg6/GlE2MZTr2CObDJv3piyhdq9nvBIUho47
	chUZWFw8pDGdnLJl7YFF+0hdWRnAXv19LwUNhzcXvV+7AkEEn6TGTNxSPC6CSHWYsEm9Cn5qPp0
	zQXMvnU28hilFGPrvNDBaR91E4V2PBL/1
X-Google-Smtp-Source: AGHT+IEHp5KgbVYQEPDjHDMZCYsZyCxSBmN0Q+/INM655tircC+AtoU2yigxwjTotLgnk+tU0Cxf5g==
X-Received: by 2002:a17:907:97cc:b0:adb:1eee:a083 with SMTP id a640c23a62f3a-ae0bef40ffcmr206735766b.47.1750843097562;
        Wed, 25 Jun 2025 02:18:17 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:03 +0200
Subject: [PATCH 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-2-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1190;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Q3TGw5jKUPEUtYzxcKC8T0udP0qtpvhm4VtR+KWN6RM=;
 b=UFzRWgGItjDN277ZvG16U7Qgw4i6csFwyEmLDECaQSkQKOGh3ZfZ8uRI9WIKgcp4IXQfoJ+Yi
 rNt6NRee2WRA/kgILpUgp174ERZd+fljyCY4IkyiYVR/dxw0WOtheXW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include the compatible string for the PMIV0104 PMICs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 055cea5452eb62ab6e251a3a9193d1e5da293ccb..e8a1f524929a710a6a65ba3e716c697f24524496 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -64,6 +64,7 @@ properties:
           - qcom,pmi8994-gpio
           - qcom,pmi8998-gpio
           - qcom,pmih0108-gpio
+          - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
           - qcom,pmm8155au-gpio
@@ -228,6 +229,7 @@ allOf:
               - qcom,pmc8180-gpio
               - qcom,pmc8380-gpio
               - qcom,pmi8994-gpio
+              - qcom,pmiv0104-gpio
               - qcom,pmm8155au-gpio
     then:
       properties:

-- 
2.50.0


