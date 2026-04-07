Return-Path: <linux-gpio+bounces-34802-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKCMLiD+1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34802-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 175733AEAF8
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE8883058E0D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D197D3B52F5;
	Tue,  7 Apr 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="iFAKhpxU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B13B47D8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566302; cv=none; b=rppTJN8cuCguqz9wi9dqijT6VMmJi0TKNj6Ids/Q8rQ5J17S4GdJDDhVRv4M9HFL7t0I5BzSY9rCDNGc+WcxB3+XxuQOaNNXBc5LXlG/g0PUlaC8yTBrjbuj6wEXvjK3zjdWZLGlNco1YGLerofm0nyjfcI+oRApgvBlGQ207oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566302; c=relaxed/simple;
	bh=MWfccEFrjalT/iz3u7SOUElkguUlZhU5FGjm0QzY0lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChLdDxmGg1qgLsH4//PnEX4xOXQzjhv1eKbW1XoQl0GtDOrNGwy3KI1YYyMqWJfLfV7RYGBh8cdzUo87tNNsGsjxBVdlQhLzZvQJFFjLjeP0r1bYkRc+fnSjdkoTwH2J+c/RQc57kFkPuLqiLfOM0cNUvibJ+nRsbZHZ6od/N4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=iFAKhpxU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so4191959f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1775566300; x=1776171100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWfccEFrjalT/iz3u7SOUElkguUlZhU5FGjm0QzY0lg=;
        b=iFAKhpxUXWClzqGZ0gsgh5IHapvqSZreqkK5r5UMi1ljBQGth/mk469hCOjt8Hgbdw
         l6WCkroDNgifMIqg10Qh98ugFXhiRAi9LPdWeLzpOD0uas7AzKNWBQSardXpeS038gdr
         qiGhX+Wovf0HopTYW/bJUhQGgXJS8gWcz3FCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566300; x=1776171100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MWfccEFrjalT/iz3u7SOUElkguUlZhU5FGjm0QzY0lg=;
        b=NHGmbi9hLQhHU/JpM1qtZk36Cv2uIKVp2SODMj2Rvg5bhTCA3E1inbDH2QLqWzngxb
         CH/YgCbr3NpRkidwWrLtsq9GogcO8yWfUV7GJIV06dskzmk5zQwdkoFjXEpzbCYfwBJq
         dZyWeUsIHBgHhpRU4ILvvXeZRpYZiyDBttjrllMU9PRwlFnhbJ7NLlSQHAYABTo1uDvF
         AJt+Oxx6LZ842dY/2+jHU+N8cwZnMK3by7mXPDRnbBCiVRRczKQdCgzTIPwr3BGl2lKC
         we1ARZc+nYdlkr7jJzrejSNu/kzQtwfG5v5lZpMfXsel8c08pgmzLourwYdTR9E3ZW/j
         oPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4GX+xOCc1+Qi8kjFLqiqlnjz6JaOfTuRdGrbFmWaDJKdoibVm2C1NWq7ierqjVMH6ei8ie7kEA0LH@vger.kernel.org
X-Gm-Message-State: AOJu0YxOvo4zZIjuAx+SBzFKH5haJaVgbeh9FCUC1CpGmdfkpCCrsrVs
	zzh/7FJM0d5EmKBj0VVABOrbF2N2m57tKDIkr+f1Gt8+fIo+z2BZCo6dsTIO/pmMb5w=
X-Gm-Gg: AeBDieugmtSMvTr6UcOnxTnCC9MIR/8cZaFiXVmoOECCrPQrUYWIm01KOOifGDQC61k
	mdpF4duBvAm7UkeSCDxByGMWm+kjl5+qekxu/2JFvS0RfohX9gCeeoFI7mOod2QMNcE/0w7wieA
	xhqTHe8PDZ4SXpnquajGuXo08d7xNS9H5xBaDrc/J4Uckr+4CQA3qciY6HM5ds6K825u9NSRVRF
	a2VQ47ucoS0LCsYQTmQBxbZuYdfTspIpnQfyQamkBwpLZ5GeJKfNz5DbuULRj4WVInRyB57uaVx
	o7ibKF0Bnp4a5LOe8HtoEmkTcyto4Qit3fTSqJ1SAoMJxOQqY04bmP6c5O5xHFOuiRhdxjcmKkU
	CSIFC6x+9XkxQRCYiplj+mXp+MYYYkFaHduqah9wAUAx1jo+lTM3xVK1WX+H4b9/pkLL5GSsr39
	NMJoWZUonAYxubUEjXdOdDxyPnD4oFkY1xwhmHp7nAUrQA1YaZ8E8N9ddJ
X-Received: by 2002:a05:6000:40da:b0:439:bd70:610f with SMTP id ffacd0b85a97d-43d292ecc9amr23145975f8f.44.1775566299767;
        Tue, 07 Apr 2026 05:51:39 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm48085402f8f.37.2026.04.07.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:39 -0700 (PDT)
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
Subject: Re: [PATCH 12/19] drm/panel: jadard-jd9365da-h3: support variable DSI configuration
Date: Tue,  7 Apr 2026 14:51:36 +0200
Message-ID: <20260407125136.282109-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,lists.freedesktop.org,edgeble.ai,redhat.com,linux.intel.com,xff.cz,linaro.org,ffwll.ch,suse.de,huaqin.corp-partner.google.com,arduino.cc];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34802-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,arduino.cc:dkim,arduino.cc:email,arduino.cc:mid]
X-Rspamd-Queue-Id: 175733AEAF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 10:26:31 +0300 Dmitry Baryshkov wrote:
>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>Several panels support attachment either using 4 DSI lanes or just 2. In
>some cases, this requires a different panel mode to fulfill clock
>requirements. Extend the driver to handle such cases by letting the
>panel description to omit lanes specification and parsing number of
>lanes from the DT.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>

