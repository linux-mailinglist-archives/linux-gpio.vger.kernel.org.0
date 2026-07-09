Return-Path: <linux-gpio+bounces-39777-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AasJInT5T2p/rQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39777-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 21:41:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A77351B8
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 21:41:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bTzpywx5;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39777-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39777-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B249A3040013
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 19:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0DE3BA241;
	Thu,  9 Jul 2026 19:39:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5730C3BB128
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 19:39:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625980; cv=none; b=AZ04vsHauvyjnMCEdmaIvStfOc2xeOLEMIjr04JkPISfCsKbkb2aQZbF6rvruX4oHmAg1zyVPNshdusBr0iF3a+9q6CPJ+1Nz8/CwKqcjs9D3uEoyDzDfcZrgiTgjoJ7s7lpk1ZtcN3yqGEN2rRw/sVgtKhxIOPUJHXtMfHXVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625980; c=relaxed/simple;
	bh=ZvxvIgwHzE9yj6ySmWBg3bX/llGDIIzETW1roOBCEE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0GCbSgC+STe7Gnmt2McX+BmgHJqQA+782kHTR4KItVxhONBswO1VgZlIHN0SRQ9PYRNQEfKYtvjGriWU3IC7eU38+e7lB5/l2CGhIdkioZlAc5ZStTTufkbJT0KTv1e42NTKnGtYAn/DhcIyXJFXKlDPs5YXQK0M3m/UHf4VS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTzpywx5; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc827a68fbso511325ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625979; x=1784230779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=bTzpywx5D0rfCLnpDkWMU8e/sGifebZv9lyqXx/Z568iyyDfPkkQqQoDXrZoaNfTit
         iAz/Dbxx1ymiQGro5invhVvWsytkiznDJB0tkt8q/PHZW+uKW2bvTqX3Pqi+yqF1Ag/Q
         Oce/6FSpIdmYsTaq6W8H6Mv0k53noaIkhZJQur+SXS2MbQiLmb/d0vqqGrQxOCzJZbcx
         hEF2EV/whTd119mrJLlOjHokg0fU+i3VMXLY3kbybDgcfwu35jCeqkrzvR+WyVGAr/Vj
         T7gkIt02d+n9z0yFAT7qw/rgvhoR9DK3y8zf/qZcAgCahj3+piPIUPVinTQ6/obJ6gmc
         XSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625979; x=1784230779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=Fm5wJh9nbE/jSPqrY1Yomvwj8pA5a0awmhlxpDz9OottRSKJM0Yp+3Me+XSf9WUV+9
         CKrIzRsISt+8hWqJh5jUyabZwDmf5vNeRZH74SzVOKYUrkRk8OAGchPVvGqgx+OsSDw5
         GilSCN7ySXnTAuQ1y0vor0jX+WA+OFcQ7JSpZcnVZwpy1PL8QxpYb1jZUuCEb9wWguzu
         UfE4/mPrGnUfPp9k7LOsxU217fgnosduBUFCXSOetAePgrmNsyGnQPQ09g4ZqE7ZneIz
         R/knTsQ31DyOJ/IbfhFqUHq6392tfbXjFDrZj1pMnojJFCyfzIbzjRmDxcPqqddX/kE1
         KYrA==
X-Forwarded-Encrypted: i=1; AHgh+RoN3bxOpskfke344w0x6VU7zsctzjkelhlJfBv9obDiRDifKI9qDwD1omsFOh5kK/Bzss3mapcVUd1n@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCjCDmGCLIpfSdYkeI/lAyTCWvIA+7J192w1cG6E0KBDdoVN7
	S3QQhmGsnFh3z8KJe4fIjiHGouQbPKc/TRbbqe4hcMOCW8UKzflSiMl3
X-Gm-Gg: AfdE7ckj7evU/VrMnswfDwx3JNlesby0fXHYGj98xWLgTshsxg0O/tGxbuscNVO8t33
	bPZGEsAOL67RjfxO5Fev9tnDJscRfcBzoamhtc+g5R32os/yC8UHL834lPO3rjNMGUe+0vSLA4/
	yBE1sHnaT6NpeygpnSjeH5yEDU02tixBtWFbtVyR1ZNohZ847pQK/9zCCHcV8g2RTuBxTH80yEW
	EEx7rm9OBrsh4LxaMScdooagpHJ3rM9BZNBK/dbPd3JGsapFn10If1w26CdmJt1eluuhizxCt4A
	Bd7xPnOXXM5zTxTrVtusJR2pzRDYeDjf5Ti9cTKAk0W0f0STzf2kGA1OpleO01MRP9/29UfaOfh
	XxRZ4O7plmUSTz7Eo18LEf5bkmdBAcCe6WJ0rtyoamoAYtJMk106KcYiXgoOA7w3mHAis4QCV/I
	uWDRkQ4Gb4r7G5hDubeh5t4q43b88sy8wzPUVuXe3AnYQdrTKw4oIn5XrJyIgcMIST5A==
X-Received: by 2002:a17:903:90b:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2ccff09e0fbmr44702215ad.4.1783625978569;
        Thu, 09 Jul 2026 12:39:38 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm49018755ad.79.2026.07.09.12.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:39:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
Date: Fri, 10 Jul 2026 03:39:27 +0800
Message-ID: <20260709193927.108105-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39777-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORGED_SENDER(0.00)[chenyou910331@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:frank-w@public-files.de,m:chenyou910331@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,public-files.de,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyou910331@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F4A77351B8

Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
follow the GPIO hog naming convention, but the mt7622 pinctrl binding
only allows child nodes matching '-pins(-[a-z]+)?$', causing a
dtbs_check warning:

  mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl):
  'asm-sel-hog' does not match any of the regexes:
  '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'

Allow gpio-hog nodes in the pinctrl node, following the same pattern
as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
gpio-hogs").

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 6b925c5099cc..021307b6d801 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -65,6 +65,11 @@ then:
     - "#interrupt-cells"
 
 patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
   '-pins(-[a-z]+)?$':
     type: object
     additionalProperties: false
-- 
2.43.0


