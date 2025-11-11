Return-Path: <linux-gpio+bounces-28370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA5C4FEE1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 22:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA6C44E0447
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 21:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8E0352F99;
	Tue, 11 Nov 2025 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJY2PtFK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DEZPpJa5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2868D3314C3
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762898116; cv=none; b=Se1E3BUQD9LsirPos/ECY1iHAJOBPgBXhqUgpo7bnp4Mbp4Vru7EUL2JrcQG9YasD46KMZ9PRNEGlKv2UFoVTUye0VYMOy9PBqM36G3m4nOb1ADnksHQewvUfLxLVmD0AmAChdEO0N4GPTBVl47p1mC1wwAH5I2Mq/eVofeI07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762898116; c=relaxed/simple;
	bh=BqPFFvqH7BoSFpBWYudwxW6uWlGnhLlJiqWls6goZJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnSr2EKH5qdihnQffqMxSTdd76AKUD8G3rzGDhVHGIYoJ/jrA0wTsew0T8KDQb7K/5/am7otmMlxYBtvS0wcPkYkFjTZIYnErbPleZvMBWW7E6BlYXNmz+YlDTpVFHwDLf3HJqYXR0ZlpoITFhSAFiuXsB6ZUP+ULqzvBqu6IRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJY2PtFK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DEZPpJa5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762898114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ewK5P1QfPFXuq8AEptM/4r+//JlhduxVqODFxsi+6HQ=;
	b=VJY2PtFKv4NbJhk4QcxSz+Rj55aUM6lCvr2UBE3+2tEE4ea0bFLQR+KcjFGg10+KzdWGnx
	N+y2xBQixXTHOk8mbjSu2jc2qZrMLfYqgCEq4iyyRtDOmzuf5RSCYGiH7jPTeeJqnB0/to
	prvZyv0hU6ivrdPF04RAidzNgNFslRQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-femt1uD4PWCM1STg-oldwA-1; Tue, 11 Nov 2025 16:55:13 -0500
X-MC-Unique: femt1uD4PWCM1STg-oldwA-1
X-Mimecast-MFC-AGG-ID: femt1uD4PWCM1STg-oldwA_1762898113
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2657cfcdaso27590585a.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 13:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762898113; x=1763502913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewK5P1QfPFXuq8AEptM/4r+//JlhduxVqODFxsi+6HQ=;
        b=DEZPpJa5hN8CzmmFBLRmSv341Xq/3biOK0SVMeGaUww/qJovl2T13IFgttoUQ2fs0r
         pY4KxTjf7iCyU7btefwkChLTxEAs83lLzpp1AldwNJsjZrzuV665Bl1IXhwmyDap4QUl
         52HRXZMaMlSFuozQDdDF1szqBn3QiohdhQlqzeVpJMT0RAVUVU1VFQRNrjI3Pm22BwNA
         RQ0+AFmgn8cZI3wt/HqXrAsoBteUhmsSg58QGZHQiYAi8m2w3kY3EjPLadEd3RTus92x
         2OB59bTgPNZYCZFcA1V9yuam3tYcKabt1cl4jLnyR4cKMQt33wzcW0Z2nusjHl6Wucpw
         IOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762898113; x=1763502913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewK5P1QfPFXuq8AEptM/4r+//JlhduxVqODFxsi+6HQ=;
        b=M/LDEFhlzvIg7jcAyG1QQyZTMJHX/HoyURMms0GW1OISMvdzRSJ2WeR6ZmF3432D4u
         EuXZhwU7tF9xLbJrtvaZqoQ17WpJfM3NPrcjIszmyuYPvWi3+PQivLmcsrHoNQ50bjCi
         MBnfvG4a5fyVM9soisChy466cLOPiLEA7KwvzJ9nhFZpPUId2tyHJsO3CouhoQBgmp2/
         ZJvktvdB3gPpd0C0kSUeQV7TjU7JZe6qRqIBYwNN5Hr5OwU2oyBwjA9ky1cpHGAMSM6f
         +bTs7T9sG/UAZZhwx+Og4QFZqxX4n/vFA6F7qThOGOX2AuxTGrbHSjGFSDc9vdMCCeH+
         QYBQ==
