Return-Path: <linux-gpio+bounces-22458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F017EAEE78E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 21:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 091D63BE3CB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 19:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9549D2E4277;
	Mon, 30 Jun 2025 19:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ni09lOP9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20161F03EF
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312114; cv=none; b=oDi7fXkjngPRJLPQz8CdEKgLTNqlOd7hoZgZBmBbaTwTjDfMcFAXWRqczwJBPQhN+tsyMdWOR92u/10gVkXxFMNOfxXotd90IdVjQgLl3JJg2jgaxyfydbbcZHIshUXS9moICtdXTA01fknU34i3S0mITlw1W2Exw3MHhDs2cmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312114; c=relaxed/simple;
	bh=qXtzQduWyG1nnENxyFhaOaAmJ0Qdb9v1mRc0A8dmTZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+X6kGSo40eZLN5XmzBO+bxJIUC9lSCbyvL/6w4OwuHE4PuihsMWU7LlMpc3aV0AJpcuttlo+RVrU9R5ixRdUyC5DefYM1H4/kr82bGv2THoZNxH6hPG7dHOrsr/z3VrlaLdRmClMAIMSNYQDKycg01an4jTSHg4VI7X5Vhi0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ni09lOP9; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso2678624fac.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312112; x=1751916912; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXsvGPzWyN5t9Z1gnvLwhC+mL0nu2lbnJlTwsulGJGU=;
        b=ni09lOP9WqOG72I7EUutge3hqeAKr/ONT9wPjgPqDuFihxEcrVV+ByqoR6m8qgrFnY
         mj6cEzq8EAmtUz5Sf0N8VaS0rbAHAdyJnnHZXS7bkzv4Gt52+9ll3PAiVJrwSdLX4/EU
         uKvcpIE4HT2BKhfKehD9Xr6AaKxWaHwwaukJ+1Y6PeaFY7pbS6SMNM3k6plh1ljRD5/+
         C0DgUXTb2f+229rNesHsfiylKNgKEtbrV4P1/KMeIzSYWioYlMgcMh0WqxdxpDvYlX3F
         iMITN5o3dQPclBAssLJgywiRTAQJt6j9h+JnN/yd/C3XZfU05+xEDEUCb07eKPUuIx7+
         NjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312112; x=1751916912;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXsvGPzWyN5t9Z1gnvLwhC+mL0nu2lbnJlTwsulGJGU=;
        b=ZFUitaKxukfWfqyh18Hh7hYLx5UxrCYmgxdG+45DxCRT5u07RTgNwsEkHjZ125uFgc
         pm7aXkmpsNsmFHa9gB0vMVfh6MXWT/ooAXU0MTgRlK5/QPLh+ZfukibV7VvZ8PMgdjfo
         9CdkM/nJUbSNT4qplRQU/YaJHYEDobTA5LVbTGuwZLUSAIAL4kQNFJcOFFArJb7RvqPF
         bn5J9llzqmTA8aZZcn1GLEE5x6KcAp18g3JyczOv47PO/JWk38uwBxRIUJwUN+FlrWVA
         1hAtCWKRYgrf6l6Kn0vFcMbC8cFPcqcVOXT1YxOvP714XDO6rxeq38NEn4x37qUEne2K
         lOlw==
X-Forwarded-Encrypted: i=1; AJvYcCWQmyzJGdj75iWUo0PTSgXNPqijlbpbepWiPUjxBDsM5I2wMguOwmD6RIj8iJCCX+1mEPh+FoJMEOn6@vger.kernel.org
X-Gm-Message-State: AOJu0YzmcKZ1yFBghFIHvaT1UvQpTqoNgx3zmcspLWOQ2hs6Beyi98sT
	C6bITjZzi1kz3T9dzkJeBIphY855SILXRXdR73uha2o/Ct0xm+7sUiiyvb/ls58CBKw=
X-Gm-Gg: ASbGncs6ZUy8hQ/gOyVXJTsHt2g8Fl2DYiOa3urFET/b4tFDmj39QSXDtOYPzWwoVxW
	YLNkXx7pi3h7IV7dKut9gLsCcC7AcYDZKN9Xezd08mx1q0oJt9vp79U5r+zd5E1sxuhpz0ootxv
	TEsuqZDHaSLVv5j7zDbxLpW2CK6gLsEL/DwzQuLgyW37sAdJN6dXlZ8zGfIPInlQjgpI1MDTwCY
	Zq6TkYyvRAfgj4uT1kCwV7f9G/JaRmPgM76xQ2DD3CAtXO49Y9YMaXRet46bWoI01M+7V9oo2tR
	IGnXNX+797lGJyd+DTIEzldG3nmcSAV2zY3+HQfIdjWijIWsZkAnWtdMdBzTj19ntqPT
X-Google-Smtp-Source: AGHT+IHBfKAmf1lqnS2UU9I7hvaUGYYEqpqLvNDpx99U9Z8tqVzOU3X1JHzaOOJJorbDRYRHSHPO0A==
X-Received: by 2002:a05:6870:f721:b0:2c3:1651:ca78 with SMTP id 586e51a60fabf-2efed4b5be6mr11398659fac.14.1751312111789;
        Mon, 30 Jun 2025 12:35:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd50b1b2fsm2876906fac.32.2025.06.30.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:35:11 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:35:09 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This default path could probably can't be reached but Smatch can't
verify it so it complains that "arg" isn't initialized on this path.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I didn't add a Fixes tag because this likely isn't a real bug.  Plus this
code is very new so it doesn't need to be backported anyway.

Also checkpatch complains:

	WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

But I left it that way so it's consistent with the other return in
the function.  Maybe we should change both?

 drivers/pinctrl/pinctrl-rp1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index d300f28c52cd..f9cc6b28994c 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1524,6 +1524,8 @@ static int rp1_pinconf_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		case RP1_PAD_DRIVE_12MA:
 			arg = 12;
 			break;
+		default:
+			return -ENOTSUPP;
 		}
 		break;
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.47.2


