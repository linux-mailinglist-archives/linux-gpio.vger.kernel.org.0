Return-Path: <linux-gpio+bounces-26894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E41BC3A46
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9AED4F84AA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23082F6599;
	Wed,  8 Oct 2025 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnepocsP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660A2F6173
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908696; cv=none; b=nfXTLpsWr6/lgQ0Mjt6HF6lOrpZ0OYEFlcpEyWeWZs+xKejVy7ZyzFRLFVQ5/xH4ybF6jqPtD9njLh25E0HtDY0xEuFrzF6wfRWVOQ7B9ZqaBUEXC8iv9GOoHtMLkN+691ppDL3H1iMqFpdBKHNPWykPcIa4i3rjex7Grta5ZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908696; c=relaxed/simple;
	bh=1E4pIC1QsHHkQt4ekahhKEIh+y+kem4KLZqEezDk7/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfircnr/hWJKHiKybEzogJJMtPNmnySmkGdzAvHTh5cn+kGAG0IF/DcNdxuLECC1duGxF7HWymtm/7xpvLMOCVQtdRPIT4lrDtdIYt2nc3L6A+OYSYAPR0nj5/GNmsX9Sxfl4Ps0gKRgNohZpPDsoN9njOsNUq/XUTE7LQNGeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnepocsP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so8513135e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908692; x=1760513492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
        b=WnepocsPt8VyJCuWn2hFHE02Mohn/IgFbO0gW4nKF5DBISyk4/N6lDchGbyjXkuZhQ
         wWQmw3zdjqrF1BmRMfz0skbK/oFx5+OQTss4XVEroJ9mMMc3w0qzWrtBYI43pd0CJrWW
         awrs9FKtXFeJoI++CkOUONGJ8Cv5EvHlMtJTEHUBE3JsnGeN1sYI1fXaPkN9JjFWN5yG
         i54aWFk+nWzzWH3M/JNZc4rOdVpi0fCZKDrHIDP7vb0gFFnPccxWfM6m3j4baKqGzk1B
         w7IFoezNsH+dGxouwj54xcDlzzh8y2/n9QUbF/hgyfUBOIiCoSS0wSVqx7X3rCUQ+jbH
         H18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908692; x=1760513492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
        b=Fyg0Np3doN7qgD6mBTfQ9Z6mHe7bO2NQBj/Q37KBHiJxmL1WBpKfEJQ9RomA0VfbRf
         m8mRdypU7hYTteE4tBVQbXvdohSYI1ZXi7Xs9RrPSyPjhtbItbzP2ANJn4/x8weIiOFB
         JEpdMrnI3HOiYuCWgXm27sZEKVKkYko9o/oKp/ODUNnZBFdhmHzvKaX68Jgeh0Pp2a3D
         qrjbJaofYf3WgAVaVg4nnlHt36CXGiQ/eWWHRU2xIxa+T5y/1ljSRVHHjkEoJTOmEZ7u
         1iIdT4hGRXSabbl3/qIZReagCVY9XBJrX3YSeSixDkiY5mssOtSgfiMdneCgHmdEShJP
         ixWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmx7HVVzMBF+YhRwGNsL90RPqaZo02u34gTHEmp2v36K3lxLMSzNQriqC6M7j92uEb/JkF9p4SHF6q@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5gZb1V3Rvj1Oq4UIt/4l5sw463XhMrl6xQPJQKgHCiZtaO1F
	dT+BsIdrrqraao8ulUVudmLi4dQ4tkcqUu7XtoaJo7OUzIQMYCv+06Mz
X-Gm-Gg: ASbGncvmELMmZUJd4J8N4v0Usr4QLpUUi4BEuUdCpycj9ZL+E435C3O6wg/Ea2I9IKf
	Z1rjyAjAfcyLqjiVmg84rGQX8CsGEwURTzpzDm8Ma6mzQv5ZjOJZ+UERbo200ZkgY5H1g5KKLTL
	2QglO5E12bMQYoeihgPq9OmQcfR3L8ySyoinHaEAQRGN0HbsYrqPNw1cYIXloN+ybf2cQ25Gpby
	nryludGZTNWCs/Dw9pq5DGJUwL61L8IY1fnBQ5TdNiqczNs8f5S6QUlEyyVtGmqj2lkIHefGu0R
	4okAeymeDEqE+LYZTFmI3mpE7gElOzubI5sOBC0Op59qljxTp/TKtKLvv2aGuf3G3zgYeKluXa1
	kH/pnYmGORlKmAnwHZg4RsdljPmFUgkMQRO9oVA==
X-Google-Smtp-Source: AGHT+IGohM+FjzJZWI2mxJtv1ojEP0dXBrfZwMch9BdyXmNUeB5wEHKzwj5zcjMl3VMz4m5oNM6M4Q==
X-Received: by 2002:a05:6512:3b8f:b0:590:651b:10e4 with SMTP id 2adb3069b0e04-5906dd54146mr641087e87.37.1759908692226;
        Wed, 08 Oct 2025 00:31:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
Date: Wed,  8 Oct 2025 10:30:33 +0300
Message-ID: <20251008073046.23231-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MIPI calibration device found in Tegra132.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1


