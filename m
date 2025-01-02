Return-Path: <linux-gpio+bounces-14429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CFF9FFE53
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42A2B7A04A8
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111FD1B6CEF;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELWALujH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E3C1B4241;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=ZbO7RoxlTmhCOEM38W93mPwKfL8yk1D/OkfleXlVvtW36/ZZiNDGhxu/wcLkF1CySKIQz/uKx7Q090F1KszJqhyCVUueJ/nq/ev4GwCI2IaVUfx/isALlkoLjpOb/uabyKz21cIOzRjQqKSlWZjMX68ru2qDXfivcahpEBxbQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=1Wx3N1Rj294zXt2qu+m1lv0sm+YnNLnpQlLBVACfYCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRpD8sQyTwTcxMfT5T1otNRYhZVsA9ofToFU6ZoJpDa6DB/F9FTSieaeNxhd2xxLy5YevYTSZQKg86YI58GMTH3g6V8/OdeRKNo2Ul1RJPPymTF1K7lNI3DlTDqTdJFVsHHkIxvtZcEVCwM9UmpsIu59P5Vib2BqfHIz388up1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELWALujH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71A21C4CEE1;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=1Wx3N1Rj294zXt2qu+m1lv0sm+YnNLnpQlLBVACfYCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ELWALujH8LgLxmg4iYqiMaRA5sCuqBlh7J4ZRAEQ+4H7QZ7xUvjbbUQqXz4NC0Fe+
	 +K38z2zfltFuZXL46+38751hE/DPVPBeNsbO92sZDyMdQ5+IxhlA1XFt7jH5fp0KQg
	 TfRxIHZaFC38RiNC8++m2GawccjD+K2x3s4B5y+FTiq6qBS29kMy2tcAnHkZTYtflS
	 64PE5uhrq3fcih0s5zlqT7/40xMlA07T9PQSIhZKqv4bqkuC0Ma7O20m6k3A3/jIqG
	 udJI43dqZiiNEpeGUWG8ucVkbnU3+VMm4PGfveWPXJk2ST8rRPPllj96hPrV90V6HW
	 kzVph8Zz1zFuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C03E77188;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:54 +0100
Subject: [PATCH 13/19] gpio: mpc8xxx: Add MPC8314 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=815;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=IzujOZGh0Kdf7MR+FJDNa5Xge4jQ4IpjSUXuri6ZMCE=;
 b=Bg2Rwn5IPjZBCymZj2nPxRzynUvjtK0um3nebcnWTTRob7hfmVj+4hlVA6truDJxyBTZK1mYV
 E2XU37nLAAqCiLpCLQ1oQAs3PvepM7Q7YTnN9sKE6no/AuaZzWCsdZ7
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

GPIO input, output, and interrupts have been tested on a MPC8314E board.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 drivers/gpio/gpio-mpc8xxx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 24417c3247b0a832ad15fe93e9ba0339eac3b883..0cd4c36ae8aaf075a54795810d5eea755325d771 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -285,6 +285,7 @@ static const struct mpc8xxx_gpio_devtype mpc8xxx_gpio_devtype_default = {
 };
 
 static const struct of_device_id mpc8xxx_gpio_ids[] = {
+	{ .compatible = "fsl,mpc8314-gpio", },
 	{ .compatible = "fsl,mpc8349-gpio", },
 	{ .compatible = "fsl,mpc8572-gpio", .data = &mpc8572_gpio_devtype, },
 	{ .compatible = "fsl,mpc8610-gpio", },

-- 
2.45.2



