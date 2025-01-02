Return-Path: <linux-gpio+bounces-14435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 632499FFE61
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC241883606
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042FF1B87C1;
	Thu,  2 Jan 2025 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ueHE2x0P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0C1B85CA;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842743; cv=none; b=Fn0NQuWRvmGiBrS/FbZ7ilvMLMFTC+2Q2SlZpAjzI56DF5IMjtX2lfxZyL3dOR5iX0EEis8NotkvT90siZxaTfC28qf3IvX26ooWUYEBTt/y9VRGoTR2tTIDOhHLyGwurL9OwitrThBh8REUHjC6/aobszM+9boG1dSWWvrFCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842743; c=relaxed/simple;
	bh=/r7+wKhmpuwizXZEWKLGTtNGPZdCjwDwKJndEwbewKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGGCZWGW1Ye1lH7djrlWqih399yGVoX8MOnkMlcABFwAfKV2Km3wn3fJZbIJJFnWxD+MuHjsXZu2oj1/4YIyNZNfyhGE3gtnJ4VM+z5DXG4Q/Ue3nGhDAf3AjhIqZKF/xrPnCdCicmlFcW2x9vA6GMsUEYdPx93Smt8ilLXOdHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ueHE2x0P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D39DAC4CEE2;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=/r7+wKhmpuwizXZEWKLGTtNGPZdCjwDwKJndEwbewKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ueHE2x0PBfzsWJl7NXiYBXU4wLdFdwtHAxEoLfIC+HkW8HhYTRKfCzDs6IdqsnlLX
	 HsQ0ivUBPy5TQQU4vWGpfXQ2UNbw0Yig3CxtlRqRCVo5dxQfeo0ZbtGXc+SLv0g5ID
	 zSpTsTSB7FChrsq+4ffLy7stZ93YydKe5JUq8WT+z2HM0E+pnDoGOK6eGWX779H+ix
	 3M1BW7VXBxTmheYOWfg0oKwlhSoxBZdMkTxub/ci+rm21zfCn5ZYZrAVfa9sqx0rMt
	 7woYoN/nVxwN07omW5Sl8esphIfCPBRgZwa7ssM6tkTRIS0sx9G+cTdmQtZz1p+Tcz
	 qYAdN0uAU7+Lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97DBE77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:32:00 +0100
Subject: [PATCH 19/19] MAINTAINERS: Add entry for LANCOM board support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-19-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=747;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=dAH39hTNAFd2Gn5pb9BXoNF53Untzct7/Ny6B9T7rmc=;
 b=JbUR+WMaOFgpoRGjfGRqrBOPDgnsyxY7Nup2gMAnp2r3UNMzcEwns5pKruLl7F84UyqvM5QId
 sJbADWCBw83DtJgSJAT7pJj+IAa5Cq7WldU6YJFkVO7S4qLA7JrKVnw
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Provide a contact for NWAPP2 and other boards.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a882da5b49ce5bd55011b93f28c32..6d4717cf7c19c25aa50c5cf1a7956797225a1d21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12951,6 +12951,14 @@ S:	Maintained
 F:	include/net/l3mdev.h
 F:	net/l3mdev
 
+LANCOM BOARD SUPPORT
+M:	J. Neuschäfer <j.ne@posteo.net>
+L:	linuxppc-dev@lists.ozlabs.org
+F:	arch/powerpc/boot/dts/lancom-*.dts
+F:	arch/powerpc/boot/dts/mpc831*
+K:	lancom
+K:	LANCOM
+
 LANDLOCK SECURITY MODULE
 M:	Mickaël Salaün <mic@digikod.net>
 R:	Günther Noack <gnoack@google.com>

-- 
2.45.2



