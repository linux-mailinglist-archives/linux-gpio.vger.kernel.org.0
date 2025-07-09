Return-Path: <linux-gpio+bounces-22995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCFBAFE81D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C1475A0887
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EAC2D663A;
	Wed,  9 Jul 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="R0+awoIw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC742D7818
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061611; cv=none; b=SOS3eXxma8XMhHSfRVVOJOmWBujK4Ixg3Ag1gU1w3d/nOTC8+vzY/35uCksxr22S+LrsWwRgwFPjaOahjwMKwMub5tud8T7KlJgZQ+lOd5zVWvXj1ZpvFUZeeiIpwXjd+V+8b2ozzDiWD159Mwzhunwb6iUUOSvYn60pK8jG9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061611; c=relaxed/simple;
	bh=Ti52fUIMaEUfyXG/r0ucMDBwGqfW2JIhtAFMWMJATNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfibLhncM/VHKL8S57WouWU++7IjakUTW/4XJzYB7IjQ4NOhAGOHUYcsHqBHj1xAhB5H8CbVcHgRizucZXyyf6LpE40K6Z355Ohelqxq8pv7y5v92MK7BS3msqzLD+EHLH4LpRq+Ve1mLBB38tOqJIG5s7PYGvf97W5iC89tO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=R0+awoIw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso10506590a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061608; x=1752666408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAnJzWwXKrGKXfHhShQFByTC4Yn9/Fk4WT3ljFDRPy8=;
        b=R0+awoIwfU1tt252Xbern30X2JitnNWYSShuLC2f7O/1OVJ8ZqKGm3y0sDeTZ1/XL2
         GzOQtkaY28GFj8bki5xKF287f6rq2V+1JDVuUq4b+cMxiCHjsqdOWDi0XYsEJuVfGp+9
         KGKHWLRkNzxuUmW1OExQ6Qd6H5PcFVe8XBWNgerjS6Xq44Ikf0XSLc0FYOh5hR3nEoCt
         MAVRBGGXQvcf5IHobXhGI3Cn6lB47ba/hfMKlQCE+E0FoOsJOm5nSNR24dtNfVa1f5MA
         7VODwydLLR/lh5v8rbKy2XtdQ4Pp9S6gU4ZZsTMU4LfzMDjXkArXVUi54Nypzm1LYTxb
         U+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061608; x=1752666408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAnJzWwXKrGKXfHhShQFByTC4Yn9/Fk4WT3ljFDRPy8=;
        b=dFFHfiTs7uzlDZFxzEaii0ssKrB12SBSCdXx4A25CssgxwQzywr1dBW6AsiJrgojfd
         EXEE2klL/sYgcriCVyoyPgws3clmdzpwdoO1IB+/NmVy6+F1v0Jfec90vrJClLwtvwI1
         ZhP0EQgl6GMHq9Nk7+NwqRhJybpLhS/F8wy3chzMxCakkwfpoxgP3aYfL34jXd64rNBn
         q3D1H6COnBVD6dm43IskJVwhGL1AxMSOYEFI4/PfWwvUl7pNGBBzwlBdE3MEG4/PXkfe
         QK5OZqewlmw5UNpnEGlo8q8wZv7Mwl1v5GDfKs9v+y/X3hCVMP3odvw41cv5j0KBJVq/
         Xqqw==
X-Forwarded-Encrypted: i=1; AJvYcCVCQBXF5PSD2B1g/Z+pCy4TuRFRDdu8rTHiGEXOYhCHcn7lqZwsYVkpa6Pcpg3THCJT1drx3W59wQSZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIyH44sZsvxgFhnC3pquiPns3bRfOuOw7rax9uKqQDtiL3zsU
	vrGwtEqprTVrB/2A8G4OBxQWoCLiBfYDawZAMqcntIFCEWhr3tX4Csr2GetbUJeJFas=
X-Gm-Gg: ASbGncuSqWSu0jr1lwDKM26EM3x/uK+nDP92PND2nILzITnULCGekmhWGbDaUDnWA5w
	Ad2+gsbnJTEuFbK8O9tx95xDUEUmZH8gV6UJZkAZeOl/atSmFeyJNYoc5gj+cT1rcesow9773Iz
	2f/AJRv9AfMr63b2ppVcHI5zKQ6K9x1SZfD64fDDYYCjmzDof4PQVokd1AnTP2pn1yUPdSaMoW8
	FC7rJonjxm24pkDWS6Fc3zMfw3oZsVwZzR6bZJndr76i7NMHCZ6ys1EuT0nZDhdR7uV8wzusZXJ
	6llgwePS4fbHJX1wEbUusVdtw7+TD64H4oH2zQDd635IXNq9Z0beAQ1xwt97uH4kdbzLfw6gfFj
	ZvlzJe51jelnEXiau6MK+BNCk3qRimPRY
X-Google-Smtp-Source: AGHT+IEA2gAxDmVGoVvlu0rJ9OiSZz8Anqd/n4DMxrx//OnDKCpXUaD5KAn6BsoH8yK4ZuVKq4o9pg==
X-Received: by 2002:a17:907:3e94:b0:ae0:d94c:f5bc with SMTP id a640c23a62f3a-ae6cf5e23a8mr235455766b.27.1752061607628;
        Wed, 09 Jul 2025 04:46:47 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:47 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:34 +0200
Subject: [PATCH v2 3/5] dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-3-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=1214;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ti52fUIMaEUfyXG/r0ucMDBwGqfW2JIhtAFMWMJATNg=;
 b=qtldo2h/MAR7NtTwbnEcZm5YVQMx864QsG2TLcCQpDOVijGGylryftoMwPZtuNmShCkL8P8rp
 VTVRcfBekK6DJ1VgmBr+DE0GRt5F4LllSgl44oQMkd3+bMKUvI2au/0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include the compatible string for the PM7550 PMICs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 055cea5452eb62ab6e251a3a9193d1e5da293ccb..04957fefff0bb72d5dc6d29bfa4d87ffd37ab8d7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,pm6450-gpio
           - qcom,pm7250b-gpio
           - qcom,pm7325-gpio
+          - qcom,pm7550-gpio
           - qcom,pm7550ba-gpio
           - qcom,pm8005-gpio
           - qcom,pm8018-gpio
@@ -261,6 +262,7 @@ allOf:
               - qcom,pm660l-gpio
               - qcom,pm6150l-gpio
               - qcom,pm7250b-gpio
+              - qcom,pm7550-gpio
               - qcom,pm8038-gpio
               - qcom,pm8150b-gpio
               - qcom,pm8150l-gpio

-- 
2.50.0


