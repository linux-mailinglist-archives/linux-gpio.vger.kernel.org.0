Return-Path: <linux-gpio+bounces-37766-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PpDBIGlHWoqcwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37766-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 17:30:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79783621BBF
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 17:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79784301485E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 15:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09F13DC852;
	Mon,  1 Jun 2026 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZe1LB15"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3773DB31A
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327656; cv=none; b=tjX1f9EK7NGjUFBzvsNGjYwK2CrUfsTYhr0OfMDC+WezduHv9ngb1QsFgbwItOGC0av72AQN3lkWRtcIbM9THOAHzLimdBh+X/XDNI1bc9WXuzdKlEXegNfCH0WoA7i212F3Y+pJTR/Ahhc/5tdQEMnn443s+C1L2Nfn/kvXrWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327656; c=relaxed/simple;
	bh=RO9rUwD+0ipkd0JqnII+Jf2Yj+dHGhtTa3lOoj8yHvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5qKjswW209zfBbOMoalCBIUZ3MMiTa7eE4Py6aKa9mTZwmPYm6IR71XeUjbBCprOA510R0TaVpk31WUWPxC2VGQG4SyIFzO9GCn3OvItOGPXFVUOKldsJKtRE1lZ4VIiTYJDBpNfOGURPZwCB0pFwoyDJ1/7LtAR5AjEMUW11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZe1LB15; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490a765e68eso12909445e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327646; x=1780932446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=lZe1LB15zDOyCrIl9zZ8OJzr2ou9/4ics2Fh96N14JEMWYJGea+tBNlKtLBR/CeiiV
         cBS3WHb5pMAzOz3ilFAzD0wFb1fSJnftNeUETRzKGmx805azvedYGmLCc/TZnDIdIizs
         SArOIzl0HBVqdPunrOJkF96PkZhZZ7rjfaL3TCLlz2cTfRu8Zzq4OCF2CMddqw8q79Jb
         ZcwOvI4r4Qw2pRt8C203Hza/dhl5OljOTcdQLenKpPacoMbI75Na8elrDb6eJCTd5G94
         VqVWpHZWxRPqIW/NbmL/kUYg2FeH5ZU8jB7Qho0gogKYATazwAaX4j/6+KzH8/3kcwbD
         GoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327646; x=1780932446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=em7RswWGsRIIJWSXJb05VEGqt/CWQH4Z7LqnaX9KR5ZhH+A/Y123jr88xWa+nGYNw7
         3NpY2mbpc9ad3Pbr/0zwP+HFEG8LaK55ToXmfymS0ac37KZUiVH/0/mL0wYv3dVxLGTj
         WjEtC/RBjahVx7gNo7DNsiuKvTqkJhyuefg6u2KNfQ2oKsWtxWIC0iUFFrXWjTyO4lB2
         xxYOfjt51fT9t179TuUjDoR8EzwnCbOSECojyghN2W3S7oazILGKbL4VhYkPLLILn/uQ
         wEzfTkTrbb48IsmARgangC5DZ8LTZEzFm1pGhgdpJs8ZC3+RwCvfAPUJfTTzlgga9CcQ
         5fWw==
X-Forwarded-Encrypted: i=1; AFNElJ9iQ7070RmtXjPP6AoPBrUkA5cSlbvIB9vXdi4jnn2bN8IJVrA8MLwLzY8algG8jsJQifsQOWK4jCYH@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4K4wb9N/J3mrDFbnhhRgaphUR8IsIdMOuQ4aZkKQyzHMP6qi
	xC6oAfVPWCbz7uotlol5ZhwaJfXALLz38P7MoYkYjwT3Qt1X994uR7v/
X-Gm-Gg: Acq92OEd91Pb2UuuUtZdP4nTFe+htDGzCx1TS5A3sueJABKM03i8gXjX/F6dooaY8vM
	xtY7jAcncGbwoyILF58LhbjX2DlHmly0WFex2lUQHWDmNQ6vLFVSqh9gl85FX6mLjsocY4kKq4s
	UFC+v7kZExdT1S/C27Pjj2BzCywhh3499okdC6EtuFW/wdvEZBNY7nyJhhNr88n1eSrS+nU8TO3
	fS6DCVsUsGKMlqVRwoMkSF7fo9eDxFjG7b2S//iETamonH1yfX9Gv1TED0CUAEFbiZQMA8ZDfhR
	UWAFVd+PQGwH8FXEg48swnAI+W8GaNEXX+TTJ44Ls4qBB4UTwC/B6M7wDNUvM6DAweFn6/GvMOs
	FUWfDyMEO7WdeoCZNJ1fgw9XsQnGUsyZoHvjMsllSCspkn3LNlq6aAJGlVVw3aZvKhYvTnMyEGs
	+V44q0DCuZq/ALrhYlhZn6ZgvrLgo=
X-Received: by 2002:a05:600c:c285:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490a2966ce7mr127746435e9.24.1780327646037;
        Mon, 01 Jun 2026 08:27:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ad63b34dsm14041635e9.27.2026.06.01.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:27:25 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the slew-rate property
Date: Mon,  1 Jun 2026 17:26:42 +0200
Message-ID: <20260601152707.29039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37766-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 79783621BBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver for MT6795 pinctrl already supports the slew-rate property.
Add its description to the documentation.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 68e91c05f122..9a937f414cc9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -152,6 +152,14 @@ patternProperties:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1, 2, 3]
 
+          slew-rate:
+            description: |
+              Set the slew rate. Valid arguments are described as below:
+              0: Normal slew rate
+              1: Slower slew
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+
         required:
           - pinmux
 
-- 
2.43.0


