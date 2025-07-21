Return-Path: <linux-gpio+bounces-23572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD32B0BE26
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C70617A4A9
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BD428505B;
	Mon, 21 Jul 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xGeQTp2/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77409284B50
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753084398; cv=none; b=slSirQOr9uPgWrrLFOVQJpUdzXP1wWpC/AzYrQkNIAbhPODBc4x1l2RqdypUCfAb5iy2MsPw3+tdypwnzQI6wPXXRlioy7DxDMvDx90SuMF/VUnLkZAFptntDG7m5T5nk+esTUymaKp004i+2CukCTLQH89Yps9/KwIUpXZUDYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753084398; c=relaxed/simple;
	bh=zr6riJzQDGjvHGBTQYbTTel2dsLig/0LYvkAjcBpbjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ps5+rrd9e9lkPTYgYOobmZyWK3GlA4iRNCc2i8NPe+q2B5R7PtdQ0kpyZOdK31EIOYbeyS8b9x97Pk6dmtgh1flhiafdC14lzveIqNOJJWW6VbPXAw0QmJ2yG7Ruk+7Xo8XOGYKCWnu80DZGhqRoFgG0xbpGJY4MjV30Yt98t2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xGeQTp2/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so569180966b.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753084395; x=1753689195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qN86yNmIA580XhE+/zcwxPzC2RU9rIf1U/stC6aLvo8=;
        b=xGeQTp2/f64ptgyYAhVuui8T8pr6Gnd+ZfPiRmvVsrTl88W8pqyqihBO+UeDiWbasy
         WjtBhbkd31FThTGjQBtOPXy7RaCjQNIll8U+7c1wOwi6gRnQF8QFmaGLzWXETcZfeXm2
         1td4aNqIY2JXyETmINLYBgUn/ZFIbFObhZMM8x4WYoY9F4KzI8VBXU3DfcadSX6PV/WP
         stG8xp9p1d7xXpSUzaXKd0TANSP1kqbDmb1sLAIDEhr516FuzNF+JgoKi2RsIaYmqObe
         gyBAaAkRtAUjXYeRw7O5jyBt5ajYYLlz0lN99x7GfD5YFDfapZaZjUUdzBnsxN0ncphn
         qdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753084395; x=1753689195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qN86yNmIA580XhE+/zcwxPzC2RU9rIf1U/stC6aLvo8=;
        b=uYUQ7ADkTFMdHJX01ducxk2kjKK5MYMoG7C+u6/Y/k/WRYQD7VLc6mi1fx8RKw/C0r
         P1gVaArl3eRPFMB1iNOXzb9Np3MqNjp2/m1os1HL0fRhsKbK2JP47TJWRZ1o852iKaAg
         TdiH5UdmD26+5zEIuUs5cy614NgECW38prU+SE+pzOCaaYhdfCgRwo3CDzWl1Fb/Xsrq
         KbNXBpzYL1cZY21AOHxMspyld828JEu7iy46MG07LbRqYpAyR/rHoOaKoEpTxB6UxoVl
         rdMtoBmmO1axDKOX0quNE9cDOF/2bjfodwB1w+8nEY5X0dQC8nSxnH9hj6fn6ug455of
         53AQ==
X-Gm-Message-State: AOJu0Yws9dxyhKiJNO+LRJcCbOpI3+nZvqIKCWKEtQ0UrDIG3mO9czEy
	ppP8srNyRVoMV+diRmenNvFBB9vxkeMNL1dgorKK+djd0Tx1M4nA4CIqoTkRoZoREQw=
X-Gm-Gg: ASbGnct9HN3cPSJD1gcISNkwN2IHMQvlT5EYhCNNqmo+NzToAZbf2i/FMjggCznsazK
	1TKPwFEVOqXKgKwYJG/DgsSut5YN7a3WOjN1PX/JTWwNTyBzN4DNrKhK6kyeKndp/54PDpb0fjY
	Jx1sO8keIegRxARAH8B4i5dtqpawNnMYXsZqZ6AG836PEWux3w2DP597AVAxrcamHX+8d+MD+J2
	xYhI0h/8+YZC+QUp9Ae+xqX2kDxdHaaM3/JCygpBYnGqRefdzvuqrpyzcg4eatWFhhaOcxescYM
	RUJjfRGEuAs/SctyXY1vmuv1bueXPRoZIn60Jd5KRZuw7bCNA5VrLBzvkzfRogNFU2+G8OvNByr
	LoLbqSg==
X-Google-Smtp-Source: AGHT+IGCi/6FF3rW9ewSuc2TSizYKm6KcUalDKuGiyDc7D6IP4trEue/A1jBdQfIJLr003XpRdZ9Kw==
X-Received: by 2002:a17:907:c1c:b0:ad8:914b:7d0b with SMTP id a640c23a62f3a-ae9cdda87b1mr1923748366b.11.1753084394699;
        Mon, 21 Jul 2025 00:53:14 -0700 (PDT)
Received: from [192.168.1.187] ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d30csm628379966b.119.2025.07.21.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:53:14 -0700 (PDT)
From: Erik Wierich <erik@riscstar.com>
Date: Mon, 21 Jul 2025 09:53:07 +0200
Subject: [PATCH libgpiod 1/2] bindings: rust: remove newline between
 attribute and attribute
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-rust-clippy-v1-1-2ac0198b2ea6@riscstar.com>
References: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
In-Reply-To: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Erik Wierich <erik@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753084393; l=1768;
 i=erik@riscstar.com; s=20250721; h=from:subject:message-id;
 bh=zr6riJzQDGjvHGBTQYbTTel2dsLig/0LYvkAjcBpbjU=;
 b=Y//mmhk/+bpJtYNsYTqYqpjJfaXcX0+vpkVvhfWn2hbnVVPMB/6PesLGVwn098+yKs5F5fD1J
 ABqtzUPeL8NBjVxzmfcHoxT+8Dk3/cjTjIdfhahmo3FmWEBKLVDdFp5
X-Developer-Key: i=erik@riscstar.com; a=ed25519;
 pk=gjm0pD1JkINoNzvT3vC2WZoAWUld0EyXuhsQ/i5Qz4I=

These are block attributes, but the newline in between suggests that
they are for the whole module.

Fixes clippy warning:

    warning: empty line after outer attribute
     --> libgpiod-sys/src/lib.rs:6:1
      |
    6 | / #[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
    7 | |
      | |_^
    8 |   mod bindings_raw {
      |   ---------------- the attribute applies to this module
      |
      = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_outer_attr
      = note: `#[warn(clippy::empty_line_after_outer_attr)]` on by default
      = help: if the empty line is unintentional, remove it
    help: if the attribute should apply to the crate use an inner attribute
      |
    5 ~ #![allow(non_camel_case_types, non_upper_case_globals)]
    6 ~ #![cfg_attr(test, allow(deref_nullptr, non_snake_case))]
      |

Signed-off-by: Erik Wierich <erik@riscstar.com>
---
 bindings/rust/libgpiod-sys/src/lib.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
index 06f1a50c2753048a22617c480396a156af801321..93b1e7683b0518b5777500d675c68db7184221aa 100644
--- a/bindings/rust/libgpiod-sys/src/lib.rs
+++ b/bindings/rust/libgpiod-sys/src/lib.rs
@@ -1,11 +1,10 @@
 // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
 #[allow(non_camel_case_types, non_upper_case_globals)]
 #[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
-
 mod bindings_raw {
     include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
 }
 pub use bindings_raw::*;

-- 
2.50.0


