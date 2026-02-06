Return-Path: <linux-gpio+bounces-31494-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uABiK1IvhmkTKQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31494-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 19:13:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E795C101A96
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 19:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B05530177BD
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 18:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46581426D38;
	Fri,  6 Feb 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRgILeZ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE9426D23
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770401614; cv=none; b=s0ljiEi0idfPrWaCgdOr58jvXlAcV8SIgmJ0lG7vvOtmYn2M3KOl0XwBck3zhFClZt17evV9OPqFfpww/98r3awgSK1j+C5JTgV0Nz/DjfyYAzMzRFR6rbcx3cZo+dqpkPZFjlheBJpNJS3kDui9ulTs45iDYFTTA604dDnqy/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770401614; c=relaxed/simple;
	bh=UYu4Fvb+YtLXhHsBKaqW4cOwJLTy8x2k50HiXo0S9+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZXvYHbDYzqRceyld7G91QjnvZt4BsOJGEyCTl4WPRB72y0v4DV1OdlwQE7lRX8zenXzjInomCEUTzeIc6mSv9hlaVdUF6P4QKDKGiCYlPRUkAGXvMIxTxZZm5zufZBQ0tHsqvJ8LAAabQr8oCHKijH7Qx2l6WzqOKlPtL13Nqqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRgILeZ6; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3625213eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 10:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401613; x=1771006413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NTx5jVt3nnO6451xdzF23y8UlccdoPc3a8t65hXHOs=;
        b=cRgILeZ6DzhzFqVahFns7TdxdTtS8EInWUg+FePjiOGFs2K6fiS+d8lQ05SuCdkuC6
         uefZV9ecwrmK0WzFe690O//e9aTVpARKWkwLao82gb/NKqkuOKULK6LGz9G8KnSrmVpD
         fjut9A3qbwIwR0s7BYsyocxeGV7BS6BAUYlMm9rnlm887UEpHVzQO5ppKxk83ujnmZFv
         UiUTlO/IC/5Qzcq/IwZ4v848u+vwrUSW6tpGnGU9ZX3yPm18rlM0WQgi34aoasSvsOgK
         32q/nXWzlMiYAcj4m6caZ2i/Srv/k2T0iO+j0ysKw9k0a6PrQSWzd+DRac/MkjE/fyGJ
         a5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401613; x=1771006413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NTx5jVt3nnO6451xdzF23y8UlccdoPc3a8t65hXHOs=;
        b=g/CM4kelHNmJCtsQ6PAYfGEtF2hmFjXIE/1qdj2+S5/1XuEmsE+RZ6CTAugbhlaIU0
         BWGQmlsCCMcgiQlUUfesRT0QSzWnq1FE9a/3w/SOAkWJ6Reoak4KcpxeSLimeo4fATFD
         h/1y4gvK7poRYrDJe8FyMNQ/qIkPl3Ijv+OiUdYm+SZab1vbdZffma0ZBPbMQTWJMdG6
         45XKRgJUvaBfI8tlgBUvNiEy3HCI4j6dmth2/clwE5DWYhDR5PPmQVOqabOsoOiey4MF
         Kd9J7/VlYn8Eb1gHDn3Fczb6JELmB+pAY7rZuFl/Bv2dCb8Z/gEeVGhwYsiDgZPIBa7Y
         s2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXo8LjEoVjcILCP1NiMv4j9ydsv4KPOHLjB4hzRrnxJvxIz5hzekPbmwzNa1Bd8KmCVuuCf25xA8KIH@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZ/YW1/mXe0DOkVdK6pqXUnuQ2LuA50tVFnJBprETitFZX1cc
	smgVErQbRm8xmzN3OkLMTS+xj4Zn61XLhhauozukUhrhM1W3tHbizUIo
X-Gm-Gg: AZuq6aJ6sG8+VP90V/gpKG7u7/HZDih06bwlUzHaX9GkQb4nRKt6Krgs4CzKC8c4pDI
	ASLUybbBfUhKD4rmN/i3VtDsJGWNlbXvdmMsUSc8YZmT19EOm77s9ktocoB09OcgskrENDvA4tC
	DzXx1Kg8mdB3ZjmxbrNR1fqdfQJiXdzlbuKmwzJEgf4iLZv4iH+OgFA09NsrzuCMXBsMczyyK5x
	Df9Dkr4SUz3NFDYhG2b94NF/aVxSd2pDigyPUOmakBP8kwuMEz7tlqZ0HiAMjghyneFRvoHQmlj
	8qkOu6FY/GSSiIpLnQKRgeT10ZjP3KKs8xVqlEI5JIjB69ZkLojnGYtWMHr23NX2iB5oF3cW6aC
	HQuq4wkL3MEYrzETseBCke3Av2iC+4At5DjjCPbmFVHFNclHTlJpfpxST+8I3pm0+aAllZRzzt5
	3iqbQ5OCVdehDpPDAvj853AJd+
X-Received: by 2002:a05:7300:f602:b0:2b8:209d:596c with SMTP id 5a478bee46e88-2b85683104amr1413189eec.29.1770401613072;
        Fri, 06 Feb 2026 10:13:33 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:32 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH 04/11] dt-bindings: pinctrl: Add RV1103B pinctrl support
Date: Fri,  6 Feb 2026 15:13:02 -0300
Message-Id: <20260206181309.2696095-5-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31494-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nabladev.com:email]
X-Rspamd-Queue-Id: E795C101A96
X-Rspamd-Action: no action

From: Fabio Estevam <festevam@nabladev.com>

Document the compatible string for the RV1103B SoC.

Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 76e607281716..9b3cbeb54fed 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -50,6 +50,7 @@ properties:
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
+      - rockchip,rv1103b-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.34.1


