Return-Path: <linux-gpio+bounces-33966-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLhDEnpvvml1PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-33966-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:14:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52352E4A9F
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D42D7301B147
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B722F7478;
	Sat, 21 Mar 2026 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1xOTkMz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D2B2D97B7
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088033; cv=none; b=gpCax34HHcYLIjYsxoLWykiaqGIBNJp1lFxSQv5tnWXU0BqilhmSqbrxjMVrzBln8xaVblxsFaVf6g6fGDxBx7yj3lGK0VmJr2Vh8xYSxEfHE7pV4SsJi4XrmIKpaQU3d31R9ZgBve5zikrZfRGgPOgzgzl0kPKEoHJz3arx2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088033; c=relaxed/simple;
	bh=9TT6fPPrCVPWyWOTkQtvqNji+N8nh0GAaHIQ5G61F/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvNeGmAtCC3iHKZmfj8iJIl81lFdDPswFazJFEINOpTuMR8h3li6vRdO1DfnJGCrqUAHztOut8Ldqk5/GjKTqhNbvTRLglopvq1IBN2Bay2Ncgkg5cAMTARTIMniEgNPzgzk9hJLAc8WJBmWyCmOvgtED7wApv85AHnzJ8PoXkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1xOTkMz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486b9675d36so20598645e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088031; x=1774692831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5nvE2qXP7SXrFq3OejPF5HK1aF/+SsVNdOeY2ld3e5k=;
        b=j1xOTkMzdobbHtAYCpJ1yICxLtvfy4yrGWBvdKF5KUhsjwvMQeCrXTrTjM4JXCWJdI
         SEHzXxPR89YsmeP1yBeuR9eLRHkiPVJd2HdG93JAaWv8PE6hCEc877mwEFoDKwJEYpjn
         6arMh81gx9bFxw/wr3V46mMeWdh6cSFcJosDAWjVm1Mr5MaGB2uS0GNTXfx8uNGrrMVl
         zMc+2r3WG8Vt9gI3SLiW0w8S9AKleqTMC14f/8MVpdVQ+b6mWDyXHLhI3xkN9slMKQOE
         VvoYj5x2Jdox2vTq1liHvZ9HxdJVPibb7i46vhZ0ZyyoBck8L1uUKdZZWPd83JG2wdvX
         +pBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088031; x=1774692831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nvE2qXP7SXrFq3OejPF5HK1aF/+SsVNdOeY2ld3e5k=;
        b=njfxyjRyg7MbWnItCGsq2CWND/D4eMF0BaO0BK/vIinPLexP2Alm41/typtjcKMJiI
         3FlUo34i0gFHMqSEWVTck2ix4hXonA7m8Vxqy3hIvrWml8JAvtvNs0p5YMLL/YL6ch3+
         gHjnamPx6wdktMWGzWy0/bO2K+KP/+XEMrE/uj3ZIIMXgt2RrWyvQFUBhHeB0BYVsr12
         faNKoLDZNLuDdSc95JLL21hyN+4L6eyBlblRmejmvZiw8HHErgrl2OPV34JgEa+xFHm3
         4J7B12tZyXYnyH+93uC2kx9N55Y1qQGwXI64RvFrLu0Y4G4f4mLyTCze/Np0Kvo5UHbP
         4OZg==
X-Forwarded-Encrypted: i=1; AJvYcCVvfmWJMmYD+OpoOvlLbrAr5qQxy34xcTGExpeDkgmHC3ynrATGdZO9uLDMP9w50zSqihCoYVpwwAhC@vger.kernel.org
X-Gm-Message-State: AOJu0YxyaX8YTw696ZmLTMdcLvY8x29CfddZDpeRTp4tj8V6VVPjRq/u
	5fQmTzBi2RPfP2qXvVUE9R7eh+Q7mYBHhHcmcHnJpF/WSLW/fOk37cYGiUEurtU6m6Q=
X-Gm-Gg: ATEYQzxMPaN3chY+F/JA2sRuuK5avboGa/eBFV2xb8fwnA8KYkGgCQYzKmB9P4VVaPD
	UbsJeGa6PTstND88dtkytH1Bx8VvHhPClX6Zm5z+zbsRUCJYC792DkXWTLvjGwZH1yO36AMqR0S
	NB2hFRdhcfU3Gz1pj3RkSLE3wgCEewHML7H5pAcZK1sNPiqHqNXCdlPIw8GrGcheD4UApVmrTd3
	qnCaAMiFm3CcvOdR1FQ9fNNQeotBQBy6iuKBhDq/3geWEN9/HOqixJE0P0/zn9oHuyRkfC2Hzub
	4C2R7Q69ig2hPJMyJRcHFOjcwfeZ2WV8/yqoP0YvzSm2vZ13MZjg092V7Q0lQE0VENCsHOGpGpO
	2kd5luibAGjASOrEPorAVsAL5ydZAMCSy2aG32cpPWvOda9rqN8dc5GjJrAU/Cue7O7ewt5adiT
	+JFHvTafsQq1URPJob9bkXT7jwWrlr
X-Received: by 2002:a05:600c:4e8e:b0:483:c35d:3659 with SMTP id 5b1f17b1804b1-486fee04a48mr82485135e9.18.1774088030748;
        Sat, 21 Mar 2026 03:13:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm47760825e9.0.2026.03.21.03.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:50 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:47 +0300
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
Subject: [PATCH v5 4/7] pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <6087ce1233834f554de6f1941ff5bc85ffa059a0.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33966-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: B52352E4A9F
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
2.51.0


