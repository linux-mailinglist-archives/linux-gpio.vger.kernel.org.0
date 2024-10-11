Return-Path: <linux-gpio+bounces-11193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA8399A6C6
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 16:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C370F28526C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7462317BA2;
	Fri, 11 Oct 2024 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="q/M4lEjZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E012F44
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658119; cv=none; b=KigI8trTcMHGX7UFYBSm8LQ3xaAjw4fw1wQ5lbfEI1G0CCPYwwhSG9CTdMBLJPbRVNFmh24EyhpGwh9hwstMOOw+CsTKLyot5wUdwbAz4qqbpOyzUNNRtzLfii3jSHDo7mnngbkCoq07fKBzjbA+yWUOZsgY/rYXSWBLu0U57uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658119; c=relaxed/simple;
	bh=uQVCJTzTG+CgJBodFQTQpj6z47sYXTr+QgvgQYjK0U8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MqH5bM/A7m4wChHLijoP+cy65aBAhRdyryf9N4HmNbruEshS+OKXGmMYAoKwmTqFNNLWB/lSWSnsnFNXR2zxJiT6VISG+1sbiQctHbizwVtm60AOXStK001VBj2QjVrplfCz2uJdmjpHQfwx/bkYdi14MLkU4An2JJeljR7xyY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=q/M4lEjZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DD4B73F5B6
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728658108;
	bh=ZeYY7hZCtG5ZzblFqjablxTznhCvL1wjc9Tgelu4NWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=q/M4lEjZI4uRSEKV2YVrad3D5aTpa9UMtcvTsildKLkO1OGSVGPXFC8RxsGhLTUoB
	 nvf28af8bXmetr0yFJARdzM0GmJOxINTXR1HoJTWI+VAf/npkOzrfvlIYGJ6c7X9h0
	 4O2KmbFaQdW90LDOBAl7CNJHy+RmPuIzixmz1/VSu+byQtJaIW+nIA6SfUud1pehEg
	 hstbOPlG5DQEpOVbpF2gFHeF06TF9399xH1h/+mVtcljmX60b6KCALFkHczRAFa5Fk
	 +x2T2I3+iRy8s7nWnintAFDO9EixBo78SRrC2LOvzmnQ+lZz1yypdi4IuxkUr+DM4N
	 MgFGqBSChTLeQ==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99592b5f27so329505266b.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 07:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658108; x=1729262908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeYY7hZCtG5ZzblFqjablxTznhCvL1wjc9Tgelu4NWY=;
        b=Sj+M+Xt19lvrbCEXOVDbFS2CfwhZ2T9cz5VHNaN0mazKqPQ4PpRWtO5W3cjDNed4sf
         ANsZ8zGTJFhq4YSRm4P4qoiE/c1kFSLMJttrtVf8JThw7LwAz6WKKeHAbi/UXLCsZkeP
         gQMn8zSGD3p1Sn1bR69xoNGUvj0lNVN1cl/feSsBF4e5zIqei1SiquMpXKurZZRJnkh5
         401cTHeEYDP6Pp0c3CXTVENqcsTO6/AP7NnT/4NyHTYNB4bbrSJOQ/Wcp+OU9RXWO8h5
         rKZiMR6dH8JO4l8+WpBNPbIng0p3FIvGz+2AG1nbEN9RU/Ja30unVSMczYik7HmEpxRE
         afvg==
X-Forwarded-Encrypted: i=1; AJvYcCWbGow8vcmTGRMEHoTBpwTtSrrzZL6oyzylB0K0yYyBRPY1FW8EeCljKP1sNNaXQ5O0LOslNtvwDg51@vger.kernel.org
X-Gm-Message-State: AOJu0YwmtkuLodR7t4Hp0jgFw4YSMp/xHET9ZQ6Bcyq1XsQSuHFF8zxB
	ZrZ7FiaSfJ9dREnKE7jZipB0RCOOhOeaYoXiDtpujUJ61qtgKjf8kS16kHn7dMf6CA9wKy3tWqN
	Yg//X29rFQksv2wDCT7l4R4mkOnymtrR+u3wcexlD1u5WumLyfJLxHy0bmXPpr9+PyYS+y9+Ahx
	Q=
X-Received: by 2002:a17:906:cae5:b0:a99:4ad2:acb7 with SMTP id a640c23a62f3a-a99b885cd31mr293767266b.18.1728658108453;
        Fri, 11 Oct 2024 07:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZJ/O4DI06C56//3e90y9WubgT52G8l84SnKYNplOkm6YFyYikVWRaSx0ajYVuWo5Sc8h+Ig==
X-Received: by 2002:a17:906:cae5:b0:a99:4ad2:acb7 with SMTP id a640c23a62f3a-a99b885cd31mr293763666b.18.1728658107892;
        Fri, 11 Oct 2024 07:48:27 -0700 (PDT)
Received: from stitch.. ([194.62.169.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99c0c89bfasm54134666b.162.2024.10.11.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:48:27 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v1 0/3] pinctrl: th1520: Unbreak the driver
Date: Fri, 11 Oct 2024 16:48:22 +0200
Message-ID: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Here are 2 important fixes and a code improvement to the T-Head TH1520
pinctrl driver that was either introduced or missed when Drew took over
upstreaming it.

It is based on Linus' pinctrl/for-next:

  6dbd1577b7dc ("Merge branch 'devel' into for-next")

Emil Renner Berthing (3):
  pinctrl: th1520: Fix pinconf return values
  pinctrl: th1520: Update pinmux tables
  pinctrl: th1520: Factor out casts

 drivers/pinctrl/pinctrl-th1520.c | 52 ++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 20 deletions(-)

-- 
2.43.0


