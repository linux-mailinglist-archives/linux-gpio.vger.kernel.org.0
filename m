Return-Path: <linux-gpio+bounces-24412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66DB27C33
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E8CA01792
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C432D3726;
	Fri, 15 Aug 2025 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QTHxc78+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33732D372F
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248285; cv=none; b=PEn80HWMB4bFtxvz7QZnFpMkwpECDhwUsYnh+kN9nY6baxQ27vvfkQeCAx2oVX7vcYLxYdIfysmY3inuakPytyOhQOM9rcCzcmLpa1aaJXkxK3xlzgG0jrOr2Pl1d5NBmVbT/hnGEO9dGmNPOkRx+JhOH4o+K+IQkiFn5swTeIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248285; c=relaxed/simple;
	bh=HcZzenWpfBJlRzQo/mLeEU4SKNPxtaHZpH5R/Jolr3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2wJtMUG+8ocVT26b0uPA/9R0t9ookGyhK6i7TdIdVdCEV7opzK24e/jkYi+Paw8ERASS7VUovSHpCvBiOrmEs4wzSMjpENtOcx0NXt1Ei7HbGyDrBKDm5fg4MJhX1N5Fta7hBP92oU8XCtP8B8Pr8iq8xJEfUCNst/j28XLazY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QTHxc78+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9d41cd38dso1194814f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248282; x=1755853082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKVEe5hG39LoC+ejz4MzzXkcMYdQxd2ItsU2BPvvxzU=;
        b=QTHxc78+DQsyeCYQPooZH7jXNMDJiB9c/s1q9h+2LNYkRRoRmPAgy2CaD6IWZVJ85q
         XFI3jiSzry77q5EmRgytPwGdeqk/ADhshaE7kBHhVpLD+PIIxCyw9UbRFZva60vxty4D
         InBFhnnWpfo7wRbkdZlhVK1I5ps/djGS0Eba+e6old5bv+rHKWYgSNCeuHq9tuehv3aE
         3uWgpzjwzd0UKxL+7ALHWww03ym5MZeIVmNfOCTL0ftZXD5LdIk/KHPJXgk86n1zTgpL
         MkmInl8qM9ssiLKsAk69htdmARmq+pgqUHK9FoGUbL5ftYWFxnN10G06jBPC/dwaoSJ+
         SkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248282; x=1755853082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKVEe5hG39LoC+ejz4MzzXkcMYdQxd2ItsU2BPvvxzU=;
        b=nDvZ1HLeBzH+L8mPVxMI859WFgjhkDyAPnOqj9XuFJqBeOlvpX5ULW5p6T2vQOv7AV
         01h1AGtYShwQkVJ+XkF0xUICe7VasqKuz29x9Yj23GqeKP5T8hhVGKe3AN4phovXTKC+
         +fNqUzM/iHbdG5TG8P1FJ18X/WSFBDVfU7CdT45CeE+0zz/vXSuS83g4kpOlOeBOyenI
         xCoXJ5QO8XmG3V1g0Dp3BkmgRdkdIXPgr+t4dGeq7ifqdyfzQe6QrMnIJzLsEwypFSOb
         QLduL7yeml+i28iQ83a4fcecMRuh3lsV5iVp+oEmIUDY0Ndlb/e2dJJbzlD/L0+yCnF+
         T/wg==
X-Gm-Message-State: AOJu0Yxu+MjW8SwIoSHARAnUeyVSJqmXFXHclZ7EAVy1cJC5vOkHoH84
	bI0M+P3qdUKJBrRKlEwJVoKdeCaua2CQrThJNYVIGEsR2F5UTp+rtWm03KFP2eyZ0/Y=
