Return-Path: <linux-gpio+bounces-23541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E730B0B802
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 21:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B4A1793BF
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A4D2253EC;
	Sun, 20 Jul 2025 19:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8F7ju5j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC522FF39
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040360; cv=none; b=MptLFtRkp1UkO+sc+yo16rK2CXaXSK+kY41JQ4XC7TdLPESNJE91H8PxITvopRrMyifD58E0Q9C4EZUfAgpHXlgHE13YIKdJ5TKqgUG61Vp8AYY6pwRRRErhObeLt72MgMskH2iKSchkLvFQDCfiWnwIyqzfpKQrQpM5uoGRwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040360; c=relaxed/simple;
	bh=pZLfQFK+iDMmtewhGnGO/1SaOgqUaWhiuxkwGFO9BrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xx3Rjd0nGymk5e8KJ4dLEy5uqOaEmTKbaC/KIcWnpyhFEr81WdiBp2F+jNYZnm2fwngnVHgB7w/YlqD93yyFMJRHmaAsmfh9I2l2gHnsgzbwznmSvJptESgVpZxDr+4HGVCrUzwicqPhvCddYx556FGwOKDBjyOQCNMOpbvWCkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8F7ju5j; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-41b53bcbeb6so900832b6e.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040356; x=1753645156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qmI92MLlIBwFrbUrwXTt/2+OJ1ahYjNp50nlsYvpao=;
        b=E8F7ju5jPsBgq+NLTWbjJBo1YcC8lwER0ZNuqFA7XBH7HBtRqeKDMvy2nIxcc3WlTe
         g6EF1SYLVCtE70FFkGebGztWpHWKFZJ6oSbNUpRP2/xPUeJmWtTujlZY5s+GhYKudEP6
         w3vpbjeWj0Ux4XnSPk4BJKCJgyDGmc88y81dusWy3qAUxsUuZ8qTRkuDetO4Xt2XJkCc
         9BXOInxidoNOY1X5kCR1jjlv/CycQ2XChWUZso+KIYG9QxhuUKG2rxR1bAki7++SvwSi
         Ygf+eg03dS8NMerFdzgFYSNoyXYU4g0iWmNdPAnh4Akkez2j9EtQfH8jFWp9fdm20oVJ
         z/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040356; x=1753645156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qmI92MLlIBwFrbUrwXTt/2+OJ1ahYjNp50nlsYvpao=;
        b=DumtEq98wcaGUOIxBYWzz5jjWVr8YQh2BDuM48rlRN2Zq/mu9JtwENj0G5vbcfZELS
         PccH6L/roOdxzt/6NkmPxoZFGzDPerVFiI6S3VM20THB8MWRXumockJlCvAO+KHfjN4Q
         dR8uTNEiMnZ/nYsqgy2TOr51S3HOhwCuaak/pWWMC5T9UVQaefz9IHduMt5cBRI7IitM
         zzveXKoGrBSGDc/bP58MVl392sq5Djw2lGw6T+oKbeNN1DG9PSW1KAI/XpInauOoFa1D
         KiZS1z4tviVQeELd2P0FIxovxP0anBvc2DnDpRKPeaCpIk8fEF4WzQiCvIf0Zi9imeou
         Xsqg==
X-Forwarded-Encrypted: i=1; AJvYcCXhK05RqEHaztbCwBflxsub2K4qSQz/qvxAm7RfuwiLzQ5nAkQ2WNmEi+2SYbIy0TlB80DeiP+V2Af8@vger.kernel.org
X-Gm-Message-State: AOJu0YyukrgOYz+sbKAn6L46QfWJvbC6SWUhiNe1hlxPpGOb0HTyJY6+
	5KlBmcEaApezwI1/H+ZYP/2R9npUUWc5NyZVZ1rnbipiz1YiqHLU3LBQv9aBMvMWzwwmj8GvrZj
	f4avToio=
X-Gm-Gg: ASbGncsSTC4u/a2KfLlNLyD9Uf3WCu59q7TmwoYRsLopCHVoBovyq8LBVGj5QX7X3m9
	QowvhPsqU3BdehlUngRtNm9OKFMK+NHjlbQsK+l3I9IFoSAvP20gNj+R/jVE+jK1vMzzHkB00s2
	i8SAbiXGpAbWh6iZ19ti5uBj9myj/2jjaxKZKKhWK/v5OisqoFsuioq68pZSfT8mVSuTqkEQdz0
	2OgQyyEMLRSvRGewe0WWMF3ZrzANWSUYv+RXYMehFttiyg9Rsb4TgBj/L9avEhGepwlIlC9omNC
	JoFTADlnIie6X4adDhkkQmntaDXlNxCZhbBHcJzWiD7Boa+whViDRmd8AcnDG0EgsKDMkeGVIWW
	lVqH30BzAhws=
X-Google-Smtp-Source: AGHT+IHdyoPC+reGPO2928s8eY4VkIUqzrYH+Trvh6vGBElbMDvsyr9bGCnwye0zSGLIyzetZNTdGw==
X-Received: by 2002:a05:6808:10c5:b0:3f8:3eeb:1192 with SMTP id 5614622812f47-41f98e4cbc4mr6102894b6e.27.1753040356463;
        Sun, 20 Jul 2025 12:39:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd19b3e74sm2025039b6e.15.2025.07.20.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:15 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:39:13 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 7/7] pinctrl-scmi: remove unused struct member
Message-ID: <27a80ed0-65a3-4a41-994e-9c2d3bb76b54@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>

The ->nr_pins is not used so delete that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 9a947ced0df7..372fa67589fb 100644
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


