Return-Path: <linux-gpio+bounces-24280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B88B22661
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81B0B1B628F6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AB82EF657;
	Tue, 12 Aug 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VXRwviY8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA682EE289
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000656; cv=none; b=mkfoRXdmcxZ1hq3QVt72E8GDGt5ZCpXaonhaiLgv3YR/LH1alkGfLG3QtyAayCRW4u+HCVv4d8jfZqSdslKh/eAtYfIZxbJfDlSEvyaRDfjeDEwuiFFDBg1ni7v4UMV/TmJ81os6wu1KSe/lZmVjxBYzgWskoOmMUPxV9BjTUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000656; c=relaxed/simple;
	bh=SBzGrLq6EUDrMXHfJIZTAwVI8UqxQVnSVETlJklzUck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/GYxnkDVvbVBg8Jb+qzkpA6b/ylmTnzpDBTMx4brWKMhdTUAIUpEG0Nh8w1X7FRmjx3a2Qj4inkRiTzsL1K19ASByh+9F5AlgBhlr4OCJ2kkapuGT+/Q6LaIfizcJgVxTGOTHnnnqexBJtlE7nPPNqUEigE1hFMLYqyy62bkis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VXRwviY8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso3273248f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000653; x=1755605453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68esTO4CCg4CDNSqRAKd5ZI6uFL1qQRfR+vgdsJKbwQ=;
        b=VXRwviY8stwrZnPJhAkIhaZDG+ujvwYNkC+SLETvPE/B8OjJBLpctY5LXcQAgw/KaO
         D1WajbD728jzuOJZkarxbJkPY9m32hESeIP/QFMhbWzm5ad3nuGwy+KZxMegrh6vbTX4
         v7cbQtOVaSG9SNgvOL7S69mzvAXoxqQ79JR2zcXWJT53Bo9cqKq4RhvqVCO1C3fNtx9L
         c6EAzSg6cunTdK/fhSyO28tJHmkEgC3lhtKTWvkSnAWb5eJOy8nSCYbe8Rez2NCeH1uc
         d/SZlqxcuMm1tYGIWDol9b+d4wMq9b/6MMGuqvUrzGOyaaPg1ctDbBvFcvTMecK0ln0+
         2uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000653; x=1755605453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68esTO4CCg4CDNSqRAKd5ZI6uFL1qQRfR+vgdsJKbwQ=;
        b=wVPaQKW0WfE4jjOpqAiyfRUZaELy5LhjQt5SYL0tezGAOXGL0euC+wuzvhtJ0P1+q5
         rdmXKnsylvDyeyxUc65O3qzoT9sKUII1X/A5EYfKWNI4jFGuMwExLwMYXoQRqz6Wt707
         XDsvsmXYw/551oVjq/78yEIjsKMCvq0Np2A+u0YzkbF/AqnXKMBW5HS5iO6DKCQ5g7bK
         wl4+WvHQ5+2RajBoccuN4kew9C2JsHzhlKmTWE3Xsxpv8H+PikR/2hits+e80tTJ55O1
         y5P0Mqz7wRVfGSIdcLQivKY2NG/vJ5h7RGxnMGG3evpv55OkV8IYgt9JdZz8pYU3530x
         cPMA==
X-Gm-Message-State: AOJu0YzhKa/oMQ5QBjbSZA5UEI8qRyglo9188A73HR8pMM3Vs2HDz6TB
	MPj8bu/NY8t3Tsg8lGGTqGL3hDZFIVRuMw7Nn1uz7bQW6p55xRld8vmIHW3zfSJwIc7eR0T4ArK
	vbS8v
X-Gm-Gg: ASbGncuR+RkkJR4/Nlto3wMC9Zf2lN+PnkaaQJ6bp8MMdxaTgy6WkZPMS4mgvyC01OS
	U5TCXn0ScjAo3iIdP/Qa5LC5u3XH05v+5O9HPbLI82a3em0HQs25Gj3J/A+uY7mDQ9QAysFbVAf
	1j9o9ZxDO3pCOtp+qImFZ1rvFCvl8sL7B1qh/li0x4J8RKx1kq9dgsbDx/zXyoOo4GE/CxVHnhQ
	ulEDhKGqKbUQCYxXmrY+EB+fCLpMMrTcPnAvpTRaNrax9eXw3wkEZG/m0cZ8xMzO7/6RsfaukWh
	GklekhNvNpohCVR480RrcnOwlb+ZAw3OjMdYgq+A/C9tcWS8INVa8lFxNusxywRHTnP9yyxafpW
	fnO9mymLS5kYfQUM=
X-Google-Smtp-Source: AGHT+IET2sk2g9u0EAaFYv8+wRHsHeO1ChmnueAx1sYGHQcHl7S4Wxx8zX5MLjRRnKe2loAh46R1oA==
X-Received: by 2002:adf:e750:0:b0:3b9:48f:4967 with SMTP id ffacd0b85a97d-3b9048f4a22mr9689667f8f.56.1755000652859;
        Tue, 12 Aug 2025 05:10:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:37 +0200
Subject: [PATCH libgpiod 07/10] bindings: rust: update thiserror dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-7-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=790;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2wBjSHD1y9j832TsQ1hKXsoiUWiJ2RT78WNyG4tVc00=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9Clr38vg9C3uOtCwbGuzNq7icwKgdnXoeVh
 pePkw4OOCaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQgAKCRARpy6gFHHX
 clyTEADCupQUVCQUWNQZql57ApTSA+14a1MY7UQtGPyJzeX//ZNkEIkL6pAo8BgZ4rr9JABdttH
 4PD7RSaqtoEdWQ8EIay9PNFr2VdQ5SWsgqgwvuOdiIsShDTSdZaLNERnZqqb25LEWSjByUSfBQo
 7sn6r3R1o8U7ZrK6kaPv/FCQsu3OrKeZNU8HL0Ku7osLo62zhnmhQ4UahL/l5ImGl+ow2pmgFlb
 cYJDHK/QWNPn+ytBBGvUwQpI7j8Bh9RjNE5LmlPskNZuXzJLgsWZtdzPQMyZQtNODiwei8wqoO7
 A6czn8p4Lx+IOPx8kn5vHrHnGSIwG9OD1OdOBhCJp84EykN8jdFKFZIAahMoxwG46RKDypx7opz
 OOl3/5nu1qglyacrYGCWdgJoMmjpjHBbVIJj69gwdoO06hQv1UvYOlbQhKe7W/v8Mpw92jzAWak
 gGXw/q8kHKIK9XZMeerireUbC9pDbA3kui2/GefLJkadH6l5UZ+Y6VjEcjEQb9tkNijunDz2Iib
 RnLvVRnMkNMKY9kjcjLlKGIp4yGDAborCAxcz2u0Zdc2NTkYKJsD2Gq02YNU9J11GEQ3eTjEc3b
 Lh9qCfSKZmcclRNLMgI95y9BX9YJRNo42PPpuHKLL+upQeBMrKRZ0PQkAbDw+yffcEkwZw8yA6j
 uOtoVhCujwYegNQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the thiserror dependency for libgpiod to the most recent version.
No code changes required.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 7c285592777fd6399591691076e0bb301ebabcc0..8b719b7647910269ca2c91fee685da7fcc67feb7 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -27,7 +27,7 @@ errno = "0.3.13"
 intmap = "2.0.0"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
-thiserror = "1.0"
+thiserror = "2.0"
 
 [dev-dependencies]
 gpiosim-sys = { path = "../gpiosim-sys" }

-- 
2.48.1


