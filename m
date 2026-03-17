Return-Path: <linux-gpio+bounces-33667-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI1dJcShuWn9LQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33667-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:47:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A42B1217
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A28430FDDAC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 18:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591283F787D;
	Tue, 17 Mar 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zq/XaBfW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEC33F36B
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773152; cv=none; b=Ef2H5ueyeABIIOD16iiXewJBFv47dlfZMd9UDKbdubNwKTJiuHa3EKWyZDhLfonjaHQgzv36QlF4XnE8sXk8j/8HAjV3wiHa6hVWbDmFjX7ixoXq2A2ZK5oTDbPm6wiuspX3tawKJx3bHOcNUiqV7Yl09G10vUuxflXgtX1V1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773152; c=relaxed/simple;
	bh=q8iNQRclNimcvTVMz/xp0ANElWweIprPYt8rET1d6u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GeVqwVrN1n0Q3zQMVBaizXj8HdqCXuk3EYh3QtIfKmSDRg9L1ru2R4LIq1JlKFXHNmbyUkorXEcyJY0BFqWs3wOXNuQ9R6/zJhAeOdURIouLdhv/BSWHGYJ++4s+ur9Lu+3G0CCb6QZ7ZrZQ47bcgTj6v8IUF+8ZM0+10Kxqv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zq/XaBfW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso55163665e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773149; x=1774377949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=Zq/XaBfWQVvF5NbK0pKEYbQgj18PCCJvmQZjlZi4bsBXlf8GfR9mowFsgZWsMOgkp+
         Zav70swWAdTCzizZWJaS472IaKZ3nynQi/pCAO8sWT+qjE5gybdm2WF7KCIkdRRyWWX4
         dRIXOgN5EisbsCtUu9zRj5oU+MfkEDo5hqNbhDzENmLq67ow8DOyUVdL36qNUQJmOwFs
         rtqdEu8PWQUYpzVkrUjl4/0+qd2/Ijnjuz9Yio1F9d9oZosnGtMBTz7P21Y5isLVnq99
         9a3Un61QzYs6/3snZ0MVLTvRfB5NL7GOyG6h2QnQrLvLotYzBqHntbbpdf0bwqYMnQgW
         I1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773149; x=1774377949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=h/L56eVH7ui0tdFlpdwwz5AvcAOC+dY5J8yAowt5A+Da1Kvvc0oikZwEpguXtbmLw6
         f5xsXqV0ZKqdEbM9edVcyN4HHgTq8qQHRJF3gzIqvxBdy5+fto0SyZyVUHtoBEH9Mo5O
         3hwTSCzLeRaNYWnWIh+7YVda97h8qMThrjzG8hfQ7zwmfn264UVhHQPGu1Bif1Fxpoms
         eejFtxWkgMSYWd81nt39n58d/jNsbKTqvqZIJIZ5tqW6hAe+0/6Xn+MPUsl4SuZ0z9/H
         CU5o7gJaNaKFbK/jjoKaEguA9dyYo1x+H+f8IsdBo3P0PPWxnkBMgtlodFRMKzoQC49Q
         1EqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO+I+X2R9ClD8djyoU5gP+8O1C3HhhMOJV6DyqMgLiNNk1TMbnNL2ehSzYr63NCUrVz4hBIlsBCAS8@vger.kernel.org
X-Gm-Message-State: AOJu0YwS35sxJqxZA3SiurDk+zc3nNO2cjF6mHUs1ETATaZ/LFsTIHbR
	uU9nuhVw+UK2ES/W1TzDpoPSCr9gWLy9HDdohGvJDOm+V0kBh11LlxmW
X-Gm-Gg: ATEYQzySrx1OlxeelBkC+NeGm0lfOYDJgOUzzdIcVkpFqlJM7d+Bah+pygh68Oo4t4E
	Y3kI6jH5vnpN7qWO3mg23IqaqzSlrh8W+bE8Qp0As0G2OroERE/vLlMpyNr9+YCqo3TCwNn6kIu
	EB4WlHkXfmg+181fmZBP7Zh/vIpsRp2fDkDcSLw/nvRbLuuSDqTlzVitzkUzeKKT/6jGOFBzFLA
	1I3VWTvkLqGXiEX3srGehIXBOvhHvYl0B2CBEJ/BypaSvhYsCuMzvy7k5glfQSmGhEW9me5vcy5
	TBn76DL9co0QjmdG7Hcx/46iElUzDze7eXq3J3+/CoEEivMwdnGOvU/j575O+HLqWs2NzI20o0L
	HoWDvzo6Ja7wV0ikMQ37sHKdytG0LmsEyJhrHbUcdN+kCYBaTFtovtigDO6lAtJmUtjJnMSrcTc
	D+7zNxqbNZcD+aOqPNqZ1+e/gyspYXjg==
X-Received: by 2002:a05:600c:1f93:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-486f4463591mr10143505e9.26.1773773148893;
        Tue, 17 Mar 2026 11:45:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/9] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date: Tue, 17 Mar 2026 18:43:05 +0000
Message-ID: <20260317184507.523060-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33667-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: F07A42B1217
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
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


