Return-Path: <linux-gpio+bounces-30823-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMGSJh7Tb2mgMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30823-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:10:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E694A0D6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07A17A681D0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7974611F3;
	Tue, 20 Jan 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOScFv6z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC844E039;
	Tue, 20 Jan 2026 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932981; cv=none; b=cSl+ByYzQ+cPI/FtXzXC5il49L5fXOpEV93Ftpk9iOvlAHDr5XpHW4bhBA7iGhQqERp61gKyqUL01Hh7P1NntykKy4zjupD3JLa1aMkERyR8bz2fmTntcp/TzzYjHZHlRwXcmqlHA8rFUDyXYZqTr63g3CXOlU8zdaLfvXznM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932981; c=relaxed/simple;
	bh=rOKk2X1qHw/UTNmPSVO4s0+3RfiIi4Jxi07TQreLKvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQhrOMR2J0LsN/xLXkgZnQNHFrxZgL4FdGECQz3gkWPRMnuVI7nTStu0j7dNBw3iYrD92M15q5UEvcTNpY2ATcnKy2L5ZDSPeBIQWzxwESCDud+7HhxEPYykNpBzUf0mBVPX1RpY/Typ+m6YpNYYB6bPsv4rIZwwTxq18yajuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOScFv6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3359C19421;
	Tue, 20 Jan 2026 18:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932980;
	bh=rOKk2X1qHw/UTNmPSVO4s0+3RfiIi4Jxi07TQreLKvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OOScFv6zHxzeO2klcIVFFI5p5nn9CPtOE76HfXWpwiOKC87itRbjpoUsBWLzh1zfm
	 XkqFAtPCd6jjE1xIr+lq4Hi1+9KqhccDphcGUPhE9gx0xdlHIImh+oce7V2PJk/P7O
	 1EyeqAoMmcjf5saT1qPkjU3WtG8lyZtiBHzs+ADYwZG/e5DeftrTxsyuhc+/vMrmms
	 QLvklnQcxQSpF02PZskP9wKmO3Q0khnYH13YuzvU7kApwfF9Zk2CdhlO7AiNz2JY5P
	 eOMIOx/ngA36r3IYkKIIfTjM/28BWaM+hhZ1/onbVsHUHpbKJhGag5KYcfe+EVQGJ3
	 NVPeiEA2+irDg==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v4 5/5] MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
Date: Tue, 20 Jan 2026 18:15:43 +0000
Message-ID: <20260120-skilled-shrunk-1f4c8b674e09@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
References: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CgMQItntxM8Yf+X3K2Sq+0/VecyITjE5TqmhE4qUdU8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJn5x7zfJ6RMe+23NUa/nI9Ne9aUk0/eyZ3p0k+zEN/9w f/GdNXujlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEbiIjw8cjVn9Nt25MebLx qHnfpKKi0MpgzynXyh98OnHL6qdWzB9Ghq0HmhOWXtgekayxynVf/d26yxsnX6lvOyDNrprew1n /nwUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-30823-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,microchip.com:email]
X-Rspamd-Queue-Id: 08E694A0D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

Add the new mssio driver and bindings to the existing entry
for Microchip RISC-V devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff6084cb5797..0cb24094aa1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22458,6 +22458,7 @@ F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 F:	Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -22473,6 +22474,7 @@ F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
 F:	drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c
+F:	drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
 F:	drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
-- 
2.51.0


