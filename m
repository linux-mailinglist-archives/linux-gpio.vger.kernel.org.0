Return-Path: <linux-gpio+bounces-36192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMZSOYPi+WmlEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:28:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC74CD778
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50061309DFC7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156C8266B46;
	Tue,  5 May 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJ6qD++F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86B239BFE9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983878; cv=none; b=oiOERJru1LjLe3mYKbCsntATx41S8klL2Zttt/uh5kxM/o8AATyzvWiETRPQwxRtp+WIEmNpdsxGbp7syLwYN3i19K65lzc7eb8YFSpfO4egZLN2AbmCiCFA8hGxWfyHLMIYLZy/nkn/73KvMsiZ8VRw44qtkgybo/ayeZhXeAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983878; c=relaxed/simple;
	bh=i1kssGfsicVO+V5cxMmxYFEJK1oavAb9X1IMdhH//SI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qd73JuljIEpuQHOxu3XdfNS9mlN2OTyj3FusSCBabCGQXxR+I80tSW+4FxFaQuELLUEDZnoFf+UTsSzpXxRAouEUfx5S8SvN5Ga5RDgfhFv1l4bSKxnQCHggWsndshu49g2veztYxYW2U+5tQcBA25g629FBiIIwUAZ68CFo3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJ6qD++F; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso55262245e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983875; x=1778588675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxt4Q3NlWlMsBTIDeDlqdwNUpTcHIs+0vDO1ot5rOvM=;
        b=JJ6qD++FXhOjcCKi4HtqzYAQePzuCuym9AfXO5cpdcqfdnmPasqaKbnDZyujhqU3am
         3EzFjk87en1K8L3PrmMilMhKs9kx4cNGDZLpps/YxmqEoJZTRyDcnUu/eRlBsxASIo57
         elXAoUESyLy05z1p/9PSheBiIzm2oOq5GYFoU7FB4GauE/qtly8NAI5FhfXmiO2KfGJa
         K4oqhEm3U0vIdnvoIhFaKMRjk4Yl/detD6z9xz/RQZw+uxS3TrnevdUipWQ2IY73PZDd
         Dx7yOlflvrK1m0owVTwgm7UPlGmAbwHYZ2Q3Sk8k+pBJ1M96nqUooAfM2wFainD+7Krb
         rdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983875; x=1778588675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yxt4Q3NlWlMsBTIDeDlqdwNUpTcHIs+0vDO1ot5rOvM=;
        b=FgIW1WNUk1c4FjhEpOAMLrJ4HoAy9ji5+zUGNZbp3hl0Ehm4QNAOOh5Zf18AWOk2Ot
         B/hZmt6tWc8LhFeuuWz2jUgsYaB7IcCdOQG6aJxeWSgj3mTZVXD2o2f3C8cj50yjtzl7
         XayCgdDp8CrnENoGl4TQVN9ZrK5eiexz/x6eTvIBUcRFutMR/KOhWpXij+tZkVz1wd59
         9gXrkzFFq3z1SnMzJrW9ypmLy8z5d54rDRqGjSiRvPT3EDaa6IZrCWwWz+jSSvuIQ8C9
         c+PNWieskd4pFuIMnpTkBOjsEsPpjz3tFyoZeUts6kEJXwHowLGTNm5ljAVJFuwBcdVE
         SPdA==
X-Forwarded-Encrypted: i=1; AFNElJ9RkeNnzq7eVvOKtudcUYUkuqUl7yph7aw2huQruZz/y9lOOQqHsGTgekuadsac0Hc5xur743rBYRN6@vger.kernel.org
X-Gm-Message-State: AOJu0YxLeIY5nXOrSbTym8k3zNYuuIY9VsrbGW9BnLbwQOwJXqpFmfMb
	lvpZVoIf0FU1+EEplWXa3nOUcR5FPOEbZj7u1FxqH5VMyBU7ZGMbZGw4
