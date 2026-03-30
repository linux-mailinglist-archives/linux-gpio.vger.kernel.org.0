Return-Path: <linux-gpio+bounces-34392-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IELLHcE1ymnn6QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34392-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:35:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B83573D1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22DB6300B586
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173A03AE6E1;
	Mon, 30 Mar 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+dgDGln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27530BF5C
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859701; cv=none; b=FWLw19L49HrVppX7jaJnwRkzL6SE5iN8gLs4LqgGgqMlmOtqshS9XVW7qhzsrvDAUF3n/e5ZRgZa5gligVFlBJVPW5SKwHTS2tVO3nCvhII9BG7sPAOAYTzuVH2gcY5nVl6yozU40AdsQPQvKTvFUqRQvRlj7pa3Hji3wU3uHwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859701; c=relaxed/simple;
	bh=FU2BsRVbMrWT6qiM2syqQWN6DWesWvrlwberUpLr0fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLoxYs0lEevDrN3wK+8LLZvqlmSuL+I1yUGvw7TmplEHOW4zfylI0vFMe34wcI/FlJhYy35OLszGJ0wl6yPThHKLG/Yxs4TqJpmUsTtccg6H++jvKxQw362MxfP9eMmPJ1ZlV0qvJfVmH/SCVv8NHS21nZYf1/NvJqXKhqz4EIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+dgDGln; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso36847225e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859698; x=1775464498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=Y+dgDGln1750vZomOqURGjyIKmofKaL0nUFwnb3/XqxNvnnSFDk33oEbNEGE+33d1z
         3nCXkHrGWFRVMKEICzBlKBc6g6PY93L+PEK2G11Sb8qd3AxZ8AG4CgT8GFBG9zRmqonz
         AEoL9UlWowIJvlZUSy3rX3uZULl1RRZuOB0g5M1Ko3zKsr5QtIPUIyJ9vfvIg8Jpel3k
         Kw0EHXffbvepmNdk/Oc0PH2BnnVfNa1LqJbMm78vZ8NHlQbqRMa2AslIRo54gYlcd2ip
         PfHBH7Du3Tsk78SzBx2sBJVuzkdCp7dFFnoj1jhakMo+TC0DV83hGZDES8zfw6FFlbnS
         wT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859698; x=1775464498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=QR4POcDHnZLoraVOe/VoBss39oreLIZ34U4fqq70VCpeimNPxJDSYqhPGOjYGvyeBV
         4db27LN6tZuQU7iymJwpkhmquCUMgBG1AqgiRPfWsLSsbURq9TvAYLElfq/Dlbanxcwe
         E32k5iEC21eI320mBgGW9M+qiAXrjMzehUWJqst0jF1h+5F3n1valH6p84Sam+l3xf6n
         lGNOS3SyNTo+rQZ69Cm98Ylc2bvhYb8Yk1CdOZs8uSB1I/4k9BBTMKSs2HRevSsgam7j
         JbnnbpvEJCdrDJWbcmVx2TUw3XTSNEUT+/x7+oWM5isj91C8YE9k77CnfDxH4SL/aDg1
         4XwA==
X-Forwarded-Encrypted: i=1; AJvYcCVJjm1H8pkIFNAbpYH2Iw+2qY809rbflFwanYPVVTlOcltDFazLRi3S7T2HLpl/HWAG9CclnrdhOqqV@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWhnZivNITX8WDPIl18BczGfazIRigzE8aOo9aNRg0f2QOnJ0
	xxNJ6tF9lGjB6azfekUfb151WegpK7DxWULMSBHO+3XN/sow6vUPNlCi
X-Gm-Gg: ATEYQzzTA5JdWqFE1PEmMMtbn7jhwBaKU5FGgOosqmTVK3a8v4vfsr6OqKCbH4vDsix
	FpK7JrH/1ODeFv/hPvbIPs8N0bO9JRMOfrdEw3CN5CqvAY5O9dwRVCq4dv+/3Fh0AfuHZ2nzqyj
	wG4wZerOTgkmfV37t4r+FGHA5642KjouXFjGzxnkSvI0TsX5bFO2XpxEgrtV+HFH+X0ZOqC4sR9
	YOrrIk+o2p75bZIiXeHWSGN8w29fIViZBdXxguKePUHb2ndETnJtWYxYPZ9FBiX9K7oktjasgLD
	YN0oxtmVImrjYXbAnmxblHfQCotlo9oDqACKZQ8JtEtI02sSJ9nIRCW096tbMHfcMYW39TERcRL
	ZxDf4wWDeGtgIKEntlojp/+HJ3e8gCdJfn0GwCWL2svyR91ywf4rswsBcjVAX366H9ZlY/nApbn
	E8NBmC4gn6Lz5kD9Yg533F0m9BYF62og==
X-Received: by 2002:a05:600c:a30f:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-48727c81e54mr170906055e9.0.1774859697668;
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
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
Subject: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 30 Mar 2026 09:29:35 +0100
Message-ID: <20260330083429.359819-2-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34392-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 198B83573D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC. Remove the
required constraint for the regulators node compatible property to fix a
dtbs_check error.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..bfad018cfbf3 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -99,9 +107,6 @@ properties:
                   - mediatek,mt6366-regulator
               - const: mediatek,mt6358-regulator
 
-    required:
-      - compatible
-
   adc:
     type: object
     $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
-- 
2.43.0


