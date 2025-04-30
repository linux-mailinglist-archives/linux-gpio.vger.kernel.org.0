Return-Path: <linux-gpio+bounces-19503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C91AAA504E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6AEC4C86EE
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 15:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF2225DD10;
	Wed, 30 Apr 2025 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="Cyq7OFlq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944138FB9
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027179; cv=none; b=NzdrJ+PirQkwinV88H4aTDOX5zslAnsSGdi577Y3TlnPPtC4wh9T5HG03sNqldD5HiettcRX5WmLGuNo2aqlCHfSQjEN6xHxkgDKauO6aXbq7WearUetviU1hL5r+5ID4W41U2pEgckoFA1O7JbInz39ZqZvs+XX4IRIUghIfVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027179; c=relaxed/simple;
	bh=/JDey4FU4P0QUZ3U1QjVg4P2FtVicPr9lHY9lypG6dI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hiRjlrqkyd1XRZqgZJC5yTIfTIy73aIqZzPZylkiFjl5q93cJO2cSJx5TcOEAh9bxRw8UhF+zz8UrDbNydyc7QIQbnAJL0sE+PAjBQDOXPt2CbQJpNk6CzMtD0Chy07v+YHH5bnISt3N8xLfA2Gb8NO7jYW2dS7Q45Wu42n7eMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=Cyq7OFlq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so11756120a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1746027175; x=1746631975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2yW4IzDdMLC+ISL10lrfjeXQ0u1JQS4Zd6C+Vb5vP0E=;
        b=Cyq7OFlq8yzdAPhZaMoB+mLZim1kjxQuWd0YTzb6V5i+td+yhqkAu0F7yGr/keF/0u
         hF9AoBz0Mny9s9YzLsIx5bh0iQKb7qpAQG1LyC3t3GYJhdDj+fd9i3wsssmGz7hS9nbD
         nW4cKLyFWNLMYvuTuaTHi7DM/4bXnwTf29yxYr9HQZJq7vZfLjti4KiJvP8ovYPmrvdG
         i/VoPTWee181TA/ZmlQXyisZ2E2rtT6MuwYso72dweeIAQ6SBD0Oglq3pE5O+sbRiOBl
         FpYPlu+575eU/oAqcS8A6p0DmB26rrpGzsBXToS5KtL1k6/3vpPvg1uiOjJDXU5pHOTj
         1NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027175; x=1746631975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yW4IzDdMLC+ISL10lrfjeXQ0u1JQS4Zd6C+Vb5vP0E=;
        b=ftwX7Y8zRXncEeHhhinWF3UY1i5Hrpocgz2hNiRu/rPNeux31dltSeaLv642wYxaCZ
         uM9/zxeHLIAj+63LP4+Qct8+TF2cQk4xkyV904jowXXFhB6xNmXwesmv1mhlCMHRAlvG
         IPdL4WXPG4ivWD2ziJefjruFdAJdEhEaFoHpAq5CS+fhzA0UrXHXiSypNcNLyxrLJlaM
         gFcotd33x092md8CYCNzp0ADMwfndptrIhkzD5khmVN/cTbpeEQLBRR9i553uEadFMDu
         sbp+yihJGNpfpDTmJDJmWHoekG49oGEksFOFm/dS66is0EOmPADRoLGQnIaQCPdVHKvB
         gtFw==
X-Gm-Message-State: AOJu0Yx7t6CBMH/4FQBsRqjVVzwHVCJrDCwq0Ds+C2a2wGlfwFlg74I6
	iAYyMqt9dfywtJqXYGG8dl8Neo7O7/EdVR8BBjQPnfsnTck452umNjfQuNNCwCE=
X-Gm-Gg: ASbGncug93yzOLPS96gKX9z6PGFbV1pKiq9eoG5nboBSrCSzVHIE5BVQkHbPj6Cweln
	vISAUA8bx3Idz0pbT9iXvk6bmNBH1Nmf4y6re6gljEbi+OCo+EpEZit+oErNwxmgJsi34nCDkFy
	ykDe8JlcvHH7MAH67FYF6hAH5QnP+v8/HAHyBOxu5Lm7OfF1M7ESwGt7N4KYa18K0jUbeE/X1Mt
	EI/79l2tRxlKylWrgOoqLFjuAh7GcPN0MfXRVQmNG7YGBDFszIuQlCsA4Vi+p44V8fkrsO9TkAh
	IfqhJ9hxdTpKY0ddHN7fsdJ/TPqkzPqfGldmjQs0SCABOmQMkaCrJbuD
X-Google-Smtp-Source: AGHT+IEL5/+RsQSF7TYc17i2auHKOvrGNCSMLsnS0CnF7H7Qhjv7jm1RqolFT3S6nwkdOoxrpFsV2Q==
X-Received: by 2002:a05:6402:240a:b0:5f8:e853:1f8 with SMTP id 4fb4d7f45d1cf-5f8e853020bmr1076156a12.17.1746027174936;
        Wed, 30 Apr 2025 08:32:54 -0700 (PDT)
Received: from fedora.home.simulevski.at ([91.65.134.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f701106bcbsm8670914a12.10.2025.04.30.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:32:54 -0700 (PDT)
From: Ariel Simulevski <ariel@simulevski.at>
To: andy@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>,
	Guido Trentalancia <guido2022@trentalancia.com>
Subject: [PATCH] pinctrl: tigerlake: Document supported platforms in Kconfig help
Date: Wed, 30 Apr 2025 17:32:39 +0200
Message-ID: <20250430153239.7137-1-ariel@simulevski.at>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tiger Lake pinctrl driver is also used by some Alder Lake platforms
that reuse the same GPIO IP blocks.

Update the Kconfig help texts for both drivers to document supported
platforms and clarify when CONFIG_PINCTRL_TIGERLAKE may be required.

Supported platforms:
  - Tiger Lake (all variants)
  - Alder Lake-P

Reported-by: Guido Trentalancia <guido2022@trentalancia.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Signed-off-by: Ariel Simulevski <ariel@simulevski.at>
---
 drivers/pinctrl/intel/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 248c2e558ff3..f1114828457d 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -54,6 +54,9 @@ config PINCTRL_ALDERLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Alder Lake PCH pins and using them as GPIOs.
 
+	  Some platforms may reuse GPIO IP blocks from earlier generations
+	  and require CONFIG_PINCTRL_TIGERLAKE instead.
+
 config PINCTRL_BROXTON
 	tristate "Intel Broxton pinctrl and GPIO driver"
 	select PINCTRL_INTEL
@@ -161,5 +164,11 @@ config PINCTRL_TIGERLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Tiger Lake PCH pins and using them as GPIOs.
 
+	  Also used on some Alder Lake platforms that share compatible GPIO IP.
+
+	  Supported platforms:
+	    - Tiger Lake (all variants)
+	    - Alder Lake-P
+
 source "drivers/pinctrl/intel/Kconfig.tng"
 endmenu
-- 
2.49.0


