Return-Path: <linux-gpio+bounces-23571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F221AB0BE24
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB1D5189DFE9
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA37285057;
	Mon, 21 Jul 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KRNk6iEM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32E284694
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753084398; cv=none; b=OD0Ujx0xncj0HLJnlnzRTOzEJW/7LqfjOUNs6sG8hEgTu3BYU0OPf9fgy36Fap9HNJ/bLPjfNmrj5e2DxUZwsdtdnGV6QVes+um/FrEmcJEfmn2cC9eCBLZmuSUIUdLo9hymp6qSYvDr0ijs3wblhDXYteTBviaMccYMFWtkQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753084398; c=relaxed/simple;
	bh=LoWDVSU31UcCnuH78CgITVgj5AJTPkhcFZnr86mE6wg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hvzHWH5w3O+YEJ9KsbU7YZOFrD7xgpR6zvksuscdZeyNoG0Uy6JHuTr+K5RjOVryWpbbSKJduUnAlW49hZZ+bGV8VraeyL64zjvz/ysoE366L424iD1KTy62AeLbiy+bn6mnmJejcYCdFzsY2LV9FsSeaF34TVB2FDYHjIllUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KRNk6iEM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so7645872a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753084394; x=1753689194; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMSlb2UClc6cieNza+HJH2SCx/1I6Fa8CNpeX8gFEDA=;
        b=KRNk6iEMxGPoaKs8SUTRL+a32HBfrCrtDeG0VHlE9JLvHemJQgw3xPaVrVeP5MPRyZ
         VBnOPXmbjz05gcugwX+b2SRqQ0EC4/DnD3joOWkuUrtdCvGz1ki4twqXC3sFKm0ekoQw
         RFw/wuU8kooHN+UGJ8yc9h1Sum+gEa+UwrTzE9pm8K4I5gl+saMy+ycquKC2NhJPHb5L
         SkL7/0weVpxJ9l/aKXhu25rqHghkFtCPF30JK4wlV31h6dA0W1r/E8/JaciDuAFI2WmQ
         eqIufrpDR4av/W61SgBSuvOv9xR9v7mvov/+XShgKDzb07T9S4TZnzwiV0rl392M4Pf1
         LT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753084394; x=1753689194;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMSlb2UClc6cieNza+HJH2SCx/1I6Fa8CNpeX8gFEDA=;
        b=covb828VB/y1lsn723yw8IYLkeUJunyEy67T0cRUrZiDV33zjiYMFb4D+1mY8pH0IS
         gvSdiKCe2/gGE54SqNtaDqTg558Bbg6Ov2n+ZJj//ADxHFpY2VEROQk28hwruSvwdBpv
         ieDTH3W19L0QOU8TtwthN1ZsESt0VVNLx9sihMj2rnTZVLz1bWwuMfUTXxtAcJH7myYy
         HUWAsYv5kkAj6ooZP1/8ZF/oqUttjBZVXd1Eu9s83A14IksSTQrsXVPwM8RL7l8G6HXI
         +Ou9SEvR4yNBMm7czN/P0U3FwLXLmbXWv/DPq2CHpPx4D6bu9aiepoZcLInZfFfNLh1l
         yUdg==
X-Gm-Message-State: AOJu0YyY3bModSqcfaYm5/f5XnJty23XDlPhbJJ2GNHhAygWvRXw1QkH
	CagQTWjWYIIIsF9WFhQgOb9JpwcnNYksdqEnWOSR4uvEuO90t/s1tEGy6ARC1brEajQ=
X-Gm-Gg: ASbGncs1XpEe3c+2m1/2MXd4QpoJD31Z2UUi3FK8CGThAc5YcnJMsmaIA0ell0PlhXx
	/gIho3fYHsRQPLDuhHvVpWxjS1zSnHaHkeOcpbVN62lCiwjLYg1hCSy7zvnMqHJMlJZOxnfpzuf
	JdLU0SUYJfo5Ust1ATlUzR0IMlYcwMnO2MmUE9qQHRouM/uNPcpE9VGpuUL1qeJSsM+2hg7TupS
	9uZDVVxgCS4/HubII/Me7tvN9K6qA3dTkKsA/1M7SjwvuxYiTjs3q0RLt39ovnsgMSE1F8sbcpC
	u1IKnyWHcQRXtfhY+M4+pQ6mqw67koxBXxmbWAGUqYD+/yiwJQhNIH+1sLZka6w/fYmAsUDkiFh
	X0Pv7LQ==
X-Google-Smtp-Source: AGHT+IGboyeNPyNHaj4H3fcVPCLOCmO6HnLQj6iOlPA8khmm3ATDIxBx50XPai1ZI3pufW6e1IdLaw==
X-Received: by 2002:a17:907:c24:b0:ae3:64ec:5eb0 with SMTP id a640c23a62f3a-aec6a4933efmr1204109466b.11.1753084393832;
        Mon, 21 Jul 2025 00:53:13 -0700 (PDT)
Received: from [192.168.1.187] ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d30csm628379966b.119.2025.07.21.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:53:13 -0700 (PDT)
From: Erik Wierich <erik@riscstar.com>
Subject: [PATCH libgpiod 0/2] bindings: rust: fix clippy warnings
Date: Mon, 21 Jul 2025 09:53:06 +0200
Message-Id: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOLxfWgC/x3MQQqAIBBA0avErBPMSqOrRIvSsQaiRCsK8e5Jy
 7f4P0JATxigLyJ4vCnQsWdUZQF6nfYFGZlsEFy0XImK+SucTG/k3MuMVXXbcSulaCAXzqOl578
 NsNG8ODoMjCl9L8qrL2cAAAA=
X-Change-ID: 20250721-rust-clippy-df73580f6624
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Erik Wierich <erik@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753084393; l=1039;
 i=erik@riscstar.com; s=20250721; h=from:subject:message-id;
 bh=LoWDVSU31UcCnuH78CgITVgj5AJTPkhcFZnr86mE6wg=;
 b=2o9Gcxxmd7NkTRuTQc3ODyn91Oq02KGhp0NE2DZVNMxxGob75CHi3ouJjio1P6OtbaqBJts8S
 a44iYLEcuQeAizPujiBaNBJTIKmEhAJnzhzSdUxxjCu1VJFOcSnm1v9
X-Developer-Key: i=erik@riscstar.com; a=ed25519;
 pk=gjm0pD1JkINoNzvT3vC2WZoAWUld0EyXuhsQ/i5Qz4I=

This fixes warnings reported by clippy 0.1.88.

Signed-off-by: Erik Wierich <erik@riscstar.com>
---
Erik Wierich (2):
      bindings: rust: remove newline between attribute and attribute
      bindings: rust: simplify format statements

 bindings/rust/libgpiod-sys/src/lib.rs                          | 1 -
 bindings/rust/libgpiod/examples/find_line_by_name.rs           | 2 +-
 bindings/rust/libgpiod/examples/get_line_info.rs               | 3 +--
 bindings/rust/libgpiod/examples/get_line_value.rs              | 2 +-
 bindings/rust/libgpiod/examples/get_multiple_line_values.rs    | 2 +-
 bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs | 4 ++--
 bindings/rust/libgpiod/examples/toggle_line_value.rs           | 2 +-
 bindings/rust/libgpiod/src/lib.rs                              | 4 ++--
 8 files changed, 9 insertions(+), 11 deletions(-)
---
base-commit: e4427590d9d63a7104dd5df564dd6b7b0c784547
change-id: 20250721-rust-clippy-df73580f6624

Best regards,
-- 
Erik Wierich <erik@riscstar.com>


