Return-Path: <linux-gpio+bounces-34052-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /o7EF6aOwWmuTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34052-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC92FBCFA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 516F63036C4B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B09A31715A;
	Mon, 23 Mar 2026 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btnBsPSF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AC317164
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292503; cv=none; b=rMJOh+FyKgPBCuKNbuSohb7NNhd+1eYB+4XDSoOEImCguBzx46sqXydKb2ZNAR8ADJ1B4ksbs0DAaCsxbDFJFihm69K25xJM7UmL7jzagnThuRxg2enYCbwIdPa8XSDd2LCKQiTK4Lhgq/lal7/hQZ9EaUsMAnauTTENTJywOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292503; c=relaxed/simple;
	bh=4eMRyd7ypxHELGqboKMzfQdvI1AzqqmZaR+Esy/mH5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLisrvVu+XErWRrx3CfYMf5d6rWu/qEMBrCsvcogRcEslkZdmYnd3Tlu0lQfJyC27mgoXxGC1Zudebr9Rswg1I1nZYrInwiHkuuiDBKcbTBSYa4aLR0YmHhPDQZmaRGBbZvK3G3OIKrQ7hPe5X8wKpQhIzBWrY339XfVcEuRs8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btnBsPSF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37880035e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292501; x=1774897301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqJ8L0iDmB6uCpuEVuLQCen8FVgOtcZrswCudIKUuCI=;
        b=btnBsPSF92cKZrz8T6VQhotiwZbNd18MKjnhDSiZyBAnN1eqPBxva9wvOE3Fremi9H
         iMhE5YFPQQOMeoDtrkQ1NMUgMd0R0QY0ySqjpvqB7mkKvIDEduP7rv7Kva8CYUoRB9SX
         oZrL8V+Dizk8Bd0cM6qhM0dmCOP6sUPSwrM5g0WO8llcQotV4Mr6UdU62vETUZWicaLE
         M/o1G/IBGTt5wtXoxw4wMcUnu6hoeb10Td+5GB8TivzOul1iRNTabc27s5Tdq0S/T4ge
         ieXy0R1gRgbFZsKe9l9NfxuY2n+DmmCNwyZXr5IC5oQlC356SYjE0GBBbmwIkVS7Z5b2
         Z4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292501; x=1774897301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqJ8L0iDmB6uCpuEVuLQCen8FVgOtcZrswCudIKUuCI=;
        b=EbNMKnZKykxykRCLHo2TowJdCFpDvv7MKTYA6rurqH+/Mc6k38I3B50ZsGPibNVu+W
         vX7YP3JzgkEavTCLk3ytNZgMJwskTG9Xcqq5kX3Qgypdf/MPxrYWlGZeM9L0nK4NigGM
         LAJdi03U6ZGJOgseBJR7b0bhyJNbrDVTL8hrucLDevO2yxoO4PiN6Uu012FQxJsP6M/R
         foq66RgqHmZiBLITRZckD4mV5uGiBfoYVPhenpNNEOWv0Nz7CFKVJVRleCeuGrjBm1zf
         s2Fd8nuPSNAj/ntg740tO68effsluJIPpEHSZjH7y2SKeY55CS0rBzrURW35Loy46Fk6
         rfmg==
X-Forwarded-Encrypted: i=1; AJvYcCUswJYxeeQoMdcxIHTMMqtwi6UOup+07xkJHdVEn0izJjRjPEGyLNRKyFRa8POMMRkj3QgVmASAeOub@vger.kernel.org
X-Gm-Message-State: AOJu0YyTy5bRrFAZkmXtEqCY0PkdbI7PwmY/Lrqzkk0Z+2dKFrLPC1QZ
	fywbvmj/vMIrmJRAZmYX8cS0NOVO6HQl8kvATUM2cQjp6rMR+bcYQb3kqy1epFVmSCE=
X-Gm-Gg: ATEYQzw7eVOfiOWdRbHidGZW+6HZCMLlbZY+yZodmfOOicHzqA8BumbHBDv/1qm+Don
	0krQsRu1ZZE2RPlZ0fb8psZFqvWHw4KfImwDGOO0hDDOP7ABKgJVuHOrox7NEodiF+9dynvDUC2
	Z9jxILD5YWN8H8L687/HLgDjAWDZQnyc5fCKIoSGjM7vwmWEzNZBeIJY9mBppot52XnCxT2FNBC
	8jBbK3JKyJgFFFmXvm7Z0WCF1fp3FDPnD8xmmXcsM36g17mgZxTrU4hHz8U6ycIh/REYxHzySQQ
	XFOeQnq+oLpsEt+IJFro5WnFDxZY8FcV0svViHzy7fP1kVBOQ0Yogk2o+t4Qd7eqR4DPk9vFul+
	7fr5GX14P3doVvkplMP90ZmCnRghHXzhHuH23zMuJCrpb/wWTW/pt9oyJHU5Jfmj4dqhQymZBvc
	cy7B4qDsVcJJtTzHH/Hy0vfnOiQBWW
X-Received: by 2002:a05:600c:608e:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-486febb58a9mr166627335e9.1.1774292500848;
        Mon, 23 Mar 2026 12:01:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe032a55sm582792635e9.7.2026.03.23.12.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:40 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 5/7] firmware: arm_scmi: Allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <2089955559d22747745c0f3fed19c1bea8608d83.1774283146.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34052-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDFC92FBCFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
v5: fix subsytem prefix
v4: add r-b tags
v3: new patch

 drivers/firmware/arm_scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..42cb1aef1fe1 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
 	tx->flags = cpu_to_le32(type);
 
 	ret = ph->xops->do_xfer(ph, t);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
-- 
2.53.0


