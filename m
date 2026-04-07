Return-Path: <linux-gpio+bounces-34803-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DTAI3n+1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34803-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:54:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE83AEB2C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C155D3032043
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1ED3B530F;
	Tue,  7 Apr 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="Y/mxi5YA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9323B2FE1
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566324; cv=none; b=Q1HYt5qL+2q3ha4QTI8SH7Qm3/5uc2NpqXqtwwzoIBohyfSStt8THeiYr0e/u2UaWdNBpLEW9ugJrk/p7KAP8vTmKAYrxsMCwoJiCimnWyY8Mqszs1rw0yUQfmyGA9Bvv3aYS1fyAMBtjW4bUGp54YIuvABLx4nYUHSREbmHth0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566324; c=relaxed/simple;
	bh=MLG70cZPHbMVCayA98g50Pt9/HRyo+CUlZFeaApT25E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSdpWXXITTFcIGIHUOd70Azv/Vyf/siTnKlRos+Ju3ER/pWHWSnoQfphlgyZeEEQiBZqsaK5LBROTgTEnLDe9cOwBhqmr3EwFvmo6TnJ5kZeJTwjribHCCUQ1ZsvpRqIvTUVKxDQdTiUqMhfxM6g1TvXdfHYYwzKoGEnnvJU3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=Y/mxi5YA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488c2690057so2701055e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1775566322; x=1776171122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLG70cZPHbMVCayA98g50Pt9/HRyo+CUlZFeaApT25E=;
        b=Y/mxi5YA/BCplCMMWTMw5nOiv2fJ0VCWQW1kQ6Rx4qBJJw6W6j3bnHMy00Z6hQ5xQI
         GQ80bB26YuECqLSUbvDGSWp/ULU0EMSDX8W+U/0/NVPt6a9NlMLgX89vOixBwzk7duUd
         Du33ONIeNXVNXpEmm+um0/+mK+VOjmWgmAXBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566322; x=1776171122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLG70cZPHbMVCayA98g50Pt9/HRyo+CUlZFeaApT25E=;
        b=BHosoNYZHODOlu2rxvOqmWv8DwXq348TISBXi7n768DgaVPVRlUdkJBuXF+dxWjU5A
         zwqKQgGpNJltSSI3LH74I4eERuIoN8g5/21WH09dugRV7lqo36J11+8qmIBGLVN4oPKc
         UOGZDe3isTKsx5zAoSlQRG0jijBZqEHGOKD8BHY9lmLEtvbV80eWQzS5gu+lYRP6FxyA
         7K4FPG8AH2VCO6Lo6qvGUIcFhXg0BhAbHX/Rve1/t9LlG1YqEnt809njnD2qh9LI3B1Z
         ISJtmqtild/LzDC3UkMqFLN10tacywhzfWmi9h2/lrpsbQCdsnZrg+uEMhRFkbOY6mhm
         aIbg==
X-Forwarded-Encrypted: i=1; AJvYcCWnaZc6Y4xgkBABsoL5kEnheRaQae9sA4DCS2jx2mdJwXsD9XMfKkzwj2AR5Sqtg2on4FOZaG5ur/0W@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nuEdSIt6YYUPernEjMagb7R008Hk9+0zqs+vQU1H4MTdZxHP
	6xdx+Oaix/tcayC+19FjT2JNMyc1TTGCeqk5TJSV2958AkT0zWDmkTg2l58MAL8P4r4=
X-Gm-Gg: AeBDietfyzkBc0zlL9Br25MuZ3uV+YJhMtg+hy1lSy93iRXkVj/tx/enFjVQPHr6/XK
	waP2h0nxxRgL839JBZeO3KSnhvB0u+CN/at1Zxe3VxgXVKBPiVJhgb7rEh9XJN/eUJCCXvDSBja
	drUNcKT+1PD/o9RzUlWsz6FSahhCLauipfIKm9rPFgglauhOflw4j4bINxhpdfKLjk2CckdBYr7
	FqlxM9L+As8BG8ji5LddmCCHygR7S5y1Yj98DvOLktwu3uFXNYzh4fNlVINVkmea78vegN145mm
	H4H5GxD6r1kj6Nm5/KIhCxcSpNWdIR11z5nuoegtHmleVnLJ9M72jfTUl8VMvyWY256j/tA8WNm
	KZzC00ziKnAiv/zLfd1EAH8xjvf0EMvYnKVGjvePQrbm1frczBbz0LN1y3qV6K8XObLJiIXWdaM
	9fmU57JYVBk+8wCw84K09n+JhJ6TVKpkuxm9/3fR6GsoNVLioBdEoab8rS
X-Received: by 2002:a05:600c:3b18:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-4889970dccdmr220831905e9.11.1775566321939;
        Tue, 07 Apr 2026 05:52:01 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48893f39027sm365288315e9.2.2026.04.07.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:52:01 -0700 (PDT)
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
Subject: Re: [PATCH 13/19] drm/panel: jadard-jd9365da-h3: set prepare_prev_first
Date: Tue,  7 Apr 2026 14:51:59 +0200
Message-ID: <20260407125159.282144-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-34803-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:dkim,arduino.cc:email,arduino.cc:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 1ADE83AEB2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 10:26:32 +0300 Dmitry Baryshkov wrote:
>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>Sending DSI commands from the prepare() callback requires DSI link to be
>up at that point. For DSI hosts is guaranteed only if the panel driver
>sets the .prepare_prev_first flag. Set it to let these panels work with
>the DSI hosts which don't power on the link in their .mode_set callback.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>

