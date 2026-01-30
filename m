Return-Path: <linux-gpio+bounces-31329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDMbMHeUfGkQNwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 12:22:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E4888BA045
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 12:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DAFC3005323
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 11:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5568335C195;
	Fri, 30 Jan 2026 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TklEvXAE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1222A7080E;
	Fri, 30 Jan 2026 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772144; cv=none; b=OlQLRpMBMmsq3hhg+jrLd+Y2e/Jnd3TojMtuTPEe6FBs5/60sRzCXqRsppYGEbISZoXVXTwIqxiQ/iNPvoQqcTz88WNTNcjdSfbq+ROc1C4DGKkVtu+Dh1Jyqh6zWpWsUQ/qdT3aZMRGcUEqU3Z1N46oV2PPHsRzMFZrIbRz8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772144; c=relaxed/simple;
	bh=wpEge0618iQHhy+AsEBZQJc7isjU9ln4SRE/olHsnfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZCBE6MHzH2M1i8jqaYOhcvih13HIArAqm0BzjzkDsrsK9SR+QmE1oAUL4rjkL5EX6ymuGPbE/pu+er9uqkx3ZlA30ykNVCnew7NRRKvWYeI3QtzNgU6bGTO32LYUqaMHNCHE7xxYBpplwoY8hQ/zKv8LHCMexO/nnF+JuYdSejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TklEvXAE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076A1C4CEF7;
	Fri, 30 Jan 2026 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769772143;
	bh=wpEge0618iQHhy+AsEBZQJc7isjU9ln4SRE/olHsnfE=;
	h=From:Date:Subject:To:Cc:From;
	b=TklEvXAEfFMQq6cMmYsuX4rLzIJJS9uJv8bIIm8jrcnoJVOrPks0CFlSr8B9wU8Rk
	 Ms5FnbGGxRxpb+vUkPBC0nel1quGR9uE2MtkYcv6dhJQvgCv5dUceAxJEFLC3wLgDs
	 8sdeWXWmEngwbOPEWqP56SCcpBKBtUg8JMZ2XSG967uK7C4R5VW1VXRXKkhCnqLwlO
	 PFzeJy2Bre1Aeo78vlR+q3Ti2LCa/SIt1mEX0BWj29WT12gZlduBDBt5MphQFU+30d
	 wMZzsdmaZcuI3hGElDle1y7QQm8Mg72SjlqevRYbylqVli0rRxb2WAYEufnQiG0fA/
	 /Qm80juFDNJ7Q==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 30 Jan 2026 19:22:15 +0800
Subject: [PATCH] dt-bindings: pinctrl: spacemit: fix drive-strength check
 warning
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGaUfGkC/x2MQQqAMAzAviI9W1gnKvgV8aCu06JM6UQE2d8dH
 hNIXoiswhG64gXlW6IcIQOVBczrGBZGcZnBGtsYqgxuFZ4S5kt3lAOd3ujlwXoiamvrRiYPuT2
 Vs/6//ZDSB0hTzLlnAAAA
X-Change-ID: 20260130-k3-pinctrl-io-drv-fix-5b11752dae1f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=dlan@kernel.org;
 h=from:subject:message-id; bh=wpEge0618iQHhy+AsEBZQJc7isjU9ln4SRE/olHsnfE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpfJRpCQzoCAhf/X3zr7VoIHvrUN2LFmTpcI8va
 XADYq1CaEuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXyUaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0XYBAAl1cxD4kiJIq31CCJktQdJ1B8ARNWBGis2Wsm6/G43dIC3H8tTg3DX
 HAuBqrEoEjSBmiRx0AsY4XSEXdGJFaKO+mABkmpGCe9rZ1EMMGjno0ATE/dFyZDlLtspy7wuuZE
 GheKT98KVtFM6F8s5BeLOsbI9UbnE/Dg9OvFTMvWK+2yl93vW10outSA7a9lSlkf4aIwHBhmXu1
 YK3PSjbiUmgDHSiZXAFVQ0eARrdGBnsrjHxXzI3h76lHW5/2JGe3N14agv9Lzg+E2CyTPHqAI2f
 F2O68tcBk+hFu52+AXgZTaU33aTSqmBx/4zfeMDx8JxywLWr2MZ0EI22cJRLN0MRfakQgCBt63+
 wM5UMEkGpVWMKan9jGizmNbwzFepAijJobAWOFi8wfsuGGjXpd/BV7zv2kWNu6G5td2m30ob75q
 jyqTawiQB0paFUfPXq52WoddElBnoawhfGa2k2Buj3OF4ljQ+//KczybyyK84OJ56vCsAeDqkXc
 X2RHPa2j+mCvDpfjd9GYFF3xDBU+fBFcOPbwI/9bmPbhk0Xqe9XkpO+gI4YkzySOswMgkaW4jqj
 GYiOPyBNf8I3UO6B05Zbq0SsEPphh7m21QSdmdosKKPx6H2Ztpupfa8z3Cr6eboSNArXhap84kj
 l+x09h3RZ6tR54m1kcLqbBIuktJaLc=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31329-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[d401e000:email]
X-Rspamd-Queue-Id: E4888BA045
X-Rspamd-Action: no action

The problem is that one value from drive-strength may match to more than
two different enum groups which lead to DT complaint, switch to use 'anyOf'
to fix this kind warning.

Fixes: c3efac0592f8 ("dt-bindings: pinctrl: spacemit: convert drive strength to schema format")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Doing DT check with command: make dtbs_check W=1, will get this kind
of warning message:

arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): gmac0-cfg:gmac0-pins:drive-strength: 21 is valid under each of {'enum': [2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33]}, {'enum': [11, 21, 32, 42]}

Instead of using more complicated minimum and maximum value of property
with constrains of compatibles, we decide to use 'anyOf' to fix this
warning.
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index f009fed87e6b..5194fa92fe93 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -76,7 +76,7 @@ patternProperties:
           drive-strength:
             description:
               typical current (in mA) when the output at high level.
-            oneOf:
+            anyOf:
               - enum: [ 11, 21, 32, 42 ]
                 description: For K1 SoC, 1.8V voltage output
 

---
base-commit: 3fcdb264b61a5bb0eb3fb7272717468aa376a74c
change-id: 20260130-k3-pinctrl-io-drv-fix-5b11752dae1f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


