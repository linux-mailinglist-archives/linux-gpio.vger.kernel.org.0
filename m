Return-Path: <linux-gpio+bounces-33651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACslCjlquWmZDwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:50:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D792AC571
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC4DC312E475
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C0F3EAC82;
	Tue, 17 Mar 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqESYGcX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE06B3E9294
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758444; cv=none; b=D7b3BtQUc93fri+lIEEmCDidyL4X5MbkLKvX68HuPv32Ehn9HL6+SJIE18mfE6v9oWD36L8nsRUKg1Bm41OeOCHid7QrOoLI3r2h8XyhZ3LS3lfrxllEQDS3QVMDuFrQlAILG5XM2Ytgnknb2iQDl4MjUBCdxMrl2zAAZS2MAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758444; c=relaxed/simple;
	bh=7a5a3v3MgqZ/GA74qUzH3PzhixRY+vEg+ccw7hFyePg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YajMDzfvQJ2Yql37OuvUgFkkdb9e6uWaggpaKkdBAVJTR18RmK04KnW3E34eQgioLygill6szN537PFQJIPsKGMKJ0pm6osyto0e/xt4fuIVQn0qpEZqmR7h9qtkSg/dOTIFddQNVMkpA5Lj3kuHdU3KtS+oLHeVXuqiS9oyPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nqESYGcX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b97ed4ad579so40484866b.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758441; x=1774363241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QqAW8Lz8UGhU0wvIEqMX1J/fowDMs++jiY4h3lV2FoI=;
        b=nqESYGcXKEVMHd0PI5WBSUwfuwC3y+2a+EhDctk8yAYwXNl3OT6Mj7+QOWup3+FPD+
         mHU8/aaYze4b7aERYf9YN4viZ2J1y5/hX7fJAcrrZjFk2oa7O86pHfE/p78c67dc46eo
         dpYT+ZhJuHQRfspT6FImZbXj7mHqJZ8L0DcC2zjV65/cHVY0Tm+fogz5BkAfWPaeVCGk
         YhPvZohQ5YD8o11jFgv1w2hNDi6ZJvD5OzqKvOKUoyXXuxnnVpMva0DG809F//v2Sy9D
         FhXzymO7FqAyh88D83iEFIG4iQ+78AxwhepXrBntENcZYMeyXoB9ACPmnhbik8nb5+i0
         QT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758441; x=1774363241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqAW8Lz8UGhU0wvIEqMX1J/fowDMs++jiY4h3lV2FoI=;
        b=WCfj1AotoQKFN3tXsxVcMz8AvcG6Y5UaL0lnMTm2/bDsANqCwWzevtG44QQDbckbAx
         4sqC1ErOxsvdx6vD1QucX8H2uXnlAmWaW7ZUeCwDOWECVyNIDalPXyQqi4Js+237N/Qj
         QfD8om07l/qCP4vNtEfIQMoyIe/sFW1HrKCAAI1iseNoJDFt3qq1KB3eSYwMpTWamwO7
         Hz7lE4ZGhxpag/luPfe6L74AmUjzNm9tl8Z0FdomtHX95Ok9rE+xMYOhyWbhJhhc6aok
         y2yPkVLNWHTERLddaMVmcgjafmo+gLAp/Pz+pqGg1fx9rj1UO7YqGLltma3baruf3ZBx
         psLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy471Y5tZkJ2DRpQMYd8tpHiM3SolewYKd/lP+6aeWndYwq9RMefFWEiF4LpxS+G8iUYLcDcrEg98H@vger.kernel.org
X-Gm-Message-State: AOJu0YzABRDiG9ZmbmjQkCh0wIPB7CNH+LLrVXwMFtWqqOXZhl25ojSh
	K5SWmVPmQWLLufOTnjPTitHMYTBRr+xd+m99lsfW4MZiUt9rZeO8AfagYe+3HoS4o7g=
X-Gm-Gg: ATEYQzyW2idVDHWlJyvjojy+OCGShzZ1UbhGh47YGFS0PkPHQtu8DFfwF1n+yKcpfly
	a1HcehvB6KnGDz4EpKj+Cs6YDSQL6QVOaGhY4B52cnTZpYljpclAldiyxgu5hLZEpfMV3/6MQtA
	Kf+BPqzPf3XZ8cbXnEwloQFGpOaXA7vb3KGMyBA6kF+M/vtL9H3gYVXrk/IKOw2zkCZjWGc9WQ4
	1SOlSqFr8mWvw+ZXB6TyTTiFlTEWRZO8ZIoNDKoKAMZDKh5uGKc+7BJydADzVUqCiWvP94zL4ym
	XncmBx42rMNez1WI3Bl8Y7Bx9QbnVBUUm8O9ey02iMNKAsnbNaA4Ku+MQntX3zU9TJxU8/9eQzX
	35CjoC4ZdYaLQu+iv7P87YiFqU57qKReNXc23Y9+tllbe7Yipli+bLisPZv6Q2EBlYROGtNlp8Y
	XQoOej3LzCghtODxezMh2dyGw9/fro
X-Received: by 2002:a17:907:84d:b0:b97:7966:cb1d with SMTP id a640c23a62f3a-b977966d1b9mr848405066b.18.1773758441127;
        Tue, 17 Mar 2026 07:40:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc220basm753466566b.28.2026.03.17.07.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:40 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <10c43dfe5f72eedb259db533004acddd5579e168.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33651-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: C8D792AC571
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index de8c113bc61d..f22be6b7b82a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -361,7 +361,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 				    unsigned long *configs,
 				    unsigned int num_configs)
 {
-	int i, ret;
+	int i, cnt, ret;
 	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
 	u32 config_value[SCMI_NUM_CONFIGS];
@@ -377,17 +377,21 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	cnt = 0;
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		if (param == PIN_CONFIG_PERSIST_STATE)
+			continue;
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		cnt++;
 	}
 
-	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, cnt,
 					 p_config_type,  p_config_value);
 	if (ret)
 		dev_err(pmx->dev, "Error parsing config %d\n", ret);
-- 
2.51.0


