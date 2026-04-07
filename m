Return-Path: <linux-gpio+bounces-34807-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGxfC9j+1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34807-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:55:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E123AEB69
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE2730238D9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B246E3B584E;
	Tue,  7 Apr 2026 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="E5L+tIP7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445ED3B530F
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566405; cv=none; b=NnKfBZaFa8svfPJ+aBPot4ND6/fTNfVkhS+1c6QcAcnr0augPXswETTV3KzNBwyjpaXJvurJzHqcWSN+HvtOklduo53AjA1LnKxm3yODyiJCE+3aF5pcBcthF5V1XzKtrEYUdWbPj/74AZFvMXclh6a6nMbMScmQ1JTBXhwmzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566405; c=relaxed/simple;
	bh=i8Ky7jN1vb219gvtLaR6stiV3r09kOF9IWgMsLPbH74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3qpn4UkE9RyL2WqE4mvjPfqzB0EHFSfukcyCh3Sw3ms52ososJ6OoWgMGyHOaLjMUZYnJzR9X04+vFz3/Q0fY/RWTwQmrdKTeDdXTL6YQbnONT+KXRqYG14mk5UPVrR7pLLBrlwQWxtFDcO+zm032wvQ0WIA83hnnrXuOYJ2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=E5L+tIP7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso15757185e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1775566403; x=1776171203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8Ky7jN1vb219gvtLaR6stiV3r09kOF9IWgMsLPbH74=;
        b=E5L+tIP7T+DMdfClqkLA1ICGnLO8AazFzSe4yy26akpw+Lnx/u71Ufschq6FXkXI71
         etuQpCan2krsnTaIXneaLntwL2k8OwOnIfZ3YgJSmzfhnW/vHNHtJgNhpOO/8eT05miu
         KAcJqOMQZhIJYZTF1hcGa6YCzBVrVIDaVpt5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566403; x=1776171203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i8Ky7jN1vb219gvtLaR6stiV3r09kOF9IWgMsLPbH74=;
        b=OE8/THvSoG7oLPvWS7r2OBqd6gA5kJa6xmDqYRbUseUkbFi79gdFC5ApTCEsHooFi2
         1iFOjaqxvml5GGUrhaDGnH5ynRz1FPk6NTS7uEnhaqd4wgw6lCXy6b6REQ3NUdtUAcjJ
         0jyZGTckIq4va4HkAz6Ak2qRO0EBKmgLQuoo30HA8bZYPpQj+5gpRdrOgmd+Lli5VK0g
         ALlDxurLg8hM1dbk6w2f2RSGKH58WnQwiVsE+JYKnL0anoxGPa7GjD+ulUI/ZeU9AtVq
         iCiEtgTxbYYJu3y+ffKhw1HM+7YE0ms+xnBYlDkTJqVAtykP7fUg3UNqOpOtpZtCzXb6
         IxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmQt60Sc6PXmgrehN3VUo8hs+y3LDZ1b5dCf+WaWpd7nBMXLKLOy4Yb1We53PUgmCJJbXG2TmIW6I2@vger.kernel.org
X-Gm-Message-State: AOJu0YycwUH4yC32VfMRHW1smhAESJDqCnrBwnraZmJKGCFSC3F5N3Ij
	cSfEB1gztKeGOfzGiDyi9Md5GqKlLQmuttjTDbUBkA45ratc97UWEPdoOFiSseodUxc=
X-Gm-Gg: AeBDieufHIS2oO0AjAdvrEPso4veNW5PA0yHgAZLm2HU7FPcnO923sdJrHicDrCCcQ3
	7mM0w5E1gbVCILJJ+tkXKs9bvNAYKU9j9z6Qo7TZppcfSwIixf3MpPGpS4iJ3/hSycgJ57WKbuC
	9rcYKXyLDA6LC5bBXVfqVl+ehMVQ2yyyTq826f8W3ONWzD0lyh0l9Ho0KeGJQS1AHBks1ma5Ave
	a4+FuzBc9tY19XBR5EmsbZVEMwHN9aceGLZyfhHBPb/Ar/bS355FZQoYVFPYBxvQWm4lcotg8eC
	BiPO7DutnN17DppkBxBb1YVE1gXXJNMfG5i2ffOBMJBODCPDbPzqDdizy11iGh3XZn5iqpnYWHP
	yGETjnu8z57ZmKGElRTGpY4VW2Dciq1A3fHtruGgpxGI8H4A2U/tRcNq8m9/W1qCqGKVGA7ErgI
	+SzlFcy0pE7bQNx6Mssr/sFRYEvnBh+O1+Pik6rXzG6rXiQ+BUTMgVrgxf
X-Received: by 2002:a05:600c:4ed3:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4889970ee1fmr245541745e9.13.1775566402659;
        Tue, 07 Apr 2026 05:53:22 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a221aa9fsm127567945e9.3.2026.04.07.05.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:53:22 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: airlied@gmail.com,
	brgl@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jagan@edgeble.ai,
	javierm@redhat.com,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	megi@xff.cz,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	yangcong5@huaqin.corp-partner.google.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH 18/19] dt-bindings: gpio: describe Waveshare GPIO controller
Date: Tue,  7 Apr 2026 14:53:18 +0200
Message-ID: <20260407125318.282288-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-waveshare-dsi-touch-v1-18-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-18-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,lists.freedesktop.org,edgeble.ai,redhat.com,linux.intel.com,xff.cz,linaro.org,ffwll.ch,suse.de,huaqin.corp-partner.google.com,arduino.cc];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34807-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,arduino.cc:dkim,arduino.cc:email,arduino.cc:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69E123AEB69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 10:26:37 +0300 Dmitry Baryshkov wrote:
>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>The Waveshare DSI TOUCH family of panels has separate on-board GPIO
>controller, which controls power supplies to the panel and the touch
>screen and provides reset pins for both the panel and the touchscreen.
>Also it provides a simple PWM controller for panel backlight.
>
>Add bindings for these GPIO controllers. As overall integration might be
>not very obvious (and it differs significantly from the bindings used by
>the original drivers), provide complete example with the on-board
>regulators and the DSI panel.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>

