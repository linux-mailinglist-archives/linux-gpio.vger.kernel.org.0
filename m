Return-Path: <linux-gpio+bounces-36879-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEigCHd0BmrpjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36879-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:18:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4A548508
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F953305B00B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 01:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667E536CDFD;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uvz6LxSB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0F23385BE;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807893; cv=none; b=bvyM8Q/6W1JnpJ3KrdMFUN5/72r+RGVga7tJVlkmr0MjSRweNvPucg5rtmjr0buuzMuXhdk6Of6quFwsrL6qSbY92CF3dkciVGclWi31iFsNNyi+sIeiKUCGOUnUZJmMEgP9GI2GUIstshkg+i1tlmO+6qfyUewbArbpxYka5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807893; c=relaxed/simple;
	bh=wWzUQXRnbB0RB/9TAJFVHDrh9+wM/VoEhvOqImuQdSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbnFCy2qmRuhCb3wIwEbS3IlGKyL3DQy/R8za7PauutZpWnNgoiSUC9CTwx+tGuqtZu0e6WLmk1ebFcf2B9HHNHVmauNDLCmAf+/ir1lYaFRQb8gy/d/768G3ax/VmDQxHWQgZwalgv7CtnuicsXZyCKCRWcNfXT6jN4slG4jrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uvz6LxSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFD4FC2BCC9;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807892;
	bh=wWzUQXRnbB0RB/9TAJFVHDrh9+wM/VoEhvOqImuQdSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uvz6LxSBRs0Xft2rXVCD6uVrvfCNLCzx5vIeGQuNrciFk0Ge87j/7ZpjBSFA71Ux8
	 4nF/VQMkD/nGrYNRm/WwoziPMN1eHQsSe1wZDiVeFopY42FssdPZfZIhD1wf+ohpXZ
	 UPYiTZbUeIUS11wI6qbnKD3wOgdjL8J7GABEDU8eLYVdyizCi42CWBTfw7aq53c1Zc
	 cgf3p/6CCnJyVZ+r/LC4Ewwo2tQ5TfJmCXGkL3Zbog2ewuFp9hJ9W9LvsM5+IKB/Lf
	 lsLt1fK/i0nEAJBdVAgRu3hYcHUyxe59KF9E0cbLtJc/qGQTjv/J2TCZdEnol/X1lM
	 hOrjWx4rsxQxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3811CD4F25;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:17:58 +0800
Subject: [PATCH 2/9] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-ultrarisc-pinctrl-v1-2-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=757;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=XZFNeOKWu/CkLjPDC+5weDpv+XeEMBj7yaDkjZ2TskU=;
 b=f4NijLLDER036QaslKhiTpq3CTiQi8EvmPdcda9IBEWa7XodQ/34i0jF6cN01hhGnaYRoq914
 jbulhmTlriFA0pZS9SDJ/22YUVe9cGvjG5hLQ97ZKrIjM98NQ/Nyhdf
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Queue-Id: 7DA4A548508
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36879-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:email,ultrarisc.com:mid,ultrarisc.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Jia Wang <wangjia@ultrarisc.com>

Update Documentation for supporting UltraRISC CP100 based CPU.

CP100 is used in UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..9f5226717701 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - ultrarisc,cp100
           - const: riscv
       - items:
           - enum:

-- 
2.34.1