X-Gm-Gg: AeBDiesoFAz1AD4wFCXCy1tVpEi9ClHPhkr+dRtsvf2wGXmSFvOOUVr4MBTeeMiiKTq
	YZzFSzNTXIQkUwHFGZjJi8pxIwhVncQTPdcH4obp3D/0jXli42VACQ3p0oGwl309D/d8OgOkxED
	2slWMEJMGvwda13rwrIvtlOvu9hm4Q1D7fCmCh8Mm1Z00fhIJtbobLFq4dYdK3DBpQKi02JnEIw
	YEhhtWulSljs9u3nzytjQfQ0meiKB9db024FbLMuibivkJqo+njE4eEDc8AeUMxr8MWCW3H0HFD
	Sdm6sIQuRKDXTQN25ied652Re5yxcbCBiS3tl0Xhs16Pke6zg3lPVaGQANSG5Q1yqQFyL3fDVRK
	V4Xr1ssapb3QVipV4T2b0CNgkJTX1hNXhID1eYBbJ5bwHJxTKjxraHYF/ZxEFNsUr4erMBQZhoS
	gbwD6nv0EXb3VMSNx/Bk0s4/sAVYmT7/N4mr+C74VdlXAC1qNt2ORnx9N6H1PKceIINFF5gw4pG
	jqLodCxSXYvX5eHWBhTqjXlBw==
X-Received: by 2002:a05:600c:4f8a:b0:48d:46a:6e43 with SMTP id 5b1f17b1804b1-48d046a7074mr176104225e9.5.1777983874666;
        Tue, 05 May 2026 05:24:34 -0700 (PDT)
Received: from LA-DE-0220.emt.local (aftr-185-17-204-8.dynamic.mnet-online.de. [185.17.204.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149e35a9sm24092435e9.1.2026.05.05.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:34 -0700 (PDT)
From: Thomas Weber <thomas.x.weber@gmail.com>
X-Google-Original-From: Thomas Weber <thomas.weber@corscience.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Thomas Weber <thomas.weber@corscience.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: qcom: Fix typo
Date: Tue,  5 May 2026 14:24:12 +0200
Message-Id: <20260505122412.59208-1-thomas.weber@corscience.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4DEC74CD778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36192-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomasxweber@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,corscience.com:mid,corscience.com:email]

STRENGH -> STRENGTH

Signed-off-by: Thomas Weber <thomas.weber@corscience.com>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 5c966d51eda7..c42dd7c736fe 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -53,7 +53,7 @@
 #define PM8XXX_GPIO_PHYSICAL_OFFSET	1
 
 /* custom pinconf parameters */
-#define PM8XXX_QCOM_DRIVE_STRENGH      (PIN_CONFIG_END + 1)
+#define PM8XXX_QCOM_DRIVE_STRENGTH     (PIN_CONFIG_END + 1)
 #define PM8XXX_QCOM_PULL_UP_STRENGTH   (PIN_CONFIG_END + 2)
 
 /**
@@ -97,13 +97,13 @@ struct pm8xxx_gpio {
 };
 
 static const struct pinconf_generic_params pm8xxx_gpio_bindings[] = {
-	{"qcom,drive-strength",		PM8XXX_QCOM_DRIVE_STRENGH,	0},
+	{"qcom,drive-strength",		PM8XXX_QCOM_DRIVE_STRENGTH,	0},
 	{"qcom,pull-up-strength",	PM8XXX_QCOM_PULL_UP_STRENGTH,	0},
 };
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item pm8xxx_conf_items[ARRAY_SIZE(pm8xxx_gpio_bindings)] = {
-	PCONFDUMP(PM8XXX_QCOM_DRIVE_STRENGH, "drive-strength", NULL, true),
+	PCONFDUMP(PM8XXX_QCOM_DRIVE_STRENGTH, "drive-strength", NULL, true),
 	PCONFDUMP(PM8XXX_QCOM_PULL_UP_STRENGTH,  "pull up strength", NULL, true),
 };
 #endif
@@ -291,7 +291,7 @@ static int pm8xxx_pin_config_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_POWER_SOURCE:
 		arg = pin->power_source;
 		break;
-	case PM8XXX_QCOM_DRIVE_STRENGH:
+	case PM8XXX_QCOM_DRIVE_STRENGTH:
 		arg = pin->output_strength;
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
@@ -373,7 +373,7 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
 			pin->power_source = arg;
 			banks |= BIT(0);
 			break;
-		case PM8XXX_QCOM_DRIVE_STRENGH:
+		case PM8XXX_QCOM_DRIVE_STRENGTH:
 			if (arg > PMIC_GPIO_STRENGTH_LOW) {
 				dev_err(pctrl->dev, "invalid drive strength\n");
 				return -EINVAL;
-- 
2.34.1


