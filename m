Return-Path: <linux-gpio+bounces-40081-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OhKRNqSNVmr98wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40081-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:27:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C97583BF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b="Y/fDTTRC";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40081-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40081-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB090316B410
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 19:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CE541DDF7;
	Tue, 14 Jul 2026 19:26:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C3446837
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 19:25:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057162; cv=none; b=Wx6Gd6i7eXX+o7m3ZFX9vk1f1VQI0FT+Vow9Qf2I8g6G+lYC2BeqU6wUC7ccoTn/7aUbVucBSj60+M/hGviwiDG0IEAPdM9i3bHDEzO6YJqdgo2ewhSG0nPh2ab6eOgteskWLna2RDVcPWiRYT7vPIBzW5+R1O9LP/MI9rKIJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057162; c=relaxed/simple;
	bh=J0YKlFtNy4CDBcxTAckyx8hsiYKO7Szf3eJ9mSEdqPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhPqbsG4Zw1Wlh4ia8sGtiFn1Fyt/h1jFTsB1HJDBqscOP8oSSw5jcxHEMXLHuhwqEEdRNrMyN9N7zajBaj6jxLxefRudotreHCuqrprNIlNOuN+nq3u5Z0wPfizo1IMt0pctumPwTcDOkGW5Xvy6Z1lW25Gs1lVMw6xhCzOqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y/fDTTRC; arc=none smtp.client-ip=209.85.210.51
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9dc546f40so841880a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057156; x=1784661956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qhLkMDf0+YlirUGcXz6TF2rj0izbPoAZeNkitt1I2g=;
        b=Y/fDTTRCMva/eF737gVO/UTnAjn0atvvXDpMLwMkz08IaRNfV4AcchSgOsrVGVgXp8
         aCmjMl4ENs79AmT4ODlNox/MPUfzE4CgLS+DlxK7oZCREqrNkoRP/F8+Gu4ngKu6Rmh+
         HLtS4w7rdtIO+i/+OLqkafIAs7aAqKPmg0RJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057156; x=1784661956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qhLkMDf0+YlirUGcXz6TF2rj0izbPoAZeNkitt1I2g=;
        b=pQGDaz57H2kJCxpmz8vMpe1U2DKA9Bbi49Hfp1iKGvvI7/wfdrsLlf11DSZqFWlPT+
         //424W0gYcaN8zm/DRU1BivZaIYyCFh1l9KOYZ47Fpedypl/3toej/lu05s+TsX2HI6C
         yxqtAqU4jIWkZ0Duh+scFOrupQvHgqFmDPpbijYDq/Tf8wzfGdBirQtHQ38U2a5zg99h
         FhAHu105y4fhXXoFHCw3c2emqmy7xwAmf0Ca2566omljFTRX1tMWDKzhYmcNMVZgdkPh
         yDLguCv094XZKckcwQX5u4PcYgTC5CTo85GuqtLcRAO596dHfNiOR2gnH8GAs3OqrINW
         QHgw==
X-Forwarded-Encrypted: i=1; AFNElJ+Hpu4IgWsS+Yi01YJgBeNlRNqrp9bd/Vvy9Jz9wZw7XEnDqnaeZsJ93KxEDnc9G5xdjJfooan2//+E@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNip0DfCguWyAVCdsguDJqOaRHoPJ2/AqGV6f2mNom87vTH+A
	mjH9xlnbScesQEgI6QbZxR2hIyva2qKlOjS8Q6KhXciIWA09KjRf4/1MzwyQQZghTg==
X-Gm-Gg: AfdE7cmJD4v9go9Vt9ZNYft0/E9ogKoJ4SbpbUFBkasDeOjmANhk6ew/jMSpaTBY2UC
	3LFcrZ62Dzkm6UytDTJwwgd8SIrNZz/QyhyTz6flBYPLdEPq6EHfIt/nofQ1NlMrZ9+tNdwYq0F
	Dhu09ceeaas78wd1L1XIcfsN8ccle04OVjlfj6C9phSTMMptroq455GgcEtHNoyaR2113EL87ug
	IyycwqiG+XqRH2OTIh7FInfmo3r9hkZaM9GEdjjyyteZz30il9k/0j3RCHosMFOZ6Efm6osHUVd
	4EHqyk+2Idr+ydo7WtAYSyWw68dFCxftn2jCBcchv2WHUUObSat61pAIlNUuTjx3PtV156M7BaN
	O9OZpyT/1LvEM4F+LCfpT1BEXGpHlzcOcR9vqueJq8os9vQXuReLaadVvslp8AvQFcMcRcrR0nH
	1S6REfb0qaHDiqgfsX1w==
X-Received: by 2002:a05:6820:1b0e:b0:6a1:7af8:a048 with SMTP id 006d021491bc7-6a38b9f1f93mr9540469eaf.33.1784057156624;
        Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:25:30 -0600
Message-ID: <20260714132531.v2.2.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-40081-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:heiko@sntech.de,m:robh@kernel.org,m:jonas@kwiboo.se,m:conor+dt@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:sjg@chromium.org,m:jeffy.chen@rock-chips.com,m:hl@rock-chips.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:from_mime,chromium.org:email,chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,changeid:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 423C97583BF

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0


