Return-Path: <linux-gpio+bounces-34393-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBYNMD45ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34393-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:50:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C9D3577E3
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1F833091FE3
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD74C3AD53F;
	Mon, 30 Mar 2026 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIaSqxg4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5D2AE78
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859712; cv=none; b=EvlE4vwwQz4bVBBGTSEftAam6qb7k9VtAznzqdeuSkR1mWaATz0gew3WNMZY6hNp33jF1dTHYF2TGLoKt18rklnV7eUAOslZpCxYfzH7tvxFVSUlnZDfF6/EELxgHu8Fguv4D0uUOxAsypL+vuZx9WFGTVzg9rcIOxyFzMqG+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859712; c=relaxed/simple;
	bh=8avPzjkVf9V7xqsFuREDbJnx4rKI5nF9UCQknqLhMxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/plqZ0FThYPXOdNbfsJC83rWrqE+Gz57l43R17l1V+K0ofR0G4wJ1nW1BTQKFNTbRB/kRnqLgr6tVUDRTDqfnzsErr0WCFyCzNF+C3z9REkXE1QptleH2avRumLmskhQIo2QpQBpiTBZFznPMC9lDt4bjPPfeR3BfuVJvC21Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIaSqxg4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so39987875e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859709; x=1775464509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=WIaSqxg4D1Oy6yLpeYwIm0I1o3tDCGmXsgjaNsi4JRYSIvt7J+topVNX9tx2HjYzpf
         NFVeknH+H6J2cdzolTmelBCMzy1Cgb7PUV7YdPinBVbGoLShNUfbeL8GJi0o/Hp6umf2
         NhiD42iomO0CoDv0geDBgSY4io7+VlKDal7LQMDcNkh0zhbN5U7dQRwTgGUnQYQlRp+r
         sfggePAy8NxMuqDg0Qv1BZiG13HAzsjAf+KxKufxfhWRxMGgpFeIXvXwfPrra/98kF+k
         wokUcjs2bCy/Wh6d97rAfZhXMO1lRbshZRKFHCEg0XJkFy0dgsn4uAxMsFSsoc0tgJJL
         SoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859709; x=1775464509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=qEXeI1oLNID2EpzghiXlpyzsIC8dOWqUpLxWQ47eGq9knGy6tbjiR+ewcUepG1mvHN
         U9wKyciJ9CVIFEngFvcB3ugPOHhoEbifRtP0cHpzWloTOmDCerDmRPeACjjplAiAlQZI
         kDnZsVJWeIQMLdGCQhBt9/W+ExOXq9+BmONcR0pto5GmKpps9Zcb28N2deVDc4lkDTKd
         GkFfeG2rTo3lnCzBZxOuplio70prJYV/bQ7l93YyuUFGrPwfwVd+CwG9d+Jgl6LOiJWO
         A7ahZnVppJ/KbuD+YI0OX3f++6jKvBHvKIGV47AZ90OFTLDUvnm/jL57FyliTyUTZSAk
         YxxA==
X-Forwarded-Encrypted: i=1; AJvYcCWrdrskXJVuWUM75OwbPPnTbl3WFmV+ShAIXT/EmCMlTUaiD2WsW6+Auw4xwoBcFEKXvxMp1Aj01mDv@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYvEgQitlOvkn4IkbPPmxT0rvPb1EGikHZU5SnIoUTd3sV85F
	Vr+4iTwLgoYkPG+/GHgfU5i4frap2g/oRs73BNQwzVsvJ8bajSCmtghl
X-Gm-Gg: ATEYQzz6OAS3IYZ6ZbCDnGppfMlKpxeK70Bb4wCyUguuVVA5IJCdeBI7AvUgNUBX63L
	wFgt8D1TmHP4HhLHmP9kYsOEmfs7XDgMLuHJRTFeLn1dbhqdaM0+e6HPb4gBFcRKOqjau9SXLow
	o3ieQ5B+j/Cwk3J88q/A6ODFK86GFnawXR/2MsH5lSheCz5yIzrPUXHugVuBS9athiIy0TTivG7
	RzxBxkH1TFSrpxIfCXc+yZOpiNOXm+G26u4Y8QLzrJUr9LZPAnWrj/SgxnQG5cIRbC9YA3rBlrW
	TGLsZvzEXJ3B+CdCuAglrWqW5yGKwCVKekKYdys5AKkxB3VK+AHP49aSoprUjJal136bmcPuP8k
	cn0UqfCdebtzfUu4LpbPM8BGKHbAiv2uZh1H1vNM4A3rggGNnvWf9SlYFkDAqJPTWjH9iEDzgsp
	i0c3tm5OVYC9U0qRoXsGU=
X-Received: by 2002:a05:600c:a10a:b0:486:fbc8:8dfd with SMTP id 5b1f17b1804b1-48727f80089mr170085445e9.23.1774859709303;
        Mon, 30 Mar 2026 01:35:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:08 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 30 Mar 2026 09:29:36 +0100
Message-ID: <20260330083429.359819-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34393-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,collabora.com,kernel.org,mediatek.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,collabora.com:email]
X-Rspamd-Queue-Id: 25C9D3577E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0


