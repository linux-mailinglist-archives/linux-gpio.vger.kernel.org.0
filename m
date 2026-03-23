Return-Path: <linux-gpio+bounces-34050-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LKPFeaOwWmuTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34050-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:05:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8512FBD62
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B453306DFD8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735C83164A9;
	Mon, 23 Mar 2026 19:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdWDjuPG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF615314D1D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292489; cv=none; b=s/+532srhR8qb9OH6fHdLL4wbQUZv0tWvRzZSoPwZpHq6X7Jl65LmqJ4Ts8Y7uKvxt4T9mfEvEWEGdhn8JX6p96J99hr+x7/gqtrpo/x1oKS1Q/08IXdhBtRwUzsoVLtrrJbQm5QyKuY04LK+WjLtwtQe5z+BeePbm4GZYPFUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292489; c=relaxed/simple;
	bh=kIkQ3M6MU6ffdc+UMu8eQEns2WLf8THRIkoxJZ1wwWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqhyoyvSD+rnccQVlNogEPqkJPTWi9ark6H7c+Wvv1b4dkdvA+Bha2LW1dXz1SDfpcHed1fdmR56QYGzlJYNgTzLnNKjcoXlyPV0A91ukcRE4wSLTISqUdfWSqWp8ihnZ8DWswDgFzX5acknfIzm9ruqe0Tg4gXoWk3Nn7YTLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdWDjuPG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso4259365e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292486; x=1774897286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHuRsDVkQUUGFXQRrZ4RkpmncGpGmYSyMNCrKIAVWFs=;
        b=RdWDjuPGYWu7xTAdZ0Di3v8bO9qpTJkejEU/ttzbhIxCjB5Bg9jmBZ0Y9UO6kAn5M8
         fzsApKjiehVe8UceOL/7jvfECqlG9NajTDd+vE7NlOysqbIRsUb6NPP6dGDWuZPjdYI0
         9Iz+nXnrv5BfRnqVzBZEvfmUKkrL3B7NntXegxeSnowYrqqagEHIi0ipJPCnrWDDYa3w
         c2f6g467G5BOy7P1TDb+t7TS6ZH5o/6CLPDr7CD+nzB2b6HofYnPkNTgQZe3bYErKLc3
         0tGfGrPFpAotvJ24x+jJULrqJJqSfJz5cgqn58RK3+um1jwrMqJHR4GLhQ/PJfjD5txg
         JlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292486; x=1774897286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHuRsDVkQUUGFXQRrZ4RkpmncGpGmYSyMNCrKIAVWFs=;
        b=QgAYHGA1wg8swm3RyRPc4/UKEsN17aGamnzCHUm7Lk3qBZ/iYjzveiTZ2Fgy7V+js0
         Vz65/7UTV6RhXC263PRExAEv0fYTw2P9VVA4JfdcKmcuIELU74KvQrmQFq/texh/BRmq
         /tsZXmQGI2Mf245SOqCRU0I/ZrZYCHBWM/1D7tilaf6edAtTcHYetcYX2W8rNYGVZSPp
         9SxzkO2NRwsBIQ0jreit8SJL44ZuELk2x7QBtl3O7pO3Ng/qjsAybucn7keKkuhHxz1Q
         8FmkQ6SIxVfQjKvTKAEdfPtR3TgNYDN3VDJwpRvcQ/LD8rDmkbU32PYvOC8f2c29e9JI
         V5zw==
X-Forwarded-Encrypted: i=1; AJvYcCXOQVuTTsCFSUoQ/QJjEyhY2AW//eDVDvImWwWdT82SmiQV0n/5/ORy9ax25nudBmYzSc9YWhK1lmGM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MOOmaAbF5a45mHjDBD9Lqc3qIUWlIlxuH6f3kf5hcup5JLvp
	JKpdr323le9FM0aeUAXPCF+XiPZxUG3f8O4Hj4q7PrPsbCMTULVIQh8IoXQXJhru2B8=
X-Gm-Gg: ATEYQzxCNdF3dA3Q+cT1Og9ydjM6HDkuOsdmgndgwfReURw7xY8r5Ez2bdY6WJMAVFw
	U6xeOoLtfYUBgSM31mq3CmfH7+blhUnGcA52qopGPZLcFK8D5XMHLzRj69B97RHb+04m+jSKqbT
	cU9Q193LY4pxl4RVcNUWuln/mWGHdIv4xGVjfT9Kvt94F34i1PnTCrY1Xhcq9byLQi27F3TqqKN
	KQE3BDIetMsp+Qkz6bhE01vMQ6uK8KbiZiWmbpQqjZiGbWzhsV45gQnn7hnuIr+eFi5zURf46QB
	+9BFb+PueSR4dBnQaM6uWZyRoUfeVTAt0LTdaOWEhGoia+YmV+o24hDlmtwY7g139HvCEdLgRNV
	App03WkytgsAuUH7OdYwX7Smp0E6RyF+7EiYL71lysC3MIpS/mwbfAidmJHL83PUBmlLwvunQtz
	EBXvc3hl03PnCQ/YNgsE2dEhMKssGZ
X-Received: by 2002:a05:600c:5248:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-486feb5d845mr199608445e9.0.1774292486005;
        Mon, 23 Mar 2026 12:01:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714decsm28604894f8f.31.2026.03.23.12.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:22 +0300
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
Subject: [PATCH v6 4/7] pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <77357ddd5c96622e4be77c0b209206d5a59c9b05.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34050-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD8512FBD62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v5: fix subsystem prefix
v4: Add r-b tags
v3: No change

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
2.53.0


