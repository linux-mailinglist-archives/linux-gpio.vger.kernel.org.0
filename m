Return-Path: <linux-gpio+bounces-19598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F7AA9235
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 13:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38AE3B2426
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 11:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5B920371F;
	Mon,  5 May 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TN6+LJud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52321211C
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445187; cv=none; b=M5EFTKQnw5iwKJX1WpibVwdv5JifjXQ7ueztw1wwc1II8BzqLpkk2zKNTRMwPHh+bZYL+GieISXv0btjEbDxbAYuA+70ylM28TK8usjX13CwqMGxS8WDxyoMNXRBk+cOQCjfxMXSCR/he8hs1xh2Il8rtdiakdBDGoA3oRDxtyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445187; c=relaxed/simple;
	bh=4bKLvDsMPtH7EF9AXDSmtoiw8jurLha7GghprHG3BvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4G2N7+k/sK3I8E80Fw/rE/Qdx0uL2k6gtAQRHYYHfIOt+1Gv+EHz1M5ya6j9iWQBvWc3I2enkANS6E5RP41koniroAjEl53MELcaW236mHOJ2Jrzo8saF5BiSNX1sUVa3G7lpaju+B/wUow40+5IdnCiQecsTmDZkr1rjwaovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TN6+LJud; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27622775e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445184; x=1747049984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ5GcmEYYVhQR96gxyM5WKIfvUizOn+pM0wiDy3cDmQ=;
        b=TN6+LJud85Ylkf8tXRdSjuWZCMG+R80wAhlGd9Q9RRCjzeuZ1s/C3xpVXpkxYUvuFK
         iJL9DH7KK987kWAtrQ+TtJj9lyQCOmih7JRBjdHUFIVJUQ42MZw6/LD2cWqInT1jdXEB
         D3BB1OH3mOUmnD6+aj2OXUJEYhwpm2kogzQZofcHWAlpkmo6czoYn0R0I+K6AoXmUlTC
         +IJX5eQIg5a6iNe0faQkR2/xHOkPadnevNuQ+I3E7Nj/OnSltEapQ0+mscncGe1kHUtc
         xF3dnT+u7bg/K1eMpMTbm0sEQ7caHL6OxU6t/sqV7QmwwMXZcifcXQudScPqmTKqCIjZ
         M1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445184; x=1747049984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ5GcmEYYVhQR96gxyM5WKIfvUizOn+pM0wiDy3cDmQ=;
        b=YiHlqAE06StVbdOrnlbRmX42zELEQex6/XGSre7Gp+jKZLdaiCjxzoBhR8VEPWLev7
         EieJs9lp+r8VsKFRDYtrwC6vtdhjtwkO1tz73wrQJagY6sq17GdnEsNwZnb5fk6GnupC
         CL7ShEPKFY9pePbqs2OSxWcCx4Fk6IFCHJBTOQiKTOybLRLu1aPW4ZAR03sDv15HF7mp
         3vLKpXGfAElku6Zkv5WQ4yrJUDaAsfqq4noaxhsYhH5OeoOfyKg91LA44fBXLFcdRD5m
         Id2Qxr53qWpu0AtPEVJ9WuFfW+GgQJlrG8RLT8n2iZ1+h9BYaxkOpDvan+KUcPrw+HNr
         Zvng==
X-Forwarded-Encrypted: i=1; AJvYcCWkb1yT4p+HSK27m/PKxF8PSaMFjNkT1Kt5qhs1YU+cjA/AbuIA3xFIBesFqV54GeM4ezFlNhVoNSyc@vger.kernel.org
X-Gm-Message-State: AOJu0YxYyXs6Cx8FhshTTUET9su2aXnyw7/ankbwkd0JcdgiRz+60iSC
	l0LWE2iAje486jmAEdJmKOrISxgAhpJ0A7jmscO27YZdveJxaqi50T+6IBS747U=
X-Gm-Gg: ASbGncskD1HQ6uxlvVF+L+gt2R3tMrk+5ezJbOIh6R/bXULaPs7HJQHySxp/Dfj/7v+
	yFzFTYdVOO42H2HmJ+89+9p0krl/L6h4ogTEDXansXk3KJnSV+S13G/Oog0GlcCKxZtKMD0OROL
	1p6HU7bEVPQ9uZsUDkO6vU/cwgq8D5PA6beKrjZ2VWvCyTjq1oEwvtFFOcJ/3zFnnivyUl3/jWC
	hv+AI+aSrVdRZPzVLmnlmx3btLsX3LsrrL83F55E49bm/7iKyNkBlZGNOhbxn7nuSiH2klMyfO5
	6JaALONVjyCFW2U41+49FzYj+xEYP6JAuoGlalGg8vm1TQ==
X-Google-Smtp-Source: AGHT+IF691cbKdNi4eo7oEzfSp9l49WgI8HMTDJbfgYt7c7D7g1nuGGELzTh8vYSZBETmpZ7y7TCVA==
X-Received: by 2002:a05:600c:500b:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-441c48bdfb7mr51792235e9.11.1746445183903;
        Mon, 05 May 2025 04:39:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee37dsm129618395e9.22.2025.05.05.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:39:43 -0700 (PDT)
Date: Mon, 5 May 2025 14:39:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 7/7] pinctrl-scmi: remove unused struct member
Message-ID: <e7a338b653d378b37f8e0a73ebe6750adc1cf280.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

The ->nr_pins is not used so delete that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 40b432aa4756..d1f3c126c3cb 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -45,7 +45,6 @@ struct scmi_pinctrl {
 	struct pinfunction *functions;
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 	struct gpio_chip *gc;
 };
 
-- 
2.47.2


