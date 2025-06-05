Return-Path: <linux-gpio+bounces-21033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820CACEB88
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 10:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E7003AAE48
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 08:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA2C201004;
	Thu,  5 Jun 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="snYXt773"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A749828E3F
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111210; cv=none; b=XM0OnteU8xdZfAN8R31Fb/qooIfIZFEFAqmVoIy+p08VIblAfJ3jFfQnAEEpj9igX/LH5IPnEP63odtArT4nEEMHUVlnMSIeIN605G8TxKJ9sB/MwuveFsYWYj16kORRI4odbCrUcVelBIdyAL56q8hWfQhQSHJ5Vyc/nfIhCFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111210; c=relaxed/simple;
	bh=KQks56LSu6bJ7u7tZzj0ZQ2odDsiFIYj7vLlnE0qLjo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HgRj8tcprkaA3Bkn3vE0JUFRLMxtr7AzdXroqJ37k4jLo5opxXXF9/ABarJ5L7VrHptL0HTkkH6yhxvRceG9SIYtWZWYcl2OkPwOl67OnVCCR/j2rrJ8YaaKJVDQlCQTS5kxebcAoIGS4ZXeZaZa/VLVucyJPoSpCspxEH6J4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=snYXt773; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso6060055e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749111206; x=1749716006; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfWKRssPpBmlYUBcGwieDyb2UsFIq9Rh86gn9pT/dx4=;
        b=snYXt773UpKdE9nWPS/chPMRRsfDeD6Gn86ifJUjhlL6DK+Ef2uqThzncDcIMFAvJB
         m1N2pFVNg1HZ+nCO+wFtDTMt5h80a8sEGDBDVvhiHtVk2i1byvZtxG4nAx+9YDc2xJ3V
         KOIvq9SMLc9/hyLxVFc1EuC7RxWEo2zd342vNQNKxJ7QxJtP64VTtDDmrer8KT/7wTXi
         FvIUDSnNIT+mskhPfEup996IHkCGjXt0eOcD8O4GPjtwG8kzwWV7BuQ30Tk4R01cJbl5
         tW45Cs4ye3N5vGDxh3Wg0Uk8lz5EDKm2lWnTUFZI/xQVUR5MsanoAkYPYgh0jDqJgRh0
         pDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111206; x=1749716006;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfWKRssPpBmlYUBcGwieDyb2UsFIq9Rh86gn9pT/dx4=;
        b=E42u3k6GeQhZagn4VYZ0uU0GYQsx6tV5KWxvTtzpgde5/u9B8b7FxGE2PUSWRyIGr3
         mgrTZg6OsTggPvTeYjHar+uw7Q9ADOs403e/EBXj4qe4N2mrnKaY401G+dLjzwIclKXQ
         DIYRuByIYMWM37vtBtdOmmXpO6cfNxs0XRrrxrwHo8BlRzFhrY11kRhVvIjCfpo58de0
         5+/2aIZmWgEjC26/IS2AksuzxifBe/wufYX3cdJIQXTWPikREUlmyPfimrj4X7BO+0Ev
         ZXloai68yTN3IGBy6tj6PwCt2SOOikfVns1Vrqz7HGaZov23NTZ4pG4M612J5iwDIsYR
         1JeQ==
X-Gm-Message-State: AOJu0YxBQvOY3AR4/MXfqPPKHT4pAa6QsHcxdZEVHYD0gDjffn1JBPDj
	lvyn8/d+jjQbt23MivLwLTYvp2BCfnNlHf+s+UV0uQN1LQ9vnZfpqd4+8DY5TdD8ChPtfpjrJvm
	09GWm
X-Gm-Gg: ASbGncvgLSzXYtoZyi4Q/VBHdNIviIIz2atTBnxel4xv+HV8086GC35d43VZ88WaYMI
	PBg7izt8L1d7khXjQjbpoNtRD+MxA7j80tT8xelHQc/dB6bgsWtwGBSwSdLj6WWEN8VXpbS/c0o
	f+QanmArM/H9fVice0XSktVUbjpYWn0lBPDx0sXN4dAg1XmCDKTcbfhZlcTJ0UKTRKOo92ppULR
	OucGbb7V8sihU/uYWrpOH2BgtlXPxBLJ9ICL9PLzn9/o6t6f17/TTe2rExYylVekCPSwsvq7Q2Z
	9oVl446Ccdy/4cMyxv/a0gxamkU4AKM4Zle+R7QsyFRR