X-Gm-Message-State: AOJu0Yxa+Yw2I5wMOf+cH4diyEqVZHoDCkJQpEGg/J+i8BydYANhRRaj
	j8UPWkbY9UBgV0inWs0Y77s+AUPO695a/UjtfeDdeG9j+R/LLtHe74ID3U9PbtuMY80OnLYvrKa
	KWGrdMtgl4T4raFz2QUrusmTtOWUu7W7dDrbtlFP5j1gfrmfo0XGwiU/PbdmvRTw=
X-Gm-Gg: ASbGnctH5xumxmWVvf9xdxPgCMjkmGT+PEqKqlU496MgQDP1cgrP8bq5UhYxxTe1Saz
	cKB/wCqyS9vHDOYeYZ/9wCTDzvEcj4KBhmhOf5485gbZwo7QyUCU7Rd6ZvaKTGo2C59WXLgFola
	/KsZt3Jg4Ya19VmrXK0ynMAoLh89txioM+u+sqFHQP86rV4/Bj8RIxhlPBobibGenbpO2Yt6m8J
	qwdkRP/uOo3b8/1IIYixg6fUA9Mmz8W7x2DwVd1zjqSUCasvfH5aV+tRDLQ+mZo2PxuOii3TkEN
	MNdkakvHruz/iL0tjiHR5aB/VDBKs6W8gq83bW7Ab1b4FAiT0fKsv0xAkzHVh/Y0NlbyJcoIJGg
	ctZLzFmD6OWwa7qwG6V5nVrZWP/pFOl0=
X-Received: by 2002:a05:620a:444d:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b29b7676c2mr114414485a.6.1762898112752;
        Tue, 11 Nov 2025 13:55:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpYrk8J3pc0or2M4yWds8EC3twQQrc0f0pmbdA1sma8+sKJvQpmqvKN6KSF3KtIt1M0Qh7JA==
X-Received: by 2002:a05:620a:444d:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b29b7676c2mr114411185a.6.1762898112359;
        Tue, 11 Nov 2025 13:55:12 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa032fcsm61335085a.49.2025.11.11.13.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:55:12 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 11 Nov 2025 13:54:12 -0800
Subject: [PATCH 2/2] pinctrl: s32cc: initialize gpio_pin_config::list after
 kmalloc()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-pinctrl-s32cc-alloc-init-v1-2-071b3485b776@redhat.com>
References: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
In-Reply-To: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762898106; l=1042;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=BqPFFvqH7BoSFpBWYudwxW6uWlGnhLlJiqWls6goZJE=;
 b=Y4qJgOTUpZTA4incmVAXt2PUgh+wZtq/enkv3qwzmo0HKnIZRrIfXvDthp5qizHo6vEg6W89O
 JNcPu+NpNIrBP4dO8SBmGnIkId+Z03EgqR12YXVw1lviBIZBg5Oe3c8
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

s32_pmx_gpio_request_enable() does not initialize the newly-allocated
gpio_pin_config::list before adding it to s32_pinctrl::gpio_configs.
This could result in a linked list corruption.

Initialize the new list_head with INIT_LIST_HEAD() to fix this.

Fixes: fd84aaa8173d ("pinctrl: add NXP S32 SoC family support")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 51ecb8d0fb7e8a203e10cbe965dfec308eaa5f30..35511f83d05603f5374e2d09be4b0843c7d7dc53 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -392,6 +392,7 @@ static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	gpio_pin->pin_id = offset;
 	gpio_pin->config = config;
+	INIT_LIST_HEAD(&gpio_pin->list);
 
 	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
 	list_add(&gpio_pin->list, &ipctl->gpio_configs);

-- 
2.51.1


