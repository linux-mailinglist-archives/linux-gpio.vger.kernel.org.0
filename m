Return-Path: <linux-gpio+bounces-14182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9739FB9A8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 07:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3184F1884F37
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 06:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562881547E7;
	Tue, 24 Dec 2024 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="U6FATiEJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB4313774D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020513; cv=none; b=d5QZV4Y8xg1XxAPGDcOZzHhYO1M9g36AAv7ZqyY5NAI2sPhYhd9J/635zk9ogjWm54g91AwtAFEdjbzQrAsVDZxWrzNSb33kW6aUxXANYrgQN/vu19ifvhMrG3VB5dJLYgvJjAJ3qfiadeVYH0SXISXfcgHwfiXCzGG/0NroG0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020513; c=relaxed/simple;
	bh=1J0G42e2I+V3HPq+RO+mlEWZq3P0COANDrP+nJjXd7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWz6W/J1Ru16D1U32JvhAALZFt9hcu4bzaWu1rvF1CyKKCfMjl82dyKFAa28f5CHo2id1vdQ/5q+ZgHLf/4cNZ8HTy+8fGOaUrgtQakjYGrtEz3EwJAywmPjR2D2kVfMlN6Lw8TfLxPkw8Zilk9qk+m46PFWOxkFsJ0fD4TuXPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=U6FATiEJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 43E0D40F33
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735020507;
	bh=CMN1byEasZZqP0M42DVpkISE+hvC7H2iR648mw4fqFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=U6FATiEJ1hAeRmIRcQ9ik/YCMo8t7sgNlrHkqHeSK+1P0Mgln4ISv6ZhD9x4hb4HG
	 FV0QaR6eUpFxCPpQIzMWooalH5qSNb5apbg8my4CTzq/gy3aSr2D9lawjkRpvOOmUW
	 Q0gNiA8oQ4f6FlItkdtO+AtsFKFHzBqiNLfBTCJe3aKv8BagXzyebIadq1t4ocFse9
	 +Z+hNZQ1CNymu+uo1LM4iZkoE3kyZ28s62H77lKr7wCq7VwvARxgiQafPmNblCKEWW
	 sMqdaIg7+19rjrDUdh1fHLmtNPSWIwySirZG+DwVNouipWJIDsyK3MJyhncBKS9mLq
	 qYI0VNkmZ2d7A==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216728b170cso47532935ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2024 22:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735020505; x=1735625305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMN1byEasZZqP0M42DVpkISE+hvC7H2iR648mw4fqFM=;
        b=R3wX7pyxmNCuEXHfEjJ4O5JaK5V/hzT3/XK1qVaYQa6ovrGoLFYoLW7z+0UpVmqC8E
         6zUMmqXfLppgfEjLHz0fc6+mp+D1YIW+oJAz28BrYc8LfUK3D1HxuXc7QifpMUubqjaW
         4W1hyspScTGD75MG+7L/SMpb3OPEX3Ha/IZqrYaLvB8GEYIV5mJGL5N1MEPLxkfDFnrK
         kifSKy6u5ItXBIv8CFfujWed9yUie42CFjfRqMMjrCdGJNSU78H3TmA/I5YtaY6qrRgb
         bLWTpWtlCQRAIPtk2RUMb583BRDDi5FpQcKSmSPKGu61mguqk4gUTJJcDzZr2z1+MKeL
         UrXw==
X-Gm-Message-State: AOJu0Yz5K+zu0NcDZJs6UEt4Fz7bLDg5kL1eMLFgs9rOcTcGHdU7B+xa
	jBLK6gRYs9gbzkkJ9VA2g4allzDmvplg4IgFFUDoDCXyEtcXWnQEG77vgnAipvXSgpxUKLTR8eJ
	UndHyuMn7mp+DFukMSWYpVQOKLnupok380QNcmErAjn9GibCcxv5ODM+GcFTOi6ouH+3CELlHeU
	Xj4a0IPdU=
X-Gm-Gg: ASbGnct0AKILADQLkww2apQ6OdFSBO6W1cuzIjNSFO9WsBUCDCN4dReRmlgfST/k0AK
	NLGHYBTb4IWdK6vpEAuKxNN40068bVyut6gMOFcQcO5Pq6qvQ7cRtel9suk+g6iCRQdzCBr+Ilf
	dzTnn6g2/cKb1oNVm/ml1rsTVcjMuS4XgGIS/NIJupHhJ26Sn64qG6r0Q26er0b2bvMFW2Ogrya
	SYHzhyukG2H2TR36ZkTWzv94KoJdpMbKjGx9dmy2Ik1GHI6qS71PUIwhg==
X-Received: by 2002:a17:903:2282:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-219e6eb3b88mr194199875ad.27.1735020505676;
        Mon, 23 Dec 2024 22:08:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Q1yPnJymScFaReS0HD9K5T7ZYs0Yh6KPfKbtjxjcn5az6gKHxJ1j3cbfs2z+DuKTSknKkg==
X-Received: by 2002:a17:903:2282:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-219e6eb3b88mr194199665ad.27.1735020505320;
        Mon, 23 Dec 2024 22:08:25 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:7315:8eec:aecb:29a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02a8csm82262235ad.269.2024.12.23.22.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:08:25 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] gpio: sim, virtuser: minor usability enhancements
Date: Tue, 24 Dec 2024 15:08:15 +0900
Message-ID: <20241224060819.1492472-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just a minor usability enhancement proposal for gpio-virtuser and
gpio-sim.

Koichiro Den (4):
  gpio: virtuser: fix missing lookup table cleanup on probe failure
  gpio: virtuser: fix handling of multiple conn_ids in lookup table
  gpio: virtuser: lock up configfs that an instantiated device depends on
  gpio: sim: lock up configfs that an instantiated device depends on

 drivers/gpio/gpio-sim.c      | 50 ++++++++++++++++++++++++++-----
 drivers/gpio/gpio-virtuser.c | 58 +++++++++++++++++++++++++++++-------
 2 files changed, 90 insertions(+), 18 deletions(-)

-- 
2.43.0


