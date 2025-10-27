Return-Path: <linux-gpio+bounces-27687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBEC0EED8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 16:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D4B188CB42
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 15:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6AE30AAC4;
	Mon, 27 Oct 2025 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcmD5XqW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1F274670
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578310; cv=none; b=PGUFDcRqQMQY7oNZe7nywAYKGnCeIXwUxklpl5sh+hLxJ15h6THWHFLaAi3uu5Wkzx3OYj4RJIbXemUH+/7bQiUr+AD6Ux/2RhvvFPkUYWlWa1dHJZjtloUJcKlb2iZpKooiBYm1Dz/rVAPRjnSYtTTFjJueokugr1IKGbqT/F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578310; c=relaxed/simple;
	bh=q2ebHg0FP5SJZw7LCfwFjACRYxvCtncQrxpN01n1tpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGO0S7LiRqGNEIpVj5AmnaI1wnxJjTVvD92N5a+Hdp+km3Q2OBDWDdjjA/rfvijlpVEh4s6Mpoho01xhwV86B6OpkRB2VV/5J75psU1/djJ3QV3pKKdWNMqeS/9GQq9ewVydGYxHBFt9EbnNI1kTpQHHMywTPe5lIX+jGXZ/yBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wcmD5XqW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47103b6058fso35352485e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761578306; x=1762183106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZTFmK7GZ1TVUPmzZfwKDAML+TZOEpqWW3nJyVTGLdI=;
        b=wcmD5XqW2iZ13Gn1ejeWVbwwFAK4F33xho1Z4o3WYYQW1rC6jj8NlVcjCkSyl95ti+
         OjqqD+IjV5vLlyiRjm3b3E9LnqWi477LnGeqmOPy6ENOFrGApb9JyFJ66fMGOaaAZX+4
         wKNOFfLgl394/hWM7N70kDaMKcBsd2DW9Ye+vn0GNhwr4F56V1rAgS+TZJzi4+cdshPC
         EJ8TYhrta3KiNYJdqFA8O+Srfk9S0tAtP1LRtegXR9D9eu9a5MdAp0Ko0Hlh90rkSqr1
         tpxoquWMVQ+OnRXdGO6nwRevnCJl7fsQv5t/YhUQ5ZQHQvCC9yNpnn0m6+LQyljsF2TC
         vWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578306; x=1762183106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZTFmK7GZ1TVUPmzZfwKDAML+TZOEpqWW3nJyVTGLdI=;
        b=ps+RuTDLu/DsZRIx+xnjhoo/i8WT3lm3GnDhV7XPnY/Jc8Db7ijA4GxONp4yNjBgE/
         1pn+9lHzAmvPznPx/OhKUNF687+9OBIf8fNepl3ACUGXrd1x+/kOKcS2GAbRY42UVI0j
         wAWOlYIzX2fPx+j9OQ/6v8tyoegGflULtleRRVNpqFrFofBAs9jtsIh7btCZVcYGXu/s
         dr++kQxzNBUHywo4+gJJVcJgTCgMiDKhFUXA1W3fcH5884p8E1sPx/Z92iQ6YTET9B7x
         PWtFTSi2g2iGTd4TvIYo6Vyry/cPYbPB45onUpBxGz72pDO18QPRRC83W3ehr2F2GAcn
         LqZg==
X-Forwarded-Encrypted: i=1; AJvYcCVURbVVm905G1ro2V+J9r13RglfM70wu0gvGyeYX5hn+wbySNN+UFKrBljb9DjbIrlqk1/zZDmvUaEH@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3+TfMA3i5ml3HWMN4fCwJHUlb+Z/YzyLsHhUYA3MQbFUNywU
	O2ntO5ayybAxhiQBBeaLKGMjiniKufFzQWto3KRv3K5zZKa+gRBLQOal6T5KwD4/pGc=
X-Gm-Gg: ASbGncsA7n+gYRYantClvUtAgvJYMZKUiq9Uyw0oXHsNlJtbwXnwn9PJX1g+KWlbUwr
	esOcbzbQ4Omk9cCPXc+kGKL8JoKt03ZS+BZmpbiRweNdgIdQ6ujP1kPdk3J1ETMbbnnh7b7hI0c
	l5ECYosMIcQNgeaY42/dbFWhXEDy2PHmiEiaC+fTKaVLllXabL4eukE0iBUckFl2AcaTwHuFtTk
	M6FZ8/Oh/NR+ucAHZ6FOIBLNSw0c3xeNhY2mi/1tTFilH5KFOi9d+MvAhlilVFZBjU6Ku1I6emE
	QWR4LmHrihUk7ea4/mMs82rYAGegywj+8jL/7FNibIHP9GXm/7phxW7aCH6rjB5Y/ZUUc8lTRA8
	aRLJJLZWLMzaNlCx4M6IbO2hSFAfReHLJ8LyCCn7LTnYzzZuxw2LWbQq8Q6cXx1WbLzmXPAMqDp
	PLqmnS+FfZvgdsN3M5
X-Google-Smtp-Source: AGHT+IGdQ3Pl8WJ0Jr9WgElxkVUFCnaBaIruVM1SpSmzXhkaMb4CpF22naG2Hn16N7UnuCwyffttJQ==
X-Received: by 2002:a05:600c:3150:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-477175ab715mr4793705e9.2.1761578305934;
        Mon, 27 Oct 2025 08:18:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475dd4783b8sm143053295e9.15.2025.10.27.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:18:24 -0700 (PDT)
Date: Mon, 27 Oct 2025 18:18:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl-scmi: remove unused struct members
Message-ID: <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
References: <cover.1761576798.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761576798.git.dan.carpenter@linaro.org>

The ->pins and ->nr_pins members are not used so delete them.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I sent this as part of an RFC earlier.  In this version I deleted
->pins as well.

This can just go in by itself.  It goes through Linus's tree
since it's int the drivers/pinctrl/ directory.

 drivers/pinctrl/pinctrl-scmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index d14528b9aa31..af3ac031e362 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,8 +40,6 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
-	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
-- 
2.51.0