X-Google-Smtp-Source: AGHT+IHtkRTU7R3XqepPsmkKaOprOUGZ7YlADeE/12fD98AtsXb3ioZRd5xd9QAe1MoImTFDQGYdwA==
X-Received: by 2002:a05:600c:1d98:b0:450:cf28:c1ce with SMTP id 5b1f17b1804b1-451f0b3b5a6mr46483025e9.32.1749111206335;
        Thu, 05 Jun 2025 01:13:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b79e:4a6:355b:c44a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb178ee2sm10010865e9.15.2025.06.05.01.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:13:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v2 0/3] doc: add rust docs
Date: Thu, 05 Jun 2025 10:13:18 +0200
Message-Id: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5RQWgC/22NywqDMBBFf0Vm3ZRk6qN21f8oLqJ5OCBGJja0i
 P/ekHWXh3M594BomWyER3UA20SRwpoBLxVMs169FWQyA0psZCtrwe+4CxOmKBqJpp20Q9mNkPc
 bW0ef0nrBQqPfKBgYspkp7oG/5SSp4v/0khJS3J3DW4+17lX3XGjVHK6BPQznef4A2lu3G60AA
 AA=
X-Change-ID: 20250604-rust-docs-502d6caf207b
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KQks56LSu6bJ7u7tZzj0ZQ2odDsiFIYj7vLlnE0qLjo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQVGkZclTTrfEWsim+Gmxw9Ak5dKqmCDCOkc0F
 DwRYR9EWm2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEFRpAAKCRARpy6gFHHX
 cjCjEADgxjvkAUteyp2q9yugG6i0Hk+SwOKDjCwVoM4YK7ydxBDNOIrk4N8R8XHhA9svgrZf2Wb
 cmqalqwLsnOSL1VwKBDgX05qD5Bs9RLGQWigaaiU1UTUwBc/lWGp6fdnyWjA2XDFJIFC8GVpP7Y
 Y2tdF1AFuunCSQzCvbHL2h4yLmG8Cgh5Y50dcjplzIXAU+TLnxPVRx5Cx15yv8WB59N1vFBfBYL
 /jlaD5yr4ufh7kG5J3IFjP3rvXM8qP+7BUBJVnJFIXj49pksidXOqZcH35GlRFvEKxhJLZqduHE
 41brVuXy2ou4MhdosafXlIbIfsd3KQKoXV8mbhPHv1qZCo5A2/5yPRZD/8WX0IELmbJqJw0tqFp
 w+svZn2TajKkgy32nAZhGAzcloglPE60RGAuTTms3Xrg4DCcVqsTFDqCVpp3CMDkq++eUXJA26j
 VzkJphnvWNDR0bc5MIkqDj3or58ih7PkTBY0BonTFdxzI+nzO2BepkGkmn6r579k77omHnAdsYh
 pU/wOaNH3z96OcHLHFiwEG51QYLBT7MOnBnj9jwyxuRwNC7f3qugcYP++kK9k/exj0+aqRBBtyP
 xQe+H4yGDlphbs3FT/QpoVOQF4nDr6aFj4j1pHzrEJOo29CiHx5v6itFdt1Sy3WeT0+m2+XuIkU
 wGSOOTca35Tc6Eg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

While full integration of Rust docs with sphinx is currently hard, if
not impossible, we can still follow the pattern we used for GLib
bindings and generate the docs using cargo, then linking to them from
the sphinx page.

While at it: fix some minor issues in conf.py.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Pass --package=libgpiod to cargo doc to limit the scope of the docs to
  the user-facing API of libgpiod rust bindings
- Drop LD_LIBRARY_PATH and SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE variables
  from the environment of cargo doc as they're not needed at build-time
- Link to v1: https://lore.kernel.org/r/20250604-rust-docs-v1-0-8ff23924a917@linaro.org

---
Bartosz Golaszewski (3):
      doc: reformat conf.py with black
      doc: improve the readability of the prefix variable
      doc: integrate rust docs into the sphinx build

 .readthedocs.yaml |  3 +++
 docs/conf.py      | 43 ++++++++++++++++++++++++++++++++++---------
 docs/rust_api.rst | 22 ++++++++++++++--------
 3 files changed, 51 insertions(+), 17 deletions(-)
---
base-commit: 088c66ef20662b76eebf03e71f11196a5ae14b33
change-id: 20250604-rust-docs-502d6caf207b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


