Return-Path: <linux-gpio+bounces-25610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0DB445FA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 20:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD75165F33
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 18:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F7A2E2F15;
	Thu,  4 Sep 2025 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuOErrJ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8629265637
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012341; cv=none; b=TrabYZaq9sVYewxnguqRf/7aHfrRhRD8J1jXfBYejyo1owBMVtqb6P6yoafwsol61iF5Sne6kgkbfFueEwSPyyGkCawaF+65Whr1H6gpYgGGOWdQiPZXocubv6BHJqyuWhvpvHcjlL/TYlwhbOJya/y75WC8cIH7SlUzoiE9rxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012341; c=relaxed/simple;
	bh=uivRpA9HtbBawOeMvgjPRCQa2tnswuXo9Y09mOkTMZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+H4BIbY4nynLoXOX40S3OXqNAuLe7Is6ePF20oOZ61dgpnPlJD9h8jGWDH1VXh/jqjngU4g/bqhRhUotdY+sx7hwAun5auaAdY8baPPK9i8/w9UJ2hiIOhrwrZQpEWw8h1MXUGKRhxJjwLd3An3g8tb3OkGUuejeKeyaXCwmao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuOErrJ3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b8b8d45b3so13184305e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012338; x=1757617138; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H15AtklgMCpkPmsWguobA5odfiBnUJPbrja5Zjg/Sh8=;
        b=TuOErrJ3evnYIuhusxHIBESgFVMAuU22hDoTk68WV0+cFB8pzYSfu7+CfwVWEUUbqt
         Ze8JVRodGi8+IGdDP+/UIaTKi2ziSM6bqIjnaKGGRkQXZ4vshj1SS6R+8LjCGy34BLs+
         n5jWz4LfY4LR4U7k9qtTbFyqg+PYfDgYWBrUz6BEJBJcWI6qnZ29vpBBCjbNtkKwv865
         vappMPUb6Oo8pMln7+bky3V6q6fTecNN5vtbn4Aj2gRb7m0Zeo+6Itna+OB4oFkP43c6
         AdLiM/acKjVyIe5ntaC62HVdiqPP/qk5dJyC6ugcaufjDyBw8o6t+FK6/kMhwKnZidiJ
         enNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012338; x=1757617138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H15AtklgMCpkPmsWguobA5odfiBnUJPbrja5Zjg/Sh8=;
        b=rEoTuSOyt1dwZ0zDIUfXUypZC/n6VzXo05NrgbZCikJ1wUbdpTk8aBqMllidHM0jI9
         32PxAwOacHnBKv/XZ4Git/7D1Yd5eaMqpZ9YbYEHb9NDkoLeVPxRgqGmdovSQNT0Z7Gp
         A6I4IuQpo19wiL2rvAR5VJPed4p9wifGoZMOpFAHyw2dz+ApoQYT3B4jOqGUMN/GkW5p
         ano6vrdW6sxqTEOm8dI3K0o+jNo+usQ6tZZvnHucsK6j3VV8BVldQ7jGPurYV6QFbPhj
         Ifwb0NIkmGlZZ+OPF0lx7rdebRgAvOdMbPM4ruihJAOuv3r2KU/rMTamYRrGOW7Ul7gt
         kYbA==
X-Forwarded-Encrypted: i=1; AJvYcCWzuNJNXv3ALTTbYTrhHhhU24mT6kLF9gbp7ac5A9Xrhao8znL87p0qJDssIORX7XCFV3vE1jFus8su@vger.kernel.org
X-Gm-Message-State: AOJu0YybMs2sR5iP8aN8/dFBVAEx5FmFmQQWlTaGxtZPom72M2HEWPvZ
	zEzsYPXjxxB7HvY75pVDreAC/9u815cIZO3vVKINOrAS0bySfVcamuGFkVpkG3pr/S0=
X-Gm-Gg: ASbGnctkN+Dycpvtg6AQSXSgbo4f/lk2oPolsXbXu01LXOCwVLxYOoIy1d0CyOBEtHE
	PqpFSQT1X9y9JPkR8xdnFZ7Bvbox/BuRIvGp30ImAPbkmAhJzrFiPQva5wZjjaEfdQxVXu4qEkm
	IcoNn2oAG2vLB/aNVBSnd9UfDHkFLJirzMiasruw/vkYuhYGRws1BDN33qBN+mK3yD52tDEjS7m
	k92il/px0aSYqodRK3m0j70yvDwrqo2Gv/FETUyivOWdXlNWecwZpHvyOQ400pKA2kcmhP0WQZH
	2TEzkOt1wpwTxKkam8m2cKbfxGl2971+DGUOF2IWnHex98r4mpRJrc/FJIa5XTNs/yKe7OXyVQ/
	Pxk5XivIa3EPlC4gPKSWcumi1k+w=
X-Google-Smtp-Source: AGHT+IHv44BQzQPt0SDDcu17yZCqUyKvQjIqrXkJNrOFeUvr/3w7IzlwPeGAssGYkeSJFClhPjyO2w==
X-Received: by 2002:a05:600c:c4b8:b0:45d:d403:332a with SMTP id 5b1f17b1804b1-45dd53df7e4mr12552345e9.32.1757012338151;
        Thu, 04 Sep 2025 11:58:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45dd0aec70dsm22029535e9.0.2025.09.04.11.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 11:58:57 -0700 (PDT)
Date: Thu, 4 Sep 2025 21:58:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: keembay: fix double free in
 keembay_build_functions()
Message-ID: <aLnhbpfeweBI1H4N@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This kfree() was accidentally left over when we converted to devm_
and it would lead to a double free.  Delete it.

Fixes: 995bc9f4826e ("pinctrl: keembay: release allocated memory in detach path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 30122ca90cbe..3241d3ae6219 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1643,10 +1643,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
 					kpc->nfuncs, sizeof(*new_funcs),
 					GFP_KERNEL);
-	if (!new_funcs) {
-		kfree(keembay_funcs);
+	if (!new_funcs)
 		return -ENOMEM;
-	}
 
 	return keembay_add_functions(kpc, new_funcs);
 }
-- 
2.47.2


