Return-Path: <linux-gpio+bounces-31226-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D9IKh8Bemn31QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31226-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:29:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D5A13F2
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 265933055139
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 12:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550C534F24D;
	Wed, 28 Jan 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cXv3WHM1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12E34EEF9
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603223; cv=none; b=U0+SfcZxuLow+ZZWD/OLWaipEjE6nwo2O1PxmFlzWMjMYP+v36GvwB2/KJQW0SxTQgagZ4kFbxp73GlbQJMuzNsEdne1n7/0GuG+iDTM6miKLWZ2Ka8GhbOdfhaRkJ3oUjGPfG5oM4GXpVMDnyMBi+pk97lDFgVTnuNr8C6w3oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603223; c=relaxed/simple;
	bh=6q37WeeQdbfyWtDQufhuNOaDmHWFyJ3gZhhYFvngdNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLJ75d+hI7rbHlhIq6KOzOFgHxCoeGRhnNlgzRI1yuWJS4ENKi+KK7+MZsE1Vb8lE/kfu3QB/c2h8yJGaNoCoVsRQtPUZSEpzISO6pYb1/Vp269ThnyqdLOk23qJ6h0/nFOvEYwwXgTRENC/iyiUz4T7XIl1H3etYr/r/K+G9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cXv3WHM1; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b885e8c679bso831240666b.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603217; x=1770208017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmjzieLPBCEhG7O94WSZ0LkfVKWhnb5wTsqAsIjf3XY=;
        b=cXv3WHM1WkOoYSYyQfw2nBIxGtFfC9RPgy/J6eSg1ulwE+L5EXhyFtD/5e1NOPStrp
         /4MeuovFphaK6OCv406FC/wEE7S71XiMs3wwH6cePTH7iUppnn5cWPCIaNTuisZsbMPi
         utr5uGboLZeDxqhwyMG7ywW7zs3kBmPrYyzsm3NsGY2vRN6l/ZkWW7s0accUaOkqRc2A
         UgfKbNJkg5LMylM/HyBhytrGi2YhVOjzTukIjx12lc0bZdM6dtZM40uOvP56Ri0NpgB9
         a4oU0qJUNvy1D6yIxRYymN3eYqpG+vB+hAtD1vfMPtD26dLnKkQud9Jyf8tO2G9MgvOb
         egNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603217; x=1770208017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bmjzieLPBCEhG7O94WSZ0LkfVKWhnb5wTsqAsIjf3XY=;
        b=l6gqsqkFRDH96L4S34I9t5ElXypFGyHDKKiEbZOPmeKZ4UinlU065TA2ffGgJf01Cn
         k0q7zG7tor4DiWIZz+dTj5eaP2AgstFtt9MkTGCSzxPWn3G4xVk2XwEssRvvI6CPrgw2
         I4osEIOgbkm1LzgdLv0Rzn5VZOdDc/pfkX+cByB8LoE6/yb+8hSfuJrkQV0Hq/w6IRUd
         STFj8OSRH605rVZbZ+/2xazAjOGlxbInz/zBmVQ1Cv43FmRmXAx9p8YNleA/p7+SwNIS
         EUwB+y5LITpyISqnJ7jL1hv9cH+eY8fpB1yV1ln609+CnxqM7ZK9795z1M6QdXxJqMyU
         S9uA==
X-Forwarded-Encrypted: i=1; AJvYcCVK1Twa0MPmQlnFUQvNwrpZ+vfWRf46Uj3TOJYJi1NrmKcBHG0J2a3fqA5mN47APuZxjZFrRqXNWInq@vger.kernel.org
X-Gm-Message-State: AOJu0YxipJs1DjQr/KHpOqPEBVdnE2AWqMnDQv0TcI/Y5ZuJRl9jUsgC
	z60lEzoSG+GXlliCzm9qGlVIokzsOrhyxx5C/w9vVWXkgwu+7Mb1mMPn82f6B/ugy7U=
X-Gm-Gg: AZuq6aIMc5WI3s5TaUACk2jnWXZplJOq0U2+wOKdZ6ohhazSPIbM1HZ0xC957n8a/jo
	ouep6fwMCkihA8G/Nn9VCs4vglknggi00dSKKqsPyRvYEMxMGhA31Pd3eI+3YcVJ/dut4I7Ws2T
	kVDhF1Gw5ypM/ZqOeYe2Y/g1QlQDuH0cVwVrWpTqR54AsG9NeNinNbx7l6lv0TQasG21Mk4NpFY
	Gm0Tyh4ZwJXCs7rSxDH/P9k/pwfFOk/L43AUeE4Mxt8kKk3aMGO6p6DEHcYxgwvyvPTnr/D2IV8
	/IqV3NFrvSAaq3NYgOv31s1EvhiM5WlffCd31YP/b4UG7bQA7+5zOzniu5mPJSbMxZ4/Yr3rYSD
	le8A+5jkaWpn9g6fm41pQw6/Hl6yw+pxwIkbD7ojFeOcwP2uMWVW0hUqDJmluuc4aSQw3QmebC3
	Vze0Rrl5M2a0GZV3lyFqtjMpsDvJpuJ/DrD1GymEpn62Mf/dd8fykftVFy480z7WTsVg==
X-Received: by 2002:a17:907:9688:b0:b8a:f7fb:4f4d with SMTP id a640c23a62f3a-b8dab1a4686mr373282366b.16.1769603216835;
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:53 +0100
Subject: [PATCH 5/5] arm64: defconfig: Enable LPASS LPI pin controller for
 SM6350
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-5-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=778;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6q37WeeQdbfyWtDQufhuNOaDmHWFyJ3gZhhYFvngdNU=;
 b=O2JhrNZ4cx0yR4rIclFuPK5si3IJLYw2s5Eatlepxy7kLpFKU0/o9C0bpUkv9kgglYZW4StSQ
 pnf0PMnNfZeBCJmTjmFtj3Uh+/chxTyFPoXE08AMOzWjHIem6EMS5tE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-31226-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 3C1D5A13F2
X-Rspamd-Action: no action

Build the LPASS LPI pin controller driver for SM6350 as module, which is
required for audio functionality on boards such as the Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d383..5160b81afc6b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -694,6 +694,7 @@ CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
+CONFIG_PINCTRL_SM6350_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m

-- 
2.52.0


