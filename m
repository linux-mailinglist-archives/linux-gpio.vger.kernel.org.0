Return-Path: <linux-gpio+bounces-33823-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO3NOcsFvGmurAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33823-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:18:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 722802CC9A9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A9633077CF2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFFA315D40;
	Thu, 19 Mar 2026 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW2j87qq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40072357A3F
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929721; cv=none; b=LgpzNn6uB1DRqrIFZz5O9YjnpQNwdY7DaAMDEpe+CiEwaHSuuv347LHwlM9o21COFNCYcWoEGiRpBxhQMChAxDj6uAtfuTfVqesjY9/D++KCGqGygy1bD7FosTakmP8+4cme5grn3fARgKwL01rcDb6CP5Mq7TgqHflTkGBJgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929721; c=relaxed/simple;
	bh=8kS+1y8NLmoU6Dtxma21Rgv8v/62TbkWuij5XLIyCSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eo3W+iU3YZA9cv2KQ/q/embDb7NscM+iO5TE2eHgnmoOmyouvZF7oyuAHi3CqJ4vyTgfoc3EumQVegfhembz8KwgBsfPAJGtAWOhRBxLCxAZyncfNDQCHeJVG7WSKv9RgZN10BuDClNTSyNTtnIH3VzUlzOxoDCcDXYMaOg7psg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW2j87qq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so13202985e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929718; x=1774534518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw9fgwKjqMmJpNhhmasAcm5Av9X74nVirvYp0L8odpA=;
        b=GW2j87qqiblxD5JA5n7hZZ2sMRgQbAsiRzImidp0Rtn/pCUZ7hG1LAekWXq4YTtpxt
         kWSa8NIaTqfOMefzUYcyGBWhL+aHdw2boTq5YlN1ntQf555av99NDetmlT7dY2dFf3+6
         l9xQrJiRbbatzi/Hs/0tvBS7gGiTbhhmtKWgpHgc2L5A3pFILXGTL4BwGbsEFnPPJWS+
         Ce8bStuSzxGiQtGeOCeiEa0RVVjISVrfmKnA+R7aWLe7dKvKkhcZi56tEeNeKqf32BCz
         VvYOZ97Q+BT5HiN7FYcjPJkgzda1R4k3KD6h4yjAxu9be/CnxF05qyF8MCOrMoPsp8Hv
         /gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929718; x=1774534518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw9fgwKjqMmJpNhhmasAcm5Av9X74nVirvYp0L8odpA=;
        b=kMWwyTXlMZG1vOwJ2m7nusnHbujm5krN5+IE1N2OOY0G6USgV3L3jeQLtXQ/WpSEFb
         zJEqXCBNTJsK823yTMsJNWfo1io/YrK9s9IWFF94Ma6thWje3TMCd9FDBnQ7raSRy9Gu
         6v4T11j68LsrYfdZvdBxthfxTDxMx9Uo6sx9PUhfDcQoOXqJisQS0ardbPvrrt3h7r++
         XAR2dB5Y5S11G6OSZPaezw9PA/PFrzycoyz7UJXuWz6PZmr3TVYD0aU0W0dPlb7vpPQL
         VZZjsIxeB12tGulpJX7svH0NnjQ+KBt0GReU/t511L21Onyp4gwiyZ6eqnb3dlrtzTGi
         iGEw==
X-Forwarded-Encrypted: i=1; AJvYcCVyngaakWhZ79oxW19rnX1LfPYeLAa4eJeyvAXy+FlQHglljovS//ZYiqzHexkqumkrL2wMAL70VSkH@vger.kernel.org
X-Gm-Message-State: AOJu0YwR0mo+aD/Wr0rgOLEj8hfsaV9R08Kvl2C9AVM0mtFe+97Lh+r+
	npD1CYfEsAl/n+7lmORn3jnE9mXMJojiyI/8YmRj4Ul/65PakFlDwD5g
X-Gm-Gg: ATEYQzwXjn8mdi80qRG2imw+9v4ICTWsOtjIo60wSfeGTBH7Puq3uPtIiw6ajf/CD57
	VyYK1zqEleXMB6BhrBI/fQtLyCn3ExyWmto3YSrOLUWDXrhdXI5hwwXmBDcv00eqa2qVA1DHL2K
	YYYtbRzgY9ntfIMbEY9bsimL6pUreV6TwBV0nR3OA8kIQAoERTnIi3TwWYARecEq6kEt+bFpMlS
	DCOmmymM2q2IGn7+a502pypa9u9pq9RCwFCb7m1NUNSDLJle5vPVXYImRyeXTI+smFjULxegipf
	m5gtX/sroHuS8WtMEl6pe8OMZiUFfK3JkT+unimkyX7BamblIfxADy6XcumQGsxYsWtce5/JcBf
	O+9eix+yx/toiPcvIGI35r6kJk1cjyL1mCwAl4aDbgnzB//tlWjjRnV9nYwL9itAuNQ7jkRB16O
	2WuqX0zO5JXQjEzR/DwpPf+NXRzjcsDSeJmlfGHBmrRtHS4Tk2A+QtaRU+x1TgamrVB8Qyy/DaB
	2BWkFrmAemKrCSLQVsGKBQi/QIwLoWEg+dSSr0w/vKytMw=
X-Received: by 2002:a05:600c:a4f:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-486f4476ccbmr129027975e9.25.1773929718223;
        Thu, 19 Mar 2026 07:15:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:f7c0:c444:6359:4c21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm17824618f8f.5.2026.03.19.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:15:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add support for configuring pin properties on RZ/T2H-N2H SoCs
Date: Thu, 19 Mar 2026 14:15:13 +0000
Message-ID: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33823-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.929];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 722802CC9A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for configuring pin properties on the
Renesas RZ/T2H-N2H SoCs. The RZ/T2H allows configuring pin properties
through the DRCTLm (I/O Buffer Function Switching) registers, including:
- Drive strength (low/middle/high/ultra high)
- Pull-up/pull-down/no-bias configuration (3 options: no pull, pull-up,
  pull-down)
- Schmitt trigger control (enable/disable)
- Slew rate control (2 options: slow/fast)

Note,
- These patches apply on top of next-20260318
- There is a dtbs_check failure reported on my machine which is due to
  a known issue in DT-schema (which was discussed on IRC with Rob),
  arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000
  (renesas,r9a09g077-pinctrl): xspi0-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml

v1->v2:
- Updated commit description
- Switched to using the standard drive-strength-microamp property
  name instead of a custom one
- Added a description for slew-rate property
- Dropped 32 bit reg access for DRCTLm registers
- Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
  helper function
- Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
  switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration
    properties
  pinctrl: renesas: rzt2h: Add pin configuration support

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml    |  17 ++
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 259 ++++++++++++++++++
 2 files changed, 276 insertions(+)

-- 
2.53.0


