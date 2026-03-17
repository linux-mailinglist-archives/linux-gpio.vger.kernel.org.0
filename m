Return-Path: <linux-gpio+bounces-33652-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODhCND5quWmvEQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33652-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:50:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 762282AC588
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F013431CE37A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426703E869C;
	Tue, 17 Mar 2026 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGSCG8Zt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8563E867F
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758457; cv=none; b=asN/LAR138yTSVoRrTYlaWOz5kMAeRg/q7mddB0axo+B1psdzotlPy1bWD4DJaHd4GT3W2qYV5OdY4X5H0pSj5VQyim3azcbxIva7taFPzjvtzxMgS8EEc8FofLN0sMJxuwxh7IUGGAavv2WcYIye6X2YBgdY4Fw/Z+uz/ttLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758457; c=relaxed/simple;
	bh=oPCxjt4ZglPl8FoPqS5zHJsj9PgEDc57nito/qfRjsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iI8gGqdr5tskyC2L9nV/4IfmGKcuBjDwJns83E7KnUykac2Z3fVVIAC0xCxXnXVcvP1CY/dZjKUL/aIwkpNK7Qknd/iHf9xjbQ841miR3kZiXfummPyKm2mIgWPcwlwtGG0edxicY/saVaf/JVxbOUnB/lmlb8pulD9DMR9erF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGSCG8Zt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso51963335e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758454; x=1774363254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1C8bQzpx/uEkLcacI23jZqCv23os2UdSq0AA05SZO0k=;
        b=cGSCG8ZtVhqWQw4H4wZBwM70A16nHRNqpboTGe6wTZD1izRvQvbOFXDvclO9dLpvA0
         Joys7WJvE6GsBkS7iiO0mM/f/3v/XcR4JtEiG+4Iy28V1wDgLXEocbG9j18TpkP/9qb6
         M+Y7WnbJODLGJpo6mtluXbQpZSbFou0Qol6l/3bGpR6z8p/xfaBSUWhSmJXSp+Z9eOVG
         nc4Q195GvB6A4KqtXJxxmyqOGoy8+XPuXhzYphloWZ7An/XGu2mULhIbVzWDIcDiZ7f8
         j+8CCo6BrFVvsjAwq9+p7+mlXe+KRj/KtWDEpBJcTE7HbJkZviw3fUWpgYDzY2HVoIkb
         lqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758454; x=1774363254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C8bQzpx/uEkLcacI23jZqCv23os2UdSq0AA05SZO0k=;
        b=ow5fGLJIdVCCpOjwEmA8oxBD9fyq19JwXN1WZw/XkMlaSb4lZ1TQqMcDhXYESwN5hL
         gx5HD0FpkOvqUtp88EwVfE7NwUl+498/yxMRELkZNiMn63OvCfO3ylzxJKMQm++ma0Iz
         fTioiZer869t3ryoFdNpozxlGfkvRhETwY0L6ySJgZ4p72YSgrQNzEvnTrrrJwOXQTuo
         YghfLlCxR0gSnH/9i3DVLV4XhG7YUOatRJJUG3R+UuDFIK+O/eiW2co0kKHPjlfo8jxb
         CzPOsQquVrvpriwVYoAwSnIzUu3L2AZEXlAeGH/wQIn1Pom8EMzRhMUattqvSZbvFiAX
         6oQw==
X-Forwarded-Encrypted: i=1; AJvYcCWXrdA8zDK4P48rTGjXZbMK8cRerEUk0ZpyyAWu6+DqJbEOh3BmWYH7dO+LZ/i97gVF8noKWf8OrtNK@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBRf/eqdnU+YqfT9+BS8nyW9CH2Clp8EQwpAq1wS+Lf7TyfSp
	VkGEt/j3jhaZjrQHs7nI67bF/DWYxW+vEDCrV90PuNKzdADdnrttYvcVt8Sg2idrA7k=
X-Gm-Gg: ATEYQzwxMPtMx3MWtSjDyFkR4vb6cFkotVD/KFo0iIJ/iTjCtUXyEJquql7ChKzN2ec
	EzccwLFVpyTzl6kLD0mVoXI/bX+3zVo3QbcROszXoPi/PaDd9/mbY5JaDW9Ztr/6RaWo2q42XBU
	mAjWpDTkyO6dnPErh5+PlGkSXT7/Lsl1ykMsfb5d8k2b1KATyXtgYSd1MpIHLWcKkpYIDf5w/wc
	Jzrv5e2aHtsnwDUlgfOQtSXhfZYzOgP75DTsHhATnxYIHKGbrKXjEbuL5+yKyBqYtjj6140vb+A
	kN5SX/s6WFZJY5hha1lSjBYC2TRkTeahJ8ovuiL1ho4U+gaV1Web7mihUwNvFBOT469ZRPjT9kQ
	G8X6exXfuWqBEeVSWsp2qAmrQ5qsmRuD7fOa2gP4Qj1oQ54DvLDyJk95HU+FQN82FlNinmopyhQ
	RHgXTR0T/76OtLlNbYlMrLc7HFvoOU
X-Received: by 2002:a05:600c:3b90:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-48556720f86mr269439545e9.27.1773758453766;
        Tue, 17 Mar 2026 07:40:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855640d915sm118222495e9.4.2026.03.17.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:53 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:50 +0300
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
Subject: [PATCH v4 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <aee820fd35412fc8679558e7df4a912f1fe27f5f.1773757772.git.dan.carpenter@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-33652-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 762282AC588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
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
2.51.0