X-Gm-Gg: ASbGncthA7oSyIuc9IXZQ0uNqBCuGwMVMAxRcF5+BOvMTUqeH1nFgmduy5kB8TpWJi7
	PNWuoME/KGLMAHeUOvr1DU8CxAN7MRVNCqU1BjUIz7FV3UQnAtLb0Pw2G84yx9QZcMUgOefukz2
	PLAdongIkglS9kwd9Qmp10GMp+nE8whL38MN+fKcQVbWzVr/T58h6II9xSHr+uU2jBVfwIpzB+n
	kL8oxPMYwDxTrM0sCGxf4exUJbvRHFBlq5err1/0Z2RSZy8gfs/icYMkVoYcSAmthS+bN0OJ5bx
	I0SK0eVqsMDcYhgsxIoU3QPTLuE8pE//eMa5qxRCAmJEEOZcpiaVp9TCLd5E2jYmBHKQsiXhZlt
	3muvqz7PQxbSQ0PUJ+g==
X-Google-Smtp-Source: AGHT+IEixslCFJeOPXZXmtTOb7MW2v7hEIDVz9ot9hBcHFqBelHbfPv8WcTcnLT7LPl8u81TeoK+UA==
X-Received: by 2002:a05:6000:2409:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3bb68b0cb14mr868685f8f.39.1755248282173;
        Fri, 15 Aug 2025 01:58:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:58:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:52 +0200
Subject: [PATCH libgpiod v2 4/9] bindings: rust: update errno dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-4-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Wqg509ISDfRgdvSuA0I25VuTslqiHSqv5RS3UemT0Jk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaUb0ke5YNlAiYfq8YbBW3XuviBQ6OK6bdno
 LP5kq7o/EGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72lAAKCRARpy6gFHHX
 cudZD/4jhoxaFKmGefds5AEQRg9ZHOSHB2B1Hm/GfwMX1EZltGV5JAHiIb6z1uiSbipjbufFGET
 H+LyMWYQ2laNn4iJQe2FDNHenXWignJ1FOlnMJcmIcIWay6/PdsC3Y3i9KHdjF72G9OZTCQE5mW
 xmidHR6ITLWoNpQi+5rr64Erntwmm8XoGDFwz/KXH+64exl/yg+trTdVkgg/tguDObmofxchiLw
 R9lYiEjwswTVe3Sj7ATwSlNNT8Zay3wAHLlWpjJgVAMriuN5EuuyN7ZM/0hvYtaZw7U3+MGrTPE
 qh4FKu9dMqpLHannp6XqC7j37dVtgsh9ArCT4ctzR5A0wt4AVfPTcPvPiHH2LlifmRRk1AWRdpX
 o+irNFiXvlE//fWTUFup6tHXHFF8JjrTi73hdBtEZcROv1xV68rYSd7ABJgL/tYB8V5tIlZR0T6
 v8LHg2GCqSgyyCiqfadXrrySCxLUEf8A2xbxHbo7hPiKkszKfg+6xojrG4C+KuvqWQ37ld3n0lr
 /OsjRK0XR0b7Dx7duj3jvk0D4IJpjIsv8/NN1DdscVTTMSjK2bvX+bMcDZMpD5PRxGA43ghx4mh
 bLz2Udvwt5nsb73nVSLTpkgDSgiqZO4s8qWglQ32YTz4MDFi9LgQUYSIduhnkg817L2V5ao6FJh
 izmkNMD7/t3bZ7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the errno dependency for gpiosim-sys and libgpiod crates to the
most recent version which is a minor update from the one we have now.
However: let cargo select it automatically by not specifying the bugfix
version. We need to be stricter than just selecting the major version
alone because crates with major versions starting with 0 can introduce
breaking changes in minor releases. No code changes required.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 7099abe41226236b9cba70a36643b921021952ee..c5e044acdfe94f8ab32d288c90db1233dd223bf9 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -15,7 +15,7 @@ license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
 
 [dependencies]
-errno = "0.2.8"
+errno = "0.3"
 libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 23c34799715339be02f769a6b4b7de8ae5c1639f..81478209f6746ff0e8d9d311614e8fb218ed6a3e 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -23,7 +23,7 @@ v2_1 = ["libgpiod-sys/v2_1"]
 vnext = ["v2_1"]
 
 [dependencies]
-errno = "0.2.8"
+errno = "0.3"
 intmap = "2.0.0"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }

-- 
2.48.1


